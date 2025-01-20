@interface _OSLogPredicateMapper
- (NSArray)validationErrors;
- (NSMutableArray)stack;
- (NSMutableSet)validKeyPaths;
- (NSPredicate)mappedPredicate;
- (_OSLogPredicateMapper)initWithPredicate:(id)a3;
- (_OSLogPredicateMapper)initWithPredicate:(id)a3 andValidate:(BOOL)a4;
- (id)mapEventTypeExpression:(id)a3;
- (id)mapKeywordToConstantExpression:(id)a3 keywordMap:(id)a4;
- (id)mapMessageTypeExpression:(id)a3;
- (id)mapSignpostScopeExpression:(id)a3;
- (id)mapSignpostTypeExpression:(id)a3;
- (unint64_t)flags;
- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4;
- (void)processComparisonPredicate:(id)a3;
- (void)processCompoundPredicate:(id)a3;
- (void)setStack:(id)a3;
- (void)validateExpression:(id)a3;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
- (void)visitPredicateOperator:(id)a3;
@end

@implementation _OSLogPredicateMapper

- (_OSLogPredicateMapper)initWithPredicate:(id)a3 andValidate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = -[_OSLogPredicateMapper init](self, "init");
  if (v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    stack = v7->_stack;
    v7->_stack = v8;

    v7->_pass = 0;
    [v6 acceptVisitor:v7 flags:0];
    v10 = -[NSMutableArray lastObject](v7->_stack, "lastObject");
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    validationErrors = v7->_validationErrors;
    v7->_validationErrors = v11;

    if (v4)
    {
      v7->_pass = 1;
      [v10 acceptVisitor:v7 flags:1];
    }

    if (!-[NSMutableArray count](v7->_validationErrors, "count")) {
      objc_storeStrong((id *)&v7->_predicate, v10);
    }
  }

  return v7;
}

- (_OSLogPredicateMapper)initWithPredicate:(id)a3
{
  return -[_OSLogPredicateMapper initWithPredicate:andValidate:](self, "initWithPredicate:andValidate:", a3, 1LL);
}

- (void)visitPredicate:(id)a3
{
  id v4 = a3;
  if (!self->_pass)
  {
    id v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_OSLogPredicateMapper processComparisonPredicate:](self, "processComparisonPredicate:", v5);
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        -[_OSLogPredicateMapper processCompoundPredicate:](self, "processCompoundPredicate:", v5);
      }
      else {
        -[NSMutableArray addObject:](self->_stack, "addObject:", v5);
      }
    }

    id v4 = v5;
  }
}

- (NSMutableSet)validKeyPaths
{
  if (validKeyPaths_once != -1) {
    dispatch_once(&validKeyPaths_once, &__block_literal_global_673);
  }
  return (NSMutableSet *)(id)validKeyPaths__validKeyPaths;
}

- (id)mapKeywordToConstantExpression:(id)a3 keywordMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 expressionType] != 3
    || ([v5 keyPath],
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        [v6 objectForKeyedSubscript:v7],
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    if (![v5 expressionType])
    {
      [v5 constantValue];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        [v5 constantValue];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 objectForKeyedSubscript:v12];
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v9 = (void *)MEMORY[0x189607878];
          uint64_t v10 = [v5 constantValue];
          goto LABEL_8;
        }
      }

      else
      {
      }
    }

    id v16 = v5;
    goto LABEL_11;
  }

  v9 = (void *)MEMORY[0x189607878];
  uint64_t v10 = [v5 keyPath];
LABEL_8:
  v14 = (void *)v10;
  [v6 objectForKeyedSubscript:v10];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 expressionForConstantValue:v15];
  id v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v16;
}

- (id)mapEventTypeExpression:(id)a3
{
  uint64_t v4 = mapEventTypeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapEventTypeExpression__once, &__block_literal_global_125);
  }
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:]( self,  "mapKeywordToConstantExpression:keywordMap:",  v5,  mapEventTypeExpression__eventTypes);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapMessageTypeExpression:(id)a3
{
  uint64_t v4 = mapMessageTypeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapMessageTypeExpression__once, &__block_literal_global_153);
  }
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:]( self,  "mapKeywordToConstantExpression:keywordMap:",  v5,  mapMessageTypeExpression__messageTypes);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapSignpostScopeExpression:(id)a3
{
  uint64_t v4 = mapSignpostScopeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapSignpostScopeExpression__once, &__block_literal_global_174);
  }
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:]( self,  "mapKeywordToConstantExpression:keywordMap:",  v5,  mapSignpostScopeExpression__scopes);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)mapSignpostTypeExpression:(id)a3
{
  uint64_t v4 = mapSignpostTypeExpression__once;
  id v5 = a3;
  if (v4 != -1) {
    dispatch_once(&mapSignpostTypeExpression__once, &__block_literal_global_187);
  }
  -[_OSLogPredicateMapper mapKeywordToConstantExpression:keywordMap:]( self,  "mapKeywordToConstantExpression:keywordMap:",  v5,  mapSignpostTypeExpression__types);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)mapLeftExpression:(id *)a3 andRightExpression:(id *)a4
{
  if (mapLeftExpression_andRightExpression__once != -1) {
    dispatch_once(&mapLeftExpression_andRightExpression__once, &__block_literal_global_197);
  }
  if ([*a3 expressionType] == 3)
  {
    [*a3 keyPath];
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)mapLeftExpression_andRightExpression__keypathMaps, "objectForKeyedSubscript:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x189607878];
      [(id)mapLeftExpression_andRightExpression__keypathMaps objectForKeyedSubscript:v23];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 expressionForKeyPath:v9];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      id v11 = *a3;
      *a3 = v10;
    }

    else
    {
      if (([v23 isEqualToString:@"type"] & 1) != 0
        || [v23 isEqualToString:@"eventType"])
      {
        [MEMORY[0x189607878] expressionForKeyPath:@"type"];
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        id v13 = *a3;
        *a3 = v12;
        v14 = -[_OSLogPredicateMapper mapEventTypeExpression:](self, "mapEventTypeExpression:", *a4);
      }

      else if ([v23 isEqualToString:@"signpostScope"])
      {
        v14 = -[_OSLogPredicateMapper mapSignpostScopeExpression:](self, "mapSignpostScopeExpression:", *a4);
      }

      else
      {
        if (![v23 isEqualToString:@"signpostType"])
        {
          if (([v23 isEqualToString:@"messageType"] & 1) == 0
            && ![v23 isEqualToString:@"logType"])
          {
            goto LABEL_12;
          }

          [MEMORY[0x189607878] expressionForKeyPath:@"logType"];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          id v16 = *a3;
          *a3 = v15;
          v17 = -[_OSLogPredicateMapper mapMessageTypeExpression:](self, "mapMessageTypeExpression:", *a4);
          id v18 = *a4;
          *a4 = v17;

          if ([*a4 expressionType]) {
            goto LABEL_12;
          }
          [*a4 constantValue];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0) {
            goto LABEL_12;
          }
          [*a4 constantValue];
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v21 = [v9 integerValue];
          if (v21 == 2)
          {
            uint64_t v22 = 1LL;
          }

          else
          {
            if (v21 != 1) {
              goto LABEL_11;
            }
            uint64_t v22 = 2LL;
          }

          self->_flags |= v22;
          goto LABEL_11;
        }
        v14 = -[_OSLogPredicateMapper mapSignpostTypeExpression:](self, "mapSignpostTypeExpression:", *a4);
      }

      v9 = *a4;
      *a4 = v14;
    }

- (void)processComparisonPredicate:(id)a3
{
  id v4 = a3;
  [v4 leftExpression];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v4 rightExpression];
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  -[_OSLogPredicateMapper mapLeftExpression:andRightExpression:]( self,  "mapLeftExpression:andRightExpression:",  &v13,  &v12);
  -[_OSLogPredicateMapper mapLeftExpression:andRightExpression:]( self,  "mapLeftExpression:andRightExpression:",  &v12,  &v13);
  id v5 = objc_alloc(MEMORY[0x189607818]);
  id v7 = v12;
  id v6 = v13;
  uint64_t v8 = [v4 comparisonPredicateModifier];
  uint64_t v9 = [v4 predicateOperatorType];
  uint64_t v10 = [v4 options];

  id v11 = (void *)[v5 initWithLeftExpression:v6 rightExpression:v7 modifier:v8 type:v9 options:v10];
  -[NSMutableArray addObject:](self->_stack, "addObject:", v11);
}

- (void)processCompoundPredicate:(id)a3
{
  stack = self->_stack;
  id v5 = a3;
  uint64_t v6 = -[NSMutableArray count](stack, "count");
  [v5 subpredicates];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v6 - [v7 count];
  [v5 subpredicates];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 count];

  -[NSMutableArray subarrayWithRange:](self->_stack, "subarrayWithRange:", v8, v10);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_stack, "removeObjectsInRange:", v8, v10);
  id v11 = objc_alloc(MEMORY[0x189607820]);
  uint64_t v12 = [v5 compoundPredicateType];

  id v13 = (void *)[v11 initWithType:v12 subpredicates:v14];
  -[NSMutableArray addObject:](self->_stack, "addObject:", v13);
}

- (void)validateExpression:(id)a3
{
  id v17 = a3;
  unint64_t v4 = [v17 expressionType];
  if (v4 > 0xE) {
    goto LABEL_8;
  }
  if (((1LL << v4) & 0x4403) != 0) {
    goto LABEL_10;
  }
  if (v4 != 3)
  {
LABEL_8:
    validationErrors = self->_validationErrors;
    [NSString stringWithFormat:@"invalid expression: %@", v17];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](validationErrors, "addObject:", v14);
    goto LABEL_9;
  }

  [v17 operand];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 expressionType];

  if (v6 == 1)
  {
    [v17 arguments];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 count];

    if (v8 == 1)
    {
      -[_OSLogPredicateMapper validKeyPaths](self, "validKeyPaths");
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 keyPath];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      char v11 = [v9 containsObject:v10];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = self->_validationErrors;
        id v13 = (void *)NSString;
        [v17 keyPath];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 stringWithFormat:@"no such field: %@", v14];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v12, "addObject:", v15);

LABEL_9:
      }

- (void)visitPredicateOperator:(id)a3
{
  id v3 = a3;
  _os_crash();
  __break(1u);
}

- (void)visitPredicateExpression:(id)a3
{
  id v4 = a3;
  if (self->_pass == 1)
  {
    id v5 = v4;
    -[_OSLogPredicateMapper validateExpression:](self, "validateExpression:", v4);
  }

  else
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }

- (unint64_t)flags
{
  return self->_flags;
}

- (NSPredicate)mappedPredicate
{
  return self->_predicate;
}

- (NSMutableArray)stack
{
  return self->_stack;
}

- (void)setStack:(id)a3
{
}

- (NSArray)validationErrors
{
  return &self->_validationErrors->super;
}

- (void).cxx_destruct
{
}

@end