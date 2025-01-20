@interface RBUnmanagedJetsamProperties
+ (id)new;
- (BOOL)isValid;
- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4;
@end

@implementation RBUnmanagedJetsamProperties

+ (id)new
{
  return objc_alloc_init(&OBJC_CLASS___RBUnmanagedJetsamProperties);
}

- (BOOL)isValid
{
  return 0;
}

- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4
{
  return 0;
}

@end