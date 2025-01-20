@interface LocalNotificationHandler
+ (LocalNotificationHandler)sharedHandler;
- (NSArray)presentedRequests;
- (UNUserNotificationCenter)notificationCenter;
- (id)_notificationContentWithRequest:(id)a3 silently:(BOOL)a4;
- (id)retrieveRequestWithIdentifier:(id)a3;
- (void)_handleApproverRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleRequesterRequest:(id)a3 withCompletionHandler:(id)a4;
- (void)_handleUnknownRequestIdentifier:(id)a3 withCompletionHandler:(id)a4;
- (void)_presentNotificationWithRequest:(id)a3 silently:(BOOL)a4;
- (void)_replaceNotificationWithRequest:(id)a3;
- (void)dismissNotificationWithIdentifier:(id)a3;
- (void)presentNotificationWithRequest:(id)a3 silently:(BOOL)a4;
- (void)start;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation LocalNotificationHandler

+ (LocalNotificationHandler)sharedHandler
{
  if (qword_10003A9A8 != -1) {
    dispatch_once(&qword_10003A9A8, &stru_1000309A0);
  }
  return (LocalNotificationHandler *)(id)qword_10003A9B0;
}

- (NSArray)presentedRequests
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LocalNotificationHandler notificationCenter](self, "notificationCenter", 0LL));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 deliveredNotifications]);

  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v18 + 1) + 8 * (void)v9) request]);
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 content]);
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);

        v13 = -[GenericRequest initWithDictionary:]( objc_alloc(&OBJC_CLASS___GenericRequest),  "initWithDictionary:",  v12);
        if (-[GenericRequest status](v13, "status") == -1)
        {
          v15 = &off_100030158;
        }

        else
        {
          id v14 = -[GenericRequest status](v13, "status");
          v15 = &off_100030240;
          if (v14 != (id)1)
          {
            if (-[GenericRequest status](v13, "status")) {
              goto LABEL_12;
            }
            v15 = &off_100030240;
          }
        }

        id v16 = [objc_alloc(*v15) initWithDictionary:v12];
        -[NSMutableArray ap_addNullableObject:](v3, "ap_addNullableObject:", v16);

LABEL_12:
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  return (NSArray *)v3;
}

- (void)dismissNotificationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  id v6 = (void *)v5;
  if (v4)
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = (id)objc_opt_class(self);
      __int16 v14 = 2114;
      id v15 = v4;
      id v8 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Dismissing notification. Identifier: %{public}@",  buf,  0x16u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalNotificationHandler notificationCenter](self, "notificationCenter"));
    id v11 = v4;
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [v6 removeDeliveredNotificationsWithIdentifiers:v9];
  }

  else
  {
    if (!v5) {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = (id)objc_opt_class(self);
      id v10 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not dismiss notification without request identifier",  buf,  0xCu);
    }
  }
}

- (void)presentNotificationWithRequest:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  v9 = (void *)v8;
  if (v7)
  {
    if (!v8) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_opt_class(self);
      id v12 = v11;
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
      int v18 = 138543618;
      id v19 = v11;
      __int16 v20 = 2114;
      __int128 v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Presenting local notification. Identifier: %{public}@",  (uint8_t *)&v18,  0x16u);
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[LocalNotificationHandler retrieveRequestWithIdentifier:]( self,  "retrieveRequestWithIdentifier:",  v14));

    if (v15) {
      -[LocalNotificationHandler _replaceNotificationWithRequest:](self, "_replaceNotificationWithRequest:", v6);
    }
    else {
      -[LocalNotificationHandler _presentNotificationWithRequest:silently:]( self,  "_presentNotificationWithRequest:silently:",  v6,  v4);
    }
  }

  else
  {
    if (!v8) {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
    }
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138543362;
      id v19 = (id)objc_opt_class(self);
      id v17 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not present notification without request identifier",  (uint8_t *)&v18,  0xCu);
    }
  }
}

- (id)retrieveRequestWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[LocalNotificationHandler presentedRequests](self, "presentedRequests", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 requestIdentifier]);
        unsigned int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
          if (!v17) {
            id v17 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
          }
          int v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 OSLogObject]);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = (void *)objc_opt_class(self);
            *(_DWORD *)buf = 138543618;
            v27 = v19;
            __int16 v28 = 2114;
            id v29 = v10;
            id v20 = v19;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Retrieved request. Request: %{public}@",  buf,  0x16u);
          }

          id v16 = v10;
          goto LABEL_19;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v5) {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = (void *)objc_opt_class(self);
    *(_DWORD *)buf = 138543618;
    v27 = v14;
    __int16 v28 = 2114;
    id v29 = v4;
    id v15 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Could not retrieve request. Identifier: %{public}@",  buf,  0x16u);
  }

  id v16 = 0LL;
LABEL_19:

  return v16;
}

- (void)start
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = (id)objc_opt_class(self);
    id v5 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Starting local notification center",  (uint8_t *)&v8,  0xCu);
  }

  id v6 = -[UNUserNotificationCenter initWithBundleIdentifier:]( objc_alloc(&OBJC_CLASS___UNUserNotificationCenter),  "initWithBundleIdentifier:",  @"com.apple.askpermission.notifications");
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v6;

  -[UNUserNotificationCenter setDelegate:](self->_notificationCenter, "setDelegate:", self);
  -[UNUserNotificationCenter setWantsNotificationResponsesDelivered]( self->_notificationCenter,  "setWantsNotificationResponsesDelivered");
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 request]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 content]);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 userInfo]);

  id v13 = -[GenericRequest initWithDictionary:](objc_alloc(&OBJC_CLASS___GenericRequest), "initWithDictionary:", v12);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v14) {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 OSLogObject]);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138543618;
    id v21 = (id)objc_opt_class(self);
    __int16 v22 = 2114;
    __int128 v23 = v13;
    id v16 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Received notification response. Request: %{public}@",  (uint8_t *)&v20,  0x16u);
  }

  if (-[GenericRequest status](v13, "status") == -1)
  {
    id v19 = -[ApprovalRequest initWithDictionary:](objc_alloc(&OBJC_CLASS___ApprovalRequest), "initWithDictionary:", v12);
    -[LocalNotificationHandler _handleApproverRequest:withCompletionHandler:]( self,  "_handleApproverRequest:withCompletionHandler:",  v19,  v8);
  }

  else if ((id)-[GenericRequest status](v13, "status") == (id)1 || !-[GenericRequest status](v13, "status"))
  {
    id v19 = -[RequesterRequest initWithDictionary:]( objc_alloc(&OBJC_CLASS___RequesterRequest),  "initWithDictionary:",  v12);
    -[LocalNotificationHandler _handleRequesterRequest:withCompletionHandler:]( self,  "_handleRequesterRequest:withCompletionHandler:",  v19,  v8);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 notification]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v17 request]);
    id v19 = (ApprovalRequest *)objc_claimAutoreleasedReturnValue([v18 identifier]);

    -[LocalNotificationHandler _handleUnknownRequestIdentifier:withCompletionHandler:]( self,  "_handleUnknownRequestIdentifier:withCompletionHandler:",  v19,  v8);
  }
}

- (void)_handleApproverRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = (id)objc_opt_class(self);
    id v8 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%{public}@: Handle approver local notification not supported on this platform",  (uint8_t *)&v9,  0xCu);
  }

  v5[2](v5);
}

- (void)_handleRequesterRequest:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[RequesterLocalNotificationTask initWithRequest:]( objc_alloc(&OBJC_CLASS___RequesterLocalNotificationTask),  "initWithRequest:",  v6);
  objc_initWeak(&location, self);
  int v9 = (void *)objc_claimAutoreleasedReturnValue(-[RequesterLocalNotificationTask perform](v8, "perform"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000DE2C;
  v11[3] = &unk_1000309C8;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [v9 addFinishBlock:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_handleUnknownRequestIdentifier:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedDaemonConfig](&OBJC_CLASS___APLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[APLogConfig sharedConfig](&OBJC_CLASS___APLogConfig, "sharedConfig"));
  }
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    int v11 = 138543618;
    id v12 = (id)objc_opt_class(self);
    __int16 v13 = 2114;
    id v14 = v6;
    id v10 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@: Unknown notification. Identifier: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  -[LocalNotificationHandler dismissNotificationWithIdentifier:](self, "dismissNotificationWithIdentifier:", v6);
  v7[2](v7);
}

- (void)_presentNotificationWithRequest:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[LocalNotificationHandler _notificationContentWithRequest:silently:]( self,  "_notificationContentWithRequest:silently:",  v6,  v4));
  if (v4) {
    uint64_t v8 = 6LL;
  }
  else {
    uint64_t v8 = 15LL;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 requestIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UNNotificationRequest requestWithIdentifier:content:trigger:destinations:]( &OBJC_CLASS___UNNotificationRequest,  "requestWithIdentifier:content:trigger:destinations:",  v9,  v7,  0LL,  v8));

  objc_initWeak(&location, self);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[LocalNotificationHandler notificationCenter](self, "notificationCenter"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000E27C;
  v13[3] = &unk_1000309F0;
  objc_copyWeak(&v15, &location);
  id v12 = v6;
  id v14 = v12;
  BOOL v16 = v4;
  [v11 addNotificationRequest:v10 withCompletionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)_replaceNotificationWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[LocalNotificationHandler _notificationContentWithRequest:silently:]( self,  "_notificationContentWithRequest:silently:",  v4,  1LL));
  objc_initWeak(&location, self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[LocalNotificationHandler notificationCenter](self, "notificationCenter"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 requestIdentifier]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000E5AC;
  v9[3] = &unk_100030A18;
  objc_copyWeak(&v11, &location);
  id v8 = v4;
  id v10 = v8;
  [v6 replaceContentForRequestWithIdentifier:v7 replacementContent:v5 completionHandler:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (id)_notificationContentWithRequest:(id)a3 silently:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___UNMutableNotificationContent);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 localizations]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 body]);
  -[UNMutableNotificationContent setBody:](v6, "setBody:", v8);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 localizations]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 title]);
  -[UNMutableNotificationContent setTitle:](v6, "setTitle:", v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 date]);
  id v12 = v11;
  if (v11) {
    id v13 = v11;
  }
  else {
    id v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  }
  id v14 = v13;

  -[UNMutableNotificationContent setDate:](v6, "setDate:", v14);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 dateByAddingTimeInterval:2592000.0]);
  -[UNMutableNotificationContent setExpirationDate:](v6, "setExpirationDate:", v15);

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v5 compile]);
  -[UNMutableNotificationContent setUserInfo:](v6, "setUserInfo:", v16);

  -[UNMutableNotificationContent setHasDefaultAction:](v6, "setHasDefaultAction:", 1LL);
  if ([v5 status] == (id)-1) {
    uint64_t v17 = 2LL;
  }
  else {
    uint64_t v17 = UNNotificationInterruptionLevelDefault;
  }
  -[UNMutableNotificationContent setInterruptionLevel:](v6, "setInterruptionLevel:", v17);
  -[UNMutableNotificationContent setShouldAuthenticateDefaultAction:](v6, "setShouldAuthenticateDefaultAction:", 1LL);
  -[UNMutableNotificationContent setShouldBackgroundDefaultAction:](v6, "setShouldBackgroundDefaultAction:", 1LL);
  -[UNMutableNotificationContent setShouldPreventNotificationDismissalAfterDefaultAction:]( v6,  "setShouldPreventNotificationDismissalAfterDefaultAction:",  1LL);
  if (v4)
  {
    -[UNMutableNotificationContent setSound:](v6, "setSound:", 0LL);
  }

  else
  {
    int v18 = (void *)objc_claimAutoreleasedReturnValue(+[UNNotificationSound defaultSound](&OBJC_CLASS___UNNotificationSound, "defaultSound"));
    -[UNMutableNotificationContent setSound:](v6, "setSound:", v18);
  }

  return v6;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void).cxx_destruct
{
}

@end