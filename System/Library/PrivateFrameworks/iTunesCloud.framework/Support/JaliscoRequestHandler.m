@interface JaliscoRequestHandler
- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3;
- (JaliscoArtworkImporter)artworkImporter;
- (JaliscoLibrary)jaliscoLibrary;
- (JaliscoMediaUpdateOperation)updateLibraryOperation;
- (JaliscoRequestHandler)initWithConfiguration:(id)a3 updateTaskHelper:(id)a4;
- (NSMutableArray)updateLibraryCompletionHandlers;
- (OS_dispatch_queue)updateLibraryQueue;
- (float)updateProgress;
- (id)_DAAPMediaKindFromJaliscoSupportedMediaKind:(int64_t)a3;
- (id)jaliscoLibraryWithReason:(int64_t)a3;
- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5;
- (void)_updateJaliscoLibraryWithClientIdentity:(id)a3 completion:(id)a4;
- (void)addOperation:(id)a3 priority:(int)a4;
- (void)cancelAllOperations;
- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3;
- (void)cancelOperationsWithCompletionHandler:(id)a3;
- (void)cancelPendingChanges;
- (void)cancelPendingChangesWithCompletion:(id)a3;
- (void)dealloc;
- (void)decreasePriorityForAllOperations;
- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3;
- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3;
- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)increasePriorityForAllOperations;
- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5;
- (void)loadMissingArtworkWithClientIdentity:(id)a3;
- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5;
- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4;
- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6;
- (void)setUpdateLibraryOperation:(id)a3;
- (void)updateJaliscoLibraryByRemovingMediaKind:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5;
- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5;
- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation JaliscoRequestHandler

- (JaliscoRequestHandler)initWithConfiguration:(id)a3 updateTaskHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___JaliscoRequestHandler;
  v9 = -[JaliscoRequestHandler init](&v22, "init");
  if (v9)
  {
    v10 = -[JaliscoArtworkImporter initWithConfiguration:]( objc_alloc(&OBJC_CLASS___JaliscoArtworkImporter),  "initWithConfiguration:",  v7);
    artworkImporter = v9->_artworkImporter;
    v9->_artworkImporter = v10;

    dispatch_queue_t v12 = dispatch_queue_create("com.apple.itunescloudd.JaliscoRequestHandler.updateLibraryQueue", 0LL);
    updateLibraryQueue = v9->_updateLibraryQueue;
    v9->_updateLibraryQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.itunescloudd.JaliscoRequestHandler.calloutQueue", 0LL);
    calloutQueue = v9->_calloutQueue;
    v9->_calloutQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v9->_updateTaskHelper, a4);
    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    updateLibraryCompletionHandlers = v9->_updateLibraryCompletionHandlers;
    v9->_updateLibraryCompletionHandlers = v16;

    objc_storeStrong((id *)&v9->_configuration, a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v7 userIdentity]);
    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[ML3MusicLibrary musicLibraryForUserAccount:]( &OBJC_CLASS___ML3MusicLibrary,  "musicLibraryForUserAccount:",  v18));
    musicLibrary = v9->_musicLibrary;
    v9->_musicLibrary = (ML3MusicLibrary *)v19;
  }

  return v9;
}

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
      id v8 = 0LL;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8LL * (void)v8) + 16LL))();
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___JaliscoRequestHandler;
  -[JaliscoRequestHandler dealloc](&v9, "dealloc");
}

- (void)addOperation:(id)a3 priority:(int)a4
{
  if (a3)
  {
    uint64_t v4 = *(void *)&a4;
    id v6 = a3;
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler jaliscoLibrary](self, "jaliscoLibrary"));
    [v7 addOperation:v6 priority:v4];
  }

- (void)cancelPendingChangesWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    jaliscoLibrary = self->_jaliscoLibrary;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](jaliscoLibrary, "pendingChangesCoordinator"));
    int v11 = 138543874;
    __int128 v12 = self;
    __int16 v13 = 2112;
    dispatch_queue_t v14 = jaliscoLibrary;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - cancelPendingChangesWithCompletion: - Library=%@ - PendingChangesCoordinator:%@",  (uint8_t *)&v11,  0x20u);
  }

  id v8 = self->_jaliscoLibrary;
  if (v8
    && (objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](v8, "pendingChangesCoordinator")),
        v9,
        v9))
  {
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue(-[CloudLibrary pendingChangesCoordinator](self->_jaliscoLibrary, "pendingChangesCoordinator"));
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

- (JaliscoLibrary)jaliscoLibrary
{
  return (JaliscoLibrary *)-[JaliscoRequestHandler jaliscoLibraryWithReason:](self, "jaliscoLibraryWithReason:", 0LL);
}

- (id)jaliscoLibraryWithReason:(int64_t)a3
{
  if (a3 == 1001 && self->_jaliscoLibrary)
  {
    id v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t StringForRequestReason = ICCloudClientGetStringForRequestReason(1001LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(StringForRequestReason);
      *(_DWORD *)buf = 138543618;
      objc_super v22 = self;
      __int16 v23 = 2114;
      v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Clearing library for %{public}@",  buf,  0x16u);
    }

    jaliscoLibrary = self->_jaliscoLibrary;
    self->_jaliscoLibrary = 0LL;

    objc_super v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler updateLibraryQueue](self, "updateLibraryQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100095884;
    block[3] = &unk_1001A6B90;
    block[4] = self;
    dispatch_sync(v9, block);
  }

  if (-[CloudLibrary failedToConnect](self->_jaliscoLibrary, "failedToConnect"))
  {
    __int128 v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      objc_super v22 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Clearing library which failed to connect",  buf,  0xCu);
    }

    int v11 = self->_jaliscoLibrary;
    self->_jaliscoLibrary = 0LL;

    __int128 v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler updateLibraryQueue](self, "updateLibraryQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000958B8;
    v19[3] = &unk_1001A6B90;
    v19[4] = self;
    dispatch_sync(v12, v19);
  }

  __int16 v13 = self->_jaliscoLibrary;
  if (!v13)
  {
    id v14 = -[ICConnectionConfiguration copy](self->_configuration, "copy");
    __int16 v15 = v14;
    if (a3) {
      [v14 setRequestReason:a3];
    }
    v16 = -[JaliscoLibrary initWithConfiguration:]( objc_alloc(&OBJC_CLASS___JaliscoLibrary),  "initWithConfiguration:",  v15);
    v17 = self->_jaliscoLibrary;
    self->_jaliscoLibrary = v16;

    __int16 v13 = self->_jaliscoLibrary;
  }

  return v13;
}

- (BOOL)isUpdateInProgressWithIsInitialImport:(BOOL *)a3
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  char v16 = 0;
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  char v12 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler updateLibraryQueue](self, "updateLibraryQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100095834;
  block[3] = &unk_1001A6600;
  block[4] = self;
  void block[5] = &v13;
  block[6] = &v9;
  dispatch_sync(v5, block);

  if (a3) {
    *a3 = *((_BYTE *)v10 + 24);
  }
  char v6 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (float)updateProgress
{
  uint64_t v7 = 0LL;
  id v8 = (float *)&v7;
  uint64_t v9 = 0x2020000000LL;
  int v10 = 0;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler updateLibraryQueue](self, "updateLibraryQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000957FC;
  v6[3] = &unk_1001A65D8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  float v4 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)updateLibraryWithClientIdentity:(id)a3 reason:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  int v10 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t StringForRequestReason = ICCloudClientGetStringForRequestReason(a4);
    char v12 = (void *)objc_claimAutoreleasedReturnValue(StringForRequestReason);
    *(_DWORD *)buf = 138543618;
    v64 = self;
    __int16 v65 = 2114;
    id v66 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Got update library request with reason %{public}@",  buf,  0x16u);
  }

  CFPreferencesAppSynchronize(@"com.apple.homesharing");
  if (CFPreferencesGetAppBooleanValue(@"JaliscoDisabled", @"com.apple.homesharing", 0LL))
  {
    uint64_t v13 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v64 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Purchase history import disabled via the preference",  buf,  0xCu);
    }

    if (v9)
    {
      calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100094D2C;
      block[3] = &unk_1001A6BE0;
      id v60 = v9;
      dispatch_async(calloutQueue, block);
      uint64_t v15 = v60;
LABEL_39:

      goto LABEL_40;
    }

    goto LABEL_40;
  }

  char v16 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v17 = [v16 shouldProhibitMusicActionForCurrentNetworkConditions];

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v19 = [v18 shouldProhibitVideosActionForCurrentNetworkConditions];

  if (!v17 || !v19)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler jaliscoLibraryWithReason:](self, "jaliscoLibraryWithReason:", a4));
    if (!v15)
    {
      v31 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v64 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "%{public}@ - Could not initialize jalisco library",  buf,  0xCu);
      }

      if (!v9)
      {
        uint64_t v15 = 0LL;
        goto LABEL_39;
      }

      v32 = (dispatch_queue_s *)self->_calloutQueue;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472LL;
      v55[2] = sub_100094D4C;
      v55[3] = &unk_1001A6BE0;
      id v56 = v9;
      dispatch_async(v32, v55);
      id v28 = v56;
LABEL_38:

      goto LABEL_39;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
    id v54 = 0LL;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 getPropertiesForUserIdentity:v26 error:&v54]);
    id v28 = v54;

    if (!v27 || v28)
    {
      v33 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v64 = self;
        __int16 v65 = 2114;
        id v66 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "%{public}@ - Could not load user identity properties. error=%{public}@",  buf,  0x16u);
      }

      if (!v9) {
        goto LABEL_37;
      }
      v34 = (dispatch_queue_s *)self->_calloutQueue;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472LL;
      v51[2] = sub_100094D5C;
      v51[3] = &unk_1001A6BB8;
      id v53 = v9;
      id v52 = v28;
      dispatch_async(v34, v51);

      id v29 = v53;
    }

    else
    {
      id v29 = (id)objc_claimAutoreleasedReturnValue([v27 DSID]);
      if ([v29 longLongValue])
      {
        v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler updateLibraryQueue](self, "updateLibraryQueue"));
        v41[0] = _NSConcreteStackBlock;
        v41[1] = 3221225472LL;
        v41[2] = sub_100094DCC;
        v41[3] = &unk_1001A4250;
        v41[4] = self;
        id v42 = v8;
        id v29 = v29;
        id v43 = v29;
        id v44 = v27;
        id v46 = v9;
        int64_t v47 = a4;
        id v45 = v15;
        dispatch_async(v30, v41);
      }

      else
      {
        v35 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v64 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%{public}@ - No account DSID - skipping update",  buf,  0xCu);
        }

        if (v9)
        {
          NSErrorUserInfoKey v61 = NSDebugDescriptionErrorKey;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unable update library [no DSID on user identity] - userIdentity=%@ - properties=%@",  v36,  v27));
          v62 = v37;
          v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));

          v39 = (dispatch_queue_s *)self->_calloutQueue;
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_100094D6C;
          v48[3] = &unk_1001A6BB8;
          id v49 = v38;
          id v50 = v9;
          id v40 = v38;
          dispatch_async(v39, v48);
        }
      }
    }

LABEL_37:
    goto LABEL_38;
  }

  v20 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = ICCloudClientGetStringForRequestReason(a4);
    objc_super v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    *(_DWORD *)buf = 138543618;
    v64 = self;
    __int16 v65 = 2114;
    id v66 = v22;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No WiFi connection, skipping update (reason = %{public}@)",  buf,  0x16u);
  }

  if (a4 == 2)
  {
    __int16 v23 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v64 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Rescheduling push notification triggered update when WiFi becomes available.",  buf,  0xCu);
    }

    -[ICDCloudMusicLibraryJaliscoUpdateTaskHelper scheduleBackgroundTaskToUpdateLibraryType:]( self->_updateTaskHelper,  "scheduleBackgroundTaskToUpdateLibraryType:",  0LL);
  }

  if (v9)
  {
    v24 = (dispatch_queue_s *)self->_calloutQueue;
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472LL;
    v57[2] = sub_100094D3C;
    v57[3] = &unk_1001A6BE0;
    id v58 = v9;
    dispatch_async(v24, v57);
    uint64_t v15 = v58;
    goto LABEL_39;
  }

- (void)hideItemsWithPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = self;
    __int16 v22 = 2114;
    id v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to hide purchaseHistoryIDs %{public}@",  buf,  0x16u);
  }

  char v12 = -[JaliscoHideItemOperation initWithConfiguration:clientIdentity:itemPurchaseHistoryIDs:]( objc_alloc(&OBJC_CLASS___JaliscoHideItemOperation),  "initWithConfiguration:clientIdentity:itemPurchaseHistoryIDs:",  self->_configuration,  v9,  v8);
  objc_initWeak((id *)buf, v12);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100094CC4;
  v17[3] = &unk_1001A42C8;
  id v13 = v10;
  id v18 = v13;
  objc_copyWeak(&v19, (id *)buf);
  -[JaliscoHideItemOperation setCompletionBlock:](v12, "setCompletionBlock:", v17);
  -[JaliscoHideItemOperation setName:]( v12,  "setName:",  @"com.apple.itunescloudd.JaliscoRequestHandler.hideItemOperation");
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100094D18;
  v15[3] = &unk_1001A50C0;
  id v14 = v13;
  id v16 = v14;
  -[JaliscoRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v12,  2LL,  v15);

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
}

- (void)setItemProperties:(id)a3 forPurchaseHistoryID:(unint64_t)a4 clientIdentity:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v23 = self;
    __int16 v24 = 2048;
    unint64_t v25 = a4;
    __int16 v26 = 2114;
    id v27 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Received request to update item with purchaseHistoryID %llu properties: %{public}@",  buf,  0x20u);
  }

  id v14 = -[JaliscoSetItemPropertyOperation initWithConfiguration:clientIdentity:purchaseHistoryID:properties:]( objc_alloc(&OBJC_CLASS___JaliscoSetItemPropertyOperation),  "initWithConfiguration:clientIdentity:purchaseHistoryID:properties:",  self->_configuration,  v11,  a4,  v10);
  objc_initWeak((id *)buf, v14);
  id v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  id v18 = sub_100094C54;
  id v19 = &unk_1001A42C8;
  id v15 = v12;
  id v20 = v15;
  objc_copyWeak(&v21, (id *)buf);
  -[JaliscoSetItemPropertyOperation setCompletionBlock:](v14, "setCompletionBlock:", &v16);
  -[JaliscoSetItemPropertyOperation setName:]( v14,  "setName:",  @"com.apple.itunescloudd.JaliscoRequestHandler.setItemPropertyOperation",  v16,  v17,  v18,  v19);
  -[JaliscoRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v14,  2LL,  0LL);
  objc_destroyWeak(&v21);

  objc_destroyWeak((id *)buf);
}

- (void)importItemArtworkForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100094A9C;
  v14[3] = &unk_1001A4278;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)importScreenshotForPurchaseHistoryID:(unint64_t)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000948E4;
  v14[3] = &unk_1001A4278;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  unint64_t v17 = a3;
  id v12 = v9;
  id v13 = v8;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)deprioritizeItemArtworkForPurchaseHistoryID:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:1];
}

- (void)deprioritizeScreenshotForPurchaseHistoryID:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler artworkImporter](self, "artworkImporter"));
  [v4 deprioritizeImportArtworkForCloudID:a3 artworkType:2];
}

- (void)loadArtworkInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v28 = self;
    __int16 v29 = 2048;
    id v30 = [v8 count];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Got load artwork info request for %lu purchase history IDs",  buf,  0x16u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v13 = [v12 shouldProhibitMusicActionForCurrentNetworkConditions];

  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[ICCloudAvailabilityController sharedController]( &OBJC_CLASS___ICCloudAvailabilityController,  "sharedController"));
  unsigned int v15 = [v14 shouldProhibitVideosActionForCurrentNetworkConditions];

  if ((v13 & v15) != 1)
  {
    id v18 = -[CloudLoadBulkArtworkInfoOperation initWithConfiguration:cloudIDs:]( objc_alloc(&OBJC_CLASS___JaliscoLoadBulkItemArtworkInfoOperation),  "initWithConfiguration:cloudIDs:",  self->_configuration,  v8);
    objc_initWeak((id *)buf, v18);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10009485C;
    v22[3] = &unk_1001A42C8;
    id v19 = v10;
    id v23 = v19;
    objc_copyWeak(&v24, (id *)buf);
    -[JaliscoLoadBulkItemArtworkInfoOperation setCompletionBlock:](v18, "setCompletionBlock:", v22);
    -[JaliscoLoadBulkItemArtworkInfoOperation setName:]( v18,  "setName:",  @"com.apple.itunescloudd.JaliscoRequestHandler.loadArtworkInfoOperation");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_1000948C8;
    v20[3] = &unk_1001A50C0;
    id v21 = v19;
    -[JaliscoRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v18,  1LL,  v20);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
    goto LABEL_9;
  }

  id v16 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v28 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - No WiFi connection, skipping artwork load.",  buf,  0xCu);
  }

  if (v10)
  {
    calloutQueue = (dispatch_queue_s *)self->_calloutQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000947F8;
    block[3] = &unk_1001A6BE0;
    __int16 v26 = (JaliscoLoadBulkItemArtworkInfoOperation *)v10;
    dispatch_async(calloutQueue, block);
    id v18 = v26;
LABEL_9:
  }
}

- (void)loadScreenshotInfoForPurchaseHistoryIDs:(id)a3 clientIdentity:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v11 = (NSMutableArray *)v7;
  id v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v42,  v50,  16LL);
  if (!v36)
  {
    id v28 = 0LL;
    __int16 v26 = v11;
LABEL_17:

    id v27 = v28;
    v32 = v10;
    goto LABEL_18;
  }

  id v30 = v9;
  v33 = 0LL;
  uint64_t v35 = *(void *)v43;
  uint64_t v34 = ML3TrackPropertyPurchaseHistoryID;
  v31 = v11;
  v32 = v10;
LABEL_3:
  uint64_t v12 = 0LL;
  while (1)
  {
    if (*(void *)v43 != v35) {
      objc_enumerationMutation(v11);
    }
    uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * v12);
    -[ML3MusicLibrary setClientIdentity:](self->_musicLibrary, "setClientIdentity:", v8);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[ML3ComparisonPredicate predicateWithProperty:equalToValue:]( &OBJC_CLASS___ML3ComparisonPredicate,  "predicateWithProperty:equalToValue:",  v34,  v13));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[ML3Track anyInLibrary:predicate:options:]( &OBJC_CLASS___ML3Track,  "anyInLibrary:predicate:options:",  self->_musicLibrary,  v14,  3LL));
    id v16 = [[ML3ArtworkTokenSet alloc] initWithEntity:v15 artworkType:2];
    unint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 artworkTokenForSource:400]);
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
      __int16 v22 = os_log_create("com.apple.amp.itunescloudd", "Artwork");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        id v23 = [v15 persistentID];
        *(_DWORD *)buf = 134217984;
        id v49 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_FAULT,  "No purchase history artwork_token for screenshot item with persistent-id = %lld",  buf,  0xCu);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"No purchase history artwork_token for screenshot item with persistent-id = %lld",  [v15 persistentID]));
      id v46 = @"NSDebugDescription";
      int64_t v47 = v20;
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2021LL,  v24));

      v33 = (void *)v25;
      id v8 = v21;
      id v11 = v31;
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
  id v27 = 0LL;
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
    block[2] = sub_1000947E4;
    block[3] = &unk_1001A6C08;
    id v41 = v9;
    v39 = v32;
    id v40 = v27;
    dispatch_async(calloutQueue, block);
  }
}

- (void)loadMissingArtworkWithClientIdentity:(id)a3
{
}

- (void)removeLibraryWithClientIdentity:(id)a3 completion:(id)a4
{
  char v6 = (void (**)(id, void))a4;
  id v7 = a3;
  id v8 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    uint64_t v12 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - Removing purchase history due to user action",  (uint8_t *)&v11,  0xCu);
  }

  -[JaliscoRequestHandler cancelAllOperations](self, "cancelAllOperations");
  id v9 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( objc_alloc(&OBJC_CLASS___JaliscoDeauthenticateOperation),  "initWithConfiguration:clientIdentity:",  self->_configuration,  v7);

  -[JaliscoDeauthenticateOperation main](v9, "main");
  if (v6)
  {
    if ((id)-[CloudLibraryOperation status](v9, "status") == (id)1)
    {
      v6[2](v6, 0LL);
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2002LL,  0LL));
      ((void (**)(id, void *))v6)[2](v6, v10);
    }
  }
}

- (void)cancelOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - cancelOperationsWithCompletion",  buf,  0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100094718;
  v7[3] = &unk_1001A6BB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[JaliscoRequestHandler cancelPendingChangesWithCompletion:](self, "cancelPendingChangesWithCompletion:", v7);
}

- (void)decreasePriorityForAllOperations
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - decreasePriorityForAllOperations",  buf,  0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries(v5) & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"JaliscoRequestHandler.m", 487, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler artworkImporter](self, "artworkImporter"));
  [v6 decreasePriorityForAllOperations];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler jaliscoLibrary](self, "jaliscoLibrary"));
  [v7 decreasePriorityForAllOperations];
}

- (void)increasePriorityForAllOperations
{
  id v4 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - increasePriorityForAllOperations",  buf,  0xCu);
  }

  if ((MSVDeviceSupportsMultipleLibraries(v5) & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2, self, @"JaliscoRequestHandler.m", 494, @"Invalid parameter not satisfying: %@", @"MSVDeviceSupportsMultipleLibraries()" object file lineNumber description];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler artworkImporter](self, "artworkImporter"));
  [v6 increasePriorityForAllOperations];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler jaliscoLibrary](self, "jaliscoLibrary"));
  [v7 increasePriorityForAllOperations];
}

- (void)updateJaliscoLibraryWithClientIdentity:(id)a3 byAddingMediaKind:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000944C8;
  v14[3] = &unk_1001A4278;
  id v16 = v9;
  int64_t v17 = a4;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)updateJaliscoLibraryByRemovingMediaKind:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100094278;
  v14[3] = &unk_1001A4278;
  id v16 = v9;
  int64_t v17 = a3;
  v14[4] = self;
  id v15 = v8;
  id v12 = v8;
  id v13 = v9;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)isMediaKindDisabledForJaliscoLibrary:(int64_t)a3 withClientIdentity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentityStore](self->_configuration, "userIdentityStore"));
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICConnectionConfiguration userIdentity](self->_configuration, "userIdentity"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100094020;
  v14[3] = &unk_1001A4278;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  int64_t v17 = a3;
  id v12 = v8;
  id v13 = v9;
  [v10 getPropertiesForUserIdentity:v11 completionHandler:v14];
}

- (void)cancelAllOperations
{
}

- (void)cancelAllOperationsAndWaitForOperationsToFinish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = os_log_create("com.apple.amp.itunescloudd", "PurchaseSync");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v10 = self;
    __int16 v11 = 1024;
    BOOL v12 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ - cancelAllOperationsAndWaitForOperationsToFinish - wait=%{BOOL}u",  buf,  0x12u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler artworkImporter](self, "artworkImporter"));
  [v6 cancelAllImportsAndWaitForOperationsToFinish:v3];

  updateLibraryQueue = (dispatch_queue_s *)self->_updateLibraryQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100093F44;
  block[3] = &unk_1001A6B90;
  void block[4] = self;
  dispatch_sync(updateLibraryQueue, block);
  -[CloudLibrary cancelAllOperations](self->_jaliscoLibrary, "cancelAllOperations");
}

- (void)loadBooksForStoreIDs:(id)a3 clientIdentity:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = -[CloudLibraryOperation initWithConfiguration:clientIdentity:]( objc_alloc(&OBJC_CLASS___JaliscoLoadBooksOperation),  "initWithConfiguration:clientIdentity:",  self->_configuration,  v9);
  -[JaliscoLoadBooksOperation setQueryStoreIDs:](v11, "setQueryStoreIDs:", v8);
  objc_initWeak(&location, v11);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100093E84;
  v16[3] = &unk_1001A42C8;
  objc_copyWeak(&v18, &location);
  id v12 = v10;
  id v17 = v12;
  -[JaliscoLoadBooksOperation setCompletionBlock:](v11, "setCompletionBlock:", v16);
  -[JaliscoLoadBooksOperation setName:]( v11,  "setName:",  @"com.apple.itunescloudd.JaliscoRequestHandler.loadBooksOperation");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100093F28;
  v14[3] = &unk_1001A50C0;
  id v13 = v12;
  id v15 = v13;
  -[JaliscoRequestHandler _addLibraryOperation:priority:noLibraryHandler:]( self,  "_addLibraryOperation:priority:noLibraryHandler:",  v11,  1LL,  v14);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)_addLibraryOperation:(id)a3 priority:(int)a4 noLibraryHandler:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v12 = a3;
  id v8 = (void (**)(id, void *))a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[JaliscoRequestHandler jaliscoLibrary](self, "jaliscoLibrary"));
  id v10 = v9;
  if (v9)
  {
    [v9 addOperation:v12 priority:v6];
  }

  else if (v8)
  {
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSError ic_cloudClientErrorWithCode:userInfo:]( &OBJC_CLASS___NSError,  "ic_cloudClientErrorWithCode:userInfo:",  2009LL,  0LL));
    v8[2](v8, v11);
  }
}

- (void)_updateJaliscoLibraryWithClientIdentity:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  -[JaliscoRequestHandler cancelPendingChanges](self, "cancelPendingChanges");
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[BaseRequestHandler handlerForConfiguration:]( &OBJC_CLASS___ArtistImageRequestHandler,  "handlerForConfiguration:",  self->_configuration));
  [v7 cancelAllOperations];

  -[JaliscoRequestHandler cancelAllOperations](self, "cancelAllOperations");
  -[JaliscoRequestHandler updateLibraryWithClientIdentity:reason:completionHandler:]( self,  "updateLibraryWithClientIdentity:reason:completionHandler:",  v8,  1001LL,  v6);
}

- (id)_DAAPMediaKindFromJaliscoSupportedMediaKind:(int64_t)a3
{
  else {
    return off_1001A42E8[a3];
  }
}

- (JaliscoArtworkImporter)artworkImporter
{
  return self->_artworkImporter;
}

- (OS_dispatch_queue)updateLibraryQueue
{
  return self->_updateLibraryQueue;
}

- (JaliscoMediaUpdateOperation)updateLibraryOperation
{
  return self->_updateLibraryOperation;
}

- (void)setUpdateLibraryOperation:(id)a3
{
}

- (NSMutableArray)updateLibraryCompletionHandlers
{
  return self->_updateLibraryCompletionHandlers;
}

- (void).cxx_destruct
{
}

@end