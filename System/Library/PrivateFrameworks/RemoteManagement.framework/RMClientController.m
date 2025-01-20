@interface RMClientController
+ (BOOL)_shouldRegisterForCloudConfigAvailableNotification;
+ (RMClientController)sharedController;
+ (void)start;
+ (void)startListeningForNotifications;
- (BOOL)_canProcessClientStateChanges:(id)a3;
- (BOOL)_didUnenrollClientWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)_hasMDMv1ManagementForManagingProfileIdentifier:(id)a3;
- (NSManagedObjectContext)context;
- (NSMutableDictionary)clientByManagementSourceIdentifier;
- (NSMutableSet)processingClientStateChanges;
- (NSPersistentContainer)persistentContainer;
- (OS_dispatch_queue)dispatchQueue;
- (RMClientController)initWithPersistentContainer:(id)a3 context:(id)a4;
- (RMDeviceLockStateListener)lockStateListener;
- (id)_bootstrapURIForAccount:(id)a3;
- (id)_clientWithIdentifier:(id)a3;
- (id)_genericCredentialForAccount:(id)a3 fromStore:(id)a4;
- (id)_makeClientWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 persistentContainer:(id)a5;
- (void)_checkCloudConfig;
- (void)_checkCloudConfigAsync:(id)a3;
- (void)_checkForMandatoryDeviceEnrollmentWithCompletionHandler:(id)a3;
- (void)_completedClientStateChanges:(id)a3;
- (void)_didEnrollClient:(id)a3 conduitType:(int64_t)a4 managementSourceObjectID:(id)a5 account:(id)a6 accountStore:(id)a7 completionHandler:(id)a8;
- (void)_didFailToEnrollClientForManagementObjectID:(id)a3;
- (void)_enrollAccount:(id)a3 fromStore:(id)a4 completionHandler:(id)a5;
- (void)_receivedMDMv1UnenrollNotification;
- (void)_registerForCloudConfigAvailableNotificationIfNeeded;
- (void)_removeInvalidManagementChannels:(id)a3;
- (void)_start;
- (void)_startListeningForNotifications;
- (void)_syncMDMv1ManagementSourcesWithUnenroll:(BOOL)a3;
- (void)_unenrollAndReenrollIfDEP:(id)a3;
- (void)_validateManagementSources;
- (void)applyNowWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)clientNeedsToReenrollWithManagementSourceIdentifier:(id)a3;
- (void)clientNeedsToUnenrollWithManagementSourceIdentifier:(id)a3;
- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3;
- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4;
- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7;
- (void)lockStateDidChange:(BOOL)a3;
- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4;
- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4;
- (void)managementChannelsChanged;
- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)reenrollWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setDispatchQueue:(id)a3;
- (void)setProcessingClientStateChanges:(id)a3;
- (void)syncAllManagementSourcesWithCompletionHandler:(id)a3;
- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5;
- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5;
@end

@implementation RMClientController

+ (RMClientController)sharedController
{
  if (qword_1000CEFE8 != -1) {
    dispatch_once(&qword_1000CEFE8, &stru_1000B90E0);
  }
  return (RMClientController *)(id)qword_1000CEFE0;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100010CD0;
  block[3] = &unk_1000B9100;
  block[4] = a1;
  if (qword_1000CEFF0 != -1) {
    dispatch_once(&qword_1000CEFF0, block);
  }
}

+ (void)startListeningForNotifications
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([a1 sharedController]);
  [v2 _startListeningForNotifications];
}

- (RMClientController)initWithPersistentContainer:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___RMClientController;
  v9 = -[RMClientController init](&v23, "init");
  if (v9)
  {
    v10 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
    processingClientStateChanges = v9->_processingClientStateChanges;
    v9->_processingClientStateChanges = v10;

    objc_storeStrong((id *)&v9->_persistentContainer, a3);
    v12 = +[RMDeviceLockStateListener newListenerWithDelegate:]( &OBJC_CLASS___RMDeviceLockStateListener,  "newListenerWithDelegate:",  v9);
    lockStateListener = v9->_lockStateListener;
    v9->_lockStateListener = v12;

    objc_storeStrong((id *)&v9->_context, a4);
    v14 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    clientByManagementSourceIdentifier = v9->_clientByManagementSourceIdentifier;
    v9->_clientByManagementSourceIdentifier = v14;

    dispatch_queue_attr_t v16 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v16);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.RemoteManagement.RMClientController", v17);
    dispatchQueue = v9->_dispatchQueue;
    v9->_dispatchQueue = (OS_dispatch_queue *)v18;

    v20 = (RMSharedLock *)+[RMSharedLock newSharedLockWithDescription:]( &OBJC_CLASS___RMSharedLock,  "newSharedLockWithDescription:",  @"RMClientController-cloudConfigLock");
    cloudConfigLock = v9->_cloudConfigLock;
    v9->_cloudConfigLock = v20;
  }

  return v9;
}

- (void)_start
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: starting",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000185E0();
  }

  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x2020000000LL;
  uint64_t v29 = 0LL;
  v5 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000110BC;
  v22[3] = &unk_1000B9128;
  v25 = &v26;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v23 = v6;
  id v7 = v5;
  v24 = v7;
  [v6 performBlockAndWait:v22];
  dispatch_group_t v8 = dispatch_group_create();
  v9 = self->_clientByManagementSourceIdentifier;
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_100011404;
  dispatch_queue_t v18 = &unk_1000B9178;
  v19 = self;
  v10 = v9;
  v20 = v10;
  v11 = v8;
  v21 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v7, "enumerateKeysAndObjectsUsingBlock:", &v15);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_group_notify(v11, v13, &stru_1000B9198);

  -[RMClientController _validateManagementSources](self, "_validateManagementSources", v15, v16, v17, v18, v19);
  -[RMClientController _syncMDMv1ManagementSourcesWithUnenroll:](self, "_syncMDMv1ManagementSourcesWithUnenroll:", 0LL);
  if (v27[3])
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController lockStateListener](self, "lockStateListener"));
    [v14 startListening];
  }

  _Block_object_dispose(&v26, 8);
  os_activity_scope_leave(&state);
}

- (void)_validateManagementSources
{
  v3 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: validating management sources",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000186CC();
  }

  v5 = (void *)os_transaction_create("com.apple.RemoteManagement.validating");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Validating sources...", buf, 2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  dispatch_group_t v8 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  v13 = sub_100011750;
  v14 = &unk_1000B90A0;
  id v9 = v7;
  id v15 = v9;
  v10 = v8;
  uint64_t v16 = v10;
  [v9 performBlockAndWait:&v11];
  if (-[NSMutableArray count](v10, "count", v11, v12, v13, v14)) {
    -[RMClientController _removeInvalidManagementChannels:](self, "_removeInvalidManagementChannels:", v10);
  }

  os_activity_scope_leave(&state);
}

- (void)_removeInvalidManagementChannels:(id)a3
{
  id v4 = a3;
  v5 = -[NSConditionLock initWithCondition:]( [NSConditionLock alloc],  "initWithCondition:",  [v4 count]);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v19;
    *(void *)&__int128 v7 = 138543362LL;
    __int128 v14 = v7;
    do
    {
      v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v10);
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController", v14));
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v14;
          uint64_t v23 = v11;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Removing invalid management channel %{public}@",  buf,  0xCu);
        }

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472LL;
        v16[2] = sub_100011C70;
        v16[3] = &unk_1000B91C0;
        v16[4] = v11;
        v17 = v5;
        -[RMClientController unenrollWithIdentifier:completionHandler:]( self,  "unenrollWithIdentifier:completionHandler:",  v11,  v16);

        v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }

    while (v8);
  }

  if (!-[NSConditionLock tryLockWhenCondition:](v5, "tryLockWhenCondition:", 0LL))
  {
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Waiting for invalid enrollments to unenroll...",  buf,  2u);
    }

    -[NSConditionLock lockWhenCondition:](v5, "lockWhenCondition:", 0LL);
  }

  -[NSConditionLock unlock](v5, "unlock");
}

- (void)_startListeningForNotifications
{
}

- (void)_registerForCloudConfigAvailableNotificationIfNeeded
{
  if ((objc_msgSend((id)objc_opt_class(self, a2), "_shouldRegisterForCloudConfigAvailableNotification") & 1) == 0)
  {
    id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_1000187B8(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }

+ (BOOL)_shouldRegisterForCloudConfigAvailableNotification
{
  return 0;
}

- (void)_checkCloudConfigAsync:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMClientController dispatchQueue](self, "dispatchQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100011E24;
  v6[3] = &unk_1000B91E8;
  objc_copyWeak(&v7, &location);
  dispatch_sync(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_checkCloudConfig
{
  uint64_t v3 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: checking cloud config",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100018828();
  }

  uint64_t v5 = (void *)os_transaction_create("com.apple.RemoteManagement.checking-cloud-config");
  -[RMSharedLock lock](self->_cloudConfigLock, "lock");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Checking cloud config...", buf, 2u);
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100011FB4;
  v8[3] = &unk_1000B9210;
  v8[4] = self;
  id v7 = v5;
  id v9 = v7;
  -[RMClientController _checkForMandatoryDeviceEnrollmentWithCompletionHandler:]( self,  "_checkForMandatoryDeviceEnrollmentWithCompletionHandler:",  v8);

  os_activity_scope_leave(&state);
}

- (void)_checkForMandatoryDeviceEnrollmentWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMCloudConfigController cloudConfigEnrollmentURL]( &OBJC_CLASS___RMCloudConfigController,  "cloudConfigEnrollmentURL"));
  if (v5)
  {
    uint64_t v12 = 0LL;
    v13 = &v12;
    uint64_t v14 = 0x3032000000LL;
    id v15 = sub_1000122A4;
    uint64_t v16 = sub_1000122B4;
    id v17 = 0LL;
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1000122BC;
    v11[3] = &unk_1000B9238;
    v11[4] = &v12;
    [v6 performBlockAndWait:v11];
    if (v13[5])
    {
      if (objc_msgSend(v5, "isEqual:"))
      {
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_100018854();
        }
      }

      else
      {
        id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          sub_100018880();
        }
      }

      v4[2](v4, 0LL);
    }

    else
    {
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        __int128 v19 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Forcing mandatory enrollment of device channel: %{public}@",  buf,  0xCu);
      }

      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_1000123A0;
      v9[3] = &unk_1000B9260;
      v10 = v4;
      -[RMClientController enrollDeviceChannelWithURI:completionHandler:]( self,  "enrollDeviceChannelWithURI:completionHandler:",  v5,  v9);
    }

    _Block_object_dispose(&v12, 8);
  }

  else
  {
    v4[2](v4, 0LL);
  }
}

- (id)_makeClientWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 persistentContainer:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = objc_alloc(&OBJC_CLASS___RMClient);
  uint64_t v12 = objc_opt_new(&OBJC_CLASS___RMStatusQuerier);
  v13 = -[RMClient initWithManagementSourceObjectID:managementSourceIdentifier:statusQuerier:persistentContainer:]( v11,  "initWithManagementSourceObjectID:managementSourceIdentifier:statusQuerier:persistentContainer:",  v10,  v9,  v12,  v8);

  -[RMClient setDelegate:](v13, "setDelegate:", self);
  return v13;
}

- (void)_unenrollAndReenrollIfDEP:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v6 = v4;
  id v7 = v5;
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 1LL;
  location[0] = _NSConcreteStackBlock;
  location[1] = (id)3221225472LL;
  location[2] = sub_100018444;
  location[3] = &unk_1000B8DA8;
  id v8 = v6;
  id v20 = v8;
  id v9 = v7;
  id v21 = v9;
  v22 = &v23;
  [v9 performBlockAndWait:location];
  id v10 = (void *)v24[3];

  _Block_object_dispose(&v23, 8);
  objc_initWeak(location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  id v15 = sub_100012634;
  uint64_t v16 = &unk_1000B92F0;
  id v11 = v8;
  id v17 = v11;
  objc_copyWeak(v18, location);
  v18[1] = v10;
  dispatch_async(&_dispatch_main_q, &v13);
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController", v13, v14, v15, v16));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100018940();
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(location);
}

- (void)_receivedMDMv1UnenrollNotification
{
}

- (void)_syncMDMv1ManagementSourcesWithUnenroll:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: checking MDMv1 management sources",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v3));
    sub_100018AB8(v7, v29, v6);
  }

  id v8 = (void *)os_transaction_create("com.apple.RemoteManagement.checking-mdm");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Syncing MDMv1 sources...", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  *(void *)buf = 0LL;
  uint64_t v23 = buf;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100012CA0;
  v16[3] = &unk_1000B9318;
  id v12 = v10;
  BOOL v21 = v3;
  id v17 = v12;
  __int128 v18 = self;
  v13 = v11;
  __int128 v19 = v13;
  id v20 = buf;
  [v12 performBlockAndWait:v16];
  if (-[NSMutableArray count](v13, "count"))
  {
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = -[NSMutableArray count](v13, "count");
      *(_DWORD *)v27 = 134217984;
      id v28 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Removing %lu MDMv1 management sources",  v27,  0xCu);
    }

    -[RMClientController _removeInvalidManagementChannels:](self, "_removeInvalidManagementChannels:", v13);
  }

  if (!v23[24]
    && +[RMMDMv1Liaison isEnrollmentInMDMv1Restricted](&OBJC_CLASS___RMMDMv1Liaison, "isEnrollmentInMDMv1Restricted"))
  {
    +[RMMDMv1Liaison remoteManagementDidUnenroll](&OBJC_CLASS___RMMDMv1Liaison, "remoteManagementDidUnenroll");
  }

  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);
}

- (BOOL)_hasMDMv1ManagementForManagingProfileIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagedDevice currentManagedDevice](&OBJC_CLASS___RMManagedDevice, "currentManagedDevice"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 mdmProfileIdentifier]);

  LOBYTE(v4) = [v5 isEqualToString:v3];
  return (char)v4;
}

- (void)enrollDeviceChannelWithURI:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: enrolling management source",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100018D00();
  }

  if (+[RMMDMv1Liaison isEnrolledInMDMv1](&OBJC_CLASS___RMMDMv1Liaison, "isEnrolledInMDMv1"))
  {
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100018B80();
    }

    id v11 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAlreadyEnrolledInMDMv1Error]( &OBJC_CLASS___RMErrorUtilities,  "createAlreadyEnrolledInMDMv1Error"));
    v7[2](v7, 0LL, v11);
  }

  else
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue([v6 scheme]);
    if ([v12 caseInsensitiveCompare:@"https"])
    {
      if ([v12 caseInsensitiveCompare:@"file"])
      {
        uint64_t v13 = 4 * ([v12 caseInsensitiveCompare:@"mdm"] == 0);
      }

      else if (+[RMFeatureFlags isFileConduitEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isFileConduitEnabled"))
      {
        uint64_t v13 = 3LL;
      }

      else
      {
        uint64_t v13 = 1LL;
      }
    }

    else if (+[RMFeatureFlags isHTTPConduitEnabled](&OBJC_CLASS___RMFeatureFlags, "isHTTPConduitEnabled"))
    {
      uint64_t v13 = 2LL;
    }

    else
    {
      uint64_t v13 = 1LL;
    }

    if ((v13 & 3) != 0)
    {
      if (v13 == 1)
      {
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100018C40();
        }

        id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  RMErrorDomain,  4LL,  0LL));
        v7[2](v7, 0LL, v11);
      }

      else
      {
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[RMManagedDevice currentManagedDevice](&OBJC_CLASS___RMManagedDevice, "currentManagedDevice"));
        unsigned int v17 = [v16 isSupervised];

        if (v17) {
          uint64_t v18 = 3LL;
        }
        else {
          uint64_t v18 = 1LL;
        }
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 absoluteString]);
        uint64_t v53 = 0LL;
        v54 = &v53;
        uint64_t v55 = 0x3032000000LL;
        v56 = sub_1000122A4;
        v57 = sub_1000122B4;
        id v58 = 0LL;
        uint64_t v47 = 0LL;
        v48 = &v47;
        uint64_t v49 = 0x3032000000LL;
        v50 = sub_1000122A4;
        v51 = sub_1000122B4;
        id v52 = 0LL;
        uint64_t v41 = 0LL;
        v42 = &v41;
        uint64_t v43 = 0x3032000000LL;
        v44 = sub_1000122A4;
        v45 = sub_1000122B4;
        id v46 = 0LL;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_1000135E8;
        v32[3] = &unk_1000B9340;
        id v20 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
        id v33 = v20;
        id v34 = v6;
        v36 = &v53;
        uint64_t v39 = v18;
        uint64_t v40 = v13;
        id v11 = v19;
        id v35 = v11;
        v37 = &v47;
        v38 = &v41;
        [v20 performBlockAndWait:v32];
        if (v54[5])
        {
          BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_100018CA0();
          }

          v7[2](v7, 0LL, (id)v54[5]);
        }

        else
        {
          uint64_t v22 = v48[5];
          uint64_t v23 = v42[5];
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController persistentContainer](self, "persistentContainer"));
          char v25 = (void *)objc_claimAutoreleasedReturnValue( -[RMClientController _makeClientWithManagementSourceObjectID:managementSourceIdentifier:persistentContainer:]( self,  "_makeClientWithManagementSourceObjectID:managementSourceIdentifier:persistentContainer:",  v22,  v23,  v24));

          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472LL;
          v27[2] = sub_100013958;
          v27[3] = &unk_1000B9368;
          uint8_t v27[4] = self;
          v30 = &v47;
          uint64_t v29 = v7;
          id v26 = v25;
          id v28 = v26;
          uint64_t v31 = v13;
          [v26 enrollWithCompletionHandler:v27];
        }

        _Block_object_dispose(&v41, 8);
        _Block_object_dispose(&v47, 8);

        _Block_object_dispose(&v53, 8);
      }
    }

    else
    {
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100018BE0();
      }

      id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  262LL,  0LL));
      v7[2](v7, 0LL, v11);
    }
  }

  os_activity_scope_leave(&state);
}

- (void)enrollUserChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = sub_1000122A4;
  uint64_t v23 = sub_1000122B4;
  id v24 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100013BC8;
  v15[3] = &unk_1000B8DA8;
  id v9 = v6;
  id v16 = v9;
  id v10 = v8;
  id v17 = v10;
  uint64_t v18 = &v19;
  [v10 performBlockAndWait:v15];
  if (v20[5])
  {
    v7[2](v7, 0LL);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore rm_defaultStore](&OBJC_CLASS___ACAccountStore, "rm_defaultStore"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountWithIdentifier:v9]);
    if (v12)
    {
      -[RMClientController _enrollAccount:fromStore:completionHandler:]( self,  "_enrollAccount:fromStore:completionHandler:",  v12,  v11,  v7);
    }

    else
    {
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100018E80();
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAccountMissingErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createAccountMissingErrorWithIdentifier:",  v9));
      ((void (*)(void (**)(id, void), void, void *))v7[2])(v7, 0LL, v14);
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)enrollViaMDMWithEnrollmentType:(int64_t)a3 uri:(id)a4 accountIdentifier:(id)a5 personaIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, void *))a7;
  id v16 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: enrolling management source DDM",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v16, &state);
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_100018FD8((uint64_t)v12, a3, v17);
  }

  if (!+[RMMDMv1Liaison isEnrolledInMDMv1](&OBJC_CLASS___RMMDMv1Liaison, "isEnrolledInMDMv1"))
  {
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100018FA0();
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createBootstrapURINotFound]( &OBJC_CLASS___RMErrorUtilities,  "createBootstrapURINotFound"));
    v15[2](v15, 0LL, v22);
    goto LABEL_19;
  }

  id v18 = (id)objc_claimAutoreleasedReturnValue([v12 scheme]);
  if (![v18 caseInsensitiveCompare:@"https"])
  {
    +[RMFeatureFlags isHTTPConduitEnabled](&OBJC_CLASS___RMFeatureFlags, "isHTTPConduitEnabled");
    goto LABEL_16;
  }

  if (![v18 caseInsensitiveCompare:@"file"])
  {
    +[RMFeatureFlags isFileConduitEnabled](&OBJC_CLASS___RMFeatureFlags, "isFileConduitEnabled");
    goto LABEL_16;
  }

  if ([v18 caseInsensitiveCompare:@"mdm"])
  {
LABEL_16:

    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100018F40();
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  262LL,  0LL));
    v15[2](v15, 0LL, v22);
LABEL_19:

    goto LABEL_20;
  }

  uint64_t v56 = 0LL;
  v57 = &v56;
  uint64_t v58 = 0x3032000000LL;
  v59 = sub_1000122A4;
  v60 = sub_1000122B4;
  id v61 = 0LL;
  uint64_t v50 = 0LL;
  v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  uint64_t v53 = sub_1000122A4;
  v54 = sub_1000122B4;
  id v55 = 0LL;
  uint64_t v44 = 0LL;
  v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = sub_1000122A4;
  v48 = sub_1000122B4;
  id v49 = 0LL;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1000141E0;
  v34[3] = &unk_1000B9390;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v35 = v19;
  id v36 = v12;
  uint64_t v39 = &v56;
  int64_t v42 = a3;
  uint64_t v43 = 4LL;
  id v37 = v13;
  id v38 = v14;
  uint64_t v40 = &v50;
  uint64_t v41 = &v44;
  [v19 performBlockAndWait:v34];
  if (v57[5])
  {
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100018CA0();
    }

    v15[2](v15, 0LL, (void *)v57[5]);
  }

  else
  {
    uint64_t v24 = v51[5];
    uint64_t v25 = v45[5];
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController persistentContainer](self, "persistentContainer"));
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[RMClientController _makeClientWithManagementSourceObjectID:managementSourceIdentifier:persistentContainer:]( self,  "_makeClientWithManagementSourceObjectID:managementSourceIdentifier:persistentContainer:",  v24,  v25,  v26));

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10001453C;
    v29[3] = &unk_1000B9368;
    v29[4] = self;
    v32 = &v50;
    uint64_t v31 = v15;
    id v28 = v27;
    id v30 = v28;
    uint64_t v33 = 4LL;
    [v28 enrollWithCompletionHandler:v29];
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(&v56, 8);
LABEL_20:
  os_activity_scope_leave(&state);
}

- (void)reenrollWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: re-enrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000190A8();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v6));
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001476C;
    v13[3] = &unk_1000B8F30;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v10 reenrollWithCompletionHandler:v13];
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100019048();
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v6));
    (*((void (**)(id, void *))v7 + 2))(v7, v12);
  }

  os_activity_scope_leave(&state);
}

- (void)_enrollAccount:(id)a3 fromStore:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, id))a5;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: enrolling management source",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _bootstrapURIForAccount:](self, "_bootstrapURIForAccount:", v8));
  if (v12)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000192E8();
    }

    if (+[RMMDMv1Liaison isEnrolledInMDMv1](&OBJC_CLASS___RMMDMv1Liaison, "isEnrolledInMDMv1"))
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100019168();
      }

      id v15 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createAlreadyEnrolledInMDMv1Error]( &OBJC_CLASS___RMErrorUtilities,  "createAlreadyEnrolledInMDMv1Error"));
      v10[2](v10, 0LL, v15);
    }

    else
    {
      id v16 = (id)objc_claimAutoreleasedReturnValue([v12 scheme]);
      if ([v16 caseInsensitiveCompare:@"https"])
      {
        if ([v16 caseInsensitiveCompare:@"file"])
        {
          uint64_t v17 = 4 * ([v16 caseInsensitiveCompare:@"mdm"] == 0);
        }

        else if (+[RMFeatureFlags isFileConduitEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isFileConduitEnabled"))
        {
          uint64_t v17 = 3LL;
        }

        else
        {
          uint64_t v17 = 1LL;
        }
      }

      else if (+[RMFeatureFlags isHTTPConduitEnabled]( &OBJC_CLASS___RMFeatureFlags,  "isHTTPConduitEnabled"))
      {
        uint64_t v17 = 2LL;
      }

      else
      {
        uint64_t v17 = 1LL;
      }

      if ((v17 & 3) != 0)
      {
        if (v17 == 1)
        {
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_100019228();
          }

          id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  RMErrorDomain,  4LL,  0LL));
          v10[2](v10, 0LL, v15);
        }

        else
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue( -[RMClientController _genericCredentialForAccount:fromStore:]( self,  "_genericCredentialForAccount:fromStore:",  v8,  v9));
          uint64_t v57 = 0LL;
          uint64_t v58 = &v57;
          uint64_t v59 = 0x3032000000LL;
          v60 = sub_1000122A4;
          id v61 = sub_1000122B4;
          id v62 = 0LL;
          uint64_t v51 = 0LL;
          uint64_t v52 = &v51;
          uint64_t v53 = 0x3032000000LL;
          v54 = sub_1000122A4;
          id v55 = sub_1000122B4;
          id v56 = 0LL;
          uint64_t v45 = 0LL;
          uint64_t v46 = &v45;
          uint64_t v47 = 0x3032000000LL;
          v48 = sub_1000122A4;
          id v49 = sub_1000122B4;
          id v50 = 0LL;
          v36[0] = _NSConcreteStackBlock;
          v36[1] = 3221225472LL;
          v36[2] = sub_100014E38;
          v36[3] = &unk_1000B93B8;
          id v37 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
          id v38 = v12;
          uint64_t v44 = v17;
          id v15 = v20;
          id v39 = v15;
          id v27 = v8;
          id v28 = v37;
          id v40 = v27;
          uint64_t v41 = &v57;
          int64_t v42 = &v51;
          uint64_t v43 = &v45;
          [v37 performBlockAndWait:v36];
          if (v58[5])
          {
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_100019288();
            }

            v10[2](v10, 0LL, (id)v58[5]);
          }

          else
          {
            uint64_t v26 = v52[5];
            uint64_t v22 = v46[5];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController persistentContainer](self, "persistentContainer"));
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( -[RMClientController _makeClientWithManagementSourceObjectID:managementSourceIdentifier:persistentContainer:]( self,  "_makeClientWithManagementSourceObjectID:managementSourceIdentifier:persistentContainer:",  v26,  v22,  v23));

            v29[0] = _NSConcreteStackBlock;
            v29[1] = 3221225472LL;
            v29[2] = sub_10001506C;
            v29[3] = &unk_1000B93E0;
            v29[4] = self;
            id v34 = &v51;
            uint64_t v33 = v10;
            id v25 = v24;
            id v30 = v25;
            uint64_t v35 = v17;
            id v31 = v27;
            id v32 = v9;
            [v25 enrollWithCompletionHandler:v29];
          }

          _Block_object_dispose(&v45, 8);
          _Block_object_dispose(&v51, 8);

          _Block_object_dispose(&v57, 8);
        }
      }

      else
      {
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000191C8();
        }

        id v15 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  262LL,  0LL));
        v10[2](v10, 0LL, v15);
      }
    }
  }

  else
  {
    id v15 = (id)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createBootstrapURINotFound]( &OBJC_CLASS___RMErrorUtilities,  "createBootstrapURINotFound"));
    v10[2](v10, 0LL, v15);
  }

  os_activity_scope_leave(&state);
}

- (id)_bootstrapURIForAccount:(id)a3
{
  id v3 = a3;
  if ((objc_msgSend(v3, "rm_isAccountSchemeTest") & 1) == 0
    && (objc_msgSend(v3, "rm_isAccountSchemeBearer") & 1) == 0
    && (objc_msgSend(v3, "rm_isAccountSchemeMAID") & 1) == 0
    && !objc_msgSend(v3, "dmc_isAccountSchemeSharediPad"))
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000193D8(v3, v6);
    }
    goto LABEL_8;
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rm_enrollmentURL"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v4));

  if (!v5)
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100019348(v3, v6);
    }
LABEL_8:

    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)_genericCredentialForAccount:(id)a3 fromStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  if (objc_msgSend(v5, "rm_isAccountSchemeTest"))
  {
    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v9,  RMAuthenticationSchemeTestFieldUsername);

    id v10 = objc_opt_new(&OBJC_CLASS___NSUUID);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v10, "UUIDString"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v11,  RMAuthenticationSchemeTestFieldToken);

    id v12 = objc_alloc(&OBJC_CLASS___RMGenericAuthenticationCredential);
    id v13 = &RMAuthenticationSchemeTest;
LABEL_5:
    id v15 = -[RMGenericAuthenticationCredential initWithAuthenticationScheme:properties:]( v12,  "initWithAuthenticationScheme:properties:",  *v13,  v8);
LABEL_6:

    goto LABEL_7;
  }

  if (objc_msgSend(v5, "rm_isAccountSchemeBearer"))
  {
    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rm_bearerToken"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v14,  RMAuthenticationSchemeBearerFieldAccessToken);

    id v12 = objc_alloc(&OBJC_CLASS___RMGenericAuthenticationCredential);
    id v13 = &RMAuthenticationSchemeBearer;
    goto LABEL_5;
  }

  if (objc_msgSend(v5, "rm_isAccountSchemeMAID"))
  {
    id v8 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v5 username]);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v17,  RMAuthenticationSchemeMAIDFieldUsername);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rm_DSID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v18,  RMAuthenticationSchemeMAIDFieldDSID);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rm_altDSID"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v19,  RMAuthenticationSchemeMAIDFieldAltDSID);

    id v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "rm_altDSID"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "aida_accountForAltDSID:", v20));

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aida_tokenForService:", @"com.apple.gs.mdm.auth"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v8,  "setObject:forKeyedSubscript:",  v22,  RMAuthenticationSchemeMAIDFieldShortLivedToken);
    uint64_t v23 = objc_alloc(&OBJC_CLASS___RMGenericAuthenticationCredential);
    id v15 = -[RMGenericAuthenticationCredential initWithAuthenticationScheme:properties:]( v23,  "initWithAuthenticationScheme:properties:",  RMAuthenticationSchemeMAID,  v8);

    goto LABEL_6;
  }

  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_100019484(v5, (uint64_t)v7, v24);
  }

  id v15 = 0LL;
LABEL_7:

  return v15;
}

- (void)_didFailToEnrollClientForManagementObjectID:(id)a3
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100015554;
  v7[3] = &unk_1000B90A0;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlockAndWait:v7];
}

- (void)_didEnrollClient:(id)a3 conduitType:(int64_t)a4 managementSourceObjectID:(id)a5 account:(id)a6 accountStore:(id)a7 completionHandler:(id)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v26 = a8;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  id v56 = sub_1000122A4;
  uint64_t v57 = sub_1000122B4;
  id v58 = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  id v50 = sub_1000122A4;
  uint64_t v51 = sub_1000122B4;
  id v52 = 0LL;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_100015A0C;
  v42[3] = &unk_1000B9408;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v43 = v17;
  id v18 = v14;
  id v44 = v18;
  uint64_t v45 = &v47;
  uint64_t v46 = &v53;
  [v17 performBlockAndWait:v42];
  if (v15 && v16)
  {
    objc_msgSend(v15, "rm_setEnrollmentToken:", v54[5]);
    objc_msgSend(v15, "rm_setManagementSourceIdentifier:", v48[5]);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Saving account...", buf, 2u);
    }

    *(void *)buf = 0LL;
    id v37 = buf;
    uint64_t v38 = 0x3032000000LL;
    id v39 = sub_1000122A4;
    id v40 = sub_1000122B4;
    id v41 = 0LL;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100015AAC;
    v35[3] = &unk_1000B9430;
    v35[4] = buf;
    [v16 saveAccount:v15 withCompletionHandler:v35];
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v34 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Accounts finished saving.", v34, 2u);
    }

    _Block_object_dispose(buf, 8);
  }

  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100015B04;
  v31[3] = &unk_1000B90A0;
  id v21 = v17;
  id v32 = v21;
  id v22 = v18;
  id v33 = v22;
  [v21 performBlockAndWait:v31];
  if (a4 != 4) {
    +[RMMDMv1Liaison remoteManagementDidEnroll](&OBJC_CLASS___RMMDMv1Liaison, "remoteManagementDidEnroll");
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController lockStateListener](self, "lockStateListener"));
  [v23 startListening];

  uint64_t v24 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v24);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v13, v48[5]);
  objc_sync_exit(v24);

  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100015BAC;
  v28[3] = &unk_1000B9458;
  id v25 = v26;
  id v29 = v25;
  id v30 = &v47;
  [v13 startWithCompletionHandler:v28];

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v53, 8);
}

- (void)unenrollWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: unenrolling",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100019638();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v6));
  if (v10)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100015D7C;
    v13[3] = &unk_1000B9480;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v10 unenrollWithCompletionHandler:v13];
  }

  else
  {
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000195D8();
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v6));
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0LL, v12);
  }

  os_activity_scope_leave(&state);
}

- (BOOL)_didUnenrollClientWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v7);
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v6);
  objc_sync_exit(v7);

  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_1000122A4;
  id v32 = sub_1000122B4;
  id v33 = 0LL;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100016068;
  id v19 = &unk_1000B9408;
  id v9 = v6;
  id v20 = v9;
  id v10 = v8;
  id v21 = v10;
  id v22 = &v28;
  uint64_t v23 = &v24;
  [v10 performBlockAndWait:&v16];
  if (a4)
  {
    id v11 = (void *)v29[5];
    if (v11) {
      *a4 = v11;
    }
  }

  uint64_t v12 = v29[5];
  if (!v12)
  {
    +[RMConfigurationStatusArchiver removeAllStatusForStoreIdentifier:error:]( &OBJC_CLASS___RMConfigurationStatusArchiver,  "removeAllStatusForStoreIdentifier:error:",  v9,  0LL,  v16,  v17,  v18,  v19,  v20);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMExternalStatusPublisher sharedPublisher]( &OBJC_CLASS___RMExternalStatusPublisher,  "sharedPublisher"));
    [v13 listenToNotificationsForAllKeyPaths];

    if (!*((_BYTE *)v25 + 24))
    {
      +[RMMDMv1Liaison remoteManagementDidUnenroll](&OBJC_CLASS___RMMDMv1Liaison, "remoteManagementDidUnenroll");
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController lockStateListener](self, "lockStateListener"));
      [v14 stopListening];
    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v12 == 0;
}

- (void)deviceChannelEnrollmentExistsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000163CC;
  v6[3] = &unk_1000B9238;
  void v6[4] = &v7;
  [v5 performBlockAndWait:v6];
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);

  _Block_object_dispose(&v7, 8);
}

- (void)managementChannelWithAccountIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1000122A4;
  uint64_t v26 = sub_1000122B4;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1000122A4;
  id v20 = sub_1000122B4;
  id v21 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100016620;
  v11[3] = &unk_1000B9408;
  id v9 = v6;
  id v12 = v9;
  id v10 = v8;
  id v13 = v10;
  id v14 = &v16;
  id v15 = &v22;
  [v10 performBlockAndWait:v11];
  v7[2](v7, v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)managementChannelWithEnrollmentURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = sub_1000122A4;
  uint64_t v26 = sub_1000122B4;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_1000122A4;
  id v20 = sub_1000122B4;
  id v21 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001688C;
  v11[3] = &unk_1000B9408;
  id v9 = v6;
  id v12 = v9;
  id v10 = v8;
  id v13 = v10;
  id v14 = &v16;
  id v15 = &v22;
  [v10 performBlockAndWait:v11];
  v7[2](v7, v23[5], v17[5]);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
}

- (void)managementChannelsChanged
{
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_1000122A4;
  uint64_t v24 = sub_1000122B4;
  id v25 = 0LL;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100016C38;
  v16[3] = &unk_1000B8DA8;
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[RMClientController context](self, "context"));
  uint64_t v18 = self;
  id v19 = &v20;
  id v11 = v17;
  [v17 performBlockAndWait:v16];
  if (v21[5])
  {
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController clientByManagementSourceIdentifier](self, "clientByManagementSourceIdentifier"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v13;
      do
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v13 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)i);
          if (([(id)v21[5] containsObject:v8] & 1) == 0)
          {
            id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v27 = v8;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Removing stale RMClient for: %{public}@",  buf,  0xCu);
            }

            id v10 = (void *)objc_claimAutoreleasedReturnValue( -[RMClientController clientByManagementSourceIdentifier]( self,  "clientByManagementSourceIdentifier"));
            [v10 removeObjectForKey:v8];
          }
        }

        id v5 = [v4 countByEnumeratingWithState:&v12 objects:v28 count:16];
      }

      while (v5);
    }
  }

  _Block_object_dispose(&v20, 8);
}

- (void)syncWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: syncing",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v14);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000198D8();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v6));
  id v11 = v10;
  if (v10)
  {
    [v10 syncWithCompletionHandler:v7];
  }

  else
  {
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100019878();
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v6));
    v7[2](v7, v13);
  }

  os_activity_scope_leave(&v14);
}

- (void)syncAllManagementSourcesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  id v6 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v6);
  id v7 = -[NSMutableDictionary copy](v6, "copy");
  objc_sync_exit(v6);

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100016FFC;
  v13[3] = &unk_1000B94A8;
  dispatch_group_t v14 = v5;
  uint64_t v8 = v5;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[RMClientController dispatchQueue](self, "dispatchQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001719C;
  v11[3] = &unk_1000B94D0;
  id v12 = v4;
  id v10 = v4;
  dispatch_group_notify(v8, v9, v11);
}

- (void)applyNowWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: apply now",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &v14);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_1000199F8();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v6));
  id v11 = v10;
  if (v10)
  {
    [v10 applyNowWithCompletionHandler:v7];
  }

  else
  {
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100019998();
    }

    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v6));
    v7[2](v7, v13);
  }

  os_activity_scope_leave(&v14);
}

- (void)updateWithIdentifier:(id)a3 pushMessage:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: updating via push message",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v17);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100019AB8();
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v8));
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 updateWithPushMessage:v9 completionHandler:v10];
  }

  else
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100019A58();
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v8));
    v10[2](v10, v16);
  }

  os_activity_scope_leave(&v17);
}

- (void)updateWithIdentifier:(id)a3 tokensResponse:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: updating via sync tokens",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v17);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100019B18();
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v8));
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 updateWithTokensResponse:v9 completionHandler:v10];
  }

  else
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100019A58();
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v8));
    v10[2](v10, v16);
  }

  os_activity_scope_leave(&v17);
}

- (void)sendStatusData:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: sending arbitrary status",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v17);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100019BD8();
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v9));
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 sendStatusData:v8 completionHandler:v10];
  }

  else
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100019B78();
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v9));
    v10[2](v10, v16);
  }

  os_activity_scope_leave(&v17);
}

- (void)queryForStatusSubscriptionsWithIdentifiers:(id)a3 fromManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: query for status subscriptions",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v23);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", @", "));

    *(_DWORD *)buf = 138543618;
    id v25 = v19;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Querying for status subscriptions with identifiers %{public}@ from %{public}@...",  buf,  0x16u);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v9));
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 queryForStatusSubscriptionsWithIdentifiers:v8]);
    v10[2](v10, v15, 0LL);
  }

  else
  {
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue([v8 allObjects]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));

      *(_DWORD *)buf = 138543618;
      id v25 = v22;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Could not query for status subscriptions with identifiers %{public}@, could not find client for identifier: %{public}@",  buf,  0x16u);
    }

    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v9));
    ((void (**)(id, void *, void *))v10)[2](v10, 0LL, v15);
  }

  os_activity_scope_leave(&v23);
}

- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 toManagementSourceWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = _os_activity_create( (void *)&_mh_execute_header,  "ClientController: sending specific status",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &v23);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue([v8 allObjects]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", @", "));

    *(_DWORD *)buf = 138543618;
    id v25 = v19;
    __int16 v26 = 2114;
    id v27 = v9;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Querying for status subscriptions with identifiers %{public}@ then sending to %{public}@...",  buf,  0x16u);
  }

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController _clientWithIdentifier:](self, "_clientWithIdentifier:", v9));
  os_activity_scope_state_s v14 = v13;
  if (v13)
  {
    [v13 sendStatusForSubscriptionsWithIdentifiers:v8 completionHandler:v10];
  }

  else
  {
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue([v8 allObjects]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "componentsJoinedByString:", @", "));

      *(_DWORD *)buf = 138543618;
      id v25 = v22;
      __int16 v26 = 2114;
      id v27 = v9;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Could not query for status subscriptions with identifiers %{public}@, could not find client for identifier: %{public}@",  buf,  0x16u);
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[RMErrorUtilities createManagementSourceNotFoundErrorWithIdentifier:]( &OBJC_CLASS___RMErrorUtilities,  "createManagementSourceNotFoundErrorWithIdentifier:",  v9));
    v10[2](v10, v16);
  }

  os_activity_scope_leave(&v23);
}

- (id)_clientWithIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = self->_clientByManagementSourceIdentifier;
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_clientByManagementSourceIdentifier,  "objectForKeyedSubscript:",  v4));
  objc_sync_exit(v5);

  return v6;
}

- (void)clientNeedsToReenrollWithManagementSourceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100019CF8();
  }

  if (-[RMClientController _canProcessClientStateChanges:](self, "_canProcessClientStateChanges:", v4))
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100017F84;
    block[3] = &unk_1000B9520;
    id v9 = v4;
    objc_copyWeak(&v10, &location);
    dispatch_async(&_dispatch_main_q, block);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100019C38();
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  else
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100019C98();
    }
  }
}

- (void)clientNeedsToUnenrollWithManagementSourceIdentifier:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100019E18();
  }

  if (-[RMClientController _canProcessClientStateChanges:](self, "_canProcessClientStateChanges:", v4))
  {
    -[RMClientController _unenrollAndReenrollIfDEP:](self, "_unenrollAndReenrollIfDEP:", v4);
  }

  else
  {
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100019DB8();
    }
  }
}

- (BOOL)_canProcessClientStateChanges:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController processingClientStateChanges](self, "processingClientStateChanges"));
  objc_sync_enter(v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController processingClientStateChanges](self, "processingClientStateChanges"));
  unsigned int v7 = [v6 containsObject:v4];

  if (v7)
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog clientController](&OBJC_CLASS___RMLog, "clientController"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100019DB8();
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[RMClientController processingClientStateChanges](self, "processingClientStateChanges"));
    -[os_log_s addObject:](v8, "addObject:", v4);
  }

  objc_sync_exit(v5);
  return v7 ^ 1;
}

- (void)_completedClientStateChanges:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController processingClientStateChanges](self, "processingClientStateChanges"));
  objc_sync_enter(v4);
  dispatch_group_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMClientController processingClientStateChanges](self, "processingClientStateChanges"));
  [v5 removeObject:v6];

  objc_sync_exit(v4);
}

- (void)lockStateDidChange:(BOOL)a3
{
  if (!a3) {
    +[RMConfigurationPublisher reprocessActiveConfigurations]( &OBJC_CLASS___RMConfigurationPublisher,  "reprocessActiveConfigurations");
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (RMDeviceLockStateListener)lockStateListener
{
  return self->_lockStateListener;
}

- (NSMutableSet)processingClientStateChanges
{
  return self->_processingClientStateChanges;
}

- (void)setProcessingClientStateChanges:(id)a3
{
}

- (NSMutableDictionary)clientByManagementSourceIdentifier
{
  return self->_clientByManagementSourceIdentifier;
}

- (void).cxx_destruct
{
}

@end