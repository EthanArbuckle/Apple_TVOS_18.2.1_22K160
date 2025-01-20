@interface NSObject(RBSXPCSecureCoding)
+ (uint64_t)supportsRBSXPCSecureCoding;
- (uint64_t)supportsRBSXPCSecureCoding;
@end

@implementation NSObject(RBSXPCSecureCoding)

+ (uint64_t)supportsRBSXPCSecureCoding
{
  return 0LL;
}

- (uint64_t)supportsRBSXPCSecureCoding
{
  return [(id)objc_opt_class() supportsRBSXPCSecureCoding];
}

@end