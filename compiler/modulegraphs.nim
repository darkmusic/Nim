#
#
#           The Nim Compiler
#        (c) Copyright 2017 Andreas Rumpf
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#

## This module implements the module graph data structure. The module graph
## represents a complete Nim project. Single modules can either be kept in RAM
## or stored in a ROD file. The ROD file mechanism is not yet integrated here.
##
## The caching of modules is critical for 'nimsuggest' and is tricky to get
## right. If module E is being edited, we need autocompletion (and type
## checking) for E but we don't want to recompile depending
## modules right away for faster turnaround times. Instead we mark the module's
## dependencies as 'dirty'. Let D be a dependency of E. If D is dirty, we
## need to recompile it and all of its dependencies that are marked as 'dirty'.
## 'nimsuggest sug' actually is invoked for the file being edited so we know
## its content changed and there is no need to compute any checksums.
## Instead of a recursive algorithm, we use an iterative algorithm:
##
## - If a module gets recompiled, its dependencies need to be updated.
## - Its dependent module stays the same.
##

import ast, intsets, tables, options, rod, msgs, hashes, idents

type
  ModuleGraph* = ref object
    modules*: seq[PSym]  ## indexed by int32 fileIdx
    packageSyms*: TStrTable
    deps*: IntSet # the dependency graph or potentially its transitive closure.
    suggestMode*: bool # whether we are in nimsuggest mode or not.
    invalidTransitiveClosure: bool
    inclToMod*: Table[FileIndex, FileIndex] # mapping of include file to the
                                            # first module that included it
    importStack*: seq[FileIndex]  # The current import stack. Used for detecting recursive
                                  # module dependencies.
    backend*: RootRef # minor hack so that a backend can extend this easily
    config*: ConfigRef
    doStopCompile*: proc(): bool {.closure.}
    usageSym*: PSym # for nimsuggest
    owners*: seq[PSym]
    methods*: seq[tuple[methods: TSymSeq, dispatcher: PSym]]
    systemModule*: PSym
    sysTypes*: array[TTypeKind, PType]
    compilerprocs*: TStrTable
    exposed*: TStrTable
    intTypeCache*: array[-5..64, PType]
    opContains*, opNot*: PSym

proc hash*(x: FileIndex): Hash {.borrow.}

{.this: g.}

proc stopCompile*(g: ModuleGraph): bool {.inline.} =
  result = doStopCompile != nil and doStopCompile()

proc createMagic*(g: ModuleGraph; name: string, m: TMagic): PSym =
  result = newSym(skProc, getIdent(name), nil, unknownLineInfo(), {})
  result.magic = m

proc newModuleGraph*(config: ConfigRef = nil): ModuleGraph =
  result = ModuleGraph()
  initStrTable(result.packageSyms)
  result.deps = initIntSet()
  result.modules = @[]
  result.importStack = @[]
  result.inclToMod = initTable[FileIndex, FileIndex]()
  if config.isNil:
    result.config = newConfigRef()
  else:
    result.config = config
  result.owners = @[]
  result.methods = @[]
  initStrTable(result.compilerprocs)
  initStrTable(result.exposed)
  result.opNot = createMagic(result, "not", mNot)
  result.opContains = createMagic(result, "contains", mInSet)

proc resetAllModules*(g: ModuleGraph) =
  initStrTable(packageSyms)
  deps = initIntSet()
  modules = @[]
  importStack = @[]
  inclToMod = initTable[FileIndex, FileIndex]()
  usageSym = nil
  owners = @[]
  methods = @[]
  initStrTable(compilerprocs)
  initStrTable(exposed)

proc getModule*(g: ModuleGraph; fileIdx: FileIndex): PSym =
  if fileIdx.int32 >= 0 and fileIdx.int32 < modules.len:
    result = modules[fileIdx.int32]

proc dependsOn(a, b: int): int {.inline.} = (a shl 15) + b

proc addDep*(g: ModuleGraph; m: PSym, dep: FileIndex) =
  assert m.position == m.info.fileIndex.int32
  addModuleDep(m.info.fileIndex, dep, isIncludeFile = false)
  if suggestMode:
    deps.incl m.position.dependsOn(dep.int)
    # we compute the transitive closure later when quering the graph lazily.
    # this improve efficiency quite a lot:
    #invalidTransitiveClosure = true

proc addIncludeDep*(g: ModuleGraph; module, includeFile: FileIndex) =
  addModuleDep(module, includeFile, isIncludeFile = true)
  discard hasKeyOrPut(inclToMod, includeFile, module)

proc parentModule*(g: ModuleGraph; fileIdx: FileIndex): FileIndex =
  ## returns 'fileIdx' if the file belonging to this index is
  ## directly used as a module or else the module that first
  ## references this include file.
  if fileIdx.int32 >= 0 and fileIdx.int32 < modules.len and modules[fileIdx.int32] != nil:
    result = fileIdx
  else:
    result = inclToMod.getOrDefault(fileIdx)

proc transitiveClosure(g: var IntSet; n: int) =
  # warshall's algorithm
  for k in 0..<n:
    for i in 0..<n:
      for j in 0..<n:
        if i != j and not g.contains(i.dependsOn(j)):
          if g.contains(i.dependsOn(k)) and g.contains(k.dependsOn(j)):
            g.incl i.dependsOn(j)

proc markDirty*(g: ModuleGraph; fileIdx: FileIndex) =
  let m = getModule fileIdx
  if m != nil: incl m.flags, sfDirty

proc markClientsDirty*(g: ModuleGraph; fileIdx: FileIndex) =
  # we need to mark its dependent modules D as dirty right away because after
  # nimsuggest is done with this module, the module's dirty flag will be
  # cleared but D still needs to be remembered as 'dirty'.
  if invalidTransitiveClosure:
    invalidTransitiveClosure = false
    transitiveClosure(deps, modules.len)

  # every module that *depends* on this file is also dirty:
  for i in 0i32..<modules.len.int32:
    let m = modules[i]
    if m != nil and deps.contains(i.dependsOn(fileIdx.int)):
      incl m.flags, sfDirty

proc isDirty*(g: ModuleGraph; m: PSym): bool =
  result = suggestMode and sfDirty in m.flags
