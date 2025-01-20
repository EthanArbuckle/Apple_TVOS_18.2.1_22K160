@interface QueryCache
- (void)cacheClearNotificationWithNotification:(id)a3;
@end

@implementation QueryCache

- (void)cacheClearNotificationWithNotification:(id)a3
{
  id v4 = a3;
  swift_retain(self);
  sub_1000B2EF8(v4);

  swift_release();
}

@end