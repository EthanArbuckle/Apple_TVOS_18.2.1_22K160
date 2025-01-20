@interface LSEligibilityPredicateEvaluator
- (LSEligibilityPredicateEvaluator)initWithResolver:(id)a3;
- (id)evaluatePredicate:(id)a3 error:(id *)a4;
@end

@implementation LSEligibilityPredicateEvaluator

- (LSEligibilityPredicateEvaluator)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSEligibilityPredicateEvaluator;
  v6 = -[LSEligibilityPredicateEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (id)evaluatePredicate:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
}

@end