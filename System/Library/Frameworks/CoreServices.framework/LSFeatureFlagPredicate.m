@interface LSFeatureFlagPredicate
+ (id)featureFlagPredicateForBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6;
- (BOOL)evaluateWithFeatureFlagResolver:(id)a3;
- (LSFeatureFlagPredicate)initWithDictionary:(id)a3 error:(id *)a4;
- (id).cxx_construct;
@end

@implementation LSFeatureFlagPredicate

+ (id)featureFlagPredicateForBundle:(unsigned int)a3 bundleData:(const LSBundleData *)a4 database:(id)a5 error:(id *)a6
{
  v13[1] = *MEMORY[0x1895F89C0];
  v7 = +[_LSLazyPropertyList lazyPropertyListWithDatabase:unit:]( &OBJC_CLASS____LSLazyPropertyList,  "lazyPropertyListWithDatabase:unit:",  a5,  a4->base.infoDictionary);
  [v7 objectForKey:@"LSRequiredFeatureFlags" ofClass:objc_opt_class()];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    a6 = -[LSFeatureFlagPredicate initWithDictionary:error:]( objc_alloc(&OBJC_CLASS___LSFeatureFlagPredicate),  "initWithDictionary:error:",  v8,  a6);
  }

  else if (a6)
  {
    v9 = (void *)*MEMORY[0x189607670];
    uint64_t v12 = *MEMORY[0x189607490];
    v13[0] = @"tried to make reature flag predicate for bundle with no feature flag predicate";
    [MEMORY[0x189603F68] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl( v9,  -43LL,  (uint64_t)"+[LSFeatureFlagPredicate(LSBundleDataPredicate) featureFlagPredicateForBundle:bundleData:database:error:]",  24LL,  v10);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0LL;
  }

  return a6;
}

- (LSFeatureFlagPredicate)initWithDictionary:(id)a3 error:(id *)a4
{
  if (!v10[48])
  {

LABEL_5:
    v7 = 0LL;
    goto LABEL_8;
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LSFeatureFlagPredicate;
  v6 = -[LSFeatureFlagPredicate init](&v9, sel_init);
  v7 = v6;
  if (!v6)
  {
    if (a4)
    {
      _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  12LL,  (uint64_t)"-[LSFeatureFlagPredicate initWithDictionary:error:]",  186LL,  0LL);
      v7 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }

    goto LABEL_5;
  }

  LaunchServices::DelayedInitable<LaunchServices::FeatureFlagPredicateEvaluation::Predicate>::emplace<LaunchServices::FeatureFlagPredicateEvaluation::Predicate>( (uint64_t)&v6->_predicate,  (uint64_t)v10);
LABEL_8:
  std::__optional_destruct_base<LaunchServices::FeatureFlagPredicateEvaluation::Predicate,false>::~__optional_destruct_base[abi:nn180100]((uint64_t)v10);
  return v7;
}

- (BOOL)evaluateWithFeatureFlagResolver:(id)a3
{
  return LaunchServices::FeatureFlagPredicateEvaluation::Predicate::evaluate((uint64_t **)&self->_predicate, a3);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 56) = 0;
  return self;
}

@end