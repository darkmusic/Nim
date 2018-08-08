import macros
macro case_token(n: varargs[untyped]): untyped =
  # creates a lexical analyzer from regular expressions
  # ... (implementation is an exercise for the reader :-)
  nil

case_token: # this colon tells the parser it is a macro statement
of r"[A-Za-z_]+[A-Za-z_0-9]*":
  return tkIdentifier
of r"0-9+":
  return tkInteger
of r"[\+\-\*\?]+":
  return tkOperator
else:
  return tkUnknown

case_token: inc i

#bug #488

macro foo: typed =
  var exp = newCall("whatwhat", newIntLitNode(1))
  if compiles(getAst(exp)): return exp
  else: echo "Does not compute! (test OK)"

foo()

#------------------------------------
# bug #8287 
type MyString = distinct string

proc `$` (c: MyString): string {.borrow.}

proc `!!` (c: cstring): int =
  c.len

proc f(name: MyString): int =
  !! $ name

macro repr_and_parse(fn: typed): typed =
  let fn_impl = fn.getImpl
  fn_impl.name = genSym(nskProc, $fn_impl.name)
  echo fn_impl.repr
  result = parseStmt(fn_impl.repr)

repr_and_parse(f)


#------------------------------------
# bugs #8343 and #8344 
proc one_if_proc(x, y : int): int =
  if x < y: result = x
  else: result = y

proc test_block(x, y : int): int =
  block label:
    result = x
    result = y

#------------------------------------
# bugs #8348

template `>`(x, y: untyped): untyped =
  ## "is greater" operator. This is the same as ``y < x``.
  y < x

proc test_cond_stmtlist(x, y: int): int =
  result = x
  if x > y:
    result = x


repr_and_parse(one_if_proc)
repr_and_parse(test_block)
repr_and_parse(test_cond_stmtlist)


