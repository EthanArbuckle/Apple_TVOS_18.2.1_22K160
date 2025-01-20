@interface INDaemon_iOS
- (INDaemon_iOS)init;
- (id)accountPushNotificationHandlerForEventType:(id)a3;
- (id)pushTopics;
- (void)_configureXPCEventStreamHandler;
- (void)_handleDeviceDidPairEvent;
- (void)_handleDeviceNameChangeEvent;
- (void)_loadPushNotificationHandlers;
- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4;
- (void)handleICloudQuotaPush:(id)a3;
- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5;
- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4;
- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4;
- (void)renewCredentialsWithCompletion:(id)a3;
- (void)start;
@end

@implementation INDaemon_iOS

- (INDaemon_iOS)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___INDaemon_iOS;
  v2 = -[INDaemon init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[INDaemon_iOS _loadPushNotificationHandlers](v2, "_loadPushNotificationHandlers");
  }
  return v3;
}

- (void)start
{
  if (!-[INDaemon isRunning](self, "isRunning"))
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___INDaemon_iOS;
    id v3 = -[INDaemon start](&v6, "start");
    uint64_t v4 = _INLogSystem(v3);
    objc_super v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100016C10();
    }

    -[INDaemon_iOS _configureXPCEventStreamHandler](self, "_configureXPCEventStreamHandler");
  }

- (void)_configureXPCEventStreamHandler
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10000C8A0;
  handler[3] = &unk_100025088;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, handler);
  xpc_set_event_stream_handler("com.apple.dispatch.vfs", &_dispatch_main_q, &stru_1000250C8);
}

- (void)_handleDeviceNameChangeEvent
{
  uint64_t v3 = _INLogSystem(self);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Device name has changed.", buf, 2u);
  }

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon accountStore](self, "accountStore"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccounts"));

  if ([v6 count])
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        v11 = 0LL;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v11);
          uint64_t v13 = _INLogSystem(v8);
          v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v22 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Checking if new registration for account %@ is warranted...",  buf,  0xCu);
          }

          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_10000CD5C;
          v16[3] = &unk_100024FA0;
          v16[4] = v12;
          id v8 = -[INDaemon registerForPushNotificationsWithAccount:reason:completion:]( self,  "registerForPushNotificationsWithAccount:reason:completion:",  v12,  4LL,  v16);
          v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
        id v9 = v8;
      }

      while (v8);
    }
  }

  else
  {
    uint64_t v15 = _INLogSystem(0LL);
    id v7 = (id)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "No iCloud accounts found, so there's nothing to do.",  buf,  2u);
    }
  }
}

- (void)_handleDeviceDidPairEvent
{
  uint64_t v2 = _INLogSystem(self);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "devicedidpair get fired, no action performed!",  v4,  2u);
  }
}

- (void)_loadPushNotificationHandlers
{
  uint64_t v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v3 = objc_alloc(&OBJC_CLASS___INVerifyTermsPushHandler);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon accountStore](self, "accountStore"));
  objc_super v5 = -[INVerifyTermsPushHandler initWithAccountStore:](v3, "initWithAccountStore:", v4);

  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v5, @"t_needs_agree");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v5, @"t_did_agree");
  objc_super v6 = (NSDictionary *)-[NSMutableDictionary copy](v12, "copy");
  accountPushNotificationHandlersByEventType = self->_accountPushNotificationHandlersByEventType;
  self->_accountPushNotificationHandlersByEventType = v6;

  id v8 = objc_alloc(&OBJC_CLASS___INAccountEventPushHandler);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[INDaemon accountStore](self, "accountStore"));
  uint64_t v10 = -[INAccountEventPushHandler initWithAccountStore:](v8, "initWithAccountStore:", v9);
  accountDefaultEventPushNotificationHandler = self->_accountDefaultEventPushNotificationHandler;
  self->_accountDefaultEventPushNotificationHandler = v10;
}

- (id)accountPushNotificationHandlerForEventType:(id)a3
{
  uint64_t v4 = (INAccountEventPushHandler *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKeyedSubscript:]( self->_accountPushNotificationHandlersByEventType,  "objectForKeyedSubscript:",  a3));
  accountDefaultEventPushNotificationHandler = v4;
  if (!v4)
  {
    uint64_t v6 = _INLogSystem(0LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100016CDC();
    }

    accountDefaultEventPushNotificationHandler = self->_accountDefaultEventPushNotificationHandler;
  }

  id v8 = accountDefaultEventPushNotificationHandler;

  return v8;
}

- (id)pushTopics
{
  uint64_t v6 = @"com.me.setupservice";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  id v3 = [v2 mutableCopy];

  [v3 addObject:@"com.icloud.quota"];
  id v4 = [v3 copy];

  return v4;
}

- (void)handleICloudQuotaPush:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _INLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    *(_DWORD *)buf = 138412290;
    uint64_t v10 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "> Handling iCloudQuota push message: %@",  buf,  0xCu);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___INDaemon_iOS;
  -[INDaemon handleICloudQuotaPush:](&v8, "handleICloudQuotaPush:", v4);
}

- (void)iCloudServerOfferForAccountWithID:(id)a3 options:(id)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a5;
  uint64_t v8 = _INLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received offer request for account %@ over XPC.",  (uint8_t *)&v12,  0xCu);
  }

  uint64_t v10 = INCreateError(6LL);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v7[2](v7, 0LL, v11);
}

- (void)notifyDeviceStorageLevel:(int64_t)a3 completion:(id)a4
{
  id v5 = a4;
  uint64_t v6 = INCreateError(6LL);
  id v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v7);
}

- (void)presentHiddenFreshmintWithContext:(id)a3 completion:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = _INLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "presenting freshmint flow with context %@",  (uint8_t *)&v14,  0xCu);
  }

  uint64_t v10 = _INLogSystem(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100016D08();
  }

  uint64_t v12 = INCreateError(6LL);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v6[2](v6, 0LL, v13);
}

- (void)commonHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  id v4 = (void (**)(id, void))a4;
  uint64_t v5 = _INLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100016D34();
  }

  v4[2](v4, 0LL);
}

- (void)renewCredentialsWithCompletion:(id)a3
{
  id v3 = (void (**)(id, uint64_t, void))a3;
  uint64_t v4 = _INLogSystem(v3);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100016D60();
  }

  v3[2](v3, 2LL, 0LL);
}

- (void).cxx_destruct
{
}

@end