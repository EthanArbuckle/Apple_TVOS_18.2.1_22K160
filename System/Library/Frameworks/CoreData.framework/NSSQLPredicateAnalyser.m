@interface NSSQLPredicateAnalyser
- (NSSQLPredicateAnalyser)init;
- (void)dealloc;
- (void)visitPredicate:(id)a3;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation NSSQLPredicateAnalyser

- (NSSQLPredicateAnalyser)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSSQLPredicateAnalyser;
  v2 = -[NSSQLPredicateAnalyser init](&v4, sel_init);
  if (v2)
  {
    v2->_keys = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v2->_allModifierPredicates = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v2->_setExpressions = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v2->_subqueries = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
    v2->_compoundPredicate = 0;
  }

  return v2;
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5 = [a3 expressionType];
  if (v5 == 3) {
    goto LABEL_5;
  }
  if (v5 != 4)
  {
    if ((unint64_t)(v5 - 5) >= 3)
    {
      if (v5 != 13) {
        return;
      }
      uint64_t v6 = 5LL;
    }

    else
    {
      uint64_t v6 = 4LL;
    }

    goto LABEL_10;
  }

  if (sel_valueForKey_ == (char *)[a3 selector]
    || sel_valueForKeyPath_ == (char *)[a3 selector])
  {
LABEL_5:
    uint64_t v6 = 2LL;
LABEL_10:
    -[objc_class addObject:]((&self->super.isa)[v6], "addObject:", a3);
  }

- (void)visitPredicate:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0 && [a3 comparisonPredicateModifier] == 1) {
    -[NSMutableArray addObject:](self->_allModifierPredicates, "addObject:", a3);
  }
}

- (void)dealloc
{
  self->_keys = 0LL;
  self->_allModifierPredicates = 0LL;

  self->_setExpressions = 0LL;
  self->_subqueries = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLPredicateAnalyser;
  -[NSSQLPredicateAnalyser dealloc](&v3, sel_dealloc);
}

@end