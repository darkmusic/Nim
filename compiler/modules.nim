#
#
#           The Nim Compiler
#        (c) Copyright 2015 Andreas Rumpf
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#

## Implements the module handling, including the caching of modules.

import
  ast, astalgo, magicsys, std / sha1, rodread, msgs, cgendata, sigmatch, options,
  idents, os, lexer, idgen, passes, syntaxes, llstream, modulegraphs, rod,
  configuration

proc resetSystemArtifacts*(g: ModuleGraph) =
  magicsys.resetSysTypes(g)

proc newModule(graph: ModuleGraph; fileIdx: FileIndex): PSym =
  # We cannot call ``newSym`` here, because we have to circumvent the ID
  # mechanism, which we do in order to assign each module a persistent ID.
  new(result)
  result.id = -1             # for better error checking
  result.kind = skModule
  let filename = fileIdx.toFullPath
  result.name = getIdent(splitFile(filename).name)
  if not isNimIdentifier(result.name.s):
    rawMessage(graph.config, errGenerated, "invalid module name: " & result.name.s)

  result.info = newLineInfo(fileIdx, 1, 1)
  let
    pck = getPackageName(graph.config, filename)
    pck2 = if pck.len > 0: pck else: "unknown"
    pack = getIdent(pck2)
  var packSym = graph.packageSyms.strTableGet(pack)
  if packSym == nil:
    packSym = newSym(skPackage, getIdent(pck2), nil, result.info)
    initStrTable(packSym.tab)
    graph.packageSyms.strTableAdd(packSym)

  result.owner = packSym
  result.position = int fileIdx

  growCache graph.modules, int fileIdx
  graph.modules[result.position] = result

  incl(result.flags, sfUsed)
  initStrTable(result.tab)
  strTableAdd(result.tab, result) # a module knows itself
  let existing = strTableGet(packSym.tab, result.name)
  if existing != nil and existing.info.fileIndex != result.info.fileIndex:
    localError(graph.config, result.info, "module names need to be unique per Nimble package; module clashes with " & existing.info.fileIndex.toFullPath)
  # strTableIncl() for error corrections:
  discard strTableIncl(packSym.tab, result)

proc compileModule*(graph: ModuleGraph; fileIdx: FileIndex; cache: IdentCache, flags: TSymFlags): PSym =
  result = graph.getModule(fileIdx)
  if result == nil:
    #growCache gMemCacheData, fileIdx
    #gMemCacheData[fileIdx].needsRecompile = Probing
    result = newModule(graph, fileIdx)
    var rd: PRodReader
    result.flags = result.flags + flags
    if sfMainModule in result.flags:
      gMainPackageId = result.owner.id

    when false:
      if conf.cmd in {cmdCompileToC, cmdCompileToCpp, cmdCheck, cmdIdeTools}:
        rd = handleSymbolFile(result, cache)
        if result.id < 0:
          internalError("handleSymbolFile should have set the module's ID")
          return
      else:
        discard
    result.id = getModuleId(fileIdx, toFullPath(fileIdx))
    discard processModule(graph, result,
      if sfMainModule in flags and graph.config.projectIsStdin: stdin.llStreamOpen else: nil,
      rd, cache)
    #if optCaasEnabled in gGlobalOptions:
    #  gMemCacheData[fileIdx].needsRecompile = Recompiled
    #  if validFile: doHash fileIdx
  elif graph.isDirty(result):
    result.flags.excl sfDirty
    # reset module fields:
    initStrTable(result.tab)
    result.ast = nil
    discard processModule(graph, result,
      if sfMainModule in flags and graph.config.projectIsStdin: stdin.llStreamOpen else: nil,
      nil, cache)
    graph.markClientsDirty(fileIdx)
    when false:
      if checkDepMem(fileIdx) == Yes:
        result = compileModule(fileIdx, cache, flags)
      else:
        result = gCompiledModules[fileIdx]

proc importModule*(graph: ModuleGraph; s: PSym, fileIdx: FileIndex;
                   cache: IdentCache): PSym {.procvar.} =
  # this is called by the semantic checking phase
  assert graph.config != nil
  result = compileModule(graph, fileIdx, cache, {})
  graph.addDep(s, fileIdx)
  #if sfSystemModule in result.flags:
  #  localError(result.info, errAttemptToRedefine, result.name.s)
  # restore the notes for outer module:
  graph.config.notes =
      if s.owner.id == gMainPackageId: graph.config.mainPackageNotes
      else: graph.config.foreignPackageNotes

proc includeModule*(graph: ModuleGraph; s: PSym, fileIdx: FileIndex;
                    cache: IdentCache): PNode {.procvar.} =
  result = syntaxes.parseFile(fileIdx, cache, graph.config)
  graph.addDep(s, fileIdx)
  graph.addIncludeDep(s.position.FileIndex, fileIdx)

proc compileSystemModule*(graph: ModuleGraph; cache: IdentCache) =
  if graph.systemModule == nil:
    systemFileIdx = fileInfoIdx(graph.config, graph.config.libpath / "system.nim")
    discard graph.compileModule(systemFileIdx, cache, {sfSystemModule})

proc wantMainModule*(conf: ConfigRef) =
  if conf.projectFull.len == 0:
    fatal(conf, newLineInfo(conf, "command line", 1, 1), errGenerated, "command expects a filename")
  conf.projectMainIdx = int32 fileInfoIdx(conf, addFileExt(conf.projectFull, NimExt))

passes.gIncludeFile = includeModule
passes.gImportModule = importModule

proc compileProject*(graph: ModuleGraph; cache: IdentCache;
                     projectFileIdx = InvalidFileIDX) =
  let conf = graph.config
  wantMainModule(conf)
  let systemFileIdx = fileInfoIdx(conf, conf.libpath / "system.nim")
  let projectFile = if projectFileIdx == InvalidFileIDX: FileIndex(conf.projectMainIdx) else: projectFileIdx
  graph.importStack.add projectFile
  if projectFile == systemFileIdx:
    discard graph.compileModule(projectFile, cache, {sfMainModule, sfSystemModule})
  else:
    graph.compileSystemModule(cache)
    discard graph.compileModule(projectFile, cache, {sfMainModule})

proc makeModule*(graph: ModuleGraph; filename: string): PSym =
  result = graph.newModule(fileInfoIdx(graph.config, filename))
  result.id = getID()

proc makeStdinModule*(graph: ModuleGraph): PSym = graph.makeModule"stdin"
