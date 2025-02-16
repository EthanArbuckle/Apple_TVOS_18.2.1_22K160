@interface _OSLogSimplePredicate
- (BOOL)isSupportedCompoundType:(unint64_t)a3;
- (BOOL)isSupportedExpression:(id)a3;
- (NSPredicate)predicate;
- (_OSLogSimplePredicate)initWithPredicate:(id)a3 supportedKeys:(id)a4 supportedOperators:(id)a5 supportedCompoundTypes:(id)a6;
- (void)processComparisonPredicate:(id)a3;
- (void)processCompoundPredicate:(id)a3;
- (void)visitPredicate:(id)a3;
@end

@implementation _OSLogSimplePredicate

- (_OSLogSimplePredicate)initWithPredicate:(id)a3 supportedKeys:(id)a4 supportedOperators:(id)a5 supportedCompoundTypes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    v14 = -[_OSLogSimplePredicate init](self, "init");
    v15 = v14;
    if (v14)
    {
      objc_storeStrong((id *)&v14->_keys, a4);
      objc_storeStrong((id *)&v15->_operators, a5);
      objc_storeStrong((id *)&v15->_compoundTypes, a6);
      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
      stack = v15->_stack;
      v15->_stack = v16;

      [v10 acceptVisitor:v15 flags:0];
      v18 = -[NSMutableArray objectAtIndexedSubscript:](v15->_stack, "objectAtIndexedSubscript:", 0LL);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v20 = -[NSMutableArray objectAtIndexedSubscript:](v15->_stack, "objectAtIndexedSubscript:", 0LL);
        predicate = v15->_predicate;
        v15->_predicate = (NSPredicate *)v20;
      }
    }

    self = v15;
    v22 = self;
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (BOOL)isSupportedExpression:(id)a3
{
  id v4 = a3;
  if ([v4 expressionType] == 3)
  {
    keys = self->_keys;
    [v4 keyPath];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = -[NSSet containsObject:](keys, "containsObject:", v6);
  }

  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isSupportedCompoundType:(unint64_t)a3
{
  compoundTypes = self->_compoundTypes;
  [MEMORY[0x189607968] numberWithUnsignedInteger:a3];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(compoundTypes) = -[NSSet containsObject:](compoundTypes, "containsObject:", v4);

  return (char)compoundTypes;
}

- (void)processComparisonPredicate:(id)a3
{
  v15[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FE8] null];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  operators = self->_operators;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", objc_msgSend(v4, "predicateOperatorType"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(operators) = -[NSSet containsObject:](operators, "containsObject:", v7);

  if ((_DWORD)operators)
  {
    [v4 leftExpression];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 rightExpression];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_OSLogSimplePredicate isSupportedExpression:](self, "isSupportedExpression:", v8)
      || -[_OSLogSimplePredicate isSupportedExpression:](self, "isSupportedExpression:", v9))
    {
      if ([v4 predicateOperatorType] == 5)
      {
        id v10 = (void *)objc_msgSend( objc_alloc(MEMORY[0x189607818]),  "initWithLeftExpression:rightExpression:modifier:type:options:",  v8,  v9,  objc_msgSend(v4, "comparisonPredicateModifier"),  4,  objc_msgSend(v4, "options"));
        id v11 = objc_alloc(MEMORY[0x189607820]);
        v15[0] = v10;
        [MEMORY[0x189603F18] arrayWithObjects:v15 count:1];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v11 initWithType:0 subpredicates:v12];

        v5 = (void *)v13;
      }

      else
      {
        id v14 = v4;

        v5 = v14;
      }
    }
  }

  -[NSMutableArray addObject:](self->_stack, "addObject:", v5);
}

- (void)processCompoundPredicate:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 subpredicates];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 count];

  uint64_t v7 = -[NSMutableArray count](self->_stack, "count");
  uint64_t v8 = v7 - v6;
  v9 = -[NSMutableArray subarrayWithRange:](self->_stack, "subarrayWithRange:", v7 - v6, v6);
  -[NSMutableArray removeObjectsInRange:](self->_stack, "removeObjectsInRange:", v8, v6);
  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0) {
          objc_msgSend(v10, "addObject:", v16, (void)v24);
        }
        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }

    while (v13);
  }

  uint64_t v17 = [v10 count];
  if (!-[_OSLogSimplePredicate isSupportedCompoundType:]( self,  "isSupportedCompoundType:",  [v4 compoundPredicateType]))
  {
LABEL_15:
    BOOL v19 = 0;
    goto LABEL_21;
  }

  uint64_t v18 = [v4 compoundPredicateType];
  if (v18)
  {
    if (v18 != 2)
    {
      if (v18 == 1)
      {
        BOOL v19 = v17 != 0;
        goto LABEL_21;
      }

      goto LABEL_15;
    }

    BOOL v20 = v17 == v6;
  }

  else
  {
    BOOL v20 = v17 == 1;
  }

  BOOL v19 = v20;
LABEL_21:
  objc_msgSend(MEMORY[0x189603FE8], "null", (void)v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v17 == 1 && [v4 compoundPredicateType])
    {
      uint64_t v22 = [v10 objectAtIndexedSubscript:0];
    }

    else
    {
      uint64_t v22 = objc_msgSend( objc_alloc(MEMORY[0x189607820]),  "initWithType:subpredicates:",  objc_msgSend(v4, "compoundPredicateType"),  v10);
    }

    v23 = (void *)v22;

    v21 = v23;
  }

  -[NSMutableArray addObject:](self->_stack, "addObject:", v21);
}

- (void)visitPredicate:(id)a3
{
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_OSLogSimplePredicate processComparisonPredicate:](self, "processComparisonPredicate:", v6);
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[_OSLogSimplePredicate processCompoundPredicate:](self, "processCompoundPredicate:", v6);
    }

    else
    {
      stack = self->_stack;
      [MEMORY[0x189603FE8] null];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](stack, "addObject:", v5);
    }
  }
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
}

@end