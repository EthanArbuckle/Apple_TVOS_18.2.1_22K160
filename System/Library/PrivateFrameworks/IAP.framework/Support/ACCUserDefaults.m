@interface ACCUserDefaults
+ (id)sharedDefaults;
- (ACCUserDefaults)init;
@end

@implementation ACCUserDefaults

- (ACCUserDefaults)init
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = NSStringFromSelector("sharedDefaults");
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Use +[%@ %@] instead of -%@.",  v4,  v5,  NSStringFromSelector(a2));
  return 0LL;
}

+ (id)sharedDefaults
{
  if (qword_10011C7C0 != -1) {
    dispatch_once(&qword_10011C7C0, &stru_10010A310);
  }
  return (id)qword_10011C7B8;
}

@end