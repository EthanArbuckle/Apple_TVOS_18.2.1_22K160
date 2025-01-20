@interface NSMutableSet(NSMutableSet)
- (uint64_t)classForCoder;
@end

@implementation NSMutableSet(NSMutableSet)

- (uint64_t)classForCoder
{
  return objc_opt_self();
}

@end