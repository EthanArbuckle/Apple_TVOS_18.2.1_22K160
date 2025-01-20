@interface MSIOSMediaStreamDaemon
- (BOOL)isWaitingForAuth;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)mayDownloadPersonID:(id)a3;
- (MSIOSMediaStreamDaemon)init;
- (NSMutableDictionary)personIDToPowerBudgetMap;
- (NSMutableDictionary)personIDToPowerBudgetPersistedValuesMap;
- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3;
- (id)_powerBudgetForPersonID:(id)a3;
- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4;
- (void)MSPowerBudgetGotSignificantEvent:(id)a3;
- (void)_readPowerBudgetParametersForPersonID:(id)a3;
- (void)_serverSideConfigurationDidChange:(id)a3;
- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)deleteAssetCollections:(id)a3 personID:(id)a4;
- (void)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 reply:(id)a5;
- (void)didBeginForegroundFocusForPersonID:(id)a3;
- (void)didEndForegroundFocusForPersonID:(id)a3;
- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4;
- (void)didIdle;
- (void)didReceiveAuthenticationFailureForPersonID:(id)a3;
- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3;
- (void)didReceiveGlobalResetSyncForPersonID:(id)a3;
- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3;
- (void)didReceivePushNotificationForPersonID:(id)a3;
- (void)didUnidle;
- (void)enqueueAssetCollections:(id)a3 personID:(id)a4 reply:(id)a5;
- (void)forgetEverythingForPersonID:(id)a3;
- (void)pauseForUUID:(id)a3;
- (void)pauseManagerDidPause:(id)a3;
- (void)pauseManagerDidUnpause:(id)a3;
- (void)resetServerStateForPersonID:(id)a3;
- (void)serverSideConfigurationForPersonID:(id)a3 reply:(id)a4;
- (void)setPersonIDToPowerBudgetMap:(id)a3;
- (void)setPersonIDToPowerBudgetPersistedValuesMap:(id)a3;
- (void)start;
- (void)stop;
- (void)unpauseForUUID:(id)a3;
@end

@implementation MSIOSMediaStreamDaemon

- (MSIOSMediaStreamDaemon)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MSIOSMediaStreamDaemon;
  v2 = -[MSIOSMediaStreamDaemon init](&v16, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", kMSMachServiceName);
    center = v2->_center;
    v2->_center = v4;

    -[NSXPCListener setDelegate:](v2->_center, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_center, "resume");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSPauseManager sharedManager](&OBJC_CLASS___MSPauseManager, "sharedManager"));
    [v6 setDelegate:v2];

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    uint64_t v8 = kMSBatteryPowerMonitorExternalPowerSourceChangedNotification;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100008EC4;
    v14[3] = &unk_100018AD8;
    v10 = v2;
    v15 = v10;
    id v11 = [v7 addObserverForName:v8 object:0 queue:v9 usingBlock:v14];

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v12 addObserver:v10 selector:"_serverSideConfigurationDidChange:" name:kMSServerSideConfigChangedNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPauseManager sharedManager](&OBJC_CLASS___MSPauseManager, "sharedManager"));
  [v3 setDelegate:0];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSIOSMediaStreamDaemon;
  -[MSIOSMediaStreamDaemon dealloc](&v4, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.mediastream.mstreamd-access"]);
  v7 = v6;
  if (v6 && [v6 BOOLValue])
  {
    [v5 setExportedObject:self];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MSDaemonProtocols));
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___MSAssetCollection);
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___MSAsset);
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDate);
    uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSURL);
    objc_super v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v20,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v8 setClasses:v17 forSelector:"enqueueAssetCollections:personID:reply:" argumentIndex:0 ofReply:0];
    [v8 setClasses:v17 forSelector:"dequeueAssetCollectionWithGUIDs:personID:reply:" argumentIndex:0 ofReply:0];
    [v8 setClasses:v17 forSelector:"deleteAssetCollections:personID:" argumentIndex:0 ofReply:0];
    [v5 setExportedInterface:v8];
    [v5 _setQueue:&_dispatch_main_q];
    [v5 resume];

    BOOL v18 = 1;
  }

  else
  {
    BOOL v18 = 0;
  }

  return v18;
}

- (void)didIdle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPowerAssertionManager sharedManager](&OBJC_CLASS___MSPowerAssertionManager, "sharedManager"));
  [v3 releaseBusy];
  [v3 toggleAssertion];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSIOSMediaStreamDaemon;
  -[MSIOSMediaStreamDaemon didIdle](&v4, "didIdle");
}

- (void)didUnidle
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPowerAssertionManager sharedManager](&OBJC_CLASS___MSPowerAssertionManager, "sharedManager"));
  [v3 retainBusy];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSIOSMediaStreamDaemon;
  -[MSIOSMediaStreamDaemon didUnidle](&v4, "didUnidle");
}

- (void)start
{
  v3 = objc_alloc(&OBJC_CLASS___APSConnection);
  objc_super v4 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v3,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentProduction,  @"com.apple.mediastream.mstreamd.push-prod",  &_dispatch_main_q);
  p_prodAPSConnection = &self->_prodAPSConnection;
  prodAPSConnection = self->_prodAPSConnection;
  self->_prodAPSConnection = v4;

  v7 = objc_alloc(&OBJC_CLASS___APSConnection);
  uint64_t v8 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v7,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentDevelopment,  @"com.apple.mediastream.mstreamd.push-dev",  &_dispatch_main_q);
  devAPSConnection = self->_devAPSConnection;
  self->_devAPSConnection = v8;

  __int16 v32 = 0;
  -[MSIOSMediaStreamDaemon _updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:]( self,  "_updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:",  (char *)&v32 + 1,  &v32);
  if (HIBYTE(v32) || (p_prodAPSConnection = &self->_devAPSConnection, (_BYTE)v32))
  {
    uint64_t v10 = *p_prodAPSConnection;
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v34 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Created APS connection %{public}@",  buf,  0xCu);
      }

      -[APSConnection setDelegate:](v10, "setDelegate:", self);
      v35 = @"com.apple.mediastream.subscription.push";
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
      -[APSConnection _setEnabledTopics:](v10, "_setEnabledTopics:", v11);

      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](v10, "publicToken"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSMSPlatform thePlatform](&OBJC_CLASS___MSMSPlatform, "thePlatform"));
      [v13 setPushToken:v12];

      if (v12)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)v34 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Retrieved push tokens %{public}@.",  buf,  0xCu);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v34 = v32;
          *(_WORD *)&v34[4] = 1024;
          *(_DWORD *)&v34[6] = HIBYTE(v32);
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Push tokens not available. Dev: %d, Prod: %d. Waiting...",  buf,  0xEu);
        }

        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  5.0));
        while (1)
        {
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSMSPlatform thePlatform](&OBJC_CLASS___MSMSPlatform, "thePlatform"));
          objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v15 pushToken]);
          if (v16) {
            break;
          }
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v17 timeIntervalSinceDate:v14];
          double v19 = v18;

          if (v19 < 0.0)
          {
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
            unsigned __int8 v21 = [v20 runMode:NSDefaultRunLoopMode beforeDate:v14];

            if ((v21 & 1) != 0) {
              continue;
            }
          }

          goto LABEL_20;
        }

LABEL_20:
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSMSPlatform thePlatform](&OBJC_CLASS___MSMSPlatform, "thePlatform"));
        v23 = (void *)objc_claimAutoreleasedReturnValue([v22 pushToken]);

        if (v23)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            if (HIBYTE(v32)) {
              v24 = @"Prod";
            }
            else {
              v24 = @"Dev";
            }
            *(_DWORD *)buf = 138543362;
            *(void *)v34 = v24;
            _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Retrieved push tokens. %{public}@",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Could not retrieve push token even after waiting for it.",  buf,  2u);
        }
      }
    }
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "My Photo stream not enabled, not listening to any push notifications.",  buf,  2u);
    }

    uint64_t v10 = 0LL;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  uint64_t v26 = kMSAuthenticationManagerDidReceiveAuthenticationChangeNotification;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100008E94;
  v31[3] = &unk_100018AD8;
  v31[4] = self;
  id v29 = [v25 addObserverForName:v26 object:v27 queue:v28 usingBlock:v31];

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MSIOSMediaStreamDaemon;
  -[MSIOSMediaStreamDaemon start](&v30, "start");
  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSIOSMediaStreamDaemon;
  -[MSIOSMediaStreamDaemon stop](&v4, "stop");
}

- (void)enqueueAssetCollections:(id)a3 personID:(id)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  id v15 = 0LL;
  id v11 = -[MSIOSMediaStreamDaemon enqueueAssetCollection:personID:outError:]( self,  "enqueueAssetCollection:personID:outError:",  v10,  v9,  &v15);

  id v12 = v15;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v13,  kMSCXPCReplyRetval));

  if (v12) {
    [v14 setObject:v12 forKey:kMSCXPCReplyError];
  }
  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
  v8[2](v8, v14);
}

- (void)dequeueAssetCollectionWithGUIDs:(id)a3 personID:(id)a4 reply:(id)a5
{
  uint64_t v8 = (void (**)(id, void *))a5;
  id v9 = a4;
  id v10 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  id v15 = 0LL;
  id v11 = -[MSIOSMediaStreamDaemon dequeueAssetCollectionWithGUIDs:personID:outError:]( self,  "dequeueAssetCollectionWithGUIDs:personID:outError:",  v10,  v9,  &v15);

  id v12 = v15;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v11));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithObject:forKey:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithObject:forKey:",  v13,  kMSCXPCReplyRetval));

  if (v12) {
    [v14 setObject:v12 forKey:kMSCXPCReplyError];
  }
  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
  v8[2](v8, v14);
}

- (void)deleteAssetCollections:(id)a3 personID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  -[MSIOSMediaStreamDaemon deleteAssetCollections:forPersonID:](self, "deleteAssetCollections:forPersonID:", v7, v6);

  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4
{
  uint64_t v7 = MSPlatform(self);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = [v8 subscriberPluginClass];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 personIDForPollingTriggeredByPushNotification]);
  if ([v10 length])
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      int v16 = 138412290;
      v17 = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "personID waiting for push: %@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v12 = MSPlatform(v11);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    unsigned __int8 v14 = [v13 personIDUsesProductionPushEnvironment:v10];
    char v15 = v14 ^ 1;

    if (a4) {
LABEL_5:
    }
      *a4 = v15;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "The subscription plugin class does not support push notification refreshing.",  (uint8_t *)&v16,  2u);
    }

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Not listening to push notifications.",  (uint8_t *)&v16,  2u);
    }

    -[APSConnection _setEnabledTopics:](self->_prodAPSConnection, "_setEnabledTopics:", 0LL);
    -[APSConnection _setEnabledTopics:](self->_devAPSConnection, "_setEnabledTopics:", 0LL);
    char v15 = 0;
    unsigned __int8 v14 = 0;
    if (a4) {
      goto LABEL_5;
    }
  }

  if (a3) {
    *a3 = v14;
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received new push token.",  v7,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSMSPlatform thePlatform](&OBJC_CLASS___MSMSPlatform, "thePlatform"));
  [v6 setPushToken:v5];

  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  id v6 = (MSIOSMediaStreamDaemon *)objc_claimAutoreleasedReturnValue([v5 topic]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    uint64_t v12 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received push notification for invitations topic: %@ userInfo: %@",  (uint8_t *)&v9,  0x16u);
  }

  if (-[MSIOSMediaStreamDaemon isEqualToString:]( v6,  "isEqualToString:",  @"com.apple.mediastream.subscription.push"))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"r"]);
    -[MSIOSMediaStreamDaemon pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:]( self,  "pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:",  v8);
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Received unknown push notification, ignoring",  (uint8_t *)&v9,  0xCu);
  }

  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)serverSideConfigurationForPersonID:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  id v7 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  id v9 = (id)objc_claimAutoreleasedReturnValue( -[MSIOSMediaStreamDaemon serverSideConfigurationForPersonID:]( self,  "serverSideConfigurationForPersonID:",  v7));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v9,  kMSCXPCReplyRetval,  0LL));
  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
  v6[2](v6, v8);
}

- (void)didReceiveNewServerSideConfigurationForPersonID:(id)a3
{
}

- (void)resetServerStateForPersonID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MSPlatform(-[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 baseURLForPersonID:v4]);
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[MSResetServer resetServerObjectWithPersonID:baseURL:]( &OBJC_CLASS___MSResetServer,  "resetServerObjectWithPersonID:baseURL:",  v4,  v7));

  [v8 setDaemon:self];
  [v8 resetServer];
  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)pauseForUUID:(id)a3
{
  id v4 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPauseManager sharedManager](&OBJC_CLASS___MSPauseManager, "sharedManager"));
  [v5 pingPauseUUID:v4];

  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)unpauseForUUID:(id)a3
{
  id v4 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSPauseManager sharedManager](&OBJC_CLASS___MSPauseManager, "sharedManager"));
  [v5 unpauseUUID:v4];

  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)forgetEverythingForPersonID:(id)a3
{
  id v7 = a3;
  -[MSIOSMediaStreamDaemon retainBusy](self, "retainBusy");
  if (v7)
  {
    -[MSIOSMediaStreamDaemon forgetPersonID:](self, "forgetPersonID:", v7);
    -[MSIOSMediaStreamDaemon _updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:]( self,  "_updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:",  0LL,  0LL);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon personIDToPowerBudgetMap](self, "personIDToPowerBudgetMap"));
    [v4 removeObjectForKey:v7];

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSMediaStreamDaemon personIDToPowerBudgetPersistedValuesMap]( self,  "personIDToPowerBudgetPersistedValuesMap"));
    [v5 removeObjectForKey:v7];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  [v6 rearmAuthenticationAlert];

  -[MSIOSMediaStreamDaemon releaseBusy](self, "releaseBusy");
}

- (void)didReceiveAuthenticationFailureForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  [v4 didEncounterAuthenticationFailureForPersonID:v3];
}

- (void)didReceiveAuthenticationSuccessForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  [v4 didEncounterAuthenticationSuccessForPersonID:v3];
}

- (BOOL)isWaitingForAuth
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  unsigned __int8 v3 = [v2 isWaitingForAuth];

  return v3;
}

- (void)pauseManagerDidPause:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Paused.", v4, 2u);
  }

  -[MSIOSMediaStreamDaemon stopAllActivities](self, "stopAllActivities");
}

- (void)pauseManagerDidUnpause:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unpaused.", v4, 2u);
  }

  -[MSIOSMediaStreamDaemon retryOutstandingActivities](self, "retryOutstandingActivities");
}

- (void)didExceedPublishQuotaForPersonID:(id)a3 retryDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v7 timeIntervalSinceNow];
  LODWORD(v4) = vcvtpd_s64_f64(v8 / 86400.0);
  if ((int)v4 > 1)
  {
    uint64_t v9 = MSMSLocalizedString(@"QUOTA_BODY_PLURAL");
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v4));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v10,  @"%@",  0LL,  v11));

    uint64_t v12 = MSMSLocalizedString(@"QUOTA_TITLE");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = MSMSLocalizedString(@"QUOTA_OK_BUTTON");
    char v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    int v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    double v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjectsAndKeys:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjectsAndKeys:",  v13,  kCFUserNotificationAlertHeaderKey,  v20,  kCFUserNotificationAlertMessageKey,  v15,  kCFUserNotificationDefaultButtonTitleKey,  v16,  kCFUserNotificationAlertTopMostKey,  v17,  SBUserNotificationDontDismissOnUnlock,  0LL));

    double v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSAlertManager sharedAlertManager](&OBJC_CLASS___MSAlertManager, "sharedAlertManager"));
    [v19 displayAlertForPersonID:v6 notificationDict:v18 completionBlock:0];
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Received quota excess failure for person ID %@. Next retry date: %{public}@",  buf,  0x16u);
  }
}

- (NSMutableDictionary)personIDToPowerBudgetMap
{
  personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  if (!personIDToPowerBudgetMap)
  {
    uint64_t v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    uint64_t v5 = self->_personIDToPowerBudgetMap;
    self->_personIDToPowerBudgetMap = v4;

    personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  }

  return personIDToPowerBudgetMap;
}

- (void)_readPowerBudgetParametersForPersonID:(id)a3
{
  id v5 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:"));
  if (v4)
  {
    +[MSServerSideConfigManager doubleValueForParameter:forPersonID:defaultValue:]( &OBJC_CLASS___MSServerSideConfigManager,  "doubleValueForParameter:forPersonID:defaultValue:",  kMSSSCKMaxActiveTimeAfterPush,  v5,  60.0);
    objc_msgSend(v4, "setMaxActiveTimeAfterPush:");
    +[MSServerSideConfigManager doubleValueForParameter:forPersonID:defaultValue:]( &OBJC_CLASS___MSServerSideConfigManager,  "doubleValueForParameter:forPersonID:defaultValue:",  kMSSSCKMaxActiveTimeAfterLossOfForeground,  v5,  600.0);
    objc_msgSend(v4, "setMaxActiveTimeAfterLossOfForeground:");
    +[MSServerSideConfigManager doubleValueForParameter:forPersonID:defaultValue:]( &OBJC_CLASS___MSServerSideConfigManager,  "doubleValueForParameter:forPersonID:defaultValue:",  kMSSSCKMaxActiveTimeAfterGlobalResetSync,  v5,  1800.0);
    objc_msgSend(v4, "setMaxActiveTimeAfterGlobalResetSync:");
  }
}

- (id)_powerBudgetForPersonID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon personIDToPowerBudgetMap](self, "personIDToPowerBudgetMap"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543618;
        __int16 v11 = self;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Creating power budget object for person ID %@",  (uint8_t *)&v10,  0x16u);
      }

      id v6 = objc_alloc_init(&OBJC_CLASS___MSPowerBudget);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon personIDToPowerBudgetMap](self, "personIDToPowerBudgetMap"));
      [v7 setObject:v6 forKey:v4];

      [v6 setPersonID:v4];
      [v6 setDelegate:self];
      -[MSIOSMediaStreamDaemon _readPowerBudgetParametersForPersonID:]( self,  "_readPowerBudgetParametersForPersonID:",  v4);
      double v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSBatteryPowerMonitor defaultMonitor](&OBJC_CLASS___MSBatteryPowerMonitor, "defaultMonitor"));
      LODWORD(v7) = [v8 isExternalPowerConnected];

      if ((_DWORD)v7) {
        [v6 didBeginExternalPower];
      }
    }
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (NSMutableDictionary)personIDToPowerBudgetPersistedValuesMap
{
  personIDToPowerBudgetPersistedValuesMap = self->_personIDToPowerBudgetPersistedValuesMap;
  if (!personIDToPowerBudgetPersistedValuesMap)
  {
    id v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v5 = self->_personIDToPowerBudgetPersistedValuesMap;
    self->_personIDToPowerBudgetPersistedValuesMap = v4;

    personIDToPowerBudgetPersistedValuesMap = self->_personIDToPowerBudgetPersistedValuesMap;
  }

  return personIDToPowerBudgetPersistedValuesMap;
}

- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSMediaStreamDaemon personIDToPowerBudgetPersistedValuesMap]( self,  "personIDToPowerBudgetPersistedValuesMap"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 personID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v6]);

  if (!v7)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v4 personID]);
    id v9 = sub_100008D9C(v8);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    id v15 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver MSSafeUnarchiveObjectWithFile:outError:]( &OBJC_CLASS___NSKeyedUnarchiver,  "MSSafeUnarchiveObjectWithFile:outError:",  v10,  &v15));
    id v11 = v15;

    if (v7)
    {
      __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSMediaStreamDaemon personIDToPowerBudgetPersistedValuesMap]( self,  "personIDToPowerBudgetPersistedValuesMap"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v4 personID]);
      [v12 setObject:v7 forKey:v13];
    }

    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to unarchive persisted power budget values: %@",  buf,  0xCu);
    }
  }

  return v7;
}

- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSMediaStreamDaemon personIDToPowerBudgetPersistedValuesMap]( self,  "personIDToPowerBudgetPersistedValuesMap"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 personID]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v9]);

  if (v10 && ([v10 isEqualToDictionary:v7] & 1) != 0)
  {
    id v11 = v10;
  }

  else
  {
    id v11 = v7;

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSMediaStreamDaemon personIDToPowerBudgetPersistedValuesMap]( self,  "personIDToPowerBudgetPersistedValuesMap"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 personID]);
    if (v11)
    {
      [v12 setObject:v11 forKey:v13];

      id v26 = 0LL;
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v11,  1LL,  &v26));
      id v15 = v26;
      if (v14)
      {
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v6 personID]);
        id v17 = sub_100008D9C(v16);
        double v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        id v25 = v15;
        unsigned __int8 v19 = [v14 writeToFile:v18 options:1 error:&v25];
        id v20 = v25;

        if ((v19 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v28 = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to save persisted power budget for personID values: %@",  buf,  0xCu);
        }

        id v15 = v20;
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Unable to archive persisted power budget for personID values: %@",  buf,  0xCu);
      }
    }

    else
    {
      [v12 removeObjectForKey:v13];

      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 personID]);
      id v23 = sub_100008D9C(v22);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      [v21 removeItemAtPath:v24 error:0];

      id v11 = 0LL;
    }
  }
}

- (void)MSPowerBudgetGotSignificantEvent:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008D6C;
  block[3] = &unk_100018C30;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_serverSideConfigurationDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread mainThread](&OBJC_CLASS___NSThread, "mainThread"));

  if (v5 == v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

    id v4 = (id)objc_claimAutoreleasedReturnValue([v7 objectForKey:kMSSSCCNPersonIDKey]);
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v9 = 138412546;
        *(void *)&v9[4] = objc_opt_class(self);
        *(_WORD *)&v9[12] = 2112;
        *(void *)&v9[14] = v4;
        id v8 = *(id *)&v9[4];
        _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%@ Server-side configuration has changed for personID %@. Reading new values.",  v9,  0x16u);
      }

      -[MSIOSMediaStreamDaemon _readPowerBudgetParametersForPersonID:]( self,  "_readPowerBudgetParametersForPersonID:",  v4,  *(_OWORD *)v9,  *(void *)&v9[16]);
    }
  }

  else
  {
    -[MSIOSMediaStreamDaemon performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_serverSideConfigurationDidChange:",  v4,  0LL);
  }
}

- (void)didReceiveGlobalResetSyncForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:", a3));
  [v3 didReceiveGlobalResetSync];
}

- (void)didBeginForegroundFocusForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:", a3));
  [v3 didBeginForegroundFocus];
}

- (void)didEndForegroundFocusForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:", a3));
  [v3 didEndForegroundFocus];
}

- (void)didReceivePushNotificationForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:", a3));
  [v3 didReceivePushNotification];
}

- (BOOL)mayDownloadPersonID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSMediaStreamDaemon _powerBudgetForPersonID:](self, "_powerBudgetForPersonID:", a3));
  unsigned __int8 v4 = [v3 isFileTransferAllowed];

  return v4;
}

- (void)setPersonIDToPowerBudgetPersistedValuesMap:(id)a3
{
}

- (void)setPersonIDToPowerBudgetMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end