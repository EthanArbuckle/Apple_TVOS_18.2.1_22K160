@interface SpringBoardUtility
+ (BOOL)_hasEntitlements:(id)a3;
+ (id)sharedInstance;
+ (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4;
+ (void)dequeueAlertWithMessage:(id)a3 connection:(id)a4;
+ (void)observeXPCServer:(id)a3;
+ (void)registerPluginConnectionWithMessage:(id)a3 connection:(id)a4;
+ (void)restartApplicationWithMessage:(id)a3 connection:(id)a4;
+ (void)testBadgingWithMessage:(id)a3 connection:(id)a4;
+ (void)testLockscreenAccountSheetWithMessage:(id)a3 connection:(id)a4;
+ (void)testPluginAlertWithMessage:(id)a3 connection:(id)a4;
- (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4;
- (BOOL)isScreenLocked;
- (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (NSString)frontmostClientIdentifier;
- (SpringBoardUtility)init;
- (id)_applicationStateMonitor;
- (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4;
- (id)copyBundleInfoValueForKey:(id)a3 PID:(int)a4;
- (unsigned)applicationStateForIdentifier:(id)a3;
- (unsigned)mostElevatedApplicationStateForPID:(int)a3;
- (void)_dequeueAlertWithMessage:(id)a3 connection:(id)a4;
- (void)_disconnectPluginConnection:(id)a3;
- (void)_fireDeferredPluginBlocksWithConnection:(id)a3;
- (void)_registerPluginConnectionWithMessage:(id)a3;
- (void)_requestPluginConnectionWithCompletionBlock:(id)a3;
- (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4;
- (void)_setApplicationStatesWithDictionary:(id)a3;
- (void)_timeoutPluginConnection;
- (void)activateAlertWithDescription:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (void)beginGeneratingStateChangeNotificationsForIdentifiers:(id)a3;
- (void)beginGeneratingStateChangeNotificationsWithCompletionBlock:(id)a3;
- (void)dealloc;
- (void)endGeneratingStateChangeNotifications;
- (void)endGeneratingStateChangeNotificationsForIdentifiers:(id)a3;
- (void)removeDefaultPNGSnapshotsForIdentifier:(id)a3;
- (void)resetEnabledRemoteNotificationTypes;
- (void)sendPluginMessage:(id)a3;
- (void)sendPluginMessage:(id)a3 withReplyBlock:(id)a4;
- (void)setBadgeValue:(id)a3 forIdentifier:(id)a4;
- (void)wakeAppUsingRequest:(id)a3;
@end

@implementation SpringBoardUtility

- (SpringBoardUtility)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___SpringBoardUtility;
  v2 = -[SpringBoardUtility init](&v13, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunesstore.SpringBoardUtility", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.itunesstore.SpringBoardUtility.springboard", 0LL);
    springBoardQueue = v2->_springBoardQueue;
    v2->_springBoardQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.itunesstore.notifications", 0LL);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = (dispatch_object_s *)v2->_notificationQueue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v9, v11);
  }

  return v2;
}

- (void)dealloc
{
  pluginConnectionTimeout = self->_pluginConnectionTimeout;
  if (pluginConnectionTimeout) {
    dispatch_source_cancel((dispatch_source_t)pluginConnectionTimeout);
  }
  -[SSXPCConnection setDisconnectBlock:](self->_pluginConnection, "setDisconnectBlock:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SpringBoardUtility;
  -[SpringBoardUtility dealloc](&v4, "dealloc");
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010ACB8;
  block[3] = &unk_10034AC90;
  block[4] = a1;
  if (qword_1003A3478 != -1) {
    dispatch_once(&qword_1003A3478, block);
  }
  return (id)qword_1003A3470;
}

- (void)activateAlertWithDescription:(id)a3 options:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010ADB4;
  v15[3] = &unk_10034EA38;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

- (unsigned)applicationStateForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010B2F8;
  block[3] = &unk_10034EA60;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
  LODWORD(dispatchQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return dispatchQueue;
}

- (void)beginGeneratingStateChangeNotificationsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010B4A4;
  v7[3] = &unk_10034ACE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)beginGeneratingStateChangeNotificationsForIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010B7A8;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (id)copyBundleInfoValueForKey:(id)a3 PID:(int)a4
{
  id v6 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_10010BB04;
  v23 = sub_10010BB14;
  id v24 = 0LL;
  springBoardQueue = (dispatch_queue_s *)self->_springBoardQueue;
  uint64_t v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  uint64_t v13 = sub_10010BB1C;
  int v14 = &unk_10034EAD8;
  v15 = self;
  id v17 = &v19;
  id v8 = v6;
  id v16 = v8;
  int v18 = a4;
  dispatch_sync(springBoardQueue, &v11);
  id v9 = objc_msgSend((id)v20[5], "copy", v11, v12, v13, v14, v15);

  _Block_object_dispose(&v19, 8);
  return v9;
}

- (void)endGeneratingStateChangeNotifications
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010BBD0;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)endGeneratingStateChangeNotificationsForIdentifiers:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010BD70;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (NSString)frontmostClientIdentifier
{
  uint64_t v6 = 0LL;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = sub_10010BB04;
  id v10 = sub_10010BB14;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010C128;
  v5[3] = &unk_10034CA68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (BOOL)isScreenLocked
{
  __int16 v4 = 0;
  uint64_t v2 = SBSSpringBoardServerPort(self, a2);
  SBGetScreenLockStatus(v2, (char *)&v4 + 1, &v4);
  return HIBYTE(v4) != 0;
}

- (BOOL)launchApplicationWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = sub_10010BB04;
  v28 = sub_10010BB14;
  id v29 = 0LL;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[FBSSystemService sharedService](&OBJC_CLASS___FBSSystemService, "sharedService"));
  int v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  v20 = sub_10010C3D4;
  uint64_t v21 = &unk_10034EB28;
  v23 = &v24;
  id v11 = v9;
  v22 = v11;
  [v10 openApplication:v7 options:v8 withResult:&v18];

  dispatch_time_t v12 = dispatch_time(0LL, 30000000000LL);
  dispatch_semaphore_wait(v11, v12);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v25[5], "domain", v18, v19, v20, v21));
  unsigned int v14 = [v13 isEqualToString:FBSOpenApplicationErrorDomain];

  id v15 = (id)v25[5];
  if (v14) {
    id v15 = [v15 code];
  }
  BOOL v16 = v15 == 0LL;
  if (a5 && v15) {
    *a5 = (id) v25[5];
  }

  _Block_object_dispose(&v24, 8);
  return v16;
}

- (unsigned)mostElevatedApplicationStateForPID:(int)a3
{
  uint64_t v8 = 0LL;
  dispatch_semaphore_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  springBoardQueue = (dispatch_queue_s *)self->_springBoardQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010C4B4;
  block[3] = &unk_10034EB50;
  block[4] = self;
  void block[5] = &v8;
  int v7 = a3;
  dispatch_sync(springBoardQueue, block);
  unsigned int v4 = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (void)removeDefaultPNGSnapshotsForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [v4 isEqualToString:@"com.apple.MobileStore"];
  if ((v5 & 1) != 0
    || (id v5 = [v4 isEqualToString:@"com.apple.AppStore"], (_DWORD)v5))
  {
    uint64_t v6 = CPSharedResourcesDirectory(v5);
    int v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (!v7) {
      goto LABEL_21;
    }
LABEL_6:
    int v11 = -[NSArray initWithObjects:]( objc_alloc(&OBJC_CLASS___NSArray),  "initWithObjects:",  v7,  @"Library",  @"Caches",  @"Snapshots",  v4,  0LL);
    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](&OBJC_CLASS___NSString, "pathWithComponents:", v11));
    if (!v12)
    {
LABEL_20:

      goto LABEL_21;
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v13) {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v14 = [v13 shouldLog];
    else {
      LODWORD(v15) = v14;
    }
    BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 OSLogObject]);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      uint64_t v15 = v15;
    }
    else {
      v15 &= 2u;
    }
    if ((_DWORD)v15)
    {
      int v21 = 138412546;
      id v22 = (id)objc_opt_class(self);
      __int16 v23 = 2112;
      uint64_t v24 = v12;
      id v17 = v22;
      LODWORD(v20) = 22;
      int v18 = (void *)_os_log_send_and_compose_impl( v15,  0LL,  0LL,  0LL,  &_mh_execute_header,  v16,  1LL,  "%@: Removing snapshots at path: %@",  &v21,  v20);

      if (!v18)
      {
LABEL_19:

        uint64_t v19 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
        -[NSFileManager removeItemAtPath:error:](v19, "removeItemAtPath:error:", v12, 0LL);

        goto LABEL_20;
      }

      BOOL v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v18,  4LL));
      free(v18);
      SSFileLog(v13, @"%@");
    }

    goto LABEL_19;
  }

  uint64_t v8 = objc_autoreleasePoolPush();
  dispatch_semaphore_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationProxy applicationProxyForIdentifier:]( &OBJC_CLASS___LSApplicationProxy,  "applicationProxyForIdentifier:",  v4));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleContainerURL]);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);

  objc_autoreleasePoolPop(v8);
  if (v7) {
    goto LABEL_6;
  }
LABEL_21:
}

- (void)resetEnabledRemoteNotificationTypes
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010C800;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_sync(dispatchQueue, block);
}

- (void)setBadgeValue:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) != 0)
    {
      int v11 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
      -[NSNumberFormatter setNumberStyle:](v11, "setNumberStyle:", 1LL);
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSNumberFormatter stringFromNumber:](v11, "stringFromNumber:", v6));

      goto LABEL_18;
    }

    dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v12) {
      dispatch_time_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v13 = [v12 shouldLog];
    else {
      LODWORD(v14) = v13;
    }
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 OSLogObject]);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
      uint64_t v14 = v14;
    }
    else {
      v14 &= 2u;
    }
    if ((_DWORD)v14)
    {
      int v20 = 138412802;
      id v21 = (id)objc_opt_class(self);
      __int16 v22 = 2112;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v6;
      id v16 = v21;
      id v17 = (void *)_os_log_send_and_compose_impl( v14,  0LL,  0LL,  0LL,  &_mh_execute_header,  v15,  1LL,  "%@: Invalid value type for badge (%@, %@)",  &v20,  32);

      if (!v17)
      {
LABEL_17:

        id v9 = 0LL;
        goto LABEL_18;
      }

      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v17,  4LL));
      free(v17);
      SSFileLog(v12, @"%@");
    }

    goto LABEL_17;
  }

  id v9 = v6;
LABEL_18:
  id v18 = objc_alloc_init(&OBJC_CLASS___ISSetApplicationBadgeOperation);
  [v18 setBadgeValue:v9];
  [v18 setBundleIdentifier:v7];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(+[ISOperationQueue mainQueue](&OBJC_CLASS___ISOperationQueue, "mainQueue"));
  [v19 addOperation:v18];
}

- (void)wakeAppUsingRequest:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v5 takeKeepAliveAssertion:@"AppWakeup"];
  springBoardQueue = (dispatch_queue_s *)self->_springBoardQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010CB4C;
  block[3] = &unk_10034BCE8;
  id v10 = v4;
  int v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(springBoardQueue, block);
}

- (void)_dequeueAlertWithMessage:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010D518;
  block[3] = &unk_10034BCE8;
  id v12 = v6;
  unsigned int v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

+ (void)dequeueAlertWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  uint64_t v6 = kSSITunesStorePrivateEntitlement;
  id v7 = (_xpc_connection_s *)a4;
  if (SSXPCConnectionHasEntitlement(v7, v6))
  {
    xpc_object_t reply = (xpc_object_t)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
    [reply _dequeueAlertWithMessage:original connection:v7];
  }

  else
  {
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_connection_send_message(v7, reply);
  }
}

+ (void)observeXPCServer:(id)a3
{
  id v4 = a3;
  [v4 addObserver:a1 selector:"dequeueAlertWithMessage:connection:" forMessage:142];
  [v4 addObserver:a1 selector:"registerPluginConnectionWithMessage:connection:" forMessage:2000];
  [v4 addObserver:a1 selector:"testBadgingWithMessage:connection:" forMessage:752];
  [v4 addObserver:a1 selector:"testLockscreenAccountSheetWithMessage:connection:" forMessage:750];
  [v4 addObserver:a1 selector:"testPluginAlertWithMessage:connection:" forMessage:751];
  [v4 addObserver:a1 selector:"restartApplicationWithMessage:connection:" forMessage:165];
}

+ (void)restartApplicationWithMessage:(id)a3 connection:(id)a4
{
  xpc_object_t original = a3;
  uint64_t v6 = (_xpc_connection_s *)a4;
  id v7 = -[XPCClient initWithInputConnection:](objc_alloc(&OBJC_CLASS___XPCClient), "initWithInputConnection:", v6);
  if ([a1 _hasEntitlements:v6])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[XPCClient clientIdentifier](v7, "clientIdentifier"));
    id v9 = objc_alloc_init(&OBJC_CLASS___BKSSystemService);
    [v9 terminateApplication:v8 forReason:5 andReport:0 withDescription:0];
    [v9 openApplication:v8 options:0 withResult:0];
    xpc_object_t reply = xpc_dictionary_create_reply(original);
    xpc_connection_send_message(v6, reply);
  }

  else
  {
    [a1 _sendUnentitledResponseToMessage:original connection:v6];
  }
}

+ (void)registerPluginConnectionWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  [v6 _registerPluginConnectionWithMessage:v5];
}

+ (void)testBadgingWithMessage:(id)a3 connection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString);
  id v7 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "1", v6);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSString);
  id v9 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "2", v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v10) {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v11 = [v10 shouldLog];
  else {
    LODWORD(v12) = v11;
  }
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 OSLogObject]);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    uint64_t v12 = v12;
  }
  else {
    v12 &= 2u;
  }
  if (!(_DWORD)v12) {
    goto LABEL_12;
  }
  int v17 = 138412802;
  id v18 = (id)objc_opt_class(a1);
  __int16 v19 = 2112;
  int v20 = v7;
  __int16 v21 = 2112;
  __int16 v22 = v9;
  id v14 = v18;
  uint64_t v15 = (void *)_os_log_send_and_compose_impl( v12,  0LL,  0LL,  0LL,  &_mh_execute_header,  v13,  2LL,  "[%@]: SSClient requested to set badge of %@ to '%@'",  &v17,  32);

  if (v15)
  {
    unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v15,  4LL));
    free(v15);
    SSFileLog(v10, @"%@");
LABEL_12:
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  [v16 setBadgeValue:v9 forIdentifier:v7];
}

+ (void)testLockscreenAccountSheetWithMessage:(id)a3 connection:(id)a4
{
  id v6 = (id)SSXPCCreateMessageDictionary(3003LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a1 sharedInstance]);
  [v5 sendPluginMessage:v6];
}

+ (void)testPluginAlertWithMessage:(id)a3 connection:(id)a4
{
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v4,  "setObject:forKey:",  @"ServiceTouchIDAlertViewController",  SBSUIRemoteAlertOptionViewControllerClass);
  id v5 = objc_alloc_init(&OBJC_CLASS___SSDialog);
  [v5 setMessage:@"account@example.com"];
  [v5 setTitle:@"Touch ID"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[SSDialogButton buttonWithTitle:]( &OBJC_CLASS___SSDialogButton,  "buttonWithTitle:",  @"Use Password"));
  v11[0] = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SSDialogButton buttonWithTitle:](&OBJC_CLASS___SSDialogButton, "buttonWithTitle:", @"Cancel"));
  v11[1] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v11, 2LL));
  [v5 setButtons:v8];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[SpringBoardUtility sharedInstance](&OBJC_CLASS___SpringBoardUtility, "sharedInstance"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 dialogDictionary]);
  [v9 activateAlertWithDescription:v4 options:v10 completionBlock:0];
}

- (void)sendPluginMessage:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10010DE08;
  v5[3] = &unk_10034EBA0;
  id v6 = a3;
  id v4 = v6;
  -[SpringBoardUtility _requestPluginConnectionWithCompletionBlock:]( self,  "_requestPluginConnectionWithCompletionBlock:",  v5);
}

- (void)sendPluginMessage:(id)a3 withReplyBlock:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10010DEB8;
  v8[3] = &unk_10034EBF0;
  id v9 = a3;
  id v10 = a4;
  id v6 = v9;
  id v7 = v10;
  -[SpringBoardUtility _requestPluginConnectionWithCompletionBlock:]( self,  "_requestPluginConnectionWithCompletionBlock:",  v8);
}

- (id)_applicationStateMonitor
{
  applicationStateMonitor = self->_applicationStateMonitor;
  if (!applicationStateMonitor)
  {
    objc_initWeak(&location, self);
    id v4 = -[BKSApplicationStateMonitor initWithBundleIDs:states:]( objc_alloc(&OBJC_CLASS___BKSApplicationStateMonitor),  "initWithBundleIDs:states:",  0LL,  0LL);
    id v5 = self->_applicationStateMonitor;
    self->_applicationStateMonitor = v4;

    id v6 = self->_applicationStateMonitor;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10010E090;
    v8[3] = &unk_10034EC18;
    objc_copyWeak(&v9, &location);
    -[BKSApplicationStateMonitor setHandler:](v6, "setHandler:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    applicationStateMonitor = self->_applicationStateMonitor;
  }

  return applicationStateMonitor;
}

- (void)_disconnectPluginConnection:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010E1AC;
  v7[3] = &unk_10034AD58;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_fireDeferredPluginBlocksWithConnection:(id)a3
{
  id v4 = a3;
  pluginConnectionTimeout = self->_pluginConnectionTimeout;
  if (pluginConnectionTimeout)
  {
    dispatch_source_cancel((dispatch_source_t)pluginConnectionTimeout);
    id v6 = self->_pluginConnectionTimeout;
    self->_pluginConnectionTimeout = 0LL;
  }

  id v7 = -[NSMutableArray copy](self->_pluginDeferredBlocks, "copy");
  -[NSMutableArray removeAllObjects](self->_pluginDeferredBlocks, "removeAllObjects");
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  void v11[2] = sub_10010E434;
  v11[3] = &unk_10034AD58;
  id v12 = v7;
  id v13 = v4;
  id v9 = v4;
  id v10 = v7;
  dispatch_async(notificationQueue, v11);
}

- (id)_getApplicationInfoForIdentifier:(id)a3 key:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v19 = 0LL;
  int v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  __int16 v22 = sub_10010BB04;
  id v23 = sub_10010BB14;
  id v24 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SpringBoardUtility _applicationStateMonitor](self, "_applicationStateMonitor"));
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10010E694;
  v15[3] = &unk_10034EC40;
  id v18 = &v19;
  id v10 = v7;
  id v16 = v10;
  unsigned int v11 = v9;
  int v17 = v11;
  [v8 applicationInfoForApplication:v6 completion:v15];
  dispatch_time_t v12 = dispatch_time(0LL, 30000000000LL);
  dispatch_semaphore_wait(v11, v12);
  id v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

- (BOOL)_getProcessID:(int *)a3 forApplicationIdentifier:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[SpringBoardUtility _getApplicationInfoForIdentifier:key:]( self,  "_getApplicationInfoForIdentifier:key:",  a4,  BKSApplicationStateProcessIDKey));
  char v6 = objc_opt_respondsToSelector(v5, "intValue");
  char v7 = v6;
  if (a3 && (v6 & 1) != 0) {
    *a3 = [v5 intValue];
  }

  return v7 & 1;
}

+ (BOOL)_hasEntitlements:(id)a3
{
  return SSXPCConnectionHasEntitlement(a3, kSSITunesStorePrivateEntitlement);
}

- (void)_registerPluginConnectionWithMessage:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010E80C;
  v7[3] = &unk_10034AD58;
  id v8 = v4;
  dispatch_semaphore_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_requestPluginConnectionWithCompletionBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010EBE0;
  v7[3] = &unk_10034ACE0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

+ (void)_sendUnentitledResponseToMessage:(id)a3 connection:(id)a4
{
  id v6 = (_xpc_connection_s *)a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v8) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v9 = [v8 shouldLog];
  else {
    LODWORD(v10) = v9;
  }
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 OSLogObject]);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    uint64_t v10 = v10;
  }
  else {
    v10 &= 2u;
  }
  if (!(_DWORD)v10) {
    goto LABEL_12;
  }
  int v17 = 138412290;
  id v18 = (id)objc_opt_class(a1);
  id v12 = v18;
  id v13 = (void *)_os_log_send_and_compose_impl( v10,  0LL,  0LL,  0LL,  &_mh_execute_header,  v11,  16LL,  "[%@] Connection refused because entitlements are missing",  &v17,  12);

  if (v13)
  {
    unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v13,  4LL));
    free(v13);
    SSFileLog(v8, @"%@");
LABEL_12:
  }

  xpc_object_t reply = xpc_dictionary_create_reply(v7);
  uint64_t v15 = SSError(SSErrorDomain, 107LL, 0LL, 0LL);
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  SSXPCDictionarySetCFObject(reply, "0", &off_10036D8A8);
  SSXPCDictionarySetCFObject(reply, "1", v16);
  xpc_connection_send_message(v6, reply);
}

- (void)_setApplicationState:(unsigned int)a3 forClientID:(id)a4
{
  id v6 = a4;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10010F208;
  block[3] = &unk_10034EC68;
  unsigned int v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(dispatchQueue, block);
}

- (void)_setApplicationStatesWithDictionary:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10010F3D4;
  v7[3] = &unk_10034AD58;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void)_timeoutPluginConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    LODWORD(v5) = v4;
  }
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    uint64_t v5 = v5;
  }
  else {
    v5 &= 2u;
  }
  if (!(_DWORD)v5) {
    goto LABEL_12;
  }
  id v7 = (void *)objc_opt_class(self);
  pluginConnection = self->_pluginConnection;
  int v11 = 138412546;
  id v12 = v7;
  __int16 v13 = 2112;
  id v14 = pluginConnection;
  id v9 = v7;
  id v10 = (void *)_os_log_send_and_compose_impl( v5,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  0LL,  "%@: Plugin timeout with connection: %@",  &v11,  22);

  if (v10)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v10,  4LL));
    free(v10);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  -[SpringBoardUtility _fireDeferredPluginBlocksWithConnection:]( self,  "_fireDeferredPluginBlocksWithConnection:",  self->_pluginConnection);
}

- (void).cxx_destruct
{
}

@end