@interface CPLCloudKitPushNotificationCenter
- (BOOL)clientIsForeground;
- (CPLCloudKitCoordinator)delegate;
- (CPLCloudKitPushNotificationCenter)init;
- (OS_dispatch_queue)queue;
- (void)_setPushRegistrationStatus:(id)a3 error:(id)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)setClientIsForeground:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)startWaitingForPushNotificationsForContainer:(id)a3;
- (void)stopWaitingForPushNotifications;
- (void)unregisterFromPushNotifications;
@end

@implementation CPLCloudKitPushNotificationCenter

- (CPLCloudKitPushNotificationCenter)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CPLCloudKitPushNotificationCenter;
  v2 = -[CPLCloudKitPushNotificationCenter init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    pushRegistrationStatus = v2->_pushRegistrationStatus;
    v2->_pushRegistrationStatus = (NSString *)@"not registered";
  }

  return v3;
}

- (void)setClientIsForeground:(BOOL)a3
{
  if (self->_clientIsForeground != a3)
  {
    self->_clientIsForeground = a3;
    pushConnection = self->_pushConnection;
    if (a3)
    {
      if (pushConnection && self->_pushEnvironment)
      {
        if (!_CPLSilentLogging)
        {
          id v5 = sub_100002EB4();
          objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray componentsJoinedByString:]( self->_pushTopics,  "componentsJoinedByString:",  @", "));
            int v13 = 138412290;
            v14 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "Marking topics %@ as fully enabled",  (uint8_t *)&v13,  0xCu);
          }

          pushConnection = self->_pushConnection;
        }

        pushTopics = self->_pushTopics;
        v9 = 0LL;
LABEL_17:
        -[APSConnection setEnabledTopics:ignoredTopics:opportunisticTopics:]( pushConnection,  "setEnabledTopics:ignoredTopics:opportunisticTopics:",  pushTopics,  0LL,  v9);
      }
    }

    else if (pushConnection && self->_pushEnvironment)
    {
      if (!_CPLSilentLogging)
      {
        id v10 = sub_100002EB4();
        v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue( -[NSArray componentsJoinedByString:]( self->_pushTopics,  "componentsJoinedByString:",  @", "));
          int v13 = 138412290;
          v14 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Marking topics %@ as opportunistic",  (uint8_t *)&v13,  0xCu);
        }

        pushConnection = self->_pushConnection;
      }

      v9 = self->_pushTopics;
      pushTopics = 0LL;
      goto LABEL_17;
    }
  }

- (void)startWaitingForPushNotificationsForContainer:(id)a3
{
  self->_stoppedWaitingForPush = 0;
  id v5 = a3;
  -[CPLCloudKitPushNotificationCenter _setPushRegistrationStatus:error:]( self,  "_setPushRegistrationStatus:error:",  @"registering",  0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100002F84;
  v6[3] = &unk_10023DAC0;
  v6[4] = self;
  v6[5] = a2;
  [v5 serverPreferredPushEnvironmentWithCompletionHandler:v6];
}

- (void)stopWaitingForPushNotifications
{
  self->_stoppedWaitingForPush = 1;
  pushConnection = self->_pushConnection;
  if (pushConnection)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = sub_100002EB4();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Stop waiting for push notifications",  v9,  2u);
      }

      pushConnection = self->_pushConnection;
    }

    -[APSConnection _setEnabledTopics:](pushConnection, "_setEnabledTopics:", &__NSArray0__struct);
    -[APSConnection shutdown](self->_pushConnection, "shutdown");
    self->_ignorePushNotifications = 0;
    objc_super v6 = self->_pushConnection;
    self->_pushConnection = 0LL;

    pushTopics = self->_pushTopics;
    self->_pushTopics = 0LL;

    pushEnvironment = self->_pushEnvironment;
    self->_pushEnvironment = 0LL;

    -[CPLCloudKitPushNotificationCenter _setPushRegistrationStatus:error:]( self,  "_setPushRegistrationStatus:error:",  @"stopped",  0LL);
  }

- (void)unregisterFromPushNotifications
{
  v3 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( objc_alloc(&OBJC_CLASS___APSConnection),  "initWithEnvironmentName:namedDelegatePort:queue:",  self->_pushEnvironment,  @"com.apple.photos.cloud.pushnotification",  self->_queue);
  pushConnection = self->_pushConnection;
  self->_pushConnection = v3;

  -[APSConnection setDelegate:](self->_pushConnection, "setDelegate:", self);
  -[APSConnection _setEnabledTopics:](self->_pushConnection, "_setEnabledTopics:", &__NSArray0__struct);
  self->_ignorePushNotifications = 1;
  -[CPLCloudKitPushNotificationCenter stopWaitingForPushNotifications](self, "stopWaitingForPushNotifications");
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  objc_super v6 = (APSConnection *)a3;
  id v7 = a4;
  if (self->_pushConnection == v6 && _CPLSilentLogging == 0)
  {
    id v9 = sub_100002EB4();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412546;
      id v12 = v7;
      __int16 v13 = 2112;
      v14 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Receive public token %@ for APSConnection %@",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  objc_super v6 = (APSConnection *)a3;
  id v7 = a4;
  v8 = v7;
  if (self->_ignorePushNotifications)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_100002EB4();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 topic]);
        int v38 = 138412290;
        v39 = v11;
        id v12 = "Received unexpected push notification for %@";
        __int16 v13 = v10;
        os_log_type_t v14 = OS_LOG_TYPE_ERROR;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v38, 0xCu);
LABEL_36:

        goto LABEL_37;
      }

      goto LABEL_37;
    }

    goto LABEL_38;
  }

  if (self->_pushConnection == v6)
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 topic]);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
    if (!_CPLSilentLogging)
    {
      id v16 = sub_100002EB4();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        int v38 = 138412802;
        v39 = v10;
        __int16 v40 = 2112;
        v41 = (os_log_s *)v11;
        __int16 v42 = 2112;
        v43 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "Received incoming message for topic %@ info %@ for APSConnection %@",  (uint8_t *)&v38,  0x20u);
      }
    }

    v18 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    lastPushNotificationDate = self->_lastPushNotificationDate;
    self->_lastPushNotificationDate = v18;

    v20 = (NSString *)objc_claimAutoreleasedReturnValue([v8 topic]);
    lastPushTopic = self->_lastPushTopic;
    self->_lastPushTopic = v20;

    if (self->_lastStartOfPushNotificationBurst
      && (-[NSDate timeIntervalSinceDate:](self->_lastPushNotificationDate, "timeIntervalSinceDate:"), v22 <= 10.0)
      && (id)-[NSDate compare:](self->_lastStartOfPushNotificationBurst, "compare:", self->_lastPushNotificationDate) != (id)1)
    {
      unint64_t v23 = self->_countOfPushNotificationBurst + 1;
    }

    else
    {
      objc_storeStrong((id *)&self->_lastStartOfPushNotificationBurst, self->_lastPushNotificationDate);
      unint64_t v23 = 1LL;
    }

    self->_countOfPushNotificationBurst = v23;
    lastPushNotification = self->_lastPushNotification;
    self->_lastPushNotification = 0LL;

    if (v11)
    {
      v25 = (CKNotification *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v11));
      v26 = self->_lastPushNotification;
      self->_lastPushNotification = v25;
    }

    v27 = self->_lastPushNotification;
    if (v27)
    {
      v28 = (objc_class *)objc_opt_class(v27);
      v29 = NSStringFromClass(v28);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue(v29);
      if (!v10) {
        goto LABEL_31;
      }
    }

    else
    {
      v30 = @"push notification of unknown kind";
      if (!v10) {
        goto LABEL_31;
      }
    }

    if (-[NSArray containsObject:](self->_pushTopics, "containsObject:", v10))
    {
      if (!_CPLSilentLogging)
      {
        id v31 = sub_100002EB4();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
          int v38 = 138412546;
          v39 = v30;
          __int16 v40 = 2112;
          v41 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Received %@ %@", (uint8_t *)&v38, 0x16u);
        }
      }

      if (self->_lastPushNotification)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained center:self didReceivePushNotification:self->_lastPushNotification];
      }

      else
      {
        if (_CPLSilentLogging) {
          goto LABEL_35;
        }
        id v36 = sub_100002EB4();
        id WeakRetained = (id)objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled((os_log_t)WeakRetained, OS_LOG_TYPE_ERROR))
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue([v8 userInfo]);
          int v38 = 138412290;
          v39 = v37;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)WeakRetained,  OS_LOG_TYPE_ERROR,  "Invalid CloudKit push notification %@",  (uint8_t *)&v38,  0xCu);
        }
      }

      goto LABEL_34;
    }

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10 = (APSConnection *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_pushConnection == v10 && _CPLSilentLogging == 0)
  {
    id v15 = sub_100002EB4();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 138413058;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = v13;
      __int16 v23 = 2112;
      v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Received token %@ for topic %@ with identifier %@ for APSConnection %@",  (uint8_t *)&v17,  0x2Au);
    }
  }
}

- (void)_setPushRegistrationStatus:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = (NSString *)[a3 copy];
  pushRegistrationStatus = self->_pushRegistrationStatus;
  self->_pushRegistrationStatus = v7;

  id v9 = (NSString *)[v6 copy];
  pushRegistrationError = self->_pushRegistrationError;
  self->_pushRegistrationError = v9;
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003D94;
  v7[3] = &unk_10023DB38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained getLastClientServedWithAPushNotificationWithCompletionHandler:v7];
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004440;
  v7[3] = &unk_10023DB38;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [WeakRetained getLastClientServedWithAPushNotificationWithCompletionHandler:v7];
}

- (CPLCloudKitCoordinator)delegate
{
  return (CPLCloudKitCoordinator *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BOOL)clientIsForeground
{
  return self->_clientIsForeground;
}

- (void).cxx_destruct
{
}

@end