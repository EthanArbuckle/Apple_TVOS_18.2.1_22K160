@interface KTActualLockStateProvider
+ (BOOL)getIsLocked;
- (BOOL)hasBeenUnlocked;
- (BOOL)queryAKSLocked;
- (KTActualLockStateProvider)init;
@end

@implementation KTActualLockStateProvider

+ (BOOL)getIsLocked
{
  int v2 = MKBGetDeviceLockState(0LL, a2);
  return v2 != 3 && v2 != 0;
}

- (KTActualLockStateProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KTActualLockStateProvider;
  return -[KTActualLockStateProvider init](&v3, "init");
}

- (BOOL)queryAKSLocked
{
  int v2 = (void *)objc_opt_class(self, a2);
  return _[v2 getIsLocked];
}

- (BOOL)hasBeenUnlocked
{
  int v5 = 0;
  int v2 = sub_1000F86EC(0, &v5);
  return (v5 & 6) != 0 && v2 == 0;
}

@end