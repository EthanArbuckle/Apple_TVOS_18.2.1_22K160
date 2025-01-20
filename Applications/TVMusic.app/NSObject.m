@interface NSObject
- (id)tvm_mutableDeepCopy;
@end

@implementation NSObject

- (id)tvm_mutableDeepCopy
{
  if ((objc_opt_respondsToSelector(self, "mutableCopyWithZone:") & 1) != 0) {
    id v3 = -[NSObject mutableCopy](self, "mutableCopy");
  }
  else {
    id v3 = -[NSObject copy](self, "copy");
  }
  return v3;
}

@end