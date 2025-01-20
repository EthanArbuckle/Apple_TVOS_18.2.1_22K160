@interface LACUNManager
- (LACUNManager)initWithBundleIdentifier:(id)a3;
- (LACUNManager)initWithBundleIdentifier:(id)a3 categories:(id)a4;
- (LACUNManagerDelegate)delegate;
- (void)cancelAllNotificationsWithCompletion:(id)a3;
- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5;
- (void)postNotification:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation LACUNManager

- (LACUNManager)initWithBundleIdentifier:(id)a3
{
  return -[LACUNManager initWithBundleIdentifier:categories:]( self,  "initWithBundleIdentifier:categories:",  a3,  MEMORY[0x189604A58]);
}

- (LACUNManager)initWithBundleIdentifier:(id)a3 categories:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LACUNManager;
  return -[LACUNManager init](&v5, sel_init, a3, a4);
}

- (void)postNotification:(id)a3 completion:(id)a4
{
  if (a4)
  {
    if (!self->_notificationCenter)
    {
      id v5 = a4;
      +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1020LL,  @"UNUserNotificationCenter instance is nil");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))a4 + 2))(v5, v6);
    }
  }

- (void)cancelNotificationsWithIdentifiers:(id)a3 scheduledOnly:(BOOL)a4 completion:(id)a5
{
  if (a5)
  {
    if (!self->_notificationCenter)
    {
      id v6 = a5;
      +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1020LL,  @"UNUserNotificationCenter instance is nil");
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))a5 + 2))(v6, v7);
    }
  }

- (void)cancelAllNotificationsWithCompletion:(id)a3
{
  if (a3)
  {
    if (!self->_notificationCenter)
    {
      id v4 = a3;
      +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1020LL,  @"UNUserNotificationCenter instance is nil");
      id v5 = (id)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, id))a3 + 2))(v4, v5);
    }
  }

- (LACUNManagerDelegate)delegate
{
  return (LACUNManagerDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end