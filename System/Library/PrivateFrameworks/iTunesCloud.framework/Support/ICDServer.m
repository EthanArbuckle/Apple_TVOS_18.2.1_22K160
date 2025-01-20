@interface ICDServer
+ (ICDServer)server;
- (BOOL)_canCompleteStartupSequence;
- (BOOL)cancelOperationsByClass:(Class)a3;
- (BOOL)hasOperationsOfClass:(Class)a3;
- (BOOL)ignoreAccountChanges;
- (BOOL)isStartupSequenceCompleted;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)switchLibraryManagementPolicy;
- (CloudPushNotificationController)pushNotificationController;
- (CloudUserNotificationController)userNotificationController;
- (ICDAccountManaging)accountManager;
- (ICDBackgroundTaskManaging)backgroundTaskManager;
- (ICDCloudBadgeService)cloudBadgingService;
- (ICDCloudServiceStatusMonitor)cloudServiceStatusMonitor;
- (ICDEnhancedAudioKeyManager)enhancedAudioKeyManager;
- (ICDHandlerCoordinating)handlerCoordinator;
- (ICDNetworkAvailabilityService)networkAvailabilityService;
- (ICDPlaybackPositionService)playbackPositionService;
- (ICDServerNotificationsManager)serverNotificationsManager;
- (ICDServerOperationsManager)serverOperationsManager;
- (ICDelegateAccountStoreServiceListener)delegateAccountStoreListener;
- (ICDelegationProviderService)delegationProviderService;
- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer;
- (NSMutableDictionary)xpcListeners;
- (NSOperationQueue)internalOperationQueue;
- (NSUserDefaults)mediaPlaybackDefaults;
- (OS_dispatch_group)serverStartupGroup;
- (OS_dispatch_queue)serialQueue;
- (OS_dispatch_queue)startupQueue;
- (OS_dispatch_source)sigtermSource;
- (id)_init;
- (id)_setupXPCListenerForService:(int64_t)a3;
- (id)_stateDump;
- (id)_urlResolutionCacheFilePath;
- (id)daemonOptionsForConfiguration:(id)a3;
- (id)handlerWithType:(int64_t)a3 configuration:(id)a4 error:(id *)a5;
- (int64_t)_ICCloudServerSupportedServiceForXPCListener:(id)a3;
- (int64_t)preferredVideoQuality;
- (unint64_t)stateHandle;
- (unsigned)outputClusterType;
- (void)_completeStartupSequenceIfNeeded;
- (void)_ensureMusicSubscriptionKeysAreAvailableForConfiguration:(id)a3;
- (void)_ensureSubscriptionInformationIsUpToDateForConfiguration:(id)a3;
- (void)_ensureURLResolutionCacheFileExists;
- (void)_handleApplicationRegistrationNotification:(id)a3;
- (void)_handleFamilyContentDeletionEvent:(id)a3;
- (void)_handleFlushPlayActivityEvents;
- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_initializeAncillaryServices;
- (void)_initializeSocialFeaturesAvailabilityIfNeeded;
- (void)_migrateToLatestUserVersionForConfigurations:(id)a3;
- (void)_performPeriodicSubscriptionTasks;
- (void)_precacheHomeProperties;
- (void)_preprocessURLResolutionCacheDictionary:(id)a3;
- (void)_retryLoadingCloudLibraryForSecondaryAccountsOnAppleTV;
- (void)_setupInternalQueues;
- (void)_setupKVO;
- (void)_setupMPMediaLibraryFilteringForConfigurations:(id)a3;
- (void)_setupSigtermHandler;
- (void)_startAncillaryServices;
- (void)_stopAncillaryServices;
- (void)_tearDownKVO;
- (void)_transitionAppleTVToParallelMultiUserLibraryManagementPolicy;
- (void)_updateAccountServerCachedData;
- (void)_updateAirPlaySettingsForConfiguration:(id)a3;
- (void)_updateAllowsExplicitContentSettingForConfiguration:(id)a3 automatically:(BOOL)a4;
- (void)_updateEnhancedAudioAvailabilityIfNeeded;
- (void)_updateHTTPCookieStoreForContentRestrictions;
- (void)_updateMediaRemoteCommands:(BOOL)a3;
- (void)_updateSocialFeaturesAvailabilityIfNeededUsingBag:(id)a3;
- (void)_writeURLResolutionCacheFileUsingBag:(id)a3;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)dealloc;
- (void)enumerateBackgroundOperationsUsingBlock:(id)a3;
- (void)enumerateOperationsUsingBlock:(id)a3;
- (void)fetchEnhancedAudioOfflineKeys;
- (void)getListenerEndpointForService:(int64_t)a3 completion:(id)a4;
- (void)listCloudServerOperations;
- (void)notificationsManager:(id)a3 didReceiveActiveUserIdentityDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveAllowsExplicitContentDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveAllowsMusicVideosDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveApplicationInstallationNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveAuthServiceTokenDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveFamilyDeletionEventNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveHandlerCoordinatorFinishedInitializationNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveSubscriptionStatusDidChangeNotification:(id)a4;
- (void)notificationsManager:(id)a3 didReceiveUserIdentityStoreDidChangeNotification:(id)a4;
- (void)notificationsManagerDidReceiveCellularDataRestrictionDidChangeDarwinNotification:(id)a3;
- (void)notificationsManagerDidReceiveCloudAuthenticationDidChangeDarwinNotification:(id)a3;
- (void)notificationsManagerDidReceiveFamilyCircleChangedNotification:(id)a3;
- (void)notificationsManagerDidReceiveFirstUnlockNotification:(id)a3;
- (void)notificationsManagerDidReceiveLibraryImportDidFinishDarwinNotification:(id)a3;
- (void)notificationsManagerDidReceiveMusicSettingsChangedNotification:(id)a3;
- (void)notificationsManagerDidReceivePhoneNumberChangedNotification:(id)a3;
- (void)notificationsManagerDidRecieveICPlayActivityFlushInternalTestRequestNotification:(id)a3;
- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)processPendingKeyInvalidations;
- (void)refreshEnhancedAudioSharedKeys;
- (void)scheduleBackgroundUpdateType:(int64_t)a3 forConfiguration:(id)a4;
- (void)setIgnoreAccountChanges:(BOOL)a3;
- (void)setPreferredVideoQuality:(int64_t)a3;
- (void)setStartupSequenceCompleted:(BOOL)a3;
- (void)setSwitchLibraryManagementPolicy:(BOOL)a3;
- (void)start;
- (void)stop;
@end

@implementation ICDServer

- (id)_init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___ICDServer;
  v2 = -[ICDServer init](&v24, "init");
  if (v2)
  {
    +[ICUserIdentityStore _claimSingleWriterStatus](&OBJC_CLASS___ICUserIdentityStore, "_claimSingleWriterStatus");
    -[ICDServer _setupInternalQueues](v2, "_setupInternalQueues");
    -[ICDServer _setupSigtermHandler](v2, "_setupSigtermHandler");
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xpcListeners = v2->_xpcListeners;
    v2->_xpcListeners = v3;

    dispatch_group_t v5 = dispatch_group_create();
    serverStartupGroup = v2->_serverStartupGroup;
    v2->_serverStartupGroup = (OS_dispatch_group *)v5;

    v7 = -[ICDServerNotificationsManager initWithDelegate:]( objc_alloc(&OBJC_CLASS___ICDServerNotificationsManager),  "initWithDelegate:",  v2);
    serverNotificationsManager = v2->_serverNotificationsManager;
    v2->_serverNotificationsManager = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___ICDNetworkAvailabilityService);
    networkAvailabilityService = v2->_networkAvailabilityService;
    v2->_networkAvailabilityService = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___ICDServerOperationsManager);
    serverOperationsManager = v2->_serverOperationsManager;
    v2->_serverOperationsManager = v11;

    v13 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.mediaplaybackcore");
    mediaPlaybackDefaults = v2->_mediaPlaybackDefaults;
    v2->_mediaPlaybackDefaults = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___ICDMediaUserStateCenterServer);
    mediaUserStateCenterServer = v2->_mediaUserStateCenterServer;
    v2->_mediaUserStateCenterServer = (ICMediaUserStateCenterServerProtocol *)v15;

    v2->_outputClusterType = 0;
    -[ICDServer _setupKVO](v2, "_setupKVO");
    v17 = objc_alloc_init(&OBJC_CLASS___ICDEnhancedAudioKeyManager);
    enhancedAudioKeyManager = v2->_enhancedAudioKeyManager;
    v2->_enhancedAudioKeyManager = v17;

    internalOperationQueue = v2->_internalOperationQueue;
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[CloudArtworkImportSetupOperation sharedSetupOperation]( &OBJC_CLASS___CloudArtworkImportSetupOperation,  "sharedSetupOperation"));
    -[NSOperationQueue addOperation:](internalOperationQueue, "addOperation:", v20);

    v21 = objc_alloc_init(&OBJC_CLASS___ICDPlaybackPositionService);
    playbackPositionService = v2->_playbackPositionService;
    v2->_playbackPositionService = v21;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  serverNotificationsManager = self->_serverNotificationsManager;
  self->_serverNotificationsManager = 0LL;

  serverOperationsManager = self->_serverOperationsManager;
  self->_serverOperationsManager = 0LL;

  networkAvailabilityService = self->_networkAvailabilityService;
  self->_networkAvailabilityService = 0LL;

  mediaUserStateCenterServer = self->_mediaUserStateCenterServer;
  self->_mediaUserStateCenterServer = 0LL;

  playbackPositionService = self->_playbackPositionService;
  self->_playbackPositionService = 0LL;

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ICDServer;
  -[ICDServer dealloc](&v9, "dealloc");
}

- (id)_stateDump
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 listCloudServerOperations]);

  return v3;
}

- (void)start
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005BA9C;
  v9[3] = &unk_1001A3190;
  v9[4] = self;
  self->_stateHandle = sub_10005BA9C((uint64_t)v9);
  v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting server...", buf, 2u);
  }

  id v4 = -[ICDServer _setupXPCListenerForService:](self, "_setupXPCListenerForService:", 1LL);
  dispatch_group_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CloudMusicSubscriptionStatusServiceListener sharedMusicSubscriptionStatusServiceListener]( &OBJC_CLASS___CloudMusicSubscriptionStatusServiceListener,  "sharedMusicSubscriptionStatusServiceListener"));
  [v5 start];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceSetupStatusMonitor sharedMonitor](&OBJC_CLASS___ICDeviceSetupStatusMonitor, "sharedMonitor"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10005BB68;
  v7[3] = &unk_1001A6B90;
  v7[4] = self;
  [v6 performBlockAfterDeviceSetup:v7];

  notify_post("com.apple.itunescloudd.launched");
}

- (void)stop
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping server...", buf, 2u);
  }

  dispatch_group_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B9DC;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(v5, block);

  v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v7 timeIntervalSinceDate:v3];
    *(_DWORD *)buf = 134217984;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped server in %f seconds.", buf, 0xCu);
  }
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  [v7 addOperation:v6 priority:v4];
}

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  [v7 addBackgroundOperation:v6 priority:v4];
}

- (BOOL)cancelOperationsByClass:(Class)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  LOBYTE(a3) = [v4 cancelOperationsByClass:a3];

  return (char)a3;
}

- (BOOL)hasOperationsOfClass:(Class)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  LOBYTE(a3) = [v4 hasOperationsOfClass:a3];

  return (char)a3;
}

- (void)enumerateOperationsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  [v5 enumerateOperationsUsingBlock:v4];
}

- (void)enumerateBackgroundOperationsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  [v5 enumerateBackgroundOperationsUsingBlock:v4];
}

- (id)daemonOptionsForConfiguration:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CloudServerOptions);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  if ([v5 isAppleTV])
  {
    os_log_t v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_5:

      -[CloudServerOptions setProhibitLibraryUpload:](v4, "setProhibitLibraryUpload:", 1LL);
LABEL_10:
      -[CloudServerOptions setSupportsAutomaticEnablingiCloudMusicLibrary:]( v4,  "setSupportsAutomaticEnablingiCloudMusicLibrary:",  1LL);
      goto LABEL_11;
    }

    *(_WORD *)buf = 0;
    id v7 = "Setting options for apple tv.";
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    goto LABEL_5;
  }

  if ([v5 isAudioAccessory])
  {
    uint64_t v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Setting options for audio accessory.",  buf,  2u);
    }

    -[CloudServerOptions setProhibitLibraryUpload:](v4, "setProhibitLibraryUpload:", 1LL);
    -[CloudServerOptions setProhibitArtworkPrefetch:](v4, "setProhibitArtworkPrefetch:", 1LL);
    goto LABEL_10;
  }

  if ([v5 isWatch])
  {
    v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting options for watch.", buf, 2u);
    }

    id v11 = sub_1000B1B34();
    -[CloudServerOptions setProhibitLibraryUpload:](v4, "setProhibitLibraryUpload:", 1LL);
    -[CloudServerOptions setProhibitArtworkPrefetch:](v4, "setProhibitArtworkPrefetch:", v11);
    -[CloudServerOptions setSupportsAutomaticEnablingiCloudMusicLibrary:]( v4,  "setSupportsAutomaticEnablingiCloudMusicLibrary:",  v11 ^ 1);
    v12 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = -[CloudServerOptions prohibitLibraryUpload](v4, "prohibitLibraryUpload");
      unsigned int v14 = -[CloudServerOptions prohibitArtworkPrefetch](v4, "prohibitArtworkPrefetch");
      unsigned int v15 = -[CloudServerOptions supportsAutomaticEnablingiCloudMusicLibrary]( v4,  "supportsAutomaticEnablingiCloudMusicLibrary");
      *(_DWORD *)buf = 67109888;
      int v24 = (int)v11;
      __int16 v25 = 1024;
      unsigned int v26 = v13;
      __int16 v27 = 1024;
      unsigned int v28 = v14;
      __int16 v29 = 1024;
      unsigned int v30 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Setting options for watch. isMediaSyncingSupported=%{BOOL}u, prohibitLibraryUpload=%{BOOL}u, prohibitArtworkPref etch =%{BOOL}u, supportsAutomaticEnablingiCloudMusicLibrary=%{BOOL}u",  buf,  0x1Au);
    }
  }

  else
  {
    if ([v5 isROSDevice])
    {
      os_log_t v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_5;
      }
      *(_WORD *)buf = 0;
      id v7 = "Setting options for Vision.";
      goto LABEL_4;
    }

    if ([v5 supportsSideLoadedMediaContent])
    {
      v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Setting options for phone/ipad/ipod.",  buf,  2u);
      }

      dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10005B728;
      v19[3] = &unk_1001A31F8;
      v20 = v4;
      id v21 = v3;
      dispatch_semaphore_t v22 = v17;
      v18 = v17;
      sub_1000C35B8(v21, v19);
      dispatch_semaphore_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

- (void)refreshEnhancedAudioSharedKeys
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Refreshing enhanced-audio shared keys", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer enhancedAudioKeyManager](self, "enhancedAudioKeyManager"));
  [v4 refreshSharedKeys];
}

- (void)fetchEnhancedAudioOfflineKeys
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Fetching enhanced-audio offline keys", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer enhancedAudioKeyManager](self, "enhancedAudioKeyManager"));
  [v4 fetchMissingOfflineKeys];
}

- (void)processPendingKeyInvalidations
{
  id v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "processing pending key invalidations", v5, 2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer enhancedAudioKeyManager](self, "enhancedAudioKeyManager"));
  [v4 processPendingKeyInvalidations];
}

- (void)listCloudServerOperations
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
  id v2 = [v3 listCloudServerOperations];
}

- (void)scheduleBackgroundUpdateType:(int64_t)a3 forConfiguration:(id)a4
{
  id v6 = a4;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer backgroundTaskManager](self, "backgroundTaskManager"));
  [v7 scheduleTaskOfType:a3 forConfiguration:v6];
}

- (id)handlerWithType:(int64_t)a3 configuration:(id)a4 error:(id *)a5
{
  id v6 = a4;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int16 v29 = self;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 supportedConfigurations]);

  id v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      unsigned int v13 = *(void **)(*((void *)&v32 + 1) + 8 * v12);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accountDSID]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 userIdentity]);
      dispatch_semaphore_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 accountDSID]);
      uint64_t v18 = (uint64_t)[v15 isEqualToString:v17];

      if ((v18 & 1) != 0) {
        break;
      }
      if (v10 == (id)++v12)
      {
        id v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }

    if (a3 == 1)
    {
      unsigned int v26 = &OBJC_CLASS___ArtistImageRequestHandler;
    }

    else
    {
      if (a3) {
        goto LABEL_22;
      }
      unsigned int v26 = &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler;
    }

    uint64_t v18 = objc_claimAutoreleasedReturnValue(-[__objc2_class handlerForConfiguration:](v26, "handlerForConfiguration:", v6));
  }

  else
  {
LABEL_9:

    v19 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 accountDSID]);
      *(_DWORD *)buf = 134218242;
      v37 = v29;
      __int16 v38 = 2112;
      v39 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "ICDServer %p - Attempt to retrieve handler for unsupported configuration [returning nil] - Configuration dsid=%@",  buf,  0x16u);
    }

    if (a5)
    {
      dispatch_semaphore_t v22 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  3LL);
      if (MSVDeviceOSIsInternalInstall(v22))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
        int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 accountDSID]);
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Attempting to retrieve handler for an unsupported configuration [dsid=%@]",  v24));
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v25,  NSLocalizedDescriptionKey);
      }

      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  @"Attempting to retrieve handler for an unsupported configuration",  NSLocalizedDescriptionKey);
      }

      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  @"An ICCloudClient (or HSCloudClient) instance is using a signed-out user identity.",  NSLocalizedFailureReasonErrorKey);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  @"Listen to ICActiveUserIdentityDidChangeNotification and either update ICCloudClient with the new active account or recreate it",  NSLocalizedRecoverySuggestionErrorKey);
      id v27 = -[NSMutableDictionary copy](v22, "copy");
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2003LL,  v27));
    }

    uint64_t v18 = 0LL;
  }

- (void)getListenerEndpointForService:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer _setupXPCListenerForService:](self, "_setupXPCListenerForService:", a3));
  if (v7)
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t Name = ICCloudServerSupportedServiceGetName(a3);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(Name);
    uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v18 = self;
      __int16 v19 = 2114;
      v20 = v10;
      __int16 v21 = 2048;
      int64_t v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "ICDServer %p - Unable to get an anonymous listener for %{public}@[%ld] - This usually indicates an attempt to ac cess itunescloudd without the proper entitlements.",  buf,  0x20u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable to get an anonymous listener for %@[%ld] - This usually indicates an attempt to access itunescloudd without the proper entitlements.",  v10,  a3,  @"description"));
    v16 = v12;
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"ICCloudServiceErrorDomain",  2000LL,  v13));
  }

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v7 endpoint]);
  v6[2](v6, v14, v8);
}

- (void)notifyDeviceSetupFinishedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v7 = 134217984;
    uint64_t v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "CloudService %p Handling notification request that device setup has finished",  (uint8_t *)&v7,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceSetupStatusMonitor sharedMonitor](&OBJC_CLASS___ICDeviceSetupStatusMonitor, "sharedMonitor"));
  [v6 setSetupAssistantComplete:1];

  -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
  v4[2](v4, 0LL);
}

- (id)_setupXPCListenerForService:(int64_t)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unsigned int v13 = sub_10005822C;
  unsigned int v14 = sub_10005823C;
  id v15 = 0LL;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10005B3C8;
  v9[3] = &unk_1001A3220;
  v9[6] = a3;
  v9[7] = a2;
  v9[4] = self;
  void v9[5] = &v10;
  dispatch_sync(v6, v9);

  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (int64_t)_ICCloudServerSupportedServiceForXPCListener:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  unsigned int v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = sub_10005822C;
  v16 = sub_10005823C;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B2E0;
  block[3] = &unk_1001A47E8;
  block[4] = self;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  dispatch_sync(serialQueue, block);
  int64_t v7 = ICCloudServerSupportedServiceForName(v13[5]);

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a4;
  unint64_t v7 = -[ICDServer _ICCloudServerSupportedServiceForXPCListener:]( self,  "_ICCloudServerSupportedServiceForXPCListener:",  a3);
  if (objc_msgSend(v6, "icd_isConnectionAllowedForService:", v7))
  {
    signed int v8 = [v6 processIdentifier];
    if (v6) {
      [v6 auditToken];
    }
    else {
      memset(v28, 0, sizeof(v28));
    }
    uint64_t v9 = MSVBundleIDForAuditToken(v28);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    uint64_t Name = ICCloudServerSupportedServiceGetName(v7);
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue(Name);
    if (v7 > 7) {
      goto LABEL_26;
    }
    if (((1LL << v7) & 0xF5) != 0)
    {
      unsigned int v13 = (CloudService *)os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
      {
LABEL_13:
        LOBYTE(self) = 0;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }

      *(_DWORD *)buf = 134219266;
      uint64_t v14 = @"unknown";
      unsigned int v30 = self;
      __int16 v31 = 2114;
      if (v12) {
        uint64_t v14 = v12;
      }
      id v32 = v6;
      __int16 v33 = 2114;
      __int128 v34 = v10;
      __int16 v35 = 2048;
      uint64_t v36 = v8;
      __int16 v37 = 2114;
      __int16 v38 = v14;
      __int16 v39 = 2048;
      uint64_t v40 = v7;
      id v15 = "ICDServer %p - Refusing XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_ERROR, v15, buf, 0x3Eu);
      goto LABEL_13;
    }

    if (v7 == 1)
    {
      v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        unsigned int v30 = self;
        __int16 v31 = 2114;
        id v32 = v6;
        __int16 v33 = 2114;
        __int128 v34 = v10;
        __int16 v35 = 2048;
        uint64_t v36 = v8;
        __int16 v37 = 2114;
        __int16 v38 = v12;
        __int16 v39 = 2048;
        uint64_t v40 = 1LL;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Setting XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].",  buf,  0x3Eu);
      }

      unsigned int v13 = (CloudService *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICCloudServerListenerEndpointServiceProtocol));
      [v6 setExportedInterface:v13];
      [v6 setExportedObject:self];
      [v6 resume];
    }

    else
    {
      if (!-[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted"))
      {
        -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
        if (!-[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted"))
        {
          os_log_t v27 = sub_1000DD8D8();
          unsigned int v13 = (CloudService *)objc_claimAutoreleasedReturnValue(v27);
          if (!os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 134219266;
          unsigned int v30 = self;
          __int16 v31 = 2114;
          id v32 = v6;
          __int16 v33 = 2114;
          __int128 v34 = v10;
          __int16 v35 = 2048;
          uint64_t v36 = v8;
          __int16 v37 = 2114;
          __int16 v38 = v12;
          __int16 v39 = 2048;
          uint64_t v40 = 3LL;
          id v15 = "ICDServer %p - Refusing XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld]: not ready.";
          goto LABEL_12;
        }
      }

      id v17 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219266;
        unsigned int v30 = self;
        __int16 v31 = 2114;
        id v32 = v6;
        __int16 v33 = 2114;
        __int128 v34 = v10;
        __int16 v35 = 2048;
        uint64_t v36 = v8;
        __int16 v37 = 2114;
        __int16 v38 = v12;
        __int16 v39 = 2048;
        uint64_t v40 = 3LL;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Setting XPC connection %{public}@ from %{public}@[%ld] for service %{public}@[%ld].",  buf,  0x3Eu);
      }

      unsigned int v13 = -[CloudService initWithHandlerProvider:]( objc_alloc(&OBJC_CLASS___CloudService),  "initWithHandlerProvider:",  self);
      -[CloudService setRequestingBundleID:](v13, "setRequestingBundleID:", v10);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICCloudServerProtocol));
      uint64_t v22 = MSVPropertyListDataClasses(v18, v19, v20, v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      int v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](&OBJC_CLASS___NSMutableSet, "setWithSet:", v23));

      objc_msgSend(v24, "addObject:", objc_opt_class(ICCloudClientCollaborationEditParams, v25));
      [v18 setClasses:v24 forSelector:"editCollaborationWithPersistentID:configuration:properties:trackEdits:completion:" argumentIndex:3 ofReply:0];
      [v6 setExportedInterface:v18];
      [v6 setExportedObject:v13];
      [v6 resume];
    }

    LOBYTE(self) = 1;
    goto LABEL_25;
  }

  LOBYTE(self) = 0;
LABEL_27:

  return self & 1;
}

- (void)notificationsManagerDidReceiveLibraryImportDidFinishDarwinNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v12 = 134217984;
      unsigned int v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Import finished]",  (uint8_t *)&v12,  0xCu);
    }

    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
    signed int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeConfiguration]);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ArtistImageRequestHandler,  "handlerForConfiguration:",  v8));

    if (v5)
    {
      uint64_t v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received library import did finish notification, triggering artist hero update.",  (uint8_t *)&v12,  2u);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s configuration](v5, "configuration"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientIdentity]);
      -[os_log_s updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:]( v5,  "updateArtistHeroImagesForArtistsAddedSinceLastUpdateUsingClientIdentity:",  v11);
    }
  }

  else if (v6)
  {
    int v12 = 134217984;
    unsigned int v13 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Import finished - Not ready]",  (uint8_t *)&v12,  0xCu);
  }
}

- (void)notificationsManagerDidReceiveCellularDataRestrictionDidChangeDarwinNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Cellular restriction]",  buf,  0xCu);
    }

    -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
    int AppBooleanValue = CFPreferencesGetAppBooleanValue( @"AllowAutoDownloadOnCellular",  @"com.apple.itunesstored",  0LL);
    signed int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 activeConfiguration]);

    if (AppBooleanValue && v5)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userIdentity](v5, "userIdentity"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v9));

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userIdentityStore](v5, "userIdentityStore"));
      int v12 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s userIdentity](v5, "userIdentity"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10005B114;
      v14[3] = &unk_1001A6AD0;
      id v15 = v10;
      id v5 = v5;
      v16 = v5;
      id v13 = v10;
      [v11 getPropertiesForUserIdentity:v12 completionHandler:v14];
    }
  }

  else if (v6)
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v18 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Cellular restriction - Not ready]",  buf,  0xCu);
  }
}

- (void)notificationsManagerDidReceiveCloudAuthenticationDidChangeDarwinNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v8 = 134217984;
      uint64_t v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Cloud authentication]",  (uint8_t *)&v8,  0xCu);
    }

    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
    unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s activeConfiguration](v5, "activeConfiguration"));
    -[ICDServer _updateAirPlaySettingsForConfiguration:](self, "_updateAirPlaySettingsForConfiguration:", v7);
  }

  else if (v6)
  {
    int v8 = 134217984;
    uint64_t v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Cloud authentication - Not ready]",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)notificationsManager:(id)a3 didReceiveActiveUserIdentityDidChangeNotification:(id)a4
{
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Active user identity changed]",  (uint8_t *)&v7,  0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification( DarwinNotifyCenter,  ICCloudClientActiveUserIdentityDidChangeNotification,  0LL,  0LL,  1u);
  -[ICDServer _updateEnhancedAudioAvailabilityIfNeeded](self, "_updateEnhancedAudioAvailabilityIfNeeded");
  -[ICDServer _updateAccountServerCachedData](self, "_updateAccountServerCachedData");
}

- (void)notificationsManager:(id)a3 didReceiveUserIdentityStoreDidChangeNotification:(id)a4
{
  id v5 = a4;
  BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    int v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [User identity store changed]",  (uint8_t *)&v7,  0xCu);
  }

  -[ICDServer _handleUserIdentityStoreDidChangeNotification:]( self,  "_handleUserIdentityStoreDidChangeNotification:",  v5);
}

- (void)notificationsManager:(id)a3 didReceiveHandlerCoordinatorFinishedInitializationNotification:(id)a4
{
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL switchLibraryManagementPolicy = self->_switchLibraryManagementPolicy;
    BOOL startupSequenceCompleted = self->_startupSequenceCompleted;
    *(_DWORD *)buf = 134218496;
    id v15 = self;
    __int16 v16 = 1024;
    BOOL v17 = switchLibraryManagementPolicy;
    __int16 v18 = 1024;
    BOOL v19 = startupSequenceCompleted;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Handler Coordinator Did Initialize], should switch library management poli cy = %{BOOL}u, BOOL startupSequenceCompleted = %{BOOL}u",  buf,  0x18u);
  }

  if (-[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted"))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    unsigned int v9 = [v8 isAppleTV];

    if (!v9) {
      return;
    }
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer internalOperationQueue](self, "internalOperationQueue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10005B03C;
    v12[3] = &unk_1001A6B90;
    v12[4] = self;
    -[dispatch_queue_s addOperationWithBlock:](v10, "addOperationWithBlock:", v12);
  }

  else
  {
    serverStartupGroup = self->_serverStartupGroup;
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005AF9C;
    block[3] = &unk_1001A6B90;
    block[4] = self;
    dispatch_group_notify((dispatch_group_t)serverStartupGroup, v10, block);
  }
}

- (void)notificationsManager:(id)a3 didReceiveAllowsExplicitContentDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3, a4);
  BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      id v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Allows explicit content]",  buf,  0xCu);
    }

    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([(id)v8 supportedConfigurations]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10005AED4;
    v13[3] = &unk_1001A32B0;
    v13[4] = self;
    [v9 enumerateObjectsUsingBlock:v13];

    -[ICDServer _updateHTTPCookieStoreForContentRestrictions](self, "_updateHTTPCookieStoreForContentRestrictions");
    id v10 = [sub_1000568B0() sharedRestrictionsMonitor];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    LOBYTE(v8) = [v11 allowsExplicitContent];

    if ((v8 & 1) == 0)
    {
      int v12 = objc_alloc_init(&OBJC_CLASS___CSSearchableIndex);
      -[CSSearchableIndex deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:]( v12,  "deleteInteractionsWithGroupIdentifiers:bundleID:protectionClass:completionHandler:",  &off_1001B4AE8,  @"com.apple.Music",  0LL,  &stru_1001A32D0);
    }
  }

  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 134217984;
      id v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Allows explicit content - Not ready]",  buf,  0xCu);
    }
  }

- (void)notificationsManager:(id)a3 didReceiveAllowsMusicVideosDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3, a4);
  BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      int v8 = 134217984;
      unsigned int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Allows music videos]",  (uint8_t *)&v8,  0xCu);
    }

    -[ICDServer _updateHTTPCookieStoreForContentRestrictions](self, "_updateHTTPCookieStoreForContentRestrictions");
  }

  else
  {
    if (v7)
    {
      int v8 = 134217984;
      unsigned int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Allows music videos - Not ready]",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)notificationsManager:(id)a3 didReceiveSubscriptionStatusDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3, a4);
  BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      int v9 = 134217984;
      id v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Subscription status]",  (uint8_t *)&v9,  0xCu);
    }

    ICSiriPostDynamiteClientStateChangedNotification();
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 activeConfiguration]);

    -[ICDServer _updateAirPlaySettingsForConfiguration:](self, "_updateAirPlaySettingsForConfiguration:", v6);
    -[ICDServer _updateAllowsExplicitContentSettingForConfiguration:automatically:]( self,  "_updateAllowsExplicitContentSettingForConfiguration:automatically:",  v6,  1LL);
    -[ICDServer _ensureMusicSubscriptionKeysAreAvailableForConfiguration:]( self,  "_ensureMusicSubscriptionKeysAreAvailableForConfiguration:",  v6);
    -[ICDServer _updateHTTPCookieStoreForContentRestrictions](self, "_updateHTTPCookieStoreForContentRestrictions");
    -[ICDServer _updateEnhancedAudioAvailabilityIfNeeded](self, "_updateEnhancedAudioAvailabilityIfNeeded");
    -[ICDServer _updateMediaRemoteCommands:](self, "_updateMediaRemoteCommands:", 1LL);
  }

  else if (v7)
  {
    int v9 = 134217984;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Subscription status - Not ready]",  (uint8_t *)&v9,  0xCu);
  }
}

- (void)notificationsManager:(id)a3 didReceiveAuthServiceTokenDidChangeNotification:(id)a4
{
  unsigned __int8 v5 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3, a4);
  BOOL v6 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Auth service token]",  (uint8_t *)&v8,  0xCu);
    }

    ICSiriPostDynamiteClientStateChangedNotification();
  }

  else
  {
    if (v7)
    {
      int v8 = 134217984;
      int v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Auth service token - Not ready]",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)notificationsManager:(id)a3 didReceiveFamilyDeletionEventNotification:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted");
  BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      int v10 = 134217984;
      uint64_t v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Family deletion event]",  (uint8_t *)&v10,  0xCu);
    }

    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue( -[os_log_s objectForKeyedSubscript:]( v7,  "objectForKeyedSubscript:",  @"ICDServerNotificationsManagerFamilyEventKey"));
    -[ICDServer _handleFamilyContentDeletionEvent:](self, "_handleFamilyContentDeletionEvent:", v9);
  }

  else if (v8)
  {
    int v10 = 134217984;
    uint64_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Family deletion event - Not ready]",  (uint8_t *)&v10,  0xCu);
  }
}

- (void)notificationsManager:(id)a3 didReceiveApplicationInstallationNotification:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted");
  BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if ((v6 & 1) != 0)
  {
    if (v8)
    {
      int v9 = 134217984;
      int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Application install/removal]",  (uint8_t *)&v9,  0xCu);
    }

    -[ICDServer _handleApplicationRegistrationNotification:](self, "_handleApplicationRegistrationNotification:", v5);
  }

  else
  {
    if (v8)
    {
      int v9 = 134217984;
      int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Application install/removal - Not ready]",  (uint8_t *)&v9,  0xCu);
    }
  }
}

- (void)notificationsManagerDidReceiveFirstUnlockNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [First unlock]",  (uint8_t *)&v7,  0xCu);
    }

    -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
  }

  else
  {
    if (v6)
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [First unlock - Not ready]",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)notificationsManagerDidReceivePhoneNumberChangedNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v9 = 134217984;
      int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Phone number changed]",  (uint8_t *)&v9,  0xCu);
    }

    id v7 =  +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusCache sharedCache]( &OBJC_CLASS___ICMusicSubscriptionStatusCache,  "sharedCache"));
    [v8 updateBaseCacheKey];

    -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
  }

  else
  {
    if (v6)
    {
      int v9 = 134217984;
      int v10 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Phone number changed - Not ready]",  (uint8_t *)&v9,  0xCu);
    }
  }

- (void)notificationsManagerDidReceiveMusicSettingsChangedNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Music settings changed]",  (uint8_t *)&v7,  0xCu);
    }

    -[ICDServer _updateHTTPCookieStoreForContentRestrictions](self, "_updateHTTPCookieStoreForContentRestrictions");
  }

  else
  {
    if (v6)
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Music settings changed - Not ready]",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)notificationsManagerDidRecieveICPlayActivityFlushInternalTestRequestNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Flush Play Activity events request]",  (uint8_t *)&v7,  0xCu);
    }

    -[ICDServer _handleFlushPlayActivityEvents](self, "_handleFlushPlayActivityEvents");
  }

  else
  {
    if (v6)
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Flush Play Activity events request - Not ready]",  (uint8_t *)&v7,  0xCu);
    }
  }

- (void)notificationsManagerDidReceiveFamilyCircleChangedNotification:(id)a3
{
  if (-[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence", a3))
  {
    -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
    unsigned __int8 v4 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Family Circle Changed]",  (uint8_t *)&v7,  0xCu);
    }

    os_log_t v5 = (os_log_t)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    -[os_log_s invalidateCachedSubscriptionStatusWithCompletionHandler:]( v5,  "invalidateCachedSubscriptionStatusWithCompletionHandler:",  &stru_1001A32F0);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICUserIdentity activeAccount](&OBJC_CLASS___ICUserIdentity, "activeAccount"));
    -[os_log_s getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:]( v5,  "getSubscriptionStatusForUserIdentity:bypassingCache:withCompletionHandler:",  v6,  1LL,  &stru_1001A3310);
  }

  else
  {
    os_log_t v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      BOOL v8 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Family Circle Changed - Not ready]",  (uint8_t *)&v7,  0xCu);
    }
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  uint64_t v11 = (NSUserDefaults *)a4;
  id v12 = a5;
  if (self->_mediaPlaybackDefaults == v11
    && [v10 isEqualToString:@"MPCPlaybackPrivateListeningEnabled"])
  {
    id v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Private listening changed, notifying assistant.",  buf,  2u);
    }

    ICSiriPostDynamiteClientStateChangedNotification();
  }

  else
  {
    v14.receiver = self;
    v14.super_class = (Class)&OBJC_CLASS___ICDServer;
    -[ICDServer observeValueForKeyPath:ofObject:change:context:]( &v14,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)_setupInternalQueues
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  unsigned __int8 v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
  BOOL v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
  int v7 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.ICDServer.serial.queue", v6);
  serialQueue = self->_serialQueue;
  self->_serialQueue = v7;

  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
  id v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.itunescloudd.ICDServer.startup.queue", v10);
  startupQueue = self->_startupQueue;
  self->_startupQueue = v11;

  id v13 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
  internalOperationQueue = self->_internalOperationQueue;
  self->_internalOperationQueue = v13;

  -[NSOperationQueue setName:]( self->_internalOperationQueue,  "setName:",  @"com.apple.itunescloudd.ICDServer.internal.operation.queue");
  -[NSOperationQueue setMaxConcurrentOperationCount:]( self->_internalOperationQueue,  "setMaxConcurrentOperationCount:",  1LL);
}

- (void)_setupSigtermHandler
{
  dispatch_queue_attr_t v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up sigterm handler", (uint8_t *)buf, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  dispatch_queue_attr_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  BOOL v6 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  v5);
  sigtermSource = self->_sigtermSource;
  self->_sigtermSource = v6;

  objc_initWeak(buf, self);
  BOOL v8 = self->_sigtermSource;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10005AE40;
  handler[3] = &unk_1001A5CB8;
  objc_copyWeak(&v10, buf);
  dispatch_source_set_event_handler((dispatch_source_t)v8, handler);
  dispatch_activate((dispatch_object_t)self->_sigtermSource);
  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);
}

- (void)_initializeAncillaryServices
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005AB68;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_startAncillaryServices
{
  dispatch_queue_attr_t v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices begin",  buf,  0xCu);
  }

  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005AAE0;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(v4, block);

  dispatch_queue_attr_t v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 2",  buf,  0xCu);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[MediaLibraryAccessRevocationController sharedController]( &OBJC_CLASS___MediaLibraryAccessRevocationController,  "sharedController"));
  [v6 startObservingRevocations];

  int v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 3",  buf,  0xCu);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[AppleMusicAPITokenIDSService sharedService]( &OBJC_CLASS___AppleMusicAPITokenIDSService,  "sharedService"));
  [v8 start];

  dispatch_queue_attr_t v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 4",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer backgroundTaskManager](self, "backgroundTaskManager"));
  [v10 startPeriodicPolling];

  uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 5",  buf,  0xCu);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CloudRemoteRequestOperationExecutionServiceListener sharedRemoteRequestOperationExecutionServiceListener]( &OBJC_CLASS___CloudRemoteRequestOperationExecutionServiceListener,  "sharedRemoteRequestOperationExecutionServiceListener"));
  [v12 start];

  id v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 6",  buf,  0xCu);
  }

  -[ICDServer _performPeriodicSubscriptionTasks](self, "_performPeriodicSubscriptionTasks");
  objc_super v14 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 7",  buf,  0xCu);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ICLibraryAuthServiceClientTokenProvider sharedProvider]( &OBJC_CLASS___ICLibraryAuthServiceClientTokenProvider,  "sharedProvider"));
  [v15 startService];

  __int16 v16 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 8",  buf,  0xCu);
  }

  BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v18 = [v17 isWatch];

  if (v18)
  {
    os_log_t v19 = (os_log_t)objc_claimAutoreleasedReturnValue( +[ICDeviceSetupStatusMonitor sharedMonitor]( &OBJC_CLASS___ICDeviceSetupStatusMonitor,  "sharedMonitor"));
    -[os_log_s performBlockAfterDeviceSetup:](v19, "performBlockAfterDeviceSetup:", &stru_1001A3330);
  }

  else
  {
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICPlayActivityServer sharedInstance](&OBJC_CLASS___ICPlayActivityServer, "sharedInstance"));
    [v20 start];

    uint64_t v21 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      __int128 v34 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 9",  buf,  0xCu);
    }

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener]( &OBJC_CLASS___CloudContentTasteUpdateRequestListener,  "sharedContentTasteRequestListener"));
    [v22 start];

    os_log_t v19 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      __int128 v34 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 10",  buf,  0xCu);
    }
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[ICInAppMessageManager sharedManager](&OBJC_CLASS___ICInAppMessageManager, "sharedManager"));
  [v23 startSystemService];

  int v24 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 11",  buf,  0xCu);
  }

  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  if (([v25 isIPhone] & 1) != 0 || objc_msgSend(v25, "isIPod"))
  {
    unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicLibraryRecommendationController sharedLibraryRecommendationController]( &OBJC_CLASS___ICMusicLibraryRecommendationController,  "sharedLibraryRecommendationController"));
    [v26 startSystemService];
  }

  os_log_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer mediaUserStateCenterServer](self, "mediaUserStateCenterServer"));
  [v27 start];

  unsigned int v28 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 12",  buf,  0xCu);
  }

  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer playbackPositionService](self, "playbackPositionService"));
  [v29 start];

  unsigned int v30 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices... 13",  buf,  0xCu);
  }

  -[ICDServer _updateMediaRemoteCommands:](self, "_updateMediaRemoteCommands:", 0LL);
  -[ICDServer _precacheHomeProperties](self, "_precacheHomeProperties");
  __int16 v31 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    __int128 v34 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _startAncillaryServices finished",  buf,  0xCu);
  }
}

- (void)_stopAncillaryServices
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MediaLibraryAccessRevocationController sharedController]( &OBJC_CLASS___MediaLibraryAccessRevocationController,  "sharedController"));
  [v3 stopObservingRevocations];

  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[AppleMusicAPITokenIDSService sharedService]( &OBJC_CLASS___AppleMusicAPITokenIDSService,  "sharedService"));
  [v4 stop];

  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[CloudRemoteRequestOperationExecutionServiceListener sharedRemoteRequestOperationExecutionServiceListener]( &OBJC_CLASS___CloudRemoteRequestOperationExecutionServiceListener,  "sharedRemoteRequestOperationExecutionServiceListener"));
  [v5 stop];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICLibraryAuthServiceClientTokenProvider sharedProvider]( &OBJC_CLASS___ICLibraryAuthServiceClientTokenProvider,  "sharedProvider"));
  [v6 stopService];

  int v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICPlayActivityServer sharedInstance](&OBJC_CLASS___ICPlayActivityServer, "sharedInstance"));
  [v7 stop];

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener]( &OBJC_CLASS___CloudContentTasteUpdateRequestListener,  "sharedContentTasteRequestListener"));
  [v8 stop];

  dispatch_queue_attr_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICInAppMessageManager sharedManager](&OBJC_CLASS___ICInAppMessageManager, "sharedManager"));
  [v9 stopSystemService];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ICDServer mediaUserStateCenterServer](self, "mediaUserStateCenterServer"));
  [v10 stop];
}

- (void)_setupKVO
{
}

- (void)_tearDownKVO
{
}

- (ICDCloudBadgeService)cloudBadgingService
{
  cloudBadgingService = self->_cloudBadgingService;
  if (!cloudBadgingService)
  {
    unsigned __int8 v4 = objc_alloc_init(&OBJC_CLASS___ICDCloudBadgeService);
    dispatch_queue_attr_t v5 = self->_cloudBadgingService;
    self->_cloudBadgingService = v4;

    cloudBadgingService = self->_cloudBadgingService;
  }

  return cloudBadgingService;
}

- (ICDCloudServiceStatusMonitor)cloudServiceStatusMonitor
{
  cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  if (!cloudServiceStatusMonitor)
  {
    unsigned __int8 v4 = objc_alloc_init(&OBJC_CLASS___ICDCloudServiceStatusMonitor);
    dispatch_queue_attr_t v5 = self->_cloudServiceStatusMonitor;
    self->_cloudServiceStatusMonitor = v4;

    cloudServiceStatusMonitor = self->_cloudServiceStatusMonitor;
  }

  return cloudServiceStatusMonitor;
}

- (BOOL)isStartupSequenceCompleted
{
  id v2 = self;
  uint64_t v6 = 0LL;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10005AACC;
  v5[3] = &unk_1001A65D8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setStartupSequenceCompleted:(BOOL)a3
{
  dispatch_queue_attr_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer serialQueue](self, "serialQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005AABC;
  v6[3] = &unk_1001A5D58;
  v6[4] = self;
  BOOL v7 = a3;
  dispatch_sync(v5, v6);
}

- (BOOL)_canCompleteStartupSequence
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceSetupStatusMonitor sharedMonitor](&OBJC_CLASS___ICDeviceSetupStatusMonitor, "sharedMonitor"));
  unsigned int v4 = [v3 isDeviceSetupComplete];

  dispatch_queue_attr_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICSecurityInfo sharedSecurityInfo](&OBJC_CLASS___ICSecurityInfo, "sharedSecurityInfo"));
  unsigned int v6 = [v5 isDeviceClassCUnlocked];

  BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134218752;
    id v10 = self;
    __int16 v11 = 1024;
    int v12 = v6 & v4;
    __int16 v13 = 1026;
    unsigned int v14 = v6;
    __int16 v15 = 1026;
    unsigned int v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - Can complete startup sequence [%{BOOL}u] - deviceUnlocked=%{public}u - deviceSetupComplete=%{public}u",  (uint8_t *)&v9,  0x1Eu);
  }

  return v6 & v4;
}

- (void)_completeStartupSequenceIfNeeded
{
  if (-[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence"))
  {
    dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ICDServer startupQueue](self, "startupQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005A34C;
    block[3] = &unk_1001A6B90;
    block[4] = self;
    dispatch_sync(v3, block);
  }

  else
  {
    dispatch_queue_attr_t v3 = (dispatch_queue_s *)os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      unsigned int v6 = self;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v3,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _completeStartupSequenceIfNeeded - Nothing to do [blocked]",  buf,  0xCu);
    }
  }
}

- (void)_migrateToLatestUserVersionForConfigurations:(id)a3
{
  id v3 = a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned __int8 v5 = [v4 isMac];

  if ((v5 & 1) == 0)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v15 = v3;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          __int16 v11 = *(void **)(*((void *)&v17 + 1) + 8LL * (void)i);
          int v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v11 userIdentity]);
            unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountDSID]);
            *(_DWORD *)buf = 134218242;
            uint64_t v22 = self;
            __int16 v23 = 2112;
            int v24 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _migrateToLatestUserVersion - Migrating library [dsid=%@]",  buf,  0x16u);
          }

          sub_100025DAC(v11);
        }

        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }

      while (v8);
    }

    id v3 = v15;
  }
}

- (void)_setupMPMediaLibraryFilteringForConfigurations:(id)a3
{
  id v3 = a3;
  uint64_t v23 = 0LL;
  int v24 = &v23;
  uint64_t v25 = 0x2050000000LL;
  unsigned int v4 = (void *)qword_1001DB6B0;
  uint64_t v26 = qword_1001DB6B0;
  if (!qword_1001DB6B0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 3221225472LL;
    *(void *)&uint8_t buf[16] = sub_10005A110;
    __int16 v29 = &unk_1001A6978;
    unsigned int v30 = &v23;
    sub_10005A110((uint64_t)buf);
    unsigned int v4 = (void *)v24[3];
  }

  id v5 = v4;
  _Block_object_dispose(&v23, 8);
  if ((MSVDeviceSupportsMultipleLibraries([v5 setFilteringDisabled:1]) & 1) == 0)
  {
    id v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _setupMPMediaLibraryFilteringForConfigurations - setting filtering type for default media library]",  buf,  0xCu);
    }

    id v7 = [sub_10005A1D4() defaultMediaLibrary];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v8 setCloudFilteringType:1];
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v9 = v3;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _setupMPMediaLibraryFilteringForConfigurations - setting filtering type for configuration=%{public}@]",  buf,  0x16u);
        }

        id v15 = sub_10005A1D4();
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 userIdentity]);
        __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 deviceMediaLibraryWithUserIdentity:v16]);
        [v17 setCloudFilteringType:1];
      }

      id v10 = [v9 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }

    while (v10);
  }
}

- (void)_updateAllowsExplicitContentSettingForConfiguration:(id)a3 automatically:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = [sub_1000568B0() sharedRestrictionsMonitor];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = [v8 allowsExplicitContent];

    uint64_t v43 = 0LL;
    v44 = &v43;
    uint64_t v45 = 0x2050000000LL;
    id v10 = (void *)qword_1001DB6C0;
    uint64_t v46 = qword_1001DB6C0;
    if (!qword_1001DB6C0)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = sub_100059B74;
      v48 = &unk_1001A6978;
      v49 = &v43;
      sub_100059B74((uint64_t)buf);
      id v10 = (void *)v44[3];
    }

    id v11 = v10;
    _Block_object_dispose(&v43, 8);
    if ([v11 isCurrentDeviceValidHomeAccessory])
    {
      uint64_t v43 = 0LL;
      v44 = &v43;
      uint64_t v45 = 0x2050000000LL;
      int v12 = (void *)qword_1001DB6C8;
      uint64_t v46 = qword_1001DB6C8;
      if (!qword_1001DB6C8)
      {
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472LL;
        *(void *)&uint8_t buf[16] = sub_100059C38;
        v48 = &unk_1001A6978;
        v49 = &v43;
        sub_100059C38((uint64_t)buf);
        int v12 = (void *)v44[3];
      }

      id v13 = v12;
      _Block_object_dispose(&v43, 8);
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentityStore]);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 userMonitorWithUserIdentity:v14 fromUserIdentityStore:v15]);

      __int128 v17 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      __int128 v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
          __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accountDSID]);
          *(_DWORD *)buf = 134218755;
          *(void *)&uint8_t buf[4] = self;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v16;
          *(_WORD *)&buf[22] = 2113;
          v48 = v20;
          LOWORD(v49) = 1024;
          *(_DWORD *)((char *)&v49 + 2) = (_DWORD)v9;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "ICDServer %p - _updateAllowsExplicitContentSettingAutomatically: userMonitor=%p for dsid=%{private}@ allowExplicit=%{BOOL}u",  buf,  0x26u);
        }

        id v9 = [v16 isExplicitSettingEnabled];
      }

      else
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = self;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "ICDServer %p - _updateAllowsExplicitContentSettingAutomatically - userMonitor=nil",  buf,  0xCu);
        }
      }
    }

    __int128 v22 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    int v24 = -[ICStoreRequestContext initWithIdentity:](v22, "initWithIdentity:", v23);

    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v25));

    os_log_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 valueForDatabaseProperty:@"MPExplicitContentAllowedBoolean"]);
    os_log_t v21 = v27;
    if (!v27 || (_DWORD)v9 != -[os_log_s BOOLValue](v27, "BOOLValue"))
    {
      unsigned int v28 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v26 accountDSID]);
        unsigned int v30 = -[os_log_s BOOLValue](v21, "BOOLValue");
        *(_DWORD *)buf = 138478339;
        *(void *)&uint8_t buf[4] = v29;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v30;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (_DWORD)v9;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "updating explicit content. dsid=%{private}@, lastWrittenValue=%{BOOL}u, setting allowsExplicitContent=%{BOOL}u",  buf,  0x18u);
      }

      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v9));
      [v26 setValue:v31 forDatabaseProperty:@"MPExplicitContentAllowedBoolean"];
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100059CFC;
    v36[3] = &unk_1001A3380;
    char v41 = (char)v9;
    id v37 = v26;
    __int16 v38 = v24;
    BOOL v42 = a4;
    __int16 v39 = self;
    id v40 = v6;
    __int128 v34 = v24;
    id v35 = v26;
    [v32 getSubscriptionStatusForUserIdentity:v33 withCompletionHandler:v36];
  }

  else
  {
    os_log_t v21 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _updateServerAllowsExplicitContentSettingAutomatically - No action [No active configuration]",  buf,  0xCu);
    }
  }
}

- (void)_ensureSubscriptionInformationIsUpToDateForConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    [v5 getSubscriptionStatusForUserIdentity:v6 bypassingCache:0 withCompletionHandler:&stru_1001A33A0];

    -[ICDServer _ensureMusicSubscriptionKeysAreAvailableForConfiguration:]( self,  "_ensureMusicSubscriptionKeysAreAvailableForConfiguration:",  v4);
  }

  else
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      id v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _ensureSubscriptionInformationIsUpToDateForConfiguration - No action [No active configuration]",  (uint8_t *)&v8,  0xCu);
    }
  }
}

- (void)_ensureMusicSubscriptionKeysAreAvailableForConfiguration:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int128 v18 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _ensureMusicSubscriptionKeysAreAvailableForConfiguration - No action [No active configuration]",  buf,  0xCu);
    }

    goto LABEL_9;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned __int8 v6 = [v5 isMac];

  if ((v6 & 1) == 0)
  {
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    if ((-[os_log_s isAppleTV](v7, "isAppleTV") & 1) == 0
      && (-[os_log_s isAudioAccessory](v7, "isAudioAccessory") & 1) == 0
      && (byte_1001DB698 & 1) == 0)
    {
      byte_1001DB698 = 1;
      id v8 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472LL;
      id v13 = sub_100059264;
      unsigned int v14 = &unk_1001A3440;
      id v15 = v4;
      unsigned int v16 = self;
      id v9 = [v8 initWithStartHandler:&v11];
      objc_msgSend(v9, "setName:", @"com.apple.itunescloudd.CloudServer.keyRefreshOperation", v11, v12, v13, v14);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer serverOperationsManager](self, "serverOperationsManager"));
      [v10 addOperation:v9 priority:1];
    }

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  unsigned __int8 v4 = -[ICDServer _canCompleteStartupSequence](self, "_canCompleteStartupSequence", a3);
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) == 0)
  {
    if (v6)
    {
      *(_DWORD *)buf = 134217984;
      id v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Ignoring notification [Account change - Not ready]",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  if (v6)
  {
    *(_DWORD *)buf = 134217984;
    id v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Processing notification [Account change]",  buf,  0xCu);
  }

  if (-[ICDServer isStartupSequenceCompleted](self, "isStartupSequenceCompleted"))
  {
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ICDServer internalOperationQueue](self, "internalOperationQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100058FE8;
    v7[3] = &unk_1001A6B90;
    v7[4] = self;
    -[os_log_s addOperationWithBlock:](v5, "addOperationWithBlock:", v7);
LABEL_8:

    return;
  }

  -[ICDServer _completeStartupSequenceIfNeeded](self, "_completeStartupSequenceIfNeeded");
}

- (void)_handleApplicationRegistrationNotification:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  id v5 = v4;
  if (v4)
  {
    BOOL v6 = (ICDServer *)objc_claimAutoreleasedReturnValue( [v4 objectForKeyedSubscript:@"ICDServerNotificationsManagerApplicationRegistrationBundleIDsKey"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue( [v5 objectForKeyedSubscript:@"ICDServerNotificationsManagerIsApplicationRegistrationKey"]);
    id v8 = [v7 integerValue];

    id v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = @"uninstalled";
      if (v8 == (id)1) {
        id v10 = @"installed";
      }
      *(_DWORD *)buf = 138543618;
      unsigned int v28 = v6;
      __int16 v29 = 2114;
      unsigned int v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Handling app install changed notification - apps=%{public}@, registration=%{public}@",  buf,  0x16u);
    }

    uint64_t v11 = ICBundleIdentifierForSystemApplicationType(0LL);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    unsigned int v13 = -[ICDServer containsObject:](v6, "containsObject:", v12);

    if (v13)
    {
      if (v8 == (id)1)
      {
        unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 supportedConfigurations]);
        [v15 enumerateObjectsUsingBlock:&stru_1001A3480];

        CFArrayRef v16 = (CFArrayRef)objc_claimAutoreleasedReturnValue( +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener]( &OBJC_CLASS___CloudContentTasteUpdateRequestListener,  "sharedContentTasteRequestListener"));
        -[__CFArray handleMusicAppInstalled](v16, "handleMusicAppInstalled");
      }

      else
      {
        __int128 v17 = os_log_create("com.apple.amp.itunescloudd", "XPC");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          unsigned int v28 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [Music App Removal] Clearing music preferences",  buf,  0xCu);
        }

        CFArrayRef v16 = CFPreferencesCopyKeyList(@"com.apple.Music", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
        if (-[__CFArray count](v16, "count")) {
          CFPreferencesSetMultiple( 0LL,  v16,  @"com.apple.Music",  kCFPreferencesCurrentUser,  kCFPreferencesCurrentHost);
        }
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 supportedConfigurations]);
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100058714;
        v26[3] = &unk_1001A32B0;
        v26[4] = self;
        [v19 enumerateObjectsUsingBlock:v26];

        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener]( &OBJC_CLASS___CloudContentTasteUpdateRequestListener,  "sharedContentTasteRequestListener"));
        [v20 handleMusicAppRemoved];
      }
    }

    uint64_t v21 = ICBundleIdentifierForSystemApplicationType(1LL);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    unsigned int v23 = -[ICDServer containsObject:](v6, "containsObject:", v22);

    if (v23)
    {
      int v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 supportedConfigurations]);
      [v25 enumerateObjectsUsingBlock:&stru_1001A34C0];
    }
  }
}

- (void)_handleURLBagProviderDidUpdateBagNotification:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling updated bag notification", v10, 2u);
  }

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:ICURLBagProviderDidUpdateBagNotificationURLBagUserInfoKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v9 = [v8 isWatch];

  if (v9 && v7) {
    -[ICDServer _writeURLResolutionCacheFileUsingBag:](self, "_writeURLResolutionCacheFileUsingBag:", v7);
  }
  -[ICDServer _updateSocialFeaturesAvailabilityIfNeededUsingBag:]( self,  "_updateSocialFeaturesAvailabilityIfNeededUsingBag:",  v7);
  -[ICDServer _updateEnhancedAudioAvailabilityIfNeeded](self, "_updateEnhancedAudioAvailabilityIfNeeded");
}

- (void)_initializeSocialFeaturesAvailabilityIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 cachedSharedControlsCapability]);

  if (!v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConfiguration]);

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    if (v7)
    {
      id v8 = -[ICStoreRequestContext initWithIdentity:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithIdentity:",  v7);
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10005862C;
      v10[3] = &unk_1001A48A8;
      v10[4] = self;
      [v9 getBagForRequestContext:v8 withCompletionHandler:v10];
    }
  }

- (void)_updateSocialFeaturesAvailabilityIfNeededUsingBag:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICClientInfo defaultInfo](&OBJC_CLASS___ICClientInfo, "defaultInfo"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 bagProfile]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 profileName]);
    unsigned __int8 v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) != 0)
    {
      serialQueue = (dispatch_queue_s *)self->_serialQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100058424;
      v12[3] = &unk_1001A6C30;
      unsigned int v13 = (os_log_s *)v4;
      unsigned int v14 = self;
      dispatch_async(serialQueue, v12);
      id v10 = v13;
    }

    else
    {
      id v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 profileName]);
        *(_DWORD *)buf = 134218242;
        CFArrayRef v16 = self;
        __int16 v17 = 2114;
        __int128 v18 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p _updateSocialFeaturesAvailabilityIfNeededUsingBag: ignoring bag change for profile %{public}@",  buf,  0x16u);
      }
    }
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      CFArrayRef v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "ICDServer %p _updateSocialFeaturesAvailabilityIfNeededUsingBag: called with nil bag",  buf,  0xCu);
    }
  }
}

- (id)_urlResolutionCacheFilePath
{
  return objc_msgSend( (id)CPSharedResourcesDirectory(self, a2),  "stringByAppendingPathComponent:",  @"Library/Caches/com.apple.itunesstored/url-resolution.plist");
}

- (void)_ensureURLResolutionCacheFileExists
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v4 = [v3 isWatch];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer _urlResolutionCacheFilePath](self, "_urlResolutionCacheFilePath"));
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    id v7 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unsigned int v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Checking if url resolution file exists at path '%{public}@'",  buf,  0xCu);
    }

    if (([v6 fileExistsAtPath:v5] & 1) == 0)
    {
      unsigned __int8 v8 = os_log_create("com.apple.amp.itunescloudd", "XPC");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "url resolution file is missing - creating now",  buf,  2u);
      }

      unsigned int v9 = -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  &stru_1001A3500);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100058284;
      v11[3] = &unk_1001A48A8;
      v11[4] = self;
      [v10 getBagForRequestContext:v9 withCompletionHandler:v11];
    }
  }

- (void)_writeURLResolutionCacheFileUsingBag:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Updating resolution cache file", buf, 2u);
  }

  BOOL v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-url-resolution"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v7,  @"p2-url-resolution");

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-host-suffix-whitelist"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v8,  @"p2-launch-host-suffix-whitelist");

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-apple-store-host-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v9,  @"p2-launch-apple-store-host-patterns");

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-apple-store-path-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v10,  @"p2-launch-apple-store-path-patterns");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-appstore-host-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v11,  @"p2-launch-appstore-host-patterns");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-appstore-path-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v12,  @"p2-launch-appstore-path-patterns");

  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-ebookstore-host-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v13,  @"p2-launch-ebookstore-host-patterns");

  unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-ebookstore-path-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v14,  @"p2-launch-ebookstore-path-patterns");

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-mobilestore-host-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v15,  @"p2-launch-mobilestore-host-patterns");

  CFArrayRef v16 = (void *)objc_claimAutoreleasedReturnValue([v4 arrayForBagKey:@"p2-launch-mobilestore-path-patterns"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v16,  @"p2-launch-mobilestore-path-patterns");

  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 stringForBagKey:@"vpp-licensing-invitation-url-pattern"]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v6,  "setObject:forKeyedSubscript:",  v17,  @"vpp-licensing-invitation-url-pattern");

  id v18 = -[ICDServer _preprocessURLResolutionCacheDictionary:](self, "_preprocessURLResolutionCacheDictionary:", v6);
  id v20 = objc_msgSend( (id)CPSharedResourcesDirectory(v18, v19),  "stringByAppendingPathComponent:",  @"Library/Caches/com.apple.itunesstored/url-resolution.plist");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (!-[NSMutableDictionary count](v6, "count"))
  {
    goto LABEL_19;
  }

  unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 attributesOfItemAtPath:v21 error:0]);
  int v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:NSFileModificationDate]);

  if (v24)
  {
    [v24 timeIntervalSinceNow];
    if (v25 >= -60.0)
    {

      goto LABEL_20;
    }
  }

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 stringByDeletingLastPathComponent]);
  id v40 = 0LL;
  unsigned int v27 = [v22 createDirectoryAtPath:v26 withIntermediateDirectories:1 attributes:0 error:&v40];
  id v28 = v40;

  if (v27)
  {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSPropertyListSerialization dataWithPropertyList:format:options:error:]( &OBJC_CLASS___NSPropertyListSerialization,  "dataWithPropertyList:format:options:error:",  v6,  200LL,  0LL,  0LL));
    id v39 = v28;
    unsigned int v30 = [v29 writeToFile:v21 options:0 error:&v39];
    id v31 = v39;

    id v28 = v31;
  }

  else
  {
    unsigned int v30 = 0;
  }

  id v32 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  __int16 v33 = v32;
  if (v28)
  {
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_DWORD *)buf = 138543362;
    id v42 = v28;
    __int128 v34 = "Failed to update URL resolution cache file. err=%{public}@";
    id v35 = v33;
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    uint32_t v37 = 12;
  }

  else
  {
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    __int128 v34 = "Successfully updated URL resolution cache file";
    id v35 = v33;
    os_log_type_t v36 = OS_LOG_TYPE_DEFAULT;
    uint32_t v37 = 2;
  }

  _os_log_impl((void *)&_mh_execute_header, v35, v36, v34, buf, v37);
LABEL_18:

  if (v30)
  {
LABEL_19:
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification( DarwinNotifyCenter,  @"com.apple.itunesstored.changed-url-resolution",  0LL,  0LL,  1u);
  }

- (void)_preprocessURLResolutionCacheDictionary:(id)a3
{
  id v35 = a3;
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v35 objectForKey:@"p2-url-resolution"]);
  id v4 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v54;
    os_log_type_t v36 = @"Music";
    uint32_t v37 = @"MusicNS";
    while (2)
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v54 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v53 + 1) + 8LL * (void)i);
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v3);
        if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
        {
          unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"p2-url-section-name"]);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSString, v10);
          if ((objc_opt_isKindOfClass(v9, v11) & 1) != 0
            && (([v9 isEqualToString:@"AppleMusicSubscriber"] & 1) != 0
             || ([v9 isEqualToString:@"AppleMusicUndecided"] & 1) != 0
             || ([v9 isEqualToString:@"AppleMusicDisabled"] & 1) != 0))
          {

            uint64_t v12 = @"AppleMusicSubscriber";
            os_log_type_t v36 = @"AppleMusicUndecided";
            uint32_t v37 = @"AppleMusicDisabled";
            goto LABEL_17;
          }
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v4) {
        continue;
      }
      break;
    }

    uint64_t v12 = @"Music";
  }

  else
  {
    uint64_t v12 = @"Music";
    os_log_type_t v36 = @"Music";
    uint32_t v37 = @"MusicNS";
  }

- (void)_retryLoadingCloudLibraryForSecondaryAccountsOnAppleTV
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned __int8 v5 = [v4 isAppleTV];

  if ((v5 & 1) == 0)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"ICDServer.m" lineNumber:1687 description:@"_retryLoadingCloudLibraryForSecondaryAccountsOnAppleTV: is only valid for AppleTV."];
  }

  dispatch_time_t v6 = dispatch_time(0x8000000000000000LL, 300000000000LL);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057F88;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_after(v6, serialQueue, block);
}

- (void)_transitionAppleTVToParallelMultiUserLibraryManagementPolicy
{
  uint64_t v3 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    int v10 = 134218242;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    uint64_t v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - Transitioning device=%{public}@ to Parallel Multi User",  (uint8_t *)&v10,  0x16u);
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
  [v5 changeLibraryManagementPolicy:2];

  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
  [v6 updateState];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer handlerCoordinator](self, "handlerCoordinator"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stateChange]);
  [v7 changeLibraryManagementPolicy:2 withAccountsStateChange:v9];
}

- (void)_performPeriodicSubscriptionTasks
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  id v4 = -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  &stru_1001A3548);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100057330;
  v7[3] = &unk_1001A7180;
  id v8 = v3;
  unsigned int v9 = self;
  id v6 = v3;
  [v5 getBagForRequestContext:v4 forceRefetch:0 withCompletionHandler:v7];
}

- (void)_updateEnhancedAudioAvailabilityIfNeeded
{
  id v2 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Updating enhanced audio availability flag",  buf,  2u);
  }

  uint64_t v3 = -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  &stru_1001A35F0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100056F20;
  v6[3] = &unk_1001A48A8;
  id v7 = v3;
  unsigned __int8 v5 = v3;
  [v4 getBagForRequestContext:v5 forceRefetch:0 withCompletionHandler:v6];
}

- (void)_updateHTTPCookieStoreForContentRestrictions
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  [v2 getSubscriptionStatusWithCompletionHandler:&stru_1001A3650];
}

- (void)_handleFlushPlayActivityEvents
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ICPlayActivityServer sharedInstance](&OBJC_CLASS___ICPlayActivityServer, "sharedInstance"));
  [v2 flushPendingPlayActivityEventsWithCompletionHandler:0];
}

- (void)_updateAccountServerCachedData
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[ICMonitoredAccountStore sharedAccountStore]( &OBJC_CLASS___ICMonitoredAccountStore,  "sharedAccountStore"));
  id v15 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeStoreAccountWithError:&v15]);
  id v5 = v15;

  if (v4)
  {
    id v6 = objc_alloc(&OBJC_CLASS___AMSAccountIdentity);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_DSID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ic_altDSID"));
    unsigned int v9 = (os_log_s *)[v6 initWithDSID:v7 altDSID:v8];

    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[AMSAccountCachedServerData sharedInstance]( &OBJC_CLASS___AMSAccountCachedServerData,  "sharedInstance"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 BOOLForKey:14 accountID:v9 updateBlock:&stru_1001A3690]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100056384;
    v12[3] = &unk_1001A36B8;
    id v13 = v4;
    unsigned int v14 = self;
    [v11 resultWithTimeout:v12 completion:5.0];
  }

  else
  {
    unsigned int v9 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - _updateAccountServerCachedData failed to load active account. err=%{public}@",  buf,  0x16u);
    }
  }
}

- (void)_updateMediaRemoteCommands:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 1024;
    BOOL v19 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Resetting media remote commands if needed (force = %{BOOL}u",  buf,  0x12u);
  }

  if (v3) {
    goto LABEL_9;
  }
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[ICDAccountManaging stateChange](self->_accountManager, "stateChange"));
  if (([v6 supportedConfigurationsChanged] & 1) != 0
    || [v6 activeConfigurationChanged])
  {
    id v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Resetting media remote commands because the account state has changed",  buf,  0xCu);
    }

LABEL_9:
    id v8 = (void *)MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    int v10 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    uint64_t v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    id v13 = sub_100056254;
    unsigned int v14 = &unk_1001A6398;
    id v15 = v8;
    id v6 = v8;
    MRMediaRemoteClearDefaultSupportedCommandsForApp();
  }
}

- (void)_precacheHomeProperties
{
}

- (void)_handleFamilyContentDeletionEvent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDServer accountManager](self, "accountManager"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 activeConfiguration]);

  if (v6)
  {
    uint64_t v21 = v6;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);
    os_log_t v8 = (os_log_t)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v7));

    unsigned int v9 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v29 = (ICDServer *)[v4 count];
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received %llu account pairs for family content removal.",  buf,  0xCu);
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v22 = v4;
    id obj = v4;
    id v10 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      id v13 = "com.apple.amp.itunescloudd";
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          CFArrayRef v16 = os_log_create(v13, "Accounts");
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            id v17 = (ICDServer *)[v15 purchaserAccountID];
            __int16 v18 = v13;
            id v19 = [v15 downloaderAccountID];
            id v20 = [v15 familyID];
            *(_DWORD *)buf = 134218496;
            __int16 v29 = v17;
            __int16 v30 = 2048;
            id v31 = v19;
            id v13 = v18;
            __int16 v32 = 2048;
            id v33 = v20;
            _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Family content removal (purchaser = %lld, downloader = %lld, family = %lld",  buf,  0x20u);
          }

          -[os_log_s removeItemsWithFamilyAccountID:purchaserAccountID:downloaderAccountID:]( v8,  "removeItemsWithFamilyAccountID:purchaserAccountID:downloaderAccountID:",  [v15 familyID],  objc_msgSend(v15, "purchaserAccountID"),  objc_msgSend(v15, "downloaderAccountID"));
        }

        id v11 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
      }

      while (v11);
    }

    id v6 = v21;
    id v4 = v22;
  }

  else
  {
    os_log_t v8 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      __int16 v29 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _handleFamilyContentDeletionEvent - No action [No active configuration]",  buf,  0xCu);
    }
  }
}

- (void)_updateAirPlaySettingsForConfiguration:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
    unsigned __int8 v6 = -[NSUserDefaults BOOLForKey:](v5, "BOOLForKey:", @"isAppleMusicSubscriber");
    unsigned __int8 v7 = -[NSUserDefaults BOOLForKey:](v5, "BOOLForKey:", @"cloudLibraryIsOn");
    os_log_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentityStore]);
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    id v21 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 getPropertiesForUserIdentity:v9 error:&v21]);
    id v11 = v21;

    if (v11)
    {
      uint64_t v12 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218242;
        id v23 = self;
        __int16 v24 = 2114;
        id v25 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "ICDServer %p - Failed to load identity properties. err=%{public}@",  buf,  0x16u);
      }

      unsigned __int8 v13 = v7;
    }

    else
    {
      unsigned __int8 v13 = [v10 isActiveLocker];
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100056124;
    v16[3] = &unk_1001A36E0;
    unsigned __int8 v18 = v6;
    unsigned __int8 v19 = v13;
    unsigned __int8 v20 = v7;
    id v17 = v5;
    unsigned int v14 = v5;
    [v15 getSubscriptionStatusWithCompletionHandler:v16];
  }

  else
  {
    unsigned int v14 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "ICDServer %p - _updateAirPlaySettingsForConfiguration - No action [No active configuration]",  buf,  0xCu);
    }
  }
}

- (BOOL)ignoreAccountChanges
{
  return self->_ignoreAccountChanges;
}

- (void)setIgnoreAccountChanges:(BOOL)a3
{
  self->_ignoreAccountChanges = a3;
}

- (int64_t)preferredVideoQuality
{
  return self->_preferredVideoQuality;
}

- (void)setPreferredVideoQuality:(int64_t)a3
{
  self->_preferredVideoQuality = a3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)startupQueue
{
  return self->_startupQueue;
}

- (OS_dispatch_group)serverStartupGroup
{
  return self->_serverStartupGroup;
}

- (NSOperationQueue)internalOperationQueue
{
  return self->_internalOperationQueue;
}

- (NSMutableDictionary)xpcListeners
{
  return self->_xpcListeners;
}

- (ICDNetworkAvailabilityService)networkAvailabilityService
{
  return self->_networkAvailabilityService;
}

- (ICDPlaybackPositionService)playbackPositionService
{
  return self->_playbackPositionService;
}

- (ICDServerOperationsManager)serverOperationsManager
{
  return self->_serverOperationsManager;
}

- (ICDServerNotificationsManager)serverNotificationsManager
{
  return self->_serverNotificationsManager;
}

- (ICDAccountManaging)accountManager
{
  return self->_accountManager;
}

- (ICDHandlerCoordinating)handlerCoordinator
{
  return self->_handlerCoordinator;
}

- (ICDBackgroundTaskManaging)backgroundTaskManager
{
  return self->_backgroundTaskManager;
}

- (ICDelegateAccountStoreServiceListener)delegateAccountStoreListener
{
  return self->_delegateAccountStoreListener;
}

- (ICDelegationProviderService)delegationProviderService
{
  return self->_delegationProviderService;
}

- (CloudPushNotificationController)pushNotificationController
{
  return self->_pushNotificationController;
}

- (NSUserDefaults)mediaPlaybackDefaults
{
  return self->_mediaPlaybackDefaults;
}

- (CloudUserNotificationController)userNotificationController
{
  return self->_userNotificationController;
}

- (ICMediaUserStateCenterServerProtocol)mediaUserStateCenterServer
{
  return self->_mediaUserStateCenterServer;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (unsigned)outputClusterType
{
  return self->_outputClusterType;
}

- (BOOL)switchLibraryManagementPolicy
{
  return self->_switchLibraryManagementPolicy;
}

- (void)setSwitchLibraryManagementPolicy:(BOOL)a3
{
  self->_BOOL switchLibraryManagementPolicy = a3;
}

- (ICDEnhancedAudioKeyManager)enhancedAudioKeyManager
{
  return self->_enhancedAudioKeyManager;
}

- (OS_dispatch_source)sigtermSource
{
  return self->_sigtermSource;
}

- (void).cxx_destruct
{
}

+ (ICDServer)server
{
  if (qword_1001DB690 != -1) {
    dispatch_once(&qword_1001DB690, &stru_1001A3140);
  }
  return (ICDServer *)(id)qword_1001DB688;
}

@end