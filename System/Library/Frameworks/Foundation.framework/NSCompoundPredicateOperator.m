@interface NSCompoundPredicateOperator
+ (id)andPredicateOperator;
+ (id)notPredicateOperator;
+ (id)orPredicateOperator;
+ (void)initialize;
- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4;
- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4 substitutionVariables:(id)a5;
- (id)symbol;
@end

@implementation NSCompoundPredicateOperator

+ (void)initialize
{
  if (&OBJC_CLASS___NSCompoundPredicateOperator == a1)
  {
    _MergedGlobals_93 = -[NSPredicateOperator initWithOperatorType:]( objc_alloc(&OBJC_CLASS___NSCompoundPredicateOperator),  "initWithOperatorType:",  1LL);
    qword_18C4965C8 = -[NSPredicateOperator initWithOperatorType:]( objc_alloc(&OBJC_CLASS___NSCompoundPredicateOperator),  "initWithOperatorType:",  2LL);
    qword_18C4965D0 = -[NSPredicateOperator initWithOperatorType:]( objc_alloc(&OBJC_CLASS___NSCompoundPredicateOperator),  "initWithOperatorType:",  0LL);
  }

+ (id)andPredicateOperator
{
  return (id)_MergedGlobals_93;
}

+ (id)orPredicateOperator
{
  return (id)qword_18C4965C8;
}

+ (id)notPredicateOperator
{
  return (id)qword_18C4965D0;
}

- (id)symbol
{
  unint64_t v2 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v2 < 3) {
    return off_189C99D08[v2];
  }
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"expressionValueWithObject: must be called on a subclass of NSExpression" userInfo:0]);
  return (id)-[NSCompoundPredicateOperator evaluatePredicates:withObject:](v4, v5, v6, v7);
}

- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4
{
  return -[NSCompoundPredicateOperator evaluatePredicates:withObject:substitutionVariables:]( self,  "evaluatePredicates:withObject:substitutionVariables:",  a3,  a4,  0LL);
}

- (BOOL)evaluatePredicates:(id)a3 withObject:(id)a4 substitutionVariables:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  unint64_t v8 = -[NSPredicateOperator operatorType](self, "operatorType");
  if (v8 == 2)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v9 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (!v9) {
      return v9;
    }
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
LABEL_7:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v29 != v11) {
        objc_enumerationMutation(a3);
      }
      if ([*(id *)(*((void *)&v28 + 1) + 8 * v12) evaluateWithObject:a4 substitutionVariables:a5]) {
        goto LABEL_23;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
        LOBYTE(v9) = 0;
        if (v10) {
          goto LABEL_7;
        }
        return v9;
      }
    }
  }

  if (v8 != 1)
  {
    if (v8)
    {
      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Bad compound predicate predicateOperator type" userInfo:0]);
      LOBYTE(v9) = -[NSConstantString initWithCharactersNoCopy:length:](v17, v18, v19, v20);
    }

    else
    {
      LOBYTE(v9) = objc_msgSend( (id)objc_msgSend(a3, "objectAtIndex:", 0),  "evaluateWithObject:substitutionVariables:",  a4,  a5) ^ 1;
    }

    return v9;
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v13 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (!v13)
  {
LABEL_23:
    LOBYTE(v9) = 1;
    return v9;
  }

  uint64_t v14 = v13;
  uint64_t v15 = *(void *)v24;
LABEL_16:
  uint64_t v16 = 0LL;
  while (1)
  {
    if (*(void *)v24 != v15) {
      objc_enumerationMutation(a3);
    }
    LODWORD(v9) = [*(id *)(*((void *)&v23 + 1) + 8 * v16) evaluateWithObject:a4 substitutionVariables:a5];
    if (!(_DWORD)v9) {
      return v9;
    }
    if (v14 == ++v16)
    {
      uint64_t v14 = [a3 countByEnumeratingWithState:&v23 objects:v22 count:16];
      LOBYTE(v9) = 1;
      if (v14) {
        goto LABEL_16;
      }
      return v9;
    }
  }

@end