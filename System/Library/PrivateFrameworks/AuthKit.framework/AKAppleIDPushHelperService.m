@interface AKAppleIDPushHelperService
+ (id)sharedService;
- (AKAppleIDPushHelperService)init;
- (BOOL)_canProceedWithArmingForMessage:(id)a3 account:(id)a4;
- (BOOL)_isPrimaryAccount:(id)a3;
- (BOOL)_messageSupportsAlerts:(id)a3;
- (BOOL)_queryDelegatesForSuppressAction:(id)a3;
- (BOOL)_shouldProcessPushMessage:(id)a3 withAccount:(id)a4;
- (NSString)activeCode;
- (id)_akPCSAuthPushHandler;
- (id)_publicAPSToken;
- (id)_pushCommandsPostingCFUserNotification;
- (id)publicAPSTokenString;
- (void)_armDeviceWithMessage:(id)a3 account:(id)a4 notificationResult:(unint64_t)a5;
- (void)_ensureDesiredAPSEnvironmentIsInUse:(id)a3;
- (void)_generateLoginCodeForAccount:(id)a3 withIncomingMessage:(id)a4;
- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4;
- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4 payload:(id)a5;
- (void)_performCommandForMessage:(id)a3 forAccount:(id)a4;
- (void)_processMessageWithDelegates:(id)a3;
- (void)_startPasswordResetFlowForAccount:(id)a3;
- (void)_unsafe_presentMessage:(id)a3 forAccount:(id)a4;
- (void)_unsafe_processPushMessage:(id)a3;
- (void)_unsafe_showLoginNotificationWithCode:(id)a3 incomingMessage:(id)a4 piggy:(BOOL)a5;
- (void)_unsafe_showNotificationForMessage:(id)a3 account:(id)a4 responseHandler:(id)a5;
- (void)_unsafe_tearDownNotificationWithID:(id)a3;
- (void)_unsafe_teardownCurrentLoginNotification;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
- (void)setActiveCode:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setEnableCriticalReliability:(BOOL)a3;
- (void)showPigCode:(id)a3 withIncomingMessage:(id)a4;
- (void)startWithDelegates:(id)a3;
- (void)tearDownLoginNotifications;
@end

@implementation AKAppleIDPushHelperService

+ (id)sharedService
{
  if (qword_10020F5F0 != -1) {
    dispatch_once(&qword_10020F5F0, &stru_1001CA550);
  }
  return (id)qword_10020F5E8;
}

- (AKAppleIDPushHelperService)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___AKAppleIDPushHelperService;
  v2 = -[AKAppleIDPushHelperService init](&v16, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    accountManager = v2->_accountManager;
    v2->_accountManager = (AKAccountManager *)v3;

    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    notificationsByPushID = v2->_notificationsByPushID;
    v2->_notificationsByPushID = v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
    apsTokenSemaphore = v2->_apsTokenSemaphore;
    v2->_apsTokenSemaphore = (OS_dispatch_semaphore *)v7;

    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.authkit.pushServiceQueue", v10);
    pushServiceQueue = v2->_pushServiceQueue;
    v2->_pushServiceQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", @"com.apple.idmsauth", 0LL));
    pushTopics = v2->_pushTopics;
    v2->_pushTopics = (NSSet *)v13;
  }

  return v2;
}

- (void)startWithDelegates:(id)a3
{
  id v4 = a3;
  v5 = getenv("__OSINSTALL_ENVIRONMENT");
  if (v5)
  {
    uint64_t v6 = _AKLogSystem(v5);
    dispatch_semaphore_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v8 = "We are running in recovery. Leaving APS alone.";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
    }
  }

  else
  {
    dispatch_queue_attr_t v9 = getenv("__AKSYNCBUBBLE");
    if (v9)
    {
      uint64_t v10 = _AKLogSystem(v9);
      dispatch_semaphore_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "We are running in the sync bubble. Leaving APS alone.";
        goto LABEL_14;
      }
    }

    else
    {
      pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10009B2D4;
      block[3] = &unk_1001C7300;
      block[4] = self;
      dispatch_async(pushServiceQueue, block);
      uint64_t v13 = _AKSignpostLogSystem(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      os_signpost_id_t v15 = _AKSignpostCreate();
      uint64_t v17 = v16;

      uint64_t v19 = _AKSignpostLogSystem(v18);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      v21 = v20;
      if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v21,  OS_SIGNPOST_INTERVAL_BEGIN,  v15,  "APSTokenEnvironment",  " enableTelemetry=YES ",  buf,  2u);
      }

      uint64_t v23 = _AKSignpostLogSystem(v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        os_signpost_id_t v30 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: APSTokenEnvironment  enableTelemetry=YES ",  buf,  0xCu);
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBag sharedBag](&OBJC_CLASS___AKURLBag, "sharedBag"));
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10009B3F4;
      v27[3] = &unk_1001CA578;
      v27[5] = v15;
      v27[6] = v17;
      v27[4] = self;
      [v25 environmentValueForKey:AKURLBagKeyAPSEnvironment completion:v27];

      uint64_t v26 = _AKLogSystem(-[AKAppleIDPushHelperService setDelegates:](self, "setDelegates:", v4));
      dispatch_semaphore_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Push service started";
        goto LABEL_14;
      }
    }
  }
}

- (void)setDelegates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10013F07C();
  }

  dispatch_semaphore_t v7 = (NSArray *)[v4 copy];
  pushDelegates = self->_pushDelegates;
  self->_pushDelegates = v7;
}

- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = _AKLogSystem(v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    *(_DWORD *)buf = 138412290;
    uint64_t v22 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Will notify delegates of notification action: %@",  buf,  0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = self->_pushDelegates;
  id v11 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        os_signpost_id_t v15 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v15, "didRespondToMessage:withResult:") & 1) != 0) {
          objc_msgSend(v15, "didRespondToMessage:withResult:", v6, a4, (void)v16);
        }
      }

      id v12 = -[NSArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    }

    while (v12);
  }
}

- (void)_notifyDelegatesOfMessageActivation:(id)a3 result:(unint64_t)a4 payload:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = _AKLogSystem(v9);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Will notify delegates of notification action: %@",  buf,  0xCu);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v13 = self->_pushDelegates;
  id v14 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v20 != v16) {
          objc_enumerationMutation(v13);
        }
        __int128 v18 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v18, "didRespondToMessage:result:payload:") & 1) != 0) {
          objc_msgSend(v18, "didRespondToMessage:result:payload:", v8, a4, v9, (void)v19);
        }
      }

      id v15 = -[NSArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v19,  v23,  16LL);
    }

    while (v15);
  }
}

- (BOOL)_queryDelegatesForSuppressAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will query delegates of intent to show notification",  buf,  2u);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v7 = self->_pushDelegates;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v25,  16LL);
  if (v8)
  {
    id v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v13, "shouldSuppressPushMessage:") & 1) != 0) {
          v10 |= objc_msgSend(v13, "shouldSuppressPushMessage:", v4, (void)v19);
        }
      }

      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v19,  v25,  16LL);
    }

    while (v9);
  }

  else
  {
    LOBYTE(v10) = 0;
  }

  uint64_t v15 = _AKLogSystem(v14);
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v17 = @"NO";
    if ((v10 & 1) != 0) {
      __int128 v17 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Did notify delegates of intent to show notification, suppression elected: %@",  buf,  0xCu);
  }

  return v10 & 1;
}

- (void)_processMessageWithDelegates:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will ask delegates to process push payload",  buf,  2u);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v7 = self->_pushDelegates;
  id v8 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)v11);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
        uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = sub_10009BCEC;
        v18[3] = &unk_1001C6538;
        v18[4] = v12;
        id v19 = v4;
        dispatch_async(v14, v18);

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = -[NSArray countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
    }

    while (v9);
  }

  uint64_t v16 = _AKLogSystem(v15);
  __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Did ask delegates to process push payload",  buf,  2u);
  }
}

- (void)_ensureDesiredAPSEnvironmentIsInUse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10009BDAC;
    v9[3] = &unk_1001C6538;
    id v10 = v4;
    uint64_t v11 = self;
    dispatch_sync(pushServiceQueue, v9);
  }

  else
  {
    uint64_t v7 = _AKLogSystem(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10013F0DC();
    }
  }
}

- (void)dealloc
{
  if (self->_apsConnection)
  {
    uint64_t v3 = _AKLogSystem(self);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down APS connection...", buf, 2u);
    }

    -[APSConnection shutdown](self->_apsConnection, "shutdown");
    -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", 0LL);
    apsConnection = self->_apsConnection;
    self->_apsConnection = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AKAppleIDPushHelperService;
  -[AKAppleIDPushHelperService dealloc](&v6, "dealloc");
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = _AKLogSystem(self);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "APNS status changed: %d", (uint8_t *)v7, 8u);
  }
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v3 = _AKLogSystem(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "APNS reconnected", v5, 2u);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_respondsToSelector(v5, "aaf_toHexString");
  if ((v6 & 1) != 0)
  {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___AKPushTokenKeychainWrapper);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKPushTokenKeychainWrapper fetchToken](v7, "fetchToken"));
    id v9 = [v8 isEqual:v5];
    if ((_DWORD)v9)
    {
      uint64_t v10 = _AKLogSystem(v9);
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_10013F28C();
      }

      uint64_t v13 = _AKLogSystem(v12);
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_10013F1CC(v8, v5, v14);
      }
    }

    else
    {
      uint64_t v16 = _AKLogSystem(-[AKPushTokenKeychainWrapper updateToken:](v7, "updateToken:", v5));
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        sub_10013F2B8(v5, v17);
      }

      dispatch_semaphore_signal((dispatch_semaphore_t)self->_apsTokenSemaphore);
      __int128 v25 = 0u;
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      uint64_t v14 = self->_pushDelegates;
      id v18 = -[os_log_s countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
      if (v18)
      {
        id v19 = v18;
        v24 = v8;
        uint64_t v20 = *(void *)v26;
        do
        {
          for (i = 0LL; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v26 != v20) {
              objc_enumerationMutation(v14);
            }
            __int128 v22 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
            if ((objc_opt_respondsToSelector(v22, "didReceiveNewPublicToken:") & 1) != 0)
            {
              __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aaf_toHexString"));
              [v22 didReceiveNewPublicToken:v23];
            }
          }

          id v19 = -[os_log_s countByEnumeratingWithState:objects:count:]( v14,  "countByEnumeratingWithState:objects:count:",  &v25,  v29,  16LL);
        }

        while (v19);
        id v8 = v24;
      }
    }
  }

  else
  {
    uint64_t v15 = _AKLogSystem(v6);
    uint64_t v7 = (AKPushTokenKeychainWrapper *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_10013F340();
    }
  }
}

- (id)publicAPSTokenString
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDPushHelperService _publicAPSToken](self, "_publicAPSToken"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aaf_toHexString"));

  return v3;
}

- (id)_publicAPSToken
{
  id v3 = +[AKDevice didConfirmDeviceWasActivated](&OBJC_CLASS___AKDevice, "didConfirmDeviceWasActivated");
  if ((v3 & 1) != 0)
  {
    uint64_t v4 = _AKSignpostLogSystem(v3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    os_signpost_id_t v6 = _AKSignpostCreate();
    uint64_t v8 = v7;

    uint64_t v10 = _AKSignpostLogSystem(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = v11;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v12,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "APSTokenPopulate",  " enableTelemetry=YES ",  (uint8_t *)&buf,  2u);
    }

    uint64_t v14 = _AKSignpostLogSystem(v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: APSTokenPopulate  enableTelemetry=YES ",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000LL;
    v35 = sub_10009C768;
    v36 = sub_10009C778;
    id v37 = 0LL;
    pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10009C780;
    v28[3] = &unk_1001C7A08;
    v28[4] = self;
    v28[5] = &buf;
    dispatch_sync(pushServiceQueue, v28);
    unint64_t Nanoseconds = _AKSignpostGetNanoseconds(v6, v8);
    uint64_t v18 = _AKSignpostLogSystem(Nanoseconds);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    uint64_t v20 = v19;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v29 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v20,  OS_SIGNPOST_INTERVAL_END,  v6,  "APSTokenPopulate",  "",  v29,  2u);
    }

    uint64_t v22 = _AKSignpostLogSystem(v21);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 134218240;
      os_signpost_id_t v30 = v6;
      __int16 v31 = 2048;
      double v32 = (double)Nanoseconds / 1000000000.0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "END [%lld] %fs:APSTokenPopulate ",  v29,  0x16u);
    }

    id v24 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&buf, 8);

    return v24;
  }

  else
  {
    uint64_t v26 = _AKLogSystem(v3);
    __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Unable to confirm this device was activated, skipping APS Token fetch.",  (uint8_t *)&buf,  2u);
    }

    return 0LL;
  }

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "akd/received-push-message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  uint64_t v10 = _AKLogSystem(v9);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    *(_DWORD *)__int128 buf = 138412546;
    id v24 = v7;
    __int16 v25 = 2112;
    uint64_t v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received push message: %@. Contents: %@",  buf,  0x16u);
  }

  pushTopics = self->_pushTopics;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 topic]);
  LOBYTE(pushTopics) = -[NSSet containsObject:](pushTopics, "containsObject:", v14);

  if ((pushTopics & 1) != 0)
  {
    pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10009CBDC;
    v19[3] = &unk_1001C6538;
    uint64_t v20 = (os_log_s *)v7;
    uint64_t v21 = self;
    dispatch_async(pushServiceQueue, v19);
    __int128 v17 = v20;
  }

  else
  {
    uint64_t v18 = _AKLogSystem(v15);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10013F404();
    }
  }

  os_activity_scope_leave(&state);
}

- (void)_unsafe_processPushMessage:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  if (!v4)
  {
    uint64_t v19 = _AKLogSystem(v5);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_10013F430();
    }
    goto LABEL_18;
  }

  id v6 = [v4 isValidMessage];
  if (!(_DWORD)v6)
  {
    uint64_t v10 = 0LL;
LABEL_15:
    uint64_t v20 = _AKLogSystem(v6);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_10013F45C();
    }
    goto LABEL_17;
  }

  uint64_t v7 = _AKLogSystem(v6);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10013F4BC();
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[AKAccountManager authKitAccountWithAltDSID:error:]( self->_accountManager,  "authKitAccountWithAltDSID:error:",  v9,  0LL));
  unsigned int v11 = -[AKAppleIDPushHelperService _shouldProcessPushMessage:withAccount:]( self,  "_shouldProcessPushMessage:withAccount:",  v4,  v10);

  if (!v11) {
    goto LABEL_15;
  }
  id v12 = [v4 command];
  if (v12 == (id)400 || (id v12 = [v4 command], v12 == (id)410))
  {
    uint64_t v13 = _AKLogSystem(v12);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Received push command to tear down notification.",  buf,  2u);
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[AKFollowUpManagerFactory sharedAuthKitFollowupManager]( &OBJC_CLASS___AKFollowUpManagerFactory,  "sharedAuthKitFollowupManager"));
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 previousMessageId]);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 pendingFollowUpWithMessageId:v16]);

    if ([v17 count])
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[AKFollowUpManagerFactory sharedAuthKitFollowupManager]( &OBJC_CLASS___AKFollowUpManagerFactory,  "sharedAuthKitFollowupManager"));
      [v18 tearDownFollowUpsWithItems:v17];
    }

    else
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v4 previousMessageId]);
      -[AKAppleIDPushHelperService _unsafe_tearDownNotificationWithID:]( self,  "_unsafe_tearDownNotificationWithID:",  v18);
    }

    goto LABEL_18;
  }

  if ([v4 command] == (id)900)
  {
    uint64_t v22 = _AKLogSystem(900LL);
    __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v32 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Received push command to refresh AKURLBag",  v32,  2u);
    }

    +[NSXPCConnection beginTransaction](&OBJC_CLASS___NSXPCConnection, "beginTransaction");
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
    [v24 clearCache];

    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[AKURLBagService sharedBagService](&OBJC_CLASS___AKURLBagService, "sharedBagService"));
    -[os_log_s fetchURLBagForAltDSID:completion:](v21, "fetchURLBagForAltDSID:completion:", 0LL, &stru_1001CA598);
LABEL_17:

    goto LABEL_18;
  }

  id v25 = (id)-[AKAppleIDPushHelperService _messageSupportsAlerts:](self, "_messageSupportsAlerts:", v4);
  if ((_DWORD)v25)
  {
    if (!-[AKAppleIDPushHelperService _queryDelegatesForSuppressAction:](self, "_queryDelegatesForSuppressAction:", v4))
    {
      -[AKAppleIDPushHelperService _unsafe_presentMessage:forAccount:]( self,  "_unsafe_presentMessage:forAccount:",  v4,  v10);
      goto LABEL_18;
    }

    id v25 = [v4 command];
    if (v25 == (id)700 || (id v25 = [v4 command], v25 == (id)100))
    {
      uint64_t v26 = _AKLogSystem(v25);
      __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v31 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Processing a supressed command, tearing down previous HSA2 alerts",  v31,  2u);
      }

      id v25 = -[AKAppleIDPushHelperService _unsafe_teardownCurrentLoginNotification]( self,  "_unsafe_teardownCurrentLoginNotification");
    }
  }

  uint64_t v28 = _AKLogSystem(v25);
  v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_signpost_id_t v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Incoming message alert suppressed", v30, 2u);
  }

  -[AKAppleIDPushHelperService _processMessageWithDelegates:](self, "_processMessageWithDelegates:", v4);
LABEL_18:
}

- (id)_akPCSAuthPushHandler
{
  pcsAuthPushHandler = self->_pcsAuthPushHandler;
  if (!pcsAuthPushHandler)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[AKWebSessionPCSKeyProvider sharedInstance]( &OBJC_CLASS___AKWebSessionPCSKeyProvider,  "sharedInstance"));
    id v6 = -[AKPCSAuthPushHandler initWithAccountManager:webSessionPCSKeyProvider:]( objc_alloc(&OBJC_CLASS___AKPCSAuthPushHandler),  "initWithAccountManager:webSessionPCSKeyProvider:",  v4,  v5);
    uint64_t v7 = self->_pcsAuthPushHandler;
    self->_pcsAuthPushHandler = v6;

    pcsAuthPushHandler = self->_pcsAuthPushHandler;
  }

  return pcsAuthPushHandler;
}

- (BOOL)_shouldProcessPushMessage:(id)a3 withAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 command] == (id)300 || objc_msgSend(v6, "command") == (id)310)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v7));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[AKAccountManager altDSIDforPrimaryiCloudAccount]( self->_accountManager,  "altDSIDforPrimaryiCloudAccount"));
    unsigned __int8 v10 = [v8 isEqualToString:v9];

    if ((v10 & 1) == 0)
    {
      uint64_t v18 = _AKLogSystem(v11);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10013F628();
      }
      goto LABEL_24;
    }
  }

  if ([v6 requiresPasscode])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned __int8 v13 = [v12 isProtectedWithPasscode];

    if ((v13 & 1) == 0)
    {
      uint64_t v29 = _AKLogSystem(v14);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10013F5FC();
      }
      goto LABEL_24;
    }
  }

  id v15 = [v6 command];
  if (!v7 && v15 != (id)700)
  {
    uint64_t v16 = _AKLogSystem(v15);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10013F51C(v6, v17);
    }
LABEL_24:

    BOOL v30 = 0;
    goto LABEL_25;
  }

  id v19 = [v6 command];
  id v20 = [v6 command];
  if (v19 == (id)1900 || v20 == (id)2000)
  {
    BOOL v21 = -[AKAppleIDPushHelperService _isPrimaryAccount:](self, "_isPrimaryAccount:", v7);
    if (!v21)
    {
      uint64_t v31 = _AKLogSystem(v21);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10013F5D0();
      }
      goto LABEL_24;
    }
  }

  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( -[AKAppleIDPushHelperService _pushCommandsPostingCFUserNotification]( self,  "_pushCommandsPostingCFUserNotification"));
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 command]));
  unsigned int v24 = [v22 containsObject:v23];

  if (v24)
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[AKDevice currentDevice](&OBJC_CLASS___AKDevice, "currentDevice"));
    unsigned int v26 = [v25 isInRestrictedSharingMode];

    if (v26)
    {
      uint64_t v28 = _AKLogSystem(v27);
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_10013F5A4();
      }
      goto LABEL_24;
    }
  }

  BOOL v30 = 1;
LABEL_25:

  return v30;
}

- (void)_unsafe_presentMessage:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  uint64_t v9 = _AKLogSystem(v8);
  unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Showing alert for message %@.", buf, 0xCu);
  }

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10009D3FC;
  v13[3] = &unk_1001CA5C0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  -[AKAppleIDPushHelperService _unsafe_showNotificationForMessage:account:responseHandler:]( self,  "_unsafe_showNotificationForMessage:account:responseHandler:",  v12,  v11,  v13);
}

- (void)_armDeviceWithMessage:(id)a3 account:(id)a4 notificationResult:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AKAppleIDPushHelperService _akPCSAuthPushHandler](self, "_akPCSAuthPushHandler"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10009D674;
  v12[3] = &unk_1001CA5E8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  [v9 armDeviceWithPCSAuthorizationContextForMessage:v11 completion:v12];
}

- (BOOL)_messageSupportsAlerts:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 alertTitle]);
  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 alertBody]);
    BOOL v6 = v5 != 0LL;
  }

  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_performCommandForMessage:(id)a3 forAccount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 command];
  if (v8 == (id)310 || v8 == (id)300)
  {
    id v9 = -[AKAppleIDPushHelperService _startPasswordResetFlowForAccount:]( self,  "_startPasswordResetFlowForAccount:",  v7);
  }

  else if (v8 == (id)100)
  {
    id v9 = -[AKAppleIDPushHelperService _generateLoginCodeForAccount:withIncomingMessage:]( self,  "_generateLoginCodeForAccount:withIncomingMessage:",  v7,  v6);
  }

  else
  {
    uint64_t v10 = _AKLogSystem(v8);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 command]));
      int v15 = 138412290;
      uint64_t v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No action to be done for push command %@.",  (uint8_t *)&v15,  0xCu);
    }
  }

  uint64_t v13 = _AKLogSystem(v9);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Processed all known commands, notifying delegates",  (uint8_t *)&v15,  2u);
  }

  -[AKAppleIDPushHelperService _processMessageWithDelegates:](self, "_processMessageWithDelegates:", v6);
}

- (void)_generateLoginCodeForAccount:(id)a3 withIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v6 username]);
    *(_DWORD *)__int128 buf = 138412290;
    unsigned int v24 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Trying to generate login code now for %@...",  buf,  0xCu);
  }

  id v22 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[AKAppleIDCodeGenerator generateLoginCode:]( &OBJC_CLASS___AKAppleIDCodeGenerator,  "generateLoginCode:",  &v22));
  id v12 = v22;
  pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009DA7C;
  block[3] = &unk_1001C9BA8;
  id v18 = v12;
  id v19 = self;
  id v20 = v11;
  id v21 = v7;
  id v14 = v7;
  id v15 = v11;
  id v16 = v12;
  dispatch_async(pushServiceQueue, block);
}

- (void)showPigCode:(id)a3 withIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AKLogSystem(v7);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will display piggy notification...", buf, 2u);
  }

  pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009DD10;
  block[3] = &unk_1001C6510;
  void block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(pushServiceQueue, block);
}

- (void)tearDownLoginNotifications
{
  pushServiceQueue = (dispatch_queue_s *)self->_pushServiceQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10009DD7C;
  block[3] = &unk_1001C7300;
  void block[4] = self;
  dispatch_sync(pushServiceQueue, block);
}

- (void)_unsafe_showLoginNotificationWithCode:(id)a3 incomingMessage:(id)a4 piggy:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  -[AKAppleIDPushHelperService _unsafe_teardownCurrentLoginNotification]( self,  "_unsafe_teardownCurrentLoginNotification");
  uint64_t v10 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%06u",  [v9 unsignedIntValue]));
  activeCode = self->_activeCode;
  self->_activeCode = v10;

  id v12 = (NSString *)objc_claimAutoreleasedReturnValue([v8 messageId]);
  loginCodeNotificationID = self->_loginCodeNotificationID;
  self->_loginCodeNotificationID = v12;

  id v14 = -[AKPushMessageNotificationPresenter initWithMessage:]( objc_alloc(&OBJC_CLASS___AKPushMessageNotificationPresenter),  "initWithMessage:",  v8);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_notificationsByPushID,  "setObject:forKeyedSubscript:",  v14,  self->_loginCodeNotificationID);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10009DE9C;
  v15[3] = &unk_1001CA610;
  v15[4] = self;
  -[AKPushMessageNotificationPresenter presentLoginNotificationWithCode:piggy:completionHandler:]( v14,  "presentLoginNotificationWithCode:piggy:completionHandler:",  v9,  v5,  v15);
}

- (void)_unsafe_teardownCurrentLoginNotification
{
  uint64_t v3 = _AKLogSystem(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    loginCodeNotificationID = self->_loginCodeNotificationID;
    int v6 = 138412290;
    id v7 = loginCodeNotificationID;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Tearing down login notification: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[AKAppleIDPushHelperService _unsafe_tearDownNotificationWithID:]( self,  "_unsafe_tearDownNotificationWithID:",  self->_loginCodeNotificationID);
}

- (void)_unsafe_tearDownNotificationWithID:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  if (v4)
  {
    id v5 = [v4 isEqualToString:self->_loginCodeNotificationID];
    int v6 = (int)v5;
    uint64_t v7 = _AKLogSystem(v5);
    activeCode = (NSString *)objc_claimAutoreleasedReturnValue(v7);
    BOOL v9 = os_log_type_enabled((os_log_t)activeCode, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v9)
      {
        loginCodeNotificationID = self->_loginCodeNotificationID;
        int v13 = 138412290;
        id v14 = loginCodeNotificationID;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)activeCode,  OS_LOG_TYPE_DEFAULT,  "Will tear down current notification, with ID: %@",  (uint8_t *)&v13,  0xCu);
      }

      id v11 = self->_loginCodeNotificationID;
      self->_loginCodeNotificationID = 0LL;

      activeCode = self->_activeCode;
      self->_activeCode = 0LL;
    }

    else if (v9)
    {
      int v13 = 138412290;
      id v14 = (NSString *)v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)activeCode,  OS_LOG_TYPE_DEFAULT,  "Will tear down notification with ID: %@",  (uint8_t *)&v13,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_notificationsByPushID,  "objectForKeyedSubscript:",  v4));
    [v12 tearDown];
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_notificationsByPushID,  "setObject:forKeyedSubscript:",  0LL,  v4);
  }
}

- (void)_startPasswordResetFlowForAccount:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem(v4);
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will take user to password-reset flow in Settings for %@...",  buf,  0xCu);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager iCloudAccountForAltDSID:](self->_accountManager, "iCloudAccountForAltDSID:", v7));
  unsigned __int8 v9 = -[AKAppleIDPushHelperService _isPrimaryAccount:](self, "_isPrimaryAccount:", v4);
  uint64_t v10 = @"prefs:root=APPLE_ACCOUNT&aaaction=resetPassword";
  if ((v9 & 1) != 0
    || !v8
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]),
        uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"prefs:root=ACCOUNTS_AND_PASSWORDS&path=%@&aaaction=resetPassword",  v11)),  v11,  v10))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v10));
    uint64_t v13 = _AKLogSystem(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Using the following URL for iForgot redirect: %@",  buf,  0xCu);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v15 openSensitiveURL:v12 withOptions:0];
  }
}

- (void)_unsafe_showNotificationForMessage:(id)a3 account:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pushServiceQueue);
  if (-[AKAppleIDPushHelperService _canProceedWithArmingForMessage:account:]( self,  "_canProceedWithArmingForMessage:account:",  v8,  v9))
  {
    if ([v8 command] == (id)100)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"WALRUS_2FA_ARMING_NOTIFICATION_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
      [v8 setSecondaryTitleCDP:v12];

      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[AKDevice deviceSpecificLocalizedStringWithKey:]( &OBJC_CLASS___AKDevice,  "deviceSpecificLocalizedStringWithKey:",  @"WALRUS_2FA_ARMING_NOTIFICATION_BODY"));
      [v8 setSecondaryBodyCDP:v13];

      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"LOGIN_CODE_ALERT_MESSAGE_FOOTER_DEFAULT" value:&stru_1001D1450 table:@"Localizable"]);
      [v8 setSecondaryFooter:v15];

LABEL_6:
      goto LABEL_7;
    }

    if ([v8 command] == (id)2000)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"WALRUS_DIRECT_ARMING_NOTIFICATION_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
      [v8 setAlertTitle:v17];

      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[AKDevice deviceSpecificLocalizedStringWithKey:]( &OBJC_CLASS___AKDevice,  "deviceSpecificLocalizedStringWithKey:",  @"WALRUS_DIRECT_ARMING_NOTIFICATION_BODY"));
      [v8 setAlertBody:v18];

      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithIdentifier:]( &OBJC_CLASS___NSBundle,  "bundleWithIdentifier:",  @"com.apple.AuthKit"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"WALRUS_DIRECT_ARMING_NOTIFICATION_LOCKSCREEN_TITLE" value:&stru_1001D1450 table:@"Localizable"]);
      [v8 setLockScreenTitle:v20];

      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[AKDevice deviceSpecificLocalizedStringWithKey:]( &OBJC_CLASS___AKDevice,  "deviceSpecificLocalizedStringWithKey:",  @"WALRUS_DIRECT_ARMING_NOTIFICATION_LOCKSCREEN_BODY"));
      [v8 setLockScreenBody:v14];
      goto LABEL_6;
    }
  }

- (BOOL)_canProceedWithArmingForMessage:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 command] == (id)2000 || objc_msgSend(v6, "command") == (id)100)
  {
    BOOL v8 = -[AKAppleIDPushHelperService _isPrimaryAccount:](self, "_isPrimaryAccount:", v7);
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 walrusWebAccessInfo]);

      if (v9)
      {
        id v11 = +[AKCDPFactory isEligibleToArmDeviceForPCSAuth]( &OBJC_CLASS___AKCDPFactory,  "isEligibleToArmDeviceForPCSAuth");
        char v12 = (char)v11;
        uint64_t v13 = _AKLogSystem(v11);
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        if ((v12 & 1) != 0)
        {
          if (v15)
          {
            *(_WORD *)id v22 = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Push may proceed with PCS arming.",  v22,  2u);
          }

          BOOL v16 = 1;
          goto LABEL_18;
        }

        if (v15)
        {
          *(_WORD *)__int128 buf = 0;
          id v18 = "Account is ineligible, do not proceed with arming.";
          id v19 = buf;
          goto LABEL_16;
        }

- (BOOL)_isPrimaryAccount:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager altDSIDForAccount:](self->_accountManager, "altDSIDForAccount:", a3));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[AKAccountManager iCloudAccountForAltDSID:](self->_accountManager, "iCloudAccountForAltDSID:", v4));
  uint64_t v6 = _AKLogSystem(v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10013F774();
  }

  unsigned __int8 v8 = -[AKAccountManager isPrimaryiCloudAccount:]( self->_accountManager,  "isPrimaryiCloudAccount:",  v5);
  return v8;
}

- (id)_pushCommandsPostingCFUserNotification
{
  return +[NSArray arrayWithObjects:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:",  &off_1001D8E90,  &off_1001D8EA8,  &off_1001D8EC0,  &off_1001D8ED8,  &off_1001D8EF0,  0LL);
}

- (void)setEnableCriticalReliability:(BOOL)a3
{
}

- (NSString)activeCode
{
  return self->_activeCode;
}

- (void)setActiveCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end