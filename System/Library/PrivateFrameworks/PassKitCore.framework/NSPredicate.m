@interface NSPredicate
- (id)passd_sqlPredicateForSelect;
@end

@implementation NSPredicate

- (id)passd_sqlPredicateForSelect
{
  uint64_t v4 = objc_opt_class(self, a2);
  NSRequestConcreteImplementation(self, a2, v4);
  return 0LL;
}

@end