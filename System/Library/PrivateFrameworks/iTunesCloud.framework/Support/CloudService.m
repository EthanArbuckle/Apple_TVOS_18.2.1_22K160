@interface CloudService
- (CloudService)initWithHandlerProvider:(id)a3;
- (ICDHandlerProviding)handlerProvider;
- (NSOperationQueue)operationQueue;
- (NSString)requestingBundleID;
- (void)_updateSagaLibraryWithReason:(int64_t)a3 allowNoisyAuthPrompt:(BOOL)a4 forConfiguration:(id)a5 completionHandler:(id)a6;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 configuration:(id)a7 completion:(id)a8;
- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 configuration:(id)a5 completion:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 configuration:(id)a6 completion:(id)a7;
- (void)addStorePlaylistWithGlobalID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)authenticateForConfiguration:(id)a3 startInitialImport:(BOOL)a4 enableCloudLibraryPolicy:(int64_t)a5 isExplicitUserAction:(BOOL)a6 completion:(id)a7;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 configuration:(id)a6 completion:(id)a7;
- (void)deauthenticateForConfiguration:(id)a3 completion:(id)a4;
- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4;
- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3 configuration:(id)a4;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3 configuration:(id)a4;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3 configuration:(id)a4;
- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3 configuration:(id)a4;
- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3 configuration:(id)a4;
- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3 configuration:(id)a4;
- (void)disableCloudLibraryWithReason:(int64_t)a3 completion:(id)a4;
- (void)editCollaborationWithPersistentID:(int64_t)a3 configuration:(id)a4 properties:(id)a5 trackEdits:(id)a6 completion:(id)a7;
- (void)endCollaborationWithPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 configuration:(id)a7 completionHandler:(id)a8;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 configuration:(id)a7 completionHandler:(id)a8;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 configuration:(id)a6 completionHandler:(id)a7;
- (void)fetchEnhancedAudioOfflineKeys;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)isSagaAuthenticatedForConfiguration:(id)a3 completion:(id)a4;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 configuration:(id)a5 completion:(id)a6;
- (void)listCloudServerOperations;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadBooksForStoreIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadIsJaliscoUpdateInProgressForConfiguration:(id)a3 completion:(id)a4;
- (void)loadIsSagaUpdateInProgressForConfiguration:(id)a3 completion:(id)a4;
- (void)loadIsUpdateInProgressForConfiguration:(id)a3 completion:(id)a4;
- (void)loadJaliscoUpdateProgressForConfiguration:(id)a3 completion:(id)a4;
- (void)loadLastKnownEnableICMLErrorStatusForConfiguration:(id)a3 completion:(id)a4;
- (void)loadMissingArtworkForConfiguration:(id)a3;
- (void)loadSagaUpdateProgressForConfiguration:(id)a3 completion:(id)a4;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)loadUpdateProgressForConfiguration:(id)a3 completion:(id)a4;
- (void)processPendingKeyInvalidations;
- (void)publishPlaylistWithSagaID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)refreshEnhancedAudioSharedKeys;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)removeItemsWithSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)removeJaliscoLibraryForConfiguration:(id)a3 completion:(id)a4;
- (void)removePlaylistsWithSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 configuration:(id)a6 completion:(id)a7;
- (void)sdk_addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 configuration:(id)a4 completion:(id)a5;
- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 configuration:(id)a6 completion:(id)a7;
- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 configuration:(id)a6 completion:(id)a7;
- (void)setAlbumArtistProperties:(id)a3 forAlbumArtistPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)setAlbumEntityProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 configuration:(id)a5 completion:(id)a6;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 configuration:(id)a6 completion:(id)a7;
- (void)setPreferredVideoQuality:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)setRequestingBundleID:(id)a3;
- (void)setupInitialJaliscoPoolingForConfiguration:(id)a3;
- (void)setupInitialSagaPoolingForConfiguration:(id)a3;
- (void)updateArtistHeroImagesForConfiguration:(id)a3;
- (void)updateJaliscoLibraryWithReason:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)updatePinnedSubscribedPlaylistsWithConfiguration:(id)a3 completion:(id)a4;
- (void)updateSagaLibraryWithReason:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 configuration:(id)a5 completion:(id)a6;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5;
- (void)uploadCloudItemPropertiesForConfiguration:(id)a3 completion:(id)a4;
- (void)uploadCloudPlaylistPropertiesForConfiguration:(id)a3 completion:(id)a4;
@end

@implementation CloudService

- (CloudService)initWithHandlerProvider:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CloudService;
  v5 = -[CloudService init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_handlerProvider, v4);
    v7 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v7;

    -[NSOperationQueue setName:]( v6->_operationQueue,  "setName:",  @"com.apple.iTunesCloud.CloudService.operationQueue");
    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[NSOperationQueue setQualityOfService:](v6->_operationQueue, "setQualityOfService:", 25LL);
  }

  return v6;
}

- (void)setupInitialSagaPoolingForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v16 = 0LL;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handlerWithType:0 configuration:v4 error:&v16]);
  id v7 = v16;

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    os_log_t v9 = (os_log_t)objc_claimAutoreleasedReturnValue([v4 userIdentityStore]);
    objc_super v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CloudService %p - [BecomeActive::Cloud] - Setting up Saga Pooling for configuration=%{public}@.",  buf,  0x16u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008A598;
    v12[3] = &unk_1001A6068;
    id v13 = v8;
    v14 = self;
    id v15 = v4;
    id v11 = v8;
    -[os_log_s getPropertiesForUserIdentity:completionHandler:]( v9,  "getPropertiesForUserIdentity:completionHandler:",  v11,  v12);
  }

  else
  {
    os_log_t v9 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v18 = self;
      __int16 v19 = 2114;
      id v20 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CloudService %p - [BecomeActive::Cloud] - Unable to service cloud library request - error=%{public}@.",  buf,  0x16u);
    }
  }
}

- (void)updateSagaLibraryWithReason:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  os_log_t v9 = (void (**)(id, id))a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 updateSagaLibraryWithClientIdentity:v13 forReason:a3 allowNoisyAuthPrompt:0 isExplicitUserAction:0 completionHandler:v9];
  }

  else
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v17 = self;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - updateSagaLibraryWithReason (%d) - Unable to service request - error=%{public}@",  buf,  0x1Cu);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)setPreferredVideoQuality:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v7 = (void (**)(id, void))a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 userIdentity]);
  id v9 = (id)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v8));

  objc_msgSend(v9, "icd_setPreferredVideoQuality:", a3);
  v7[2](v7, 0LL);
}

- (void)isSagaAuthenticatedForConfiguration:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentityStore]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 userIdentity]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10008A510;
  v10[3] = &unk_1001A3E80;
  id v11 = v5;
  id v9 = v5;
  [v7 getPropertiesForUserIdentity:v8 completionHandler:v10];
}

- (void)updateJaliscoLibraryWithReason:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 updateJaliscoLibraryWithClientIdentity:v13 forReason:a3 completionHandler:v9];
  }

  else
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v17 = self;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - updateJaliscoLibraryWithReason - Unable to service request for purchases/reason=%d - error=%{public}@",  buf,  0x1Cu);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)deauthenticateForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v13 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v6 error:&v13]);
  id v10 = v13;

  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentity]);
    [v9 disableCloudLibraryWithClientIdentity:v11 reason:-7 completionHandler:v7];
  }

  else
  {
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CloudService %p - deauthenticateForConfiguration - Unable to service request - error=%{public}@",  buf,  0x16u);
    }

    if (v7) {
      v7[2](v7, v10);
    }
  }
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 setCloudAddToPlaylistBehavior:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v17 = self;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - setCloudAddToPlaylistBehavior (%d) - Unable to service request - error=%{public}@",  buf,  0x1Cu);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 forConfiguration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 setCloudFavoriteSongAddToLibraryBehavior:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v17 = self;
      __int16 v18 = 1024;
      int v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - setCloudFavoriteSongAddToLibraryBehavior (%d) - Unable to service request - error=%{public}@",  buf,  0x1Cu);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)loadIsSagaUpdateInProgressForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v14]);

  id v10 = v14;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008A40C;
    v12[3] = &unk_1001A3EA8;
    void v12[4] = self;
    id v13 = v6;
    [v9 isUpdatingCloudLibraryWithCompletion:v12];
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadIsSagaUpdateInProgressForConfiguration: - Unable to service cloud library request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
  }
}

- (void)loadSagaUpdateProgressForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v15]);

  id v10 = v15;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008A330;
    v12[3] = &unk_1001A3ED0;
    void v12[4] = self;
    int v14 = 0;
    id v13 = v6;
    [v9 updateProgressForLibraryType:1 completionHandler:v12];

    if (v6) {
LABEL_3:
    }
      (*((void (**)(id, id, float))v6 + 2))(v6, v10, 0.0);
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v17 = self;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadSagaUpdateProgressForConfiguration: - Unable to service cloud library request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      goto LABEL_3;
    }
  }
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importItemArtworkForSagaID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    int v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - importItemArtworkForSagaID (sagaID=%lld) - Unable to service request - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)importScreenshotForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importScreenshotForSagaID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    int v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - importScreenshotForSagaID (sagaID=%lld) - Unable to service request - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importContainerArtworkForSagaID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    int v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - importContainerArtworkForSagaID (sagaID=%lld) - Unable to service request - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeItemArtworkForSagaID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeItemArtworkForSagaID (%llu) - Unable to service cloud library request - error=%{public}@",  buf,  0x20u);
    }
  }
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeScreenshotForSagaID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeScreenshotForSagaID (%llu) - Unable to service cloud library request - error=%{public}@",  buf,  0x20u);
    }
  }
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeContainerArtworkForSagaID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeContainerArtworkForSagaID (%llu) - Unable to service cloud library request - error=%{public}@",  buf,  0x20u);
    }
  }
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008A234;
    v16[3] = &unk_1001A3EF8;
    v16[4] = self;
    id v17 = v10;
    [v12 loadArtworkInfoForSagaIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    unint64_t v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v20 = self;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadArtworkInfoForSagaIDs (%{public}@) - Unable to service cloud library request - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008A138;
    v16[3] = &unk_1001A3EF8;
    v16[4] = self;
    id v17 = v10;
    [v12 loadArtworkInfoForContainerSagaIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    unint64_t v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v20 = self;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadArtworkInfoForContainerSagaIDs (%{public}@) - Unable to service cloud library request - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008A03C;
    v16[3] = &unk_1001A3EF8;
    v16[4] = self;
    id v17 = v10;
    [v12 loadScreenshotInfoForSagaIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    unint64_t v15 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v20 = self;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadScreenshotInfoForSagaIDs (%{public}@) - Unable to service cloud library request - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v17 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v17]);
  id v12 = v17;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10008A030;
    v15[3] = &unk_1001A3F20;
    id v16 = v9;
    [v11 loadGeniusItemsForSagaID:a3 clientIdentity:v13 completionHandler:v15];
  }

  else
  {
    __int16 v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v19 = self;
      __int16 v20 = 2048;
      unint64_t v21 = a3;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadGeniusItemsForSagaID (%llu) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v12);
    }
  }
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemSagaIDs:(id)a5 itemSagaIDs:(id)a6 configuration:(id)a7 completion:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v26 = 0LL;
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 handlerWithType:0 configuration:v17 error:&v26]);
  id v21 = v26;

  if (v20)
  {
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v17 clientIdentity]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10008A024;
    v24[3] = &unk_1001A3F48;
    id v25 = v18;
    [v20 addGeniusPlaylistWithPersistentID:a3 name:v14 seedItemIDs:v15 itemIDs:v16 clientIdentity:v22 completionHandler:v24];
  }

  else
  {
    id v23 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      v28 = self;
      __int16 v29 = 2048;
      int64_t v30 = a3;
      __int16 v31 = 2114;
      id v32 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "CloudService %p - addGeniusPlaylistWithPersistentID (%lld) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v18) {
      (*((void (**)(id, void, id))v18 + 2))(v18, 0LL, v21);
    }
  }
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v23 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v14 error:&v23]);
  id v18 = v23;

  if (v17)
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 clientIdentity]);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10008A018;
    v21[3] = &unk_1001A3F48;
    id v22 = v15;
    [v17 createPlaylistWithPersistentID:a3 properties:v12 trackList:v13 clientIdentity:v19 completionHandler:v21];
  }

  else
  {
    __int16 v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v25 = self;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      __int16 v28 = 2114;
      id v29 = v12;
      __int16 v30 = 2114;
      id v31 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CloudService %p - createPlaylistWithPersistentID (%lld, properties=%{public}@): - Unable to service request for cloud library - error=%{public}@",  buf,  0x2Au);
    }

    if (v15) {
      (*((void (**)(id, void, id))v15 + 2))(v15, 0LL, v18);
    }
  }
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, id))a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v14 error:&v21]);
  id v18 = v21;

  if (v17)
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 clientIdentity]);
    [v17 setPlaylistProperties:v12 trackList:v13 forPlaylistPersistentID:a5 clientIdentity:v19 completionHandler:v15];
  }

  else
  {
    __int16 v20 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v23 = self;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2048;
      int64_t v27 = a5;
      __int16 v28 = 2114;
      id v29 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CloudService %p - setPlaylistProperties (properties=%{public}@, forPlaylistPersistentID=%lld) - Unable to servic e request for purchases - error=%{public}@",  buf,  0x2Au);
    }

    if (v15) {
      v15[2](v15, v18);
    }
  }
}

- (void)sdk_setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, id))a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v22 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v14 error:&v22]);
  id v18 = v22;

  if (v17)
  {
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v14 clientIdentity]);
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService requestingBundleID](self, "requestingBundleID"));
    [v17 setPlaylistProperties:v12 trackList:v13 forPlaylistPersistentID:a5 clientIdentity:v19 requestingBundleID:v20 completionHandler:v15];
  }

  else
  {
    id v21 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      __int16 v24 = self;
      __int16 v25 = 2114;
      id v26 = v12;
      __int16 v27 = 2048;
      int64_t v28 = a5;
      __int16 v29 = 2114;
      id v30 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "CloudService %p - sdk_setPlaylistProperties (properties=%{public}@, forPlaylistPersistentID=%lld) - Unable to se rvice request for purchases - error=%{public}@",  buf,  0x2Au);
    }

    if (v15) {
      v15[2](v15, v18);
    }
  }
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, id))a7;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v20 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 handlerWithType:0 configuration:v13 error:&v20]);
  id v17 = v20;

  if (v16)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 clientIdentity]);
    [v16 addStoreItemWithAdamID:a3 referral:v12 toPlaylistWithPersistentID:a5 clientIdentity:v18 completionHandler:v14];
  }

  else
  {
    unint64_t v19 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v22 = self;
      __int16 v23 = 2048;
      int64_t v24 = a3;
      __int16 v25 = 2048;
      int64_t v26 = a5;
      __int16 v27 = 2114;
      id v28 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CloudService %p - addStoreItemWithAdamIDToPlaylistWithPersistentID (adamID=%lld, persistentID=%lld) - Unable to service request for purchases - error=%{public}@",  buf,  0x2Au);
    }

    if (v14) {
      v14[2](v14, v17);
    }
  }
}

- (void)addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v17 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 handlerWithType:0 configuration:v10 error:&v17]);
  id v14 = v17;

  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 clientIdentity]);
    [v13 addItemWithSagaID:a3 toPlaylistWithPersistentID:a4 clientIdentity:v15 completionHandler:v11];
  }

  else
  {
    id v16 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      unint64_t v19 = self;
      __int16 v20 = 2048;
      int64_t v21 = a3;
      __int16 v22 = 2048;
      int64_t v23 = a4;
      __int16 v24 = 2114;
      id v25 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "CloudService %p - addItemWithSagaID (sagaID=%lld, persistentID=%lld) - Unable to service request for purchases - error=%{public}@",  buf,  0x2Au);
    }

    if (v11) {
      v11[2](v11, v14);
    }
  }
}

- (void)publishPlaylistWithSagaID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v17 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v17]);
  id v12 = v17;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10008A00C;
    v15[3] = &unk_1001A3F70;
    id v16 = v9;
    [v11 publishPlaylistWithSagaID:a3 clientIdentity:v13 completionHandler:v15];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      unint64_t v19 = self;
      __int16 v20 = 2048;
      int64_t v21 = a3;
      __int16 v22 = 2114;
      id v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - publishPlaylistWithSagaID (%lld) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      (*((void (**)(id, void, void, id))v9 + 2))(v9, 0LL, 0LL, v12);
    }
  }
}

- (void)removePlaylistsWithSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v16 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v16]);
  id v13 = v16;

  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    [v12 removePlaylistsWithSagaIDs:v8 clientIdentity:v14 completionHandler:v10];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - removePlaylistsWithSagaIDs (%{public}@) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      v10[2](v10, v13);
    }
  }
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 uploadArtworkForPlaylistWithPersistentID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v17 = self;
      __int16 v18 = 2048;
      int64_t v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - uploadArtworkForPlaylistWithPersistentID (%lld) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 configuration:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v20]);
  id v15 = v20;

  if (v14)
  {
    uint64_t v16 = 11LL;
    if (v8) {
      uint64_t v16 = 12LL;
    }
    if (v10) {
      uint64_t v17 = v16;
    }
    else {
      uint64_t v17 = 10LL;
    }
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    [v14 updateSubscribedPlaylistsWithSagaIDs:v10 ignoreMinRefreshInterval:v8 requestReason:v17 pinnedOnly:0 clientIdentity:v18 completionHandler:v12];
  }

  else
  {
    int64_t v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v22 = self;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CloudService %p - updateSubscribedPlaylistsWithSagaIDs (%{public}@) - Unable to service request for cloud librar y - error=%{public}@",  buf,  0x20u);
    }

    if (v12) {
      v12[2](v12, v15);
    }
  }
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v20 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v20]);
  id v15 = v20;

  if (v14)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10008A000;
    v18[3] = &unk_1001A3F98;
    id v19 = v12;
    [v14 addStoreItemWithAdamID:a3 referral:v10 clientIdentity:v16 completionHandler:v18];
  }

  else
  {
    uint64_t v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v22 = self;
      __int16 v23 = 2048;
      int64_t v24 = a3;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - addStoreItemWithAdamID (%lld) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v12) {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0LL, v15);
    }
  }
}

- (void)addStorePlaylistWithGlobalID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100089FF4;
    v16[3] = &unk_1001A3F98;
    id v17 = v10;
    [v12 addStorePlaylistWithGlobalID:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - addStorePlaylistWithGlobalID (%{public}@) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v13);
    }
  }
}

- (void)removeItemsWithSagaIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v16 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v16]);
  id v13 = v16;

  if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    [v12 removeItemsWithSagaIDs:v8 clientIdentity:v14 completionHandler:v10];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - removeItemsWithSagaIDs (%{public}@) - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      v10[2](v10, v13);
    }
  }
}

- (void)loadLastKnownEnableICMLErrorStatusForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v14]);

  id v10 = v14;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100089FE0;
    v12[3] = &unk_1001A3FC0;
    id v13 = v6;
    [v9 loadLastKnownEnableICMLStatusWithCompletionHandler:v12];
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadLastKnownEnableICMLErrorStatusForConfiguration - Unable to service request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      (*((void (**)(id, void, id))v6 + 2))(v6, 0LL, v10);
    }
  }
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v18]);
  id v15 = v18;

  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    [v14 setItemProperties:v10 forSagaID:a4 clientIdentity:v16 completionHandler:v12];
  }

  else
  {
    __int16 v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - setItemProperties: (sagaID=%llu, properties=%{public}@) - Unable to service request - error=%{public}@",  buf,  0x2Au);
    }

    if (v12) {
      v12[2](v12, v15);
    }
  }
}

- (void)uploadCloudItemPropertiesForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v13 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v6 error:&v13]);
  id v10 = v13;

  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentity]);
    [v9 updateItemPlayDataWithClientIdentity:v11 completionHandler:v7];
  }

  else
  {
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CloudService %p - uploadCloudItemPropertiesForConfiguration - Unable to service request - error=%{public}@",  buf,  0x16u);
    }

    if (v7) {
      v7[2](v7, v10);
    }
  }
}

- (void)uploadCloudPlaylistPropertiesForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v13 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v6 error:&v13]);
  id v10 = v13;

  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentity]);
    [v9 updatePlaylistPlayDataWithClientIdentity:v11 completionHandler:v7];
  }

  else
  {
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CloudService %p - uploadCloudPlaylistPropertiesForConfiguration - Unable to service request - error=%{public}@",  buf,  0x16u);
    }

    if (v7) {
      v7[2](v7, v10);
    }
  }
}

- (void)setAlbumProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v18]);
  id v15 = v18;

  if (v14)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    [v14 setAlbumProperties:v10 forItemsWithAlbumPersistentID:a4 clientIdentity:v16 completionHandler:v12];
  }

  else
  {
    id v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - setAlbumProperties: (albumID=%llu, properties=%{public}@) - Unable to service request - error=%{public}@",  buf,  0x2Au);
    }

    if (v12) {
      v12[2](v12, v15);
    }
  }
}

- (void)setAlbumEntityProperties:(id)a3 forAlbumPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v18]);
  id v15 = v18;

  if (v14)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    [v14 setAlbumEntityProperties:v10 withAlbumPersistentID:a4 clientIdentity:v16 completionHandler:v12];
  }

  else
  {
    id v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - setAlbumProperties: (albumID=%llu, properties=%{public}@) - Unable to service request - error=%{public}@",  buf,  0x2Au);
    }

    if (v12) {
      v12[2](v12, v15);
    }
  }
}

- (void)setAlbumArtistProperties:(id)a3 forAlbumArtistPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v18]);
  id v15 = v18;

  if (v14)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    [v14 setAlbumArtistProperties:v10 withArtistPersistentID:a4 clientIdentity:v16 completionHandler:v12];
  }

  else
  {
    id v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = a4;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - setAlbumArtistProperties: (albumArtistID=%llu, properties=%{public}@) - Unable to service requ est for purchases - error=%{public}@",  buf,  0x2Au);
    }

    if (v12) {
      v12[2](v12, v15);
    }
  }
}

- (void)sdk_createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 configuration:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void, id))a7;
  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v22 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v14 error:&v22]);
  id v18 = v22;

  if (v17)
  {
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService requestingBundleID](self, "requestingBundleID"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 clientIdentity]);
    [v17 createPlaylistWithPersistentID:a3 properties:v12 trackList:v13 requestingBundleID:v19 clientIdentity:v20 completionHandler:v15];
  }

  else
  {
    __int16 v21 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v24 = self;
      __int16 v25 = 2048;
      int64_t v26 = a3;
      __int16 v27 = 2114;
      id v28 = v12;
      __int16 v29 = 2114;
      id v30 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "CloudService %p - sdk_createPlaylistWithPersistentID (%lld, properties=%{public}@) - Unable to service request f or cloud library - error=%{public}@",  buf,  0x2Au);
    }

    if (v15) {
      v15[2](v15, 0LL, v18);
    }
  }
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v21]);
  id v15 = v21;

  if (v14)
  {
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService requestingBundleID](self, "requestingBundleID"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100089FD4;
    v19[3] = &unk_1001A3F98;
    id v20 = v12;
    [v14 addStoreItemWithOpaqueID:v10 toPlaylistWithPersistentID:a4 requestingBundleID:v16 clientIdentity:v17 completionHandler:v19];
  }

  else
  {
    id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "CloudService %p - sdk_addStoreItemWithOpaqueID: - Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v12) {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0LL, v15);
    }
  }
}

- (void)sdk_addItemWithSagaID:(int64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = (void (**)(id, id))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 handlerWithType:0 configuration:v10 error:&v18]);
  id v14 = v18;

  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService requestingBundleID](self, "requestingBundleID"));
    __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 clientIdentity]);
    [v13 addItemWithSagaID:a3 toPlaylistWithPersistentID:a4 requestingBundleID:v15 clientIdentity:v16 completionHandler:v11];
  }

  else
  {
    id v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2048;
      int64_t v22 = a3;
      __int16 v23 = 2048;
      int64_t v24 = a4;
      __int16 v25 = 2114;
      id v26 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - sdk_addItemWithSagaID (sagaID=%lld, persistentID=%lld) - Unable to service request for purchas es - error=%{public}@",  buf,  0x2Au);
    }

    if (v11) {
      v11[2](v11, v14);
    }
  }
}

- (void)sdk_addStoreItemWithOpaqueID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___ICDCloudServiceStatusMonitor);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100089D4C;
  v15[3] = &unk_1001A3FE8;
  void v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  -[ICDCloudServiceStatusMonitor requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:]( v11,  "requestCapabilitiesWithPrivacyPromptPolicy:completionHandler:",  1LL,  v15);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 configuration:(id)a7 completionHandler:(id)a8
{
  id v14 = a6;
  id v15 = (void (**)(id, void *))a8;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v22 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handlerWithType:0 configuration:v16 error:&v22]);

  id v19 = v22;
  if (v18)
  {
    [v18 favoriteEntityWithPersistentID:a3 storeID:a4 entityType:a5 time:v14 completionHandler:v15];
  }

  else
  {
    id v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      int64_t v24 = self;
      __int16 v25 = 2048;
      int64_t v26 = a4;
      __int16 v27 = 2114;
      id v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CloudService %p - favoriteEntityWithStoreID=%lld: - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v15)
    {
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7002LL,  0LL));
      v15[2](v15, v21);
    }
  }
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a7;
  id v15 = a6;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v15 error:&v21]);

  id v18 = v21;
  if (v17)
  {
    [v17 favoritePlaylistWithPersistentID:a3 globalID:v12 time:v13 completionHandler:v14];
  }

  else
  {
    id v19 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CloudService %p - favoritePlaylistWithGlobalID=%{public}@: - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v14)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7002LL,  0LL));
      v14[2](v14, v20);
    }
  }
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 configuration:(id)a7 completionHandler:(id)a8
{
  id v14 = a6;
  id v15 = (void (**)(id, void *))a8;
  id v16 = a7;
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v22 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handlerWithType:0 configuration:v16 error:&v22]);

  id v19 = v22;
  if (v18)
  {
    [v18 favoriteEntityWithPersistentID:a3 sagaID:a4 entityType:a5 time:v14 completionHandler:v15];
  }

  else
  {
    id v20 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v24 = self;
      __int16 v25 = 2048;
      int64_t v26 = a4;
      __int16 v27 = 2114;
      id v28 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CloudService %p - favoriteEntityWithSagaID=%lld - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v15)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7002LL,  0LL));
      v15[2](v15, v21);
    }
  }
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a7;
  id v15 = a6;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v15 error:&v21]);

  id v18 = v21;
  if (v17)
  {
    [v17 favoriteAlbumWithPersistentID:a3 cloudLibraryID:v12 time:v13 completionHandler:v14];
  }

  else
  {
    id v19 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CloudService %p - favoriteAlbumWithCloudID=%{public}@ - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v14)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7002LL,  0LL));
      v14[2](v14, v20);
    }
  }
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 configuration:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = (void (**)(id, void *))a7;
  id v15 = a6;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v15 error:&v21]);

  id v18 = v21;
  if (v17)
  {
    [v17 favoriteArtistWithPersistentID:a3 cloudLibraryID:v12 time:v13 completionHandler:v14];
  }

  else
  {
    id v19 = os_log_create("com.apple.amp.itunescloudd", "Default");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v12;
      __int16 v26 = 2114;
      id v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CloudService %p - favoriteArtistWithCloudID=%{public}@ - Unable to service request for cloud library - error=%{public}@",  buf,  0x20u);
    }

    if (v14)
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7002LL,  0LL));
      v14[2](v14, v20);
    }
  }
}

- (void)setupInitialJaliscoPoolingForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handlerWithType:0 configuration:v4 error:&v21]);
  id v7 = v21;

  if (!v6 || v7)
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "CloudService %p - [BecomeActive::Jalisco] - Unable to service purchase request - error=%{public}@.",  buf,  0x16u);
    }
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
    unsigned __int8 v9 = [v8 isAudioAccessory];

    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 userIdentity]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v11));

    id v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v23 = self;
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "CloudService %p - [BecomeActive::Jalisco] - Setting up Jalisco Pooling for configuration=%{public}@.",  buf,  0x16u);
    }

    if ((v9 & 1) == 0 && ![v12 jaliscoOnDiskDatabaseRevision]) {
      -[CloudService updateJaliscoLibraryWithReason:forConfiguration:completion:]( self,  "updateJaliscoLibraryWithReason:forConfiguration:completion:",  1LL,  v4,  &stru_1001A4008);
    }
    id v14 = -[ICStoreRequestContext initWithIdentity:]( objc_alloc(&OBJC_CLASS___ICStoreRequestContext),  "initWithIdentity:",  v10);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000898FC;
    v17[3] = &unk_1001A3E58;
    id v18 = v12;
    id v19 = self;
    id v20 = v4;
    id v16 = v12;
    [v15 getBagForRequestContext:v14 withCompletionHandler:v17];
  }
}

- (void)removeJaliscoLibraryForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v6 error:&v15]);
  id v10 = v15;

  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentity]);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000898F0;
    v13[3] = &unk_1001A50C0;
    id v14 = v7;
    [v9 removeLibraryWithClientIdentity:v11 completion:v13];
  }

  else
  {
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CloudService %p - removeJaliscoLibraryForConfiguration - Unable to service purchase request - error=%{public}@",  buf,  0x16u);
    }

    if (v7) {
      (*((void (**)(id, id))v7 + 2))(v7, v10);
    }
  }
}

- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v17 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v17]);
  id v12 = v17;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000898E4;
    v15[3] = &unk_1001A5880;
    id v16 = v9;
    [v11 isMediaKindDisabledForJaliscoLibrary:a3 clientIdentity:v13 completion:v15];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = self;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - isMediaKindDisabledForJaliscoLibrary: - Unable to service purchase request - error=%{public}@",  buf,  0x16u);
    }

    if (v9) {
      (*((void (**)(id, void, id))v9 + 2))(v9, 0LL, v12);
    }
  }
}

- (void)loadIsJaliscoUpdateInProgressForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v14]);

  id v10 = v14;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000897F8;
    v12[3] = &unk_1001A3EA8;
    void v12[4] = self;
    id v13 = v6;
    [v9 isUpdatingCloudLibraryWithCompletion:v12];
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadIsJaliscoUpdateInProgressForConfiguration: - Unable to service purchase request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
  }
}

- (void)loadJaliscoUpdateProgressForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v15]);

  id v10 = v15;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008971C;
    v12[3] = &unk_1001A3ED0;
    void v12[4] = self;
    int v14 = 0;
    id v13 = v6;
    [v9 updateProgressForLibraryType:0 completionHandler:v12];

    if (v6) {
LABEL_3:
    }
      (*((void (**)(id, id, float))v6 + 2))(v6, v10, 0.0);
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v17 = self;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadJaliscoUpdateProgressForConfiguration: - Unable to service purchase request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      goto LABEL_3;
    }
  }
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importItemArtworkForPurchaseHistoryID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    int v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - importItemArtworkForPurchaseHistoryID(%llu): - Unable to service purchase request - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importScreenshotForPurchaseHistoryID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    int v14 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v17 = self;
      __int16 v18 = 2048;
      unint64_t v19 = a3;
      __int16 v20 = 2114;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - importScreenshotForPurchaseHistoryID(%llu): - Unable to service purchase request - error=%{public}@",  buf,  0x20u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeItemArtworkForPurchaseHistoryID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeItemArtworkForPurchaseHistoryID(%llu) - Unable to service purchase request - error=%{public}@",  buf,  0x20u);
    }
  }
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeScreenshotForPurchaseHistoryID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v13 = self;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      __int16 v16 = 2114;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeScreenshotForPurchaseHistoryID(%llu) - Unable to service purchase request - error=%{public}@",  buf,  0x20u);
    }
  }
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100089628;
    v16[3] = &unk_1001A3EF8;
    void v16[4] = self;
    id v17 = v10;
    [v12 loadArtworkInfoForPurchaseHistoryIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    unint64_t v15 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v20 = self;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadArtworkInfoForPurchaseHistoryIDs (%{public}@) Unable to service request for purchases - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008952C;
    v16[3] = &unk_1001A3EF8;
    void v16[4] = self;
    id v17 = v10;
    [v12 loadScreenshotInfoForPurchaseHistoryIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    unint64_t v15 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      __int16 v20 = self;
      __int16 v21 = 2114;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadScreenshotInfoForPurchaseHistoryIDs (%{public}@) Unable to service request for purchases - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadBooksForStoreIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 userIdentity]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 accountDSID]);

  if ([v12 length])
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
    id v23 = 0LL;
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v9 error:&v23]);
    id v15 = v23;

    if (v14)
    {
      __int16 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_100089520;
      v21[3] = &unk_1001A3F20;
      id v22 = v10;
      [v14 loadBooksForStoreIDs:v8 clientIdentity:v16 withCompletionHandler:v21];
    }

    else
    {
      __int16 v20 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218498;
        id v25 = self;
        __int16 v26 = 2114;
        id v27 = v8;
        __int16 v28 = 2114;
        id v29 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadBooksForStoreIDs %{public}@ - Unable to service request for purchases - error=%{public}@",  buf,  0x20u);
      }

      if (v10) {
        (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v15);
      }
      __int16 v14 = 0LL;
    }
  }

  else
  {
    id v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      id v25 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadBooksForStoreIDs: - Unable to process cloud request [missing DSID]",  buf,  0xCu);
    }

    NSErrorUserInfoKey v30 = NSDebugDescriptionErrorKey;
    id v15 = (id)objc_claimAutoreleasedReturnValue([v9 userIdentity]);
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"loadBooksForStoreIDs: - Invalid user identity [missing DSID] - userIdentity=%@",  v15));
    id v31 = v14;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v31,  &v30,  1LL));
    unint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7400LL,  v18));
    (*((void (**)(id, void, void *))v10 + 2))(v10, 0LL, v19);
  }
}

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v16 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v16]);
  id v13 = v16;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    [v12 hideItemsWithPurchaseHistoryIDs:v8 clientIdentity:v14 completionHandler:v10];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218498;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v8;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p - hideItemsWithPurchaseHistoryIDs: (purchaseHistoryIDs=%{public}@) - Unable to service request f or purchases - error=%{public}@",  buf,  0x20u);
    }

    if (v10) {
      v10[2](v10, v13);
    }
  }
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v18]);
  id v15 = v18;

  if (v14)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 clientIdentity]);
    [v14 setItemProperties:v10 forPurchaseHistoryID:a4 clientIdentity:v16 completionHandler:v12];
  }

  else
  {
    id v17 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218754;
      id v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = a4;
      __int16 v23 = 2114;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "CloudService %p - setItemProperties: (purchaseHistoryID=%llu, properties=%{public}@) - Unable to service request for purchases - error=%{public}@",  buf,  0x2Au);
    }

    if (v12) {
      v12[2](v12, v15);
    }
  }
}

- (void)deprioritizeArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:1 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeArtistHeroImageForPersistentID: - Unable to service artist image request - error=%{public}@",  buf,  0x16u);
    }
  }

  else
  {
    [v8 deprioritizeArtistHeroImageForPersistentID:a3];
  }
}

- (void)deprioritizeAlbumArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:1 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v9)
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p - deprioritizeAlbumArtistHeroImageForPersistentID: - Unable to service artist image request - error=%{public}@",  buf,  0x16u);
    }
  }

  else
  {
    [v8 deprioritizeAlbumArtistHeroImageForPersistentID:a3];
  }
}

- (void)updateArtistHeroImagesForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v14 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handlerWithType:1 configuration:v4 error:&v14]);
  id v7 = v14;

  if (v7)
  {
    id v8 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v7;
      id v9 = "CloudService %p - updateArtistHeroImagesForConfiguration: - Unable to service artwork request - error=%{public}@";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    }
  }

  else
  {
    id v13 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    id v8 = v13;
    if (!v6)
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 134217984;
      id v16 = self;
      id v9 = "CloudService %p - updateArtistHeroImagesForConfiguration: - Skipping artist hero image update (unsupported device)";
      id v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
      uint32_t v12 = 12;
      goto LABEL_4;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "CloudService %p - updateArtistHeroImagesForConfiguration: - Received request to update artist hero images.",  buf,  0xCu);
    }

    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 clientIdentity]);
    [v6 updateArtistHeroImagesWithClientIdentity:v8];
  }

- (void)importArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v20 = 0LL;
  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:1 configuration:v9 error:&v20]);
  id v13 = v20;

  if (!v13)
  {
    if (v12)
    {
      __int16 v17 = (void (**)(id, id))objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
      [v12 importArtistHeroImageForPersistentID:a3 clientIdentity:v17 completionHandler:v10];
    }

    else
    {
      id v18 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        id v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "CloudService %p - importArtistHeroImageForPersistentID: - Skipping artist hero import (unsupported device) for persistentID: %lld",  buf,  0x16u);
      }

      NSErrorUserInfoKey v21 = NSDebugDescriptionErrorKey;
      unint64_t v22 = @"Artist images are not supported on this device.";
      __int16 v17 = (void (**)(id, id))objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2005LL,  v17));
      v10[2](v10, v19);
    }

    goto LABEL_11;
  }

  id v14 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = NSStringFromSelector(a2);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 134218498;
    id v24 = self;
    __int16 v25 = 2114;
    int64_t v26 = (int64_t)v16;
    __int16 v27 = 2114;
    id v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - %{public}@ - Unable to service artwork request - error=%{public}@",  buf,  0x20u);
  }

  if (v10)
  {
    __int16 v17 = objc_retainBlock(v10);
    v17[2](v17, v13);
LABEL_11:
  }
}

- (void)importAlbumArtistHeroImageForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v20 = 0LL;
  uint32_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:1 configuration:v9 error:&v20]);
  id v13 = v20;

  if (!v13)
  {
    if (v12)
    {
      __int16 v17 = (void (**)(id, id))objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
      [v12 importAlbumArtistHeroImageForPersistentID:a3 clientIdentity:v17 completionHandler:v10];
    }

    else
    {
      id v18 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        id v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "CloudService %p - Skipping album artist hero import (unsupported device) for persistentID: %lld",  buf,  0x16u);
      }

      NSErrorUserInfoKey v21 = NSDebugDescriptionErrorKey;
      unint64_t v22 = @"Artist images are not supported on this device.";
      __int16 v17 = (void (**)(id, id))objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2005LL,  v17));
      v10[2](v10, v19);
    }

    goto LABEL_11;
  }

  id v14 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    id v15 = NSStringFromSelector(a2);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 134218498;
    id v24 = self;
    __int16 v25 = 2114;
    int64_t v26 = (int64_t)v16;
    __int16 v27 = 2114;
    id v28 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - %{public}@ - Unable to service artwork request - error=%{public}@",  buf,  0x20u);
  }

  if (v10)
  {
    __int16 v17 = objc_retainBlock(v10);
    v17[2](v17, v13);
LABEL_11:
  }
}

- (void)importSubscriptionItemArtworkForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importItemArtworkForPersistentID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v17 = self;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service importSubscriptionItemArtworkForPersistentID request - error=%{public}@",  buf,  0x16u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)importSubscriptionScreenshotForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  os_log_type_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importScreenshotForPersistentID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v17 = self;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service importSubscriptionScreenshotForPersistentID request - error=%{public}@",  buf,  0x16u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)deprioritizeSubscriptionItemArtworkForPersistentID:(int64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeSubscriptionItemArtworkForPersistentID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service deprioritizeSubscriptionItemArtworkForPersistentID request - error=%{public}@",  buf,  0x16u);
    }
  }
}

- (void)deprioritizeSubscriptionScreenshotForPersistentID:(int64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeSubscriptionScreenshotForPersistentID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service deprioritizeSubscriptionScreenshotForPersistentID request - error=%{public}@",  buf,  0x16u);
    }
  }
}

- (void)deprioritizeSubscriptionContainerArtworkForPersistentID:(int64_t)a3 configuration:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v11 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 handlerWithType:0 configuration:v6 error:&v11]);

  id v9 = v11;
  if (v8)
  {
    [v8 deprioritizeSubscriptionContainerArtworkForPersistentID:a3];
  }

  else
  {
    id v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service deprioritizeSubscriptionScreenshotForPersistentID request - error=%{public}@",  buf,  0x16u);
    }
  }
}

- (void)loadArtworkInfoForSubscriptionItemPersistentIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100089424;
    v16[3] = &unk_1001A3EF8;
    void v16[4] = self;
    id v17 = v10;
    [v12 loadArtworkInfoForSubscriptionItemPersistentIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service loadArtworkInfoForSubscriptionItemPersistentIDs request - error=%{public}@",  buf,  0x16u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadScreenshotInfoForSubscriptionPersistentIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100089328;
    v16[3] = &unk_1001A3EF8;
    void v16[4] = self;
    id v17 = v10;
    [v12 loadScreenshotInfoForSubscriptionPersistentIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service loadArtworkInfoForSubscriptionItemPersistentIDs request - error=%{public}@",  buf,  0x16u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadArtworkInfoForSubscriptionContainerPersistentIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v18]);
  id v13 = v18;

  if (v12)
  {
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue([v9 clientIdentity]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10008922C;
    v16[3] = &unk_1001A3EF8;
    void v16[4] = self;
    id v17 = v10;
    [v12 loadArtworkInfoForSubscriptionContainerPersistentIDs:v8 clientIdentity:v14 completionHandler:v16];
  }

  else
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service loadArtworkInfoForSubscriptionItemPersistentIDs request - error=%{public}@",  buf,  0x16u);
    }

    if (v10) {
      (*((void (**)(id, id, void))v10 + 2))(v10, v13, 0LL);
    }
  }
}

- (void)loadMissingArtworkForConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "loadMissingArtworkForConfiguration: - Sending request to load missing artwork",  buf,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v10 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 handlerWithType:0 configuration:v4 error:&v10]);
  id v8 = v10;
  if (v7)
  {
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 clientIdentity]);
    [v7 loadMissingArtworkWithClientIdentity:v9];
  }

  else
  {
    id v9 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v12 = self;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadMissingArtworkForConfiguration: - Unable to service request - error=%{public}@",  buf,  0x16u);
    }
  }
}

- (void)importSubscriptionContainerArtworkForPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v15 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 handlerWithType:0 configuration:v8 error:&v15]);
  id v12 = v15;

  if (v11)
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v8 clientIdentity]);
    [v11 importContainerArtworkForPersistentID:a3 clientIdentity:v13 completionHandler:v9];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p -  Unable to service importSubscriptionContainerArtworkForPersistentID request - error=%{public}@",  buf,  0x16u);
    }

    if (v9) {
      v9[2](v9, v12);
    }
  }
}

- (void)loadIsUpdateInProgressForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v14]);

  id v10 = v14;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100089120;
    v12[3] = &unk_1001A3EA8;
    void v12[4] = self;
    id v13 = v6;
    [v9 isUpdatingCloudLibraryWithCompletion:v12];
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadIsUpdateInProgressForConfiguration: - Unable to service purchase request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      (*((void (**)(id, void, void))v6 + 2))(v6, 0LL, 0LL);
    }
  }
}

- (void)loadUpdateProgressForConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v14 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v7 error:&v14]);

  id v10 = v14;
  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100089108;
    v12[3] = &unk_1001A4030;
    id v13 = v6;
    [v9 updateCloudLibraryProgressWithCompletion:v12];
  }

  else
  {
    id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "CloudService %p - loadUpdateProgressForConfiguration: - Unable to service purchase request - error=%{public}@",  buf,  0x16u);
    }

    if (v6) {
      (*((void (**)(id, id, float))v6 + 2))(v6, v10, 0.0);
    }
  }
}

- (void)authenticateForConfiguration:(id)a3 startInitialImport:(BOOL)a4 enableCloudLibraryPolicy:(int64_t)a5 isExplicitUserAction:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100088F64;
  v18[3] = &unk_1001A4058;
  void v18[4] = self;
  id v19 = v12;
  BOOL v22 = a4;
  BOOL v23 = a6;
  id v20 = v13;
  int64_t v21 = a5;
  id v15 = v13;
  id v16 = v12;
  id v17 = [v14 initWithStartHandler:v18];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);
}

- (void)disableCloudLibraryWithReason:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v8 = v7;
  if (v7)
  {
    [v7 auditToken];
    uint64_t v9 = MSVTCCIdentityForAuditToken(v25);
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
  }

  else
  {
    uint64_t v11 = MSVTCCIdentityForCurrentProcess();
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v11);
  }

  id v12 = (void *)v10;
  id v13 = objc_alloc(&OBJC_CLASS___ICAsyncBlockOperation);
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  id v19 = sub_100088D84;
  id v20 = &unk_1001A41B8;
  id v21 = v12;
  BOOL v22 = self;
  id v23 = v6;
  int64_t v24 = a3;
  id v14 = v6;
  id v15 = v12;
  id v16 = [v13 initWithStartHandler:&v17];
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v16, v17, v18, v19, v20);
}

- (void)updatePinnedSubscribedPlaylistsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v13 = 0LL;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 handlerWithType:0 configuration:v6 error:&v13]);
  id v10 = v13;

  if (v9)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientIdentity]);
    [v9 updateSubscribedPlaylistsWithSagaIDs:0 ignoreMinRefreshInterval:0 requestReason:14 pinnedOnly:1 clientIdentity:v11 completionHandler:v7];
  }

  else
  {
    id v12 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v15 = self;
      __int16 v16 = 2114;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "CloudService %p - updatePinnedSubscribedPlaylistsWithConfiguration Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v7) {
      v7[2](v7, v10);
    }
  }
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2048;
    int64_t v23 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Starting collaboration using persistentID %lld.",  buf,  0x16u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v19 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 handlerWithType:0 configuration:v11 error:&v19]);

  id v15 = v19;
  if (v14)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100088D78;
    v17[3] = &unk_1001A3F48;
    id v18 = v10;
    [v14 beginCollaborationUsingPlaylistWithPersistentID:a3 sharingMode:a4 completion:v17];
  }

  else
  {
    __int16 v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v21 = self;
      __int16 v22 = 2114;
      int64_t v23 = (int64_t)v15;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "CloudService %p - beginCollaborationUsingPlaylistWithPersistentID Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v10) {
      (*((void (**)(id, void, id))v10 + 2))(v10, 0LL, v15);
    }
  }
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2048;
    int64_t v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Ending collaboration with persistentID %lld.",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v17 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v17]);

  id v13 = v17;
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100088D68;
    v15[3] = &unk_1001A3F48;
    id v16 = v8;
    [v12 endCollaborationWithPersistentID:a3 completion:v15];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = self;
      __int16 v20 = 2114;
      int64_t v21 = (int64_t)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - endCollaborationUsingPlaylistWithCloudLibraryID Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v8) {
      (*((void (**)(id, void, id))v8 + 2))(v8, 0LL, v13);
    }
  }
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 configuration:(id)a4 properties:(id)a5 trackEdits:(id)a6 completion:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a4;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v25 = self;
    __int16 v26 = 2048;
    int64_t v27 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Editing collaboration with persistentID %lld.",  buf,  0x16u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v23 = 0LL;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 handlerWithType:0 configuration:v15 error:&v23]);

  id v19 = v23;
  if (v18)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100088D5C;
    v21[3] = &unk_1001A50C0;
    id v22 = v14;
    [v18 editCollaborationWithPersistentID:a3 properties:v12 trackEdits:v13 completion:v21];
  }

  else
  {
    __int16 v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v25 = self;
      __int16 v26 = 2114;
      int64_t v27 = (int64_t)v19;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "CloudService %p - editCollaborationWithCloudLibraryID Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v14) {
      (*((void (**)(id, id))v14 + 2))(v14, v19);
    }
  }
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ joining collaboration with global playlist ID %{public}@.",  buf,  0x16u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 handlerWithType:0 configuration:v13 error:&v21]);

  id v17 = v21;
  if (v16)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100088D4C;
    v19[3] = &unk_1001A3F48;
    id v20 = v12;
    [v16 joinCollaborationWithGlobalPlaylistID:v10 invitationURL:v11 completion:v19];
  }

  else
  {
    id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v23 = self;
      __int16 v24 = 2114;
      id v25 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "CloudService %p - joinCollaborationWithGlobalPlaylistID Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v12) {
      (*((void (**)(id, void, id))v12 + 2))(v12, 0LL, v17);
    }
  }
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 configuration:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v24 = self;
    __int16 v25 = 2114;
    id v26 = v12;
    __int16 v27 = 2048;
    int64_t v28 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ responding to pending collaborator request from user %{public}@ for persistentID %lld.",  buf,  0x20u);
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v22 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v14 error:&v22]);

  id v18 = v22;
  if (v17)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100088D40;
    v20[3] = &unk_1001A50C0;
    id v21 = v13;
    [v17 respondToPendingCollaborator:v12 onCollaborationWithPersistentID:a4 withApproval:v9 completion:v20];
  }

  else
  {
    id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      __int16 v24 = self;
      __int16 v25 = 2114;
      id v26 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "CloudService %p - respondToPendingCollaborator Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v13) {
      (*((void (**)(id, id))v13 + 2))(v13, v18);
    }
  }
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "msv_compactDescription"));
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    id v25 = v14;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received remove collaborator request with collaborator %{public}@, persistent ID %lld.",  buf,  0x20u);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v21 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 handlerWithType:0 configuration:v12 error:&v21]);

  id v17 = v21;
  if (v16)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100088D34;
    v19[3] = &unk_1001A50C0;
    id v20 = v11;
    [v16 removeCollaborators:v10 fromCollaborationWithPersistentID:a4 completion:v19];
  }

  else
  {
    id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v23 = self;
      __int16 v24 = 2114;
      id v25 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "CloudService %p - removeCollaborator Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v11) {
      (*((void (**)(id, id))v11 + 2))(v11, v17);
    }
  }
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 configuration:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = self;
    __int16 v20 = 2048;
    int64_t v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Received request to reset invitation URL with collaboration persistent ID %lld.",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
  id v17 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 handlerWithType:0 configuration:v9 error:&v17]);

  id v13 = v17;
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100088D28;
    v15[3] = &unk_1001A4080;
    id v16 = v8;
    [v12 resetInvitationURLForCollaborationWithPersistentID:a3 completion:v15];
  }

  else
  {
    id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218242;
      id v19 = self;
      __int16 v20 = 2114;
      int64_t v21 = (int64_t)v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "CloudService %p - removeCollaborator Unable to service request for cloud library - error=%{public}@",  buf,  0x16u);
    }

    if (v8) {
      (*((void (**)(id, void, id))v8 + 2))(v8, 0LL, v13);
    }
  }
}

- (void)refreshEnhancedAudioSharedKeys
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
  [v2 refreshEnhancedAudioSharedKeys];
}

- (void)fetchEnhancedAudioOfflineKeys
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
  [v2 fetchEnhancedAudioOfflineKeys];
}

- (void)processPendingKeyInvalidations
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
  [v2 processPendingKeyInvalidations];
}

- (void)listCloudServerOperations
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[ICDServer server](&OBJC_CLASS___ICDServer, "server"));
  [v2 listCloudServerOperations];
}

- (void)_updateSagaLibraryWithReason:(int64_t)a3 allowNoisyAuthPrompt:(BOOL)a4 forConfiguration:(id)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void))a6;
  id v12 = os_log_create("com.apple.amp.itunescloudd", "XPC");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Sending request to update Cloud Library...",  buf,  2u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v14 = [v13 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (v14)
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "XPC");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Can't update cloud library using current network - skipping",  buf,  2u);
    }

    if (v11) {
      v11[2](v11, 0LL);
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CloudService handlerProvider](self, "handlerProvider"));
    id v22 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 handlerWithType:0 configuration:v10 error:&v22]);
    id v18 = v22;

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 clientIdentity]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100088BE0;
    v20[3] = &unk_1001A50C0;
    int64_t v21 = v11;
    [v17 updateSagaLibraryWithClientIdentity:v19 forReason:a3 allowNoisyAuthPrompt:v7 isExplicitUserAction:0 completionHandler:v20];
  }
}

- (NSString)requestingBundleID
{
  return self->_requestingBundleID;
}

- (void)setRequestingBundleID:(id)a3
{
}

- (ICDHandlerProviding)handlerProvider
{
  return (ICDHandlerProviding *)objc_loadWeakRetained((id *)&self->_handlerProvider);
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
}

@end