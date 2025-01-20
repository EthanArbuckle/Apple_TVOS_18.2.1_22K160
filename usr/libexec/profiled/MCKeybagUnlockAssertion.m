@interface MCKeybagUnlockAssertion
+ (id)assertionHoldQueue;
+ (void)holdAssertion;
+ (void)releaseAssertion;
- (MCKeybagUnlockAssertion)init;
- (void)dealloc;
@end

@implementation MCKeybagUnlockAssertion

+ (id)assertionHoldQueue
{
  if (qword_1000DC208 != -1) {
    dispatch_once(&qword_1000DC208, &stru_1000C3F98);
  }
  return (id)qword_1000DC200;
}

+ (void)holdAssertion
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 assertionHoldQueue]);
  dispatch_async(v2, &stru_1000C3FB8);
}

+ (void)releaseAssertion
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([a1 assertionHoldQueue]);
  dispatch_sync(v2, &stru_1000C3FE8);
}

- (MCKeybagUnlockAssertion)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MCKeybagUnlockAssertion;
  v2 = -[MCKeybagUnlockAssertion init](&v4, "init");
  if (v2) {
    +[MCKeybagUnlockAssertion holdAssertion](&OBJC_CLASS___MCKeybagUnlockAssertion, "holdAssertion");
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MCKeybagUnlockAssertion;
  -[MCKeybagUnlockAssertion dealloc](&v3, "dealloc");
}

@end