@interface MSUSupport
+ (id)sharedSupport;
- (id)MSUSupportGetUpdateInfo:(id)a3 for:(id)a4;
@end

@implementation MSUSupport

+ (id)sharedSupport
{
  if (sharedSupport_onceToken != -1) {
    dispatch_once(&sharedSupport_onceToken, &__block_literal_global_3);
  }
  return (id)sGlobalMSUSupportObject;
}

void __27__MSUSupport_sharedSupport__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSUSupport);
  v2 = (void *)sGlobalMSUSupportObject;
  sGlobalMSUSupportObject = (uint64_t)v1;
}

- (id)MSUSupportGetUpdateInfo:(id)a3 for:(id)a4
{
  return 0LL;
}

@end