@interface NSSQLSubqueryExpressionIntermediatePredicateVisitor
- (BOOL)checkPredicate:(id)a3;
- (void)dealloc;
- (void)visitPredicateExpression:(id)a3;
@end

@implementation NSSQLSubqueryExpressionIntermediatePredicateVisitor

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSSQLSubqueryExpressionIntermediatePredicateVisitor;
  -[NSSQLSubqueryExpressionIntermediatePredicateVisitor dealloc](&v3, sel_dealloc);
}

- (void)visitPredicateExpression:(id)a3
{
  uint64_t v5 = [a3 expressionType];
  if (v5 == 3
    || v5 == 4
    && (sel_valueForKey_ == (char *)[a3 selector]
     || sel_valueForKeyPath_ == (char *)[a3 selector]))
  {
  }

- (BOOL)checkPredicate:(id)a3
{
  BOOL result = !self->_foundKeypath;
  self->_foundKeypath = 0;
  return result;
}

@end