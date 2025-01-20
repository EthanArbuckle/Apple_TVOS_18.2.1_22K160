@interface LSFeatureFlagPredicateEvaluator
+ (id)defaultEvaluator;
+ (id)defaultResolver;
- (BOOL)evaluatePredicate:(id)a3;
- (LSFeatureFlagPredicateEvaluator)initWithResolver:(id)a3;
- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6;
@end

@implementation LSFeatureFlagPredicateEvaluator

- (id)evaluateBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend( MEMORY[0x189607968],  "numberWithBool:",  -[LSFeatureFlagPredicateEvaluator evaluatePredicate:](self, "evaluatePredicate:", v7));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (LSFeatureFlagPredicateEvaluator)initWithResolver:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSFeatureFlagPredicateEvaluator;
  v6 = -[LSFeatureFlagPredicateEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_resolver, a3);
  }

  return v7;
}

- (BOOL)evaluatePredicate:(id)a3
{
  return [a3 evaluateWithFeatureFlagResolver:self->_resolver];
}

+ (id)defaultResolver
{
  return +[_LSDefaultFeatureFlagResolver sharedInstance](&OBJC_CLASS____LSDefaultFeatureFlagResolver, "sharedInstance");
}

+ (id)defaultEvaluator
{
  if (+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::onceToken != -1) {
    dispatch_once(&+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::onceToken, &__block_literal_global_56_1);
  }
  return (id)+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator;
}

void __51__LSFeatureFlagPredicateEvaluator_defaultEvaluator__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___LSFeatureFlagPredicateEvaluator);
  +[_LSDefaultFeatureFlagResolver sharedInstance](&OBJC_CLASS____LSDefaultFeatureFlagResolver, "sharedInstance");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = -[LSFeatureFlagPredicateEvaluator initWithResolver:](v0, "initWithResolver:");
  v2 = (void *)+[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator;
  +[LSFeatureFlagPredicateEvaluator defaultEvaluator]::evaluator = v1;
}

- (void).cxx_destruct
{
}

@end