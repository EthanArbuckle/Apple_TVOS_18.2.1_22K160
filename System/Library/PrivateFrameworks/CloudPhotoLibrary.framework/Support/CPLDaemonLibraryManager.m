@interface CPLDaemonLibraryManager
- (BOOL)isLibraryManager;
- (BOOL)isLibraryManager:(id)a3;
- (BOOL)isManagement;
- (BOOL)isManagementLibraryManager:(id)a3;
- (CPLDaemonLibraryManager)initWithConnection:(id)a3 name:(id)a4 allowedProcol:(id)a5 isManagement:(BOOL)a6;
- (CPLDaemonLibraryManagerDelegate)delegate;
- (CPLEngineWrapper)engineWrapper;
- (NSString)description;
- (NSString)name;
- (NSString)status;
- (NSXPCConnection)connection;
- (id)_clientWithErrorHandler:(id)a3;
- (id)displayableNameForLibraryManager:(id)a3;
- (void)_dropAllOtherLibraryManagersAndCallBlock:(id)a3;
- (void)_dropManagerWithCompletionBlock:(id)a3;
- (void)_dropVoucherForTaskWithIdentifier:(id)a3;
- (void)_dropWithCompletionBlock:(id)a3;
- (void)_killWithCompletionBlock:(id)a3;
- (void)_storeUploadTransferTask:(id)a3;
- (void)_storeVoucher:(id)a3 forTaskWithIdentifier:(id)a4;
- (void)_whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:(id)a3 callBlock:(id)a4;
- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)acknowledgeChangedStatuses:(id)a3;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)addInfoToLog:(id)a3;
- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4;
- (void)attachComputeStates:(id)a3 completionHandler:(id)a4;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 reply:(id)a7;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 reply:(id)a5;
- (void)beginPullSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)beginPushSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cancelSyncTaskWithIdentifier:(id)a3;
- (void)cancelTaskWithIdentifier:(id)a3;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)closeLibraryWithCompletionHandler:(id)a3;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5;
- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4;
- (void)compactFileCacheWithCompletionHandler:(id)a3;
- (void)connectWithCompletionHandler:(id)a3;
- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateLibraryWithCompletionHandler:(id)a3;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMingling;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)finalizeSessionWithCompletionHandler:(id)a3;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSyncForScopeIdentifiers:(id)a3 reply:(id)a4;
- (void)getChangeBatchWithCompletionHandler:(id)a3;
- (void)getChangedStatusesWithCompletionHandler:(id)a3;
- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getListOfComponentsWithCompletionHandler:(id)a3;
- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5;
- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4;
- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5;
- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5;
- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4;
- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4;
- (void)libraryManager:(id)a3 didFinishForceSyncTask:(id)a4 withErrors:(id)a5;
- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6;
- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5;
- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4;
- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6;
- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6;
- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6;
- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4;
- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5;
- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5;
- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4;
- (void)libraryManagerDidStartSynchronization:(id)a3;
- (void)libraryManagerHasChangesToPull:(id)a3;
- (void)libraryManagerHasStatusChanges:(id)a3;
- (void)libraryManagerStatusDidChange:(id)a3;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)openLibraryWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9;
- (void)processSessionContext:(id)a3;
- (void)provideCloudResource:(id)a3 completionHandler:(id)a4;
- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4;
- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5;
- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7;
- (void)reportMiscInformation:(id)a3;
- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4;
- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4;
- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3;
- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5;
- (void)resetStatus;
- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startSyncSession;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLDaemonLibraryManager

- (CPLDaemonLibraryManager)initWithConnection:(id)a3 name:(id)a4 allowedProcol:(id)a5 isManagement:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS___CPLDaemonLibraryManager;
  v14 = -[CPLDaemonLibraryManager init](&v47, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connection, a3);
    v15->_processIdentifier = [v11 processIdentifier];
    v15->_isManagement = a6;
    if ([v12 hasPrefix:@"com.apple."])
    {
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v12 substringFromIndex:10]);

      id v12 = (id)v16;
    }

    v17 = (NSString *)[v12 copy];
    name = v15->_name;
    v15->_name = v17;

    v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    downloadTasksPerIdentifier = v15->_downloadTasksPerIdentifier;
    v15->_downloadTasksPerIdentifier = v19;

    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uploadTasksPerIdentifier = v15->_uploadTasksPerIdentifier;
    v15->_uploadTasksPerIdentifier = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    forceSyncTasksPerIdentifier = v15->_forceSyncTasksPerIdentifier;
    v15->_forceSyncTasksPerIdentifier = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    vouchersPerTaskIdentifier = v15->_vouchersPerTaskIdentifier;
    v15->_vouchersPerTaskIdentifier = v25;

    uint64_t v28 = CPLCopyDefaultSerialQueueAttributes(v27);
    v29 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 _queue]);
    dispatch_queue_t v31 = dispatch_queue_create_with_target_V2("com.apple.cloudphotod.daemon.librarymanager", v29, v30);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v31;

    objc_storeStrong((id *)&v15->_allowedProtocol, a5);
    v33 = NSStringFromProtocol(v15->_allowedProtocol);
    uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
    protocolDescription = v15->_protocolDescription;
    v15->_protocolDescription = (NSString *)v34;

    if (-[NSString hasPrefix:](v15->_protocolDescription, "hasPrefix:", @"CPLDaemon"))
    {
      uint64_t v36 = objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v15->_protocolDescription, "substringFromIndex:", 9LL));
      v37 = v15->_protocolDescription;
      v15->_protocolDescription = (NSString *)v36;
    }

    if (-[NSString hasSuffix:](v15->_protocolDescription, "hasSuffix:", @"Protocol"))
    {
      uint64_t v38 = objc_claimAutoreleasedReturnValue( -[NSString substringToIndex:]( v15->_protocolDescription,  "substringToIndex:",  (char *)-[NSString length](v15->_protocolDescription, "length") - 8));
      v39 = v15->_protocolDescription;
      v15->_protocolDescription = (NSString *)v38;
    }

    v15->_isLibraryManager = v15->_allowedProtocol == (Protocol *)&OBJC_PROTOCOL___CPLDaemonLibraryManagerProtocol;
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProxyLibraryManager daemonProtocolInterface]( &OBJC_CLASS___CPLProxyLibraryManager,  "daemonProtocolInterface"));
    [v11 setExportedInterface:v40];
    [v11 setExportedObject:v15];
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[CPLProxyLibraryManager clientProtocolInterface]( &OBJC_CLASS___CPLProxyLibraryManager,  "clientProtocolInterface"));
    [v11 setRemoteObjectInterface:v41];
    [v11 _setQueue:v15->_queue];
    [v11 setDelegate:v15];
    objc_initWeak(&location, v11);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100016888;
    v43[3] = &unk_10023E8E8;
    objc_copyWeak(&v45, &location);
    v44 = v15;
    [v11 setInvalidationHandler:v43];
    [v11 resume];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (void)dealloc
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_1000169C8();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%@ has been deallocated", buf, 0xCu);
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CPLDaemonLibraryManager;
  -[CPLDaemonLibraryManager dealloc](&v5, "dealloc");
}

- (NSString)status
{
  engineWrapper = self->_engineWrapper;
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  objc_super v5 = v4;
  name = self->_name;
  uint64_t processIdentifier = self->_processIdentifier;
  if (engineWrapper)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self->_engineWrapper, "libraryIdentifier"));
    v9 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"%@ - pid: %d - proxy: %p - attached to %@",  name,  processIdentifier,  self,  v8);
  }

  else
  {
    v9 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"%@ - pid: %d - proxy: %p - waiting for client to open a library manager",  name,  self->_processIdentifier,  self);
  }

  return v9;
}

- (NSString)description
{
  engineWrapper = self->_engineWrapper;
  v4 = objc_alloc(&OBJC_CLASS___NSString);
  objc_super v5 = v4;
  name = self->_name;
  uint64_t processIdentifier = self->_processIdentifier;
  protocolDescription = self->_protocolDescription;
  if (engineWrapper)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self->_engineWrapper, "libraryIdentifier"));
    v10 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"<%@ (%d) %@ for %@>",  name,  processIdentifier,  protocolDescription,  v9);
  }

  else
  {
    v10 = -[NSString initWithFormat:]( v4,  "initWithFormat:",  @"<%@ (%d) %@ waiting for open>",  name,  self->_processIdentifier,  protocolDescription);
  }

  return v10;
}

- (id)_clientWithErrorHandler:(id)a3
{
  return -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connection,  "remoteObjectProxyWithErrorHandler:",  a3);
}

- (void)connectWithCompletionHandler:(id)a3
{
}

- (void)_dropManagerWithCompletionBlock:(id)a3
{
  v4 = (void (**)(void))a3;
  manager = self->_manager;
  if (manager)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1000169C8();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Closing current library manager", buf, 2u);
      }

      manager = self->_manager;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager currentSession](manager, "currentSession"));
    if (v8)
    {
      if (!_CPLSilentLogging)
      {
        id v9 = sub_1000169C8();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          name = self->_name;
          int processIdentifier = self->_processIdentifier;
          id v13 = [(id)objc_opt_class(v8) shortDescription];
          v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          *(_DWORD *)buf = 138543874;
          v29 = (CPLDaemonLibraryManager *)name;
          __int16 v30 = 1024;
          LODWORD(v31[0]) = processIdentifier;
          WORD2(v31[0]) = 2112;
          *(void *)((char *)v31 + 6) = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%{public}@ (%d) unexpectedly quit during %@ session - might trigger a reset sync",  buf,  0x1Cu);
        }
      }

      v15 = self->_name;
      id v16 = [(id)objc_opt_class(v8) shortDescription];
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      +[CPLResetTracker registerLikelyResetReason:]( &OBJC_CLASS___CPLResetTracker,  "registerLikelyResetReason:",  @"%@ unexpectedly quit during %@ session",  v15,  v17);
    }

    -[NSMutableDictionary removeAllObjects](self->_vouchersPerTaskIdentifier, "removeAllObjects");
    if (!_CPLSilentLogging)
    {
      id v18 = sub_1000169C8();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        id v20 = -[NSMutableDictionary count](self->_downloadTasksPerIdentifier, "count");
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2048;
        v31[0] = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%@ cancelling %lu tasks", buf, 0x16u);
      }
    }

    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_downloadTasksPerIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10023E928);
    -[NSMutableDictionary removeAllObjects](self->_downloadTasksPerIdentifier, "removeAllObjects");
    if (!_CPLSilentLogging)
    {
      id v21 = sub_1000169C8();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        id v23 = -[NSMutableDictionary count](self->_forceSyncTasksPerIdentifier, "count");
        *(_DWORD *)buf = 138412546;
        v29 = self;
        __int16 v30 = 2048;
        v31[0] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ cancelling %lu sync tasks", buf, 0x16u);
      }
    }

    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_forceSyncTasksPerIdentifier,  "enumerateKeysAndObjectsUsingBlock:",  &stru_10023E968);
    -[NSMutableDictionary removeAllObjects](self->_forceSyncTasksPerIdentifier, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_uploadTasksPerIdentifier, "removeAllObjects");
    v24 = self->_manager;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100016F84;
    v26[3] = &unk_10023E118;
    v26[4] = self;
    uint64_t v27 = v4;
    -[CPLLibraryManager closeWithCompletionHandler:](v24, "closeWithCompletionHandler:", v26);
    v25 = self->_manager;
    self->_manager = 0LL;
  }

  else
  {
    v4[2](v4);
  }
}

- (void)_killWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000170F8;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022874;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_dropWithCompletionBlock:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100017464;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100022874;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)_whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:(id)a3 callBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained daemonLibraryManagerOtherLibraryManager:self withLibraryIdentifier:v6]);

  if (v9)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        id v16 = self;
        __int16 v17 = 2112;
        id v18 = v9;
        __int16 v19 = 2112;
        id v20 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ is connecting to engine while %@ is already connected. Will drop %@",  buf,  0x20u);
      }
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100017768;
    v12[3] = &unk_10023DB10;
    v12[4] = self;
    id v13 = v6;
    v14 = v7;
    [v9 _killWithCompletionBlock:v12];
  }

  else
  {
    v7[2](v7);
  }
}

- (void)_dropAllOtherLibraryManagersAndCallBlock:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager engineWrapper](self, "engineWrapper"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 libraryIdentifier]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100017988;
  v14[3] = &unk_10023E9D0;
  v14[4] = self;
  dispatch_group_t v15 = v5;
  dispatch_block_t v9 = v5;
  [WeakRetained enumerateDaemonLibraryManagersWithLibraryIdentifier:v8 block:v14];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100017A2C;
  block[3] = &unk_10023DBC8;
  id v13 = v4;
  id v11 = v4;
  dispatch_group_notify(v9, (dispatch_queue_t)queue, block);
}

- (void)openLibraryWithClientLibraryBaseURL:(id)a3 cloudLibraryStateStorageURL:(id)a4 cloudLibraryResourceStorageURL:(id)a5 libraryIdentifier:(id)a6 mainScopeIdentifier:(id)a7 options:(unint64_t)a8 completionHandler:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100017BB8;
  v30[3] = &unk_10023EA20;
  v30[4] = self;
  id v31 = v16;
  id v32 = v17;
  id v33 = v18;
  id v22 = v19;
  id v34 = v22;
  id v35 = v20;
  unint64_t v37 = a8;
  SEL v38 = a2;
  id v36 = v21;
  id v23 = v21;
  id v24 = v20;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  uint64_t v28 = objc_retainBlock(v30);
  v29 = v28;
  if (self->_isLibraryManager) {
    -[CPLDaemonLibraryManager _whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:callBlock:]( self,  "_whenThereIsNoOtherLibraryManagersOpenedWithLibraryIdentifier:callBlock:",  v22,  v28);
  }
  else {
    ((void (*)(void *))v28[2])(v28);
  }
}

- (void)closeLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_1000169C8();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Closing library manager for %@", buf, 0xCu);
      }
    }

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000186F0;
    v10[3] = &unk_10023DBC8;
    id v11 = v4;
    -[CPLDaemonLibraryManager _dropManagerWithCompletionBlock:](self, "_dropManagerWithCompletionBlock:", v10);
    v7 = v11;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_1000169C8();
      dispatch_block_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ tried to close a manager that is not present",  buf,  0xCu);
      }
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)deactivateLibraryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_1000169C8();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager libraryIdentifier](self->_manager, "libraryIdentifier"));
        *(_DWORD *)buf = 138543362;
        dispatch_group_t v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "DEACTIVATING LIBRARY %{public}@", buf, 0xCu);
      }
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000188CC;
    v12[3] = &unk_10023E058;
    v12[4] = self;
    id v13 = v4;
    -[CPLDaemonLibraryManager _dropAllOtherLibraryManagersAndCallBlock:]( self,  "_dropAllOtherLibraryManagersAndCallBlock:",  v12);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_1000169C8();
      dispatch_block_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineWrapper libraryIdentifier](self->_engineWrapper, "libraryIdentifier"));
        *(_DWORD *)buf = 138412546;
        dispatch_group_t v15 = self;
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ tried to deactivate a manager for %@ that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, void *))v4 + 2))(v4, v11);
  }
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager mainScopeIdentifier](manager, "mainScopeIdentifier"));
    unsigned int v10 = [v6 isEqualToString:v9];

    id v11 = self->_manager;
    if (v10) {
      -[CPLLibraryManager enableMainScopeWithCompletionHandler:](v11, "enableMainScopeWithCompletionHandler:", v7);
    }
    else {
      -[CPLLibraryManager activateScopeWithIdentifier:completionHandler:]( v11,  "activateScopeWithIdentifier:completionHandler:",  v6,  v7);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        __int16 v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to enable PrimarySync for a manager that is not present",  (uint8_t *)&v15,  0xCu);
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v7[2](v7, v14);
  }
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager mainScopeIdentifier](manager, "mainScopeIdentifier"));
    unsigned int v10 = [v6 isEqualToString:v9];

    id v11 = self->_manager;
    if (v10) {
      -[CPLLibraryManager disableMainScopeWithCompletionHandler:](v11, "disableMainScopeWithCompletionHandler:", v7);
    }
    else {
      -[CPLLibraryManager deactivateScopeWithIdentifier:completionHandler:]( v11,  "deactivateScopeWithIdentifier:completionHandler:",  v6,  v7);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        __int16 v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to enable PrimarySync for a manager that is not present",  (uint8_t *)&v15,  0xCu);
      }
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v7[2](v7, v14);
  }
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager boostPriorityForScopeWithIdentifier:completionHandler:]( manager,  "boostPriorityForScopeWithIdentifier:completionHandler:",  v6,  v7);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000169C8();
      unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to boost priority for %@ for a manager that is not present",  (uint8_t *)&v12,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v7[2](v7, v11);
  }
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (self->_manager)
  {
    id v17 = (void *)voucher_copy();
    if (!_CPLSilentLogging)
    {
      id v18 = sub_1000169C8();
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412802;
        id v32 = (CPLDaemonLibraryManager *)manager;
        __int16 v33 = 2112;
        id v34 = v12;
        __int16 v35 = 2112;
        id v36 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Asking %@ for a task to download %@(%@)",  buf,  0x20u);
      }
    }

    id v21 = self->_manager;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100019154;
    v25[3] = &unk_10023EA70;
    id v26 = v12;
    id v27 = v14;
    uint64_t v28 = self;
    id v29 = v17;
    id v30 = v16;
    id v22 = v17;
    -[CPLLibraryManager beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:]( v21,  "beginDownloadForResource:clientBundleID:options:proposedTaskIdentifier:completionHandler:",  v26,  v13,  v27,  v15,  v25);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v23 = sub_1000169C8();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%@ tried to download a resource for a manager that is not present",  buf,  0xCu);
      }
    }

    (*((void (**)(id, void))v16 + 2))(v16, 0LL);
  }
}

- (void)cancelTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_downloadTasksPerIdentifier, "objectForKey:", v4));
    if (!v5) {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uploadTasksPerIdentifier, "objectForKey:", v4));
    }
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1000169C8();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412290;
        unsigned int v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Cancelling %@", (uint8_t *)&v9, 0xCu);
      }
    }

    [v5 cancelTask];
LABEL_12:

    goto LABEL_13;
  }

  if (!_CPLSilentLogging)
  {
    id v8 = sub_1000169C8();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      unsigned int v10 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "%@ tried to cancel a task with no identifier",  (uint8_t *)&v9,  0xCu);
    }

    goto LABEL_12;
  }

- (void)processSessionContext:(id)a3
{
  manager = self->_manager;
  id v5 = a3;
  -[CPLLibraryManager setEstimatedInitialSizeForLocalLibrary:]( manager,  "setEstimatedInitialSizeForLocalLibrary:",  [v5 estimatedInitialSizeForLocalLibrary]);
  id v6 = self->_manager;
  id v7 = [v5 estimatedInitialAssetCountForLocalLibrary];

  -[CPLLibraryManager setEstimatedInitialAssetCountForLocalLibrary:]( v6,  "setEstimatedInitialAssetCountForLocalLibrary:",  v7);
}

- (void)beginPushSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000169C8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412290;
        id v30 = (CPLDaemonLibraryManager *)manager;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Beginning push session with %@", buf, 0xCu);
      }
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained startSyncTaskForDaemonLibraryManager:self];

    -[CPLDaemonLibraryManager processSessionContext:](self, "processSessionContext:", v9);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 resetTracker]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPLResetTracker currentTracker](&OBJC_CLASS___CPLResetTracker, "currentTracker"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 earliestReasonDate]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 earliestReasonDate]);
    id v19 = [v17 compare:v18];

    if (v19 == (id)-1LL) {
      id v20 = v15;
    }
    else {
      id v20 = v16;
    }
    id v21 = v20;
    id v22 = self->_manager;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100019730;
    v26[3] = &unk_10023EA98;
    id v27 = v16;
    id v28 = v10;
    id v23 = v16;
    -[CPLLibraryManager beginPushChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:]( v22,  "beginPushChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:",  v8,  v21,  v26);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v24 = sub_1000169C8();
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%@ tried to begin a push session for a manager that is not present",  buf,  0xCu);
      }
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, void *))v10 + 2))(v10, v15);
  }
}

- (void)beginPullSessionWithKnownLibraryVersion:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000169C8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412290;
        id v29 = (CPLDaemonLibraryManager *)manager;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Beginning pull session with %@", buf, 0xCu);
      }
    }

    -[CPLDaemonLibraryManager processSessionContext:](self, "processSessionContext:", v9);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 resetTracker]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLResetTracker currentTracker](&OBJC_CLASS___CPLResetTracker, "currentTracker"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 earliestReasonDate]);
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 earliestReasonDate]);
    id v18 = [v16 compare:v17];

    if (v18 == (id)-1LL) {
      id v19 = v14;
    }
    else {
      id v19 = v15;
    }
    id v20 = v19;
    id v21 = self->_manager;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100019AF8;
    v25[3] = &unk_10023EAC0;
    id v26 = v15;
    id v27 = v10;
    id v22 = v15;
    -[CPLLibraryManager beginPullChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:]( v21,  "beginPullChangeSessionWithKnownLibraryVersion:resetTracker:completionHandler:",  v8,  v20,  v25);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v23 = sub_1000169C8();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%@ tried to begin a pull session for a manager that is not present",  buf,  0xCu);
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }
}

- (void)finalizeSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    id v6 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager currentSession](manager, "currentSession"));
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        id v7 = sub_1000169C8();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v6;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Finalizing %@", buf, 0xCu);
        }
      }

      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100019E98;
      v15[3] = &unk_10023EAE8;
      id v16 = v4;
      -[CPLDaemonLibraryManager finalizeWithCompletionHandler:](v6, "finalizeWithCompletionHandler:", v15);
      id v9 = v16;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v12 = sub_1000169C8();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v18 = self;
          __int16 v19 = 2112;
          id v20 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to finalize a session for %@ but there is no current session",  buf,  0x16u);
        }
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectMachineStateErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "incorrectMachineStateErrorWithReason:",  @"No session opened"));
      (*((void (**)(id, void *))v4 + 2))(v4, v9);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to finalize a session for a manager that is not present",  buf,  0xCu);
      }
    }

    id v6 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, CPLDaemonLibraryManager *))v4 + 2))(v4, v6);
  }
}

- (void)getChangeBatchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    id v6 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager currentSession](manager, "currentSession"));
    if (v6 && (uint64_t v7 = objc_opt_class(&OBJC_CLASS___CPLPullChangeSession), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
    {
      if (!_CPLSilentLogging)
      {
        id v8 = sub_1000169C8();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v19 = v6;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Getting changes from %@", buf, 0xCu);
        }
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472LL;
      v16[2] = sub_10001A23C;
      v16[3] = &unk_10023EB10;
      id v17 = v4;
      -[CPLDaemonLibraryManager getChangeBatchWithCompletionHandler:](v6, "getChangeBatchWithCompletionHandler:", v16);
      id v10 = v17;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v11 = sub_1000169C8();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          id v13 = self->_manager;
          *(_DWORD *)buf = 138412546;
          __int16 v19 = self;
          __int16 v20 = 2112;
          id v21 = v13;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ tried to get changes for %@ but there is no current pull session",  buf,  0x16u);
        }
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectMachineStateErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "incorrectMachineStateErrorWithReason:",  @"No session opened"));
      (*((void (**)(id, void *, void))v4 + 2))(v4, v10, 0LL);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_1000169C8();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v19 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@ tried to get changes for a manager that is not present",  buf,  0xCu);
      }
    }

    id v6 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, CPLDaemonLibraryManager *, void))v4 + 2))(v4, v6, 0LL);
  }
}

- (void)acknowledgeChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (CPLLibraryManager *)a3;
  id v7 = a4;
  manager = self->_manager;
  if (manager)
  {
    id v9 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager currentSession](manager, "currentSession"));
    if (v9 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___CPLPullChangeSession), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
    {
      if (!_CPLSilentLogging)
      {
        id v11 = sub_1000169C8();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v9;
          __int16 v23 = 2112;
          id v24 = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Acknowledging batch from %@: %@",  buf,  0x16u);
        }
      }

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10001A760;
      v19[3] = &unk_10023EB38;
      id v20 = v7;
      -[CPLDaemonLibraryManager acknowledgeChangeBatch:withCompletionHandler:]( v9,  "acknowledgeChangeBatch:withCompletionHandler:",  v6,  v19);
      id v13 = v20;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_1000169C8();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v22 = self;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@ tried to acknowledge a batch for %@ but there is no current pull session",  buf,  0x16u);
        }
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectMachineStateErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "incorrectMachineStateErrorWithReason:",  @"No session opened"));
      (*((void (**)(id, void *, void))v7 + 2))(v7, v13, 0LL);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = sub_1000169C8();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%@ tried to acknowledge a batch for a manager that is not present",  buf,  0xCu);
      }
    }

    id v9 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, CPLDaemonLibraryManager *, void))v7 + 2))(v7, v9, 0LL);
  }
}

- (void)commitChangeBatch:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = (CPLLibraryManager *)a3;
  id v7 = a4;
  manager = self->_manager;
  if (manager)
  {
    id v9 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager currentSession](manager, "currentSession"));
    if (v9 && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___CPLPushChangeSession), (objc_opt_isKindOfClass(v9, v10) & 1) != 0))
    {
      if (!_CPLSilentLogging)
      {
        id v11 = sub_1000169C8();
        id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v22 = v9;
          __int16 v23 = 2112;
          id v24 = v6;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Committing batch to %@: %@", buf, 0x16u);
        }
      }

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_10001AB60;
      v19[3] = &unk_10023EB60;
      id v20 = v7;
      -[CPLDaemonLibraryManager commitChangeBatch:withUnderlyingCompletionHandler:]( v9,  "commitChangeBatch:withUnderlyingCompletionHandler:",  v6,  v19);
      id v13 = v20;
    }

    else
    {
      if (!_CPLSilentLogging)
      {
        id v14 = sub_1000169C8();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v16 = self->_manager;
          *(_DWORD *)buf = 138412546;
          id v22 = self;
          __int16 v23 = 2112;
          id v24 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@ tried to commit a batch for %@ but there is no current push session",  buf,  0x16u);
        }
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectMachineStateErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "incorrectMachineStateErrorWithReason:",  @"No session opened"));
      (*((void (**)(id, void *, void, void, void))v7 + 2))(v7, v13, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = sub_1000169C8();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%@ tried to commit a batch for a manager that is not present",  buf,  0xCu);
      }
    }

    id v9 = (CPLDaemonLibraryManager *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, CPLDaemonLibraryManager *, void, void, void))v7 + 2))(v7, v9, 0LL, 0LL, 0LL);
  }
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *, NSMutableDictionary *))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager deleteResources:checkServerIfNecessary:completionHandler:]( manager,  "deleteResources:checkServerIfNecessary:completionHandler:",  v8,  v6,  v9);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000169C8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ tried to delete resources for a manager that is not present",  buf,  0xCu);
      }
    }

    id v13 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        __int16 v19 = 0LL;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v19),  (void)v20);
          __int16 v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v17);
    }

    v9[2](v9, &__NSArray0__struct, v13);
  }
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void *, NSMutableDictionary *))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:]( manager,  "checkResourcesAreSafeToPrune:checkServerIfNecessary:completionHandler:",  v8,  v6,  v9);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000169C8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ tried to check purgeable resources for a manager that is not present",  buf,  0xCu);
      }
    }

    id v13 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v15 = v8;
    id v16 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v21;
      do
      {
        __int16 v19 = 0LL;
        do
        {
          if (*(void *)v21 != v18) {
            objc_enumerationMutation(v15);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:]( v13,  "setObject:forKeyedSubscript:",  v14,  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v19),  (void)v20);
          __int16 v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v17);
    }

    v9[2](v9, &__NSArray0__struct, v13);
  }
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getResourcesForItemWithScopedIdentifier:completionHandler:]( manager,  "getResourcesForItemWithScopedIdentifier:completionHandler:",  v6,  v7);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000169C8();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138412290;
        id v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to get resources for a manager that is not present",  (uint8_t *)&v12,  0xCu);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v7[2](v7, v11, 0LL);
  }
}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager compactFileCacheWithCompletionHandler:](manager, "compactFileCacheWithCompletionHandler:", v4);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1000169C8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 138412290;
        uint64_t v10 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ tried to compact file cache for a manager that is not present",  (uint8_t *)&v9,  0xCu);
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v4[2](v4, v8);
  }
}

- (void)startSyncSession
{
}

- (void)resetStatus
{
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
}

- (void)noteClientIsInBackground
{
}

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = (void (**)(void, void, void))v5;
  manager = self->_manager;
  if (manager)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001B46C;
    v13[3] = &unk_10023EB88;
    id v14 = v5;
    -[CPLLibraryManager checkHasBackgroundDownloadOperationsWithCompletionHandler:]( manager,  "checkHasBackgroundDownloadOperationsWithCompletionHandler:",  v13);
    id v8 = v14;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000169C8();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromSelector(a2);
        int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        *(_DWORD *)buf = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
  }
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getStatusForRecordsWithScopedIdentifiers:completionHandler:]( manager,  "getStatusForRecordsWithScopedIdentifiers:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getChangedStatusesWithCompletionHandler:]( manager,  "getChangedStatusesWithCompletionHandler:",  v5);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1000169C8();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = NSStringFromSelector(a2);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        int v15 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v12,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v5[2](v5, 0LL, v11);
  }
}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v5 = a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager acknowledgeChangedStatuses:](manager, "acknowledgeChangedStatuses:", v5);
  }

  else if (!_CPLSilentLogging)
  {
    id v7 = sub_1000169C8();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412546;
      int v12 = self;
      __int16 v13 = 2112;
      __int16 v14 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v11,  0x16u);
    }
  }
}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager addStatusChangesForRecordsWithScopedIdentifiers:persist:]( manager,  "addStatusChangesForRecordsWithScopedIdentifiers:persist:",  v7,  v4);
  }

  else if (!_CPLSilentLogging)
  {
    id v9 = sub_1000169C8();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = NSStringFromSelector(a2);
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      int v13 = 138412546;
      __int16 v14 = self;
      __int16 v15 = 2112;
      id v16 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v13,  0x16u);
    }
  }
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getScopeStatusCountsForScopeWithIdentifier:completionHandler:]( manager,  "getScopeStatusCountsForScopeWithIdentifier:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = NSStringFromSelector(a2);
        int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        uint64_t v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)disableSynchronizationWithReason:(id)a3
{
}

- (void)enableSynchronizationWithReason:(id)a3
{
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
}

- (void)disableMingling
{
}

- (void)enableMingling
{
}

- (void)noteClientIsBeginningSignificantWork
{
}

- (void)noteClientIsEndingSignificantWork
{
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  int v11 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager testKey:value:completionHandler:](manager, "testKey:value:completionHandler:", v9, v10, v11);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_1000169C8();
      __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = NSStringFromSelector(a2);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        int v18 = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        __int128 v21 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v18,  0x16u);
      }
    }

    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v11[2](v11, 0LL, v17);
  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getTargetsForRecordsWithScopedIdentifiers:completionHandler:]( manager,  "getTargetsForRecordsWithScopedIdentifiers:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager resetCacheWithOption:reason:completionHandler:]( manager,  "resetCacheWithOption:reason:completionHandler:",  a3,  v9,  v10);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v17,  0x16u);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v10[2](v10, v16);
  }
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, void, void *))a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getListOfComponentsWithCompletionHandler:]( manager,  "getListOfComponentsWithCompletionHandler:",  v5);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1000169C8();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = NSStringFromSelector(a2);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        int v12 = 138412546;
        id v13 = self;
        __int16 v14 = 2112;
        int v15 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v12,  0x16u);
      }
    }

    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v5[2](v5, 0LL, v11);
  }
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getStatusForComponents:completionHandler:]( manager,  "getStatusForComponents:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getStatusArrayForComponents:completionHandler:]( manager,  "getStatusArrayForComponents:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getStatusesForScopesWithIdentifiers:includeStorages:completionHandler:]( manager,  "getStatusesForScopesWithIdentifiers:includeStorages:completionHandler:",  v9,  v6,  v10);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v17,  0x16u);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v10[2](v10, 0LL, v16);
  }
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getCloudCacheForRecordWithScopedIdentifier:completionHandler:]( manager,  "getCloudCacheForRecordWithScopedIdentifier:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        int v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager cloudCacheGetDescriptionForRecordWithScopedIdentifier:related:completionHandler:]( manager,  "cloudCacheGetDescriptionForRecordWithScopedIdentifier:related:completionHandler:",  v9,  v6,  v10);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        __int16 v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v17 = 138412546;
        int v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v17,  0x16u);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    (*((void (**)(id, void, void, void *))v10 + 2))(v10, 0LL, 0LL, v16);
  }
}

- (void)addInfoToLog:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager addInfoToLog:](manager, "addInfoToLog:", v4);
  }

  else if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ wants to say '%@' but manager is not present",  (uint8_t *)&v8,  0x16u);
    }
  }
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  manager = self->_manager;
  if (manager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001C7FC;
    v10[3] = &unk_10023EAE8;
    id v11 = v4;
    -[CPLLibraryManager forceBackupWithCompletionHandler:](manager, "forceBackupWithCompletionHandler:", v10);
    id v7 = v11;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_1000169C8();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ wants to force a backup but manager is not present",  buf,  0xCu);
      }
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void (**)(void, void))v4;
  manager = self->_manager;
  if (manager)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10001C980;
    v10[3] = &unk_10023EAE8;
    id v11 = v4;
    -[CPLLibraryManager requestClientToPushAllChangesWithCompletionHandler:]( manager,  "requestClientToPushAllChangesWithCompletionHandler:",  v10);
    id v7 = v11;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_1000169C8();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "%@ wants to force client to push all changes but manager is not present",  buf,  0xCu);
      }
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void *))v5)[2](v5, v7);
  }
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  manager = self->_manager;
  if (manager)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001CB18;
    v13[3] = &unk_10023EAE8;
    id v14 = v7;
    -[CPLLibraryManager requestClientToPullAllChangesInScopeIdentifier:completionHandler:]( manager,  "requestClientToPullAllChangesInScopeIdentifier:completionHandler:",  v6,  v13);
    __int16 v10 = v14;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000169C8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%@ wants to force client to pull all changes but manager is not present",  buf,  0xCu);
      }
    }

    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void *))v8)[2](v8, v10);
  }
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager reportSetting:hasBeenSetToValue:](manager, "reportSetting:hasBeenSetToValue:", v6, v7);
  }

  else if (!_CPLSilentLogging)
  {
    id v9 = sub_1000169C8();
    __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412802;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v6;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ wants to report setting '%@' has been set to %@ but manager is not present",  (uint8_t *)&v11,  0x20u);
    }
  }
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager reportMiscInformation:](manager, "reportMiscInformation:", v4);
  }

  else if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412546;
      id v9 = self;
      __int16 v10 = 2112;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "%@ wants to report misc information '%@' but manager is not present",  (uint8_t *)&v8,  0x16u);
    }
  }
}

- (void)blockEngineElement:(id)a3
{
}

- (void)unblockEngineElement:(id)a3
{
}

- (void)unblockEngineElementOnce:(id)a3
{
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, uint64_t))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager provideScopeChangeForScopeWithIdentifier:completionHandler:]( manager,  "provideScopeChangeForScopeWithIdentifier:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v14 = 138412546;
        __int16 v15 = self;
        __int16 v16 = 2112;
        int v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ called for '%@' but manager is not present",  (uint8_t *)&v14,  0x16u);
      }
    }

    v8[2](v8, 0LL, 2LL);
  }
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, uint64_t))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager provideRecordWithCloudScopeIdentifier:completionHandler:]( manager,  "provideRecordWithCloudScopeIdentifier:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v14 = 138412546;
        __int16 v15 = self;
        __int16 v16 = 2112;
        int v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ called for '%@' but manager is not present",  (uint8_t *)&v14,  0x16u);
      }
    }

    v8[2](v8, 0LL, 2LL);
  }
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void, uint64_t))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager provideCloudResource:completionHandler:]( manager,  "provideCloudResource:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v14 = 138412546;
        __int16 v15 = self;
        __int16 v16 = 2112;
        int v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ called for '%@' but manager is not present",  (uint8_t *)&v14,  0x16u);
      }
    }

    v8[2](v8, 0LL, 2LL);
  }
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager addDropDerivativesRecipe:writeToUserDefaults:withCompletionHandler:]( manager,  "addDropDerivativesRecipe:writeToUserDefaults:withCompletionHandler:",  v9,  v6,  v10);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v14 = NSStringFromSelector(a2);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v16 = 138412546;
        int v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ called for '%@' but manager is not present",  (uint8_t *)&v16,  0x16u);
      }
    }

    v10[2](v10, 0LL);
  }
}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  int v8 = (void (**)(id, void))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager attachComputeStates:completionHandler:]( manager,  "attachComputeStates:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v14 = 138412546;
        __int16 v15 = self;
        __int16 v16 = 2112;
        int v17 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ called for '%@' but manager is not present",  (uint8_t *)&v14,  0x16u);
      }
    }

    v8[2](v8, 0LL);
  }
}

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  __int16 v16 = (void (**)(void, void, void))v15;
  manager = self->_manager;
  if (manager)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001D4E4;
    v23[3] = &unk_10023EBB0;
    id v24 = v15;
    -[CPLLibraryManager fetchComputeStatesForRecordsWithScopedIdentifiers:validator:shouldDecrypt:onDemand:completionHandler:]( manager,  "fetchComputeStatesForRecordsWithScopedIdentifiers:validator:shouldDecrypt:onDemand:completionHandler:",  v13,  v14,  v9,  v8,  v23);
    __int16 v18 = v24;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_1000169C8();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int128 v21 = NSStringFromSelector(a2);
        __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138412546;
        id v26 = self;
        __int16 v27 = 2112;
        id v28 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@ called for '%@' but manager is not present",  buf,  0x16u);
      }
    }

    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v16)[2](v16, 0LL, v18);
  }
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  id v19 = (void (**)(void, void, void, void, void, void))v18;
  manager = self->_manager;
  if (manager)
  {
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10001D72C;
    v27[3] = &unk_10023EBD8;
    id v28 = v18;
    __int128 v21 = *(_OWORD *)&a6->var0.var3;
    *(_OWORD *)buf = *(_OWORD *)&a6->var0.var0;
    *(_OWORD *)&buf[16] = v21;
    __int128 v30 = *(_OWORD *)&a6->var1.var1;
    -[CPLLibraryManager getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:]( manager,  "getStreamingURLOrMediaMakerDataForResource:intent:hints:timeRange:clientBundleID:completionHandler:",  v15,  a4,  v16,  buf,  v17,  v27);
    __int128 v22 = v28;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v23 = sub_1000169C8();
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        id v25 = NSStringFromSelector(a2);
        id v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void, void, void, void *))v19)[2](v19, 0LL, 0LL, 0LL, 0LL, v22);
  }
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = (void (**)(void, void, void, void))v9;
  manager = self->_manager;
  if (manager)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001D954;
    v17[3] = &unk_10023EC00;
    id v18 = v9;
    -[CPLLibraryManager rampingRequestForResourceType:numRequested:completionHandler:]( manager,  "rampingRequestForResourceType:numRequested:completionHandler:",  a3,  a4,  v17);
    id v12 = v18;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_1000169C8();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = NSStringFromSelector(a2);
        id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        *(_DWORD *)buf = 138412546;
        __int16 v20 = self;
        __int16 v21 = 2112;
        __int128 v22 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void, void *))v10)[2](v10, 0LL, 0LL, v12);
  }
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_manager)
  {
    id v11 = (void *)voucher_copy();
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        *(_DWORD *)buf = 138412546;
        id v25 = (CPLDaemonLibraryManager *)manager;
        __int16 v26 = 2112;
        id v27 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Asking %@ for a task to download %@ in-memory",  buf,  0x16u);
      }
    }

    id v15 = self->_manager;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001DBBC;
    v19[3] = &unk_10023EC28;
    id v20 = v8;
    __int16 v21 = self;
    id v22 = v11;
    id v23 = v10;
    id v16 = v11;
    -[CPLLibraryManager beginInMemoryDownloadOfResource:clientBundleID:completionHandler:]( v15,  "beginInMemoryDownloadOfResource:clientBundleID:completionHandler:",  v20,  v9,  v19);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v17 = sub_1000169C8();
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "%@ tried to download in-memory a resource for a manager that is not present",  buf,  0xCu);
      }
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void, void *))a4;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:]( manager,  "resolveLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:",  v7,  v8);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_1000169C8();
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = NSStringFromSelector(a2);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
        int v15 = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        id v18 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v15,  0x16u);
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v8[2](v8, 0LL, v14);
  }
}

- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    if (v6) {
      -[CPLLibraryManager getCloudScopedIdentifiersForLocalScopedIdentifiers:completionHandler:]( manager,  "getCloudScopedIdentifiersForLocalScopedIdentifiers:completionHandler:",  v9,  v10);
    }
    else {
      -[CPLLibraryManager getLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:]( manager,  "getLocalScopedIdentifiersForCloudScopedIdentifiers:completionHandler:",  v9,  v10);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v17 = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        id v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v17,  0x16u);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v10[2](v10, 0LL, v16);
  }
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001E15C;
    v16[3] = &unk_10023EC50;
    id v17 = v8;
    -[CPLLibraryManager createScope:completionHandler:](manager, "createScope:completionHandler:", v7, v16);
    id v11 = v17;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
  }
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001E340;
    v16[3] = &unk_10023EC50;
    id v17 = v8;
    -[CPLLibraryManager updateShareForScope:completionHandler:]( manager,  "updateShareForScope:completionHandler:",  v7,  v16);
    id v11 = v17;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
  }
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  manager = self->_manager;
  if (manager)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001E528;
    v18[3] = &unk_10023EAE8;
    id v19 = v10;
    -[CPLLibraryManager deleteScopeWithIdentifier:forced:completionHandler:]( manager,  "deleteScopeWithIdentifier:forced:completionHandler:",  v9,  v6,  v18);
    id v13 = v19;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_1000169C8();
      int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = NSStringFromSelector(a2);
        id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        *(_DWORD *)buf = 138412546;
        __int16 v21 = self;
        __int16 v22 = 2112;
        id v23 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void *))v11)[2](v11, v13);
  }
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001E6F0;
    v16[3] = &unk_10023EC50;
    id v17 = v8;
    -[CPLLibraryManager refreshScopeWithIdentifier:completionHandler:]( manager,  "refreshScopeWithIdentifier:completionHandler:",  v7,  v16);
    id v11 = v17;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412546;
        id v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
  }
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001E8D4;
    v16[3] = &unk_10023EC50;
    id v17 = v8;
    -[CPLLibraryManager fetchSharedScopeFromShareURL:completionHandler:]( manager,  "fetchSharedScopeFromShareURL:completionHandler:",  v7,  v16);
    id v11 = v17;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412546;
        id v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
  }
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001EAB4;
    v16[3] = &unk_10023EAE8;
    id v17 = v8;
    -[CPLLibraryManager acceptSharedScope:completionHandler:](manager, "acceptSharedScope:completionHandler:", v7, v16);
    id v11 = v17;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        int v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412546;
        id v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void *))v9)[2](v9, v11);
  }
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  BOOL v6 = (void (**)(void, void, void))v5;
  manager = self->_manager;
  if (manager)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001EC60;
    v13[3] = &unk_10023EC50;
    id v14 = v5;
    -[CPLLibraryManager fetchExistingSharedLibraryScopeWithCompletionHandler:]( manager,  "fetchExistingSharedLibraryScopeWithCompletionHandler:",  v13);
    id v8 = v14;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000169C8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromSelector(a2);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        *(_DWORD *)buf = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
  }
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  id v13 = (void (**)(void, void, void))v12;
  manager = self->_manager;
  if (manager)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10001EE5C;
    v20[3] = &unk_10023EC78;
    id v21 = v12;
    -[CPLLibraryManager startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]( manager,  "startExitFromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:",  v11,  a4,  a5,  v20);
    int v15 = v21;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v16 = sub_1000169C8();
      __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        id v18 = NSStringFromSelector(a2);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        *(_DWORD *)buf = 138412546;
        id v23 = self;
        __int16 v24 = 2112;
        id v25 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    int v15 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v13)[2](v13, 0LL, v15);
  }
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = (void (**)(void, void, void))v15;
  manager = self->_manager;
  if (manager)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10001F06C;
    v23[3] = &unk_10023EC78;
    id v24 = v15;
    -[CPLLibraryManager removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:]( manager,  "removeParticipants:fromSharedScopeWithIdentifier:retentionPolicy:exitSource:completionHandler:",  v13,  v14,  a5,  a6,  v23);
    id v18 = v24;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_1000169C8();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = NSStringFromSelector(a2);
        __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138412546;
        __int16 v26 = self;
        __int16 v27 = 2112;
        id v28 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v16)[2](v16, 0LL, v18);
  }
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5 = a3;
  BOOL v6 = (void (**)(void, void, void))v5;
  manager = self->_manager;
  if (manager)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10001F234;
    v13[3] = &unk_10023EB88;
    id v14 = v5;
    -[CPLLibraryManager sharedLibraryRampCheckWithCompletionHandler:]( manager,  "sharedLibraryRampCheckWithCompletionHandler:",  v13);
    id v8 = v14;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000169C8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromSelector(a2);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        *(_DWORD *)buf = 138412546;
        id v16 = self;
        __int16 v17 = 2112;
        id v18 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v6)[2](v6, 0LL, v8);
  }
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = (void (**)(id, void, void *))a5;
  manager = self->_manager;
  if (manager)
  {
    -[CPLLibraryManager getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:]( manager,  "getStatusForPendingRecordsSharedToScopeWithIdentifier:maximumCount:completionHandler:",  v9,  a4,  v10);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v17 = 138412546;
        id v18 = self;
        __int16 v19 = 2112;
        __int16 v20 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  (uint8_t *)&v17,  0x16u);
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    v10[2](v10, 0LL, v16);
  }
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void, void, void))v8;
  manager = self->_manager;
  if (manager)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10001F550;
    v16[3] = &unk_10023ECA0;
    id v17 = v8;
    -[CPLLibraryManager queryUserDetailsForShareParticipants:completionHandler:]( manager,  "queryUserDetailsForShareParticipants:completionHandler:",  v7,  v16);
    id v11 = v17;
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v12 = sub_1000169C8();
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSStringFromSelector(a2);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        *(_DWORD *)buf = 138412546;
        __int16 v19 = self;
        __int16 v20 = 2112;
        id v21 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "%@ tried to call %@ for a manager that is not present",  buf,  0x16u);
      }
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[CPLErrors unknownError](&OBJC_CLASS___CPLErrors, "unknownError"));
    ((void (**)(void, void, void *))v9)[2](v9, 0LL, v11);
  }
}

- (void)forceSyncForScopeIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_manager)
  {
    id v8 = (void *)voucher_copy();
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000169C8();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        manager = self->_manager;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", @", "));
        *(_DWORD *)buf = 138412546;
        id v23 = (CPLDaemonLibraryManager *)manager;
        __int16 v24 = 2112;
        id v25 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Asking %@ for a task to sync %@", buf, 0x16u);
      }
    }

    id v13 = self->_manager;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10001F7C4;
    v17[3] = &unk_10023ECC8;
    id v18 = v6;
    __int16 v19 = self;
    id v20 = v8;
    id v21 = v7;
    id v14 = v8;
    -[CPLLibraryManager forceSynchronizingScopeWithIdentifiers:completionHandler:]( v13,  "forceSynchronizingScopeWithIdentifiers:completionHandler:",  v18,  v17);
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v15 = sub_1000169C8();
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%@ tried to force sync for a manager that is not present",  buf,  0xCu);
      }
    }

    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)cancelSyncTaskWithIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_forceSyncTasksPerIdentifier,  "objectForKeyedSubscript:",  v4));
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1000169C8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v9 = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Cancelling %@", (uint8_t *)&v9, 0xCu);
      }
    }

    [v5 cancelTask];
LABEL_10:

    goto LABEL_11;
  }

  if (!_CPLSilentLogging)
  {
    id v8 = sub_1000169C8();
    id v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v5,  OS_LOG_TYPE_ERROR,  "%@ tried to cancel a task with no identifier",  (uint8_t *)&v9,  0xCu);
    }

    goto LABEL_10;
  }

- (void)libraryManagerStatusDidChange:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = sub_1000169C8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      id v8 = -[CPLLibraryManager status](manager, "status");
      int v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager statusError](self->_manager, "statusError"));
      *(_DWORD *)buf = 138412802;
      __int16 v19 = manager;
      __int16 v20 = 2048;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%@ status did change to %lu (status error: %@)",  buf,  0x20u);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", &stru_10023ECE8));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[CPLLibraryManager status](self->_manager, "status", @"status")));
  v16[1] = @"error";
  v17[0] = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLLibraryManager statusError](self->_manager, "statusError"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 cplSafeErrorForXPC]);
  id v14 = v13;
  if (!v13) {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  v17[1] = v14;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  [v10 libraryManagerDidUpdateStatusWithProperties:v15];

  if (!v13) {
}
  }

- (void)libraryManagerDidStartSynchronization:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_1000169C8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = NSStringFromSelector(a2);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v8 = 138412290;
      int v9 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%@ is not implemented yet",  (uint8_t *)&v8,  0xCu);
    }
  }

- (void)libraryManagerHasChangesToPull:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_1000169C8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      int v8 = 138412546;
      int v9 = manager;
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%@ has changes to pull. Notifying %@",  (uint8_t *)&v8,  0x16u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", &stru_10023ED08));
  [v7 libraryManagerHasChangesToPull];
}

- (void)libraryManagerHasStatusChanges:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_1000169C8();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      int v8 = 138412546;
      int v9 = manager;
      __int16 v10 = 2112;
      id v11 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%@ has status changes. Notifying %@",  (uint8_t *)&v8,  0x16u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", &stru_10023ED28));
  [v7 libraryManagerHasStatusChanges];
}

- (void)libraryManager:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  if (!_CPLSilentLogging)
  {
    id v11 = sub_1000169C8();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      *(_DWORD *)buf = 138412802;
      __int16 v26 = manager;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      __int128 v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ wants (local) %@. Asking %@", buf, 0x20u);
    }
  }

  __int16 v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472LL;
  id v21 = sub_1000202E8;
  __int16 v22 = &unk_10023E458;
  id v23 = v9;
  id v24 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", &v19));
  id v17 = NSStringFromClass(a5);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v16, "provideLocalResource:recordClassString:completionHandler:", v15, v18, v14, v19, v20, v21, v22);
}

- (void)libraryManager:(id)a3 pushAllChangesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      manager = self->_manager;
      *(_DWORD *)buf = 138412546;
      id v14 = manager;
      __int16 v15 = 2112;
      id v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "%@ wants client to push all changes. Asking %@",  buf,  0x16u);
    }
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100020504;
  v11[3] = &unk_10023EAE8;
  id v12 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", v11));
  [v10 pushAllChangesWithCompletionHandler:v9];
}

- (void)libraryManager:(id)a3 downloadDidStartForResourceTransferTask:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Download for %@ dis start. Notifying %@",  buf,  0x16u);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10002071C;
  v10[3] = &unk_10023DE80;
  void v10[4] = self;
  id v11 = v5;
  id v12 = (id)objc_claimAutoreleasedReturnValue([v5 taskIdentifier]);
  id v8 = v12;
  id v9 = v5;
  -[CPLDaemonLibraryManager _withVoucherForTaskWithIdentifier:do:]( self,  "_withVoucherForTaskWithIdentifier:do:",  v8,  v10);
}

- (void)libraryManager:(id)a3 downloadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v7 = a5;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_1000169C8();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v7;
      __int16 v18 = 2048;
      double v19 = (float)(a4 * 100.0);
      __int16 v20 = 2112;
      id v21 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Download for %@ did progress to %.0f%%. Notifying %@",  buf,  0x20u);
    }
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000209E4;
  v12[3] = &unk_10023ED50;
  v12[4] = self;
  id v13 = v7;
  float v15 = a4;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v7 taskIdentifier]);
  id v10 = v14;
  id v11 = v7;
  -[CPLDaemonLibraryManager _withVoucherForTaskWithIdentifier:do:]( self,  "_withVoucherForTaskWithIdentifier:do:",  v10,  v12);
}

- (void)libraryManager:(id)a3 downloadDidFinishForResourceTransferTask:(id)a4 finalResource:(id)a5 withError:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!_CPLSilentLogging)
  {
    id v12 = sub_1000169C8();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 resource]);
      *(_DWORD *)buf = 138413058;
      id v25 = v9;
      __int16 v26 = 2112;
      __int16 v27 = v14;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      id v31 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "Download for %@ did finish with final resource %@ and error: %@. Notifying %@",  buf,  0x2Au);
    }
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100020D10;
  v19[3] = &unk_10023ED78;
  void v19[4] = self;
  id v20 = v9;
  id v21 = (id)objc_claimAutoreleasedReturnValue([v9 taskIdentifier]);
  id v22 = v10;
  id v23 = v11;
  id v15 = v11;
  id v16 = v10;
  id v17 = v21;
  id v18 = v9;
  -[CPLDaemonLibraryManager _withVoucherForTaskWithIdentifier:do:]( self,  "_withVoucherForTaskWithIdentifier:do:",  v17,  v19);
  -[NSMutableDictionary removeObjectForKey:](self->_downloadTasksPerIdentifier, "removeObjectForKey:", v17);
  -[CPLDaemonLibraryManager _dropVoucherForTaskWithIdentifier:](self, "_dropVoucherForTaskWithIdentifier:", v17);
}

- (void)libraryManager:(id)a3 inMemoryDownloadDidFinishForResourceTransferTask:(id)a4 data:(id)a5 withError:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!_CPLSilentLogging)
  {
    id v12 = sub_1000169C8();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      id v24 = v9;
      __int16 v25 = 2048;
      id v26 = [v10 length];
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      __int16 v30 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "In-memory download for %@ did finish with %lu bytes and error: %@. Notifying %@",  buf,  0x2Au);
    }
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10002105C;
  v18[3] = &unk_10023ED78;
  void v18[4] = self;
  id v19 = v9;
  id v20 = (id)objc_claimAutoreleasedReturnValue([v9 taskIdentifier]);
  id v21 = v10;
  id v22 = v11;
  id v14 = v11;
  id v15 = v10;
  id v16 = v20;
  id v17 = v9;
  -[CPLDaemonLibraryManager _withVoucherForTaskWithIdentifier:do:]( self,  "_withVoucherForTaskWithIdentifier:do:",  v16,  v18);
  -[NSMutableDictionary removeObjectForKey:](self->_downloadTasksPerIdentifier, "removeObjectForKey:", v16);
  -[CPLDaemonLibraryManager _dropVoucherForTaskWithIdentifier:](self, "_dropVoucherForTaskWithIdentifier:", v16);
}

- (void)libraryManager:(id)a3 backgroundDownloadDidFinishForResource:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Background download for %@ did finish",  buf,  0xCu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100021304;
  v10[3] = &unk_10023E430;
  id v11 = v5;
  id v8 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", v10));
  [v9 backgroundDownloadDidFinishForResource:v8];
}

- (void)libraryManager:(id)a3 backgroundDownloadDidFailForResource:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Background download for %@ did fail", buf, 0xCu);
    }
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000214DC;
  v10[3] = &unk_10023E430;
  id v11 = v5;
  id v8 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", v10));
  [v9 backgroundDownloadDidFailForResource:v8];
}

- (void)_storeUploadTransferTask:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 taskIdentifier]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_uploadTasksPerIdentifier, "objectForKey:", v4));

  if (!v5) {
    -[NSMutableDictionary setObject:forKey:](self->_uploadTasksPerIdentifier, "setObject:forKey:", v6, v4);
  }
}

- (void)libraryManager:(id)a3 uploadDidStartForResourceTransferTask:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_1000169C8();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 resource]);
      *(_DWORD *)buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Upload for %@ did start", buf, 0xCu);
    }
  }

  -[CPLDaemonLibraryManager _storeUploadTransferTask:](self, "_storeUploadTransferTask:", v5);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100021778;
  v13[3] = &unk_10023E430;
  id v14 = v5;
  id v9 = v5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", v13));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 resource]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 taskIdentifier]);
  [v10 uploadDidStartForResource:v11 withResourceTransferTask:v12];
}

- (void)libraryManager:(id)a3 uploadDidFinishForResourceTransferTask:(id)a4 withError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (!_CPLSilentLogging)
  {
    id v9 = sub_1000169C8();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 resource]);
      *(_DWORD *)buf = 138412546;
      id v22 = v11;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "Upload for %@ did finish with error %@",  buf,  0x16u);
    }
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000219FC;
  v19[3] = &unk_10023E430;
  id v20 = v7;
  id v12 = v7;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", v19));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 resource]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 taskIdentifier]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 cplSafeErrorForXPC]);
  [v13 uploadOfResource:v14 didFinishForResourceTransferTask:v15 withError:v16];

  uploadTasksPerIdentifier = self->_uploadTasksPerIdentifier;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 taskIdentifier]);
  -[NSMutableDictionary removeObjectForKey:](uploadTasksPerIdentifier, "removeObjectForKey:", v18);
}

- (void)libraryManager:(id)a3 uploadDidProgress:(float)a4 forResourceTransferTask:(id)a5
{
  id v7 = a5;
  if (!_CPLSilentLogging)
  {
    id v8 = sub_1000169C8();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 resource]);
      *(_DWORD *)buf = 138412546;
      id v19 = v10;
      __int16 v20 = 2048;
      double v21 = (float)(a4 * 100.0);
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Upload for %@ did progress to %.0f%%",  buf,  0x16u);
    }
  }

  -[CPLDaemonLibraryManager _storeUploadTransferTask:](self, "_storeUploadTransferTask:", v7);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_100021C50;
  v16[3] = &unk_10023E430;
  id v17 = v7;
  id v11 = v7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", v16));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 resource]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 taskIdentifier]);
  *(float *)&double v15 = a4;
  [v12 uploadOfResource:v13 didProgress:v14 forResourceTransferTask:v15];
}

- (void)sizeOfResourcesToUploadDidChangeForLibraryManager:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sizeOfResourcesToUpload];
  id v6 = [v4 sizeOfOriginalResourcesToUpload];
  id v7 = [v4 numberOfImagesToUpload];
  id v8 = [v4 numberOfVideosToUpload];
  id v9 = [v4 numberOfOtherItemsToUpload];

  if (!_CPLSilentLogging)
  {
    id v10 = sub_1000169C8();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 134217984;
      id v14 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Size of resources to upload did change to %llu",  (uint8_t *)&v13,  0xCu);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDaemonLibraryManager _clientWithErrorHandler:](self, "_clientWithErrorHandler:", &stru_10023ED98));
  [v12 libraryManagerDidUpdateSizeOfResourcesToUploadToSize:v5 sizeOfOriginalResourcesToUpload:v6 numberOfImages:v7 numberOfVideos:v8 n umberOfOtherItems:v9];
}

- (BOOL)isLibraryManager:(id)a3
{
  return self->_isLibraryManager;
}

- (BOOL)isManagementLibraryManager:(id)a3
{
  return self->_isManagement;
}

- (void)libraryManager:(id)a3 didFinishForceSyncTask:(id)a4 withErrors:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (NSMutableDictionary *)a5;
  if (!_CPLSilentLogging)
  {
    id v11 = sub_1000169C8();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifiers]);
      *(_DWORD *)buf = 138413058;
      id v27 = v9;
      __int16 v28 = 2112;
      __int16 v29 = v13;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      __int16 v33 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Force sync %@ for %@ did finish with errors: %@. Notifying %@",  buf,  0x2Au);
    }
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 taskIdentifier]);
  if (-[NSMutableDictionary count](v10, "count"))
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100022118;
    v24[3] = &unk_10023EDC0;
    double v15 =  -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableDictionary count](v10, "count"));
    __int16 v25 = v15;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v10, "enumerateKeysAndObjectsUsingBlock:", v24);
    id v16 = v15;

    id v10 = v16;
  }

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100022178;
  v20[3] = &unk_10023EDE8;
  void v20[4] = self;
  id v21 = v9;
  id v22 = v14;
  __int16 v23 = v10;
  id v17 = v10;
  id v18 = v14;
  id v19 = v9;
  -[CPLDaemonLibraryManager _withVoucherForTaskWithIdentifier:do:]( self,  "_withVoucherForTaskWithIdentifier:do:",  v18,  v20);
  -[NSMutableDictionary removeObjectForKey:](self->_forceSyncTasksPerIdentifier, "removeObjectForKey:", v18);
  -[CPLDaemonLibraryManager _dropVoucherForTaskWithIdentifier:](self, "_dropVoucherForTaskWithIdentifier:", v18);
}

- (void)libraryManager:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1LL));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  void v16[2] = sub_1000223B8;
  v16[3] = &unk_10023EE10;
  void v16[4] = self;
  id v17 = v9;
  id v18 = v10;
  id v19 = v11;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  [v15 performAsCurrentWithPendingUnitCount:1 usingBlock:v16];
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000169C8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v10 userInfo]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:_NSXPCConnectionInvocationReplyToSelectorKey]);
        int v24 = 138412546;
        __int16 v25 = self;
        __int16 v26 = 2112;
        id v27 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "%@ is replying to %@",  (uint8_t *)&v24,  0x16u);
      }
    }

- (void)_withVoucherForTaskWithIdentifier:(id)a3 do:(id)a4
{
  id v9 = (void (**)(void))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_vouchersPerTaskIdentifier,  "objectForKeyedSubscript:",  a3));
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = voucher_adopt(v6);
    v9[2]();
  }

  else
  {
    v9[2]();
  }
}

- (void)_storeVoucher:(id)a3 forTaskWithIdentifier:(id)a4
{
  if (a3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_vouchersPerTaskIdentifier,  "setObject:forKeyedSubscript:",  a3,  a4);
  }
}

- (void)_dropVoucherForTaskWithIdentifier:(id)a3
{
}

- (id)displayableNameForLibraryManager:(id)a3
{
  return self->_name;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isLibraryManager
{
  return self->_isLibraryManager;
}

- (BOOL)isManagement
{
  return self->_isManagement;
}

- (CPLEngineWrapper)engineWrapper
{
  return self->_engineWrapper;
}

- (CPLDaemonLibraryManagerDelegate)delegate
{
  return (CPLDaemonLibraryManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end