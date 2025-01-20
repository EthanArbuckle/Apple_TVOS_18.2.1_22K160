@interface IDSUserNotificationsCenter
+ (IDSUserNotificationsCenter)sharedInstance;
- (IDSUserNotificationsCenter)init;
- (UNUserNotificationCenter)notificationCenter;
- (void)postNotificationWithTitle:(id)a3 body:(id)a4 iconIdentifier:(id)a5 shouldShowSubordinateIcon:(BOOL)a6 actionURL:(id)a7;
- (void)setNotificationCenter:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation IDSUserNotificationsCenter

+ (IDSUserNotificationsCenter)sharedInstance
{
  if (qword_1009BEC90 != -1) {
    dispatch_once(&qword_1009BEC90, &stru_1008FC660);
  }
  return (IDSUserNotificationsCenter *)(id)qword_1009BEC98;
}

- (IDSUserNotificationsCenter)init
{
  uint64_t v3 = IMWeakLinkClass(@"UNUserNotificationCenter", @"UserNotifications");
  if (v3)
  {
    v4 = (objc_class *)v3;
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___IDSUserNotificationsCenter;
    v5 = -[IDSUserNotificationsCenter init](&v12, "init");
    if (v5)
    {
      id v6 = objc_alloc(v4);
      v7 = (UNUserNotificationCenter *)[v6 initWithBundleIdentifier:kIDSDaemonFirewallNotificationBundleIdentifier];
      notificationCenter = v5->_notificationCenter;
      v5->_notificationCenter = v7;

      -[UNUserNotificationCenter setDelegate:](v5->_notificationCenter, "setDelegate:", v5);
      -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v5->_notificationCenter,  "setWantsNotificationResponsesDelivered");
    }

    self = v5;
    v9 = self;
  }

  else
  {
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10069FA60(v10);
    }

    v9 = 0LL;
  }

  return v9;
}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4 iconIdentifier:(id)a5 shouldShowSubordinateIcon:(BOOL)a6 actionURL:(id)a7
{
  uint64_t v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (qword_1009BECB8 != -1) {
    dispatch_once(&qword_1009BECB8, &stru_1008FC680);
  }
  if (qword_1009BECA0
    && qword_1009BECA8
    && qword_1009BECB0
    && (v16 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserNotificationsCenter notificationCenter](self, "notificationCenter")),
        v16,
        v16))
  {
    if ([v14 hasPrefix:@"com.apple."])
    {
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([(id)qword_1009BECB0 iconForApplicationIdentifier:v14]);
    }

    else
    {
      unsigned int v31 = v8;
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, @"@2x.png"));
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/System/Library/UserNotifications/Bundles/com.apple.identityservicesd.firewall.bundle",  v30));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      unsigned int v20 = [v19 fileExistsAtPath:v18];

      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = @"NO";
        if (v20) {
          v22 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v33 = v18;
        __int16 v34 = 2112;
        v35 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Loading image from %@, Does exist %@",  buf,  0x16u);
      }

      if ((v20 & 1) != 0) {
        uint64_t v23 = objc_claimAutoreleasedReturnValue([(id)qword_1009BECB0 iconAtPath:v18]);
      }
      else {
        uint64_t v23 = objc_claimAutoreleasedReturnValue([(id)qword_1009BECB0 iconForApplicationIdentifier:@"com.apple.Preferences"]);
      }
      v17 = (os_log_s *)v23;
      uint64_t v8 = v31;
    }

    id v24 = objc_alloc_init((Class)qword_1009BECA8);
    [v24 setTitle:v12];
    [v24 setBody:v13];
    [v24 setIcon:v17];
    [v24 setShouldShowSubordinateIcon:v8];
    if (v15) {
      [v24 setDefaultActionURL:v15];
    }
    [v24 setHasDefaultAction:v15 != 0];
    v25 = (void *)qword_1009BECA0;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 requestWithIdentifier:v27 content:v24 trigger:0]);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[IDSUserNotificationsCenter notificationCenter](self, "notificationCenter"));
    [v29 addNotificationRequest:v28 withCompletionHandler:&stru_1008FC6A0];
  }

  else
  {
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_10069FAA0((uint64_t)v12, v17);
    }
  }
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(id, uint64_t))a5;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Will present ids notification %@",  (uint8_t *)&v9,  0xCu);
  }

  v7[2](v7, 16LL);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v6 = a4;
  v7 = (void (**)(void))a5;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog delivery](&OBJC_CLASS___IDSFoundationLog, "delivery"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Did receive ids notification response %@",  (uint8_t *)&v9,  0xCu);
  }

  v7[2](v7);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end