@interface __NSURLAVBackgroundSession
- (BOOL)isKindOfClass:(Class)a3;
@end

@implementation __NSURLAVBackgroundSession

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSURLAVBackgroundSession;
  if (-[__NSURLAVBackgroundSession isKindOfClass:](&v5, sel_isKindOfClass_)) {
    return 1;
  }
  else {
    return -[objc_class isEqual:](a3, "isEqual:", objc_opt_class());
  }
}

@end