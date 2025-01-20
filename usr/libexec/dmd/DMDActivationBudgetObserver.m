@interface DMDActivationBudgetObserver
- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 budgetPredicate:(id)a5;
- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 compositeBudgetPredicate:(id)a5;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (void)invalidate;
@end

@implementation DMDActivationBudgetObserver

- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 budgetPredicate:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDActivationBudgetObserver;
  return -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v6,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  a5);
}

- (DMDActivationBudgetObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 compositeBudgetPredicate:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___DMDActivationBudgetObserver;
  return -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v6,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  a5);
}

- (id)evaluatePredicateWithError:(id *)a3
{
  if (a3) {
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  3328LL,  0LL));
  }
  return 0LL;
}

- (void)invalidate
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___DMDActivationBudgetObserver;
  -[DMDActivationPredicateObserver invalidate](&v2, "invalidate");
}

- (id)metadata
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___DMDActivationBudgetObserver;
  id v2 = -[DMDActivationPredicateObserver metadata](&v4, "metadata");
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

@end