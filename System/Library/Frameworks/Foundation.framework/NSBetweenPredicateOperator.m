@interface NSBetweenPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)operatorType;
@end

@implementation NSBetweenPredicateOperator

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_opt_class(),  "_newOperatorWithType:modifier:options:",  -[NSBetweenPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  0);
}

- (unint64_t)operatorType
{
  return 100LL;
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result = 0;
  if (!a3 || !a4) {
    return result;
  }
  if ((_NSIsNSArray() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use between operator with rhs %@ (not an array)",  a4);
LABEL_13:
    objc_exception_throw((id)[v11 exceptionWithName:v12 reason:v13 userInfo:0]);
    JUMPOUT(0x18353BFBCLL);
  }

  if ([a4 count] != 2)
  {
    v11 = (void *)MEMORY[0x189603F70];
    uint64_t v12 = *MEMORY[0x189603A60];
    v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use between operator with rhs %@ (wrong number of elements)",  a4);
    goto LABEL_13;
  }

  v8 = -[NSPredicateOperator selector](self, "selector");
  v9 = (void *)[a4 objectAtIndex:0];
  uint64_t v10 = [a4 objectAtIndex:1];
  if (objc_msgSend(v9, v8, v10) == (id)1)
  {
    v9 = (void *)[a4 objectAtIndex:1];
    uint64_t v10 = [a4 objectAtIndex:0];
  }

  return (unint64_t)objc_msgSend(v9, v8, a3) + 1 <= 1 && (unint64_t)objc_msgSend(a3, v8, v10) + 1 < 2;
}

@end