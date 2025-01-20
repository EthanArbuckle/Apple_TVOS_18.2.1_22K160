@interface NSBoundedByPredicateOperator
- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4;
- (SEL)selector;
- (id)copyWithZone:(_NSZone *)a3;
- (id)symbol;
- (unint64_t)operatorType;
@end

@implementation NSBoundedByPredicateOperator

- (id)symbol
{
  return @"BOUNDEDBY";
}

- (unint64_t)operatorType
{
  return 2000LL;
}

- (SEL)selector
{
  return sel_boundedBy_;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend( (id)objc_opt_class(),  "_newOperatorWithType:modifier:options:",  -[NSBoundedByPredicateOperator operatorType](self, "operatorType"),  -[NSPredicateOperator modifier](self, "modifier"),  0);
}

- (BOOL)performPrimitiveOperationUsingObject:(id)a3 andObject:(id)a4
{
  BOOL result = 0;
  if (!a3 || !a4) {
    return result;
  }
  if ((_NSIsNSArray() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = *MEMORY[0x189603A60];
    v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use boundedBy operator with rhs %@ (not an array)",  a4);
LABEL_21:
    v25 = (const __CFString *)v22;
    v23 = v20;
    uint64_t v24 = v21;
    goto LABEL_25;
  }

  if ([a4 count] != 2)
  {
    v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = *MEMORY[0x189603A60];
    v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use boundedBy operator with rhs %@ (wrong number of elements)",  a4);
    goto LABEL_21;
  }

  v7 = (void *)[a4 objectAtIndex:0];
  v8 = (void *)[a4 objectAtIndex:1];
  if (!objc_lookUpClass("CLLocation"))
  {
    v23 = (void *)MEMORY[0x189603F70];
    uint64_t v24 = *MEMORY[0x189603A58];
    v25 = @"Can't use boundedBy operator unless CLLocation is linked.";
LABEL_25:
    objc_exception_throw((id)[v23 exceptionWithName:v24 reason:v25 userInfo:0]);
    JUMPOUT(0x18363CF20LL);
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (void *)MEMORY[0x189603F70];
    uint64_t v21 = *MEMORY[0x189603A60];
    v22 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use boundedBy operator with rhs %@ (wrong class, should be CLLocation)",  a4);
    goto LABEL_21;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A60];
    v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use boundedBy operator with upperRight %@ (wrong class, should be CLLocation)",  v7);
LABEL_24:
    v25 = (const __CFString *)v28;
    v23 = v26;
    uint64_t v24 = v27;
    goto LABEL_25;
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = (void *)MEMORY[0x189603F70];
    uint64_t v27 = *MEMORY[0x189603A60];
    v28 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Can't use boundedBy operator with lowerRight %@ (wrong class, should be CLLocation)",  v8);
    goto LABEL_24;
  }

  [v7 coordinate];
  double v10 = v9;
  double v12 = v11;
  [v8 coordinate];
  double v14 = v13;
  double v16 = v15;
  [a3 coordinate];
  BOOL v19 = v14 <= v18;
  if (v18 > v10) {
    BOOL v19 = 0;
  }
  if (v12 < v17) {
    BOOL v19 = 0;
  }
  return v17 >= v16 && v19;
}

@end