#
#
#           The Nim Compiler
#        (c) Copyright 2015 Andreas Rumpf
#
#    See the file "copying.txt", included in this
#    distribution, for details about the copyright.
#

## Implements the "compiler as a service" feature.

import
  times, commands, options, msgs, nimconf,
  extccomp, strutils, os, platform, parseopt, idents, configuration

when useCaas:
  import net

# We cache modules and the dependency graph. However, we don't check for
# file changes but expect the client to tell us about them, otherwise the
# repeated hash calculations may turn out to be too slow.

var
  curCaasCmd* = ""
  lastCaasCmd* = ""
    # in caas mode, the list of defines and options will be given at start-up?
    # it's enough to check that the previous compilation command is the same?

proc processCmdLine*(pass: TCmdLinePass, cmd: string; config: ConfigRef) =
  var p = parseopt.initOptParser(cmd)
  var argsCount = 0
  while true:
    parseopt.next(p)
    case p.kind
    of cmdEnd: break
    of cmdLongoption, cmdShortOption:
      if p.key == " ":
        p.key = "-"
        if processArgument(pass, p, argsCount, config): break
      else:
        processSwitch(pass, p, config)
    of cmdArgument:
      if processArgument(pass, p, argsCount, config): break
  if pass == passCmd2:
    if optRun notin config.globalOptions and config.arguments.len > 0 and config.command.normalize != "run":
      rawMessage(config, errGenerated, errArgsNeedRunOption)

proc serve*(cache: IdentCache; action: proc (cache: IdentCache){.nimcall.}; config: ConfigRef) =
  template execute(cmd) =
    curCaasCmd = cmd
    processCmdLine(passCmd2, cmd, config)
    action(cache)
    config.errorCounter = 0

  let typ = getConfigVar(config, "server.type")
  case typ
  of "stdin":
    while true:
      var line = stdin.readLine.string
      if line == "quit": quit()
      execute line
      echo ""
      flushFile(stdout)

  of "tcp", "":
    when useCaas:
      var server = newSocket()
      let p = getConfigVar(config, "server.port")
      let port = if p.len > 0: parseInt(p).Port else: 6000.Port
      server.bindAddr(port, getConfigVar(config, "server.address"))
      var inp = "".TaintedString
      server.listen()
      var stdoutSocket = newSocket()
      msgs.writelnHook = proc (line: string) =
        stdoutSocket.send(line & "\c\L")

      while true:
        accept(server, stdoutSocket)
        stdoutSocket.readLine(inp)
        execute inp.string
        stdoutSocket.send("\c\L")
        stdoutSocket.close()
    else:
      msgQuit "server.type not supported; compiler built without caas support"
  else:
    echo "Invalid server.type:", typ
    msgQuit 1
