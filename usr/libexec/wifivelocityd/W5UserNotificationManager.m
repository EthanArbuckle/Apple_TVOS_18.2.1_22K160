@interface W5UserNotificationManager
- (UNUserNotificationCenter)userNotificationCenter;
- (W5UserNotificationManager)init;
- (void)dispatchNotificationWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 type:(int64_t)a6 UUID:(id)a7 actionURL:(id)a8;
- (void)removeNotificationWithUUID:(id)a3;
- (void)setUserNotificationCenter:(id)a3;
@end

@implementation W5UserNotificationManager

- (W5UserNotificationManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___W5UserNotificationManager;
  v3 = -[W5UserNotificationManager init](&v7, "init");
  if (v3 && objc_opt_class(&OBJC_CLASS___UNUserNotificationCenter, v2))
  {
    v4 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.wifivelocityd.usernotification");
    userNotificationCenter = v3->_userNotificationCenter;
    v3->_userNotificationCenter = v4;

    -[UNUserNotificationCenter setDelegate:](v3->_userNotificationCenter, "setDelegate:", v3);
    -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( v3->_userNotificationCenter,  "setWantsNotificationResponsesDelivered");
    -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:]( v3->_userNotificationCenter,  "requestAuthorizationWithOptions:completionHandler:",  3LL,  &stru_1000D15C8);
    -[UNUserNotificationCenter removeAllDeliveredNotifications]( v3->_userNotificationCenter,  "removeAllDeliveredNotifications");
    -[UNUserNotificationCenter removeAllPendingNotificationRequests]( v3->_userNotificationCenter,  "removeAllPendingNotificationRequests");
  }

  return v3;
}

- (void)dispatchNotificationWithTitle:(id)a3 subtitle:(id)a4 body:(id)a5 type:(int64_t)a6 UUID:(id)a7 actionURL:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (+[W5FeatureAvailability isInternalBuild](&OBJC_CLASS___W5FeatureAvailability, "isInternalBuild"))
  {
    v19 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
    -[UNMutableNotificationContent setTitle:](v19, "setTitle:", v14);
    -[UNMutableNotificationContent setSubtitle:](v19, "setSubtitle:", v15);
    -[UNMutableNotificationContent setBody:](v19, "setBody:", v16);
    -[UNMutableNotificationContent setShouldIgnoreDoNotDisturb:](v19, "setShouldIgnoreDoNotDisturb:", 1LL);
    -[UNMutableNotificationContent setShouldIgnoreDowntime:](v19, "setShouldIgnoreDowntime:", 1LL);
    if (a6)
    {
      if ((a6 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
        -[UNMutableNotificationContent setDefaultActionURL:](v19, "setDefaultActionURL:", v18);
      }
    }

    else
    {
      -[UNMutableNotificationContent setShouldSuppressDefaultAction:](v19, "setShouldSuppressDefaultAction:", 1LL);
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](&OBJC_CLASS___UNNotificationSound, "defaultSound"));
      -[UNMutableNotificationContent setSound:](v19, "setSound:", v21);

      -[UNMutableNotificationContent setInterruptionLevel:](v19, "setInterruptionLevel:", 3LL);
    }

    uint64_t v22 = sub_10008C90C();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      v32 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]";
      __int16 v33 = 2080;
      v34 = "W5UserNotificationManager.m";
      __int16 v35 = 1024;
      int v36 = 80;
      __int16 v37 = 2114;
      v38 = v19;
      int v30 = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v23,  0LL,  "[wifivelocity] %s (%s:%u) Generated User Notification: %{public}@",  &v31,  v30);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    v25 = (UNMutableNotificationContent *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v24,  v19,  0LL,  7LL));

    uint64_t v26 = sub_10008C90C();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315906;
      v32 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]";
      __int16 v33 = 2080;
      v34 = "W5UserNotificationManager.m";
      __int16 v35 = 1024;
      int v36 = 83;
      __int16 v37 = 2114;
      v38 = v25;
      LODWORD(v28) = 38;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v27,  0LL,  "[wifivelocity] %s (%s:%u) Queueing User Notification Request: %{public}@",  &v31,  v28);
    }

    -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]( self->_userNotificationCenter,  "addNotificationRequest:withCompletionHandler:",  v25,  &stru_1000D15E8);
  }

  else
  {
    uint64_t v20 = sub_10008C90C();
    v19 = (UNMutableNotificationContent *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 136315650;
      v32 = "-[W5UserNotificationManager dispatchNotificationWithTitle:subtitle:body:type:UUID:actionURL:]";
      __int16 v33 = 2080;
      v34 = "W5UserNotificationManager.m";
      __int16 v35 = 1024;
      int v36 = 58;
      int v29 = 28;
      _os_log_send_and_compose_impl( 1LL,  0LL,  0LL,  0LL,  &_mh_execute_header,  v19,  0LL,  "[wifivelocity] %s (%s:%u) suppressing user notification on non-internal build",  (const char *)&v31,  v29);
    }
  }
}

- (void)removeNotificationWithUUID:(id)a3
{
  if (a3)
  {
    userNotificationCenter = self->_userNotificationCenter;
    v4 = (void *)objc_claimAutoreleasedReturnValue([a3 UUIDString]);
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
    -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:]( userNotificationCenter,  "removeDeliveredNotificationsWithIdentifiers:",  v5);
  }

- (UNUserNotificationCenter)userNotificationCenter
{
  return self->_userNotificationCenter;
}

- (void)setUserNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end