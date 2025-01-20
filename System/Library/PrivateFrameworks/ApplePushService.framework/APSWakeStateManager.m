@interface APSWakeStateManager
+ (id)wakeStateManager;
- (BOOL)inDarkWake;
- (BOOL)inFullWake;
- (BOOL)isClamshellClosed;
- (BOOL)isGoingToSleep;
- (BOOL)isWaking;
- (BOOL)supportsDarkWakeForActivePowerSource;
- (BOOL)wasInDarkWake;
- (BOOL)wasInFullWake;
@end

@implementation APSWakeStateManager

+ (id)wakeStateManager
{
  return objc_alloc_init(&OBJC_CLASS___APSWakeStateManager);
}

- (BOOL)inDarkWake
{
  return 0;
}

- (BOOL)inFullWake
{
  return 1;
}

- (BOOL)isClamshellClosed
{
  return 0;
}

- (BOOL)isGoingToSleep
{
  return 0;
}

- (BOOL)isWaking
{
  return 0;
}

- (BOOL)supportsDarkWakeForActivePowerSource
{
  return 1;
}

- (BOOL)wasInDarkWake
{
  return 0;
}

- (BOOL)wasInFullWake
{
  return 1;
}

- (void).cxx_destruct
{
}

@end