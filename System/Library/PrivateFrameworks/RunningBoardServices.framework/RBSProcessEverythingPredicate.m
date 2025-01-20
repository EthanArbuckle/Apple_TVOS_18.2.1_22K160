@interface RBSProcessEverythingPredicate
+ (id)everythingPredicate;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesProcess:(id)a3;
@end

@implementation RBSProcessEverythingPredicate

+ (id)everythingPredicate
{
  v2 = objc_alloc_init(&OBJC_CLASS___RBSProcessEverythingPredicate);
  v3 = +[RBSProcessPredicate predicateMatching:](&OBJC_CLASS___RBSProcessPredicate, "predicateMatching:", v2);
  return v3;
}

- (BOOL)matchesProcess:(id)a3
{
  return 1;
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