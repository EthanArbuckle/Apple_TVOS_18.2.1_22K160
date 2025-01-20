@interface HBAppDelegate
+ (BOOL)isiCloudHomeScreenSyncEnabled;
+ (id)sharedApplicationDelegate;
- (APSConnection)apsConnection;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)runTestName:(id)a3 options:(id)a4 context:(id)a5;
- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5;
- (int64_t)overrideAssetLibraryCacheDeleteUrgency;
- (void)_navigateToDockIndex:(unint64_t)a3 completion:(id)a4;
- (void)_navigateToTopShelfFromDockIndex:(unint64_t)a3 appGridView:(id)a4 completion:(id)a5;
- (void)_performTestCommands:(id)a3 withTestName:(id)a4;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6;
- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)setApsConnection:(id)a3;
@end

@implementation HBAppDelegate

+ (id)sharedApplicationDelegate
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 delegate]);

  return v3;
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4 = objc_alloc(&OBJC_CLASS___PBSMigration);
  uint64_t v5 = objc_opt_self(&OBJC_CLASS___HBIconCache);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 initWithHandlingClass:v6];
  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v7);

  id v8 = objc_alloc(&OBJC_CLASS___PBSMigration);
  uint64_t v9 = objc_opt_self(&OBJC_CLASS___HBCloudSyncManager);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v11 = [v8 initWithHandlingClass:v10];
  +[PBSMigrator registerMigration:](&OBJC_CLASS___PBSMigrator, "registerMigration:", v11);

  +[PBSMigrator performMigrationIfNeeded](&OBJC_CLASS___PBSMigrator, "performMigrationIfNeeded");
  id v12 = +[HBUIApplicationStateObserver sharedInstance](&OBJC_CLASS___HBUIApplicationStateObserver, "sharedInstance");
  return 1;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  *(void *)v30 = 0x1D00000001LL;
  unsigned int v28 = 0;
  size_t v27 = 4LL;
  int v5 = sysctl(v30, 2u, &v28, &v27, 0LL, 0LL);
  int v6 = v28;
  if (v5) {
    int v6 = -1;
  }
  unsigned int v28 = v6;
  if (!getrlimit(8, &v26))
  {
    unsigned int rlim_max = -1;
    if (v26.rlim_max < 0xFFFFFFFF) {
      unsigned int rlim_max = v26.rlim_max;
    }
    if (v28 >= rlim_max) {
      rlim_t v8 = rlim_max;
    }
    else {
      rlim_t v8 = v28;
    }
    if (v26.rlim_cur >> 11 <= 2 && v26.rlim_cur < v8)
    {
      rlimit v25 = v26;
      if (v8 >= 0x1800) {
        rlim_t v8 = 6144LL;
      }
      v25.rlim_cur = v8;
      setrlimit(8, &v25);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  [v9 listen];

  +[AVAudioSession hbui_configureMixWithOthers](&OBJC_CLASS___AVAudioSession, "hbui_configureMixWithOthers");
  v10 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 firstObject]);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 stringByAppendingPathComponent:v14]);

  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByAppendingPathComponent:@"AssetLibrary"]);
  +[TVAssetLibrary initializeAssetLibraryWithCachePath:]( &OBJC_CLASS___TVAssetLibrary,  "initializeAssetLibraryWithCachePath:",  v16);
  id v17 = +[HBIconCache sharedInstance](&OBJC_CLASS___HBIconCache, "sharedInstance");
  v18 = objc_alloc(&OBJC_CLASS___APSConnection);
  v19 = -[APSConnection initWithEnvironmentName:namedDelegatePort:queue:]( v18,  "initWithEnvironmentName:namedDelegatePort:queue:",  @"production",  APSConnectionOverrideNamedDelegatePort,  &_dispatch_main_q);
  apsConnection = self->_apsConnection;
  self->_apsConnection = v19;

  v21 = self->_apsConnection;
  v29 = @"com.apple.icloud-container.com.apple.HeadBoard";
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
  -[APSConnection setEnabledTopics:ignoredTopics:](v21, "setEnabledTopics:ignoredTopics:", v22, v23);

  -[APSConnection setDelegate:](self->_apsConnection, "setDelegate:", self);
  return 1;
}

- (id)application:(id)a3 configurationForConnectingSceneSession:(id)a4 options:(id)a5
{
  id v5 = objc_alloc(&OBJC_CLASS___UISceneConfiguration);
  id v6 = [v5 initWithName:0 sessionRole:UIWindowSceneSessionRoleApplication];
  [v6 setSceneClass:objc_opt_class(UIWindowScene)];
  [v6 setDelegateClass:objc_opt_class(HBWindowSceneDelegate)];
  return v6;
}

- (int64_t)overrideAssetLibraryCacheDeleteUrgency
{
  return 3LL;
}

+ (BOOL)isiCloudHomeScreenSyncEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[HBCloudSyncManager sharedCloudSyncManager]( &OBJC_CLASS___HBCloudSyncManager,  "sharedCloudSyncManager"));
  unsigned __int8 v3 = [v2 isiCloudSyncEnabled];

  return v3;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did receive public token %@ .......",  (uint8_t *)&v5,  0xCu);
  }

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412802;
    id v10 = a4;
    __int16 v11 = 2112;
    id v12 = a5;
    __int16 v13 = 2112;
    id v14 = a6;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did receive token %@ for topic %@ with identifier %@.......",  (uint8_t *)&v9,  0x20u);
  }

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did receive incoming message %@ .......",  (uint8_t *)&v5,  0xCu);
  }

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v27 = v8;
    __int16 v28 = 2112;
    id v29 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did receive message for topic %@ userinfo %@.......",  buf,  0x16u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKNotification notificationFromRemoteNotificationDictionary:]( &OBJC_CLASS___CKNotification,  "notificationFromRemoteNotificationDictionary:",  v9));
  if ([v10 notificationType] == (id)2)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordZoneID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedHeadBoardPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedHeadBoardPreferences"));
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:HBCloudPrefsZoneIDKey]);
    if (v13)
    {
      id v14 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", objc_opt_class(&OBJC_CLASS___CKRecordZoneID));
      v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver unarchivedObjectOfClasses:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClasses:fromData:error:",  v15,  v13,  0LL));

      rlimit v25 = v11;
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
      unsigned int v19 = [v17 isEqualToString:v18];

      BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if (v19)
      {
        if (v20)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
          *(_DWORD *)buf = 138412290;
          id v27 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Remote notification received for zone %@. Sync cloud changes to device..",  buf,  0xCu);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue( +[HBCloudSyncManager sharedCloudSyncManager]( &OBJC_CLASS___HBCloudSyncManager,  "sharedCloudSyncManager"));
        [v22 startSyncingCloudChangesToDevice:0];
        __int16 v11 = v25;
      }

      else
      {
        __int16 v11 = v25;
        if (v20)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
          v24 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
          *(_DWORD *)buf = 138412546;
          id v27 = v23;
          __int16 v28 = 2112;
          id v29 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Notifications for zone with name %@ don't match our cached zone with name %@. Reset sync params and sync clo ud changes to device",  buf,  0x16u);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue( +[HBCloudSyncManager sharedCloudSyncManager]( &OBJC_CLASS___HBCloudSyncManager,  "sharedCloudSyncManager"));
        [v22 startSyncingCloudChangesToDevice:1];
      }
    }
  }
}

- (void)connection:(id)a3 didSendOutgoingMessage:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did send outgoing message %@ .......",  (uint8_t *)&v5,  0xCu);
  }

- (void)connection:(id)a3 didFailToSendOutgoingMessage:(id)a4 error:(id)a5
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = a4;
    __int16 v9 = 2112;
    id v10 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did fail to send outgoing message %@ with error %@.......",  (uint8_t *)&v7,  0x16u);
  }

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
    int v6 = 138412290;
    int v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "did change connected status to %@ .......",  (uint8_t *)&v6,  0xCu);
  }

- (void)connectionDidReconnect:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "connection did reconnect .......",  v3,  2u);
  }

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412802;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v8;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "HBAppDelegate -application: %@ openURL: %@ options: %@",  (uint8_t *)&v12,  0x20u);
  }

  unsigned int v10 = [v7 _shouldHandleTestURL:v8];
  if (v10) {
    [v7 handleTestURL:v8];
  }

  return v10 ^ 1;
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = HBPurplePerformanceTestLog();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v20 = 138412290;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "HBAppDelegate runTest: %@", (uint8_t *)&v20, 0xCu);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 connectedScenes]);
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 anyObject]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 windows]);
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[HBPurplePerformanceTestContext contextWithWindow:]( &OBJC_CLASS___HBPurplePerformanceTestContext,  "contextWithWindow:",  v16));
  BOOL v18 = -[HBAppDelegate runTestName:options:context:](self, "runTestName:options:context:", v8, v9, v17);

  return v18;
}

- (APSConnection)apsConnection
{
  return self->_apsConnection;
}

- (void)setApsConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (BOOL)runTestName:(id)a3 options:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v100 = a5;
  id v10 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"iterations"]);
  uint64_t v11 = v10;
  if (!v10) {
    id v10 = &off_10000C7F0;
  }
  id v12 = [v10 integerValue];

  if ([v8 isEqualToString:@"LogTest"])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v13 startedTest:@"LogTest"];

    uint64_t v15 = HBPurplePerformanceTestLog(v14);
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "LogTest running with %@",  (uint8_t *)&buf,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v17 finishedTest:@"LogTest" extraResults:0];

    goto LABEL_23;
  }

  if ([v8 isEqualToString:@"RecapSmokeTest"])
  {
    BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  3LL));
    v133[0] = v18;
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
    v133[1] = v19;
    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  0LL,  2LL));
    v133[2] = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
    v133[3] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v133, 4LL));
    id v23 = sub_100006BB8(v22, (uint64_t)v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    -[HBAppDelegate _performTestCommands:withTestName:](self, "_performTestCommands:withTestName:", v24, v8);
LABEL_23:
    BOOL v26 = 1;
    goto LABEL_24;
  }

  if ([v8 isEqualToString:@"DisplayType"])
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[CADisplay mainDisplay](&OBJC_CLASS___CADisplay, "mainDisplay"));
    rlimit v25 = (void *)objc_claimAutoreleasedReturnValue([v97 currentMode]);
    BOOL v26 = v25 != 0LL;
    if (v25)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      [v27 startedTest:v8];

      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      v131[0] = @"DisplayResolutionWidth";
      v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v25 width]));
      v132[0] = v94;
      v132[1] = @"px";
      v131[1] = @"DisplayResolutionWidthUnits";
      v131[2] = @"DisplayResolutionHeight";
      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v25 height]));
      v132[2] = v29;
      v132[3] = @"px";
      v131[3] = @"DisplayResolutionHeightUnits";
      v131[4] = @"DisplayIsSDR";
      v30 = (void *)objc_claimAutoreleasedReturnValue([v25 hdrMode]);
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v30 isEqual:kCADisplayModeSDR]));
      v132[4] = v31;
      v131[5] = @"DisplayIsSDRUnits";
      v132[5] = @"BOOL";
      v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v132,  v131,  6LL));
      [v28 finishedTest:v8 extraResults:v32];
    }

    else
    {
      uint64_t v43 = HBPurplePerformanceTestLog(0LL);
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR)) {
        sub_100007A88((os_log_t)v28);
      }
    }
  }

  else
  {
    if ([v8 hasPrefix:@"TopShelfSwipeTest"])
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue([v100 appGridView]);
      id v34 = sub_100006C28(v8);
      v118[0] = _NSConcreteStackBlock;
      v118[1] = 3221225472LL;
      v118[2] = sub_100006C98;
      v118[3] = &unk_10000C358;
      id v120 = v12;
      v118[4] = self;
      id v119 = v8;
      -[HBAppDelegate _navigateToTopShelfFromDockIndex:appGridView:completion:]( self,  "_navigateToTopShelfFromDockIndex:appGridView:completion:",  v34,  v33,  v118);

      goto LABEL_23;
    }

    if ([v8 isEqualToString:@"AppGridSwipeTest"])
    {
      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472LL;
      v116[2] = sub_100006EAC;
      v116[3] = &unk_10000C380;
      id v35 = (id)objc_claimAutoreleasedReturnValue([v100 appGridView]);
      id v117 = v35;
      v98 = objc_retainBlock(v116);
      v114[0] = _NSConcreteStackBlock;
      v114[1] = 3221225472LL;
      v114[2] = sub_100006F44;
      v114[3] = &unk_10000C380;
      id v115 = v35;
      id v92 = v35;
      v95 = objc_retainBlock(v114);
      v36 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:condition:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:condition:",  0LL,  1LL,  v98));
      v130[0] = v36;
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
      v130[1] = v37;
      v38 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:condition:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:condition:",  0LL,  0LL,  v95));
      v130[2] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 0.5));
      v130[3] = v39;
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v130, 4LL));
      id v41 = sub_100006BB8(v40, (uint64_t)v12);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);

      -[HBAppDelegate _performTestCommands:withTestName:](self, "_performTestCommands:withTestName:", v42, v8);
      goto LABEL_23;
    }

    if ([v8 isEqualToString:@"EachDockIconTest"])
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue([v100 appGridView]);
      v45 = (void *)objc_claimAutoreleasedReturnValue([v44 layout]);
      id v46 = [v45 numberOfColumns];

      v47 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  3LL));
      v129[0] = v47;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
      v129[1] = v48;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v129, 2LL));
      id v50 = sub_100006BB8(v49, (uint64_t)v46);
      v51 = (void *)objc_claimAutoreleasedReturnValue(v50);

      v52 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  2LL));
      v128[0] = v52;
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
      v128[1] = v53;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v128, 2LL));
      id v55 = sub_100006BB8(v54, (uint64_t)v46);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);

      v57 = (void *)objc_claimAutoreleasedReturnValue([v51 arrayByAddingObjectsFromArray:v56]);
      id v58 = sub_100006BB8(v57, (uint64_t)v12);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);

      -[HBAppDelegate _performTestCommands:withTestName:](self, "_performTestCommands:withTestName:", v59, v8);
      goto LABEL_23;
    }

    if ([v8 hasPrefix:@"DockToGridTest"])
    {
      id v60 = sub_100006C28(v8);
      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472LL;
      v111[2] = sub_100006FD0;
      v111[3] = &unk_10000C3A8;
      id v113 = v12;
      v111[4] = self;
      id v112 = v8;
      -[HBAppDelegate _navigateToDockIndex:completion:](self, "_navigateToDockIndex:completion:", v60, v111);

      goto LABEL_23;
    }

    if ([v8 isEqualToString:@"OpenCloseFolderTest"])
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue([v100 appGridViewController]);
      v63 = (void *)objc_claimAutoreleasedReturnValue([v62 rootFolderProvider]);
      v99 = (void *)objc_claimAutoreleasedReturnValue([v63 rootFolder]);

      v96 = (void *)objc_claimAutoreleasedReturnValue([v99 items]);
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v126 = 0x2020000000LL;
      uint64_t v127 = 0x7FFFFFFFFFFFFFFFLL;
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472LL;
      v110[2] = sub_1000070F8;
      v110[3] = &unk_10000C3D0;
      v110[4] = &buf;
      id v64 = [v96 enumerateObjectsUsingBlock:v110];
      uint64_t v65 = *(void *)(*((void *)&buf + 1) + 24LL);
      BOOL v26 = v65 != 0x7FFFFFFFFFFFFFFFLL;
      if (v65 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v88 = HBPurplePerformanceTestLog(v64);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          sub_100007AC8((uint64_t)v8, v67);
        }
      }

      else
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue([v100 appGridView]);
        v67 = (os_log_s *)objc_claimAutoreleasedReturnValue([v66 layout]);

        uint64_t v68 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  *(void *)(*((void *)&buf + 1) + 24LL),  0LL));
        id v93 = -[os_log_s rowFromIndexPath:](v67, "rowFromIndexPath:", v68);
        v91 = (void *)v68;
        id v69 = -[os_log_s colFromIndexPath:](v67, "colFromIndexPath:", v68);
        v70 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  3LL));
        v124 = v70;
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v124, 1LL));
        id v72 = sub_100006BB8(v71, (uint64_t)v69);
        v73 = (void *)objc_claimAutoreleasedReturnValue(v72);

        v74 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  1LL));
        v123 = v74;
        v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v123, 1LL));
        id v76 = sub_100006BB8(v75, (uint64_t)v93);
        v77 = (void *)objc_claimAutoreleasedReturnValue(v76);

        v78 = (void *)objc_claimAutoreleasedReturnValue([v73 arrayByAddingObjectsFromArray:v77]);
        id v79 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472LL;
        v107[2] = sub_100007170;
        v107[3] = &unk_10000C3A8;
        id v109 = v12;
        v107[4] = self;
        id v108 = v8;
        [v79 evaluateCommands:v78 completion:v107];
      }

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      if ([v8 isEqualToString:@"LetsJiggle"])
      {
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 1LL));
        v122[0] = v80;
        v81 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
        v122[1] = v81;
        v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v122, 2LL));

        id v83 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
        v104[0] = _NSConcreteStackBlock;
        v104[1] = 3221225472LL;
        v104[2] = sub_100007290;
        v104[3] = &unk_10000C3A8;
        id v106 = v12;
        v104[4] = self;
        id v105 = v8;
        [v83 evaluateCommands:v82 completion:v104];

        goto LABEL_23;
      }

      if ([v8 isEqualToString:@"ShowHideControlCenter"])
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapButtonCommand button:](&OBJC_CLASS___TVRecapButtonCommand, "button:", 1LL));
        v121[0] = v84;
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[TVRecapDelayCommand delay:](&OBJC_CLASS___TVRecapDelayCommand, "delay:", 1.0));
        v121[1] = v85;
        v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v121, 2LL));

        id v87 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
        v101[0] = _NSConcreteStackBlock;
        v101[1] = 3221225472LL;
        v101[2] = sub_1000073F4;
        v101[3] = &unk_10000C3A8;
        id v103 = v12;
        v101[4] = self;
        id v102 = v8;
        [v87 evaluateCommands:v86 completion:v101];

        goto LABEL_23;
      }

      uint64_t v89 = ((uint64_t (*)(void))HBPurplePerformanceTestLog)();
      v90 = (os_log_s *)objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v90,  OS_LOG_TYPE_DEFAULT,  "HBAppDelegate did not recognize test: %@",  (uint8_t *)&buf,  0xCu);
      }

      BOOL v26 = 0;
    }
  }

- (void)_performTestCommands:(id)a3 withTestName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  [v8 startedTest:v5];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000075E4;
  v10[3] = &unk_10000C3F8;
  id v11 = v5;
  id v9 = v5;
  [v7 evaluateCommands:v6 completion:v10];
}

- (void)_navigateToTopShelfFromDockIndex:(unint64_t)a3 appGridView:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  v21[3] = 0LL;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10000777C;
  v18[3] = &unk_10000C420;
  int v20 = v21;
  id v10 = v8;
  id v19 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100007830;
  v14[3] = &unk_10000C470;
  id v11 = objc_retainBlock(v18);
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v15 = v13;
  -[HBAppDelegate _navigateToDockIndex:completion:](self, "_navigateToDockIndex:completion:", a3, v14);

  _Block_object_dispose(v21, 8);
}

- (void)_navigateToDockIndex:(unint64_t)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[TVRecapFocusCommand focusAction:direction:]( &OBJC_CLASS___TVRecapFocusCommand,  "focusAction:direction:",  1LL,  3LL));
  id v11 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  id v8 = sub_100006BB8(v7, a3);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  id v10 = objc_alloc_init(&OBJC_CLASS___TVRecapCommandPerformer);
  [v10 evaluateCommands:v9 completion:v5];
}

@end