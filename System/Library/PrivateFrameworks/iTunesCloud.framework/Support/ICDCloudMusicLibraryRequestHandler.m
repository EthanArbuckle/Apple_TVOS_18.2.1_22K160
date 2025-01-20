@interface ICDCloudMusicLibraryRequestHandler
+ (id)handler;
+ (id)handlers;
- (BOOL)_isNativeMusicAppInstalled;
- (BOOL)_wasRestoredFromCloudBackup:(id)a3;
- (BOOL)isUpdatingCloudLibrary;
- (BOOL)shouldIncludeMediaKindSongForJaliscoImport;
- (ICDCloudMusicLibraryRequestHandler)initWithConfiguration:(id)a3;
- (id)_cloudSourcesToRemoveForReason:(int64_t)a3;
- (id)_prepareLibraryLoadErrorWithJaliscoError:(id)a3 sagaError:(id)a4;
- (int64_t)_canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:(id)a3 includeLocalContentCheck:(BOOL)a4;
- (int64_t)_getCurrentSubscriptionStatusForReason:(int64_t)a3;
- (int64_t)_shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:(id)a3;
- (void)_adjustMergePreferenceWithUserIdentityProperties:(id)a3;
- (void)_authenticateAndStartInitialImportWithMergePreference:(id)a3 userIdentityProperties:(id)a4 enableReason:(int64_t)a5 withCompletionHandler:(id)a6;
- (void)_enqueueCloudUpdateLibraryOperationForReason:(int64_t)a3;
- (void)_enqueueSubscriptionStatusCheckForReason:(int64_t)a3;
- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3;
- (void)_handleSagaAuthentication:(id)a3 finishedForReason:(int64_t)a4 explicitUserAction:(BOOL)a5 shouldStartInitialImport:(BOOL)a6 completionHandler:(id)a7;
- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3;
- (void)_performInitialJaliscoImportWithClientIdentity:(id)a3 completion:(id)a4;
- (void)_performInitialSagaImportWithClientIdentity:(id)a3 allowingNoisyAuthPrompt:(BOOL)a4 completionHandler:(id)a5;
- (void)_performJaliscoImportWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5;
- (void)_postLibraryUpdateProgressChangedForLibraryType:(int64_t)a3;
- (void)_registerDeviceAndPerformInitialImportWithUserIdentityProperties:(id)a3 cloudLibraryEnableReason:(int64_t)a4 completionHandler:(id)a5;
- (void)_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_removeCloudSourcesForReason:(int64_t)a3 withClientIdentity:(id)a4 byDisablingActiveLockerAccount:(BOOL)a5 completionHandler:(id)a6;
- (void)_resetInternalCloudLibraryState;
- (void)_retryEnablingCloudMusicLibraryForReason:(int64_t)a3;
- (void)_runSagaAuthenticateOperationWithClientIdentity:(id)a3 mergePreference:(id)a4 allowNoisyPrompt:(BOOL)a5 cloudLibraryEnableReason:(int64_t)a6 completionHandler:(id)a7;
- (void)_runSubscriptionStatusCheckOperationWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_tryEnablingCloudMusicLibraryForReason:(int64_t)a3 completionHandler:(id)a4;
- (void)_tryEnablingICMLOnDevicesSupportingSideLoadedContentWithProperties:(id)a3 reason:(int64_t)a4 withCompletionHandler:(id)a5;
- (void)addBackgroundOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)becomeActive;
- (void)becomeInactiveWithDeauthentication:(BOOL)a3 completion:(id)a4;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5;
- (void)cancelPendingChangesForLibraryType:(int64_t)a3;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3;
- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3;
- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3;
- (void)disableCloudLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6;
- (void)enableCloudLibraryWithClientIdentity:(id)a3 startInitialImport:(BOOL)a4 enableCloudLibraryPolicy:(int64_t)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7;
- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)environmentMonitorDidChangeNetworkReachability:(id)a3;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)finishedUpdateOperationForLibraryType:(int64_t)a3 withResponse:(id)a4;
- (void)handleMusicAppInstalled;
- (void)handleMusicAppRemovedWithCompletion:(id)a3;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importContainerArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 clientIdentity:(id)a4 completion:(id)a5;
- (void)isUpdatingCloudLibraryWithCompletion:(id)a3;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadLastKnownEnableICMLStatusWithCompletionHandler:(id)a3;
- (void)loadMissingArtworkWithClientIdentity:(id)a3;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4;
- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)scheduleBackgroundTaskToUpdateLibraryType:(int64_t)a3;
- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8;
- (void)setUpdateProgress:(float)a3 forLibraryType:(int64_t)a4;
- (void)startingUpdateOperationForLibraryType:(int64_t)a3 isInitialImport:(BOOL)a4;
- (void)updateCloudLibraryProgressWithCompletion:(id)a3;
- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 completionHandler:(id)a5;
- (void)updateLibraryWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateProgressForLibraryType:(int64_t)a3 completionHandler:(id)a4;
- (void)updateSagaLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
@end

@implementation ICDCloudMusicLibraryRequestHandler

- (ICDCloudMusicLibraryRequestHandler)initWithConfiguration:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___ICDCloudMusicLibraryRequestHandler;
  v3 = -[BaseRequestHandler initWithConfiguration:](&v23, "initWithConfiguration:", a3);
  if (v3)
  {
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.accessQueue", v5);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_qos_class(&_dispatch_queue_attr_concurrent, QOS_CLASS_UTILITY, 0);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.calloutQueue", v9);
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v10;

    v3->_havePendingAutoEnableICMLCheck = 0;
    v3->_havePendingSubscriptionStatusCheck = 0;
    v3->_havePendingCloudUpdateLibraryCheck = 0;
    v3->_havePendingSagaUpdate = 0;
    v3->_didManuallyReloadCloudLibrary = 0;
    v3->_isPendingAuthentication = 0;
    v3->_didAdjustMergePreference = MSVDeviceSupportsSideLoadedMediaContent() ^ 1;
    v3->_didHandleStartupNotificationReason = MSVDeviceSupportsSideLoadedMediaContent() ^ 1;
    v3->_finishedSetup = 0;
    v3->_musicSubscriptionCheckStatus = 0LL;
    v12 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v3->_operationQueue;
    v3->_operationQueue = v12;

    -[NSOperationQueue setName:]( v3->_operationQueue,  "setName:",  @"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.operationQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setQualityOfService:](v3->_operationQueue, "setQualityOfService:", 17LL);
    -[NSOperationQueue setUnderlyingQueue:](v3->_operationQueue, "setUnderlyingQueue:", v3->_accessQueue);
    v14 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    retryQueue = v3->_retryQueue;
    v3->_retryQueue = v14;

    -[NSOperationQueue setName:]( v3->_retryQueue,  "setName:",  @"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.retryQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v3->_retryQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setQualityOfService:](v3->_retryQueue, "setQualityOfService:", 17LL);
    v3->_autoEnableFailureCount = 0;
    v3->_subscriptionStatusFailureCount = 0;
    v3->_autoRetryCloudAuthenticateFailureCount = 0;
    v3->_sagaImportFailureCount = 0;
    v3->_deauthOperationCount = 0;
    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    syncProgressDictionary = v3->_syncProgressDictionary;
    v3->_syncProgressDictionary = (NSMutableDictionary *)v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    [v18 registerObserver:v3];

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    unsigned int v20 = [v19 isWatch];

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v21 addObserver:v3 selector:"_handleUserIdentityStoreDidChangeNotification:" name:ICUserIdentityStoreDidChangeNotification object:0];
    }
  }

  return v3;
}

- (void)handleMusicAppRemovedWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    v9 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Handling music app removal",  (uint8_t *)&v8,  0xCu);
  }

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentity]);
  -[ICDCloudMusicLibraryRequestHandler disableCloudLibraryWithClientIdentity:reason:completionHandler:]( self,  "disableCloudLibraryWithClientIdentity:reason:completionHandler:",  v7,  -5LL,  v4);
}

- (void)handleMusicAppInstalled
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100020144;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)enableCloudLibraryWithClientIdentity:(id)a3 startInitialImport:(BOOL)a4 enableCloudLibraryPolicy:(int64_t)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a7;
  id v14 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10001F1D0;
  v20[3] = &unk_1001A4058;
  v20[4] = self;
  id v21 = v12;
  BOOL v24 = v10;
  BOOL v25 = v8;
  id v22 = v13;
  int64_t v23 = a5;
  id v15 = v13;
  id v16 = v12;
  id v17 = [v14 initWithStartHandler:v20];
  v18 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    BOOL isPendingAuthentication = self->_isPendingAuthentication;
    *(_DWORD *)buf = 138544642;
    v27 = self;
    __int16 v28 = 2114;
    id v29 = v17;
    __int16 v30 = 1024;
    BOOL v31 = v10;
    __int16 v32 = 1024;
    int v33 = a5;
    __int16 v34 = 1024;
    BOOL v35 = v8;
    __int16 v36 = 1024;
    BOOL v37 = isPendingAuthentication;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Enqueuing enableCloudLibraryOperation: %{public}@ - shouldStartInitialImport=%{BOOL}u, enableCloudLib raryPolicy=%d, isExplicitUserAction=%{BOOL}u, isPendingAuthentication=%{BOOL}u",  buf,  0x2Eu);
  }

  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);
}

- (void)disableCloudLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v49 = a3;
  id v50 = a5;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
  id v63 = 0LL;
  v51 = (void *)objc_claimAutoreleasedReturnValue([v8 getPropertiesForUserIdentity:v9 error:&v63]);
  id v48 = v63;

  id v10 = 0LL;
  v11 = 0LL;
  if (v51 && !v48)
  {
    id v10 = [v51 isActiveLocker];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v51 DSID]);
  }

  if ((unint64_t)(a4 + 11) <= 4 && a4 != -8)
  {
    v72[0] = @"reason";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a4));
    v72[1] = @"isActiveLocker";
    v73[0] = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v10));
    v73[1] = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  2LL));
    v74 = v14;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
    +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  MSVAutoBugCaptureDomainMusicLibrary,  @"Bug",  @"DisableICMLWrongReason",  @"Disable iCML invoked for the wrong reason",  0LL,  v15,  0LL);
  }

  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = a4;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = (_DWORD)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Starting to disable cloud library for reason=%d, isActiveLocker=%{BOOL}u",  buf,  0x18u);
  }

  if ((_DWORD)v10)
  {
    int v17 = MSVDeviceSupportsSideLoadedMediaContent();
    if (v11) {
      int v18 = v17;
    }
    else {
      int v18 = 0;
    }
    if (v18 == 1)
    {
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_10001ED00;
      v62[3] = &unk_1001A6640;
      v62[4] = self;
      v19 = -[ICStoreRequestContext initWithBlock:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithBlock:",  v62);
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[ICUpdateAutomaticDownloadMediaKindsRequest automaticDownloadMediaKindsForMusic]( &OBJC_CLASS___ICUpdateAutomaticDownloadMediaKindsRequest,  "automaticDownloadMediaKindsForMusic"));
      id v21 = [[ICUpdateAutomaticDownloadMediaKindsRequest alloc] initWithRequestContext:v19 mediaKindsToAdd:0 mediaKindsToRemove:v20];
      [v21 performRequestWithCompletionHandler:&stru_1001A1AC8];
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10001ED7C;
    v58[3] = &unk_1001A3DA0;
    v58[4] = self;
    int64_t v61 = a4;
    id v59 = v49;
    id v60 = v50;
    id v23 = v22;
    BOOL v24 = v58;
    BOOL v25 = (void *)objc_claimAutoreleasedReturnValue([v23 userIdentityStore]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v23 userIdentity]);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    id v71 = 0LL;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 getPropertiesForUserIdentity:v26 error:&v71]);
    id v28 = v71;
    if (v28 || !v27)
    {
      dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
      v40 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&buf[16] = sub_1000C3304;
      *(void *)&buf[24] = &unk_1001A6BB8;
      v77 = v24;
      v76 = v28;
      dispatch_async(v40, buf);
    }

    else
    {
      uint64_t v65 = 0LL;
      v66 = &v65;
      uint64_t v67 = 0x3032000000LL;
      v68 = sub_1000C1AE4;
      v69 = sub_1000C1AF4;
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v27 cloudLibraryStateReason]);
      id v70 = [v29 mutableCopy];

      __int16 v30 = (void *)objc_claimAutoreleasedReturnValue([(id)v66[5] objectForKey:@"CloudLibraryStateReasonKey"]);
      id v31 = [v30 integerValue];
      if (v31 == (id)-1 || v66[5] && [v30 integerValue] == (id)a4)
      {
        __int16 v32 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = v66[5];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&uint8_t buf[4] = a4;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = v31 == (id)-1LL;
          *(_WORD *)&buf[14] = 2114;
          *(void *)&buf[16] = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Not updating account with disable iCML reason=%d. wasManuallyDisabled=%{BOOL}u, currentReason=%{public}@",  buf,  0x18u);
        }

        dispatch_queue_global_t v34 = dispatch_get_global_queue(0LL, 0LL);
        BOOL v35 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v34);
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1000C3598;
        *(void *)&buf[24] = &unk_1001A6BE0;
        v76 = v24;
        dispatch_async(v35, buf);
      }

      else
      {
        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472LL;
        v64[2] = sub_1000C3314;
        v64[3] = &unk_1001A5290;
        v64[4] = &v65;
        v64[5] = a4;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 3221225472LL;
        *(void *)&buf[16] = sub_1000C3408;
        *(void *)&buf[24] = &unk_1001A5268;
        v79 = &v65;
        v46 = v26;
        v76 = v46;
        v77 = v47;
        v78 = v24;
        [v25 insertPropertiesForUserIdentity:v46 andPostAccountChangeNotification:0 usingBlock:v64 completionHandler:buf];

        BOOL v35 = v77;
      }

      _Block_object_dispose(&v65, 8);
    }
  }

  else if (self->_jaliscoRequestHandler)
  {
    if (a4 == -1)
    {
      v44 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = -1;
        _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating Jalisco library for reason=%d",  buf,  0x12u);
      }

      jaliscoRequestHandler = self->_jaliscoRequestHandler;
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472LL;
      v56[2] = sub_10001EE18;
      v56[3] = &unk_1001A7220;
      v56[4] = self;
      id v57 = v50;
      -[JaliscoRequestHandler updateJaliscoLibraryByRemovingMediaKind:withClientIdentity:completionHandler:]( jaliscoRequestHandler,  "updateJaliscoLibraryByRemovingMediaKind:withClientIdentity:completionHandler:",  1LL,  v49,  v56);
    }

    else
    {
      __int16 v36 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
      [v36 setJaliscoNeedsUpdateForTokens:1];

      BOOL v37 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating Jalisco library for reason=%d, Setting jaliscoNeedsUpdateForTokens=YES",  buf,  0x12u);
      }

      v38 = self->_jaliscoRequestHandler;
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472LL;
      v54[2] = sub_10001EEB8;
      v54[3] = &unk_1001A7220;
      v54[4] = self;
      id v55 = v50;
      -[JaliscoRequestHandler updateLibraryWithClientIdentity:reason:completionHandler:]( v38,  "updateLibraryWithClientIdentity:reason:completionHandler:",  v49,  6LL,  v54);
    }
  }

  else
  {
    v41 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      v42 = self->_jaliscoRequestHandler;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a4;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Will not update Jalisco library for reason=%d _jaliscoRequestHandler=%p",  buf,  0x1Cu);
    }

    if (v50)
    {
      calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10001EF58;
      block[3] = &unk_1001A6BE0;
      id v53 = v50;
      dispatch_async(calloutQueue, block);
    }
  }
}

- (BOOL)isUpdatingCloudLibrary
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10001ECA0;
  v5[3] = &unk_1001A65D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)isUpdatingCloudLibraryWithCompletion:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001E674;
  v7[3] = &unk_1001A6BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)updateCloudLibraryProgressWithCompletion:(id)a3
{
  -[ICDCloudMusicLibraryRequestHandler updateProgressForLibraryType:completionHandler:]( self,  "updateProgressForLibraryType:completionHandler:",  self->_musicSubscriptionCheckStatus != 3,  a3);
}

- (void)updateSagaLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001E148;
  block[3] = &unk_1001A1B68;
  id v19 = v13;
  int64_t v20 = a4;
  void block[4] = self;
  id v18 = v12;
  BOOL v21 = a5;
  BOOL v22 = a6;
  id v15 = v12;
  id v16 = v13;
  dispatch_async(accessQueue, block);
}

- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 forReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001DDA0;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)addOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5
{
  id v8 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001DD70;
  v11[3] = &unk_1001A1B90;
  id v12 = v8;
  int64_t v13 = a4;
  v11[4] = self;
  int v14 = a5;
  id v10 = v8;
  dispatch_async(accessQueue, v11);
}

- (void)addBackgroundOperation:(id)a3 forLibraryType:(int64_t)a4 priority:(int)a5
{
  id v8 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001DC6C;
  v11[3] = &unk_1001A1B90;
  id v12 = v8;
  int64_t v13 = a4;
  v11[4] = self;
  int v14 = a5;
  id v10 = v8;
  dispatch_async(accessQueue, v11);
}

- (void)cancelPendingChangesForLibraryType:(int64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001DC44;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

- (void)updateProgressForLibraryType:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001D918;
  block[3] = &unk_1001A1BE0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D764;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D5B0;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001D3FC;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001D30C;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001D21C;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10001D12C;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001CF70;
  v21[3] = &unk_1001A1C08;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a3;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(accessQueue, v21);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001CDB4;
  block[3] = &unk_1001A4250;
  id v30 = v18;
  int64_t v31 = a3;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(accessQueue, block);
}

- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001CBF8;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001CA44;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001C890;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001C6DC;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C520;
  block[3] = &unk_1001A4250;
  id v30 = v18;
  int64_t v31 = a3;
  void block[4] = self;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(accessQueue, block);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001C368;
  v19[3] = &unk_1001A1C30;
  v19[4] = self;
  id v20 = v12;
  int64_t v23 = a3;
  int64_t v24 = a5;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(accessQueue, v19);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001C1B4;
  block[3] = &unk_1001A1C58;
  unint64_t v18 = a3;
  int64_t v19 = a4;
  void block[4] = self;
  id v16 = v10;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(accessQueue, block);
}

- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001BFF8;
  v21[3] = &unk_1001A1C08;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a4;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(accessQueue, v21);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10001BE40;
  v19[3] = &unk_1001A1C30;
  unint64_t v23 = a3;
  int64_t v24 = a4;
  v19[4] = self;
  id v20 = v12;
  id v21 = v13;
  id v22 = v14;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  dispatch_async(accessQueue, v19);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BC88;
  block[3] = &unk_1001A1C80;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001BAD0;
  block[3] = &unk_1001A1CA8;
  void block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(accessQueue, block);
}

- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001B918;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001B760;
  v21[3] = &unk_1001A1C08;
  v21[4] = self;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  int64_t v26 = a5;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(accessQueue, v21);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001B5A8;
  block[3] = &unk_1001A4250;
  void block[4] = self;
  id v26 = v14;
  id v30 = v18;
  int64_t v31 = a5;
  id v27 = v15;
  id v28 = v16;
  id v29 = v17;
  id v20 = v18;
  id v21 = v17;
  id v22 = v16;
  id v23 = v15;
  id v24 = v14;
  dispatch_async(accessQueue, block);
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001B3F4;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001AF80;
  v13[3] = &unk_1001A1CD0;
  id v15 = v9;
  int64_t v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(accessQueue, v13);
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001ADCC;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AC18;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001AA64;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A8B0;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A700;
  block[3] = &unk_1001A6C08;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001A550;
  block[3] = &unk_1001A6C08;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001A394;
  v21[3] = &unk_1001A3D78;
  v21[4] = self;
  id v22 = v14;
  BOOL v26 = a4;
  id v24 = v16;
  int64_t v25 = a5;
  BOOL v27 = a6;
  id v23 = v15;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(accessQueue, v21);
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10001A1DC;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001A024;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100019E6C;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100019CB4;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadLastKnownEnableICMLStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
  id v26 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 getPropertiesForUserIdentity:v6 error:&v26]);
  id v8 = v26;

  if (v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudLibraryStateReason]);
    if ([v7 isActiveLocker])
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"EnableCloudLibraryFailureReasonKey"]);
      id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = self;
        __int16 v29 = 2114;
        id v30 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - last known error reason enabling iCML=%{public}@",  buf,  0x16u);
      }

      if (v4)
      {
        calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100019C78;
        block[3] = &unk_1001A6BB8;
        id v25 = v4;
        id v10 = v10;
        id v24 = v10;
        dispatch_async(calloutQueue, block);
      }
    }

    else
    {
      id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v28 = self;
        __int16 v29 = 2114;
        id v30 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - locker bit is not set, not returning last known error enabling iCML. cloudLibraryStateReason=%{public}@",  buf,  0x16u);
      }

      if (!v4) {
        goto LABEL_16;
      }
      id v16 = (dispatch_queue_s *)self->_calloutQueue;
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100019C8C;
      v20[3] = &unk_1001A6BB8;
      id v22 = v4;
      id v21 = v8;
      dispatch_async(v16, v20);

      id v10 = v22;
    }

LABEL_16:
    goto LABEL_17;
  }

  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = self;
    __int16 v29 = 2114;
    id v30 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - could not load user identity properties (error=%{public}@), not returning last known error enabling iCML",  buf,  0x16u);
  }

  if (v4)
  {
    id v14 = (dispatch_queue_s *)self->_calloutQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100019CA0;
    v17[3] = &unk_1001A6BB8;
    id v19 = v4;
    id v18 = v8;
    dispatch_async(v14, v17);

    id v9 = v19;
    goto LABEL_16;
  }

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100019A70;
  v17[3] = &unk_1001A1CF8;
  int64_t v21 = a4;
  int64_t v22 = a5;
  void v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  int64_t v20 = a3;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(accessQueue, v17);
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019894;
  block[3] = &unk_1001A1C80;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000196B8;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a3;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000194DC;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  int64_t v21 = a3;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000192D4;
  v17[3] = &unk_1001A1CF8;
  int64_t v21 = a3;
  int64_t v22 = a5;
  void v17[4] = self;
  id v18 = v12;
  id v19 = v13;
  int64_t v20 = a4;
  id v15 = v13;
  id v16 = v12;
  dispatch_async(accessQueue, v17);
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001911C;
  v11[3] = &unk_1001A1D20;
  int64_t v13 = a3;
  unint64_t v14 = a4;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(accessQueue, v11);
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018F68;
  block[3] = &unk_1001A1BE0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018DB4;
  block[3] = &unk_1001A1C80;
  id v20 = v12;
  int64_t v21 = a3;
  void block[4] = self;
  id v18 = v10;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100018BFC;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018A44;
  block[3] = &unk_1001A1D48;
  void block[4] = self;
  id v16 = v10;
  BOOL v19 = a5;
  id v17 = v11;
  int64_t v18 = a4;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(accessQueue, block);
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100018890;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a4;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000186DC;
  block[3] = &unk_1001A1BE0;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100018528;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100018374;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  unint64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100018284;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100018194;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017FE4;
  block[3] = &unk_1001A6C08;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(accessQueue, block);
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017E30;
  block[3] = &unk_1001A1C80;
  void block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a4;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(accessQueue, block);
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100017C78;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100017AC0;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 clientIdentity:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100017908;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100017750;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadMissingArtworkWithClientIdentity:(id)a3
{
  id v4 = a3;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100017600;
  v7[3] = &unk_1001A6C30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(accessQueue, v7);
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001744C;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)importItemArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100017298;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importScreenshotForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000170E4;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)importContainerArtworkForPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100016F30;
  v13[3] = &unk_1001A1CD0;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  int64_t v16 = a3;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(accessQueue, v13);
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100016E40;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100016D50;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100016C60;
  v4[3] = &unk_1001A4D20;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100016AA8;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000168F0;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100016738;
  v15[3] = &unk_1001A6D48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(accessQueue, v15);
}

- (BOOL)shouldIncludeMediaKindSongForJaliscoImport
{
  uint64_t v20 = 0LL;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  char v23 = 1;
  if (sub_1000B1B34())
  {
    char v3 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = *((unsigned __int8 *)v21 + 24);
      *(_DWORD *)buf = 138543618;
      id v25 = self;
      __int16 v26 = 1024;
      LODWORD(v27) = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ includeMediaKindSong=%{BOOL}u on non standalone wOS platform",  buf,  0x12u);
    }
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
    id v19 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 getPropertiesForUserIdentity:v6 error:&v19]);
    char v3 = (os_log_s *)v19;

    if (v3 || !v7)
    {
      id v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v25 = self;
        __int16 v26 = 2114;
        BOOL v27 = v3;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%{public}@ could not load user identity properties. error=%{public}@",  buf,  0x16u);
      }

      unsigned __int8 v8 = 0;
    }

    else
    {
      unsigned __int8 v8 = [v7 isActiveLocker];
    }

    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001649C;
    v15[3] = &unk_1001A1D70;
    unsigned __int8 v18 = v8;
    v15[4] = self;
    id v17 = &v20;
    id v12 = v10;
    id v16 = v12;
    sub_1000C3C88(v11, v15);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }

  char v13 = *((_BYTE *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (void)startingUpdateOperationForLibraryType:(int64_t)a3 isInitialImport:(BOOL)a4
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001631C;
  block[3] = &unk_1001A1D98;
  void block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_async(accessQueue, block);
}

- (void)finishedUpdateOperationForLibraryType:(int64_t)a3 withResponse:(id)a4
{
  id v6 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015C34;
  block[3] = &unk_1001A5D08;
  id v10 = v6;
  int64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)setUpdateProgress:(float)a3 forLibraryType:(int64_t)a4
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015B20;
  block[3] = &unk_1001A1DE8;
  void block[4] = self;
  void block[5] = a4;
  float v6 = a3;
  dispatch_async(accessQueue, block);
}

- (void)scheduleBackgroundTaskToUpdateLibraryType:(int64_t)a3
{
  BOOL v4 = a3 != 1;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler taskScheduler](self, "taskScheduler"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
  [v6 scheduleBackgroundUpdateType:v4 forConfiguration:v5];
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  if ([a3 isRemoteServerReachable] && !self->_musicSubscriptionCheckStatus)
  {
    BOOL v4 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int64_t musicSubscriptionCheckStatus = self->_musicSubscriptionCheckStatus;
      int v6 = 138543618;
      id v7 = self;
      __int16 v8 = 1024;
      int v9 = musicSubscriptionCheckStatus;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - network reachability changed, _int64_t musicSubscriptionCheckStatus = %d. Reloading subscription status",  (uint8_t *)&v6,  0x12u);
    }

    -[ICDCloudMusicLibraryRequestHandler _reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:completionHandler:]( self,  "_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:completionHandler:",  5LL,  0LL);
  }

- (void)becomeActive
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001540C;
  block[3] = &unk_1001A6B90;
  void block[4] = self;
  dispatch_async(accessQueue, block);
}

- (void)becomeInactiveWithDeauthentication:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100014CE8;
  block[3] = &unk_1001A5858;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(accessQueue, block);
}

- (void)updateLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
  id v25 = 0LL;
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 getPropertiesForUserIdentity:v8 error:&v25]);
  id v10 = v25;

  if (v9)
  {
    unsigned __int8 v11 = [v9 isActiveLocker];
    id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v27 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating Jalisco Library with reason=%d",  buf,  8u);
    }

    char v13 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientIdentity]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000148E4;
    v20[3] = &unk_1001A1E38;
    int64_t v23 = a3;
    id v15 = (id *)v21;
    id v16 = v10;
    unsigned __int8 v24 = v11;
    v21[0] = v16;
    v21[1] = self;
    id v22 = v6;
    -[ICDCloudMusicLibraryRequestHandler updateJaliscoLibraryWithClientIdentity:forReason:completionHandler:]( self,  "updateJaliscoLibraryWithClientIdentity:forReason:completionHandler:",  v14,  a3,  v20);
  }

  else
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100014AE0;
    block[3] = &unk_1001A6BE0;
    id v15 = &v19;
    id v19 = v6;
    dispatch_async(calloutQueue, block);
  }
}

- (void)_resetInternalCloudLibraryState
{
  self->_int64_t musicSubscriptionCheckStatus = 1LL;
  self->_subscriptionStatusFailureCount = 0;
  self->_autoEnableFailureCount = 0;
  self->_sagaImportFailureCount = 0;
  self->_autoRetryCloudAuthenticateFailureCount = 0;
}

- (BOOL)_isNativeMusicAppInstalled
{
  if (MSVDeviceSupportsMultipleLibraries(self))
  {
    char v3 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      BOOL v4 = "%{public}@ - Ignoring native music app check on platforms that support multiple libraries";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  if (sub_1000B1B34())
  {
    char v3 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      id v7 = self;
      BOOL v4 = "%{public}@ - Ignoring native music app check on traditional wOS";
      goto LABEL_7;
    }

- (void)_handleMusicSubscriptionStatusDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    uint64_t v20 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Handling subscription status change notification",  (uint8_t *)&v19,  0xCu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v7 = ICUserIdentityForMusicSubscriptionStatusDidChangeKey;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:ICUserIdentityForMusicSubscriptionStatusDidChangeKey]);

  if (!v8) {
    goto LABEL_11;
  }
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 DSIDForUserIdentity:v10 outError:0]);

  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 DSIDForUserIdentity:v14 outError:0]);

  id v16 = v15;
  if (v12 == v16)
  {

    goto LABEL_10;
  }

  unsigned __int8 v17 = [v12 isEqual:v16];

  if ((v17 & 1) != 0)
  {
LABEL_10:

LABEL_11:
    -[ICDCloudMusicLibraryRequestHandler _reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:completionHandler:]( self,  "_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:completionHandler:",  2LL,  0LL);
    goto LABEL_12;
  }

  unsigned __int8 v18 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543874;
    uint64_t v20 = self;
    __int16 v21 = 2112;
    id v22 = v16;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Subscription change notification received for another account [no action to take] - handlerDSID=%@ - notificationDSID=%@",  (uint8_t *)&v19,  0x20u);
  }

LABEL_12:
}

- (void)_runSubscriptionStatusCheckOperationWithReason:(int64_t)a3 completionHandler:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100014654;
  v6[3] = &unk_1001A1E60;
  v6[4] = self;
  v6[5] = a3;
  id v5 = [[ICAsyncBlockOperation alloc] initWithStartHandler:v6];
  -[NSOperationQueue addOperation:](self->_retryQueue, "addOperation:", v5);
}

- (void)_enqueueSubscriptionStatusCheckForReason:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 2 && self->_havePendingSubscriptionStatusCheck)
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v17 = self;
    uint64_t v7 = "%{public}@ - We already have a pending subscription status check operation.";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
LABEL_12:

    return;
  }

  if ((unint64_t)(a3 - 1) <= 1)
  {
    if (-[BaseRequestHandler isActive](self, "isActive"))
    {
      -[ICDCloudMusicLibraryRequestHandler _runSubscriptionStatusCheckOperationWithReason:completionHandler:]( self,  "_runSubscriptionStatusCheckOperationWithReason:completionHandler:",  5LL,  0LL);
      return;
    }

    id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 138543362;
    unsigned __int8 v17 = self;
    uint64_t v7 = "%{public}@ - Not reloading subscription status as the handler is not active.";
    goto LABEL_11;
  }

  self->_havePendingSubscriptionStatusCheck = 1;
  int subscriptionStatusFailureCount = self->_subscriptionStatusFailureCount;
  if (subscriptionStatusFailureCount >= 10) {
    int subscriptionStatusFailureCount = 10;
  }
  double v10 = (double)(600 * (subscriptionStatusFailureCount ^ 2));
  unsigned __int8 v11 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_subscriptionStatusFailureCount;
    *(_DWORD *)buf = 138544130;
    unsigned __int8 v17 = self;
    __int16 v18 = 2048;
    double v19 = v10;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2048;
    uint64_t v23 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Will retry getting subscription status in %f seconds for reason %d, _subscriptionStatusFailureCount=%ld",  buf,  0x26u);
  }

  dispatch_time_t v13 = dispatch_time(0x8000000000000000LL, (uint64_t)(v10 * 1000000000.0));
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100014558;
  v15[3] = &unk_1001A4D20;
  v15[4] = self;
  void v15[5] = a3;
  dispatch_after(v13, accessQueue, v15);
}

- (void)_enqueueCloudUpdateLibraryOperationForReason:(int64_t)a3
{
  if (!self->_havePendingCloudUpdateLibraryCheck)
  {
    self->_havePendingCloudUpdateLibraryCheck = 1;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    int v6 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userIdentity]);
    int v9 = -[ICStoreRequestContext initWithIdentity:](v6, "initWithIdentity:", v8);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000141A4;
    v10[3] = &unk_1001A1E88;
    v10[4] = self;
    v10[5] = a3;
    [v5 getBagForRequestContext:v9 withCompletionHandler:v10];
  }

- (void)_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
  if ([v7 shouldTreatSubscriptionStatusAsExpired])
  {
    int v8 = MSVDeviceOSIsInternalInstall();

    if (v8)
    {
      int v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        __int16 v22 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - shouldTreatSubscriptionStatusAsExpired is set. Will force subscription status to be expired",  buf,  0xCu);
      }

      accessQueue = (dispatch_queue_s *)self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000134C8;
      block[3] = &unk_1001A1BE0;
      v20[0] = v6;
      v20[1] = a3;
      unsigned __int8 v11 = (id *)v20;
      void block[4] = self;
      id v12 = v6;
      dispatch_async(accessQueue, block);
      goto LABEL_10;
    }
  }

  else
  {
  }

  dispatch_time_t v13 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int64_t musicSubscriptionCheckStatus = self->_musicSubscriptionCheckStatus;
    *(_DWORD *)buf = 138543874;
    __int16 v22 = self;
    __int16 v23 = 1024;
    int v24 = musicSubscriptionCheckStatus;
    __int16 v25 = 1024;
    int v26 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - reloading subscription status. Current status=%d, reason=%d",  buf,  0x18u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100013560;
  v17[3] = &unk_1001A1ED8;
  v18[0] = v6;
  v18[1] = a3;
  unsigned __int8 v11 = (id *)v18;
  void v17[4] = self;
  id v16 = v6;
  sub_1000C3C88(v15, v17);

LABEL_10:
}

- (void)_retryEnablingCloudMusicLibraryForReason:(int64_t)a3
{
  if (self->_havePendingAutoEnableICMLCheck)
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      dispatch_time_t v13 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - We already have a pending enable ICML operation.",  buf,  0xCu);
    }
  }

  else
  {
    self->_havePendingAutoEnableICMLCheck = 1;
    int autoEnableFailureCount = self->_autoEnableFailureCount;
    if (autoEnableFailureCount >= 10) {
      int autoEnableFailureCount = 10;
    }
    double v7 = (double)(3600 * (autoEnableFailureCount ^ 2));
    int v8 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      dispatch_time_t v13 = self;
      __int16 v14 = 2048;
      double v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Will retry enabling iCML in %f seconds.",  buf,  0x16u);
    }

    dispatch_time_t v9 = dispatch_time(0x8000000000000000LL, (uint64_t)(v7 * 1000000000.0));
    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10001311C;
    v11[3] = &unk_1001A4D20;
    v11[4] = self;
    void v11[5] = a3;
    dispatch_after(v9, accessQueue, v11);
  }

- (int64_t)_getCurrentSubscriptionStatusForReason:(int64_t)a3
{
  int64_t musicSubscriptionCheckStatus = self->_musicSubscriptionCheckStatus;
  if (!musicSubscriptionCheckStatus) {
    -[ICDCloudMusicLibraryRequestHandler _reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:completionHandler:]( self,  "_reloadSubscriptionStatusAndEnableCloudMusicLibraryWithReason:completionHandler:",  a3,  0LL);
  }
  return musicSubscriptionCheckStatus;
}

- (int64_t)_canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:(id)a3 includeLocalContentCheck:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Checking if ICML can be enabled. includeLocalContentCheck=%{BOOL}u",  buf,  0x12u);
  }

  int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 DSID]);
  if ([v6 isActiveLocker])
  {
    dispatch_time_t v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [v8 longLongValue];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - DSID (%lld) is already the active locker account",  buf,  0x16u);
    }

    int64_t v11 = 0LL;
    goto LABEL_21;
  }

  if (v8 && [v8 longLongValue])
  {
    dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v44 = sub_10000F504;
    v45 = sub_10000F514;
    id v46 = 0LL;
    uint64_t v35 = 0LL;
    __int16 v36 = &v35;
    uint64_t v37 = 0x2020000000LL;
    char v38 = 0;
    dispatch_time_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100013080;
    v31[3] = &unk_1001A1F00;
    uint64_t v33 = buf;
    dispatch_queue_global_t v34 = &v35;
    dispatch_time_t v9 = v12;
    __int16 v32 = v9;
    sub_1000C35B8(v13, v31);

    dispatch_semaphore_wait((dispatch_semaphore_t)v9, 0xFFFFFFFFFFFFFFFFLL);
    if (*((_BYTE *)v36 + 24))
    {
      __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v39 = 138543362;
        v40 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cannot enable ICML as the user manually disabled it",  v39,  0xCu);
      }
    }

    else
    {
      if (*(void *)(*(void *)&buf[8] + 40LL))
      {
        __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = *(void **)(*(void *)&buf[8] + 40LL);
          *(_DWORD *)v39 = 138543618;
          v40 = self;
          __int16 v41 = 2114;
          id v42 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Error (%{public}@ determining if user manually disabled iCML. Will schedule a retry.",  v39,  0x16u);
        }

        int64_t v11 = 3LL;
        goto LABEL_20;
      }

      if (!v4
        || (__int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration")),
            unsigned int v19 = sub_1000C3790(v18),
            v18,
            !v19))
      {
        id v24 = objc_alloc_init((Class)sub_1000C3A38());
        __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 getPreExistingStoreIdentifiers]);
        __int16 v25 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v39 = 138543362;
          v40 = (ICDCloudMusicLibraryRequestHandler *)v14;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "preExistingStoreIdentifiers=%{public}@",  v39,  0xCu);
        }

        if (-[os_log_s containsObject:](v14, "containsObject:", v8))
        {
          os_log_t v26 = sub_1000DD968();
          int v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            id v28 = [v8 longLongValue];
            *(_DWORD *)v39 = 138543618;
            v40 = self;
            __int16 v41 = 2048;
            id v42 = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Can conditionally enable ICML as DSID (%lld) is a preexisting store acount",  v39,  0x16u);
          }

          int64_t v11 = 2LL;
        }

        else
        {
          int64_t v11 = 0LL;
        }

        goto LABEL_20;
      }

      dispatch_semaphore_t v20 = dispatch_semaphore_create(0LL);
      os_log_t v21 = sub_1000DD968();
      __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v39 = 138543362;
        v40 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cannot enable ICML as there are local destructive changes",  v39,  0xCu);
      }

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472LL;
      v29[2] = sub_100013114;
      v29[3] = &unk_1001A6398;
      __int16 v14 = v20;
      id v30 = v14;
      sub_1000C3050(v23, -100LL, v29);

      dispatch_semaphore_wait((dispatch_semaphore_t)v14, 0xFFFFFFFFFFFFFFFFLL);
    }

    int64_t v11 = 1LL;
LABEL_20:

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_21;
  }

  dispatch_time_t v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v8 longLongValue];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cannot enable ICML as the DSID (%lld) is invalid",  buf,  0x16u);
  }

  int64_t v11 = 1LL;
LABEL_21:

  return v11;
}

- (BOOL)_wasRestoredFromCloudBackup:(id)a3
{
  id v4 = a3;
  uint64_t v35 = 0LL;
  __int16 v36 = &v35;
  uint64_t v37 = 0x2020000000LL;
  char v38 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v5));

  int64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v4 DSID]);
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 sagaAccountID]);
  id v8 = [v6 sagaOnDiskDatabaseRevision];
  id v9 = objc_alloc_init((Class)sub_1000C3A38());
  id v10 = (ICDCloudMusicLibraryRequestHandler *)objc_claimAutoreleasedReturnValue([v9 getCurrentInstallDisposition]);
  int64_t v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v40 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "migratorDisposition=%{public}@", buf, 0xCu);
  }

  if (!v10)
  {
    int v18 = 0;
LABEL_14:
    __int16 v23 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543874;
    v40 = self;
    __int16 v41 = 1024;
    *(_DWORD *)id v42 = (_DWORD)v8;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v18;
    id v24 = "%{public}@ - currentSagaDatabaseVersion=%d, wasRestoredFromCloudBackup=%{BOOL}u";
    __int16 v25 = v23;
    uint32_t v26 = 24;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);
    goto LABEL_17;
  }

  dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[ICDCloudMusicLibraryRequestHandler objectForKey:]( v10,  "objectForKey:",  @"WasDeviceRestoredFromBackup"));
  unsigned int v13 = [v12 BOOLValue];

  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICDCloudMusicLibraryRequestHandler objectForKey:](v10, "objectForKey:", @"WasDeviceUpgraded"));
  unsigned int v15 = [v14 BOOLValue];

  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[ICDCloudMusicLibraryRequestHandler objectForKey:]( v10,  "objectForKey:",  @"WasDeviceRestoredFromCloudBackup"));
  unsigned int v17 = [v16 BOOLValue];

  int v18 = v13 & v17;
  if (v8 || !v18) {
    goto LABEL_14;
  }
  unsigned int v19 = 0;
  if (v7 && v31) {
    unsigned int v19 = [v31 isEqualToNumber:v7];
  }
  dispatch_semaphore_t v20 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v40 = self;
    __int16 v41 = 1024;
    *(_DWORD *)id v42 = v19;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v15 & (v13 ^ 1);
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = 1;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Device was restored from cloud backup. sameAccountAsInBackup=%{BOOL}u, wasUpgraded=%{BOOL}u, wasRestored=%{BOOL}u",  buf,  0x1Eu);
  }

  if (!v19)
  {
    __int16 v23 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    if (v7) {
      id v29 = [v7 longLongValue];
    }
    else {
      id v29 = 0LL;
    }
    id v30 = v31;
    if (v31) {
      id v30 = [v31 longLongValue];
    }
    *(_DWORD *)buf = 138543874;
    v40 = self;
    __int16 v41 = 2048;
    *(void *)id v42 = v29;
    *(_WORD *)&v42[8] = 2048;
    id v43 = v30;
    id v24 = "%{public}@ - Account in the backup is NOT the same as the current account (previousAccountID=%lld, activeAccou"
          "ntID=%lld), not upgrading iCML";
    __int16 v25 = v23;
    uint32_t v26 = 32;
    goto LABEL_16;
  }

  dispatch_semaphore_t v21 = dispatch_semaphore_create(0LL);
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100012EE4;
  v32[3] = &unk_1001A1F28;
  dispatch_queue_global_t v34 = &v35;
  v32[4] = self;
  __int16 v23 = v21;
  uint64_t v33 = v23;
  sub_1000C35B8(v22, v32);

  dispatch_semaphore_wait((dispatch_semaphore_t)v23, 0xFFFFFFFFFFFFFFFFLL);
LABEL_17:

  BOOL v27 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);

  return v27;
}

- (void)_adjustMergePreferenceWithUserIdentityProperties:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v5));

  double v7 = (void *)objc_claimAutoreleasedReturnValue([v4 DSID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 sagaAccountID]);
  id v9 = (id)objc_claimAutoreleasedReturnValue([v6 sagaLastKnownActiveLockerAccountDSID]);
  if (v8) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v7 == 0LL;
  }
  int v11 = !v10;
  if (v8) {
    BOOL v12 = v7 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = [v7 isEqualToNumber:v8] ^ 1;
  }
  unsigned int v14 = [v6 sagaPrefersToMergeWithCloudLibrary];
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v4 DSID]);
  id v16 = v15;
  if ((v11 | v13) != 1)
  {
    __int16 v32 = v15;
    if (-[ICDCloudMusicLibraryRequestHandler _wasRestoredFromCloudBackup:](self, "_wasRestoredFromCloudBackup:", v4))
    {
      [v6 clearSagaCloudLibraryTroveID];
      [v6 clearSagaCloudLibraryCUID];
      [v6 clearSagaClientFeaturesVersion];
      [v6 setSagaLastKnownActiveLockerAccountDSID:0];
      [v6 setSagaPrefersToMergeWithCloudLibrary:0];
      __int16 v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        dispatch_queue_global_t v34 = self;
        __int16 v35 = 1024;
        unsigned int v36 = [v6 sagaPrefersToMergeWithCloudLibrary];
        __int16 v23 = "%{public}@ - Clearing TroveID, CUID, client feature versions and setting merge preference to %{BOOL}u";
        id v24 = v22;
        uint32_t v25 = 18;
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
      }
    }

    else
    {
      __int16 v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        dispatch_queue_global_t v34 = self;
        __int16 v23 = "%{public}@ - Will not adjust merge preference.";
        id v24 = v22;
        uint32_t v25 = 12;
        goto LABEL_26;
      }
    }

    uint32_t v26 = v6;
LABEL_41:

    id v6 = v26;
LABEL_42:
    id v16 = v32;
    goto LABEL_43;
  }

  if (v9)
  {
    id v17 = v15;
    if (v17 == v9)
    {
    }

    else
    {
      int v18 = v17;
      unsigned __int8 v19 = [v17 isEqual:v9];

      if ((v19 & 1) == 0)
      {
        dispatch_semaphore_t v20 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          dispatch_queue_global_t v34 = self;
          __int16 v35 = 1024;
          unsigned int v36 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Active locker account is different from previous locker account - shouldMergeWithCloudLibrary=%d",  buf,  0x12u);
        }

        if ((v14 & 1) != 0)
        {
          __int16 v32 = v16;
          uint64_t v21 = 0LL;
          unsigned int v14 = 1;
          goto LABEL_39;
        }

        goto LABEL_43;
      }
    }

    id v30 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      dispatch_queue_global_t v34 = self;
      __int16 v35 = 1024;
      unsigned int v36 = 1;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Active locker account is the same as previous locker account - shouldMergeWithCloudLibrary=%d",  buf,  0x12u);
    }
  }

  else
  {
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue([v4 mergeToCloudLibraryPreference]);
    if (v27)
    {
      id v28 = v27;
      __int16 v32 = v16;
      uint64_t v21 = (uint64_t)[v27 BOOLValue];
      id v29 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        dispatch_queue_global_t v34 = self;
        __int16 v35 = 1024;
        unsigned int v36 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Found mergePreference on the active locker account - shouldMerge=%d.",  buf,  0x12u);
      }

      if (v14 == (_DWORD)v21) {
        goto LABEL_42;
      }
      goto LABEL_39;
    }
  }

  if ((v14 & 1) == 0)
  {
    __int16 v32 = v16;
    unsigned int v14 = 0;
    uint64_t v21 = 1LL;
LABEL_39:
    int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
    uint32_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v31));

    [v26 setSagaPrefersToMergeWithCloudLibrary:v21];
    __int16 v22 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      dispatch_queue_global_t v34 = self;
      __int16 v35 = 1024;
      unsigned int v36 = v14;
      __int16 v37 = 1024;
      int v38 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating merge preference from %{BOOL}u to %{BOOL}u",  buf,  0x18u);
    }

    goto LABEL_41;
  }

- (int64_t)_shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:(id)a3
{
  id v4 = a3;
  if (self->_didHandleStartupNotificationReason)
  {
    int64_t v5 = 2LL;
  }

  else
  {
    self->_didHandleStartupNotificationReason = 1;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v6));

    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 DSID]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 sagaAccountID]);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v7 sagaLastKnownActiveLockerAccountDSID]);
    unsigned int v11 = [v7 sagaOnDiskDatabaseRevision];
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v8 == 0LL;
    }
    int v13 = !v12;
    if (v9) {
      BOOL v14 = v8 == 0LL;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14) {
      unsigned int v15 = 0;
    }
    else {
      unsigned int v15 = [v8 isEqualToNumber:v9] ^ 1;
    }
    unsigned int v25 = v15;
    if (((v13 | v15) & 1) != 0)
    {
      int64_t v5 = 0LL;
    }

    else if (-[ICDCloudMusicLibraryRequestHandler _wasRestoredFromCloudBackup:]( self,  "_wasRestoredFromCloudBackup:",  v4))
    {
      int64_t v5 = 1LL;
    }

    else
    {
      id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v27 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No changes to process",  buf,  0xCu);
      }

      int64_t v5 = 2LL;
    }

    id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = v13;
      id v18 = [v9 longLongValue];
      id v24 = v7;
      unsigned int v19 = v11;
      id v20 = [v8 longLongValue];
      id v21 = [v10 longLongValue];
      *(_DWORD *)buf = 138545154;
      BOOL v27 = self;
      __int16 v28 = 2048;
      id v29 = v18;
      __int16 v30 = 2048;
      id v31 = v20;
      __int16 v32 = 2048;
      id v33 = v21;
      __int16 v34 = 1024;
      unsigned int v35 = v19;
      double v7 = v24;
      __int16 v36 = 1024;
      int v37 = v23;
      __int16 v38 = 1024;
      unsigned int v39 = v25;
      __int16 v40 = 1024;
      int v41 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - previousAccountID=%lld, activeAccountID=%lld, lastKnownActiveLockerAccountID=%lld, currentSagaDatab aseVersion=%d, accountIDWasAdded=%{BOOL}u, accountIDWasChanged=%{BOOL}u, handleReason=%d",  buf,  0x42u);
    }
  }

  return v5;
}

- (void)_registerDeviceAndPerformInitialImportWithUserIdentityProperties:(id)a3 cloudLibraryEnableReason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ((MSVDeviceSupportsSideLoadedMediaContent() & 1) == 0)
  {
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    if (([v10 isWatch] & 1) == 0)
    {

      goto LABEL_13;
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( +[ICNanoPairedDeviceStatusMonitor sharedMonitor]( &OBJC_CLASS___ICNanoPairedDeviceStatusMonitor,  "sharedMonitor"));
    unsigned __int8 v12 = [v11 isMediaSyncingSupported];

    if ((v12 & 1) != 0) {
      goto LABEL_13;
    }
  }

  if (([v8 isActive] & 1) != 0 || !objc_msgSend(v8, "isActiveLocker"))
  {
    if (MSVDeviceSupportsSideLoadedMediaContent() && !self->_didAdjustMergePreference)
    {
      -[ICDCloudMusicLibraryRequestHandler _adjustMergePreferenceWithUserIdentityProperties:]( self,  "_adjustMergePreferenceWithUserIdentityProperties:",  v8);
      self->_didAdjustMergePreference = 1;
    }

- (void)_authenticateAndStartInitialImportWithMergePreference:(id)a3 userIdentityProperties:(id)a4 enableReason:(int64_t)a5 withCompletionHandler:(id)a6
{
  id v9 = a6;
  id v10 = a3;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000126E8;
  v14[3] = &unk_1001A1FA0;
  id v15 = v9;
  int64_t v16 = a5;
  v14[4] = self;
  id v13 = v9;
  -[ICDCloudMusicLibraryRequestHandler _runSagaAuthenticateOperationWithClientIdentity:mergePreference:allowNoisyPrompt:cloudLibraryEnableReason:completionHandler:]( self,  "_runSagaAuthenticateOperationWithClientIdentity:mergePreference:allowNoisyPrompt:cloudLibraryEnableReason:completionHandler:",  v12,  v10,  0LL,  a5,  v14);
}

- (void)_tryEnablingICMLOnDevicesSupportingSideLoadedContentWithProperties:(id)a3 reason:(int64_t)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v30 = self;
    __int16 v31 = 1024;
    int v32 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - checking to see if iCML can be enabled for reason=%d",  buf,  0x12u);
  }

  if (a4 != 1 && self->_didHandleStartupNotificationReason)
  {
    int64_t v11 = 0LL;
    goto LABEL_11;
  }

  int64_t v11 = -[ICDCloudMusicLibraryRequestHandler _shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:]( self,  "_shouldHandleDaemonStartupOrAccountChangedNotificationWithProperties:",  v8);
  if (v11 != 2)
  {
LABEL_11:
    switch(-[ICDCloudMusicLibraryRequestHandler _canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:includeLocalContentCheck:]( self,  "_canEnableCloudMusicLibraryOnPlatformsWithSideLoadedMediaContentWithProperties:includeLocalContentCheck:",  v8,  v11 == 0))
    {
      case 0LL:
        goto LABEL_19;
      case 1LL:
        id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_26;
        }
        *(_DWORD *)buf = 138543618;
        __int16 v30 = self;
        __int16 v31 = 1024;
        int v32 = 1;
        int64_t v16 = "%{public}@ - Not enabling ICML (status = %d)";
        id v17 = v15;
        uint32_t v18 = 18;
        goto LABEL_25;
      case 2LL:
        id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
        BOOL v20 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if ((a4 & 0xFFFFFFFFFFFFFFFBLL) == 2)
        {
          if (v20)
          {
            *(_DWORD *)buf = 138543618;
            __int16 v30 = self;
            __int16 v31 = 1024;
            int v32 = 2;
            _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ -  enabling ICML (status = %d)",  buf,  0x12u);
          }

LABEL_19:
          -[ICDCloudMusicLibraryRequestHandler _authenticateAndStartInitialImportWithMergePreference:userIdentityProperties:enableReason:withCompletionHandler:]( self,  "_authenticateAndStartInitialImportWithMergePreference:userIdentityProperties:enableReason:withCompletionHandler:",  0LL,  v8,  a4,  v9);
          goto LABEL_30;
        }

        if (v20)
        {
          *(_DWORD *)buf = 138543874;
          __int16 v30 = self;
          __int16 v31 = 1024;
          int v32 = a4;
          __int16 v33 = 1024;
          int v34 = 2;
          int64_t v16 = "%{public}@ - Not enabling ICML for reason = %d, status = %d";
          id v17 = v15;
          uint32_t v18 = 24;
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
        }

- (void)_tryEnablingCloudMusicLibraryForReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100010DB0;
  v10[3] = &unk_1001A2018;
  id v11 = v6;
  int64_t v12 = a3;
  v10[4] = self;
  id v8 = v6;
  id v9 = [v7 initWithStartHandler:v10];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v9);
}

- (void)_runSagaAuthenticateOperationWithClientIdentity:(id)a3 mergePreference:(id)a4 allowNoisyPrompt:(BOOL)a5 cloudLibraryEnableReason:(int64_t)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (!self->_isPendingAuthentication)
  {
    self->_BOOL isPendingAuthentication = 1;
    char v19 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v29 = self;
      __int16 v30 = 1024;
      unsigned int v31 = [v14 intValue];
      __int16 v32 = 1024;
      BOOL v33 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Enqueueing CloudAuthenticateOperation shouldMerge:%d, allowNoisyPrompt:%{BOOL}u",  buf,  0x18u);
    }

    BOOL v20 = objc_alloc(&OBJC_CLASS___CloudAuthenticateOperation);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    uint32_t v18 = -[CloudAuthenticateOperation initWithConfiguration:mergeToCloudLibraryPreference:allowNoisyAuthPrompt:enableLibraryReason:clientIdentity:]( v20,  "initWithConfiguration:mergeToCloudLibraryPreference:allowNoisyAuthPrompt:enableLibraryReason:clientIdentity:",  v21,  v14,  v9,  a6,  v13);

    objc_initWeak((id *)buf, v18);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100010834;
    v25[3] = &unk_1001A2040;
    objc_copyWeak(v27, (id *)buf);
    v25[4] = self;
    v27[1] = (id)a2;
    v27[2] = (id)a6;
    id v26 = v15;
    -[CloudAuthenticateOperation setCompletionBlock:](v18, "setCompletionBlock:", v25);
    -[CloudAuthenticateOperation setName:]( v18,  "setName:",  @"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.cloudAuthenticateOperation");
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
    [v22 addOperation:v18 priority:2];

    objc_destroyWeak(v27);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }

  int64_t v16 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v29 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - We already have a pending authentication operation. Will not authenticate again.",  buf,  0xCu);
  }

  if (v15)
  {
    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_100010AE4;
    v23[3] = &unk_1001A6BE0;
    id v24 = (CloudAuthenticateOperation *)v15;
    dispatch_async(accessQueue, v23);
    uint32_t v18 = v24;
LABEL_9:
  }
}

- (void)_removeCloudSourcesForReason:(int64_t)a3 withClientIdentity:(id)a4 byDisablingActiveLockerAccount:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a6;
  int deauthOperationCount = self->_deauthOperationCount;
  if (deauthOperationCount < 1 || a3 == -11 || a3 == -5)
  {
    BOOL v15 = a3 == -11;
    self->_int deauthOperationCount = deauthOperationCount + 1;
    uint64_t v16 = objc_claimAutoreleasedReturnValue( -[ICDCloudMusicLibraryRequestHandler _cloudSourcesToRemoveForReason:]( self,  "_cloudSourcesToRemoveForReason:",  a3));
    id v17 = (void *)v16;
    if (v15) {
      uint64_t v18 = MSVDeviceSupportsMultipleLibraries(v16);
    }
    else {
      uint64_t v18 = 0LL;
    }
    char v19 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v47 = self;
      __int16 v48 = 1024;
      int v49 = v18;
      __int16 v50 = 1024;
      int v51 = v7;
      __int16 v52 = 2114;
      id v53 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Running RemoveCloudSourcesOperation deletingDatabase:%{BOOL}u, disableActiveLockerAccount:%{BOOL}u, removeSources=%{public}@",  buf,  0x22u);
    }

    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ArtistImageRequestHandler,  "handlerForConfiguration:",  v20));
    [v21 cancelAllOperations];

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue( +[CloudContentTasteUpdateRequestListener sharedContentTasteRequestListener]( &OBJC_CLASS___CloudContentTasteUpdateRequestListener,  "sharedContentTasteRequestListener"));
    int v23 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    [v22 removeContentTasteOperationsForConnectionConfiguration:v23];

    id v24 = self->_sagaRequestHandler;
    sagaRequestHandler = self->_sagaRequestHandler;
    self->_sagaRequestHandler = 0LL;

    -[ICDCloudMusicLibraryRequestHandler _resetInternalCloudLibraryState](self, "_resetInternalCloudLibraryState");
    id v26 = objc_alloc(&OBJC_CLASS___RemoveCloudSourcesOperation);
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler configuration](self, "configuration"));
    id v28 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( v26,  "initWithConfiguration:clientIdentity:",  v27,  v10);

    -[RemoveCloudSourcesOperation setDeleteDB:](v28, "setDeleteDB:", v18);
    -[RemoveCloudSourcesOperation setDisableActiveLockerAccount:](v28, "setDisableActiveLockerAccount:", v7);
    -[RemoveCloudSourcesOperation setRemoveCloudSouceAttributes:](v28, "setRemoveCloudSouceAttributes:", v17);
    if ([v17 containsObject:&off_1001B39D0] && self->_jaliscoRequestHandler)
    {
      id v29 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v47 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cancelling all Jalisco operations.",  buf,  0xCu);
      }

      -[JaliscoRequestHandler cancelAllOperations](self->_jaliscoRequestHandler, "cancelAllOperations");
    }

    __int16 v30 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
    if (v24)
    {
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v47 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Cancelling all Saga operations.",  buf,  0xCu);
      }

      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472LL;
      v40[2] = sub_1000104C0;
      v40[3] = &unk_1001A2068;
      int v41 = v28;
      id v42 = self;
      id v43 = v11;
      -[SagaRequestHandler cancelOperationsWithCompletionHandler:](v24, "cancelOperationsWithCompletionHandler:", v40);
    }

    else
    {
      if (v31)
      {
        *(_DWORD *)buf = 138543362;
        v47 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No valid SagaRequestHandler - not cancelling pending SagaLibrary operations.",  buf,  0xCu);
      }

      objc_initWeak((id *)buf, v28);
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      void v37[2] = sub_1000105CC;
      v37[3] = &unk_1001A4D70;
      objc_copyWeak(&v39, (id *)buf);
      v37[4] = self;
      id v38 = v11;
      -[RemoveCloudSourcesOperation setCompletionBlock:](v28, "setCompletionBlock:", v37);
      -[RemoveCloudSourcesOperation setName:]( v28,  "setName:",  @"com.apple.itunescloudd.ICDCloudMusicLibraryRequestHandler.sagaDeauthenticateOperation");
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
      [v32 addOperation:v28 priority:2];

      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    BOOL v33 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = self->_deauthOperationCount;
      *(_DWORD *)buf = 138543874;
      v47 = self;
      __int16 v48 = 1024;
      int v49 = v35;
      __int16 v50 = 1024;
      int v51 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - We already have a pending deauthentication operation _deauthOperationCount=%d. Will not deauthentic ate again for reason=%d.",  buf,  0x18u);
    }

    accessQueue = (dispatch_queue_s *)self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100010448;
    block[3] = &unk_1001A6BE0;
    id v45 = v11;
    dispatch_async(accessQueue, block);
    id v17 = v45;
  }
}

- (void)_handleUserIdentityStoreDidChangeNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[ICNanoPairedDeviceStatusMonitor sharedMonitor]( &OBJC_CLASS___ICNanoPairedDeviceStatusMonitor,  "sharedMonitor",  a3));
  unsigned int v5 = [v4 isMediaSyncingSupported];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
    id v14 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 getPropertiesForUserIdentity:v7 error:&v14]);
    BOOL v9 = (os_log_s *)v14;

    if (!v9 && v8)
    {
      unsigned __int8 v10 = [v8 isActiveLocker];
      accessQueue = (dispatch_queue_s *)self->_accessQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_1000102BC;
      block[3] = &unk_1001A5D58;
      unsigned __int8 v13 = v10;
      void block[4] = self;
      dispatch_async(accessQueue, block);
    }
  }

  else
  {
    BOOL v9 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - ignoring store did change notification",  buf,  0xCu);
    }
  }
}

- (void)_performInitialJaliscoImportWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
  id v9 = [v8 jaliscoOnDiskDatabaseRevision];

  unsigned int v10 = -[ICDCloudMusicLibraryRequestHandler shouldIncludeMediaKindSongForJaliscoImport]( self,  "shouldIncludeMediaKindSongForJaliscoImport");
  uint64_t v31 = 0LL;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000LL;
  char v34 = 1;
  if (sub_1000B1B34() || !v10)
  {
    uint64_t v16 = 0LL;
    *((_BYTE *)v32 + 24) = 0;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 jaliscoLastSupportedMediaKinds]);

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@","]);
    id v14 = NSStringFromSelector("longLongValue");
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 valueForKey:v15]);

    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10000FF94;
    v30[3] = &unk_1001A2090;
    v30[4] = &v31;
    [v16 enumerateObjectsUsingBlock:v30];
  }

  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    jaliscoRequestHandler = self->_jaliscoRequestHandler;
    int v19 = *((unsigned __int8 *)v32 + 24);
    *(_DWORD *)buf = 138544642;
    __int16 v36 = self;
    __int16 v37 = 1024;
    int v38 = (int)v9;
    __int16 v39 = 1024;
    unsigned int v40 = v10;
    __int16 v41 = 1024;
    int v42 = v19;
    __int16 v43 = 2114;
    v44 = v16;
    __int16 v45 = 2048;
    id v46 = jaliscoRequestHandler;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - jaliscoDatabaseVersion=%d, shouldIncludeMediaKindSong=%{BOOL}u,reloadPurchaseHistoryIncludingMediaKin dSong=%{BOOL}u, supportedMediaKinds=%{public}@, _jaliscoRequestHandler=%p",  buf,  0x32u);
  }

  if (v9)
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
    if (([v20 jaliscoNeedsUpdateForTokens] & 1) != 0 || *((_BYTE *)v32 + 24))
    {
      BOOL v21 = self->_jaliscoRequestHandler == 0LL;

      if (!v21)
      {
        __int16 v22 = self->_jaliscoRequestHandler;
        goto LABEL_13;
      }
    }

    else
    {
    }
  }

  else
  {
    __int16 v22 = self->_jaliscoRequestHandler;
    if (v22)
    {
LABEL_13:
      if (*((_BYTE *)v32 + 24))
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10000FFDC;
        v28[3] = &unk_1001A7220;
        v28[4] = self;
        id v29 = v7;
        -[JaliscoRequestHandler updateJaliscoLibraryWithClientIdentity:byAddingMediaKind:completionHandler:]( v22,  "updateJaliscoLibraryWithClientIdentity:byAddingMediaKind:completionHandler:",  v6,  1LL,  v28);
      }

      else
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472LL;
        v26[2] = sub_100010094;
        v26[3] = &unk_1001A7220;
        v26[4] = self;
        id v27 = v7;
        -[JaliscoRequestHandler updateLibraryWithClientIdentity:reason:completionHandler:]( v22,  "updateLibraryWithClientIdentity:reason:completionHandler:",  v6,  1LL,  v26);
      }

      goto LABEL_19;
    }
  }

  if (v7)
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10001014C;
    v24[3] = &unk_1001A6BE0;
    id v25 = v7;
    dispatch_async(calloutQueue, v24);
  }

- (void)_performJaliscoImportWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  jaliscoRequestHandler = self->_jaliscoRequestHandler;
  if (jaliscoRequestHandler)
  {
    -[JaliscoRequestHandler updateJaliscoLibraryWithClientIdentity:byAddingMediaKind:completionHandler:]( jaliscoRequestHandler,  "updateJaliscoLibraryWithClientIdentity:byAddingMediaKind:completionHandler:",  a3,  a4,  v8);
  }

  else
  {
    unsigned int v10 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_jaliscoRequestHandler;
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = self;
      __int16 v17 = 1024;
      int v18 = a4;
      __int16 v19 = 2048;
      BOOL v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - not reloading media purchase history by adding kind=%d, _jaliscoRequestHandler=%p",  buf,  0x1Cu);
    }

    if (v8)
    {
      calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000FF84;
      block[3] = &unk_1001A6BE0;
      id v14 = v8;
      dispatch_async(calloutQueue, block);
    }
  }
}

- (void)_performInitialSagaImportWithClientIdentity:(id)a3 allowingNoisyAuthPrompt:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
  id v11 = [v10 sagaOnDiskDatabaseRevision];

  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
  unsigned int v13 = [v12 sagaNeedsFullUpdate];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
  unsigned int v15 = [v14 sagaInitiateClientResetSync];

  if (MSVDeviceOSIsInternalInstall())
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ICDefaults standardDefaults](&OBJC_CLASS___ICDefaults, "standardDefaults"));
    unsigned int v17 = [v16 shouldForceServerToUseDAAPDebugFeature];
  }

  else
  {
    unsigned int v17 = 0;
  }

  if (self->_sagaRequestHandler && (!v11 ? (int v18 = 1) : (int v18 = v13), (v18 | v17) == 1))
  {
    __int16 v19 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544386;
      uint64_t v31 = self;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = (_DWORD)v11;
      *(_WORD *)&v33[4] = 1024;
      *(_DWORD *)&v33[6] = v13;
      *(_WORD *)&v33[10] = 1024;
      *(_DWORD *)&v33[12] = v15;
      *(_WORD *)&v33[16] = 1024;
      *(_DWORD *)&v33[18] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - performing initial saga update, sagaDatabaseVersion=%d, sagaNeedsFullUpdate=%{BOOL}u, sagaInitiateC lientResetSync=%{BOOL}u, shouldForceServerToUseDAAPDebugFeature=%{BOOL}u",  buf,  0x24u);
    }

    -[SagaRequestHandler updateLibraryWithClientIdentity:reason:allowNoisyAuthPrompt:isExplicitUserAction:completionHandler:]( self->_sagaRequestHandler,  "updateLibraryWithClientIdentity:reason:allowNoisyAuthPrompt:isExplicitUserAction:completionHandler:",  v8,  1LL,  v6,  v6,  v9);
  }

  else
  {
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    BOOL v21 = (void *)objc_claimAutoreleasedReturnValue([v20 buildVersion]);

    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
    int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 sagaLastCloudUpdateClientBuildVersion]);

    if ([v23 length]
      && (![v21 length] || (objc_msgSend(v21, "isEqualToString:", v23) & 1) != 0))
    {
      id v24 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        sagaRequestHandler = self->_sagaRequestHandler;
        *(_DWORD *)buf = 138544386;
        uint64_t v31 = self;
        __int16 v32 = 1024;
        *(_DWORD *)uint64_t v33 = (_DWORD)v11;
        *(_WORD *)&v33[4] = 2114;
        *(void *)&v33[6] = v21;
        *(_WORD *)&v33[14] = 2114;
        *(void *)&v33[16] = v23;
        __int16 v34 = 2048;
        int v35 = sagaRequestHandler;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - not performing initial saga import. sagaDatabaseVersion=%d, currentBuildVersion=%{public}@, sagaC loudUpdateClientBuildVersion=%{public}@, _sagaRequestHandler=%p",  buf,  0x30u);
      }
    }

    else
    {
      id v26 = os_log_create("com.apple.amp.itunescloudd", "CloudLibraryCoordinator");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v31 = self;
        __int16 v32 = 2114;
        *(void *)uint64_t v33 = v21;
        *(_WORD *)&v33[8] = 2114;
        *(void *)&v33[10] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - clearing last cloud update time as build versions are different currentBuildVersion=%{public}@, s agaCloudUpdateClientBuildVersion=%{public}@",  buf,  0x20u);
      }

      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler musicLibrary](self, "musicLibrary"));
      -[os_log_s setSagaLastLibraryUpdateTime:](v24, "setSagaLastLibraryUpdateTime:", 0LL);
    }

    if (v9)
    {
      calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10000FF74;
      block[3] = &unk_1001A6BE0;
      id v29 = v9;
      dispatch_async(calloutQueue, block);
    }
  }
}

- (void)_postLibraryUpdateProgressChangedForLibraryType:(int64_t)a3
{
  if (a3 == 1)
  {
    notify_post("com.apple.itunescloudd.sagaUpdateInProgressChanged");
  }

  else
  {
    v9[10] = v3;
    v9[11] = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentityStore](self, "userIdentityStore"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[BaseRequestHandler userIdentity](self, "userIdentity"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000FDAC;
    v9[3] = &unk_1001A20B8;
    v9[4] = self;
    v9[5] = a3;
    [v7 getPropertiesForUserIdentity:v8 completionHandler:v9];
  }

- (id)_prepareLibraryLoadErrorWithJaliscoError:(id)a3 sagaError:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v8 = v7;
    if (v5) {
      [v7 setObject:v5 forKey:@"ICDCloudLibraryJaliscoLibraryUpdateErrorKey"];
    }
    if (v6) {
      [v8 setObject:v6 forKey:@"ICDCloudLibrarySagaLibraryUpdateErrorKey"];
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  0LL,  v8));
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (void)_handleSagaAuthentication:(id)a3 finishedForReason:(int64_t)a4 explicitUserAction:(BOOL)a5 shouldStartInitialImport:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = v13;
  if (v12)
  {
    self->_BOOL isPendingAuthentication = 0;
    unsigned int v15 = dispatch_group_create();
    v47[0] = 0LL;
    v47[1] = v47;
    v47[2] = 0x3032000000LL;
    v47[3] = sub_10000F504;
    v47[4] = sub_10000F514;
    id v48 = 0LL;
    v45[0] = 0LL;
    v45[1] = v45;
    v45[2] = 0x3032000000LL;
    v45[3] = sub_10000F504;
    v45[4] = sub_10000F514;
    id v46 = 0LL;
    self->_havePendingSagaUpdate = 1;
    id v16 = [v12 status];
    unsigned int v17 = (void *)objc_claimAutoreleasedReturnValue([v12 error]);
    int v18 = (void *)objc_claimAutoreleasedReturnValue([v12 authenticateFailureCode]);
    id v26 = [v18 integerValue];

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 clientIdentity]);
    BOOL v20 = &off_10013B000;
    if (v16 != (id)1)
    {
LABEL_13:
      accessQueue = (dispatch_queue_s *)self->_accessQueue;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = *((void *)v20 + 38);
      v27[2] = sub_10000F83C;
      id v27[3] = &unk_1001A2158;
      v27[4] = self;
      id v28 = v19;
      BOOL v36 = v9;
      id v33 = v16;
      int64_t v34 = a4;
      uint64_t v31 = v45;
      __int16 v32 = v47;
      id v35 = v26;
      id v29 = v17;
      id v30 = v14;
      id v24 = v17;
      id v25 = v19;
      dispatch_group_notify(v15, accessQueue, v27);

      _Block_object_dispose(v45, 8);
      _Block_object_dispose(v47, 8);

      goto LABEL_14;
    }

    dispatch_group_enter(v15);
    if (!a4 || v9)
    {
      self->_didManuallyReloadCloudLibrary = 1;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472LL;
      v41[2] = sub_10000F51C;
      v41[3] = &unk_1001A20E0;
      v41[4] = self;
      __int16 v43 = v47;
      int64_t v44 = a4;
      int v42 = v15;
      -[ICDCloudMusicLibraryRequestHandler _performJaliscoImportWithClientIdentity:byAddingMediaKind:completionHandler:]( self,  "_performJaliscoImportWithClientIdentity:byAddingMediaKind:completionHandler:",  v19,  1LL,  v41);
      BOOL v21 = v42;
    }

    else
    {
      if (!v8)
      {
        dispatch_group_leave(v15);
        goto LABEL_12;
      }

      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472LL;
      void v37[2] = sub_10000F6C0;
      v37[3] = &unk_1001A20E0;
      v37[4] = self;
      __int16 v39 = v47;
      int64_t v40 = a4;
      int v38 = v15;
      -[ICDCloudMusicLibraryRequestHandler _performInitialJaliscoImportWithClientIdentity:completion:]( self,  "_performInitialJaliscoImportWithClientIdentity:completion:",  v19,  v37);
      BOOL v21 = v38;
    }

LABEL_12:
    BOOL v20 = &off_10013B000;
    goto LABEL_13;
  }

  if (v13)
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10000F4A0;
    block[3] = &unk_1001A6BE0;
    __int16 v50 = (dispatch_group_s *)v13;
    dispatch_async(calloutQueue, block);
    unsigned int v15 = v50;
LABEL_14:
  }
}

- (id)_cloudSourcesToRemoveForReason:(int64_t)a3
{
  if (((1LL << (a3 + 11)) & 0x76A) == 0)
  {
    if (a3 == -11)
    {
      uint64_t v3 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  &off_1001B39A0,  &off_1001B3988,  &off_1001B39E8,  0LL);
      goto LABEL_4;
    }

- (void).cxx_destruct
{
}

+ (id)handlers
{
  if (qword_1001DB598 != -1) {
    dispatch_once(&qword_1001DB598, &stru_1001A1A30);
  }
  return (id)qword_1001DB590;
}

+ (id)handler
{
  v2 = (void *)objc_opt_new(&OBJC_CLASS___ICConnectionConfiguration, a2);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ICDCloudMusicLibraryRequestHandler,  "handlerForConfiguration:",  v2));

  return v3;
}

@end