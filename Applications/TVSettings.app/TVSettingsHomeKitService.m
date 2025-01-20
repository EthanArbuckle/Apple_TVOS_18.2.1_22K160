@interface TVSettingsHomeKitService
- (BOOL)notificationsEnabled;
- (HMService)service;
- (NSString)accessoryName;
- (TVSettingsHomeKitService)initWithHMService:(id)a3;
- (void)setNotificationsEnabled:(BOOL)a3;
@end

@implementation TVSettingsHomeKitService

- (TVSettingsHomeKitService)initWithHMService:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsHomeKitService;
  v6 = -[TVSettingsHomeKitService init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_service, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 bulletinBoardNotification]);
    v7->_notificationsEnabled = [v8 isEnabled];
  }

  return v7;
}

- (NSString)accessoryName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitService service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessory]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 name]);

  return (NSString *)v4;
}

- (void)setNotificationsEnabled:(BOOL)a3
{
  BOOL notificationsEnabled = self->_notificationsEnabled;
  if (notificationsEnabled != a3)
  {
    BOOL v4 = a3;
    self->_BOOL notificationsEnabled = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsHomeKitService service](self, "service"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bulletinBoardNotification]);

    [v7 setEnabled:v4];
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10004EB48;
    v8[3] = &unk_1001908D8;
    objc_copyWeak(&v9, &location);
    BOOL v10 = notificationsEnabled;
    [v7 commitWithCompletionHandler:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

- (BOOL)notificationsEnabled
{
  return self->_notificationsEnabled;
}

- (HMService)service
{
  return self->_service;
}

- (void).cxx_destruct
{
}

@end