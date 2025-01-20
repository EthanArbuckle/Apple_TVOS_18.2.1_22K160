@interface SQLitePredicate
- (BOOL)isEqual:(id)a3;
- (id)SQLForEntityClass:(Class)a3;
- (id)SQLJoinClausesForEntityClass:(Class)a3;
- (unint64_t)hash;
@end

@implementation SQLitePredicate

- (id)SQLForEntityClass:(Class)a3
{
  return 0LL;
}

- (id)SQLJoinClausesForEntityClass:(Class)a3
{
  return 0LL;
}

- (unint64_t)hash
{
  return (unint64_t)[(id)objc_opt_class(self) hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(self);
  uint64_t v6 = objc_opt_class(v4);

  return v5 == v6;
}

@end