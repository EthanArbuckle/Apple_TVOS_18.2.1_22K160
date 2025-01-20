@interface _LSDRebuildService
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCInterface;
+ (unsigned)connectionType;
@end

@implementation _LSDRebuildService

+ (BOOL)isEnabled
{
  return [(id)__LSDefaultsGetSharedInstance() isInSyncBubble] ^ 1;
}

+ (unsigned)connectionType
{
  return 13;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __34___LSDRebuildService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDRebuildService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDRebuildService XPCInterface]::once, v3);
  }
  return (id)+[_LSDRebuildService XPCInterface]::result;
}

@end