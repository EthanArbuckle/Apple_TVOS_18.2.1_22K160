@interface _LSDModifyService
+ (BOOL)isEnabled;
+ (Class)clientClass;
+ (id)XPCInterface;
+ (id)dispatchQueue;
+ (unsigned)connectionType;
@end

@implementation _LSDModifyService

+ (unsigned)connectionType
{
  return 1;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __33___LSDModifyService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDModifyService XPCInterface]::once != -1) {
    dispatch_once(&+[_LSDModifyService XPCInterface]::once, v3);
  }
  return (id)+[_LSDModifyService XPCInterface]::result;
}

+ (BOOL)isEnabled
{
  return [(id)__LSDefaultsGetSharedInstance() isInSyncBubble] ^ 1;
}

+ (id)dispatchQueue
{
  if (+[_LSDModifyService dispatchQueue]::once != -1) {
    dispatch_once(&+[_LSDModifyService dispatchQueue]::once, &__block_literal_global_27);
  }
  return (id)+[_LSDModifyService dispatchQueue]::result;
}

@end