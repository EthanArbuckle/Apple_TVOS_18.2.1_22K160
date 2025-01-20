@interface MSIOSAlbumSharingDaemon
- (APSConnection)devAPSConnection;
- (APSConnection)prodAPSConnection;
- (BOOL)XPCNSServiceListener:(id)a3 shouldReceiveNewConnection:(id)a4;
- (BOOL)isPersonIDAllowedToDownloadAssets:(id)a3;
- (BOOL)isWaitingForAuth;
- (IDSService)idsService;
- (MSIOSAlbumSharingDaemon)init;
- (NSDictionary)powerBudgetPersistedParameters;
- (NSMutableDictionary)personIDToPowerBudgetMap;
- (NSTimer)busyPingTimer;
- (XPCNSServiceListener)serviceListener;
- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3;
- (id)powerBudgetForPersonID:(id)a3;
- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4;
- (void)XPCNSServiceListener:(id)a3 didReceiveNewConnection:(id)a4;
- (void)_busyPingTimerDidExpire:(id)a3;
- (void)_readPowerBudgetParametersForPersonID:(id)a3;
- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)didBeginForegroundFocusForPersonID:(id)a3;
- (void)didDestroyStateMachineForPersonID:(id)a3;
- (void)didEndForegroundFocusForPersonID:(id)a3;
- (void)didIdle;
- (void)didReceiveAuthFailureForPersonID:(id)a3;
- (void)didReceiveAuthSuccessForPersonID:(id)a3;
- (void)didReceiveGlobalResetSyncForPersonID:(id)a3;
- (void)didReceivePushNotificationForPersonID:(id)a3;
- (void)didUnidle;
- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4;
- (void)forgetEverythingCompletionBlock:(id)a3;
- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6;
- (void)setBusyPingTimer:(id)a3;
- (void)setDevAPSConnection:(id)a3;
- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4;
- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4;
- (void)setIdsService:(id)a3;
- (void)setPersonIDToPowerBudgetMap:(id)a3;
- (void)setPowerBudgetPersistedParameters:(id)a3;
- (void)setProdAPSConnection:(id)a3;
- (void)setServiceListener:(id)a3;
- (void)shutDownCompletionBlock:(id)a3;
- (void)stabilizedDidIdle;
- (void)stabilizedDidUnidle;
- (void)start;
@end

@implementation MSIOSAlbumSharingDaemon

- (MSIOSAlbumSharingDaemon)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  v2 = -[MSIOSAlbumSharingDaemon init](&v7, "init");
  if (v2)
  {
    v3 = -[IDSService initWithService:]( objc_alloc(&OBJC_CLASS___IDSService),  "initWithService:",  @"com.apple.private.alloy.photostream");
    idsService = v2->_idsService;
    v2->_idsService = v3;

    -[IDSService addDelegate:queue:](v2->_idsService, "addDelegate:queue:", v2, &_dispatch_main_q);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](v2->_idsService, "accounts"));
      *(_DWORD *)buf = 138412290;
      v9 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Registered IDS service for %@",  buf,  0xCu);
    }
  }

  return v2;
}

- (void)start
{
  if (!self->_serviceListener)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Shared Streams daemon starting.",  buf,  2u);
    }

    v3 = objc_alloc(&OBJC_CLASS___XPCNSServiceListener);
    v4 = -[XPCNSServiceListener initWithServiceName:queue:delegate:]( v3,  "initWithServiceName:queue:delegate:",  kMSASServiceName,  &_dispatch_main_q,  self);
    serviceListener = self->_serviceListener;
    self->_serviceListener = v4;

    -[XPCNSServiceListener start](self->_serviceListener, "start");
  }

  v6 = objc_alloc(&OBJC_CLASS___APSConnection);
  objc_super v7 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v6,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentProduction,  @"com.apple.mediastream.mstreamd.sharing.push-prod",  &_dispatch_main_q);
  prodAPSConnection = self->_prodAPSConnection;
  self->_prodAPSConnection = v7;

  v9 = objc_alloc(&OBJC_CLASS___APSConnection);
  v10 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v9,  "initWithEnvironmentName:namedDelegatePort:queue:",  APSEnvironmentDevelopment,  @"com.apple.mediastream.mstreamd.sharing.push-dev",  &_dispatch_main_q);
  devAPSConnection = self->_devAPSConnection;
  self->_devAPSConnection = v10;

  __int16 v49 = 0;
  -[MSIOSAlbumSharingDaemon _updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:]( self,  "_updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:",  (char *)&v49 + 1,  &v49);
  if (HIBYTE(v49))
  {
    v12 = self->_prodAPSConnection;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138543362;
    v51 = self;
    v13 = "%{public}@: Listening to prod push notifications.";
    goto LABEL_11;
  }

  if ((_BYTE)v49)
  {
    v12 = self->_devAPSConnection;
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138543362;
    v51 = self;
    v13 = "%{public}@: Listening to dev push notifications.";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v13, buf, 0xCu);
LABEL_12:
    if (v12)
    {
      -[APSConnection setDelegate:](v12, "setDelegate:", self);
      v54[0] = @"com.apple.sharedstreams";
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(@"com.apple.icloud-container.", "stringByAppendingString:"));
      v54[1] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
      -[APSConnection _setEnabledTopics:](v12, "_setEnabledTopics:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSConnection publicToken](v12, "publicToken"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSMSPlatform thePlatform](&OBJC_CLASS___MSMSPlatform, "thePlatform"));
      [v17 setPushToken:v16];

      if (v16)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          v18 = @"Prod";
          if (!HIBYTE(v49)) {
            v18 = @"Dev";
          }
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2114;
          v53 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Retrieved push tokens. %{public}@",  buf,  0x16u);
        }
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v19 = @"Prod";
          if (!HIBYTE(v49)) {
            v19 = @"Dev";
          }
          *(_DWORD *)buf = 138543618;
          v51 = self;
          __int16 v52 = 2112;
          v53 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "%{public}@: Push tokens not available. %@. Waiting...",  buf,  0x16u);
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  5.0));
        do
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
          [v21 timeIntervalSinceDate:v20];
          BOOL v23 = v22 < 0.0;

          if (!v23) {
            break;
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
          unsigned __int8 v25 = [v24 runMode:NSDefaultRunLoopMode beforeDate:v20];
        }

        while ((v25 & 1) != 0);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v51 = self;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Could not retrieve push token even after waiting for it.",  buf,  0xCu);
        }
      }
    }

    goto LABEL_32;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Shared stream not enabled, not listening to any push notifications.",  buf,  2u);
  }

  v12 = 0LL;
LABEL_32:
  objc_initWeak((id *)buf, self);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_10000F688;
  v47[3] = &unk_100018AB0;
  objc_copyWeak(&v48, (id *)buf);
  id v28 =  [v26 addObserverForName:kMSASServerSideConfigDidChangeNotification object:self queue:v27 usingBlock:v47];

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10000F6F4;
  v46[3] = &unk_100018AD8;
  v46[4] = self;
  id v31 =  [v29 addObserverForName:kMSBatteryPowerMonitorExternalPowerSourceChangedNotification object:0 queue:v30 usingBlock:v46];

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_10000F8BC;
  v45[3] = &unk_100018AD8;
  v45[4] = self;
  id v34 =  [v32 addObserverForName:kMSPowerBudgetDidBeginAllowingFileTransferNotification object:0 queue:v33 usingBlock:v45];

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10000F8C4;
  v44[3] = &unk_100018AD8;
  v44[4] = self;
  id v37 =  [v35 addObserverForName:kMSPowerBudgetDidEndAllowingFileTransferNotification object:0 queue:v36 usingBlock:v44];

  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10000F91C;
  v43[3] = &unk_100018AD8;
  v43[4] = self;
  id v41 =  [v38 addObserverForName:kMSAuthenticationManagerDidReceiveAuthenticationChangeNotification object:v39 queue:v40 usingBlock:v43];

  -[MSIOSAlbumSharingDaemon releaseBusy](self, "releaseBusy");
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon start](&v42, "start");
  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)buf);
}

- (void)sendServerSideConfigurationDidChangeNotificationForPersonID:(id)a3
{
  v4 = (void *)kMSASServerSideConfigDidChangeNotification;
  id v5 = a3;
  notify_post((const char *)[v4 UTF8String]);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon sendServerSideConfigurationDidChangeNotificationForPersonID:]( &v6,  "sendServerSideConfigurationDidChangeNotificationForPersonID:",  v5);
}

- (void)shutDownCompletionBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10000F2B8;
  v4[3] = &unk_100018B00;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  dispatch_async(&_dispatch_main_q, v4);
}

- (BOOL)XPCNSServiceListener:(id)a3 shouldReceiveNewConnection:(id)a4
{
  id v5 = (_xpc_connection_s *)a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  xpc_connection_get_audit_token();
  memset(&token, 0, sizeof(token));
  objc_super v6 = SecTaskCreateWithAuditToken(0LL, &token);
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      pid_t pid = xpc_connection_get_pid(v5);
      token.val[0] = 138543618;
      *(void *)&token.val[1] = self;
      LOWORD(token.val[3]) = 1024;
      *(unsigned int *)((char *)&token.val[3] + 2) = pid;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to create security task from audit token for pid %d",  (uint8_t *)&token,  0x12u);
    }

    goto LABEL_15;
  }

  objc_super v7 = v6;
  CFErrorRef error = 0LL;
  CFTypeRef v8 = SecTaskCopyValueForEntitlement(v6, @"com.apple.mediastream.mstreamd-access", &error);
  v9 = v8;
  CFErrorRef v10 = error;
  if (error)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      pid_t v17 = xpc_connection_get_pid(v5);
      token.val[0] = 138543618;
      *(void *)&token.val[1] = self;
      LOWORD(token.val[3]) = 1024;
      *(unsigned int *)((char *)&token.val[3] + 2) = v17;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Failed to get entitlement for pid %d",  (uint8_t *)&token,  0x12u);
      CFErrorRef v10 = error;
    }

    CFRelease(v10);
    if (!v9) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  if (!v8)
  {
LABEL_14:
    CFRelease(v7);
    goto LABEL_15;
  }

  CFTypeID v12 = CFGetTypeID(v8);
  if (v12 != CFBooleanGetTypeID())
  {
LABEL_13:
    CFRelease(v9);
    goto LABEL_14;
  }

  int Value = CFBooleanGetValue((CFBooleanRef)v9);
  CFRelease(v9);
  CFRelease(v7);
  if (Value)
  {
    BOOL v14 = 1;
    goto LABEL_18;
  }

- (void)XPCNSServiceListener:(id)a3 didReceiveNewConnection:(id)a4
{
  id v5 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    CFTypeRef v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@ Client connected: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  objc_super v6 = objc_alloc_init(&OBJC_CLASS___MSMSASServiceConnection);
  [v5 setDelegate:v6];
  [v5 setContext:v6];
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = (void *)IDSCopyRawAddressForDestination();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544642;
    double v22 = self;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 2112;
    id v28 = v11;
    __int16 v29 = 2112;
    id v30 = v13;
    __int16 v31 = 2112;
    v32 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Received incoming message %@ for service %{public}@ account %@ from %@ (%@)",  buf,  0x3Eu);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B24C;
  block[3] = &unk_100018B28;
  id v18 = v12;
  id v19 = v14;
  __int128 v20 = self;
  id v15 = v14;
  id v16 = v12;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)_updatePushNotificationTopicsOutListenToProduction:(BOOL *)a3 outListenToDevelopment:(BOOL *)a4
{
  int v7 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSAlbumSharingDaemon personIDListeningToPushNotification]( self,  "personIDListeningToPushNotification"));
  if ([v7 length])
  {
    uint64_t v8 = MSASPlatform();
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned __int8 v10 = [v9 personIDUsesProductionPushEnvironment:v7];

    char v11 = v10 ^ 1;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543362;
    id v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Not listening to push notifications.",  (uint8_t *)&v12,  0xCu);
  }

  -[APSConnection _setEnabledTopics:](self->_prodAPSConnection, "_setEnabledTopics:", 0LL);
  -[APSConnection _setEnabledTopics:](self->_devAPSConnection, "_setEnabledTopics:", 0LL);
  char v11 = 0;
  unsigned __int8 v10 = 0;
  if (a4) {
LABEL_3:
  }
    *a4 = v11;
LABEL_4:
  if (a3) {
    *a3 = v10;
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  -[MSIOSAlbumSharingDaemon retainBusy](self, "retainBusy");
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "Received new push token.",  v7,  2u);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSMSPlatform thePlatform](&OBJC_CLASS___MSMSPlatform, "thePlatform"));
  [v6 setPushToken:v5];

  -[MSIOSAlbumSharingDaemon releaseBusy](self, "releaseBusy");
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v5 = a4;
  -[MSIOSAlbumSharingDaemon retainBusy](self, "retainBusy");
  objc_super v6 = (MSIOSAlbumSharingDaemon *)objc_claimAutoreleasedReturnValue([v5 topic]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Received new push notification topic: %@ userInfo: %@",  (uint8_t *)&v12,  0x16u);
  }

  if (-[MSIOSAlbumSharingDaemon isEqualToString:]( v6,  "isEqualToString:",  @"com.apple.sharedstreams"))
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 objectForKey:@"r"]);
LABEL_7:
    char v11 = (void *)v8;
    -[MSIOSAlbumSharingDaemon pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:]( self,  "pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:",  v8);

    goto LABEL_10;
  }

  __int16 v9 = (void *)objc_claimAutoreleasedReturnValue( [@"com.apple.icloud-container." stringByAppendingString:@"com.apple.sharedstreams"]);
  unsigned int v10 = -[MSIOSAlbumSharingDaemon isEqualToString:](v6, "isEqualToString:", v9);

  if (v10)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon personIDListeningToPushNotification](self, "personIDListeningToPushNotification"));
    goto LABEL_7;
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v12 = 138543362;
    id v13 = self;
    _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Received unknown push notification, ignoring",  (uint8_t *)&v12,  0xCu);
  }

- (NSMutableDictionary)personIDToPowerBudgetMap
{
  personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  if (!personIDToPowerBudgetMap)
  {
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v5 = self->_personIDToPowerBudgetMap;
    self->_personIDToPowerBudgetMap = v4;

    personIDToPowerBudgetMap = self->_personIDToPowerBudgetMap;
  }

  return personIDToPowerBudgetMap;
}

- (id)powerBudgetForPersonID:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_11:
    id v6 = 0LL;
    goto LABEL_12;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon personIDToPowerBudgetMap](self, "personIDToPowerBudgetMap"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);

  if (v6) {
    goto LABEL_12;
  }
  if (([v4 isEqualToString:&stru_100019080] & 1) == 0)
  {
    uint64_t v7 = MSASPlatform();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    unsigned int v9 = [v8 personIDEnabledForAlbumSharing:v4];

    if (!v9)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        int v13 = 138543618;
        __int16 v14 = self;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "%{public}@: Shared Photo Stream is disabled for person ID %@. Not creating power budget.",  (uint8_t *)&v13,  0x16u);
      }

      goto LABEL_11;
    }
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543618;
    __int16 v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Creating power budget object for person ID %@",  (uint8_t *)&v13,  0x16u);
  }

  id v6 = objc_alloc_init(&OBJC_CLASS___MSPowerBudget);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon personIDToPowerBudgetMap](self, "personIDToPowerBudgetMap"));
  [v10 setObject:v6 forKey:v4];

  [v6 setPersonID:v4];
  [v6 setDelegate:self];
  -[MSIOSAlbumSharingDaemon _readPowerBudgetParametersForPersonID:](self, "_readPowerBudgetParametersForPersonID:", v4);
  char v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSBatteryPowerMonitor defaultMonitor](&OBJC_CLASS___MSBatteryPowerMonitor, "defaultMonitor"));
  LODWORD(v10) = [v11 isExternalPowerConnected];

  if ((_DWORD)v10) {
    [v6 didBeginExternalPower];
  }
LABEL_12:

  return v6;
}

- (void)didDestroyStateMachineForPersonID:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%{public}@: Destroying power budget object for person ID %@",  (uint8_t *)&v7,  0x16u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", v4));
  [v5 shutDown];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon personIDToPowerBudgetMap](self, "personIDToPowerBudgetMap"));
  [v6 removeObjectForKey:v4];
}

- (void)didReceivePushNotificationForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", a3));
  [v3 didReceivePushNotification];
}

- (void)didBeginForegroundFocusForPersonID:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", a3));
  [v4 didBeginForegroundFocus];

  -[MSIOSAlbumSharingDaemon retryOutstandingActivities](self, "retryOutstandingActivities");
}

- (void)didEndForegroundFocusForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", a3));
  [v3 didEndForegroundFocus];
}

- (void)setFocusAlbumGUID:(id)a3 forPersonID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", v6));
  [v8 setFocusAlbumGUID:v7];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon setFocusAlbumGUID:forPersonID:](&v9, "setFocusAlbumGUID:forPersonID:", v7, v6);
}

- (void)setFocusAssetCollectionGUID:(id)a3 forPersonID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", v6));
  [v8 setFocusAssetCollectionGUID:v7];

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon setFocusAssetCollectionGUID:forPersonID:]( &v9,  "setFocusAssetCollectionGUID:forPersonID:",  v7,  v6);
}

- (BOOL)isPersonIDAllowedToDownloadAssets:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", a3));
  unsigned __int8 v4 = [v3 isFileTransferAllowed];

  return v4;
}

- (void)didReceiveGlobalResetSyncForPersonID:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:", a3));
  [v3 didReceiveGlobalResetSync];
}

- (void)_readPowerBudgetParametersForPersonID:(id)a3
{
  id v9 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetForPersonID:](self, "powerBudgetForPersonID:"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSAlbumSharingDaemon serverSideConfigurationForPersonID:]( self,  "serverSideConfigurationForPersonID:",  v9));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kMSASServerSideConfigMaxActiveTimeAfterPushKey]);
    [v6 doubleValue];
    objc_msgSend(v4, "setMaxActiveTimeAfterPush:");

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kMSASServerSideConfigMaxActiveTimeAfterLossOfForegroundKey]);
    [v7 doubleValue];
    objc_msgSend(v4, "setMaxActiveTimeAfterLossOfForeground:");

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kMSASServerSideConfigMaxActiveTimeAfterGlobalResetSyncKey]);
    [v8 doubleValue];
    objc_msgSend(v4, "setMaxActiveTimeAfterGlobalResetSync:");
  }
}

- (id)MSPowerBudgetDidRequestPersistedValues:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetPersistedParameters](self, "powerBudgetPersistedParameters"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 personID]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[MSIOSAlbumSharingDaemon persistentObjectForKey:personID:]( self,  "persistentObjectForKey:personID:",  @"MSIOSAlbumSharingDaemon.powerBudgetParams",  v6));
    -[MSIOSAlbumSharingDaemon setPowerBudgetPersistedParameters:](self, "setPowerBudgetPersistedParameters:", v7);
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon powerBudgetPersistedParameters](self, "powerBudgetPersistedParameters"));

  return v8;
}

- (void)MSPowerBudget:(id)a3 didRequestStorageOfPersistedValues:(id)a4
{
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000B198;
  block[3] = &unk_100018B28;
  void block[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)didIdle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPowerAssertionManager sharedManager](&OBJC_CLASS___MSPowerAssertionManager, "sharedManager"));
  [v3 releaseBusy];
  [v3 toggleAssertion];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon didIdle](&v4, "didIdle");
}

- (void)didUnidle
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPowerAssertionManager sharedManager](&OBJC_CLASS___MSPowerAssertionManager, "sharedManager"));
  [v3 retainBusy];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon didUnidle](&v4, "didUnidle");
}

- (void)stabilizedDidIdle
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%{public}@: Daemon stabilized in idle state. Sending notification.",  (uint8_t *)&v4,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon busyPingTimer](self, "busyPingTimer"));
  [v3 invalidate];

  -[MSIOSAlbumSharingDaemon setBusyPingTimer:](self, "setBusyPingTimer:", 0LL);
}

- (void)_busyPingTimerDidExpire:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138543362;
    id v5 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%{public}@: Daemon busy ping timer expired. Sending notification.",  (uint8_t *)&v4,  0xCu);
  }

- (void)stabilizedDidUnidle
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "%{public}@: Daemon in unidled state. Sending notification.",  (uint8_t *)&v7,  0xCu);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon busyPingTimer](self, "busyPingTimer"));

  if (!v3)
  {
    int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:target:selector:userInfo:repeats:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:target:selector:userInfo:repeats:",  self,  "_busyPingTimerDidExpire:",  0LL,  1LL,  3.0));
    -[MSIOSAlbumSharingDaemon setBusyPingTimer:](self, "setBusyPingTimer:", v4);

    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSIOSAlbumSharingDaemon busyPingTimer](self, "busyPingTimer"));
    [v5 addTimer:v6 forMode:NSRunLoopCommonModes];
  }

- (void)didReceiveAuthFailureForPersonID:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  [v4 didEncounterAuthenticationFailureForPersonID:v3];
}

- (void)didReceiveAuthSuccessForPersonID:(id)a3
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

- (void)forgetEverythingAboutPersonID:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[MSIOSAlbumSharingDaemon retainBusy](self, "retainBusy");
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon forgetEverythingAboutPersonID:completionBlock:]( &v9,  "forgetEverythingAboutPersonID:completionBlock:",  v7,  v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  [v8 rearmAuthenticationAlert];

  -[MSIOSAlbumSharingDaemon _updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:]( self,  "_updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:",  0LL,  0LL);
  -[MSIOSAlbumSharingDaemon releaseBusy](self, "releaseBusy");
}

- (void)forgetEverythingCompletionBlock:(id)a3
{
  id v4 = a3;
  -[MSIOSAlbumSharingDaemon retainBusy](self, "retainBusy");
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MSIOSAlbumSharingDaemon;
  -[MSIOSAlbumSharingDaemon forgetEverythingCompletionBlock:](&v6, "forgetEverythingCompletionBlock:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSAuthenticationManager sharedManager](&OBJC_CLASS___MSAuthenticationManager, "sharedManager"));
  [v5 rearmAuthenticationAlert];

  -[MSIOSAlbumSharingDaemon _updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:]( self,  "_updatePushNotificationTopicsOutListenToProduction:outListenToDevelopment:",  0LL,  0LL);
  -[MSIOSAlbumSharingDaemon releaseBusy](self, "releaseBusy");
}

- (XPCNSServiceListener)serviceListener
{
  return self->_serviceListener;
}

- (void)setServiceListener:(id)a3
{
}

- (APSConnection)prodAPSConnection
{
  return self->_prodAPSConnection;
}

- (void)setProdAPSConnection:(id)a3
{
}

- (APSConnection)devAPSConnection
{
  return self->_devAPSConnection;
}

- (void)setDevAPSConnection:(id)a3
{
}

- (void)setPersonIDToPowerBudgetMap:(id)a3
{
}

- (NSDictionary)powerBudgetPersistedParameters
{
  return self->_powerBudgetPersistedParameters;
}

- (void)setPowerBudgetPersistedParameters:(id)a3
{
}

- (NSTimer)busyPingTimer
{
  return self->_busyPingTimer;
}

- (void)setBusyPingTimer:(id)a3
{
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
}

- (void).cxx_destruct
{
}

@end