@interface CPLDaemon
- (BOOL)_processListener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)allowsConfigurationRefreshForWrapperArray:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)allowedProtocolForClientAccess:(id)a3;
- (id)daemonLibraryManager:(id)a3 engineWrapperWithClientLibraryBaseURL:(id)a4 cloudLibraryStateStorageURL:(id)a5 cloudLibraryResourceStorageURL:(id)a6 libraryIdentifier:(id)a7 mainScopeIdentifier:(id)a8 options:(unint64_t)a9 error:(id *)a10;
- (id)daemonLibraryManagerOtherLibraryManager:(id)a3 withLibraryIdentifier:(id)a4;
- (id)initForSyncBubble:(BOOL)a3 forceClientPush:(BOOL)a4;
- (id)wrapperArray:(id)a3 engineWrapperWithParameters:(id)a4 createIfNecessary:(BOOL)a5 queue:(id)a6 error:(id *)a7;
- (unint64_t)wrapperArray:(id)a3 countOfClientsForWrapper:(id)a4;
- (void)_daemonLibraryManagerWantsToExitNow:(id)a3;
- (void)_deactivateDaemon;
- (void)_performAfterRegistrations:(id)a3;
- (void)_performOnceDeviceIsUnlocked:(id)a3;
- (void)_performPendingBlockAfterFirstUnlock;
- (void)_processConnectionDidInvalidate:(id)a3;
- (void)_reRunFastPassInitialDownloadIfNecessaryForWrapper:(id)a3 withReschedulerManager:(id)a4;
- (void)_registerAfterLaunchWhenAllEnginesAreOpened;
- (void)_registerForBackupRequests;
- (void)_registerForConfigurationRefresh;
- (void)_registerForFastPassInitialDownload;
- (void)_registerForMaintenance;
- (void)_registerForPeriodicUploadOfComputeStates;
- (void)_reportICPLFeatureCheckpoint:(unint64_t)a3;
- (void)_updateConfigurationRefreshIntervalIfNecessary;
- (void)_wrapperArray:(id)a3 forDaemon:(BOOL)a4 getStatusWithCompletionHandler:(id)a5;
- (void)daemonLibraryManager:(id)a3 wantsToExitAfterResettingParametersForLibraryWithIdentifier:(id)a4;
- (void)daemonLibraryManagerHasBeenDisconnected:(id)a3;
- (void)daemonLibraryManagerWantsToExitNow:(id)a3;
- (void)emergencyExitForWrapperArray:(id)a3;
- (void)enumerateDaemonLibraryManagersWithLibraryIdentifier:(id)a3 block:(id)a4;
- (void)getDaemonLibraryManagerStatusesWithCompletionHandler:(id)a3;
- (void)getDaemonStatusWithCompletionHandler:(id)a3;
- (void)getEngineWrapperStatusesWithCompletionHandler:(id)a3;
- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4;
- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5;
- (void)wipeEnginesIfNecessaryWithCompletionHandler:(id)a3;
- (void)wrapperArray:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)wrapperArray:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)wrapperArray:(id)a3 wrapperDidCompleteInitialSyncOfMainScope:(id)a4;
- (void)wrapperArray:(id)a3 wrapperNeedsInitialDownloadOfMainScope:(id)a4;
- (void)wrapperArray:(id)a3 wrapperShouldBeDropped:(id)a4;
- (void)wrapperArrayCountDidChange:(id)a3;
@end

@implementation CPLDaemon

- (id)initForSyncBubble:(BOOL)a3 forceClientPush:(BOOL)a4
{
  BOOL v5 = a3;
  v91.receiver = self;
  v91.super_class = (Class)&OBJC_CLASS___CPLDaemon;
  id v7 = -[CPLDaemon init](&v91, "init");
  if (!v7) {
    return v7;
  }
  id has_internal_content = (id)os_variant_has_internal_content("com.apple.cpl.prevent-automatic-wipe");
  if ((_DWORD)has_internal_content)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned __int8 v10 = [v9 BOOLForKey:@"CPLDontAskToWipeDatabase"];

    if ((v10 & 1) == 0) {
      id has_internal_content = +[CPLPrequeliteStore setShouldWarnUserBeforeWipeOnUpgrade:]( &OBJC_CLASS___CPLPrequeliteStore,  "setShouldWarnUserBeforeWipeOnUpgrade:",  1LL);
    }
  }

  *((_BYTE *)v7 + 16) = v5;
  if (v5)
  {
    *((_BYTE *)v7 + 17) = a4;
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10000537C();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Daemon is launching for sync bubble",  buf,  2u);
      }
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_10000537C();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Daemon is launching", buf, 2u);
      }
    }

    CPLEnableUnsupportedScopesAlert(has_internal_content);
    CPLRequestClientSetRequestBlock(&stru_10023DC28);
  }

  uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v16 = (void *)*((void *)v7 + 1);
  *((void *)v7 + 1) = v15;

  v17 = objc_alloc_init(&OBJC_CLASS___CPLBGSTActivitiesReport);
  v18 = (void *)*((void *)v7 + 21);
  *((void *)v7 + 21) = v17;

  __SBSSetStatusBarShowsActivityForApplication = &SBSSetStatusBarShowsActivityForApplication;
  +[NSXPCListener enableTransactions](&OBJC_CLASS___NSXPCListener, "enableTransactions");
  if (!_CPLSilentLogging)
  {
    id v19 = sub_10000537C();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Initializing and launching Daemon", buf, 2u);
    }
  }

  uint64_t v21 = objc_claimAutoreleasedReturnValue(+[CPLCloudKitCoordinator sharedCoordinator](&OBJC_CLASS___CPLCloudKitCoordinator, "sharedCoordinator"));
  v22 = (void *)*((void *)v7 + 7);
  *((void *)v7 + 7) = v21;

  if (!*((_BYTE *)v7 + 16))
  {
    v23 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitPushNotificationCenter);
    v24 = (void *)*((void *)v7 + 8);
    *((void *)v7 + 8) = v23;
  }

  [*((id *)v7 + 7) setPushNotificationCenter:*((void *)v7 + 8)];
  v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v26 = (void *)*((void *)v7 + 9);
  *((void *)v7 + 9) = v25;

  id v27 = objc_alloc_init(&OBJC_CLASS___CPLPlatform);
  +[CPLPlatform setPrequeliteStoreImplementationForPlatform:]( &OBJC_CLASS___CPLPlatform,  "setPrequeliteStoreImplementationForPlatform:",  v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  v29 = (void *)objc_claimAutoreleasedReturnValue([v28 stringForKey:@"CPLFakeICloudPath"]);
  if (!v29) {
    goto LABEL_35;
  }
  int v30 = os_variant_has_internal_content("com.apple.cpl.local-transport");

  if (!v30) {
    goto LABEL_36;
  }
  if (qword_100295EE8 != -1) {
    dispatch_once(&qword_100295EE8, &stru_10023DC48);
  }
  Class v31 = NSClassFromString(@"EnginePlistTransport");
  Class v32 = NSClassFromString(@"EnginePlistLibrary");
  if (v31)
  {
    Class v33 = v32;
    if (v32)
    {
      if (!_CPLSilentLogging)
      {
        id v34 = sub_10000537C();
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Using local transport for CPL Engine",  buf,  2u);
        }
      }

      [v27 setPlatformImplementation:v31 forClass:objc_opt_class(CPLEngineTransport)];
      [v27 setPlatformImplementation:v33 forClass:objc_opt_class(CPLEngineLibrary)];
      [*((id *)v7 + 7) coordinatorWontBeUsed];
      goto LABEL_41;
    }
  }

  if (!_CPLSilentLogging)
  {
    id v36 = sub_10000537C();
    v28 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v28,  OS_LOG_TYPE_ERROR,  "Failed to find local transport class",  buf,  2u);
    }

- (void)_performPendingBlockAfterFirstUnlock
{
  if (self->_isLocked)
  {
    (*((void (**)(void))self->_pendingBlockAfterFirstUnlock + 2))();
    self->_isLocked = 0;
    id pendingBlockAfterFirstUnlock = self->_pendingBlockAfterFirstUnlock;
    self->_id pendingBlockAfterFirstUnlock = 0LL;
  }

- (void)_performOnceDeviceIsUnlocked:(id)a3
{
  BOOL v5 = (void (**)(void))a3;
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_10000537C();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device is unlocked at launch", buf, 2u);
      }
    }

    self->_isLocked = 0;
    v5[2](v5);
  }

  else
  {
    *(void *)buf = 0LL;
    v25 = buf;
    uint64_t v26 = 0x2020000000LL;
    int v27 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10000610C;
    v23[3] = &unk_10023DD58;
    v23[4] = self;
    v23[5] = buf;
    v8 = objc_retainBlock(v23);
    v9 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    unsigned __int8 v10 = (int *)(v25 + 24);
    queue = self->_queue;
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    id v19 = sub_100006160;
    v20 = &unk_10023DDC0;
    v22 = buf;
    v12 = v8;
    id v21 = v12;
    if (notify_register_dispatch(v9, v10, (dispatch_queue_t)queue, &v17))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSAssertionHandler currentHandler]( &OBJC_CLASS___NSAssertionHandler,  "currentHandler",  v17,  v18,  v19,  v20));
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Daemon/CPLDaemon.m"));
      [v15 handleFailureInMethod:a2 object:self file:v16 lineNumber:545 description:@"Can't register to device protection changes notification"];

      abort();
    }

    id v13 = objc_msgSend(v5, "copy", v17, v18, v19, v20);
    id pendingBlockAfterFirstUnlock = self->_pendingBlockAfterFirstUnlock;
    self->_id pendingBlockAfterFirstUnlock = v13;

    _Block_object_dispose(buf, 8);
  }
}

- (void)_performAfterRegistrations:(id)a3
{
  v9 = (void (**)(void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_hasDoneInitialRegistration)
  {
    v9[2]();
  }

  else
  {
    performAfterRegistrations = self->_performAfterRegistrations;
    if (!performAfterRegistrations)
    {
      BOOL v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      id v6 = self->_performAfterRegistrations;
      self->_performAfterRegistrations = v5;

      performAfterRegistrations = self->_performAfterRegistrations;
    }

    id v7 = [v9 copy];
    id v8 = objc_retainBlock(v7);
    -[NSMutableArray addObject:](performAfterRegistrations, "addObject:", v8);
  }
}

- (void)_registerAfterLaunchWhenAllEnginesAreOpened
{
  if (!self->_isLocked
    && !self->_hasDoneInitialRegistration
    && !-[CPLEngineWrapperArray unopenedCount](self->_wrappers, "unopenedCount"))
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_10000537C();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Monitoring system requests", buf, 2u);
      }
    }

    if (!self->_forSyncBubble)
    {
      -[CPLDaemon _registerForConfigurationRefresh](self, "_registerForConfigurationRefresh");
      -[CPLDaemon _registerForMaintenance](self, "_registerForMaintenance");
      -[CPLDaemon _registerForBackupRequests](self, "_registerForBackupRequests");
      -[CPLDaemon _registerForFastPassInitialDownload](self, "_registerForFastPassInitialDownload");
      -[CPLDaemon _registerForPeriodicUploadOfComputeStates](self, "_registerForPeriodicUploadOfComputeStates");
      queue = self->_queue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100006468;
      v20[3] = &unk_10023DC70;
      v20[4] = self;
      id v6 = v20;
      *(void *)buf = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472LL;
      v23 = sub_10000BBFC;
      v24 = &unk_10023DBC8;
      id v25 = v6;
      id v7 = queue;
      dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
      dispatch_async(v7, v8);
    }

    self->_hasDoneInitialRegistration = 1;
    performAfterRegistrations = self->_performAfterRegistrations;
    if (performAfterRegistrations)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      unsigned __int8 v10 = performAfterRegistrations;
      id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v26,  16LL);
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
            (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i) + 16LL))(*(void *)(*((void *)&v16 + 1) + 8LL * (void)i));
          }

          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v16,  v26,  16LL);
        }

        while (v12);
      }

      uint64_t v15 = self->_performAfterRegistrations;
      self->_performAfterRegistrations = 0LL;
    }
  }

- (void)_updateConfigurationRefreshIntervalIfNecessary
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 taskRequestForIdentifier:@"com.apple.cloudphotod.configurationrefresh"]);

  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___BGRepeatingSystemTaskRequest);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray mostRecentConfigurationDictionary]( self->_wrappers,  "mostRecentConfigurationDictionary"));
      id v7 = v6;
      if (!v6) {
        goto LABEL_15;
      }
      [v6 refreshInterval];
      double v9 = v8;
      [v4 interval];
      if (v9 == v10) {
        goto LABEL_15;
      }
      [v4 setInterval:v9];
      [v4 setMinDurationBetweenInstances:v9 * 0.8];
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
      id v21 = 0LL;
      unsigned int v12 = [v11 updateTaskRequest:v4 error:&v21];
      id v13 = v21;

      if (v12)
      {
        if (!_CPLSilentLogging)
        {
          id v14 = sub_10000537C();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            double v23 = v9;
            __int128 v16 = "Updated the refresh interval of the configuration refresh task to %.0f seconds";
            __int128 v17 = v15;
            os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
            uint32_t v19 = 12;
LABEL_12:
            _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, buf, v19);
            goto LABEL_13;
          }

          goto LABEL_13;
        }
      }

      else if (!_CPLSilentLogging)
      {
        id v20 = sub_10000537C();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218242;
          double v23 = v9;
          __int16 v24 = 2112;
          id v25 = v13;
          __int128 v16 = "Failed to update the refresh interval of the configuration refresh task to %.0f seconds: %@";
          __int128 v17 = v15;
          os_log_type_t v18 = OS_LOG_TYPE_ERROR;
          uint32_t v19 = 22;
          goto LABEL_12;
        }

- (void)_registerForConfigurationRefresh
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10000537C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering for configuration refresh",  buf,  2u);
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000674C;
  v7[3] = &unk_10023DE30;
  v7[4] = self;
  [v5 registerForTaskWithIdentifier:@"com.apple.cloudphotod.configurationrefresh" usingQueue:queue launchHandler:v7];
}

- (void)_registerForMaintenance
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10000537C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering for maintenance activity",  buf,  2u);
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006B98;
  v7[3] = &unk_10023DE30;
  v7[4] = self;
  [v5 registerForTaskWithIdentifier:@"com.apple.cloudphotod.maintenance" usingQueue:queue launchHandler:v7];
}

- (void)_registerForBackupRequests
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10000537C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering for user backup requests",  buf,  2u);
    }
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007044;
  v7[3] = &unk_10023DE30;
  v7[4] = self;
  [v5 registerForTaskWithIdentifier:@"com.apple.cloudphotod.backup" usingQueue:queue launchHandler:v7];
}

- (void)_reportICPLFeatureCheckpoint:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      v4 = @"Disabled";
      break;
    case 0x32uLL:
      v4 = @"Available";
      break;
    case 0x1EuLL:
      v4 = @"PreviewAvailable";
      break;
    default:
      v4 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Checkpoint_%lu",  a3);
      break;
  }

  id v14 = 0LL;
  unsigned int v5 = +[BGSystemTaskCheckpoints reportFeatureCheckpoint:forFeature:error:]( &OBJC_CLASS___BGSystemTaskCheckpoints,  "reportFeatureCheckpoint:forFeature:error:",  a3,  107LL,  &v14);
  id v6 = v14;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_10000537C();
      double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        __int128 v16 = v4;
        __int16 v17 = 2114;
        uint64_t v18 = CPLLibraryIdentifierSystemLibrary;
        double v9 = "Reported iCPL feature is %@ for %{public}@";
        double v10 = v8;
        os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
        uint32_t v12 = 22;
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
        goto LABEL_16;
      }

      goto LABEL_16;
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v13 = sub_10000537C();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      __int128 v16 = v4;
      __int16 v17 = 2114;
      uint64_t v18 = CPLLibraryIdentifierSystemLibrary;
      __int16 v19 = 2112;
      id v20 = v6;
      double v9 = "Failed to report iCPL feature is %@ for %{public}@: %@";
      double v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 32;
      goto LABEL_15;
    }

- (void)_registerForFastPassInitialDownload
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10000537C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering for Fast Pass Initial Download",  buf,  2u);
    }
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100007998;
  v15[3] = &unk_10023DE30;
  v15[4] = self;
  [v5 registerForTaskWithIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass" usingQueue:queue launchHandler:v15];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 taskRequestForIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass"]);

  if (v8)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10000537C();
      double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v17 = v8;
        os_log_type_t v11 = "Fast Pass Initial Download still needs to be run - request: %@";
        uint32_t v12 = v10;
        uint32_t v13 = 12;
LABEL_12:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_13;
      }

      goto LABEL_13;
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v14 = sub_10000537C();
    double v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      os_log_type_t v11 = "Fast Pass Initial Download has already run";
      uint32_t v12 = v10;
      uint32_t v13 = 2;
      goto LABEL_12;
    }

- (void)_registerForPeriodicUploadOfComputeStates
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10000537C();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Registering for periodic upload of compute states activity",  buf,  2u);
    }
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100008500;
  v7[3] = &unk_10023DE30;
  v7[4] = self;
  [v5 registerForTaskWithIdentifier:@"com.apple.cloudphotod.periodic.upload.computestates" usingQueue:queue launchHandler:v7];
}

- (id)allowedProtocolForClientAccess:(id)a3
{
  id v3 = a3;
  if ([v3 isEqual:@"library"])
  {
    v4 = &protocolRef_CPLDaemonLibraryManagerProtocol;
  }

  else
  {
    if (([v3 isEqual:@"management"] & 1) == 0
      && ![v3 isEqual:@"preferences"])
    {
      unsigned int v5 = 0LL;
      goto LABEL_7;
    }

    v4 = &protocolRef_CPLDaemonLibraryManagerMinimalProtocol;
  }

  unsigned int v5 = *v4;
LABEL_7:

  return v5;
}

- (void)_processConnectionDidInvalidate:(id)a3
{
  if (a3) {
    -[NSMutableArray removeObject:](self->_processClients, "removeObject:");
  }
}

- (BOOL)_processListener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.private.cloudphotod.access"]);
  id v9 = v8;
  if (v8 && ([v8 isEqual:@"management"] & 1) != 0)
  {
    id v10 = sub_100010460();
    os_log_type_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    [v7 setExportedInterface:v11];
    [v7 setExportedObject:self];
    [v7 _setQueue:self->_queue];
    objc_initWeak((id *)location, self);
    objc_initWeak(&from, v7);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100008AC8;
    v15[3] = &unk_10023DF20;
    objc_copyWeak(&v16, (id *)location);
    objc_copyWeak(&v17, &from);
    [v7 setInvalidationHandler:v15];
    -[NSMutableArray addObject:](self->_processClients, "addObject:", v7);
    [v7 resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&from);
    objc_destroyWeak((id *)location);
    BOOL v12 = 1;
  }

  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }

    id v13 = sub_10000537C();
    os_log_type_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 138412546;
      *(void *)&location[4] = v7;
      __int16 v20 = 2112;
      id v21 = @"com.apple.private.cloudphotod.access";
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ has no valid entitlement for %@",  location,  0x16u);
    }

    BOOL v12 = 0;
  }

LABEL_9:
  return v12;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = (NSXPCListener *)a3;
  id v7 = a4;
  if (self->_processListener == v6)
  {
    unsigned __int8 v10 = -[CPLDaemon _processListener:shouldAcceptNewConnection:]( self,  "_processListener:shouldAcceptNewConnection:",  v6,  v7);
    goto LABEL_66;
  }

  if (self->_deactivated)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_10000537C();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Some client tried to connect while we were deactivated",  buf,  2u);
      }
    }

    unsigned __int8 v10 = 0;
    goto LABEL_66;
  }

  if (!_CPLSilentLogging)
  {
    id v11 = sub_10000537C();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ got a new connection: %@", buf, 0x16u);
    }
  }

  uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.private.cloudphotod.access"]);
  if (v13)
  {
    id v14 = (void *)v13;
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      if (v7)
      {
        [v7 auditToken];
      }

      else
      {
        __int128 v51 = 0u;
        __int128 v52 = 0u;
      }

      CFStringRef v50 = 0LL;
      *(_OWORD *)buf = v51;
      *(_OWORD *)&uint8_t buf[16] = v52;
      if (!CPCopyBundleIdentifierAndTeamFromAuditToken(buf, &v50, 0LL))
      {
        if (!_CPLSilentLogging)
        {
          id v19 = sub_10000537C();
          __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "%@ has no bundle identifier. Will fallback on process ID",  buf,  0xCu);
          }
        }

        int v21 = [v7 processIdentifier];
        __int128 v70 = 0u;
        __int128 v71 = 0u;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        __int128 v64 = 0u;
        __int128 v65 = 0u;
        __int128 v62 = 0u;
        __int128 v63 = 0u;
        __int128 v60 = 0u;
        __int128 v61 = 0u;
        __int128 v58 = 0u;
        __int128 v59 = 0u;
        memset(buf, 0, sizeof(buf));
        if (!proc_name(v21, buf, 0x100u))
        {
          if (_CPLSilentLogging) {
            goto LABEL_43;
          }
          id v27 = sub_10000537C();
          double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            goto LABEL_42;
          }
          v28 = __error();
          v29 = strerror(*v28);
          *(_DWORD *)dispatch_source_t v53 = 138412546;
          id v54 = v7;
          __int16 v55 = 2080;
          v56 = v29;
          __int16 v24 = "Can't get process name for %@: %s";
          id v25 = v23;
          uint32_t v26 = 22;
          goto LABEL_41;
        }

        CFStringRef v50 = CFStringCreateWithCString(0LL, (const char *)buf, 0x8000100u);
        if (!v50 && !_CPLSilentLogging)
        {
          id v22 = sub_10000537C();
          double v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
LABEL_42:

            goto LABEL_43;
          }

          *(_WORD *)dispatch_source_t v53 = 0;
          __int16 v24 = "Can't decypher process name";
          id v25 = v23;
          uint32_t v26 = 2;
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v24, v53, v26);
          goto LABEL_42;
        }
      }

- (id)daemonLibraryManager:(id)a3 engineWrapperWithClientLibraryBaseURL:(id)a4 cloudLibraryStateStorageURL:(id)a5 cloudLibraryResourceStorageURL:(id)a6 libraryIdentifier:(id)a7 mainScopeIdentifier:(id)a8 options:(unint64_t)a9 error:(id *)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  if (self->_isLocked)
  {
    if (self->_isLocked)
    {
      if (a10)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  100LL,  @"Device is locked. File system is not available"));
LABEL_16:
        __int16 v24 = 0LL;
        *a10 = v22;
        goto LABEL_18;
      }

      goto LABEL_17;
    }
  }

  if (v17 && v18 && v19 && v20)
  {
    double v23 = -[CPLEngineParameters initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:]( objc_alloc(&OBJC_CLASS___CPLEngineParameters),  "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:ma inScopeIdentifier:options:",  v17,  v18,  v19,  v20,  v21,  a9);
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( -[CPLEngineWrapperArray registeredWrapperCreateIfNecessaryWithParameters:error:]( self->_wrappers,  "registeredWrapperCreateIfNecessaryWithParameters:error:",  v23,  a10));
  }

  else
  {
    if (!v20)
    {
      if (a10)
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"libraryIdentifier"));
        goto LABEL_16;
      }

- (void)_daemonLibraryManagerWantsToExitNow:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = v4;
    id v6 = sub_10000537C();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ wants to exit now", (uint8_t *)&v10, 0xCu);
    }
  }

  -[CPLEngineWrapperArray emergencyStop](self->_wrappers, "emergencyStop");
  if (!_CPLSilentLogging)
  {
    id v8 = sub_10000537C();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "All engines have been closed in emergency, exiting now",  (uint8_t *)&v10,  2u);
    }
  }

  exit(0);
}

- (void)daemonLibraryManager:(id)a3 wantsToExitAfterResettingParametersForLibraryWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  parametersStorage = self->_parametersStorage;
  id v18 = 0LL;
  unsigned int v9 = -[CPLEngineParametersStorage removeParametersWithLibraryIdentifier:error:]( parametersStorage,  "removeParametersWithLibraryIdentifier:error:",  v7,  &v18);
  id v10 = v18;
  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10000537C();
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v7;
        uint64_t v13 = "Reset parameters for %{public}@";
        id v14 = v12;
        os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
        uint32_t v16 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
        goto LABEL_9;
      }

      goto LABEL_9;
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v17 = sub_10000537C();
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v10;
      uint64_t v13 = "Failed to reset parameters for %{public}@: %@";
      id v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 22;
      goto LABEL_8;
    }

- (void)daemonLibraryManagerWantsToExitNow:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  unsigned int v6 = [v5 BOOLForKey:@"CPLDaemonKeepRunningWithNoEngines"];

  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_10000537C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        unsigned int v9 = "%@ wants to exit now but daemon wants to keep running";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v11, 0xCu);
        goto LABEL_10;
      }

      goto LABEL_10;
    }
  }

  else
  {
    if (!-[CPLEngineWrapperArray count](self->_wrappers, "count"))
    {
      -[CPLDaemon _daemonLibraryManagerWantsToExitNow:](self, "_daemonLibraryManagerWantsToExitNow:", v4);
      goto LABEL_11;
    }

    if (!_CPLSilentLogging)
    {
      id v10 = sub_10000537C();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        id v12 = v4;
        unsigned int v9 = "%@ wants to exit now but there are still some engines running";
        goto LABEL_9;
      }

- (void)daemonLibraryManagerHasBeenDisconnected:(id)a3
{
  if (-[NSMutableArray count](self->_daemonManagers, "count"))
  {
    if (_CPLSilentLogging) {
      return;
    }
    id v4 = sub_10000537C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_9;
    }
    daemonManagers = self->_daemonManagers;
    int v9 = 138412290;
    id v10 = (const __CFString *)daemonManagers;
    id v7 = "Current daemon's clients: %@";
    goto LABEL_8;
  }

  if (_CPLSilentLogging) {
    return;
  }
  id v8 = sub_10000537C();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412290;
    id v10 = @"com.apple.cloudphotod";
    id v7 = "Daemon listening on %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v9, 0xCu);
  }

- (void)_deactivateDaemon
{
  self->_deactivated = 1;
}

- (id)daemonLibraryManagerOtherLibraryManager:(id)a3 withLibraryIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v8 = self->_daemonManagers;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(id *)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (v12 != v6)
        {
          if (objc_msgSend( *(id *)(*((void *)&v17 + 1) + 8 * (void)i),  "isLibraryManager",  (void)v17))
          {
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 engineWrapper]);
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 libraryIdentifier]);
            unsigned __int8 v15 = [v14 isEqualToString:v7];

            if ((v15 & 1) != 0)
            {
              id v9 = v12;
              goto LABEL_13;
            }
          }
        }
      }

      id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v17,  v21,  16LL);
      if (v9) {
        continue;
      }
      break;
    }
  }

- (void)enumerateDaemonLibraryManagersWithLibraryIdentifier:(id)a3 block:(id)a4
{
  id v5 = a4;
  daemonManagers = self->_daemonManagers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100009A4C;
  v8[3] = &unk_10023DF48;
  id v9 = v5;
  id v7 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](daemonManagers, "enumerateObjectsUsingBlock:", v8);
}

- (id)wrapperArray:(id)a3 engineWrapperWithParameters:(id)a4 createIfNecessary:(BOOL)a5 queue:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 clientLibraryBaseURL]);
  id v14 = (void *)v13;
  if (!v9)
  {
    uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudLibraryStateStorageURL]);
    id v56 = 0LL;
    id v55 = 0LL;
    unsigned __int8 v22 = [v16 getResourceValue:&v56 forKey:NSURLVolumeURLKey error:&v55];
    id v18 = v56;
    id v21 = v55;
    if ((v22 & 1) != 0) {
      goto LABEL_5;
    }

    if (_CPLSilentLogging)
    {
      id v18 = 0LL;
LABEL_32:

      id v23 = v21;
      if (a7) {
        goto LABEL_21;
      }
      goto LABEL_33;
    }

    id v54 = v12;
    id v44 = sub_10000537C();
    uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      id v45 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
      *(_DWORD *)buf = 138412546;
      __int128 v64 = v45;
      __int16 v65 = 2112;
      id v66 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Can't access library at %@ anymore: %@",  buf,  0x16u);
    }

    id v18 = 0LL;
LABEL_31:

    id v12 = v54;
    goto LABEL_32;
  }

  __int128 v51 = a7;
  unsigned __int8 v15 = (void *)v13;
  uint32_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientLibraryBaseURL]);
  id v61 = 0LL;
  id v60 = 0LL;
  unsigned __int8 v17 = [v16 getResourceValue:&v61 forKey:NSURLVolumeURLKey error:&v60];
  id v18 = v61;
  id v19 = v60;
  __int128 v20 = v19;
  if ((v17 & 1) != 0)
  {
    id v21 = v19;
    id v14 = v15;
LABEL_5:

    id v23 = v21;
    goto LABEL_6;
  }

  id v54 = v12;

  uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 URLByDeletingLastPathComponent]);
  id v58 = 0LL;
  id v59 = 0LL;
  unsigned __int8 v41 = -[os_log_s getResourceValue:forKey:error:]( v40,  "getResourceValue:forKey:error:",  &v59,  NSURLVolumeURLKey,  &v58);
  id v18 = v59;
  id v21 = v58;

  if ((v41 & 1) == 0)
  {
    if (_CPLSilentLogging)
    {
      id v14 = v15;
    }

    else
    {
      id v46 = sub_10000537C();
      v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      id v14 = v15;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue([v16 path]);
        *(_DWORD *)buf = 138412546;
        __int128 v64 = v48;
        __int16 v65 = 2112;
        id v66 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "Unable to create library at %@. Unable to get parent folder info: %@",  buf,  0x16u);
      }
    }

    a7 = v51;
    goto LABEL_31;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v57 = v21;
  unsigned __int8 v43 = [v42 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:0 error:&v57];
  id v23 = v57;

  id v14 = v15;
  a7 = v51;
  id v12 = v54;
  if ((v43 & 1) == 0)
  {
    if (v51)
    {
LABEL_21:
      id v23 = v23;
      v28 = 0LL;
      *a7 = v23;
      goto LABEL_34;
    }

- (void)wrapperArray:(id)a3 wrapperShouldBeDropped:(id)a4
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "libraryIdentifier", a3));
  +[CPLCloudKitReschedulerCoordinator dropCloudKitReschedulerManagerForLibraryWithIdentifier:]( &OBJC_CLASS___CPLCloudKitReschedulerCoordinator,  "dropCloudKitReschedulerManagerForLibraryWithIdentifier:",  v4);
}

- (BOOL)allowsConfigurationRefreshForWrapperArray:(id)a3
{
  return !self->_forSyncBubble;
}

- (void)emergencyExitForWrapperArray:(id)a3
{
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10000537C();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Daemon exiting immediately", v6, 2u);
    }
  }

  exit(0);
}

- (void)wrapperArrayCountDidChange:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    if (![v4 unopenedCount]) {
      -[CPLDaemon _registerAfterLaunchWhenAllEnginesAreOpened](self, "_registerAfterLaunchWhenAllEnginesAreOpened");
    }
  }

  else
  {
    if (self->_closing || self->_deactivated)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = sub_10000537C();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "No more engines open - exiting immediately",  buf,  2u);
        }
      }

      exit(0);
    }

    if (!_CPLSilentLogging)
    {
      id v5 = sub_10000537C();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No engines are configured", v9, 2u);
      }
    }
  }
}

- (void)_wrapperArray:(id)a3 forDaemon:(BOOL)a4 getStatusWithCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000A334;
  v17[3] = &unk_10023DFB8;
  BOOL v20 = a4;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  id v12 = objc_retainBlock(v17);
  uint64_t v13 = v12;
  pushNotificationCenter = self->_pushNotificationCenter;
  if (pushNotificationCenter)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10000A8D0;
    v15[3] = &unk_10023E008;
    void v15[4] = self;
    uint32_t v16 = v12;
    -[CPLCloudKitPushNotificationCenter getStatusWithCompletionHandler:]( pushNotificationCenter,  "getStatusWithCompletionHandler:",  v15);
  }

  else
  {
    ((void (*)(void *, void))v12[2])(v12, 0LL);
  }
}

- (void)wrapperArray:(id)a3 getStatusWithCompletionHandler:(id)a4
{
}

- (void)wrapperArray:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000AABC;
  v11[3] = &unk_10023E058;
  v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000BBFC;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  id v8 = queue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)_reRunFastPassInitialDownloadIfNecessaryForWrapper:(id)a3 withReschedulerManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [[BGFastPassSystemTaskRequest alloc] initWithIdentifier:@"com.apple.cloudphotod.initialdownload.fastpass"];
  [v8 setRequiresProtectionClass:3];
  [v8 setRequiresExternalPower:0];
  [v8 setRequiresNetworkConnectivity:1];
  [v8 setPriority:2];
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 involvedProcesses]);
  [v8 setInvolvedProcesses:v9];

  [v8 setFeatureCodes:&off_10025AF38];
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v7 taskIdentifier]);

  uint64_t v33 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
  [v8 setProcessingTaskIdentifiers:v11];

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"com.apple.cloudphotod.initialdownload.assets",  @"com.apple.cloudphotod.initialdownload.finished",  @"com.apple.cloudphotod.initialdownload.fastpass",  0LL));
  [v8 setProducedResultIdentifiers:v12];

  [v8 setReRun:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[BGSystemTaskScheduler sharedScheduler](&OBJC_CLASS___BGSystemTaskScheduler, "sharedScheduler"));
  id v28 = 0LL;
  LOBYTE(v10) = [v13 submitTaskRequest:v8 error:&v28];
  id v14 = v28;

  if ((v10 & 1) == 0)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
    if ([v18 isEqualToString:BGSystemTaskSchedulerErrorDomain])
    {
      id v19 = [v14 code];

      if (v19 == (id)5)
      {
        if (_CPLSilentLogging) {
          goto LABEL_18;
        }
        id v20 = sub_10000537C();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
          *(_DWORD *)buf = 138543362;
          int v30 = v22;
          id v23 = "Noting that %{public}@ needs Fast Pass Initial Download but failed to submit a rerun request because the"
                " request has already been submitted";
          id v24 = v21;
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          uint32_t v26 = 12;
LABEL_16:
          _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, v26);

          goto LABEL_17;
        }

        goto LABEL_17;
      }
    }

    else
    {
    }

    if (_CPLSilentLogging) {
      goto LABEL_18;
    }
    id v27 = sub_10000537C();
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v6 libraryIdentifier]);
      *(_DWORD *)buf = 138543618;
      int v30 = v22;
      __int16 v31 = 2112;
      id v32 = v14;
      id v23 = "Noting that %{public}@ needs Fast Pass Initial Download but failed to submit request: %@";
      id v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      uint32_t v26 = 22;
      goto LABEL_16;
    }

- (void)wrapperArray:(id)a3 wrapperNeedsInitialDownloadOfMainScope:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!self->_forSyncBubble && [v5 isSystemLibrary])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engine]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 transport]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 platformObject]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 reschedulerManager]);
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___CPLCloudKitTransport);
    if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___CPLBGSTReschedulerManager);
      if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0)
      {
        queue = self->_queue;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_10000B16C;
        v17[3] = &unk_10023DE80;
        v17[4] = self;
        id v18 = v6;
        id v19 = v10;
        id v14 = v17;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_10000BBFC;
        block[3] = &unk_10023DBC8;
        id v21 = v14;
        id v15 = queue;
        dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
        dispatch_async(v15, v16);
      }
    }
  }
}

- (void)wrapperArray:(id)a3 wrapperDidCompleteInitialSyncOfMainScope:(id)a4
{
  if (!self->_forSyncBubble)
  {
  }

- (unint64_t)wrapperArray:(id)a3 countOfClientsForWrapper:(id)a4
{
  id v5 = a4;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v6 = self->_daemonManagers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * (void)i), "engineWrapper", (void)v14));

        if (v12 == v5) {
          ++v9;
        }
      }

      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v8);
  }

  else
  {
    unint64_t v9 = 0LL;
  }

  return v9;
}

- (void)getDaemonStatusWithCompletionHandler:(id)a3
{
}

- (void)getEngineWrapperStatusesWithCompletionHandler:(id)a3
{
  queue = self->_queue;
  id v5 = (void (**)(id, id, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapperArray wrapperStatuses](self->_wrappers, "wrapperStatuses"));
  v5[2](v5, v6, 0LL);
}

- (void)getDaemonLibraryManagerStatusesWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, NSMutableArray *, void))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v5 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](self->_daemonManagers, "count"));
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = self->_daemonManagers;
  id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v10), "status", (void)v12));
        -[NSMutableArray addObject:](v5, "addObject:", v11);

        uint64_t v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
    }

    while (v8);
  }

  v4[2](v4, v5, 0LL);
}

- (void)requestLibraryWithIdentifier:(id)a3 withActivatedMainScope:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)requestInitialDownloadOfMainScopeForLibraryWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)wipeEnginesIfNecessaryWithCompletionHandler:(id)a3
{
  wrappers = self->_wrappers;
  id v4 = (void (**)(id, void))a3;
  -[CPLEngineWrapperArray wipeEnginesIfNecessary](wrappers, "wipeEnginesIfNecessary");
  v4[2](v4, 0LL);
}

- (void)initialDownloadHelper:(id)a3 checkActiveAccountWithCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10000B780;
  v17[3] = &unk_10023E080;
  v17[4] = self;
  id v20 = v21;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
  id v18 = v8;
  id v9 = v7;
  id v19 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000B804;
  v15[3] = &unk_10023E058;
  void v15[4] = self;
  uint64_t v10 = objc_retainBlock(v17);
  id v16 = v10;
  [v8 setCancellationHandler:v15];
  coordinator = self->_coordinator;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000B918;
  v13[3] = &unk_10023E0D0;
  v13[4] = self;
  __int128 v12 = v10;
  id v14 = v12;
  -[CPLCloudKitCoordinator fetchAccountInfoWithCompletionHandler:]( coordinator,  "fetchAccountInfoWithCompletionHandler:",  v13);

  _Block_object_dispose(v21, 8);
}

- (void).cxx_destruct
{
}

@end