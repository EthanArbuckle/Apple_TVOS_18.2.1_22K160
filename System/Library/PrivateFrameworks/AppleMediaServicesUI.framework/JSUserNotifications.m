@interface JSUserNotifications
- (_TtC14amsengagementd19JSUserNotifications)init;
- (id)getAuthorizationStatus:(id)a3;
- (id)getNotificationSettings:(id)a3;
- (id)getNotificationSettingsForTopics:(id)a3;
@end

@implementation JSUserNotifications

- (id)getAuthorizationStatus:(id)a3
{
  return sub_1000BA7E4(self, (uint64_t)a2, (uint64_t)a3, sub_1000B84F4);
}

- (id)getNotificationSettings:(id)a3
{
  return sub_1000BA7E4(self, (uint64_t)a2, (uint64_t)a3, sub_1000B8DC8);
}

- (id)getNotificationSettingsForTopics:(id)a3
{
  return sub_1000BA7E4(self, (uint64_t)a2, (uint64_t)a3, sub_1000B9F08);
}

- (_TtC14amsengagementd19JSUserNotifications)init
{
  return (_TtC14amsengagementd19JSUserNotifications *)sub_1000BA844();
}

@end