@interface CallStateNotificationManager
- (void)callStateChanged:(id)a3;
@end

@implementation CallStateNotificationManager

- (void)callStateChanged:(id)a3
{
  id v4 = a3;
  swift_retain();
  CallStateNotificationManager.callStateChanged(_:)((NSNotification)v4);

  swift_release(self);
}

@end