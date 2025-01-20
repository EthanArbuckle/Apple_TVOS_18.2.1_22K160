@interface RBSProcessApplicationPredicate
+ (id)applicationPredicate;
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessApplicationPredicate

+ (id)applicationPredicate
{
  if (applicationPredicate_onceToken != -1) {
    dispatch_once(&applicationPredicate_onceToken, &__block_literal_global_108);
  }
  return (id)applicationPredicate__predicate;
}

void __54__RBSProcessApplicationPredicate_applicationPredicate__block_invoke()
{
  v2 = objc_alloc_init(&OBJC_CLASS___RBSProcessApplicationPredicate);
  uint64_t v0 = +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v2);
  v1 = (void *)applicationPredicate__predicate;
  applicationPredicate__predicate = v0;
}

- (BOOL)matchesProcess:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEmbeddedApplication];

  return v4;
}

@end