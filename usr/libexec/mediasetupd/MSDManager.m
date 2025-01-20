@interface MSDManager
+ (id)sharedInstance;
- (CUCoalescer)coalescer;
- (MSDAppSelectionAssistant)assistant;
- (MSDDefaultsManager)defaultsManager;
- (MSDHomeSettingsInterface)settingsInterface;
- (MSDManager)init;
- (MSDProfilesManager)profilesManager;
- (MSServer)server;
- (MSServerMediator)mediator;
- (OS_dispatch_queue)startupQueue;
- (void)_initializeBackgroundActivityTask;
- (void)_initializeCoalescerObject;
- (void)_markHomeKitInitialized;
- (void)_performMigrationSynchronously;
- (void)_performStartup;
- (void)_savePublicDBInfoInDefaults;
- (void)_schedulePublicDBRefreshBackgroundTask;
- (void)_scheduleRefreshTask;
- (void)_setupMultiUser;
- (void)_setupNotifications;
- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4;
- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5;
- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5;
- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6;
- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5;
- (void)getDefaultMediaServiceForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForAllUsers:(id)a3;
- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4;
- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4;
- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5;
- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5;
- (void)getSupportedThirdPartyMediaServices:(id)a3;
- (void)homeManager:(id)a3 didHomeKitSyncComplete:(id)a4;
- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5;
- (void)profilesManager:(id)a3 didAddProfiles:(id)a4;
- (void)profilesManager:(id)a3 didUpdateProfiles:(id)a4;
- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6;
- (void)setAssistant:(id)a3;
- (void)setCoalescer:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setMediator:(id)a3;
- (void)setProfilesManager:(id)a3;
- (void)setServer:(id)a3;
- (void)setSettingsInterface:(id)a3;
- (void)setStartupQueue:(id)a3;
- (void)setVersion:(unint64_t)a3 completion:(id)a4;
- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)thirdPartyMusicAvailable:(id)a3 completion:(id)a4;
- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6;
- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7;
@end

@implementation MSDManager

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E2DC;
  block[3] = &unk_100060A90;
  block[4] = a1;
  if (qword_1000707C8 != -1) {
    dispatch_once(&qword_1000707C8, block);
  }
  return (id)qword_1000707C0;
}

- (MSDManager)init
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___MSDManager;
  v2 = -[MSDManager init](&v26, "init");
  if (v2)
  {
    id v3 = sub_10003E9DC();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[MSDManager init]";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    defaultsManager = v2->_defaultsManager;
    v2->_defaultsManager = (MSDDefaultsManager *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mediasetupd.startupQueue", 0LL);
    startupQueue = v2->_startupQueue;
    v2->_startupQueue = (OS_dispatch_queue *)v7;

    objc_initWeak((id *)buf, v2);
    v9 = (dispatch_queue_s *)v2->_startupQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001E574;
    block[3] = &unk_1000619C8;
    objc_copyWeak(&v25, (id *)buf);
    dispatch_async(v9, block);
    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.mediasetup.publicdb-refresh-queue", v11);
    publicDBRefreshQueue = v2->_publicDBRefreshQueue;
    v2->_publicDBRefreshQueue = (OS_dispatch_queue *)v12;

    v2->_homeKitSyncComplete = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    [v14 addDelegate:v2];

    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[MSDHomeSettingsInterface shared](&OBJC_CLASS___MSDHomeSettingsInterface, "shared"));
    settingsInterface = v2->_settingsInterface;
    v2->_settingsInterface = (MSDHomeSettingsInterface *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___MSDAppSelectionAssistant);
    assistant = v2->_assistant;
    v2->_assistant = v17;

    v19 = -[MSServerMediator initWithAccountsDelegate:homeSettingsDelegate:]( objc_alloc(&OBJC_CLASS___MSServerMediator),  "initWithAccountsDelegate:homeSettingsDelegate:",  v2,  v2->_settingsInterface);
    mediator = v2->_mediator;
    v2->_mediator = v19;

    v21 = -[MSServer initWithMediator:](objc_alloc(&OBJC_CLASS___MSServer), "initWithMediator:", v2->_mediator);
    server = v2->_server;
    v2->_server = v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }

  return v2;
}

- (void)_performStartup
{
  id v3 = +[MSDPushService sharedService](&OBJC_CLASS___MSDPushService, "sharedService");
  uint64_t v5 = (MSDProfilesManager *)objc_opt_new(&OBJC_CLASS___MSDProfilesManager, v4);
  profilesManager = self->_profilesManager;
  self->_profilesManager = v5;

  -[MSDProfilesManager setDelegate:](self->_profilesManager, "setDelegate:", self);
  -[MSDManager _setupNotifications](self, "_setupNotifications");
  -[MSDManager _schedulePublicDBRefreshBackgroundTask](self, "_schedulePublicDBRefreshBackgroundTask");
}

- (void)_performMigrationSynchronously
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___MSDMigrator, a2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001E698;
  v4[3] = &unk_100060F30;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v3 = v5;
  [v2 performMigrationIfNeeded:v4];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_setupMultiUser
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 homeManager]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainerID](&OBJC_CLASS___CKContainer, "MSDCloudKitContainerID"));
  v14 = v4;
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  [v3 registerToAcceptCloudSharesForContainers:v5];

  if (+[MSDeviceInfo deviceCanManageMultiUser](&OBJC_CLASS___MSDeviceInfo, "deviceCanManageMultiUser"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudManager]);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 privateCloudDatabase]);
    [v7 addSubscriptionForDatabase:v9];

    dispatch_queue_attr_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 cloudManager]);
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[CKContainer MSDCloudKitContainer](&OBJC_CLASS___CKContainer, "MSDCloudKitContainer"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sharedCloudDatabase]);
    [v11 addSubscriptionForDatabase:v13];
  }

- (void)_setupNotifications
{
  id v3 = sub_10003E9DC();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Initializing XPC event stream handler",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  dispatch_semaphore_t v5 = &_dispatch_main_q;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10001E990;
  handler[3] = &unk_1000619F0;
  objc_copyWeak(&v7, buf);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", &_dispatch_main_q, handler);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)_initializeCoalescerObject
{
  id v3 = objc_alloc_init(&OBJC_CLASS___CUCoalescer);
  -[CUCoalescer setDispatchQueue:](v3, "setDispatchQueue:", &_dispatch_main_q);
  -[CUCoalescer setMinDelay:](v3, "setMinDelay:", MSMinDelayInSecForSchedulingCoalescerTask);
  -[CUCoalescer setMaxDelay:](v3, "setMaxDelay:", MSMaxDelayInSecsForSchedulingCoalescerTask);
  -[CUCoalescer setInvalidationHandler:](v3, "setInvalidationHandler:", &stru_100061A10);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001EE0C;
  v9[3] = &unk_1000619C8;
  objc_copyWeak(&v10, &location);
  -[CUCoalescer setActionHandler:](v3, "setActionHandler:", v9);
  id v4 = sub_10003E9DC();
  dispatch_semaphore_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Initialized CUCoalescer object %{private}@",  buf,  0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001EE88;
  v7[3] = &unk_1000616D8;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_async(&_dispatch_main_q, v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_scheduleRefreshTask
{
  id v3 = sub_10003E9DC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling task to refresh data with CloudKit",  v5,  2u);
  }

  -[MSDManager _initializeBackgroundActivityTask](self, "_initializeBackgroundActivityTask");
}

- (void)_initializeBackgroundActivityTask
{
  v2 = objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler);
  dispatch_semaphore_t v5 = -[NSBackgroundActivityScheduler initWithIdentifier:]( v2,  "initWithIdentifier:",  kBackgroundActivityDataRefreshTaskIdentifier);
  -[NSBackgroundActivityScheduler invalidate](v5, "invalidate");
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(2LL, 0LL);
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v4, &stru_100061A30);
}

- (void)_savePublicDBInfoInDefaults
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
  unsigned __int8 v3 = [v2 shouldUseCloudKit];

  if ((v3 & 1) != 0)
  {
    id v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001F1EC;
    v11[3] = &unk_100061A78;
    v6 = v4;
    dispatch_queue_t v12 = v6;
    [v5 syncDataWithCloudKit:v11];

    dispatch_time_t v7 = dispatch_time(0LL, 1000000000LL * MSMaxWaitInSecondsForFetchDataFromCloudKit);
    if (dispatch_group_wait(v6, v7))
    {
      id v8 = sub_10003E9DC();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100024FE8();
      }
    }
  }

  else
  {
    id v10 = sub_10003E9DC();
    v6 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v14 = MSPublicDatabaseRefreshIntervalInSecs / 3600.0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Its been less than %f hours since last Public Database refresh, skipping check",  buf,  0xCu);
    }
  }
}

- (void)_markHomeKitInitialized
{
  publicDBRefreshQueue = (dispatch_queue_s *)self->_publicDBRefreshQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001F2F0;
  block[3] = &unk_100060E40;
  void block[4] = self;
  dispatch_async(publicDBRefreshQueue, block);
}

- (void)_schedulePublicDBRefreshBackgroundTask
{
  id v3 = sub_10003E9DC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Scheduling background task for publicDB refreshes",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  dispatch_semaphore_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  publicDBRefreshQueue = self->_publicDBRefreshQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001F424;
  v7[3] = &unk_100061AC8;
  objc_copyWeak(&v8, buf);
  [v5 registerForTaskWithIdentifier:@"com.apple.mediasetupd.publicDBRefresh" usingQueue:publicDBRefreshQueue launchHandler:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)getAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10003E9DC();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v35 = v7;
    __int16 v36 = 2113;
    id v37 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "User is requesting available services for HomeID %{private}@ and HomeUserID %{private}@",  buf,  0x16u);
  }

  if (v7 && v8)
  {
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v30[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    v31[0] = v13;
    v30[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    double v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v31[1] = v14;
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10001F964;
    v28[3] = &unk_100061AF0;
    id v29 = v9;
    [v12 getAvailableServices:v15 completion:v28];

    v16 = v29;
LABEL_10:

    goto LABEL_11;
  }

  id v17 = sub_10003E9DC();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_10002511C(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  if (v9)
  {
    uint64_t v26 = MSErrorDomain;
    uint64_t v32 = MSUserInfoErrorStringKey;
    v33 = @"Failed to fetch available services, NIL identifiers provided";
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  3LL,  v16));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v27);

    goto LABEL_10;
  }

- (void)getMediaServiceChoicesForAllUsers:(id)a3
{
  id v4 = a3;
  id v5 = sub_10003E9DC();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = "-[MSDManager getMediaServiceChoicesForAllUsers:]";
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s Requesting media services for all users in the home",  buf,  0xCu);
    }

    objc_initWeak((id *)buf, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    void v30[2] = sub_10001FD88;
    v30[3] = &unk_100061B18;
    objc_copyWeak(&v32, (id *)buf);
    id v8 = v4;
    id v31 = v8;
    id v9 = objc_retainBlock(v30);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDSettingsDefaults settingsDefaults](&OBJC_CLASS___MSDSettingsDefaults, "settingsDefaults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 userSettingsDefaults]);
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"AccessoryUsersInAccessoryHome"]);

    if ([v12 count])
    {
      id v13 = sub_10003E9DC();
      double v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v29 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Found users in the cache. Preferring cache to home manager for users in the home",  v29,  2u);
      }

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "na_map:", &stru_100061B58));
      ((void (*)(void *, void *))v9[2])(v9, v15);
    }

    else
    {
      id v23 = sub_10003E9DC();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v29 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Consulting home manager for users in the home",  v29,  2u);
      }

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_10001FF3C;
      v26[3] = &unk_100061B80;
      id v27 = v8;
      v28 = v9;
      [v25 awaitCurrentHomeWithCompletion:v26];

      uint64_t v15 = v27;
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000251EC(v7, v16, v17, v18, v19, v20, v21, v22);
    }
  }
}

- (void)getCachedAvailableServices:(id)a3 userIdentifier:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10003E9DC();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v30 = v7;
    __int16 v31 = 2113;
    id v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "User is requesting available services for HomeID %{private}@ and HomeUserID %{private}@",  buf,  0x16u);
  }

  if (v7 && v8)
  {
    dispatch_queue_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_1000203A4;
    v25[3] = &unk_100061AF0;
    id v26 = v9;
    [v12 getCachedAvailableServices:v8 homeID:v7 completion:v25];

    id v13 = v26;
LABEL_10:

    goto LABEL_11;
  }

  id v14 = sub_10003E9DC();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10002511C(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  if (v9)
  {
    uint64_t v23 = MSErrorDomain;
    uint64_t v27 = MSUserInfoErrorStringKey;
    v28 = @"Failed to fetch available services, NIL identifiers provided";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  3LL,  v13));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v24);

    goto LABEL_10;
  }

- (void)thirdPartyMusicAvailable:(id)a3 completion:(id)a4
{
  id v5 = a3;
  if (v5)
  {
    v6 = (void (**)(id, id))a4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    id v8 = [v7 thirdPartyMusicAvailable:v5];

    id v9 = sub_10003E9DC();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((_DWORD)v8) {
        int v11 = 89;
      }
      else {
        int v11 = 78;
      }
      int v12 = 136315394;
      id v13 = "-[MSDManager thirdPartyMusicAvailable:completion:]";
      __int16 v14 = 1024;
      int v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s available %c", (uint8_t *)&v12, 0x12u);
    }

    v6[2](v6, v8);
  }

  else
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }
}

- (void)addMediaService:(id)a3 usingSetupBundles:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_retainBlock(v10);
  if (v11)
  {
    if (v9 && [v9 count])
    {
      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "na_map:", &stru_100061BC0));
      id v13 = sub_10003E9DC();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        id v34 = v8;
        __int16 v35 = 2113;
        __int16 v36 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "User is requesting to add %{private}@ to homes: %{private}@",  buf,  0x16u);
      }

      int v15 = (void *)objc_claimAutoreleasedReturnValue( +[MSDTransactionTask createTransactionWithIdentifier:]( &OBJC_CLASS___MSDTransactionTask,  "createTransactionWithIdentifier:",  kAddServiceTransactionIdentifier));
      objc_initWeak((id *)buf, self);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000208C4;
      v27[3] = &unk_100061C38;
      id v31 = v11;
      id v16 = v15;
      id v28 = v16;
      objc_copyWeak(&v32, (id *)buf);
      id v29 = v8;
      id v30 = v9;
      +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:]( &OBJC_CLASS___MSAuthTokenProvider,  "fetchAuthTokensForMediaService:networkActivity:completion:",  v29,  0LL,  v27);

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      id v17 = sub_10003E9DC();
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100025448();
      }

      int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  3LL,  0LL));
      (*((void (**)(id, void, os_log_s *))v11 + 2))(v11, 0LL, v12);
    }
  }

  else
  {
    id v19 = sub_10003E9DC();
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000253D8(v12, v20, v21, v22, v23, v24, v25, v26);
    }
  }
}

- (void)removeMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = sub_10003E9DC();
  int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceID]);
    *(_DWORD *)buf = 138478339;
    v51 = v16;
    __int16 v52 = 2113;
    id v53 = v11;
    __int16 v54 = 2113;
    id v55 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "User is requesting to remove %{private}@ for HomeID %{private}@ and HomeUserID %{private}@",  buf,  0x20u);
  }

  if (([v10 isServiceRemovable] & 1) == 0)
  {
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 serviceID]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Removing service %@ is prohibited",  v23));

    id v24 = sub_10003E9DC();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (v13)
    {
      uint64_t v26 = MSErrorDomain;
      uint64_t v48 = MSUserInfoErrorStringKey;
      v49 = v21;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  1LL,  v27));
      v13[2](v13, 0LL, v28);
    }

    goto LABEL_15;
  }

  if (v11 && v12)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v44[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    v45[0] = v18;
    v44[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    v45[1] = v19;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v45,  v44,  2LL));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10002113C;
    v40[3] = &unk_100061BE8;
    id v41 = v10;
    v42 = self;
    v43 = v13;
    [v17 removeMediaService:v41 withUserInfo:v20 completion:v40];

    uint64_t v21 = v41;
LABEL_15:

    goto LABEL_16;
  }

  id v29 = sub_10003E9DC();
  id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_10002563C(v30, v31, v32, v33, v34, v35, v36, v37);
  }

  if (v13)
  {
    uint64_t v38 = MSErrorDomain;
    uint64_t v46 = MSUserInfoErrorStringKey;
    v47 = @"Failed to remove service, NIL identifiers provided";
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v38,  3LL,  v21));
    v13[2](v13, 0LL, v39);

    goto LABEL_15;
  }

- (void)updateDefaultMediaService:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_10003E9DC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceID]);
    *(_DWORD *)buf = 138478339;
    v39 = v15;
    __int16 v40 = 2113;
    id v41 = v10;
    __int16 v42 = 2113;
    id v43 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "User is requesting to update default service %{private}@ for HomeID %{private}@ and HomeUserID %{private}@",  buf,  0x20u);
  }

  if (v10 && v11)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v34[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
    v35[0] = v17;
    v34[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 UUIDString]);
    v35[1] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  2LL));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10002153C;
    v32[3] = &unk_100060FF8;
    id v33 = v12;
    [v16 updateDefaultMediaService:v9 withUserInfo:v19 completion:v32];

    uint64_t v20 = v33;
LABEL_10:

    goto LABEL_11;
  }

  id v21 = sub_10003E9DC();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10002570C(v22, v23, v24, v25, v26, v27, v28, v29);
  }

  if (v12)
  {
    uint64_t v30 = MSErrorDomain;
    uint64_t v36 = MSUserInfoErrorStringKey;
    uint64_t v37 = @"Failed to update default service, NIL identifiers provided";
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  3LL,  v20));
    (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v31);

    goto LABEL_10;
  }

- (void)getDefaultMediaService:(id)a3 homeUserID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10003E9DC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v35 = v7;
    __int16 v36 = 2113;
    id v37 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "User is requesting to fetch default service for HomeID %{private}@ and HomeUserID %{private}@",  buf,  0x16u);
  }

  if (v7 && v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v30[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
    v31[0] = v13;
    v30[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    v31[1] = v14;
    int v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v31,  v30,  2LL));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_10002184C;
    v28[3] = &unk_100061C60;
    id v29 = v9;
    [v12 getDefaultMediaService:v15 completion:v28];

    id v16 = v29;
LABEL_10:

    goto LABEL_11;
  }

  id v17 = sub_10003E9DC();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    sub_1000257DC(v18, v19, v20, v21, v22, v23, v24, v25);
  }

  if (v9)
  {
    uint64_t v26 = MSErrorDomain;
    uint64_t v32 = MSUserInfoErrorStringKey;
    id v33 = @"Failed to fetch default service, NIL identifiers provided";
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  3LL,  v16));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v27);

    goto LABEL_10;
  }

- (void)updateProperty:(id)a3 homeID:(id)a4 homeUserID:(id)a5 withOptions:(id)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void (**)(void, void, void))v15;
  if (!v11)
  {
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v25 = MSErrorDomain;
    uint64_t v54 = MSUserInfoErrorStringKey;
    id v55 = @"Nil MediaService object";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    uint64_t v26 = v25;
    uint64_t v27 = 2LL;
LABEL_16:
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v26,  v27,  v24));
    ((void (**)(void, void, void *))v16)[2](v16, 0LL, v39);

    goto LABEL_17;
  }

  if (!v14)
  {
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v28 = MSErrorDomain;
    uint64_t v52 = MSUserInfoErrorStringKey;
    id v53 = @"Nil property values";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    uint64_t v26 = v28;
    uint64_t v27 = 1LL;
    goto LABEL_16;
  }

  id v17 = sub_10003E9DC();
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v11 serviceID]);
    *(_DWORD *)buf = 138478339;
    v47 = v19;
    __int16 v48 = 2113;
    id v49 = v12;
    __int16 v50 = 2113;
    id v51 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "User is requesting to update property for %{private}@ for HomeID %{private}@ and HomeUserID %{private}@",  buf,  0x20u);
  }

  if (v12 && v13)
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v42[0] = kCKDatabaseAccessUserInfoHomeIDKey;
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    v43[0] = v21;
    v42[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v13 UUIDString]);
    v43[1] = v22;
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v43,  v42,  2LL));
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100021D20;
    v40[3] = &unk_100060FF8;
    id v41 = v16;
    [v20 updateProperty:v11 propertyInfo:v14 withUserInfo:v23 completion:v40];

    uint64_t v24 = v41;
LABEL_17:

    goto LABEL_18;
  }

  id v29 = sub_10003E9DC();
  uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
    sub_1000258AC(v30, v31, v32, v33, v34, v35, v36, v37);
  }

  if (v16)
  {
    uint64_t v38 = MSErrorDomain;
    uint64_t v44 = MSUserInfoErrorStringKey;
    v45 = @"Failed to update property, NIL identifiers provided";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
    uint64_t v26 = v38;
    uint64_t v27 = 3LL;
    goto LABEL_16;
  }

- (void)getServiceConfigurationInfo:(id)a3 serviceID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = sub_10003E9DC();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v30 = v7;
    __int16 v31 = 2112;
    id v32 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "User is requesting to fetch service info for %{private}@ and serviceID %@",  buf,  0x16u);
  }

  if (v7 && [v7 count])
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100021FC0;
    v25[3] = &unk_100061C88;
    id v26 = v9;
    [v12 getServiceConfigurationInfo:v7 serviceID:v8 completion:v25];

    id v13 = v26;
LABEL_10:

    goto LABEL_11;
  }

  id v14 = sub_10003E9DC();
  id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_10002597C(v15, v16, v17, v18, v19, v20, v21, v22);
  }

  if (v9)
  {
    uint64_t v23 = MSErrorDomain;
    NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
    uint64_t v28 = @"Failed to fetch service config info for Nil homeUserID";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v23,  1LL,  v13));
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v24);

    goto LABEL_10;
  }

- (void)getDefaultMediaServiceForAllUsers:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentHome]);

  id v6 = sub_10003E9DC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    uint64_t v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Configured home to %{private}@", buf, 0xCu);
  }

  if (v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 allUsersIdentifiers]);
    id v9 = v8;
    if (v8 && [v8 count])
    {
      id v10 = sub_10003E9DC();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "User is requesting to fetch default services for all users",  buf,  2u);
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100022370;
      v21[3] = &unk_100061C88;
      id v22 = v3;
      [v12 getDefaultMediaServiceForAllUsers:v9 completion:v21];

      id v13 = v22;
    }

    else
    {
      id v14 = sub_10003E9DC();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100025A4C();
      }

      if (!v3) {
        goto LABEL_18;
      }
      uint64_t v16 = MSErrorDomain;
      uint64_t v23 = MSUserInfoErrorStringKey;
      uint64_t v24 = @"Failed to fetch all users in home";
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  4LL,  v13));
      (*((void (**)(id, void, void *))v3 + 2))(v3, 0LL, v17);
    }

- (void)getPublicInfoForBundleID:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000224C0;
    v7[3] = &unk_100061CB0;
    id v8 = v5;
    id v9 = v6;
    +[MSDPublicDBManager getPublicInfoForBundleID:completion:]( &OBJC_CLASS___MSDPublicDBManager,  "getPublicInfoForBundleID:completion:",  v8,  v7);
  }
}

- (void)getCachedServiceInfo:(id)a3 homeUserID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = sub_10003E9DC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    id v21 = v9;
    __int16 v22 = 2113;
    id v23 = v10;
    __int16 v24 = 2113;
    id v25 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "User is requesting for serviceInfo with bundleID %{private}@ homeUserID %{private}@ endpointID %{private}@",  buf,  0x20u);
  }

  if (v9)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
    [v15 getCachedServiceInfo:v9 homeUserID:v10 endpointID:v11 completion:v12];
LABEL_7:

    goto LABEL_8;
  }

  if (v12)
  {
    uint64_t v16 = MSErrorDomain;
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    uint64_t v19 = @"ServiceBundleID cannot be nil";
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  1LL,  v15));
    (*((void (**)(id, void, void, void *))v12 + 2))(v12, 0LL, 0LL, v17);

    goto LABEL_7;
  }

- (void)requestAuthRenewalForMediaService:(id)a3 homeUserID:(id)a4 parentNetworkActivity:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = sub_10003E9DC();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceID]);
    *(_DWORD *)buf = 136315651;
    __int16 v24 = "-[MSDManager requestAuthRenewalForMediaService:homeUserID:parentNetworkActivity:completion:]";
    __int16 v25 = 2113;
    id v26 = v15;
    __int16 v27 = 2113;
    id v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s for service: %{private}@ and homeUserID %{private}@",  buf,  0x20u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000228E4;
  v19[3] = &unk_100061CF8;
  id v20 = v10;
  id v21 = v9;
  id v22 = v11;
  id v16 = v11;
  id v17 = v9;
  id v18 = v10;
  +[MSAuthTokenProvider fetchAuthTokensForMediaService:networkActivity:completion:]( &OBJC_CLASS___MSAuthTokenProvider,  "fetchAuthTokensForMediaService:networkActivity:completion:",  v17,  v12,  v19);
}

- (void)getResolvedServiceInfo:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if (v5)
    {
      id v7 = -[MSDResolveService initWithIntent:](objc_alloc(&OBJC_CLASS___MSDResolveService), "initWithIntent:", v5);
      if (v7)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100022CAC;
        v12[3] = &unk_100060B30;
        id v13 = v6;
        -[MSDResolveService performResolutionRequest:](v7, "performResolutionRequest:", v12);
        id v8 = v13;
      }

      else
      {
        uint64_t v10 = MSErrorDomain;
        NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
        id v15 = @"Unexpected values in INIntent";
        id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v10,  1LL,  v8));
        (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v11);
      }
    }

    else
    {
      uint64_t v9 = MSErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      id v17 = @"INIntent cannot be nil";
      id v7 = (MSDResolveService *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v9,  1LL,  v7));
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v8);
    }
  }
}

- (void)getResolvedServiceInfo:(id)a3 sharedUserID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  if (v7)
  {
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = -[MSDResolveService initWithServiceBundleID:sharedUserID:endpointID:mediaRouteID:]( objc_alloc(&OBJC_CLASS___MSDResolveService),  "initWithServiceBundleID:sharedUserID:endpointID:mediaRouteID:",  v9,  v8,  0LL,  0LL);

    if (v10)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_100022E40;
      v14[3] = &unk_100060B30;
      id v15 = v7;
      -[MSDResolveService performResolutionRequest:](v10, "performResolutionRequest:", v14);
      id v11 = v15;
    }

    else
    {
      uint64_t v12 = MSErrorDomain;
      NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
      id v17 = @"Unable to resolve service, unexpected values passed";
      id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v12,  1LL,  v11));
      (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
    }
  }
}

- (void)setVersion:(unint64_t)a3 completion:(id)a4
{
  id v5 = (void (**)(id, void))a4;
  id v7 = (id)objc_opt_new(&OBJC_CLASS___MSDMigrator, v6);
  [v7 setCurrentVersion:a3];
  v5[2](v5, 0LL);
}

- (void)overrideAppleMusicSubscriptionStatus:(BOOL)a3 homeUserIDS:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  id v9 = sub_10003E9DC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    *(_DWORD *)buf = 136315650;
    id v17 = "-[MSDManager overrideAppleMusicSubscriptionStatus:homeUserIDS:completion:]";
    __int16 v18 = 2112;
    if (v6) {
      id v11 = @"YES";
    }
    uint64_t v19 = v11;
    __int16 v20 = 2112;
    id v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s Enable: %@ HomeUserID: %@", buf, 0x20u);
  }

  if (v6)
  {
    if (v7)
    {
      id v12 = v7;
    }

    else
    {
      uint64_t v15 = kOverrideAppleMusicSubscriptionStatusAllUsers;
      id v12 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    }

    id v13 = v12;
    NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    [v14 setObject:v13 forDefault:kOverrideAppleMusicSubscriptionStatus];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    [v13 removeObjectForDefault:kOverrideAppleMusicSubscriptionStatus];
  }

  if (v8) {
    v8[2](v8, 0LL);
  }
}

- (void)activeServiceApplicationInformationForSharedUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = a3;
    id v8 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v7);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10002310C;
    v9[3] = &unk_100061D20;
    id v10 = v6;
    -[MSDManager getMediaServiceChoicesForSharedUser:completion:]( self,  "getMediaServiceChoicesForSharedUser:completion:",  v8,  v9);
  }
}

- (void)switchUserAccountInfo:(id)a3 homeID:(id)a4 homeUserID:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v13 = sub_10003E9DC();
    NSErrorUserInfoKey v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Switching account info for user - %@ in home - %@, %@",  buf,  0x20u);
    }

    if (v9 && v10 && v11)
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_1000233AC;
      v19[3] = &unk_100061D48;
      id v20 = v9;
      id v21 = v12;
      [v15 switchUserAccountInfo:v20 homeID:v10 homeUserID:v11 completion:v19];

      NSErrorUserInfoKey v16 = v20;
    }

    else
    {
      uint64_t v17 = MSErrorDomain;
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      id v23 = @"Failed to switch user account info, Nil Attributes provided";
      NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v17,  1LL,  v16));
      (*((void (**)(id, void *))v12 + 2))(v12, v18);
    }
  }
}

- (void)getSupportedThirdPartyMediaServices:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  if (v4)
  {
    id v5 = sub_10003E9DC();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      NSErrorUserInfoKey v14 = "-[MSDManager getSupportedThirdPartyMediaServices:]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s Requesting supported third party media services",  (uint8_t *)&v13,  0xCu);
    }

    id v7 = (char *)objc_claimAutoreleasedReturnValue( -[MSDAppSelectionAssistant appServiceInfoForAllThirdPartyServices]( self->_assistant,  "appServiceInfoForAllThirdPartyServices"));
    if (v7)
    {
      id v8 = sub_10003E9DC();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        NSErrorUserInfoKey v14 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Returning supported services (found in cache) %@",  (uint8_t *)&v13,  0xCu);
      }

      v4[2](v4, v7, 0LL);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  7LL,  0LL));
      id v11 = sub_10003E9DC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100025C04();
      }

      ((void (**)(id, void *, void *))v4)[2](v4, 0LL, v10);
    }
  }
}

- (void)getMediaServiceChoicesForSharedUser:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = sub_10003E9DC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315395;
      id v21 = "-[MSDManager getMediaServiceChoicesForSharedUser:completion:]";
      __int16 v22 = 2113;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s Requesting media service choices for user: %{private}@",  buf,  0x16u);
    }

    if (v6
      && (+[MSAssistantPreferences isMultiUserEnabledForSiri]( &OBJC_CLASS___MSAssistantPreferences,  "isMultiUserEnabledForSiri") & 1) != 0)
    {
      objc_initWeak((id *)buf, self);
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[MSAssistantPreferences sharedPreferences]( &OBJC_CLASS___MSAssistantPreferences,  "sharedPreferences"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_100023900;
      v16[3] = &unk_100061D70;
      id v17 = v6;
      id v18 = v7;
      objc_copyWeak(&v19, (id *)buf);
      [v10 getHomeUserIDForSpeaker:v11 completion:v16];

      objc_destroyWeak(&v19);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MSDAppSelectionAssistant appServiceInfoForUser:]( self->_assistant,  "appServiceInfoForUser:",  0LL));
      if (v12)
      {
        (*((void (**)(id, void *, void))v7 + 2))(v7, v12, 0LL);
      }

      else
      {
        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  MSErrorDomain,  5LL,  0LL));
        id v14 = sub_10003E9DC();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_100025C64();
        }

        (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v13);
      }
    }
  }
}

- (void)profilesManager:(id)a3 didAddProfiles:(id)a4
{
  id v42 = a3;
  id v44 = a4;
  id v5 = sub_10003E9DC();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[MSDManager profilesManager:didAddProfiles:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v44;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s profile: %@", buf, 0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v67 = sub_100024154;
  v68 = sub_100024164;
  id v69 = (id)objc_opt_new(&OBJC_CLASS___NSMutableArray, v7);
  dispatch_semaphore_t v43 = dispatch_semaphore_create(0LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
  unsigned int v9 = [v8 shouldUseCloudKit];

  if (v9)
  {
    id v10 = sub_10003E9DC();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v62 = 136315394;
      v63 = "-[MSDManager profilesManager:didAddProfiles:]";
      __int16 v64 = 2048;
      double v65 = MSPublicDatabaseRefreshIntervalInSecs / 3600.0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s its been more than %f hours since last update: Pulling from CK",  v62,  0x16u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_10002416C;
    v57[3] = &unk_100061D98;
    v59 = buf;
    int v13 = v43;
    v58 = v13;
    [v12 syncDataWithCloudKit:v57];

    dispatch_time_t v14 = dispatch_time(0LL, 1000000000LL * MSMaxWaitInSecondsForFetchDataFromCloudKit);
    if (dispatch_semaphore_wait(v13, v14))
    {
      id v15 = sub_10003E9DC();
      NSErrorUserInfoKey v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100025DC8();
      }
    }

    id v17 = v58;
  }

  else
  {
    id v17 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue( +[MSDPublicDBManager getCachedPublicInfo]( &OBJC_CLASS___MSDPublicDBManager,  "getCachedPublicInfo"));
    id v18 = -[dispatch_semaphore_s mutableCopy](v17, "mutableCopy");
    id v19 = *(void **)(*(void *)&buf[8] + 40LL);
    *(void *)(*(void *)&buf[8] + 40LL) = v18;
  }

  id v20 = *(void **)(*(void *)&buf[8] + 40LL);
  if (v20 && [v20 count])
  {
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = v44;
    id v47 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v47)
    {
      uint64_t v46 = *(void *)v54;
      do
      {
        for (i = 0LL; i != v47; i = (char *)i + 1)
        {
          if (*(void *)v54 != v46) {
            objc_enumerationMutation(obj);
          }
          id v21 = *(const char **)(*((void *)&v53 + 1) + 8LL * (void)i);
          id v22 = sub_10003E9DC();
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v62 = 138412290;
            v63 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Attempting to configure system with profileData %@",  v62,  0xCu);
          }

          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(+[MSDPublicDBManager shared](&OBJC_CLASS___MSDPublicDBManager, "shared"));
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 createPublicDBInfoObjectFromDictionary:v21]);

          id v26 = [*(id *)(*(void *)&buf[8] + 40) mutableCopy];
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          __int128 v49 = 0u;
          __int128 v50 = 0u;
          id v27 = *(id *)(*(void *)&buf[8] + 40LL);
          id v28 = [v27 countByEnumeratingWithState:&v49 objects:v60 count:16];
          if (v28)
          {
            uint64_t v29 = *(void *)v50;
            do
            {
              for (j = 0LL; j != v28; j = (char *)j + 1)
              {
                if (*(void *)v50 != v29) {
                  objc_enumerationMutation(v27);
                }
                __int16 v31 = *(void **)(*((void *)&v49 + 1) + 8LL * (void)j);
                id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 serviceID]);
                uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v25 serviceID]);
                unsigned int v34 = [v32 isEqual:v33];

                if (v34) {
                  [v26 removeObjectIdenticalTo:v31];
                }
              }

              id v28 = [v27 countByEnumeratingWithState:&v49 objects:v60 count:16];
            }

            while (v28);
          }

          id v35 = [v26 mutableCopy];
          uint64_t v36 = *(void **)(*(void *)&buf[8] + 40LL);
          *(void *)(*(void *)&buf[8] + 40LL) = v35;

          objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "na_safeAddObject:", v25);
        }

        id v47 = [obj countByEnumeratingWithState:&v53 objects:v61 count:16];
      }

      while (v47);
    }

    id v37 = sub_10003E9DC();
    uint64_t v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = *(const char **)(*(void *)&buf[8] + 40LL);
      *(_DWORD *)v62 = 138412290;
      v63 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Updating PublicDB cachedCopy with Data %@",  v62,  0xCu);
    }

    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
    [v40 setObjectWithCustomClass:*(void *)(*(void *)&buf[8] + 40) forDefault:@"publicDBData"];
  }

  else
  {
    id v41 = sub_10003E9DC();
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_ERROR)) {
      sub_100025D9C();
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)profilesManager:(id)a3 didUpdateProfiles:(id)a4
{
  id v5 = a4;
  id v6 = [v5 count];
  id v7 = sub_10003E9DC();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v58 = "-[MSDManager profilesManager:didUpdateProfiles:]";
    __int16 v59 = 2112;
    id v60 = v5;
    __int16 v61 = 2048;
    id v62 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s profile: %@ activeProfilesOnDevice %lu",  buf,  0x20u);
  }

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
  unsigned __int8 v10 = [v9 profilesEverInstalled];

  id v11 = sub_10003E9DC();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if ((v10 & 1) != 0)
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Developer profile loaded on device, checking service sanity",  buf,  2u);
    }

    dispatch_time_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHomeManager sharedManager](&OBJC_CLASS___MSDHomeManager, "sharedManager"));
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 currentHome]);

    if (!v12)
    {
      id v36 = sub_10003E9DC();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100025E54(v20, v37, v38, v39, v40, v41, v42, v43);
      }
      goto LABEL_23;
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s currentUser](v12, "currentUser"));
    uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 uniqueIdentifier]);
    if (v16)
    {
      id v17 = (void *)v16;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s uniqueIdentifier](v12, "uniqueIdentifier"));

      if (v18)
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 objectForKeyInDefaultDomain:@"publicDBData"]);

        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s na_map:](v20, "na_map:", &stru_100061DB8));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDefaultsManager sharedManager](&OBJC_CLASS___MSDDefaultsManager, "sharedManager"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyInDeveloperDomain:@"publicDBData"]);

        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "na_map:", &stru_100061DD8));
        id v25 = [v24 mutableCopy];

        id v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_map:", &stru_100061E18));
        [v25 removeObjectsInArray:v26];
        [v25 removeObjectsInArray:v21];
        if ([v25 count])
        {
          id v47 = v26;
          __int16 v48 = v23;
          __int128 v49 = v21;
          v55[0] = kCKDatabaseAccessUserInfoHomeIDKey;
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s uniqueIdentifier](v12, "uniqueIdentifier"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 UUIDString]);
          v56[0] = v28;
          v55[1] = kCKDatabaseAccessUserInfoHomeUserIDKey;
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s currentUser](v12, "currentUser"));
          id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 uniqueIdentifier]);
          __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v30 UUIDString]);
          v56[1] = v31;
          uint64_t v46 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  2LL));

          id v32 = sub_10003E9DC();
          uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138477827;
            v58 = (const char *)v25;
            _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Remove services with IDS: %{private}@",  buf,  0xCu);
          }

          unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDataController sharedInstance](&OBJC_CLASS___MSDDataController, "sharedInstance"));
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472LL;
          v50[2] = sub_100024840;
          v50[3] = &unk_100061E68;
          id v51 = v5;
          id v23 = v48;
          id v52 = v48;
          id v53 = v25;
          __int128 v54 = self;
          id v35 = (os_log_s *)v46;
          [v34 removeMediaServices:v53 withUserInfo:v46 completion:v50];

          id v21 = v49;
          id v26 = v47;
        }

        else
        {
          id v45 = sub_10003E9DC();
          id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Everything is up to date, nothing to delete",  buf,  2u);
          }
        }

LABEL_23:
        goto LABEL_24;
      }
    }

    else
    {
    }

    id v44 = sub_10003E9DC();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100025EC4();
    }
    goto LABEL_23;
  }

  if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Developer profile was not loaded on device, skipping service check",  buf,  2u);
  }

- (void)homeManager:(id)a3 didHomeKitSyncComplete:(id)a4
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSDManager startupQueue](self, "startupQueue", a3, a4));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100024BE4;
  block[3] = &unk_100060E40;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (MSServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
}

- (MSServerMediator)mediator
{
  return self->_mediator;
}

- (void)setMediator:(id)a3
{
}

- (MSDDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (CUCoalescer)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (OS_dispatch_queue)startupQueue
{
  return self->_startupQueue;
}

- (void)setStartupQueue:(id)a3
{
}

- (MSDProfilesManager)profilesManager
{
  return self->_profilesManager;
}

- (void)setProfilesManager:(id)a3
{
}

- (MSDHomeSettingsInterface)settingsInterface
{
  return self->_settingsInterface;
}

- (void)setSettingsInterface:(id)a3
{
}

- (MSDAppSelectionAssistant)assistant
{
  return self->_assistant;
}

- (void)setAssistant:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end