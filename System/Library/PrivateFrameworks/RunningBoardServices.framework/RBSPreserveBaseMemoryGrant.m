@interface RBSPreserveBaseMemoryGrant
+ (id)grant;
@end

@implementation RBSPreserveBaseMemoryGrant

+ (id)grant
{
  return (id)[objc_alloc((Class)a1) _init];
}

@end