@interface NotificationController
- (_TtC13appleaccountd22NotificationController)init;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation NotificationController

- (_TtC13appleaccountd22NotificationController)init
{
  return (_TtC13appleaccountd22NotificationController *)sub_10001CA80();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd22NotificationController_notificationCenter));
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_10001D4B4(v10);
  _Block_release(v8);
}

@end