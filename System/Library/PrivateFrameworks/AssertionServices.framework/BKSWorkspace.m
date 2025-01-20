@interface BKSWorkspace
+ (id)sharedInstance;
- (BKSWorkspace)init;
@end

@implementation BKSWorkspace

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  return (id)sharedInstance_shared;
}

void __30__BKSWorkspace_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___BKSWorkspace);
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;
}

- (BKSWorkspace)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BKSWorkspace;
  v2 = -[BKSWorkspace init](&v5, sel_init);
  if (v2) {
    id v3 = (id)RBSServiceInitialize();
  }
  return v2;
}

@end