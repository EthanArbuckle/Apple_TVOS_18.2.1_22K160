@interface _LSDReadService
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCInterface;
+ (unsigned)connectionType;
@end

@implementation _LSDReadService

+ (unsigned)connectionType
{
  return 0;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __31___LSDReadService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDReadService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDReadService XPCInterface]::once, v3);
  }
  return (id)+[_LSDReadService XPCInterface]::result;
}

+ (BOOL)isEnabled
{
  return 1;
}

@end