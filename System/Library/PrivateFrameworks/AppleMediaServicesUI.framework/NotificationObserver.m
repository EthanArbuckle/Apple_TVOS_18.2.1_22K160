@interface NotificationObserver
+ (void)handleNFCNotification:(id)a3;
- (_TtC14amsengagementd20NotificationObserver)init;
- (void)timezoneChanged;
@end

@implementation NotificationObserver

- (_TtC14amsengagementd20NotificationObserver)init
{
  return (_TtC14amsengagementd20NotificationObserver *)sub_1000F7AC8();
}

- (void)timezoneChanged
{
  v2 = self;
  sub_1000F8BDC();
}

+ (void)handleNFCNotification:(id)a3
{
}

- (void).cxx_destruct
{
}

@end