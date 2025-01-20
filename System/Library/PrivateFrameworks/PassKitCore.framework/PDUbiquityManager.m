@interface PDUbiquityManager
+ (void)removeLastEventIdentifier;
- (BOOL)_queue_startNotYetUbiquitousWithDestinationURL:(id)a3;
- (BOOL)passWillBeDeleted:(id)a3;
- (NSOperationQueue)presentedItemOperationQueue;
- (NSURL)presentedItemURL;
- (NSURL)ubiquitousURL;
- (PDUbiquityManager)initWithDelegate:(id)a3;
- (PDUbiquityManagerDelegate)delegate;
- (id)_queue_passUniqueIDs;
- (id)_urlForCardWithUniqueID:(id)a3 relativeToDirectoryURL:(id)a4;
- (id)_urlForCatalogRelativeToDirectoryURL:(id)a3;
- (unint64_t)lastPresentedItemEventIdentifier;
- (void)_attemptCoordinatedReadWithoutChangesAtURL:(id)a3 withAccessor:(id)a4;
- (void)_handleUbiquityIdentityChanged:(id)a3;
- (void)_queue_addToFilePresenter;
- (void)_queue_addedToFilePresenter;
- (void)_queue_compareCatalogsAndTakeNewerVersion;
- (void)_queue_comparePassesAndTakeNewerVersion:(id)a3;
- (void)_queue_copyCatalogToLocalStore:(id)a3;
- (void)_queue_copyCatalogToUbiquity:(id)a3;
- (void)_queue_copyPassesFromLocalStoreToUbiquity:(id)a3;
- (void)_queue_copyPassesFromUbiquityToLocalStore:(id)a3;
- (void)_queue_handleCatalogUpdate;
- (void)_queue_handlePassUpdate:(id)a3;
- (void)_queue_mergeUbiquityWithLocalStore;
- (void)_queue_removeFromFilePresenter;
- (void)_queue_resolveURLIfNecessary:(id)a3;
- (void)_queue_resolveURLIfNecessary:(id)a3 fileCoordinator:(id)a4;
- (void)_queue_startWithTokenFinishedWithFinalState:(int)a3;
- (void)_startWithToken:(unsigned int)a3;
- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)prepareToRemoveUbiquitousPassWithUniqueID:(id)a3;
- (void)presentedItemDidGainVersion:(id)a3;
- (void)presentedItemDidMoveToURL:(id)a3;
- (void)presentedSubitemDidAppearAtURL:(id)a3;
- (void)presentedSubitemDidChangeAtURL:(id)a3;
- (void)removeUbiquitousPassWithUniqueID:(id)a3 completed:(BOOL)a4;
- (void)restart;
- (void)setDelegate:(id)a3;
- (void)setLastPresentedItemEventIdentifier:(unint64_t)a3;
- (void)setUbiquitousURL:(id)a3;
- (void)start;
- (void)updateUbiquitousCatalog:(id)a3;
- (void)updateUbiquitousPass:(id)a3;
@end

@implementation PDUbiquityManager

- (PDUbiquityManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PDUbiquityManager;
  v5 = -[PDUbiquityManager init](&v25, "init");
  v6 = v5;
  if (v5)
  {
    -[PDUbiquityManager setDelegate:](v5, "setDelegate:", v4);
    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, -1);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);

    dispatch_queue_t v11 = dispatch_queue_create("ubiquityManager", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("ubiquityManager.access", v10);
    accessQueue = v6->_accessQueue;
    v6->_accessQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    filesModified = v6->_filesModified;
    v6->_filesModified = v15;

    v17 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    filesToWrite = v6->_filesToWrite;
    v6->_filesToWrite = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    filesToDelete = v6->_filesToDelete;
    v6->_filesToDelete = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v6->_operationQueue;
    v6->_operationQueue = v21;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v23 addObserver:v6 selector:"_handleUbiquityIdentityChanged:" name:NSUbiquityIdentityDidChangeNotification object:0];
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:NSUbiquityIdentityDidChangeNotification object:0];

  +[NSFileCoordinator removeFilePresenter:](&OBJC_CLASS___NSFileCoordinator, "removeFilePresenter:", self);
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PDUbiquityManager;
  -[PDUbiquityManager dealloc](&v4, "dealloc");
}

+ (void)removeLastEventIdentifier
{
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing cached FSEventIdentifier", v4, 2u);
  }

  PKSharedCacheRemoveObjectForKey(PKSharedCacheLastEventIdentifierKey);
}

- (void)start
{
  p_ubiquityStartToken = &self->_ubiquityStartToken;
  do
    unsigned int v3 = __ldaxr(p_ubiquityStartToken);
  while (__stlxr(v3 + 1, p_ubiquityStartToken));
  -[PDUbiquityManager _startWithToken:](self, "_startWithToken:");
}

- (void)_startWithToken:(unsigned int)a3
{
  v5 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A7AA8;
  block[3] = &unk_100649A40;
  id v9 = v5;
  v10 = self;
  unsigned int v11 = a3;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)restart
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_canStart);
  if ((v2 & 1) != 0)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(1LL);
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Restarting ubiquity manager", v8, 2u);
    }

    p_ubiquityStartToken = &self->_ubiquityStartToken;
    do
      unsigned int v7 = __ldaxr(p_ubiquityStartToken);
    while (__stlxr(v7 + 1, p_ubiquityStartToken));
    atomic_store(0, (unsigned int *)&self->_ubiquityState);
    -[PDUbiquityManager _startWithToken:](self, "_startWithToken:");
  }

- (void)updateUbiquitousPass:(id)a3
{
  id v4 = a3;
  if ((PKCloudKitPassSyncEnabled(v4, v5) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 uniqueID]);
    accessQueue = self->_accessQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A829C;
    block[3] = &unk_1006392B0;
    void block[4] = self;
    id v8 = v6;
    id v19 = v8;
    dispatch_sync((dispatch_queue_t)accessQueue, block);
    id v9 = (void *)PDOSTransactionCreate("PDUbiquityManager");
    queue = self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1001A82A8;
    v13[3] = &unk_10063B060;
    id v14 = v9;
    v15 = self;
    id v16 = v8;
    id v17 = v4;
    id v11 = v8;
    id v12 = v9;
    dispatch_async((dispatch_queue_t)queue, v13);
  }
}

- (BOOL)passWillBeDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A8AB4;
  block[3] = &unk_10063C080;
  id v9 = v4;
  v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

- (void)prepareToRemoveUbiquitousPassWithUniqueID:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A8B6C;
  block[3] = &unk_1006392B0;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
}

- (void)removeUbiquitousPassWithUniqueID:(id)a3 completed:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  id v8 = v7;
  if (v4)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1001A8C74;
    block[3] = &unk_100639350;
    id v17 = v7;
    v18 = self;
    id v19 = v6;
    id v10 = v6;
    dispatch_async((dispatch_queue_t)queue, block);

    uint64_t v11 = v17;
  }

  else
  {
    accessQueue = self->_accessQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1001A8F98;
    v14[3] = &unk_1006392B0;
    v14[4] = self;
    id v15 = v6;
    id v13 = v6;
    dispatch_sync((dispatch_queue_t)accessQueue, v14);
    uint64_t v11 = v15;
  }
}

- (void)updateUbiquitousCatalog:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001A9054;
  block[3] = &unk_100639350;
  id v10 = v5;
  uint64_t v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)_handleUbiquityIdentityChanged:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Ubiquity Identity changed.", v6, 2u);
  }

  -[PDUbiquityManager restart](self, "restart");
}

- (id)_urlForCardWithUniqueID:(id)a3 relativeToDirectoryURL:(id)a4
{
  if (a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([a4 URLByAppendingPathComponent:a3 isDirectory:0]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathExtension:PKRawPassExtension]);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)_urlForCatalogRelativeToDirectoryURL:(id)a3
{
  return [a3 URLByAppendingPathComponent:@"CatalogOfRecord.plist" isDirectory:0];
}

- (void)_attemptCoordinatedReadWithoutChangesAtURL:(id)a3 withAccessor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Attempting coordinated read at URL %@",  buf,  0xCu);
  }

  id v10 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  self);
  id v19 = 0LL;
  char v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  id v16 = sub_1001A94D4;
  id v17 = &unk_100649AD0;
  id v11 = v7;
  id v18 = v11;
  -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:]( v10,  "coordinateReadingItemAtURL:options:error:byAccessor:",  v6,  1LL,  &v19,  &v14);
  id v12 = v19;
  if (v12)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedDescription", v14, v15, v16, v17));
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Coordinated read failed with error: %@",  buf,  0xCu);
    }
  }
}

- (BOOL)_queue_startNotYetUbiquitousWithDestinationURL:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x2020000000LL;
  char v28 = 0;
  id v5 = sub_1001A9750((uint64_t)v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  [v7 createDirectoryAtURL:v6 withIntermediateDirectories:1 attributes:0 error:0];
  id v8 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  self);
  id v24 = 0LL;
  uint64_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1001A97B8;
  id v18 = &unk_100649AF8;
  id v9 = v6;
  id v19 = v9;
  id v10 = v4;
  id v20 = v10;
  id v11 = v7;
  v22 = self;
  v23 = &v25;
  id v21 = v11;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:]( v8,  "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:",  v9,  2LL,  v10,  8LL,  &v24,  &v15);
  id v12 = v24;
  if (*((_BYTE *)v26 + 24))
  {
    -[PDUbiquityManager _queue_addToFilePresenter](self, "_queue_addToFilePresenter", v15, v16, v17, v18, v19, v20);
    BOOL v13 = *((_BYTE *)v26 + 24) != 0;
  }

  else
  {
    BOOL v13 = 0;
  }

  _Block_object_dispose(&v25, 8);
  return v13;
}

- (void)_queue_startWithTokenFinishedWithFinalState:(int)a3
{
  if (a3 != 2)
  {
    uint64_t v15 = v3;
    uint64_t v16 = v4;
    uint64_t Object = PKLogFacilityTypeGetObject(1LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Ubiquity failed to start or was stopped - performing clean up",  buf,  2u);
    }

    -[PDUbiquityManager _queue_removeFromFilePresenter](self, "_queue_removeFromFilePresenter");
    PKSharedCacheRemoveObjectForKey(PKSharedCacheLastEventIdentifierKey);
    PKSharedCacheSetBoolForKey(1LL, PKSharedCacheIgnoringUbiquityKey);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
    if (v9)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Evicting ubiquity container", v13, 2u);
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v10 evictUbiquitousItemAtURL:v9 error:0];

      -[PDUbiquityManager setUbiquitousURL:](self, "setUbiquitousURL:", 0LL);
    }

    p_ubiquityState = &self->_ubiquityState;
    while (1)
    {
      unsigned int v12 = __ldaxr((unsigned int *)p_ubiquityState);
      if (v12 != 1) {
        break;
      }
    }

    __clrex();
LABEL_13:
  }

- (void)_queue_mergeUbiquityWithLocalStore
{
  uint64_t v3 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "merging ubiquitous store and local store",  (uint8_t *)&v14,  2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained existingCardUniqueIDs]);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    uint64_t v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "local uniqueIDs: %@", (uint8_t *)&v14, 0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager _queue_passUniqueIDs](self, "_queue_passUniqueIDs"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    uint64_t v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "ubiquitous uniqueIDs: %@",  (uint8_t *)&v14,  0xCu);
  }

  id v9 = [v8 mutableCopy];
  [v9 removeObjectsInArray:v7];
  id v10 = [v7 mutableCopy];
  [v10 removeObjectsInArray:v8];
  id v11 = [v8 mutableCopy];
  [v11 removeObjectsInArray:v9];
  [v11 removeObjectsInArray:v10];
  id v12 = -[PDUbiquityManager _queue_copyPassesFromUbiquityToLocalStore:]( self,  "_queue_copyPassesFromUbiquityToLocalStore:",  v9);
  if ((PKCloudKitPassSyncEnabled(v12, v13) & 1) == 0) {
    -[PDUbiquityManager _queue_copyPassesFromLocalStoreToUbiquity:]( self,  "_queue_copyPassesFromLocalStoreToUbiquity:",  v10);
  }
  -[PDUbiquityManager _queue_comparePassesAndTakeNewerVersion:](self, "_queue_comparePassesAndTakeNewerVersion:", v11);
  -[PDUbiquityManager _queue_compareCatalogsAndTakeNewerVersion](self, "_queue_compareCatalogsAndTakeNewerVersion");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Done merging", (uint8_t *)&v14, 2u);
  }
}

- (id)_queue_passUniqueIDs
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  if (!v4) {
    return 0LL;
  }
  char BoolForKey = PKSharedCacheGetBoolForKey(PKSharedCacheIgnoringUbiquityKey, v3);

  if ((BoolForKey & 1) != 0) {
    return 0LL;
  }
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  char v28 = sub_1001A9FF8;
  v29 = sub_1001AA008;
  id v30 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1001AA010;
  v24[3] = &unk_100643CC0;
  v24[4] = &v25;
  -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v7,  v24);

  id v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v8 = (id)v26[5];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (!v9) {
    goto LABEL_18;
  }
  uint64_t v10 = *(void *)v21;
  uint64_t v11 = PKRawPassExtension;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
      id v19 = 0LL;
      [v13 getResourceValue:&v19 forKey:NSURLUbiquitousItemDownloadingStatusKey error:0];
      id v14 = v19;
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 pathExtension]);
      if (!v14)
      {

LABEL_14:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lastPathComponent]);
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 stringByDeletingPathExtension]);
        -[NSMutableArray addObject:](v18, "addObject:", v17);

LABEL_15:
        goto LABEL_16;
      }

      unsigned __int8 v16 = [v14 isEqualToString:NSURLUbiquitousItemDownloadingStatusCurrent];

      if ((v16 & 1) != 0) {
        goto LABEL_14;
      }
LABEL_16:
    }

    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v31 count:16];
  }

  while (v9);
LABEL_18:

  _Block_object_dispose(&v25, 8);
  return v18;
}

- (void)_queue_copyPassesFromUbiquityToLocalStore:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Copying ubiquitous cards to local store:",  buf,  2u);
  }

  oslog = v6;

  *(void *)buf = 0LL;
  uint64_t v25 = buf;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
LABEL_5:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v21 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * v9);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL", oslog));
      uint64_t v12 = objc_claimAutoreleasedReturnValue( -[PDUbiquityManager _urlForCardWithUniqueID:relativeToDirectoryURL:]( self,  "_urlForCardWithUniqueID:relativeToDirectoryURL:",  v10,  v11));

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472LL;
      v17[2] = sub_1001AA420;
      v17[3] = &unk_100643DD8;
      id v19 = buf;
      v17[4] = self;
      v17[5] = v10;
      id v13 = (id)v12;
      id v18 = v13;
      -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v13,  v17);
      LOBYTE(v12) = v25[24] == 0;

      if ((v12 & 1) == 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [obj countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v7) {
          goto LABEL_5;
        }
        break;
      }
    }
  }

  if (v25[24])
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "\tTerminating copy of ubiquitous cards to local store.",  v16,  2u);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)_queue_copyPassesFromLocalStoreToUbiquity:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  if (v5)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(1LL);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Copying local cards to ubiquity:", buf, 2u);
    }

    uint64_t v8 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1001AA6EC;
    v9[3] = &unk_100643C98;
    id v10 = v4;
    uint64_t v11 = self;
    -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v8,  "coordinateWritingItemAtURL:options:error:byAccessor:",  v5,  8LL,  0LL,  v9);
  }
}

- (void)_queue_comparePassesAndTakeNewerVersion:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Comparing ubiquitous cards to local cards:",  buf,  2u);
  }

  oslog = v6;

  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  *(void *)buf = 0LL;
  v34 = buf;
  uint64_t v35 = 0x2020000000LL;
  char v36 = 0;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v4;
  id v8 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v30;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v13 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained existingCardWithUniqueID:v11]);

        if (v13)
        {
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[PDUbiquityManager _urlForCardWithUniqueID:relativeToDirectoryURL:]( self,  "_urlForCardWithUniqueID:relativeToDirectoryURL:",  v11,  v14));

          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_1001AAC90;
          v23[3] = &unk_100649B20;
          char v28 = buf;
          v23[4] = self;
          id v24 = v13;
          uint64_t v25 = v11;
          id v26 = v22;
          id v27 = v7;
          -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v15,  v23);
        }

        else
        {
          [v7 addObject:v11];
        }
      }

      id v8 = [obj countByEnumeratingWithState:&v29 objects:v39 count:16];
    }

    while (v8);
  }

  int v16 = v34[24];
  BOOL v17 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v17)
    {
      *(_WORD *)v37 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "\tTerminating ubiquity to local comparison.",  v37,  2u);
    }
  }

  else
  {
    if (v17)
    {
      *(_DWORD *)v37 = 138412290;
      v38 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Local cards to update from ubiquity: %@",  v37,  0xCu);
    }

    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 138412290;
      v38 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Ubiquity cards to update from local: %@",  v37,  0xCu);
    }

    id v18 = -[PDUbiquityManager _queue_copyPassesFromUbiquityToLocalStore:]( self,  "_queue_copyPassesFromUbiquityToLocalStore:",  v7);
    if ((PKCloudKitPassSyncEnabled(v18, v19) & 1) == 0) {
      -[PDUbiquityManager _queue_copyPassesFromLocalStoreToUbiquity:]( self,  "_queue_copyPassesFromLocalStoreToUbiquity:",  v22);
    }
  }

  _Block_object_dispose(buf, 8);
}

- (void)_queue_compareCatalogsAndTakeNewerVersion
{
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_1001A9FF8;
  id v26 = sub_1001AA008;
  id v27 = 0LL;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDUbiquityManager _urlForCatalogRelativeToDirectoryURL:]( self,  "_urlForCatalogRelativeToDirectoryURL:",  v3));

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001AB164;
  v21[3] = &unk_100649B48;
  v21[4] = self;
  v21[5] = &v22;
  -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v4,  v21);
  if (atomic_load((unsigned int *)&self->_ubiquityState))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained existingCatalog]);

    id v8 = (void *)v23[5];
    if (v7)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(1LL);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      if (!v8)
      {
        if (v11)
        {
          *(_DWORD *)buf = 138412290;
          __int128 v29 = v7;
          id v14 = "Taking local catalog because there is no ubiquitous catalog: %@";
          uint64_t v15 = v10;
          uint32_t v16 = 12;
          goto LABEL_14;
        }

- (void)_queue_handlePassUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[PDUbiquityManager _urlForCardWithUniqueID:relativeToDirectoryURL:]( self,  "_urlForCardWithUniqueID:relativeToDirectoryURL:",  v4,  v5));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001AB2C4;
  v9[3] = &unk_100649A68;
  void v9[4] = self;
  id v10 = v6;
  id v11 = v4;
  id v7 = v4;
  id v8 = v6;
  -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v8,  v9);
}

- (void)_queue_handleCatalogUpdate
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PDUbiquityManager _urlForCatalogRelativeToDirectoryURL:]( self,  "_urlForCatalogRelativeToDirectoryURL:",  v3));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001ABA14;
  v5[3] = &unk_100643DB0;
  v5[4] = self;
  -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v4,  v5);
}

- (void)_queue_copyCatalogToLocalStore:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Copying ubiquitous catalog to local store: %@",  buf,  0xCu);
  }

  id v7 = PDDefaultQueue();
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v7);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001ABBF0;
  v10[3] = &unk_1006392B0;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

- (void)_queue_copyCatalogToUbiquity:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Copying local catalog to ubiquity: %@",  buf,  0xCu);
  }

  id v7 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1001ABD70;
  v10[3] = &unk_100643C98;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  -[NSFileCoordinator coordinateWritingItemAtURL:options:error:byAccessor:]( v7,  "coordinateWritingItemAtURL:options:error:byAccessor:",  v8,  8LL,  0LL,  v10);
}

- (void)_queue_addToFilePresenter
{
  if (!self->_addedToFilePresenter)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(1LL);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registering as file presenter", v5, 2u);
    }

    self->_addedToFilePresenter = 1;
    +[NSFileCoordinator addFilePresenter:](&OBJC_CLASS___NSFileCoordinator, "addFilePresenter:", self);
    -[PDUbiquityManager _queue_addedToFilePresenter](self, "_queue_addedToFilePresenter");
  }

- (void)_queue_removeFromFilePresenter
{
  if (self->_addedToFilePresenter)
  {
    +[NSFileCoordinator removeFilePresenter:](&OBJC_CLASS___NSFileCoordinator, "removeFilePresenter:", self);
    self->_addedToFilePresenter = 0;
  }

- (void)_queue_addedToFilePresenter
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  if (v4 && (PKSharedCacheGetBoolForKey(PKSharedCacheIgnoringUbiquityKey, v3) & 1) == 0)
  {
    id v5 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  self);
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    uint32_t v20 = sub_1001A9FF8;
    __int128 v21 = sub_1001AA008;
    id v22 = 0LL;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001AC0CC;
    v16[3] = &unk_100643CC0;
    v16[4] = &v17;
    -[PDUbiquityManager _attemptCoordinatedReadWithoutChangesAtURL:withAccessor:]( self,  "_attemptCoordinatedReadWithoutChangesAtURL:withAccessor:",  v4,  v16);
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v12 = 0u;
    __int128 v13 = 0u;
    id v6 = (id)v18[5];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        id v9 = 0LL;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8LL * (void)v9);
          id v11 = objc_autoreleasePoolPush();
          -[PDUbiquityManager _queue_resolveURLIfNecessary:fileCoordinator:]( self,  "_queue_resolveURLIfNecessary:fileCoordinator:",  v10,  v5,  (void)v12);
          objc_autoreleasePoolPop(v11);
          id v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v6 countByEnumeratingWithState:&v12 objects:v23 count:16];
      }

      while (v7);
    }

    _Block_object_dispose(&v17, 8);
  }
}

- (void)_queue_resolveURLIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  self);
  -[PDUbiquityManager _queue_resolveURLIfNecessary:fileCoordinator:]( self,  "_queue_resolveURLIfNecessary:fileCoordinator:",  v4,  v5);
}

- (void)_queue_resolveURLIfNecessary:(id)a3 fileCoordinator:(id)a4
{
  id v5 = a3;
  id v27 = a4;
  id v47 = 0LL;
  [v5 getResourceValue:&v47 forKey:NSURLUbiquitousItemHasUnresolvedConflictsKey error:0];
  id v26 = v47;
  id v46 = 0LL;
  [v5 getResourceValue:&v46 forKey:NSURLContentModificationDateKey error:0];
  id v6 = v46;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[NSFileVersion unresolvedConflictVersionsOfItemAtURL:]( &OBJC_CLASS___NSFileVersion,  "unresolvedConflictVersionsOfItemAtURL:",  v5));
  uint64_t v8 = 0LL;
  id v9 = [v7 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v43;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)i);
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 modificationDate]);
        __int128 v14 = (void *)v13;
        if (!v6 || v13 && [v6 compare:v13] == (id)-1)
        {
          id v15 = v12;

          uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 modificationDate]);
          uint64_t v8 = v15;
          id v6 = (id)v16;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v42 objects:v53 count:16];
    }

    while (v9);
  }

  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  v39 = sub_1001A9FF8;
  v40 = sub_1001AA008;
  id v41 = 0LL;
  if (!v8) {
    goto LABEL_17;
  }
  id obj = 0LL;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1001AC6BC;
  v32[3] = &unk_100643CE8;
  id v33 = v8;
  v34 = &v36;
  [v27 coordinateWritingItemAtURL:v5 options:8 error:&obj byAccessor:v32];
  objc_storeStrong(&v41, obj);

  uint64_t v17 = (void *)v37[5];
  if (v17)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(1LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v5;
      __int16 v51 = 2112;
      id v52 = v17;
      uint32_t v20 = "Failed to write winning version for %@: %@";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
    }
  }

  else
  {
LABEL_17:
    uint64_t v21 = PKLogFacilityTypeGetObject(1LL);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v50 = v5;
      __int16 v51 = 2112;
      id v52 = v6;
      uint32_t v20 = "Wrote winning version for %@: %@";
      goto LABEL_19;
    }
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v22 = v7;
  id v23 = [v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v29;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) setResolved:1];
      }

      id v23 = [v22 countByEnumeratingWithState:&v28 objects:v48 count:16];
    }

    while (v23);
  }

  _Block_object_dispose(&v36, 8);
LABEL_28:
}

- (NSURL)presentedItemURL
{
  unsigned __int8 v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDUbiquityManager ubiquitousURL](self, "ubiquitousURL"));
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }

  else
  {
    id v5 = sub_1001A9750(0LL);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v5);
  }

  id v6 = v4;

  return (NSURL *)v6;
}

- (NSOperationQueue)presentedItemOperationQueue
{
  return self->_operationQueue;
}

- (void)presentedItemDidGainVersion:(id)a3
{
  id v3 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 URL]);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "presentedItemDidGainVersion: %@",  (uint8_t *)&v7,  0xCu);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Marking new version as resolved.",  (uint8_t *)&v7,  2u);
  }

  [v3 setResolved:1];
}

- (void)presentedItemDidMoveToURL:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cards were moved to %@.\n\tStopping ubiquity.",  (uint8_t *)&v7,  0xCu);
  }

  -[PDUbiquityManager setUbiquitousURL:](self, "setUbiquitousURL:", 0LL);
  atomic_store(0, (unsigned int *)&self->_ubiquityState);
}

- (void)presentedSubitemDidChangeAtURL:(id)a3
{
  id v4 = a3;
  id v5 = (void *)PDOSTransactionCreate("PDUbiquityManager");
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "presentedSubitemDidChangeAtURL: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x2020000000LL;
  char v22 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001ACB34;
  block[3] = &unk_10063C080;
  p___int128 buf = &buf;
  void block[4] = self;
  id v9 = v4;
  id v16 = v9;
  dispatch_sync((dispatch_queue_t)accessQueue, block);
  if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id v18 = 138412290;
      id v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Change at %@ is already enqueued", v18, 0xCu);
    }
  }

  else
  {
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001ACB94;
    v11[3] = &unk_100639350;
    __int128 v12 = v5;
    id v13 = v9;
    __int128 v14 = self;
    dispatch_async((dispatch_queue_t)queue, v11);

    int v7 = v12;
  }

  _Block_object_dispose(&buf, 8);
}

- (void)presentedSubitemDidAppearAtURL:(id)a3
{
  id v4 = a3;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "presentedSubitemDidAppearAtURL: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001ACFB8;
  v9[3] = &unk_1006392B0;
  id v10 = v4;
  id v11 = self;
  id v8 = v4;
  dispatch_async((dispatch_queue_t)queue, v9);
}

- (void)accommodatePresentedSubitemDeletionAtURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "accomodatePresentedSubitemDeletionAtURL: %@",  buf,  0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AD1B8;
  block[3] = &unk_10063A830;
  id v13 = v7;
  id v11 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (void)setLastPresentedItemEventIdentifier:(unint64_t)a3
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001AD21C;
  block[3] = &unk_100649B68;
  void block[4] = a3;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (unint64_t)lastPresentedItemEventIdentifier
{
  uint64_t NumberForKey = PKSharedCacheGetNumberForKey(PKSharedCacheLastEventIdentifierKey, a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(NumberForKey);
  id v4 = [v3 unsignedLongLongValue];

  uint64_t Object = PKLogFacilityTypeGetObject(1LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "returning last event identifier: %llu",  (uint8_t *)&v8,  0xCu);
  }

  return (unint64_t)v4;
}

- (PDUbiquityManagerDelegate)delegate
{
  return (PDUbiquityManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSURL)ubiquitousURL
{
  return (NSURL *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setUbiquitousURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end