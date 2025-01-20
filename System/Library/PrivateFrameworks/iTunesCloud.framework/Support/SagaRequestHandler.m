@interface SagaRequestHandler
- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3;
- (SagaRequestHandler)init;
- (SagaRequestHandler)initWithConfiguration:(id)a3 progressObserver:(id)a4;
- (float)updateProgress;
- (id)_library;
- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5;
- (void)_handleCloudLibraryUpdateOperationFinishedWithError:(id)a3;
- (void)_handleLibraryEditOperationCompletionUpdatingLibrary:(BOOL)a3 andSubscribedPlaylist:(unint64_t)a4 completion:(id)a5;
- (void)addBackgroundOperation:(id)a3 priority:(int)a4;
- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5;
- (void)cancelOperations;
- (void)cancelOperationsWithCompletionHandler:(id)a3;
- (void)cancelPendingChanges;
- (void)cancelPendingChangesWithCompletion:(id)a3;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3;
- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3;
- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6;
- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)environmentMonitorDidChangePower:(id)a3;
- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7;
- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6;
- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)increasePriorityForAllOperations;
- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5;
- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5;
- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4;
- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6;
- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7;
- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8;
- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7;
- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4;
- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8;
- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)uploadItemPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4;
- (void)uploadPlaylistPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4;
@end

@implementation SagaRequestHandler

- (void)dealloc
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v16 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%{public}@ - dealloc", buf, 0xCu);
  }

  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v4 = self->_updateLibraryCompletionHandlers;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v8) + 16LL))();
        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SagaRequestHandler;
  -[SagaRequestHandler dealloc](&v9, "dealloc");
}

- (SagaRequestHandler)init
{
  return 0LL;
}

- (SagaRequestHandler)initWithConfiguration:(id)a3 progressObserver:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___SagaRequestHandler;
  objc_super v9 = -[SagaRequestHandler init](&v39, "init");
  __int128 v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v7 userIdentity]);
    uint64_t v12 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v11));
    musicLibrary = v10->_musicLibrary;
    v10->_musicLibrary = (ML3MusicLibrary *)v12;

    v14 = -[SagaArtworkImporter initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SagaArtworkImporter),  "initWithConfiguration:",  v7);
    artworkImporter = v10->_artworkImporter;
    v10->_artworkImporter = v14;

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10007E734;
    v37[3] = &unk_1001A3C28;
    id v38 = v7;
    v16 = objc_retainBlock(v37);
    uint64_t v17 = ((uint64_t (*)(void *, const __CFString *))v16[2])( v16,  @"com.apple.itunescloudd.sagaUploadItemPropertiesQueue");
    id v18 = objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create((const char *)[v18 UTF8String], 0);
    uploadItemPropertiesQueue = v10->_uploadItemPropertiesQueue;
    v10->_uploadItemPropertiesQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = ((uint64_t (*)(void *, const __CFString *))v16[2])( v16,  @"com.apple.itunescloudd.sagaUploadPlaylistPropertiesQueue");
    id v22 = objc_claimAutoreleasedReturnValue(v21);
    dispatch_queue_t v23 = dispatch_queue_create((const char *)[v22 UTF8String], 0);
    uploadPlaylistPropertiesQueue = v10->_uploadPlaylistPropertiesQueue;
    v10->_uploadPlaylistPropertiesQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = ((uint64_t (*)(void *, const __CFString *))v16[2])( v16,  @"com.apple.itunescloudd.sagaUpdateLibraryQueue");
    id v26 = objc_claimAutoreleasedReturnValue(v25);
    dispatch_queue_t v27 = dispatch_queue_create((const char *)[v26 UTF8String], 0);
    updateCloudLibraryQueue = v10->_updateCloudLibraryQueue;
    v10->_updateCloudLibraryQueue = (OS_dispatch_queue *)v27;

    uint64_t v29 = ((uint64_t (*)(void *, const __CFString *))v16[2])( v16,  @"com.apple.itunescloudd.calloutQueue");
    id v30 = objc_claimAutoreleasedReturnValue(v29);
    dispatch_queue_t v31 = dispatch_queue_create((const char *)[v30 UTF8String], &_dispatch_queue_attr_concurrent);
    calloutQueue = v10->_calloutQueue;
    v10->_calloutQueue = (OS_dispatch_queue *)v31;

    v33 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    updateLibraryCompletionHandlers = v10->_updateLibraryCompletionHandlers;
    v10->_updateLibraryCompletionHandlers = v33;

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[ICEnvironmentMonitor sharedMonitor](&OBJC_CLASS___ICEnvironmentMonitor, "sharedMonitor"));
    [v35 registerObserver:v10];

    objc_storeStrong((id *)&v10->_updateTaskHelper, a4);
  }

  return v10;
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SagaRequestHandler _library](self, "_library"));
    [v7 addOperation:v6 priority:v4];
  }

- (void)addBackgroundOperation:(id)a3 priority:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[SagaRequestHandler _library](self, "_library"));
    [v7 addBackgroundOperation:v6 priority:v4];
  }

- (void)cancelPendingChangesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    library = self->_library;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](library, "pendingChangesCoordinator"));
    int v11 = 138543874;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    v14 = library;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - cancelPendingChangesWithCompletion: - Library=%@ - PendingChangesCoordinator:%@",  (uint8_t *)&v11,  0x20u);
  }

  id v8 = self->_library;
  if (v8
    && (objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](v8, "pendingChangesCoordinator")),
        v9,
        v9))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](self->_library, "pendingChangesCoordinator"));
    [v10 removeAllPendingChangesWithCompletion:v4];
  }

  else if (v4)
  {
    v4[2](v4);
  }
}

- (void)cancelPendingChanges
{
}

- (void)cancelOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - cancelOperationsWithCompletion: - Starting...",  buf,  0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007E57C;
  v7[3] = &unk_1001A6BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[SagaRequestHandler cancelPendingChangesWithCompletion:](self, "cancelPendingChangesWithCompletion:", v7);
}

- (void)cancelOperations
{
  v3 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v6 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - cancelOperations: - Starting...",  buf,  0xCu);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10007E394;
  v4[3] = &unk_1001A6B90;
  v4[4] = self;
  -[SagaRequestHandler cancelPendingChangesWithCompletion:](self, "cancelPendingChangesWithCompletion:", v4);
}

- (void)decreasePriorityForAllOperations
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - decreasePriorityForAllOperations:",  buf,  0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries(v5) & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"SagaRequestHandler.m", 202, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }

  updateCloudLibraryQueue = (dispatch_queue_s *)self->_updateCloudLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E388;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(updateCloudLibraryQueue, block);
  -[CloudArtworkImporter decreasePriorityForAllOperations](self->_artworkImporter, "decreasePriorityForAllOperations");
  -[CloudLibrary decreasePriorityForAllOperations](self->_library, "decreasePriorityForAllOperations");
}

- (void)increasePriorityForAllOperations
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int128 v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - increasePriorityForAllOperations:",  buf,  0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries(v5) & 1) == 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v7 handleFailureInMethod:a2, self, @"SagaRequestHandler.m", 214, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }

  updateCloudLibraryQueue = (dispatch_queue_s *)self->_updateCloudLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007E37C;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(updateCloudLibraryQueue, block);
  -[CloudArtworkImporter increasePriorityForAllOperations](self->_artworkImporter, "increasePriorityForAllOperations");
  -[CloudLibrary increasePriorityForAllOperations](self->_library, "increasePriorityForAllOperations");
}

- (void)updateItemPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating item play data",  buf,  0xCu);
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  __int128 v10 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  uint64_t v12 = -[ICStoreRequestContext initWithIdentity:](v10, "initWithIdentity:", v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007E200;
  v15[3] = &unk_1001A58D0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v9 getBagForRequestContext:v12 withCompletionHandler:v15];
}

- (void)updatePlaylistPlayDataWithClientIdentity:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    dispatch_queue_t v19 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating playlist play data",  buf,  0xCu);
  }

  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[ICURLBagProvider sharedBagProvider](&OBJC_CLASS___ICURLBagProvider, "sharedBagProvider"));
  __int128 v10 = objc_alloc(&OBJC_CLASS___ICStoreRequestContext);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  uint64_t v12 = -[ICStoreRequestContext initWithIdentity:](v10, "initWithIdentity:", v11);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007E084;
  v15[3] = &unk_1001A58D0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v13 = v7;
  id v14 = v6;
  [v9 getBagForRequestContext:v12 withCompletionHandler:v15];
}

- (void)uploadItemPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4
{
  id v6 = a3;
  uploadItemPropertiesQueue = (dispatch_queue_s *)self->_uploadItemPropertiesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007DB08;
  block[3] = &unk_1001A5D08;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(uploadItemPropertiesQueue, block);
}

- (void)uploadPlaylistPropertiesWithClientIdentity:(id)a3 minimumTimeInterval:(double)a4
{
  id v6 = a3;
  uploadPlaylistPropertiesQueue = (dispatch_queue_s *)self->_uploadPlaylistPropertiesQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007D628;
  block[3] = &unk_1001A5D08;
  block[4] = self;
  id v10 = v6;
  double v11 = a4;
  id v8 = v6;
  dispatch_async(uploadPlaylistPropertiesQueue, block);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    dispatch_queue_t v27 = self;
    __int16 v28 = 2114;
    id v29 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Creating cloud playlist with initial properties: %{public}@",  buf,  0x16u);
  }

  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    dispatch_queue_t v27 = self;
    __int16 v28 = 2114;
    id v29 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - ... with cloud tracks: %{public}@",  buf,  0x16u);
  }

  id v18 = -[SagaCreatePlaylistOperation initWithConfiguration:playlistPersistentID:properties:trackList:clientIdentity:]( objc_alloc(&OBJC_CLASS___SagaCreatePlaylistOperation),  "initWithConfiguration:playlistPersistentID:properties:trackList:clientIdentity:",  self->_configuration,  a3,  v12,  v13,  v14);
  objc_initWeak((id *)buf, v18);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007D580;
  v23[3] = &unk_1001A42C8;
  id v19 = v15;
  id v24 = v19;
  objc_copyWeak(&v25, (id *)buf);
  -[SagaCreatePlaylistOperation setCompletionBlock:](v18, "setCompletionBlock:", v23);
  -[SagaCreatePlaylistOperation setName:]( v18,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.createPlaylistOperation");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007D60C;
  v21[3] = &unk_1001A50C0;
  id v20 = v19;
  id v22 = v20;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v18,  2LL,  v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)createPlaylistWithPersistentID:(int64_t)a3 properties:(id)a4 trackList:(id)a5 requestingBundleID:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v30 = self;
    __int16 v31 = 2114;
    id v32 = v16;
    __int16 v33 = 2114;
    id v34 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Creating cloud playlist for %{public}@ with initial properties: %{public}@",  buf,  0x20u);
  }

  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = self;
    __int16 v31 = 2114;
    id v32 = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - ... with cloud tracks: %{public}@",  buf,  0x16u);
  }

  uint64_t v21 = -[SagaSDKCreatePlaylistOperation initWithConfiguration:playlistPersistentID:properties:trackList:requestingBundleID:clientIdentity:]( objc_alloc(&OBJC_CLASS___SagaSDKCreatePlaylistOperation),  "initWithConfiguration:playlistPersistentID:properties:trackList:requestingBundleID:clientIdentity:",  self->_configuration,  a3,  v14,  v15,  v16,  v17);
  objc_initWeak((id *)buf, v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10007D40C;
  v26[3] = &unk_1001A4D70;
  id v22 = v18;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)buf);
  v26[4] = self;
  -[SagaSDKCreatePlaylistOperation setCompletionBlock:](v21, "setCompletionBlock:", v26);
  -[SagaSDKCreatePlaylistOperation setName:]( v21,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.createPlaylistOperation");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10007D518;
  v24[3] = &unk_1001A50C0;
  id v23 = v22;
  id v25 = v23;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v21,  2LL,  v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)addGeniusPlaylistWithPersistentID:(int64_t)a3 name:(id)a4 seedItemIDs:(id)a5 itemIDs:(id)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);
    *(_DWORD *)buf = 138543874;
    id v30 = self;
    __int16 v31 = 2048;
    int64_t v32 = a3;
    __int16 v33 = 2048;
    id v34 = [v20 unsignedLongLongValue];
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Creating Genius playlist (pid = %lld) with seed ID: %lld",  buf,  0x20u);
  }

  uint64_t v21 = -[SagaCreateGeniusPlaylistOperation initWithConfiguration:geniusPlaylistPersistentID:playlistName:seedItemIDs:itemIDs:clientIdentity:]( objc_alloc(&OBJC_CLASS___SagaCreateGeniusPlaylistOperation),  "initWithConfiguration:geniusPlaylistPersistentID:playlistName:seedItemIDs:itemIDs:clientIdentity:",  self->_configuration,  a3,  v14,  v15,  v16,  v17);
  objc_initWeak((id *)buf, v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10007D364;
  v26[3] = &unk_1001A42C8;
  id v22 = v18;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)buf);
  -[SagaCreateGeniusPlaylistOperation setCompletionBlock:](v21, "setCompletionBlock:", v26);
  -[SagaCreateGeniusPlaylistOperation setName:]( v21,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.createGeniusPlaylistOperation");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10007D3F0;
  v24[3] = &unk_1001A50C0;
  id v23 = v22;
  id v25 = v23;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v21,  2LL,  v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 toPlaylistWithPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if ([v12 albumAdamID])
  {
    id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v34 = self;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2048;
      int64_t v38 = a5;
      __int16 v39 = 2048;
      id v40 = [v12 albumAdamID];
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Adding store item with adam ID: %lld to cloud playlist (pid = %lld, referral albumAdamID = %lld)",  buf,  0x2Au);
    }

    id v16 = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:referralAlbumAdamID:clientIdentity:]( [SagaCloudAddItemToPlaylistOperation alloc],  "initWithConfiguration:adamID:playlistPersistentID:referralAlbumAdamID:clientIdentity:",  self->_configuration,  a3,  a5,  [v12 albumAdamID],  v13);
LABEL_5:
    id v17 = v16;
    goto LABEL_10;
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 playlistGlobalID]);
  id v19 = [v18 length];

  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138543874;
      id v34 = self;
      __int16 v35 = 2048;
      int64_t v36 = a3;
      __int16 v37 = 2048;
      int64_t v38 = a5;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Adding store item with adam ID: %lld to cloud playlist (pid = %lld)",  buf,  0x20u);
    }

    id v16 = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:clientIdentity:]( objc_alloc(&OBJC_CLASS___SagaCloudAddItemToPlaylistOperation),  "initWithConfiguration:adamID:playlistPersistentID:clientIdentity:",  self->_configuration,  a3,  a5,  v13);
    goto LABEL_5;
  }

  if (v21)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v12 playlistGlobalID]);
    *(_DWORD *)buf = 138544130;
    id v34 = self;
    __int16 v35 = 2048;
    int64_t v36 = a3;
    __int16 v37 = 2048;
    int64_t v38 = a5;
    __int16 v39 = 2114;
    id v40 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Adding store item with adam ID: %lld to cloud playlist (pid = %lld, referral playlistGlobalID = %{public}@)",  buf,  0x2Au);
  }

  id v23 = objc_alloc(&OBJC_CLASS___SagaCloudAddItemToPlaylistOperation);
  configuration = self->_configuration;
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v12 playlistGlobalID]);
  id v17 = -[SagaCloudAddItemToPlaylistOperation initWithConfiguration:adamID:playlistPersistentID:referralPlaylistGlobalID:clientIdentity:]( v23,  "initWithConfiguration:adamID:playlistPersistentID:referralPlaylistGlobalID:clientIdentity:",  configuration,  a3,  a5,  v25,  v13);

LABEL_10:
  objc_initWeak((id *)buf, v17);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_10007D2C8;
  v30[3] = &unk_1001A4D70;
  objc_copyWeak(&v32, (id *)buf);
  v30[4] = self;
  id v26 = v14;
  id v31 = v26;
  -[SagaCloudAddItemToPlaylistOperation setCompletionBlock:](v17, "setCompletionBlock:", v30);
  -[SagaCloudAddItemToPlaylistOperation setName:]( v17,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation");
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10007D34C;
  v28[3] = &unk_1001A50C0;
  id v27 = v26;
  id v29 = v27;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v17,  2LL,  v28);

  objc_destroyWeak(&v32);
  objc_destroyWeak((id *)buf);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v22 = self;
    __int16 v23 = 2048;
    unint64_t v24 = a3;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Adding item with saga ID: %llu to cloud playlist (pid = %lld)",  buf,  0x20u);
  }

  id v13 = -[SagaAddItemToPlaylistOperation initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:]( objc_alloc(&OBJC_CLASS___SagaAddItemToPlaylistOperation),  "initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:",  self->_configuration,  a3,  a4,  v10);
  objc_initWeak((id *)buf, v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007D24C;
  v18[3] = &unk_1001A42C8;
  id v14 = v11;
  id v19 = v14;
  objc_copyWeak(&v20, (id *)buf);
  -[SagaAddItemToPlaylistOperation setCompletionBlock:](v13, "setCompletionBlock:", v18);
  -[SagaAddItemToPlaylistOperation setName:]( v13,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007D2B4;
  v16[3] = &unk_1001A50C0;
  id v15 = v14;
  id v17 = v15;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v13,  2LL,  v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithOpaqueID:(id)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v25 = self;
    __int16 v26 = 2114;
    id v27 = v12;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Adding store item with opaque ID: %{public}@ to cloud playlist (pid = %lld)",  buf,  0x20u);
  }

  id v17 = -[SagaCloudSDKAddItemToPlaylistOperation initWithConfiguration:clientIdentity:opaqueID:bundleID:playlistPersistentID:]( objc_alloc(&OBJC_CLASS___SagaCloudSDKAddItemToPlaylistOperation),  "initWithConfiguration:clientIdentity:opaqueID:bundleID:playlistPersistentID:",  self->_configuration,  v14,  v12,  v15,  a4);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10007D21C;
  v22[3] = &unk_1001A3F98;
  id v18 = v13;
  id v23 = v18;
  -[SagaCloudSDKAddOperation setUpdateCompletionBlock:](v17, "setUpdateCompletionBlock:", v22);
  -[SagaCloudSDKAddItemToPlaylistOperation setName:]( v17,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007D230;
  v20[3] = &unk_1001A50C0;
  id v21 = v18;
  id v19 = v18;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v17,  2LL,  v20);
}

- (void)addItemWithSagaID:(unint64_t)a3 toPlaylistWithPersistentID:(int64_t)a4 requestingBundleID:(id)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v25 = self;
    __int16 v26 = 2048;
    unint64_t v27 = a3;
    __int16 v28 = 2048;
    int64_t v29 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Adding item with saga ID: %llu to cloud playlist (pid = %lld)",  buf,  0x20u);
  }

  id v16 = -[SagaSDKAddItemToPlaylistOperation initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:requestingBundleID:]( objc_alloc(&OBJC_CLASS___SagaSDKAddItemToPlaylistOperation),  "initWithConfiguration:itemSagaID:playlistPersistentID:clientIdentity:requestingBundleID:",  self->_configuration,  a3,  a4,  v13,  v12);
  objc_initWeak((id *)buf, v16);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007D1A0;
  v21[3] = &unk_1001A42C8;
  id v17 = v14;
  id v22 = v17;
  objc_copyWeak(&v23, (id *)buf);
  -[SagaSDKAddItemToPlaylistOperation setCompletionBlock:](v16, "setCompletionBlock:", v21);
  -[SagaSDKAddItemToPlaylistOperation setName:]( v16,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.addItemToPlaylistOperation");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007D208;
  v19[3] = &unk_1001A50C0;
  id v18 = v17;
  id v20 = v18;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v16,  2LL,  v19);

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    unint64_t v27 = self;
    __int16 v28 = 2048;
    int64_t v29 = a5;
    __int16 v30 = 2114;
    id v31 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating cloud playlist (pid = %lld), setting properties: %{public}@",  buf,  0x20u);
  }

  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    unint64_t v27 = self;
    __int16 v28 = 2114;
    int64_t v29 = (int64_t)v13;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - ... with cloud tracks: %{public}@",  buf,  0x16u);
  }

  id v18 = -[SagaUpdatePlaylistOperation initWithConfiguration:clientIdentity:playlistPersistentID:properties:trackList:]( objc_alloc(&OBJC_CLASS___SagaUpdatePlaylistOperation),  "initWithConfiguration:clientIdentity:playlistPersistentID:properties:trackList:",  self->_configuration,  v14,  a5,  v12,  v13);
  objc_initWeak((id *)buf, v18);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007D0C8;
  v23[3] = &unk_1001A4D70;
  id v19 = v15;
  id v24 = v19;
  objc_copyWeak(&v25, (id *)buf);
  void v23[4] = self;
  -[SagaUpdatePlaylistOperation setCompletionBlock:](v18, "setCompletionBlock:", v23);
  -[SagaUpdatePlaylistOperation setName:]( v18,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.updatePlaylistOperation");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10007D188;
  v21[3] = &unk_1001A50C0;
  id v20 = v19;
  id v22 = v20;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v18,  2LL,  v21);

  objc_destroyWeak(&v25);
  objc_destroyWeak((id *)buf);
}

- (void)setPlaylistProperties:(id)a3 trackList:(id)a4 forPlaylistPersistentID:(int64_t)a5 clientIdentity:(id)a6 requestingBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    __int16 v30 = self;
    __int16 v31 = 2048;
    int64_t v32 = a5;
    __int16 v33 = 2114;
    id v34 = v17;
    __int16 v35 = 2114;
    id v36 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating cloud playlist (pid = %lld) for %{public}@, setting properties: %{public}@",  buf,  0x2Au);
  }

  id v20 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v30 = self;
    __int16 v31 = 2114;
    int64_t v32 = (int64_t)v15;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - ... with cloud tracks: %{public}@",  buf,  0x16u);
  }

  id v21 = -[SagaSDKUpdatePlaylistOperation initWithConfiguration:clientIdentity:playlistPersistentID:properties:trackList:requestingBundleID:]( objc_alloc(&OBJC_CLASS___SagaSDKUpdatePlaylistOperation),  "initWithConfiguration:clientIdentity:playlistPersistentID:properties:trackList:requestingBundleID:",  self->_configuration,  v16,  a5,  v14,  v15,  v17);
  objc_initWeak((id *)buf, v21);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10007CFB0;
  v26[3] = &unk_1001A4D70;
  id v22 = v18;
  id v27 = v22;
  objc_copyWeak(&v28, (id *)buf);
  void v26[4] = self;
  -[SagaSDKUpdatePlaylistOperation setCompletionBlock:](v21, "setCompletionBlock:", v26);
  -[SagaSDKUpdatePlaylistOperation setName:]( v21,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.updatePlaylistOperation");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10007D0A8;
  v24[3] = &unk_1001A50C0;
  id v23 = v22;
  id v25 = v23;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v21,  2LL,  v24);

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
}

- (void)publishPlaylistWithSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Publishing playlist with cloud id = %llu.",  buf,  0x16u);
  }

  id v11 = -[SagaPublishPlaylistOperation initWithConfiguration:clientIdentity:sagaID:]( objc_alloc(&OBJC_CLASS___SagaPublishPlaylistOperation),  "initWithConfiguration:clientIdentity:sagaID:",  self->_configuration,  v8,  a3);
  objc_initWeak((id *)buf, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007CEE4;
  v16[3] = &unk_1001A42C8;
  id v12 = v9;
  id v17 = v12;
  objc_copyWeak(&v18, (id *)buf);
  -[SagaPublishPlaylistOperation setCompletionBlock:](v11, "setCompletionBlock:", v16);
  -[SagaPublishPlaylistOperation setName:]( v11,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.publishPlaylistOperation");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007CF90;
  v14[3] = &unk_1001A50C0;
  id v13 = v12;
  id v15 = v13;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v11,  2LL,  v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)removeItemsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Removing items with cloud ids = %{public}@",  buf,  0x16u);
  }

  id v12 = -[SagaRemoveItemOperation initWithConfiguration:clientIdentity:itemSagaIDs:]( objc_alloc(&OBJC_CLASS___SagaRemoveItemOperation),  "initWithConfiguration:clientIdentity:itemSagaIDs:",  self->_configuration,  v9,  v8);
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007CE68;
  v17[3] = &unk_1001A42C8;
  id v13 = v10;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  -[SagaRemoveItemOperation setCompletionBlock:](v12, "setCompletionBlock:", v17);
  -[SagaRemoveItemOperation setName:]( v12,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.removeItemOperation");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007CED0;
  v15[3] = &unk_1001A50C0;
  id v14 = v13;
  id v16 = v14;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v12,  2LL,  v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)removePlaylistsWithSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Removing playlists with cloud ids = %{public}@",  buf,  0x16u);
  }

  id v12 = -[SagaRemovePlaylistOperation initWithConfiguration:clientIdentity:playlistSagaIDs:]( objc_alloc(&OBJC_CLASS___SagaRemovePlaylistOperation),  "initWithConfiguration:clientIdentity:playlistSagaIDs:",  self->_configuration,  v9,  v8);
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007CDEC;
  v17[3] = &unk_1001A42C8;
  id v13 = v10;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  -[SagaRemovePlaylistOperation setCompletionBlock:](v12, "setCompletionBlock:", v17);
  -[SagaRemovePlaylistOperation setName:]( v12,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.removePlaylistOperation");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007CE54;
  v15[3] = &unk_1001A50C0;
  id v14 = v13;
  id v16 = v14;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v12,  2LL,  v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)uploadArtworkForPlaylistWithPersistentID:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v22 = self;
    __int16 v23 = 2048;
    int64_t v24 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting artwork on saga playlist (pid = %lld)",  buf,  0x16u);
  }

  id v11 = -[SagaUploadPlaylistArtworkOperation initWithConfiguration:clientIdentity:playlistPersistentID:]( objc_alloc(&OBJC_CLASS___SagaUploadPlaylistArtworkOperation),  "initWithConfiguration:clientIdentity:playlistPersistentID:",  self->_configuration,  v8,  a3);
  objc_initWeak((id *)buf, v11);
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_10007CD84;
  id v18 = &unk_1001A42C8;
  id v12 = v9;
  id v19 = v12;
  objc_copyWeak(&v20, (id *)buf);
  -[SagaUploadPlaylistArtworkOperation setCompletionBlock:](v11, "setCompletionBlock:", &v15);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SagaRequestHandler _library](self, "_library", v15, v16, v17, v18));
  if (v13)
  {
    -[SagaUploadPlaylistArtworkOperation setName:]( v11,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.uploadPlaylistArtworkOperation");
    [v13 addBackgroundOperation:v11 priority:2];
  }

  else if (v12)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2009LL,  0LL));
    (*((void (**)(id, void *))v12 + 2))(v12, v14);
  }

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)updateSubscribedPlaylistsWithSagaIDs:(id)a3 ignoreMinRefreshInterval:(BOOL)a4 requestReason:(int64_t)a5 pinnedOnly:(BOOL)a6 clientIdentity:(id)a7 completionHandler:(id)a8
{
  BOOL v10 = a6;
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a7;
  id v16 = a8;
  id v17 = os_log_create("com.apple.amp.itunescloudd", "CloudSync_Oversize");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t StringForRequestReason = ICCloudClientGetStringForRequestReason(a5);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(StringForRequestReason);
    *(_DWORD *)buf = 138543874;
    int64_t v29 = self;
    __int16 v30 = 2114;
    __int16 v31 = v19;
    __int16 v32 = 2114;
    id v33 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating subscribed playlists (reason = %{public}@) with cloud ids = %{public}@",  buf,  0x20u);
  }

  id v20 = -[SagaUpdateSubscribedPlaylistsOperation initWithConfiguration:clientIdentity:subscribedPlaylistSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:]( objc_alloc(&OBJC_CLASS___SagaUpdateSubscribedPlaylistsOperation),  "initWithConfiguration:clientIdentity:subscribedPlaylistSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:",  self->_configuration,  v15,  v14,  v12,  a5,  v10);
  objc_initWeak((id *)buf, v20);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10007CD08;
  v25[3] = &unk_1001A42C8;
  id v21 = v16;
  id v26 = v21;
  objc_copyWeak(&v27, (id *)buf);
  -[SagaUpdateSubscribedPlaylistsOperation setCompletionBlock:](v20, "setCompletionBlock:", v25);
  -[SagaUpdateSubscribedPlaylistsOperation setName:]( v20,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.updateSubscribedPlaylistsOperation");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10007CD70;
  v23[3] = &unk_1001A50C0;
  id v22 = v21;
  id v24 = v22;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v20,  2LL,  v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithAdamID:(int64_t)a3 referral:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v10 albumAdamID])
  {
    id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      __int16 v32 = self;
      __int16 v33 = 2048;
      int64_t v34 = a3;
      __int16 v35 = 2048;
      id v36 = [v10 albumAdamID];
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to add store item with adam ID: %lld (referral albumAdamID = %lld)",  buf,  0x20u);
    }

    id v14 = -[SagaCloudAddItemOperation initWithConfiguration:adamID:referralAlbumAdamID:clientIdentity:]( [SagaCloudAddItemOperation alloc],  "initWithConfiguration:adamID:referralAlbumAdamID:clientIdentity:",  self->_configuration,  a3,  [v10 albumAdamID],  v11);
LABEL_5:
    id v15 = v14;
    goto LABEL_10;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 playlistGlobalID]);
  id v17 = [v16 length];

  id v18 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
  if (!v17)
  {
    if (v19)
    {
      *(_DWORD *)buf = 138543618;
      __int16 v32 = self;
      __int16 v33 = 2048;
      int64_t v34 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to add store item with adam ID: %lld",  buf,  0x16u);
    }

    id v14 = -[SagaCloudAddItemOperation initWithConfiguration:adamID:clientIdentity:]( objc_alloc(&OBJC_CLASS___SagaCloudAddItemOperation),  "initWithConfiguration:adamID:clientIdentity:",  self->_configuration,  a3,  v11);
    goto LABEL_5;
  }

  if (v19)
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 playlistGlobalID]);
    *(_DWORD *)buf = 138543874;
    __int16 v32 = self;
    __int16 v33 = 2048;
    int64_t v34 = a3;
    __int16 v35 = 2114;
    id v36 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to add store item with adam ID: %lld (referral playlistGlobalID = %{public}@)",  buf,  0x20u);
  }

  id v21 = objc_alloc(&OBJC_CLASS___SagaCloudAddItemOperation);
  configuration = self->_configuration;
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v10 playlistGlobalID]);
  id v15 = -[SagaCloudAddItemOperation initWithConfiguration:adamID:referralPlaylistGlobalID:clientIdentity:]( v21,  "initWithConfiguration:adamID:referralPlaylistGlobalID:clientIdentity:",  configuration,  a3,  v23,  v11);

LABEL_10:
  objc_initWeak((id *)buf, v15);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_10007CC44;
  v28[3] = &unk_1001A4D70;
  objc_copyWeak(&v30, (id *)buf);
  void v28[4] = self;
  id v24 = v12;
  id v29 = v24;
  -[SagaCloudAddItemOperation setCompletionBlock:](v15, "setCompletionBlock:", v28);
  -[SagaCloudAddItemOperation setName:]( v15,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.cloudAddOperation");
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10007CCE8;
  v26[3] = &unk_1001A50C0;
  id v25 = v24;
  id v27 = v25;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v15,  2LL,  v26);

  objc_destroyWeak(&v30);
  objc_destroyWeak((id *)buf);
}

- (void)addStoreItemWithOpaqueID:(id)a3 requestingBundleID:(id)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to add store item with opaque ID: %{public}@ from %{public}@",  buf,  0x20u);
  }

  id v15 = -[SagaCloudSDKAddOperation initWithConfiguration:clientIdentity:opaqueID:bundleID:]( objc_alloc(&OBJC_CLASS___SagaCloudSDKAddOperation),  "initWithConfiguration:clientIdentity:opaqueID:bundleID:",  self->_configuration,  v13,  v10,  v11);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007CC14;
  v20[3] = &unk_1001A3F98;
  id v16 = v12;
  id v21 = v16;
  -[SagaCloudSDKAddOperation setUpdateCompletionBlock:](v15, "setUpdateCompletionBlock:", v20);
  -[SagaCloudSDKAddOperation setName:]( v15,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.cloudAddOperation");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007CC28;
  v18[3] = &unk_1001A50C0;
  id v19 = v16;
  id v17 = v16;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v15,  2LL,  v18);
}

- (void)addStorePlaylistWithGlobalID:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to add store playlist with global ID: %{public}@",  buf,  0x16u);
  }

  id v12 = -[SagaCloudAddPlaylistOperation initWithConfiguration:clientIdentity:playlistGlobalID:]( objc_alloc(&OBJC_CLASS___SagaCloudAddPlaylistOperation),  "initWithConfiguration:clientIdentity:playlistGlobalID:",  self->_configuration,  v9,  v8);
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007CA90;
  v17[3] = &unk_1001A4D70;
  objc_copyWeak(&v19, (id *)buf);
  void v17[4] = self;
  id v13 = v10;
  id v18 = v13;
  -[SagaCloudAddPlaylistOperation setCompletionBlock:](v12, "setCompletionBlock:", v17);
  -[SagaCloudAddPlaylistOperation setName:]( v12,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.cloudAddOperation");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007CB80;
  v15[3] = &unk_1001A50C0;
  id v14 = v13;
  id v16 = v14;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v12,  2LL,  v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)setCloudAddToPlaylistBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t StringForAddToPlaylistBehavior = ICCloudClientGetStringForAddToPlaylistBehavior(a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(StringForAddToPlaylistBehavior);
    *(_DWORD *)buf = 138543618;
    __int16 v22 = self;
    __int16 v23 = 2114;
    __int16 v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting cloud add to playlist behavior to: %{public}@",  buf,  0x16u);
  }

  id v13 = -[CloudSetAddToPlaylistBehaviorOperation initWithConfiguration:clientIdentity:addToPlaylistBehavior:]( objc_alloc(&OBJC_CLASS___CloudSetAddToPlaylistBehaviorOperation),  "initWithConfiguration:clientIdentity:addToPlaylistBehavior:",  self->_configuration,  v8,  a3);
  objc_initWeak((id *)buf, v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007CA0C;
  v18[3] = &unk_1001A42C8;
  id v14 = v9;
  id v19 = v14;
  objc_copyWeak(&v20, (id *)buf);
  -[CloudSetAddToPlaylistBehaviorOperation setCompletionBlock:](v13, "setCompletionBlock:", v18);
  -[CloudSetAddToPlaylistBehaviorOperation setName:]( v13,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setAddToPlaylistBehaviorOperation");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007CA7C;
  v16[3] = &unk_1001A50C0;
  id v15 = v14;
  id v17 = v15;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v13,  2LL,  v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)setCloudFavoriteSongAddToLibraryBehavior:(int64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t StringForAddToLibraryBehavior = ICCloudClientGetStringForAddToLibraryBehavior(a3);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(StringForAddToLibraryBehavior);
    *(_DWORD *)buf = 138543618;
    __int16 v22 = self;
    __int16 v23 = 2114;
    __int16 v24 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting cloud add to library behavior to: %{public}@",  buf,  0x16u);
  }

  id v13 = -[CloudSetFavoriteSongAddToLibraryBehaviorOperation initWithConfiguration:clientIdentity:addToLibraryBehavior:]( objc_alloc(&OBJC_CLASS___CloudSetFavoriteSongAddToLibraryBehaviorOperation),  "initWithConfiguration:clientIdentity:addToLibraryBehavior:",  self->_configuration,  v8,  a3);
  objc_initWeak((id *)buf, v13);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007C988;
  v18[3] = &unk_1001A42C8;
  id v14 = v9;
  id v19 = v14;
  objc_copyWeak(&v20, (id *)buf);
  -[CloudSetFavoriteSongAddToLibraryBehaviorOperation setCompletionBlock:](v13, "setCompletionBlock:", v18);
  -[CloudSetFavoriteSongAddToLibraryBehaviorOperation setName:]( v13,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setAddToLibraryBehaviorOperation");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007C9F8;
  v16[3] = &unk_1001A50C0;
  id v15 = v14;
  id v17 = v15;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v13,  2LL,  v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)setAlbumProperties:(id)a3 forItemsWithAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting album properties %{public}@ on items with album persistent ID: %lld",  buf,  0x20u);
  }

  id v14 = -[SagaSetAlbumItemPropertyOperation initWithConfiguration:clientIdentity:albumPersistentID:albumItemProperties:]( objc_alloc(&OBJC_CLASS___SagaSetAlbumItemPropertyOperation),  "initWithConfiguration:clientIdentity:albumPersistentID:albumItemProperties:",  self->_configuration,  v11,  a4,  v10);
  objc_initWeak((id *)buf, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007C90C;
  v19[3] = &unk_1001A42C8;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  -[SagaSetAlbumItemPropertyOperation setCompletionBlock:](v14, "setCompletionBlock:", v19);
  -[SagaSetAlbumItemPropertyOperation setName:]( v14,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setAlbumPropertiesOperation");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007C974;
  v17[3] = &unk_1001A50C0;
  id v16 = v15;
  id v18 = v16;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v14,  2LL,  v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)setAlbumEntityProperties:(id)a3 withAlbumPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting album properties %{public}@ with album persistent ID: %lld",  buf,  0x20u);
  }

  id v14 = -[SagaSetAlbumPropertyOperation initWithConfiguration:clientIdentity:albumPersistentID:properties:]( objc_alloc(&OBJC_CLASS___SagaSetAlbumPropertyOperation),  "initWithConfiguration:clientIdentity:albumPersistentID:properties:",  self->_configuration,  v11,  a4,  v10);
  objc_initWeak((id *)buf, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007C890;
  v19[3] = &unk_1001A42C8;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  -[SagaSetAlbumPropertyOperation setCompletionBlock:](v14, "setCompletionBlock:", v19);
  -[SagaSetAlbumPropertyOperation setName:]( v14,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setAlbumPropertiesOperation");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007C8F8;
  v17[3] = &unk_1001A50C0;
  id v16 = v15;
  id v18 = v16;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v14,  2LL,  v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)setAlbumArtistProperties:(id)a3 withArtistPersistentID:(int64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = v10;
    __int16 v26 = 2048;
    int64_t v27 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Setting album artist properties %{public}@ on items with album artist persistent ID: %lld",  buf,  0x20u);
  }

  id v14 = -[SagaSetAlbumArtistPropertyOperation initWithConfiguration:clientIdentity:persistentID:properties:]( objc_alloc(&OBJC_CLASS___SagaSetAlbumArtistPropertyOperation),  "initWithConfiguration:clientIdentity:persistentID:properties:",  self->_configuration,  v11,  a4,  v10);
  objc_initWeak((id *)buf, v14);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007C814;
  v19[3] = &unk_1001A42C8;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  -[SagaSetAlbumArtistPropertyOperation setCompletionBlock:](v14, "setCompletionBlock:", v19);
  -[SagaSetAlbumArtistPropertyOperation setName:]( v14,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setAlbumArtistPropertiesOperation");
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007C87C;
  v17[3] = &unk_1001A50C0;
  id v16 = v15;
  id v18 = v16;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v14,  2LL,  v17);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3
{
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  updateCloudLibraryQueue = (dispatch_queue_s *)self->_updateCloudLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007C7C8;
  block[3] = &unk_1001A6600;
  block[4] = self;
  void block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(updateCloudLibraryQueue, block);
  if (a3) {
    *a3 = *((_BYTE *)v9 + 24);
  }
  char v5 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

- (void)importItemArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007C624;
  v14[3] = &unk_1001A4278;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)importScreenshotForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007C480;
  v14[3] = &unk_1001A4278;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)importContainerArtworkForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007C2DC;
  v14[3] = &unk_1001A4278;
  void v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)deprioritizeItemArtworkForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeScreenshotForSagaID:(unint64_t)a3
{
}

- (void)deprioritizeContainerArtworkForSagaID:(unint64_t)a3
{
}

- (void)loadArtworkInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v26 = self;
    __int16 v27 = 2114;
    id v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Got load artwork info request for saga IDs: %{public}@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v13 = [v12 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (!v13)
  {
    id v16 = -[CloudLoadBulkArtworkInfoOperation initWithConfiguration:cloudIDs:]( objc_alloc(&OBJC_CLASS___SagaLoadBulkItemArtworkInfoOperation),  "initWithConfiguration:cloudIDs:",  self->_configuration,  v8);
    objc_initWeak((id *)buf, v16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10007C254;
    v20[3] = &unk_1001A42C8;
    id v17 = v10;
    id v21 = v17;
    objc_copyWeak(&v22, (id *)buf);
    -[SagaLoadBulkItemArtworkInfoOperation setCompletionBlock:](v16, "setCompletionBlock:", v20);
    -[SagaLoadBulkItemArtworkInfoOperation setName:]( v16,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.loadArtworkInfoOperation");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10007C2C0;
    v18[3] = &unk_1001A50C0;
    id v19 = v17;
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v16,  1LL,  v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }

  uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v26 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No WiFi connection, skipping artwork info load.",  buf,  0xCu);
  }

  if (v10)
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007C1F0;
    block[3] = &unk_1001A6BE0;
    __int16 v24 = (SagaLoadBulkItemArtworkInfoOperation *)v10;
    dispatch_async(calloutQueue, block);
    id v16 = v24;
LABEL_9:
  }
}

- (void)loadArtworkInfoForContainerSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v23 = self;
    __int16 v24 = 2114;
    id v25 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Got load artwork info request for container saga IDs: %{public}@",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v13 = [v12 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (!v13)
  {
    id v15 = -[CloudLoadBulkArtworkInfoOperation initWithConfiguration:cloudIDs:]( objc_alloc(&OBJC_CLASS___SagaLoadBulkContainerArtworkInfoOperation),  "initWithConfiguration:cloudIDs:",  self->_configuration,  v8);
    objc_initWeak((id *)buf, v15);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10007C168;
    v19[3] = &unk_1001A42C8;
    id v16 = v10;
    id v20 = v16;
    objc_copyWeak(&v21, (id *)buf);
    -[SagaLoadBulkContainerArtworkInfoOperation setCompletionBlock:](v15, "setCompletionBlock:", v19);
    -[SagaLoadBulkContainerArtworkInfoOperation setName:]( v15,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.loadArtworkInfoOperation");
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10007C1D4;
    v17[3] = &unk_1001A50C0;
    id v18 = v16;
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v15,  1LL,  v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }

  uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    __int16 v23 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No WiFi connection, skipping artwork info load.",  buf,  0xCu);
  }

  if (v10)
  {
    id v15 = (SagaLoadBulkContainerArtworkInfoOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -999LL,  0LL));
    (*((void (**)(id, void, SagaLoadBulkContainerArtworkInfoOperation *))v10 + 2))(v10, 0LL, v15);
LABEL_9:
  }
}

- (void)loadScreenshotInfoForSagaIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  char v11 = (NSMutableArray *)v7;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v42,  v50,  16LL);
  if (!v36)
  {
    id v28 = 0LL;
    __int16 v26 = v11;
LABEL_17:

    __int16 v27 = v28;
    __int16 v32 = v10;
    goto LABEL_18;
  }

  id v30 = v9;
  __int16 v33 = 0LL;
  uint64_t v35 = *(void *)v43;
  uint64_t v34 = ML3TrackPropertyStoreSagaID;
  __int16 v31 = v11;
  __int16 v32 = v10;
LABEL_3:
  uint64_t v12 = 0LL;
  while (1)
  {
    if (*(void *)v43 != v35) {
      objc_enumerationMutation(v11);
    }
    uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * v12);
    -[ML3MusicLibrary setClientIdentity:](self->_musicLibrary, "setClientIdentity:", v8);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v34,  v13));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:",  self->_musicLibrary,  v14));
    id v16 = [[ML3ArtworkTokenSet alloc] initWithEntity:v15 artworkType:2];
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 artworkTokenForSource:200]);
    id v18 = [v17 length];
    if (v18)
    {
      uint64_t ArtworkInfoDictionary = ICCloudClientCreateArtworkInfoDictionary(v17);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(ArtworkInfoDictionary);
      -[NSMutableArray addObject:](v10, "addObject:", v20);
    }

    else
    {
      id v21 = v8;
      id v22 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        id v23 = [v15 persistentID];
        *(_DWORD *)buf = 134217984;
        id v49 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "No saga artwork_token for screenshot item with persistent-id = %lld",  buf,  0xCu);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"No saga artwork_token for screenshot item with persistent-id = %lld",  [v15 persistentID]));
      v46 = @"NSDebugDescription";
      v47 = v20;
      __int16 v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2021LL,  v24));

      __int16 v33 = (void *)v25;
      id v8 = v21;
      char v11 = v31;
      id v10 = v32;
    }

    if (!v18) {
      break;
    }
    if (v36 == (id)++v12)
    {
      id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v42,  v50,  16LL);
      if (v36) {
        goto LABEL_3;
      }
      break;
    }
  }

  __int16 v26 = v10;
  id v10 = 0LL;
  __int16 v27 = 0LL;
  id v9 = v30;
  id v28 = v33;
  if (v33) {
    goto LABEL_17;
  }
LABEL_18:
  if (v9)
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007C154;
    block[3] = &unk_1001A6C08;
    id v41 = v9;
    __int16 v39 = v32;
    id v40 = v27;
    dispatch_async(calloutQueue, block);
  }
}

- (void)loadGeniusItemsForSagaID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = self;
    __int16 v21 = 2048;
    unint64_t v22 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Get genius items for saga ID: %llu",  buf,  0x16u);
  }

  char v11 = -[SagaGetGeniusItemsOperation initWithConfiguration:clientIdentity:seedID:numberOfItems:]( objc_alloc(&OBJC_CLASS___SagaGetGeniusItemsOperation),  "initWithConfiguration:clientIdentity:seedID:numberOfItems:",  self->_configuration,  v8,  a3,  25LL);
  objc_initWeak((id *)buf, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_10007C0CC;
  v16[3] = &unk_1001A42C8;
  id v12 = v9;
  id v17 = v12;
  objc_copyWeak(&v18, (id *)buf);
  -[SagaGetGeniusItemsOperation setCompletionBlock:](v11, "setCompletionBlock:", v16);
  -[SagaGetGeniusItemsOperation setName:]( v11,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.getGeniusItemsOperation");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007C138;
  v14[3] = &unk_1001A50C0;
  id v13 = v12;
  id v15 = v13;
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v11,  2LL,  v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (void)setItemProperties:(id)a3 forSagaID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v26 = self;
    __int16 v27 = 2048;
    unint64_t v28 = a4;
    __int16 v29 = 2114;
    id v30 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Updating item properties for sagaID %lld. properties=%{public}@",  buf,  0x20u);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"daap.incrementplaycount"]);
  if (v14
    || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"daap.incrementskipcount"])) != 0
    || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"daap.songdateadded"])) != 0
    || (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:ML3TrackPropertyDatePlayed])) != 0)
  {

LABEL_8:
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10007C048;
    v23[3] = &unk_1001A50C0;
    __int16 v24 = (SagaSetItemPropertyOperation *)v12;
    -[SagaRequestHandler updateItemPlayDataWithClientIdentity:completionHandler:]( self,  "updateItemPlayDataWithClientIdentity:completionHandler:",  v11,  v23);
    id v15 = v24;
    goto LABEL_9;
  }

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:ML3TrackPropertyDateSkipped]);
  BOOL v17 = v16 == 0LL;

  if (!v17) {
    goto LABEL_8;
  }
  os_log_t v18 = sub_1000DD86C();
  id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    __int16 v26 = self;
    __int16 v27 = 2114;
    unint64_t v28 = (unint64_t)v10;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Issuing immediate property change: %{public}@",  buf,  0x16u);
  }

  id v15 = -[SagaSetItemPropertyOperation initWithConfiguration:clientIdentity:sagaID:properties:]( objc_alloc(&OBJC_CLASS___SagaSetItemPropertyOperation),  "initWithConfiguration:clientIdentity:sagaID:properties:",  self->_configuration,  v11,  a4,  v10);
  objc_initWeak((id *)buf, v15);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10007C05C;
  v20[3] = &unk_1001A42C8;
  id v21 = v12;
  objc_copyWeak(&v22, (id *)buf);
  -[SagaSetItemPropertyOperation setCompletionBlock:](v15, "setCompletionBlock:", v20);
  -[SagaSetItemPropertyOperation setName:]( v15,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setItemPropertyOperation");
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v15,  2LL,  0LL);
  objc_destroyWeak(&v22);

  objc_destroyWeak((id *)buf);
LABEL_9:
}

- (float)updateProgress
{
  uint64_t v6 = 0LL;
  id v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000LL;
  int v9 = 0;
  updateCloudLibraryQueue = (dispatch_queue_s *)self->_updateCloudLibraryQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10007C010;
  v5[3] = &unk_1001A65D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(updateCloudLibraryQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 storeID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = NSStringFromICFavoriteMediaEntityType(a5);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    *(_DWORD *)buf = 138543874;
    __int16 v29 = self;
    __int16 v30 = 2048;
    int64_t v31 = a4;
    __int16 v32 = 2114;
    __int16 v33 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - favoriting entity with storeID=%lld, entityType=%{public}@",  buf,  0x20u);
  }

  BOOL v17 = objc_alloc(&OBJC_CLASS___SagaFavoriteEntityOperation);
  configuration = self->_configuration;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  id v20 = -[SagaFavoriteEntityOperation initWithConfiguration:clientIdentity:persistentID:storeID:entityType:time:]( v17,  "initWithConfiguration:clientIdentity:persistentID:storeID:entityType:time:",  configuration,  v19,  a3,  a4,  a5,  v12);

  -[SagaFavoriteEntityOperation setName:]( v20,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.favoriteEntityOperation");
  objc_initWeak((id *)buf, v20);
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  __int16 v24 = sub_10007BFA0;
  uint64_t v25 = &unk_1001A42C8;
  id v21 = v13;
  id v26 = v21;
  objc_copyWeak(&v27, (id *)buf);
  -[SagaFavoriteEntityOperation setCompletionBlock:](v20, "setCompletionBlock:", &v22);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v20,  2LL,  0LL,  v22,  v23,  v24,  v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak((id *)buf);
}

- (void)favoritePlaylistWithPersistentID:(int64_t)a3 globalID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = self;
    __int16 v27 = 2114;
    id v28 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - favoriting playlist with globalID=%{public}@}",  buf,  0x16u);
  }

  uint64_t v14 = objc_alloc(&OBJC_CLASS___SagaFavoriteEntityOperation);
  configuration = self->_configuration;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  BOOL v17 = -[SagaFavoriteEntityOperation initWithConfiguration:clientIdentity:persistentID:globalPlaylistID:time:]( v14,  "initWithConfiguration:clientIdentity:persistentID:globalPlaylistID:time:",  configuration,  v16,  a3,  v10,  v11);

  -[SagaFavoriteEntityOperation setName:]( v17,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.favoritePlaylistEntityOperation");
  objc_initWeak((id *)buf, v17);
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_10007BF30;
  id v22 = &unk_1001A42C8;
  id v18 = v12;
  id v23 = v18;
  objc_copyWeak(&v24, (id *)buf);
  -[SagaFavoriteEntityOperation setCompletionBlock:](v17, "setCompletionBlock:", &v19);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v17,  2LL,  0LL,  v19,  v20,  v21,  v22);
  objc_destroyWeak(&v24);

  objc_destroyWeak((id *)buf);
}

- (void)favoriteEntityWithPersistentID:(int64_t)a3 sagaID:(int64_t)a4 entityType:(int64_t)a5 time:(id)a6 completionHandler:(id)a7
{
  id v11 = a6;
  id v12 = a7;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  uint64_t v14 = v13;
  if ((unint64_t)a5 <= 1)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = NSStringFromICFavoriteMediaEntityType(a5);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543874;
      __int128 v42 = self;
      __int16 v43 = 2048;
      int64_t v44 = a4;
      __int16 v45 = 2114;
      int64_t v46 = (int64_t)v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - favoriting entity with cloudID=%lld, entityType=%{public}@",  buf,  0x20u);
    }

    BOOL v17 = a5 == 0;

    id v18 = (void **)&ML3TrackPropertyLikedState;
    if (!v17) {
      id v18 = (void **)&ML3ContainerPropertyLikedState;
    }
    id v19 = *v18;
    if (v17) {
      uint64_t v20 = (id *)&ML3TrackPropertyLikedStateChangedDate;
    }
    else {
      uint64_t v20 = (id *)&ML3ContainerPropertyLikedStateChangedDate;
    }
    id v21 = v19;
    id v22 = *v20;
    v39[0] = v21;
    v39[1] = v22;
    v40[0] = &off_1001B3F40;
    v40[1] = v11;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));
    id v24 = objc_alloc(&OBJC_CLASS___SagaSetItemPropertyOperation);
    configuration = self->_configuration;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
    __int16 v27 = -[SagaSetItemPropertyOperation initWithConfiguration:clientIdentity:sagaID:properties:]( v24,  "initWithConfiguration:clientIdentity:sagaID:properties:",  configuration,  v26,  a4,  v23);

    objc_initWeak((id *)buf, v27);
    int64_t v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    __int16 v33 = sub_10007BEC0;
    uint64_t v34 = &unk_1001A42C8;
    id v35 = v12;
    objc_copyWeak(&v36, (id *)buf);
    -[SagaSetItemPropertyOperation setCompletionBlock:](v27, "setCompletionBlock:", &v31);
    -[SagaSetItemPropertyOperation setName:]( v27,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.setItemPropertyOperation",  v31,  v32,  v33,  v34);
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v27,  2LL,  0LL);
    objc_destroyWeak(&v36);

    objc_destroyWeak((id *)buf);
    goto LABEL_14;
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    uint64_t v28 = NSStringFromICFavoriteMediaEntityType(a5);
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 138543874;
    __int128 v42 = self;
    __int16 v43 = 2114;
    int64_t v44 = (int64_t)v29;
    __int16 v45 = 2048;
    int64_t v46 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%{public}@ - unsupported entityType=%{public}@ to favorite with entity with sagaID=%lld",  buf,  0x20u);
  }

  if (v12)
  {
    v37[0] = @"entityType";
    uint64_t v30 = NSStringFromICFavoriteMediaEntityType(a5);
    id v21 = (id)objc_claimAutoreleasedReturnValue(v30);
    v38[0] = v21;
    v37[1] = @"sagaID";
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", a4));
    v38[1] = v22;
    v37[2] = @"action";
    v38[2] = @"favorite";
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v38,  v37,  3LL));
    __int16 v27 = (SagaSetItemPropertyOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  v23));
    (*((void (**)(id, SagaSetItemPropertyOperation *))v12 + 2))(v12, v27);
LABEL_14:
  }
}

- (void)favoriteAlbumWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 length];
  uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = self;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - favoriting album with cloudID=%{public}@}",  buf,  0x16u);
    }

    id v16 = objc_alloc(&OBJC_CLASS___SagaFavoriteEntityOperation);
    configuration = self->_configuration;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
    id v19 = -[SagaFavoriteEntityOperation initWithConfiguration:clientIdentity:persistentID:albumCloudLibraryID:time:]( v16,  "initWithConfiguration:clientIdentity:persistentID:albumCloudLibraryID:time:",  configuration,  v18,  a3,  v10,  v11);

    -[SagaFavoriteEntityOperation setName:]( v19,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.favoriteCloudAlbumEntityOperation");
    objc_initWeak((id *)buf, v19);
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    uint64_t v25 = sub_10007BE50;
    id v26 = &unk_1001A42C8;
    id v27 = v12;
    objc_copyWeak(&v28, (id *)buf);
    -[SagaFavoriteEntityOperation setCompletionBlock:](v19, "setCompletionBlock:", &v23);
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v19,  2LL,  0LL,  v23,  v24,  v25,  v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = self;
    __int16 v33 = 2114;
    id v34 = v10;
    __int16 v35 = 2114;
    id v36 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ - cannot favorite album with invalid cloud-library-id=%{public}@ timeStamp=%{public}@",  buf,  0x20u);
  }

  if (v12)
  {
    v29[0] = @"entityType";
    uint64_t v20 = NSStringFromICFavoriteMediaEntityType(3LL);
    id v19 = (SagaFavoriteEntityOperation *)objc_claimAutoreleasedReturnValue(v20);
    v29[1] = @"action";
    v30[0] = v19;
    v30[1] = @"favorite";
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  v21));
    (*((void (**)(id, void *))v12 + 2))(v12, v22);

LABEL_9:
  }
}

- (void)favoriteArtistWithPersistentID:(int64_t)a3 cloudLibraryID:(id)a4 time:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 length];
  uint64_t v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  uint64_t v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = self;
      __int16 v33 = 2114;
      id v34 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - favoriting artist with cloudID=%{public}@}",  buf,  0x16u);
    }

    id v16 = objc_alloc(&OBJC_CLASS___SagaFavoriteEntityOperation);
    configuration = self->_configuration;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
    id v19 = -[SagaFavoriteEntityOperation initWithConfiguration:clientIdentity:persistentID:artistCloudLibraryID:time:]( v16,  "initWithConfiguration:clientIdentity:persistentID:artistCloudLibraryID:time:",  configuration,  v18,  a3,  v10,  v11);

    -[SagaFavoriteEntityOperation setName:]( v19,  "setName:",  @"com.apple.itunescloudd.SagaRequestHandler.favoriteCloudArtistEntityOperation");
    objc_initWeak((id *)buf, v19);
    id v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    uint64_t v25 = sub_10007BDE0;
    id v26 = &unk_1001A42C8;
    id v27 = v12;
    objc_copyWeak(&v28, (id *)buf);
    -[SagaFavoriteEntityOperation setCompletionBlock:](v19, "setCompletionBlock:", &v23);
    -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v19,  2LL,  0LL,  v23,  v24,  v25,  v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v32 = self;
    __int16 v33 = 2114;
    id v34 = v10;
    __int16 v35 = 2114;
    id v36 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%{public}@ - cannot favorite album artist with invalid cloud-library-id=%{public}@, timeStamp=%{public}@",  buf,  0x20u);
  }

  if (v12)
  {
    v29[0] = @"entityType";
    uint64_t v20 = NSStringFromICFavoriteMediaEntityType(2LL);
    id v19 = (SagaFavoriteEntityOperation *)objc_claimAutoreleasedReturnValue(v20);
    v29[1] = @"action";
    v30[0] = v19;
    v30[1] = @"favorite";
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ICErrorDomain,  -7101LL,  v21));
    (*((void (**)(id, void *))v12 + 2))(v12, v22);

LABEL_9:
  }
}

- (void)beginCollaborationUsingPlaylistWithPersistentID:(int64_t)a3 sharingMode:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  int v9 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = self;
    __int16 v19 = 2048;
    int64_t v20 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - starting collaboration using playlist with persistentID %lld",  buf,  0x16u);
  }

  id v10 = self->_configuration;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](self->_configuration, "clientIdentity"));
  id v12 = -[SagaCollaborationBeginOperation initWithConfiguration:clientIdentity:playlistPersistentID:sharingMode:]( objc_alloc(&OBJC_CLASS___SagaCollaborationBeginOperation),  "initWithConfiguration:clientIdentity:playlistPersistentID:sharingMode:",  v10,  v11,  a3,  a4);
  objc_initWeak((id *)buf, v12);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10007BCA0;
  v14[3] = &unk_1001A4D70;
  objc_copyWeak(&v16, (id *)buf);
  id v13 = v8;
  void v14[4] = self;
  id v15 = v13;
  -[SagaCollaborationBeginOperation setCompletionBlock:](v12, "setCompletionBlock:", v14);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v12,  2LL,  0LL);

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)buf);
}

- (void)endCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    BOOL v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - ending collaboration for playlist with persistent ID %lld",  buf,  0x16u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___SagaCollaborationEndOperation);
  configuration = self->_configuration;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  id v11 = -[SagaCollaborationEndOperation initWithConfiguration:clientIdentity:collaborationPersistentID:]( v8,  "initWithConfiguration:clientIdentity:collaborationPersistentID:",  configuration,  v10,  a3);

  objc_initWeak((id *)buf, v11);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007BB60;
  v13[3] = &unk_1001A4D70;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v6;
  v13[4] = self;
  id v14 = v12;
  -[SagaCollaborationEndOperation setCompletionBlock:](v11, "setCompletionBlock:", v13);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v11,  2LL,  0LL);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)editCollaborationWithPersistentID:(int64_t)a3 properties:(id)a4 trackEdits:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v23 = self;
    __int16 v24 = 2048;
    int64_t v25 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - editing a collaboration with persistentID %lld",  buf,  0x16u);
  }

  id v14 = objc_alloc(&OBJC_CLASS___SagaCollaborationEditOperation);
  configuration = self->_configuration;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  BOOL v17 = -[SagaCollaborationEditOperation initWithConfiguration:clientIdentity:collaborationPersistentID:properties:trackEdits:]( v14,  "initWithConfiguration:clientIdentity:collaborationPersistentID:properties:trackEdits:",  configuration,  v16,  a3,  v10,  v11);

  objc_initWeak((id *)buf, v17);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10007BA28;
  v19[3] = &unk_1001A4D70;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v12;
  void v19[4] = self;
  id v20 = v18;
  -[SagaCollaborationEditOperation setCompletionBlock:](v17, "setCompletionBlock:", v19);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v17,  2LL,  0LL);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (void)joinCollaborationWithGlobalPlaylistID:(id)a3 invitationURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - joining collaboration for playlist with cloud ID %{public}@",  buf,  0x16u);
  }

  id v12 = objc_alloc(&OBJC_CLASS___SagaCollaborationJoinOperation);
  configuration = self->_configuration;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  id v15 = -[SagaCollaborationJoinOperation initWithConfiguration:clientIdentity:globalPlaylistID:invitationURL:]( v12,  "initWithConfiguration:clientIdentity:globalPlaylistID:invitationURL:",  configuration,  v14,  v8,  v9);

  objc_initWeak((id *)buf, v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007B8E8;
  v17[3] = &unk_1001A4D70;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v10;
  void v17[4] = self;
  id v18 = v16;
  -[SagaCollaborationJoinOperation setCompletionBlock:](v15, "setCompletionBlock:", v17);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v15,  2LL,  0LL);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)respondToPendingCollaborator:(id)a3 onCollaborationWithPersistentID:(int64_t)a4 withApproval:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    __int16 v22 = self;
    __int16 v23 = 2114;
    id v24 = v10;
    __int16 v25 = 2048;
    int64_t v26 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - responding to approval request from user %{public}@ for collaboration persistentID %lld",  buf,  0x20u);
  }

  id v13 = objc_alloc(&OBJC_CLASS___SagaCollaborationRespondToPendingCollaboratorOperation);
  configuration = self->_configuration;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  id v16 = -[SagaCollaborationRespondToPendingCollaboratorOperation initWithConfiguration:clientIdentity:persistentID:socialProfileID:approval:]( v13,  "initWithConfiguration:clientIdentity:persistentID:socialProfileID:approval:",  configuration,  v15,  a4,  v10,  v7);

  objc_initWeak((id *)buf, v16);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10007B7B0;
  v18[3] = &unk_1001A4D70;
  objc_copyWeak(&v20, (id *)buf);
  id v17 = v11;
  void v18[4] = self;
  id v19 = v17;
  -[SagaCollaborationRespondToPendingCollaboratorOperation setCompletionBlock:](v16, "setCompletionBlock:", v18);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v16,  2LL,  0LL);

  objc_destroyWeak(&v20);
  objc_destroyWeak((id *)buf);
}

- (void)removeCollaborators:(id)a3 fromCollaborationWithPersistentID:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@","]);
    *(_DWORD *)buf = 138543874;
    id v21 = self;
    __int16 v22 = 2114;
    __int16 v23 = v11;
    __int16 v24 = 2048;
    int64_t v25 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - removing users (%{public}@) for persistendID %lld",  buf,  0x20u);
  }

  id v12 = objc_alloc(&OBJC_CLASS___SagaCollaborationRemoveCollaboratorsOperation);
  configuration = self->_configuration;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  id v15 = -[SagaCollaborationRemoveCollaboratorsOperation initWithConfiguration:clientIdentity:persistentID:socialProfileIDs:]( v12,  "initWithConfiguration:clientIdentity:persistentID:socialProfileIDs:",  configuration,  v14,  a4,  v8);

  objc_initWeak((id *)buf, v15);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10007B678;
  v17[3] = &unk_1001A4D70;
  objc_copyWeak(&v19, (id *)buf);
  id v16 = v9;
  void v17[4] = self;
  id v18 = v16;
  -[SagaCollaborationRemoveCollaboratorsOperation setCompletionBlock:](v15, "setCompletionBlock:", v17);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v15,  2LL,  0LL);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)resetInvitationURLForCollaborationWithPersistentID:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - resetting invitation link for persistentID %lld",  buf,  0x16u);
  }

  id v8 = objc_alloc(&OBJC_CLASS___SagaCollaborationResetInvitationURLOperation);
  configuration = self->_configuration;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](configuration, "clientIdentity"));
  id v11 = -[SagaCollaborationResetInvitationURLOperation initWithConfiguration:clientIdentity:persistentID:]( v8,  "initWithConfiguration:clientIdentity:persistentID:",  configuration,  v10,  a3);

  objc_initWeak((id *)buf, v11);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007B50C;
  v13[3] = &unk_1001A4D70;
  objc_copyWeak(&v15, (id *)buf);
  id v12 = v6;
  v13[4] = self;
  id v14 = v12;
  -[SagaCollaborationResetInvitationURLOperation setCompletionBlock:](v11, "setCompletionBlock:", v13);
  -[SagaRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v11,  2LL,  0LL);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)environmentMonitorDidChangePower:(id)a3
{
  id v4 = a3;
  char v5 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceInfo currentDeviceInfo](&OBJC_CLASS___ICDeviceInfo, "currentDeviceInfo"));
  unsigned int v6 = [v5 isWatch];

  if (v6)
  {
    unsigned int v7 = [v4 isCharging];
    id v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v9)
      {
        int v12 = 138543362;
        id v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Device is plugged in - checking for artwork to download",  (uint8_t *)&v12,  0xCu);
      }

      artworkImporter = self->_artworkImporter;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](self->_configuration, "clientIdentity"));
      -[SagaArtworkImporter importAllItemArtworkWithClientIdentity:]( artworkImporter,  "importAllItemArtworkWithClientIdentity:",  v11);
    }

    else
    {
      if (v9)
      {
        int v12 = 138543362;
        id v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Device was unplugged from power - cancelling artwork downloads",  (uint8_t *)&v12,  0xCu);
      }

      -[CloudArtworkImporter cancelAllImports](self->_artworkImporter, "cancelAllImports");
    }
  }
}

- (id)_library
{
  library = self->_library;
  if (!library || -[CloudLibrary failedToConnect](library, "failedToConnect"))
  {
    id v4 = -[SagaLibrary initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SagaLibrary),  "initWithConfiguration:",  self->_configuration);
    char v5 = self->_library;
    self->_library = v4;
  }

  return self->_library;
}

- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v12 = a3;
  id v8 = (void (**)(id, void *))a5;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[SagaRequestHandler _library](self, "_library"));
  id v10 = v9;
  if (v9)
  {
    [v9 addOperation:v12 priority:v6];
  }

  else if (v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2009LL,  0LL));
    v8[2](v8, v11);
  }
}

- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 allowNoisyAuthPrompt:(BOOL)a5 isExplicitUserAction:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a7;
  id v14 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t StringForRequestReason = ICCloudClientGetStringForRequestReason(a4);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(StringForRequestReason);
    *(_DWORD *)buf = 138544130;
    v73 = self;
    __int16 v74 = 2114;
    *(void *)v75 = v16;
    *(_WORD *)&v75[8] = 1024;
    LODWORD(v76[0]) = v9;
    WORD2(v76[0]) = 1024;
    *(_DWORD *)((char *)v76 + 6) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to update cloud library (requestReason = %{public}@), allowNoisyAuthPrompt=%{BOOL}u, isExplicitUserAction=%{BOOL}u",  buf,  0x22u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v18 = [v17 shouldProhibitMusicActionForCurrentNetworkConditions];

  if (!v18)
  {
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[ICPrivacyInfo sharedPrivacyInfoForUserIdentity:]( &OBJC_CLASS___ICPrivacyInfo,  "sharedPrivacyInfoForUserIdentity:",  v24));
    unsigned int v26 = [v25 privacyAcknowledgementRequiredForMedia];

    if (v26)
    {
      id v27 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Skipping update because privacy acknowledgement is required",  buf,  0xCu);
      }

      if (!v13) {
        goto LABEL_47;
      }
      calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472LL;
      v68[2] = sub_10007A9E4;
      v68[3] = &unk_1001A6BE0;
      id v69 = v13;
      dispatch_async(calloutQueue, v68);
      __int16 v29 = v69;
      goto LABEL_46;
    }

    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[SagaRequestHandler _library](self, "_library"));
    __int16 v29 = (void *)v30;
    if (!v30)
    {
      id v41 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v73 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Could not initialize saga library",  buf,  0xCu);
      }

      if (!v13)
      {
        __int16 v29 = 0LL;
LABEL_46:

        goto LABEL_47;
      }

      __int128 v42 = (dispatch_queue_s *)self->_calloutQueue;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472LL;
      v66[2] = sub_10007AA44;
      v66[3] = &unk_1001A6BE0;
      id v67 = v13;
      dispatch_async(v42, v66);
      id v34 = v67;
LABEL_45:

      goto LABEL_46;
    }

    v51 = v24;
    v52 = v12;
    id v49 = (void *)v30;
    int64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
    id v65 = 0LL;
    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 getPropertiesForUserIdentity:v32 error:&v65]);
    id v34 = v65;

    v50 = v33;
    if (!v33 || v34)
    {
      __int16 v43 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      id v12 = v52;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v73 = self;
        __int16 v74 = 2114;
        *(void *)v75 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%{public}@ - Could not load user identity properties. error=%{public}@",  buf,  0x16u);
      }

      __int16 v29 = v49;
      if (!v13) {
        goto LABEL_44;
      }
      int64_t v44 = (dispatch_queue_s *)self->_calloutQueue;
      v62[0] = _NSConcreteStackBlock;
      v62[1] = 3221225472LL;
      v62[2] = sub_10007AA98;
      v62[3] = &unk_1001A6BB8;
      id v64 = v13;
      id v63 = v34;
      dispatch_async(v44, v62);

      id v35 = v64;
    }

    else if ([v33 isActiveLocker])
    {
      -[ML3MusicLibrary setClientIdentity:](self->_musicLibrary, "setClientIdentity:", v52);
      id v35 = (id)objc_claimAutoreleasedReturnValue([v33 DSID]);
      id v36 = (id)objc_claimAutoreleasedReturnValue(-[ML3MusicLibrary sagaAccountID](self->_musicLibrary, "sagaAccountID"));
      if (v35 == v36)
      {
      }

      else
      {
        unsigned __int8 v37 = [v35 isEqual:v36];

        if ((v37 & 1) == 0)
        {
          id v38 = v36;
          if (v36)
          {
            os_log_t v39 = sub_1000DD86C();
            id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543874;
              v73 = self;
              __int16 v74 = 2114;
              *(void *)v75 = v38;
              *(_WORD *)&v75[8] = 2114;
              v76[0] = v35;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_FAULT,  "%{public}@ - CloudIds are different. oldValue=%{public}@, currentValue=%{public}@}",  buf,  0x20u);
            }

            +[MSVAutoBugCapture snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:]( &OBJC_CLASS___MSVAutoBugCapture,  "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:",  MSVAutoBugCaptureDomainiTunesCloud,  @"Bug",  @"Different Cloud IDS",  &stru_1001A7960,  &stru_1001A7960,  0LL,  0LL);
          }

          -[ML3MusicLibrary setSagaAccountID:](self->_musicLibrary, "setSagaAccountID:", v35);
          id v36 = v38;
        }
      }

      updateCloudLibraryQueue = self->_updateCloudLibraryQueue;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_10007AAFC;
      v53[3] = &unk_1001A3D78;
      id v56 = v13;
      int64_t v57 = a4;
      v53[4] = self;
      id v54 = v52;
      BOOL v58 = v9;
      BOOL v59 = v8;
      id v55 = v49;
      v48 = (dispatch_queue_s *)updateCloudLibraryQueue;
      __int16 v29 = v49;
      dispatch_async(v48, v53);
    }

    else
    {
      __int16 v45 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
      __int16 v29 = v49;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v73 = self;
        __int16 v74 = 1024;
        *(_DWORD *)v75 = a4;
        *(_WORD *)&v75[4] = 1024;
        *(_DWORD *)&v75[6] = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%{public}@ - Locker bit is not set on the account. Will not updateLibrary for reason=%d, allowNoisyAuthPrompt=%{BOOL}u",  buf,  0x18u);
      }

      id v12 = v52;
      if (!v13) {
        goto LABEL_44;
      }
      int64_t v46 = (dispatch_queue_s *)self->_calloutQueue;
      v60[0] = _NSConcreteStackBlock;
      v60[1] = 3221225472LL;
      v60[2] = sub_10007AAA8;
      v60[3] = &unk_1001A6BE0;
      id v61 = v13;
      dispatch_async(v46, v60);
      id v35 = v61;
    }

    id v12 = v52;
LABEL_44:

    __int16 v24 = v51;
    goto LABEL_45;
  }

  int64_t v19 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = ICCloudClientGetStringForRequestReason(a4);
    id v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    *(_DWORD *)buf = 138543618;
    v73 = self;
    __int16 v74 = 2114;
    *(void *)v75 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No WiFi connection, skipping update (requestReason = %{public}@)",  buf,  0x16u);
  }

  if (a4 == 2)
  {
    __int16 v22 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v73 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Rescheduling push notification triggered update when WiFi becomes available.",  buf,  0xCu);
    }

    -[ICDCloudMusicLibrarySagaUpdateTaskHelper scheduleBackgroundTaskToUpdateLibraryType:]( self->_updateTaskHelper,  "scheduleBackgroundTaskToUpdateLibraryType:",  1LL);
  }

  if (v13)
  {
    __int16 v23 = (dispatch_queue_s *)self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10007A9D4;
    block[3] = &unk_1001A6BE0;
    id v71 = v13;
    dispatch_async(v23, block);
    __int16 v24 = v71;
LABEL_47:
  }
}

- (void)_handleCloudLibraryUpdateOperationFinishedWithError:(id)a3
{
  id v4 = a3;
  id v5 = -[NSMutableArray copy](self->_updateLibraryCompletionHandlers, "copy");
  if ([v5 count])
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    BOOL v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    id v11 = sub_10007A8C0;
    id v12 = &unk_1001A6C30;
    id v13 = v5;
    id v14 = v4;
    dispatch_async(calloutQueue, &v9);
  }

  -[NSMutableArray removeAllObjects](self->_updateLibraryCompletionHandlers, "removeAllObjects", v9, v10, v11, v12);
  updateCloudLibraryOperation = self->_updateCloudLibraryOperation;
  self->_updateCloudLibraryOperation = 0LL;

  BOOL v8 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Posting Saga update in progress changed notification",  buf,  0xCu);
  }
}

- (void)_handleLibraryEditOperationCompletionUpdatingLibrary:(BOOL)a3 andSubscribedPlaylist:(unint64_t)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration clientIdentity](self->_configuration, "clientIdentity"));
  if (v6)
  {
    uint64_t v10 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int16 v23 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Requesting library update because the response contained update-required flag",  buf,  0xCu);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10007A3C0;
    v17[3] = &unk_1001A3DA0;
    void v17[4] = self;
    unint64_t v20 = a4;
    id v19 = v8;
    id v18 = v9;
    -[SagaRequestHandler updateLibraryWithClientIdentity:reason:allowNoisyAuthPrompt:isExplicitUserAction:completionHandler:]( self,  "updateLibraryWithClientIdentity:reason:allowNoisyAuthPrompt:isExplicitUserAction:completionHandler:",  v18,  8LL,  1LL,  0LL,  v17);

    id v11 = v19;
  }

  else
  {
    if (!a4)
    {
      (*((void (**)(id, void))v8 + 2))(v8, 0LL);
      goto LABEL_10;
    }

    id v12 = os_log_create("com.apple.amp.itunescloudd", "CloudSync");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v23 = self;
      __int16 v24 = 2048;
      unint64_t v25 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Requesting subscribed playlist update for %lld",  buf,  0x16u);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    id v21 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10007A630;
    v15[3] = &unk_1001A7220;
    void v15[4] = self;
    id v16 = v8;
    -[SagaRequestHandler updateSubscribedPlaylistsWithSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:clientIdentity:completionHandler:]( self,  "updateSubscribedPlaylistsWithSagaIDs:ignoreMinRefreshInterval:requestReason:pinnedOnly:clientIdentity:completionHandler:",  v14,  1LL,  8LL,  0LL,  v9,  v15);

    id v11 = v16;
  }

LABEL_10:
}

- (void).cxx_destruct
{
}

@end