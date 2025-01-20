@interface RBSProcessBKSLegacyPredicate
+ (id)legacyPredicate;
+ (id)legacyPredicateMatchingBundleIdentifier:(id)a3;
+ (id)legacyPredicateMatchingProcessIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessBKSLegacyPredicate

+ (id)legacyPredicate
{
  if (legacyPredicate_onceToken != -1) {
    dispatch_once(&legacyPredicate_onceToken, &__block_literal_global_4);
  }
  return (id)legacyPredicate___LegacyPredicate;
}

void __47__RBSProcessBKSLegacyPredicate_legacyPredicate__block_invoke()
{
  v6[2] = *MEMORY[0x1895F89C0];
  v0 = objc_alloc_init(&OBJC_CLASS___RBSProcessBKSLegacyPredicate);
  v1 = +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v0);  v2 = +[RBSProcessPredicate predicateMatchingEuid:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatchingEuid:", geteuid());
  v6[0] = v1;
  v6[1] = v2;
  [MEMORY[0x189603F18] arrayWithObjects:v6 count:2];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = +[RBSProcessPredicate predicateMatchingPredicates:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingPredicates:",  v3);
  v5 = (void *)legacyPredicate___LegacyPredicate;
  legacyPredicate___LegacyPredicate = v4;
}

+ (id)legacyPredicateMatchingBundleIdentifier:(id)a3
{
  v9[2] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  +[RBSProcessBKSLegacyPredicate legacyPredicate](&OBJC_CLASS___RBSProcessBKSLegacyPredicate, "legacyPredicate");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v3);
  v9[1] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[RBSProcessPredicate predicateMatchingPredicates:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingPredicates:",  v6);
  return v7;
}

+ (id)legacyPredicateMatchingProcessIdentifier:(id)a3
{
  v9[2] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  +[RBSProcessBKSLegacyPredicate legacyPredicate](&OBJC_CLASS___RBSProcessBKSLegacyPredicate, "legacyPredicate");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v5 = +[RBSProcessPredicate predicateMatchingIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingIdentifier:",  v3);
  v9[1] = v5;
  [MEMORY[0x189603F18] arrayWithObjects:v9 count:2];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[RBSProcessPredicate predicateMatchingPredicates:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingPredicates:",  v6);
  return v7;
}

- (BOOL)matchesProcess:(id)a3
{
  return [a3 isReported];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();

  return v4 == v5;
}

@end