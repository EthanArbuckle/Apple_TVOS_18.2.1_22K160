@interface CPLDirectLibraryManager
- (BOOL)_isManagementLibraryManager;
- (BOOL)_isValidScopeForClient:(id)a3 error:(id *)a4;
- (BOOL)_resetStore:(id)a3 reason:(id)a4 resetSelector:(SEL)a5 error:(id *)a6;
- (BOOL)isLibraryManagerForEngineLibrary:(id)a3;
- (CPLDirectLibraryManager)initWithAbstractObject:(id)a3;
- (CPLEngineLibrary)engineLibrary;
- (NSString)description;
- (OS_dispatch_queue)clientQueue;
- (id)_cloudResourcesToLocalResourcesWithLocalResources:(id)a3 targetMapping:(id)a4;
- (id)_localResourceFromCloudResources:(id)a3 usingMapping:(id)a4;
- (id)_localResourceFromCloudResourcesAndErrors:(id)a3 usingMapping:(id)a4;
- (id)configureEngineBeforeOpeningBlock;
- (id)displayableNameForEngineLibrary:(id)a3;
- (id)ownerNameForEngineLibrary:(id)a3;
- (id)safeResourcesToDeleteFromProposedResources:(id)a3 realPrune:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 allowUnconfirmed:(BOOL)a6 resourcesToCheckOnServer:(id *)a7 targetScopeMapping:(id)a8 unsafeResources:(id)a9;
- (void)_cleanupComputeStateDownloadQueue;
- (void)_deleteResources:(id)a3 dryRun:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 completionHandler:(id)a6;
- (void)_dispatchForceSyncForScopeIdentifiers:(id)a3 errors:(id)a4 completionHandler:(id)a5;
- (void)_endComputeStateDownload;
- (void)_fetchExistingSharedLibraryScopeWithProgress:(id)a3 blocker:(id)a4 completionHandler:(id)a5;
- (void)_fetchTransportScopeForScope:(id)a3 transportGroup:(id)a4 progress:(id)a5 completionHandler:(id)a6;
- (void)_startComputeStateDownload;
- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4;
- (void)acknowledgeChangedStatuses:(id)a3;
- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)addInfoToLog:(id)a3;
- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4;
- (void)attachComputeStates:(id)a3 completionHandler:(id)a4;
- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7;
- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5;
- (void)blockEngineElement:(id)a3;
- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3;
- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)checkServerForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (void)closeWithCompletionHandler:(id)a3;
- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5;
- (void)compactFileCacheWithCompletionHandler:(id)a3;
- (void)createScope:(id)a3 completionHandler:(id)a4;
- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)deactivateWithCompletionHandler:(id)a3;
- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5;
- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5;
- (void)disableMainScopeWithCompletionHandler:(id)a3;
- (void)disableMingling;
- (void)disableSynchronizationWithReason:(id)a3;
- (void)enableMainScopeWithCompletionHandler:(id)a3;
- (void)enableMingling;
- (void)enableSynchronizationWithReason:(id)a3;
- (void)engineLibrary:(id)a3 didCloseWithError:(id)a4;
- (void)engineLibrary:(id)a3 didDownloadResourceInBackground:(id)a4;
- (void)engineLibrary:(id)a3 didFailBackgroundDownloadOfResource:(id)a4;
- (void)engineLibrary:(id)a3 didStartUploadTask:(id)a4;
- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 noteClientIsInForeground:(BOOL)a4;
- (void)engineLibrary:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6;
- (void)engineLibrary:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6;
- (void)engineLibrary:(id)a3 pushAllChangesWithCompletionHandler:(id)a4;
- (void)engineLibrary:(id)a3 sizeOfResourcesToUploadDidChangeToSize:(unint64_t)a4 sizeOfOriginalResourcesToUpload:(unint64_t)a5 numberOfImages:(unint64_t)a6 numberOfVideos:(unint64_t)a7 numberOfOtherItems:(unint64_t)a8;
- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didFinishWithError:(id)a5;
- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didProgress:(float)a5;
- (void)engineLibraryHasChangesInPullQueue:(id)a3;
- (void)engineLibraryHasStatusChanges:(id)a3;
- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7;
- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3;
- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4;
- (void)forceBackupWithCompletionHandler:(id)a3;
- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4;
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
- (void)markLibraryManagerAsInvalid;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForegroundQuietly:(BOOL)a3;
- (void)noteClientReceivedNotificationOfServerChanges;
- (void)openWithCompletionHandler:(id)a3;
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
- (void)setClientQueue:(id)a3;
- (void)setConfigureEngineBeforeOpeningBlock:(id)a3;
- (void)setEngineLibrary:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3;
- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6;
- (void)startSyncSession;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)unblockEngineElement:(id)a3;
- (void)unblockEngineElementOnce:(id)a3;
- (void)updateShareForScope:(id)a3 completionHandler:(id)a4;
@end

@implementation CPLDirectLibraryManager

- (CPLDirectLibraryManager)initWithAbstractObject:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLDirectLibraryManager;
  v3 = -[CPLDirectLibraryManager initWithAbstractObject:](&v14, "initWithAbstractObject:", a3);
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = CPLCopyDefaultSerialQueueAttributes(v3);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.cpl.librarymanager.direct.client", v6);
    clientQueue = v4->_clientQueue;
    v4->_clientQueue = (OS_dispatch_queue *)v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    disablingReasons = v4->_disablingReasons;
    v4->_disablingReasons = v9;

    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    currentComputeStateDownloadTasks = v4->_currentComputeStateDownloadTasks;
    v4->_currentComputeStateDownloadTasks = v11;
  }

  return v4;
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientLibraryBaseURL]);
  if (v6)
  {
    dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudLibraryStateStorageURL]);
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudLibraryResourceStorageURL]);
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue([v5 libraryIdentifier]);
        BOOL v10 = v9 != 0LL;
      }

      else
      {
        BOOL v10 = 0;
      }
    }

    else
    {
      BOOL v10 = 0;
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_10011CCBC;
  v37[3] = &unk_100241620;
  v37[4] = self;
  BOOL v39 = v10;
  id v11 = v4;
  id v38 = v11;
  v12 = objc_retainBlock(v37);
  v13 = v12;
  if (self->_engineLibrary)
  {
    ((void (*)(void *))v12[2])(v12);
  }

  else if (v10)
  {
    self->_ownsLibrary = 1;
    v28 = objc_alloc(&OBJC_CLASS___CPLEngineLibrary);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v31 clientLibraryBaseURL]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    v32 = (void *)objc_claimAutoreleasedReturnValue([v30 cloudLibraryStateStorageURL]);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue([v29 cloudLibraryResourceStorageURL]);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v27 libraryIdentifier]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 mainScopeIdentifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    v19 = -[CPLEngineLibrary initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:mainScopeIdentifier:options:]( v28,  "initWithClientLibraryBaseURL:cloudLibraryStateStorageURL:cloudLibraryResourceStorageURL:libraryIdentifier:ma inScopeIdentifier:options:",  v33,  v32,  v14,  v15,  v17,  [v18 libraryOptions]);
    engineLibrary = self->_engineLibrary;
    self->_engineLibrary = v19;

    -[CPLEngineLibrary setOwner:](self->_engineLibrary, "setOwner:", self);
    if (!_CPLSilentLogging)
    {
      id v21 = sub_10011CDF4();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = self->_engineLibrary;
        *(_DWORD *)buf = 138412546;
        v41 = self;
        __int16 v42 = 2112;
        v43 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ will own %@", buf, 0x16u);
      }
    }

    configureEngineBeforeOpeningBlock = (void (**)(id, CPLEngineLibrary *))self->_configureEngineBeforeOpeningBlock;
    if (configureEngineBeforeOpeningBlock) {
      configureEngineBeforeOpeningBlock[2](configureEngineBeforeOpeningBlock, self->_engineLibrary);
    }
    v25 = self->_engineLibrary;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10011DB98;
    v34[3] = &unk_1002457D0;
    v34[4] = self;
    id v35 = v13;
    id v36 = v11;
    -[CPLEngineLibrary openWithCompletionHandler:](v25, "openWithCompletionHandler:", v34);
  }

  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectMachineStateErrorWithReason:]( &OBJC_CLASS___CPLErrors,  "incorrectMachineStateErrorWithReason:",  @"Library Manager has no Engine to manage"));
    (*((void (**)(id, void *, void, void, void, void))v11 + 2))(v11, v26, 0LL, 0LL, 0LL, 0LL);
  }
}

- (void)closeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  self->_closing = 1;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
  v6 = v5;
  if (self->_foregroundCalls)
  {
    [v5 noteClientIsInBackground];
    self->_foregroundCallsHaveBeenQuiet = 0;
    self->_foregroundCalls = 0LL;
  }

  if (-[NSCountedSet count](self->_disablingReasons, "count"))
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    dispatch_queue_t v7 = self->_disablingReasons;
    id v8 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 enableSynchronizationWithReason:*(void *)(*((void *)&v25 + 1) + 8 * (void)v11)];
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = -[NSCountedSet countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v25,  v31,  16LL);
      }

      while (v9);
    }

    -[NSCountedSet removeAllObjects](self->_disablingReasons, "removeAllObjects");
  }

  if (self->_significantWorkCalls) {
    self->_significantWorkCalls = 0LL;
  }
  if (self->_disablingMinglingCount)
  {
    [v6 enableMingling];
    self->_disablingMinglingCount = 0LL;
  }

  clientQueue = self->_clientQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10011DFF8;
  v24[3] = &unk_10023DC70;
  v24[4] = self;
  v13 = v24;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v30 = v13;
  objc_super v14 = clientQueue;
  dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v14, v15);

  engineLibrary = self->_engineLibrary;
  if (self->_ownsLibrary)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10011E088;
    v22[3] = &unk_10023E458;
    v17 = &v23;
    v22[4] = self;
    id v23 = v4;
    id v18 = v4;
    -[CPLEngineLibrary closeAndDeactivate:completionHandler:]( engineLibrary,  "closeAndDeactivate:completionHandler:",  0LL,  v22);
  }

  else
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10011E310;
    v20[3] = &unk_10023E458;
    v17 = &v21;
    v20[4] = self;
    id v21 = v4;
    id v19 = v4;
    -[CPLEngineLibrary detachObject:withCompletionHandler:]( engineLibrary,  "detachObject:withCompletionHandler:",  self,  v20);
  }
}

- (void)deactivateWithCompletionHandler:(id)a3
{
  id v4 = a3;
  clientQueue = self->_clientQueue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011E5F8;
  v13[3] = &unk_10023DC70;
  v13[4] = self;
  v6 = v13;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v15 = v6;
  dispatch_queue_t v7 = clientQueue;
  dispatch_block_t v8 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v8);

  engineLibrary = self->_engineLibrary;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10011E66C;
  v11[3] = &unk_10023EAE8;
  id v12 = v4;
  id v10 = v4;
  -[CPLEngineLibrary closeAndDeactivate:completionHandler:]( engineLibrary,  "closeAndDeactivate:completionHandler:",  1LL,  v11);
}

- (BOOL)_isManagementLibraryManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  uint64_t v3 = objc_claimAutoreleasedReturnValue([v2 delegate]);
  id v4 = (void *)v3;
  if (v3 && (objc_opt_respondsToSelector(v3, "isManagementLibraryManager:") & 1) != 0) {
    unsigned __int8 v5 = [v4 isManagementLibraryManager:v2];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)enableMainScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011E878;
  v8[3] = &unk_100245848;
  id v9 = v5;
  id v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 blockWriteTransactionsWithCompletionHandler:v8];
}

- (void)disableMainScopeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10011EBF8;
  v8[3] = &unk_100245848;
  id v9 = v5;
  id v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  [v7 blockWriteTransactionsWithCompletionHandler:v8];
}

- (void)activateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mainScopeIdentifier]);
  unsigned int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    -[CPLDirectLibraryManager enableMainScopeWithCompletionHandler:](self, "enableMainScopeWithCompletionHandler:", v7);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10011EFE4;
    v13[3] = &unk_100245898;
    id v14 = v11;
    id v15 = v6;
    v16 = self;
    id v17 = v7;
    id v12 = v11;
    [v12 blockWriteTransactionsWithCompletionHandler:v13];
  }
}

- (void)deactivateScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 mainScopeIdentifier]);
  unsigned int v10 = [v6 isEqualToString:v9];

  if (v10)
  {
    -[CPLDirectLibraryManager disableMainScopeWithCompletionHandler:]( self,  "disableMainScopeWithCompletionHandler:",  v7);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10011F5F4;
    v13[3] = &unk_100245898;
    id v14 = v11;
    id v15 = v6;
    v16 = self;
    id v17 = v7;
    id v12 = v11;
    [v12 blockWriteTransactionsWithCompletionHandler:v13];
  }
}

- (void)boostPriorityForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_block_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v14 = v7;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10011FBC4;
  v15[3] = &unk_10023E318;
  id v16 = (id)objc_claimAutoreleasedReturnValue([v8 scopes]);
  id v17 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10011FD04;
  v13[3] = &unk_100245910;
  id v9 = v7;
  id v10 = v6;
  id v11 = v16;
  id v12 = [v8 performWriteTransactionWithBlock:v15 completionHandler:v13];
}

- (void)beginDownloadForResource:(id)a3 clientBundleID:(id)a4 options:(id)a5 proposedTaskIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [a3 copy];
  if (!v13) {
    id v13 = (id)objc_claimAutoreleasedReturnValue( +[CPLResourceTransferTaskOptions defaultOptions]( &OBJC_CLASS___CPLResourceTransferTaskOptions,  "defaultOptions"));
  }
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10011FEF8;
  v26[3] = &unk_1002459D8;
  v26[4] = self;
  id v18 = v17;
  id v27 = v18;
  id v28 = v16;
  id v29 = v12;
  id v19 = v13;
  id v30 = v19;
  id v31 = v14;
  id v32 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v12;
  id v23 = v16;
  v24 = objc_retainBlock(v26);
  else {
    [v18 performBatchedWriteTransactionWithBlock:v24 completionHandler:&stru_100245A38];
  }
}

- (void)getStreamingURLForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v15 = a3;
  id v42 = a5;
  id v16 = a7;
  id v17 = a8;
  if (a4 - 2 <= 2)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v19 = v15;
    id v20 = v16;
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v18 systemMonitor]);
    unsigned int v22 = [v21 isNetworkConstrained];

    id v16 = v20;
    id v15 = v19;

    if (v22)
    {
      clientQueue = self->_clientQueue;
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472LL;
      v57[2] = sub_100120BA0;
      v57[3] = &unk_10023DBC8;
      id v58 = v17;
      v24 = v57;
      block = _NSConcreteStackBlock;
      uint64_t v60 = 3221225472LL;
      v61 = sub_10013AA68;
      v62 = &unk_10023DBC8;
      id v63 = v24;
      id v25 = clientQueue;
      dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
      dispatch_async(v25, v26);

      id v27 = v58;
LABEL_7:
      v33 = v42;
      goto LABEL_8;
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v15 itemScopedIdentifier]);

  if (!v28)
  {
    id v38 = self->_clientQueue;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100121374;
    v43[3] = &unk_10023DBC8;
    id v44 = v17;
    BOOL v39 = v43;
    block = _NSConcreteStackBlock;
    uint64_t v60 = 3221225472LL;
    v61 = sub_10013AA68;
    v62 = &unk_10023DBC8;
    id v63 = v39;
    v40 = v38;
    dispatch_block_t v41 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v40, v41);

    id v27 = v44;
    goto LABEL_7;
  }

  id v29 = (void *)objc_opt_class(self);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
  block = _NSConcreteStackBlock;
  uint64_t v60 = 3221225472LL;
  v61 = sub_10013AA9C;
  v62 = &unk_100246D40;
  id v63 = v29;
  SEL v64 = a2;
  [v30 setCancellationHandler:&block];
  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 downloadQueue]);
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100120C08;
  v45[3] = &unk_100245AB0;
  v45[4] = self;
  id v52 = v17;
  id v46 = v30;
  id v47 = v15;
  id v48 = v31;
  id v49 = v32;
  unint64_t v53 = a4;
  v33 = v42;
  id v50 = v42;
  __int128 v34 = *(_OWORD *)&a6->var0.var3;
  __int128 v54 = *(_OWORD *)&a6->var0.var0;
  __int128 v55 = v34;
  __int128 v56 = *(_OWORD *)&a6->var1.var1;
  id v51 = v16;
  id v35 = v32;
  id v36 = v31;
  id v27 = v30;
  id v37 = [v36 performReadTransactionWithBlock:v45];

LABEL_8:
}

- (void)rampingRequestForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v9 = a5;
  id v10 = (void *)objc_opt_class(self);
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
  block = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  id v25 = sub_10013AA9C;
  dispatch_block_t v26 = &unk_100246D40;
  id v27 = v10;
  SEL v28 = a2;
  [v11 setCancellationHandler:&block];
  clientQueue = self->_clientQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100121544;
  v18[3] = &unk_100245B28;
  unint64_t v21 = a3;
  unint64_t v22 = a4;
  id v19 = v11;
  id v20 = v9;
  v18[4] = self;
  id v13 = v18;
  block = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472LL;
  id v25 = sub_10013AA68;
  dispatch_block_t v26 = &unk_10023DBC8;
  id v27 = v13;
  id v14 = clientQueue;
  id v15 = v11;
  id v16 = v9;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v14, v17);
}

- (void)beginInMemoryDownloadOfResource:(id)a3 clientBundleID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100121A40;
  v18[3] = &unk_100245C68;
  v18[4] = self;
  id v19 = v8;
  id v20 = v11;
  id v21 = (id)objc_claimAutoreleasedReturnValue([v11 downloadQueue]);
  id v22 = v9;
  id v23 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v21;
  id v15 = v11;
  id v16 = v8;
  id v17 = [v15 performReadTransactionWithBlock:v18];
}

- (void)resolveLocalScopedIdentifiersForCloudScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100122624;
  v17[3] = &unk_100245870;
  id v18 = v6;
  id v19 = (id)objc_claimAutoreleasedReturnValue([v8 idMapping]);
  id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001227DC;
  v14[3] = &unk_100245CB8;
  id v15 = v20;
  id v16 = v7;
  id v9 = v20;
  id v10 = v7;
  id v11 = v19;
  id v12 = v6;
  id v13 = [v8 performWriteTransactionWithBlock:v17 completionHandler:v14];
}

- (void)getMappedScopedIdentifiersForScopedIdentifiers:(id)a3 inAreLocalIdentifiers:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100122964;
  v15[3] = &unk_100245CE0;
  id v17 = (id)objc_claimAutoreleasedReturnValue([v10 idMapping]);
  id v18 = v9;
  BOOL v19 = a4;
  id v16 = v8;
  id v11 = v17;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v10 performReadTransactionWithBlock:v15];
}

- (void)createScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!CPLIsInTestReadonlyMode())
  {
    if ([v7 scopeType] == (id)4 && (CPLIsSharedLibraryFeatureEnabled() & 1) == 0)
    {
      id v13 = @"Shared Library is not enabled on this device";
    }

    else
    {
      if ([v7 scopeType] != (id)2
        || (+[CPLFingerprintScheme supportsEPP](&OBJC_CLASS___CPLFingerprintScheme, "supportsEPP") & 1) != 0
        || ![v7 hasEPPAssets])
      {
        id v14 = (void *)objc_opt_class(self);
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
        block = _NSConcreteStackBlock;
        uint64_t v31 = 3221225472LL;
        id v32 = sub_10013AA9C;
        v33 = &unk_100246D40;
        id v34 = v14;
        SEL v35 = a2;
        [v15 setCancellationHandler:&block];
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 store]);

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100122E24;
        v21[3] = &unk_100245E70;
        id v26 = v8;
        id v22 = v15;
        id v23 = self;
        SEL v27 = a2;
        id v24 = v7;
        id v25 = v17;
        id v18 = v17;
        id v19 = v15;
        [v18 blockWriteTransactionsWithCompletionHandler:v21];

        goto LABEL_12;
      }

      id v13 = @"EPP CMM is not enabled on this device";
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  1002LL,  v13));
    (*((void (**)(id, void, void *))v8 + 2))(v8, 0LL, v20);

    goto LABEL_12;
  }

  clientQueue = self->_clientQueue;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100122DC0;
  v28[3] = &unk_10023DBC8;
  id v29 = v8;
  id v10 = v28;
  block = _NSConcreteStackBlock;
  uint64_t v31 = 3221225472LL;
  id v32 = sub_10013AA68;
  v33 = &unk_10023DBC8;
  id v34 = v10;
  id v11 = clientQueue;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v12);

LABEL_12:
}

- (void)updateShareForScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_100123E7C;
    v28[3] = &unk_10023DBC8;
    id v29 = v8;
    id v10 = v28;
    block = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    id v32 = sub_10013AA68;
    v33 = &unk_10023DBC8;
    id v34 = v10;
    id v11 = v8;
    dispatch_block_t v12 = clientQueue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

    id v14 = v29;
  }

  else
  {
    id v15 = (void *)objc_opt_class(self);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    block = _NSConcreteStackBlock;
    uint64_t v31 = 3221225472LL;
    id v32 = sub_10013AA9C;
    v33 = &unk_100246D40;
    id v34 = v15;
    SEL v35 = a2;
    [v16 setCancellationHandler:&block];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 store]);

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100123EE0;
    v21[3] = &unk_100245E70;
    id v26 = v8;
    id v22 = v16;
    id v23 = v18;
    id v24 = v7;
    id v25 = self;
    SEL v27 = a2;
    id v19 = v18;
    id v14 = v16;
    id v20 = v8;
    [v19 blockWriteTransactionsWithCompletionHandler:v21];
  }
}

- (void)deleteScopeWithIdentifier:(id)a3 forced:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100124D98;
    v27[3] = &unk_10023DBC8;
    id v28 = v9;
    id v11 = v27;
    block = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    uint64_t v31 = sub_10013AA68;
    id v32 = &unk_10023DBC8;
    id v33 = v11;
    id v12 = v9;
    dispatch_block_t v13 = clientQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v13, v14);

    id v15 = v28;
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    id v17 = self->_clientQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100124DF8;
    v22[3] = &unk_100245F88;
    v22[4] = self;
    id v25 = v9;
    BOOL v26 = a4;
    id v23 = v8;
    id v24 = v16;
    id v18 = v22;
    block = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472LL;
    uint64_t v31 = sub_10013AA68;
    id v32 = &unk_10023DBC8;
    id v33 = v18;
    id v19 = v17;
    id v15 = v16;
    id v20 = v9;
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v19, v21);
  }
}

- (void)_fetchTransportScopeForScope:(id)a3 transportGroup:(id)a4 progress:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  dispatch_block_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 transport]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10012579C;
  v21[3] = &unk_100245FB0;
  id v22 = v10;
  id v16 = v10;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 fetchTransportScopeForScope:v13 transportScope:0 completionHandler:v21]);

  [v17 setTransportGroup:v12];
  [v17 setShouldCreateScopeIfNecessary:0];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1001257AC;
  v19[3] = &unk_10023DDE8;
  v19[4] = self;
  id v20 = v17;
  id v18 = v17;
  [v11 performAsCurrentWithPendingUnitCount:1 usingBlock:v19];
}

- (void)refreshScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100125A24;
    v29[3] = &unk_10023DBC8;
    id v30 = v8;
    id v10 = v29;
    block = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    id v33 = sub_10013AA68;
    id v34 = &unk_10023DBC8;
    id v35 = v10;
    id v11 = v8;
    id v12 = clientQueue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

    id v14 = v30;
  }

  else
  {
    id v15 = (void *)objc_opt_class(self);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    block = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    id v33 = sub_10013AA9C;
    id v34 = &unk_100246D40;
    id v35 = v15;
    SEL v36 = a2;
    [v16 setCancellationHandler:&block];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 store]);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100125A88;
    v22[3] = &unk_100246108;
    id v27 = v8;
    id v23 = v16;
    id v24 = v18;
    id v25 = v7;
    BOOL v26 = self;
    SEL v28 = a2;
    id v20 = v18;
    id v14 = v16;
    id v21 = v8;
    [v19 blockEngineWithReason:@"Refreshing scope" onlyIfBlocked:0 block:v22];
  }
}

- (BOOL)_isValidScopeForClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  unsigned __int8 v8 = [v7 libraryOptions];

  if ((v8 & 2) != 0
    || (id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary")),
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 store]),
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]),
        unsigned __int8 v12 = [v10 mainScopeSupportsSharingScopeWithIdentifier:v11],
        v11,
        v10,
        v9,
        (v12 & 1) != 0))
  {
LABEL_4:
    BOOL v13 = 1;
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v6 scopeIdentifier]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  2001LL,  @"%@ is not a valid scope for this engine",  v15));

    if (a4) {
      *a4 = v16;
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (void)fetchSharedScopeFromShareURL:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10012709C;
    v26[3] = &unk_10023DBC8;
    id v27 = v8;
    id v10 = v26;
    block = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    id v30 = sub_10013AA68;
    uint64_t v31 = &unk_10023DBC8;
    id v32 = v10;
    id v11 = v8;
    unsigned __int8 v12 = clientQueue;
    dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v12, v13);

    id v14 = v27;
  }

  else
  {
    id v15 = (void *)objc_opt_class(self);
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    block = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    id v30 = sub_10013AA9C;
    uint64_t v31 = &unk_100246D40;
    id v32 = v15;
    SEL v33 = a2;
    [v16 setCancellationHandler:&block];
    id v17 = self->_clientQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100127100;
    v22[3] = &unk_10023EE10;
    id v25 = v8;
    void v22[4] = self;
    id v23 = v16;
    id v24 = v7;
    id v18 = v22;
    block = _NSConcreteStackBlock;
    uint64_t v29 = 3221225472LL;
    id v30 = sub_10013AA68;
    uint64_t v31 = &unk_10023DBC8;
    id v32 = v18;
    id v19 = v17;
    id v14 = v16;
    id v20 = v8;
    dispatch_block_t v21 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v19, v21);
  }
}

- (void)acceptSharedScope:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!CPLIsInTestReadonlyMode())
  {
    if ([v7 scopeType] == (id)5 && (CPLIsSharedLibraryFeatureEnabled() & 1) == 0)
    {
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  1002LL,  @"Shared Library is not enabled on this device"));
    }

    else
    {
      id v26 = 0LL;
      unsigned __int8 v13 = -[CPLDirectLibraryManager _isValidScopeForClient:error:](self, "_isValidScopeForClient:error:", v7, &v26);
      id v14 = v26;
      if ((v13 & 1) != 0)
      {
        id v15 = (void *)objc_opt_class(self);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
        block = _NSConcreteStackBlock;
        uint64_t v30 = 3221225472LL;
        uint64_t v31 = sub_10013AA9C;
        id v32 = &unk_100246D40;
        id v33 = v15;
        SEL v34 = a2;
        [v16 setCancellationHandler:&block];
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 store]);

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472LL;
        v21[2] = sub_100127D30;
        v21[3] = &unk_1002462C0;
        void v21[4] = self;
        id v25 = v8;
        id v22 = v16;
        id v23 = v7;
        id v24 = v18;
        id v19 = v18;
        id v20 = v16;
        [v19 blockWriteTransactionsWithCompletionHandler:v21];

LABEL_9:
        goto LABEL_10;
      }
    }

    (*((void (**)(id, id))v8 + 2))(v8, v14);
    goto LABEL_9;
  }

  clientQueue = self->_clientQueue;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100127CD0;
  v27[3] = &unk_10023DBC8;
  id v28 = v8;
  id v10 = v27;
  block = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472LL;
  uint64_t v31 = sub_10013AA68;
  id v32 = &unk_10023DBC8;
  id v33 = v10;
  id v11 = clientQueue;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v11, v12);

LABEL_10:
}

- (void)_fetchExistingSharedLibraryScopeWithProgress:(id)a3 blocker:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  dispatch_block_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 transport]);

  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 store]);

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100128A88;
  v21[3] = &unk_1002462E8;
  id v22 = v14;
  id v23 = v8;
  id v24 = v9;
  id v15 = v9;
  id v16 = v8;
  id v17 = v14;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100128F60;
  v19[3] = &unk_10023DDE8;
  v19[4] = self;
  id v20 = (id)objc_claimAutoreleasedReturnValue([v12 fetchExistingSharedLibraryScopeTaskWithCompletionHandler:v21]);
  id v18 = v20;
  [v10 performAsCurrentWithPendingUnitCount:1 usingBlock:v19];
}

- (void)fetchExistingSharedLibraryScopeWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100129184;
    v22[3] = &unk_10023DBC8;
    id v23 = v5;
    id v7 = v22;
    block = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    id v26 = sub_10013AA68;
    id v27 = &unk_10023DBC8;
    id v28 = v7;
    id v8 = v5;
    id v9 = clientQueue;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v9, v10);

    id v11 = v23;
  }

  else
  {
    dispatch_block_t v12 = (void *)objc_opt_class(self);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    block = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    id v26 = sub_10013AA9C;
    id v27 = &unk_100246D40;
    id v28 = v12;
    SEL v29 = a2;
    [v13 setCancellationHandler:&block];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 store]);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1001291E8;
    v18[3] = &unk_100246360;
    v18[4] = self;
    id v19 = v13;
    id v20 = v15;
    id v21 = v5;
    id v16 = v15;
    id v11 = v13;
    id v17 = v5;
    [v16 blockWriteTransactionsWithCompletionHandler:v18];
  }
}

- (void)startExitFromSharedScopeWithIdentifier:(id)a3 retentionPolicy:(int64_t)a4 exitSource:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100129ABC;
    v30[3] = &unk_10023DBC8;
    id v31 = v11;
    unsigned __int8 v13 = v30;
    block = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472LL;
    SEL v34 = sub_10013AA68;
    id v35 = &unk_10023DBC8;
    id v36 = v13;
    id v14 = v11;
    id v15 = clientQueue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v15, v16);

    id v17 = v31;
  }

  else
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    id v19 = self->_clientQueue;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100129B20;
    v24[3] = &unk_100246478;
    v24[4] = self;
    id v27 = v11;
    int64_t v28 = a4;
    int64_t v29 = a5;
    id v25 = v10;
    id v26 = v18;
    id v20 = v24;
    block = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472LL;
    SEL v34 = sub_10013AA68;
    id v35 = &unk_10023DBC8;
    id v36 = v20;
    id v21 = v19;
    id v17 = v18;
    id v22 = v11;
    dispatch_block_t v23 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v21, v23);
  }
}

- (void)removeParticipants:(id)a3 fromSharedScopeWithIdentifier:(id)a4 retentionPolicy:(int64_t)a5 exitSource:(int64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (CPLIsInTestReadonlyMode())
  {
    clientQueue = self->_clientQueue;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10012AAA0;
    v34[3] = &unk_10023DBC8;
    id v35 = v14;
    dispatch_block_t v16 = v34;
    block = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472LL;
    id v38 = sub_10013AA68;
    BOOL v39 = &unk_10023DBC8;
    id v40 = v16;
    id v17 = v14;
    id v18 = clientQueue;
    dispatch_block_t v19 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v18, v19);

    id v20 = v35;
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    id v22 = self->_clientQueue;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10012AB04;
    v27[3] = &unk_100246540;
    void v27[4] = self;
    id v31 = v14;
    id v28 = v13;
    int64_t v32 = a5;
    int64_t v33 = a6;
    id v29 = v12;
    id v30 = v21;
    dispatch_block_t v23 = v27;
    block = _NSConcreteStackBlock;
    uint64_t v37 = 3221225472LL;
    id v38 = sub_10013AA68;
    BOOL v39 = &unk_10023DBC8;
    id v40 = v23;
    id v24 = v22;
    id v20 = v21;
    id v25 = v14;
    dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v24, v26);
  }
}

- (void)getStatusForPendingRecordsSharedToScopeWithIdentifier:(id)a3 maximumCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (a4 < 0x1F5)
  {
    dispatch_block_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 store]);

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10012C69C;
    v19[3] = &unk_100246568;
    id v23 = v10;
    id v20 = v17;
    id v21 = v8;
    id v22 = self;
    unint64_t v24 = a4;
    id v15 = v17;
    id v18 = [v15 performReadTransactionWithBlock:v19];
  }

  else
  {
    clientQueue = self->_clientQueue;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10012C644;
    v25[3] = &unk_10023DBC8;
    id v26 = v9;
    id v12 = v25;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013AA68;
    block[3] = &unk_10023DBC8;
    id v28 = v12;
    id v13 = clientQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v13, v14);

    id v15 = v26;
  }
}

- (void)sharedLibraryRampCheckWithCompletionHandler:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_opt_class(self);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 1LL));
  block = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  dispatch_block_t v19 = sub_10013AA9C;
  id v20 = &unk_100246D40;
  id v21 = v6;
  SEL v22 = a2;
  [v7 setCancellationHandler:&block];
  clientQueue = self->_clientQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012CF20;
  v14[3] = &unk_10023E878;
  id v15 = v7;
  id v16 = v5;
  void v14[4] = self;
  id v9 = v14;
  block = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472LL;
  dispatch_block_t v19 = sub_10013AA68;
  id v20 = &unk_10023DBC8;
  id v21 = v9;
  id v10 = clientQueue;
  id v11 = v7;
  id v12 = v5;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v10, v13);
}

- (void)queryUserDetailsForShareParticipants:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)objc_opt_class(self);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
  block = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  unint64_t v24 = sub_10013AA9C;
  id v25 = &unk_100246D40;
  id v26 = v9;
  SEL v27 = a2;
  [v10 setCancellationHandler:&block];
  clientQueue = self->_clientQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10012D368;
  v18[3] = &unk_1002409B8;
  v18[4] = self;
  id v19 = v7;
  id v20 = v10;
  id v21 = v8;
  id v12 = v18;
  block = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472LL;
  unint64_t v24 = sub_10013AA68;
  id v25 = &unk_10023DBC8;
  id v26 = v12;
  dispatch_block_t v13 = clientQueue;
  id v14 = v10;
  id v15 = v8;
  id v16 = v7;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
  dispatch_async(v13, v17);
}

- (void)_dispatchForceSyncForScopeIdentifiers:(id)a3 errors:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  clientQueue = self->_clientQueue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10012D780;
  v18[3] = &unk_10023EE10;
  id v19 = v8;
  id v20 = self;
  id v21 = v9;
  id v22 = v10;
  id v12 = v18;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v24 = v12;
  dispatch_block_t v13 = clientQueue;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  dispatch_block_t v17 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v17);
}

- (void)forceSynchronizingScopeWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10012D930;
  v13[3] = &unk_100246658;
  id v14 = v8;
  id v15 = self;
  id v16 = v6;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  [v9 getCurrentRequiredStateWithCompletionHandler:v13];
}

- (void)resetStatus
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10011CDF4();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      int v7 = 138412290;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@ is not implemented", (uint8_t *)&v7, 0xCu);
    }
  }

- (void)startSyncSession
{
}

- (void)noteClientIsInForegroundQuietly:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t foregroundCalls = self->_foregroundCalls;
  self->_unint64_t foregroundCalls = foregroundCalls + 1;
  if (foregroundCalls)
  {
    if (self->_foregroundCallsHaveBeenQuiet && !a3)
    {
      self->_foregroundCallsHaveBeenQuiet = 0;
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
      [v7 noteClientIsInForegroundQuietly:0];
      [v7 noteClientIsInBackground];
    }
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
    [v6 noteClientIsInForegroundQuietly:v3];

    self->_foregroundCallsHaveBeenQuiet = v3;
  }

- (void)noteClientIsInBackground
{
  unint64_t foregroundCalls = self->_foregroundCalls;
  if (foregroundCalls)
  {
    unint64_t v4 = foregroundCalls - 1;
    self->_unint64_t foregroundCalls = v4;
    if (!v4)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
      [v5 noteClientIsInBackground];

      self->_foregroundCallsHaveBeenQuiet = 0;
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v7 = sub_10011CDF4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = NSStringFromSelector(a2);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      int v11 = 138412290;
      id v12 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%@ called too many times",  (uint8_t *)&v11,  0xCu);
    }
  }

- (void)noteClientReceivedNotificationOfServerChanges
{
  if (!_CPLSilentLogging)
  {
    id v3 = sub_10011CDF4();
    unint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEBUG,  "Received notification of server changes from client",  v6,  2u);
    }
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
  [v5 noteServerHasChanges];
}

- (void)disableSynchronizationWithReason:(id)a3
{
  id v5 = a3;
  -[NSCountedSet addObject:](self->_disablingReasons, "addObject:", v5);
  if ((id)-[NSCountedSet countForObject:](self->_disablingReasons, "countForObject:", v5) == (id)1)
  {
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
    [v4 disableSynchronizationWithReason:v5];
  }
}

- (void)enableSynchronizationWithReason:(id)a3
{
  id v5 = a3;
  if (-[NSCountedSet countForObject:](self->_disablingReasons, "countForObject:", v5))
  {
    -[NSCountedSet removeObject:](self->_disablingReasons, "removeObject:", v5);
    if (!-[NSCountedSet countForObject:](self->_disablingReasons, "countForObject:", v5))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
      [v6 enableSynchronizationWithReason:v5];
LABEL_7:
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v7 = sub_10011CDF4();
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      id v8 = NSStringFromSelector(a2);
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      int v10 = 138412546;
      int v11 = v9;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_ERROR,  "%@ has been called too many times with reason '%@'",  (uint8_t *)&v10,  0x16u);
    }

    goto LABEL_7;
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (!_CPLSilentLogging)
  {
    id v5 = sub_10011CDF4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Getting system budgets", v8, 2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary transport](self->_engineLibrary, "transport"));
  [v7 getSystemBudgetsWithCompletionHandler:v4];
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary systemMonitor](self->_engineLibrary, "systemMonitor"));
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10011CDF4();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v5) {
        id v9 = @"start overriding";
      }
      else {
        id v9 = @"stop overriding";
      }
      id v10 = [(id)objc_opt_class(v6) descriptionForBudgets:a4];
      int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Client asked to %@ system budgets %@",  (uint8_t *)&v12,  0x16u);
    }
  }

  if (v5) {
    [v6 startOverridingSystemBudgetsForClient:a4];
  }
  else {
    [v6 stopOverridingSystemBudgetsForClient:a4];
  }
}

- (void)noteClientIsBeginningSignificantWork
{
}

- (void)noteClientIsEndingSignificantWork
{
  unint64_t significantWorkCalls = self->_significantWorkCalls;
  if (significantWorkCalls)
  {
    self->_unint64_t significantWorkCalls = significantWorkCalls - 1;
  }

  else if (!_CPLSilentLogging)
  {
    id v4 = sub_10011CDF4();
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = NSStringFromSelector(a2);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      int v8 = 138412290;
      id v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@ called too many times", (uint8_t *)&v8, 0xCu);
    }
  }

- (void)disableMingling
{
  unint64_t disablingMinglingCount = self->_disablingMinglingCount;
  if (!disablingMinglingCount)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
    [v4 disableMingling];

    unint64_t disablingMinglingCount = self->_disablingMinglingCount;
  }

  self->_unint64_t disablingMinglingCount = disablingMinglingCount + 1;
}

- (void)enableMingling
{
  unint64_t disablingMinglingCount = self->_disablingMinglingCount;
  if (disablingMinglingCount)
  {
    unint64_t v3 = disablingMinglingCount - 1;
    self->_unint64_t disablingMinglingCount = v3;
    if (!v3)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](self->_engineLibrary, "scheduler"));
      [v9 enableMingling];
    }
  }

  else if (!_CPLSilentLogging)
  {
    id v5 = sub_10011CDF4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromSelector(a2);
      int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      *(_DWORD *)buf = 138412290;
      int v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@ has been called too many times", buf, 0xCu);
    }
  }

- (void)checkHasBackgroundDownloadOperationsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 store]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012EE14;
  v10[3] = &unk_100246248;
  id v11 = v5;
  id v12 = v4;
  id v7 = v4;
  id v8 = v5;
  id v9 = [v6 performReadTransactionWithBlock:v10];
}

- (void)getStatusForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 store]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012EF64;
  v14[3] = &unk_100246680;
  id v15 = v9;
  id v16 = v6;
  id v17 = self;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v9;
  id v13 = [v12 performReadTransactionWithBlock:v14];
}

- (void)getChangedStatusesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 store]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012F154;
  v10[3] = &unk_100245820;
  id v12 = self;
  id v13 = v4;
  id v11 = v6;
  id v7 = v4;
  id v8 = v6;
  id v9 = [v8 performReadTransactionWithBlock:v10];
}

- (void)acknowledgeChangedStatuses:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 store]);

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10012F378;
  v12[3] = &unk_10023E318;
  id v13 = v6;
  id v14 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10012F44C;
  v10[3] = &unk_10023F188;
  id v11 = v14;
  id v7 = v14;
  id v8 = v6;
  id v9 = [v8 performWriteTransactionWithBlock:v12 completionHandler:v10];
}

- (void)addStatusChangesForRecordsWithScopedIdentifiers:(id)a3 persist:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 store]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012F648;
  v14[3] = &unk_1002466D0;
  id v15 = v8;
  id v16 = v6;
  BOOL v17 = a4;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10012F824;
  v12[3] = &unk_10023F188;
  id v13 = v16;
  id v9 = v16;
  id v10 = v8;
  id v11 = [v10 performWriteTransactionWithBlock:v14 completionHandler:v12];
}

- (void)getScopeStatusCountsForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 store]);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10012FA24;
  v14[3] = &unk_1002466F8;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v6;
  id v17 = v7;
  id v10 = v6;
  id v11 = v9;
  id v12 = v7;
  id v13 = [v11 performReadTransactionWithBlock:v14];
}

- (id)_cloudResourcesToLocalResourcesWithLocalResources:(id)a3 targetMapping:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v6 count]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 store]);

  id v25 = v10;
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 cloudCache]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idMapping]);
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 itemScopedIdentifier]);
        id v19 = (id)objc_claimAutoreleasedReturnValue([v11 cloudScopedIdentifierForLocalScopedIdentifier:v18 isFinal:&v27]);

        if (!v19)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v17 itemScopedIdentifier]);
          id v19 = [v20 copy];
        }

        id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 targetForRecordWithScopedIdentifier:v19]);

        if (!v21)
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue([v26 targetForRecordWithCloudScopedIdentifier:v19]);
          [v7 setTarget:v22 forRecordWithScopedIdentifier:v19];
        }

        id v23 = [v17 copy];
        [v23 setItemScopedIdentifier:v19];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v17, v23);
      }

      id v14 = [v12 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v14);
  }

  return v8;
}

- (id)_localResourceFromCloudResources:(id)a3 usingMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0LL;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v6,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v15 + 1) + 8 * (void)v12),  (void)v15));
          if (v13) {
            -[NSMutableArray addObject:](v7, "addObject:", v13);
          }

          id v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v10);
    }
  }

  else
  {
    id v7 = (NSMutableArray *)&__NSArray0__struct;
  }

  return v7;
}

- (id)_localResourceFromCloudResourcesAndErrors:(id)a3 usingMapping:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v5 count]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100130288;
    v12[3] = &unk_100246720;
    id v13 = v6;
    id v8 = v7;
    id v14 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v12];
    id v9 = v14;
    id v10 = v8;
  }

  else
  {
    id v10 = (NSMutableDictionary *)&__NSDictionary0__struct;
  }

  return v10;
}

- (void)checkServerForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 transport]);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10013043C;
  v21[3] = &unk_100246748;
  id v22 = v10;
  id v23 = v11;
  void v21[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v15 resourceCheckTaskForResources:v16 targetMapping:v13 transportScopeMapping:v12 completionHandler:v21]);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v14 syncManager]);
  [v20 configureDirectTransportTask:v19];

  [v19 runWithNoSyncSession];
}

- (id)safeResourcesToDeleteFromProposedResources:(id)a3 realPrune:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 allowUnconfirmed:(BOOL)a6 resourcesToCheckOnServer:(id *)a7 targetScopeMapping:(id)a8 unsafeResources:(id)a9
{
  BOOL v96 = a6;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a8;
  id v16 = a9;
  v100 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v108 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v111 = (void *)objc_claimAutoreleasedReturnValue([v17 scopes]);
  v99 = (void *)objc_claimAutoreleasedReturnValue([v17 cloudCache]);
  v113 = (void *)objc_claimAutoreleasedReturnValue([v17 outgoingResources]);
  v105 = (void *)objc_claimAutoreleasedReturnValue([v17 idMapping]);
  v98 = v17;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 resourceStorage]);
  v101 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v103 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v97 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v107 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v109 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  v124[0] = _NSConcreteStackBlock;
  v124[1] = 3221225472LL;
  v124[2] = sub_1001313F4;
  v124[3] = &unk_100246770;
  id v92 = v18;
  id v125 = v92;
  BOOL v127 = a4;
  id v93 = v16;
  id v126 = v93;
  id v19 = objc_retainBlock(v124);
  BOOL v95 = v11;
  v94 = a7;
  if (v11)
  {
    if (qword_1002A37A0 != -1) {
      dispatch_once(&qword_1002A37A0, &stru_100246D60);
    }
    BOOL v114 = byte_1002A37A8 != 0;
  }

  else
  {
    BOOL v114 = 0;
  }

  __int128 v122 = 0u;
  __int128 v123 = 0u;
  __int128 v120 = 0u;
  __int128 v121 = 0u;
  id obj = v14;
  id v116 = [obj countByEnumeratingWithState:&v120 objects:v132 count:16];
  if (v116)
  {
    uint64_t v115 = *(void *)v121;
    id v104 = v15;
    do
    {
      id v20 = 0LL;
      do
      {
        if (*(void *)v121 != v115) {
          objc_enumerationMutation(obj);
        }
        id v21 = *(__CFString **)(*((void *)&v120 + 1) + 8LL * (void)v20);
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString itemScopedIdentifier](v21, "itemScopedIdentifier"));
        if (!v22)
        {
          if (_CPLSilentLogging)
          {
            id v25 = @"resource has no item identifier";
            uint64_t v26 = 50LL;
          }

          else
          {
            id v27 = sub_10011CDF4();
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v129 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Client is asking to delete a resource with no item identifier: %@",  buf,  0xCu);
            }

            id v25 = @"resource has no item identifier";
            uint64_t v26 = 50LL;
LABEL_21:
          }

          goto LABEL_22;
        }

        if ([v113 shouldUploadResource:v21])
        {
          if (!_CPLSilentLogging)
          {
            id v23 = sub_10011CDF4();
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v129 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Client is asking to delete %@ but that resource is still in transit for upload",  buf,  0xCu);
            }

            id v25 = @"resource has not been uploaded yet";
            uint64_t v26 = 27LL;
            goto LABEL_21;
          }

          id v25 = @"resource has not been uploaded yet";
          uint64_t v26 = 27LL;
LABEL_22:
          if (!v114) {
            goto LABEL_112;
          }
          goto LABEL_23;
        }

        int64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v22 scopeIdentifier]);
        id v25 = (__CFString *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v107, "objectForKeyedSubscript:", v32));
        if (!v25)
        {
          id v38 = (void *)objc_claimAutoreleasedReturnValue([v111 scopeWithIdentifier:v32]);
          if (v38)
          {
            BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v111 flagsForScope:v38]);
            id v25 = @"scope has been deleted";
            if (([v39 valueForFlag:4] & 1) == 0)
            {
              id v25 = @"scope has been disabled";
              if (([v39 valueForFlag:8] & 1) == 0)
              {
                id v25 = @"scope is inactive";
                if (![v39 valueForFlag:16])
                {

                  -[NSMutableSet addObject:](v109, "addObject:", v32);
LABEL_26:
                  uint64_t v33 = objc_claimAutoreleasedReturnValue([v105 cloudScopedIdentifierForLocalScopedIdentifier:v22 isFinal:&v119]);
                  v110 = (void *)v33;
                  if (v33)
                  {
                    uint64_t v34 = v33;
                    uint64_t v35 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v103, "objectForKey:", v33));
                    if (v35)
                    {
                      id v36 = (__CFString *)v35;
                      uint64_t v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));

                      if (v36 == v37)
                      {

                        goto LABEL_71;
                      }

- (void)_deleteResources:(id)a3 dryRun:(BOOL)a4 checkServerIfNecessary:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a4;
  id v34 = a3;
  id v35 = a6;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v36 = (void *)objc_claimAutoreleasedReturnValue([v37 resourceStorage]);
  if (-[CPLEngineLibrary iCloudLibraryClientVersionTooOld]( self->_engineLibrary,  "iCloudLibraryClientVersionTooOld"))
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10011CDF4();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v11 = "prune";
        if (v7) {
          BOOL v11 = "check (prune)";
        }
        LODWORD(buf) = 136315138;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asked to %s some resources while engine not syncing due to server blacklisting client",  (uint8_t *)&buf,  0xCu);
      }
    }

    clientQueue = self->_clientQueue;
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472LL;
    v86[2] = sub_100131B80;
    v86[3] = &unk_10023EA48;
    id v89 = v35;
    id v87 = v34;
    id v88 = v36;
    id v13 = v86;
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    uint64_t v91 = (uint64_t)sub_10013AA68;
    id v92 = (uint64_t (*)(uint64_t, uint64_t))&unk_10023DBC8;
    id v93 = v13;
    id v14 = clientQueue;
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v14, v15);
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v91 = 0x3032000000LL;
    id v92 = sub_10011D36C;
    id v93 = sub_10011D37C;
    id v94 = 0LL;
    v84[0] = 0LL;
    v84[1] = v84;
    v84[2] = 0x3032000000LL;
    v84[3] = sub_10011D36C;
    v84[4] = sub_10011D37C;
    v85 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v82[0] = 0LL;
    v82[1] = v82;
    v82[2] = 0x3032000000LL;
    v82[3] = sub_10011D36C;
    v82[4] = sub_10011D37C;
    v83 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v80[0] = 0LL;
    v80[1] = v80;
    v80[2] = 0x3032000000LL;
    v80[3] = sub_10011D36C;
    v80[4] = sub_10011D37C;
    id v81 = 0LL;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_100131C0C;
    v76[3] = &unk_100246798;
    id v17 = v36;
    BOOL v79 = !v7;
    id v77 = v17;
    v78 = v82;
    id v18 = objc_retainBlock(v76);
    v68[0] = _NSConcreteStackBlock;
    v68[1] = 3221225472LL;
    v68[2] = sub_100131CBC;
    v68[3] = &unk_1002467C0;
    BOOL v74 = v7;
    BOOL v75 = !v7;
    id v31 = v17;
    id v69 = v31;
    uint64_t v72 = v84;
    id v29 = v16;
    id v70 = v29;
    v73 = v82;
    unsigned int v30 = v18;
    id v71 = v30;
    id v19 = objc_retainBlock(v68);
    id v20 = objc_alloc_init(&OBJC_CLASS___CPLRecordTargetMapping);
    id v21 = objc_alloc(&OBJC_CLASS___CPLTransportScopeMapping);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 transport]);
    id v24 = -[CPLTransportScopeMapping initWithTranslator:](v21, "initWithTranslator:", v23);

    v66[0] = 0LL;
    v66[1] = v66;
    v66[2] = 0x3032000000LL;
    v66[3] = sub_10011D36C;
    v66[4] = sub_10011D37C;
    id v67 = 0LL;
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_100132004;
    v53[3] = &unk_1002467E8;
    BOOL v64 = a5;
    v53[4] = self;
    BOOL v65 = !v7;
    id v54 = v34;
    v59 = v80;
    __int128 v55 = v24;
    int v60 = v82;
    SEL v63 = a2;
    id v58 = v19;
    p___int128 buf = &buf;
    id v56 = v37;
    id v62 = v66;
    unsigned __int8 v57 = v20;
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_100132220;
    v38[3] = &unk_1002468D8;
    BOOL v51 = v7;
    id v46 = v84;
    v38[4] = self;
    id v44 = v35;
    id v39 = v54;
    BOOL v52 = !v7;
    id v40 = v31;
    uint64_t v47 = v66;
    id v48 = v82;
    id v25 = v57;
    uint64_t v41 = v25;
    uint64_t v26 = v55;
    id v42 = v26;
    uint64_t v49 = v80;
    id v43 = v56;
    unsigned __int8 v50 = &buf;
    id v27 = v58;
    id v45 = v27;
    id v28 = [v43 performWriteTransactionWithBlock:v53 completionHandler:v38];

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(v80, 8);

    _Block_object_dispose(v82, 8);
    _Block_object_dispose(v84, 8);

    _Block_object_dispose(&buf, 8);
  }
}

- (void)deleteResources:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)checkResourcesAreSafeToPrune:(id)a3 checkServerIfNecessary:(BOOL)a4 completionHandler:(id)a5
{
}

- (void)getResourcesForItemWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudCache]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 outgoingResources]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10013342C;
  v18[3] = &unk_1002459D8;
  id v19 = v6;
  id v20 = v8;
  id v21 = (id)objc_claimAutoreleasedReturnValue([v8 idMapping]);
  id v22 = v9;
  id v23 = v10;
  id v24 = self;
  id v25 = v7;
  id v11 = v7;
  id v12 = v10;
  id v13 = v9;
  id v14 = v21;
  id v15 = v8;
  id v16 = v6;
  id v17 = [v15 performReadTransactionWithBlock:v18];
}

- (void)compactFileCacheWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v10 = v4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100133C60;
  v11[3] = &unk_10023F188;
  id v12 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100133D0C;
  v9[3] = &unk_100245910;
  id v6 = v4;
  id v7 = v5;
  id v8 = [v7 performWriteTransactionWithBlock:v11 completionHandler:v9];
}

- (void)markLibraryManagerAsInvalid
{
  if (self->_ownsLibrary)
  {
    if (!_CPLSilentLogging)
    {
      id v4 = sub_10011CDF4();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = NSStringFromSelector(a2);
        id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        int v8 = 138412546;
        id v9 = v7;
        __int16 v10 = 2112;
        id v11 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Trying to call %@ while %@ does not own the engine",  (uint8_t *)&v8,  0x16u);
      }
    }
  }

  else
  {
    -[CPLEngineLibrary markAttachedObjectAsInvalid:](self->_engineLibrary, "markAttachedObjectAsInvalid:", self);
  }

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[CPLDirectLibraryManager _isManagementLibraryManager](self, "_isManagementLibraryManager"))
  {
    engineLibrary = self->_engineLibrary;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10013407C;
    v19[3] = &unk_100246928;
    void v19[4] = self;
    id v20 = v10;
    id v12 = v10;
    -[CPLEngineLibrary testKey:value:completionHandler:](engineLibrary, "testKey:value:completionHandler:", v8, v9, v19);
    id v13 = v20;
  }

  else
  {
    clientQueue = self->_clientQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100133FF0;
    v21[3] = &unk_10023DFE0;
    void v21[4] = self;
    id v22 = v10;
    id v15 = v21;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10013AA68;
    block[3] = &unk_10023DBC8;
    id v24 = v15;
    id v16 = clientQueue;
    id v17 = v10;
    dispatch_block_t v18 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v16, v18);

    id v13 = v22;
  }
}

- (void)getTargetsForRecordsWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100134288;
  v13[3] = &unk_100246950;
  id v15 = v6;
  id v16 = v7;
  id v14 = v8;
  id v9 = v6;
  id v10 = v8;
  id v11 = v7;
  id v12 = [v10 performReadTransactionWithBlock:v13];
}

- (void)engineLibrary:(id)a3 didCloseWithError:(id)a4
{
  if (!(self->_closing | _CPLSilentLogging))
  {
    id v5 = sub_10011CDF4();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      engineLibrary = self->_engineLibrary;
      int v8 = 138412290;
      id v9 = engineLibrary;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ was closed externally", (uint8_t *)&v8, 0xCu);
    }
  }

- (void)engineLibraryHasChangesInPullQueue:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10011CDF4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Notifying %@ of changes in pull queue",  (uint8_t *)&buf,  0xCu);
    }
  }

  clientQueue = self->_clientQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100134694;
  v12[3] = &unk_10023DC70;
  void v12[4] = self;
  id v9 = v12;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472LL;
  id v14 = sub_10013AA68;
  id v15 = &unk_10023DBC8;
  id v16 = v9;
  id v10 = clientQueue;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v10, v11);
}

- (void)engineLibraryHasStatusChanges:(id)a3
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10011CDF4();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 delegate]);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "Notifying %@ of status changes",  (uint8_t *)&buf,  0xCu);
    }
  }

  clientQueue = self->_clientQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100134878;
  v12[3] = &unk_10023DC70;
  void v12[4] = self;
  id v9 = v12;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472LL;
  id v14 = sub_10013AA68;
  id v15 = &unk_10023DBC8;
  id v16 = v9;
  id v10 = clientQueue;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
  dispatch_async(v10, v11);
}

- (void)engineLibrary:(id)a3 didDownloadResourceInBackground:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_10011CDF4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceProgressDelegate]);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Notifying %@ that %@ was downloaded in background",  buf,  0x16u);
    }
  }

  clientQueue = self->_clientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100134AA8;
  v15[3] = &unk_10023DDE8;
  void v15[4] = self;
  id v16 = v5;
  dispatch_block_t v11 = v15;
  *(void *)__int128 buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_10013AA68;
  dispatch_block_t v18 = &unk_10023DBC8;
  id v19 = v11;
  id v12 = clientQueue;
  id v13 = v5;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v12, v14);
}

- (void)engineLibrary:(id)a3 didFailBackgroundDownloadOfResource:(id)a4
{
  id v5 = a4;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_10011CDF4();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 resourceProgressDelegate]);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v9;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "Notifying %@ that %@ did fail to download in background",  buf,  0x16u);
    }
  }

  clientQueue = self->_clientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100134CC8;
  v15[3] = &unk_10023DDE8;
  void v15[4] = self;
  id v16 = v5;
  dispatch_block_t v11 = v15;
  *(void *)__int128 buf = _NSConcreteStackBlock;
  *(void *)&buf[8] = 3221225472LL;
  *(void *)&buf[16] = sub_10013AA68;
  dispatch_block_t v18 = &unk_10023DBC8;
  id v19 = v11;
  id v12 = clientQueue;
  id v13 = v5;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
  dispatch_async(v12, v14);
}

- (void)engineLibrary:(id)a3 didStartUploadTask:(id)a4
{
  id v5 = a4;
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100134E30;
  v11[3] = &unk_10023DDE8;
  void v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  int v8 = clientQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didProgress:(float)a5
{
  id v7 = a4;
  int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  clientQueue = self->_clientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100134FB8;
  v15[3] = &unk_100246978;
  float v18 = a5;
  id v16 = v8;
  id v17 = v7;
  dispatch_block_t v10 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v20 = v10;
  dispatch_block_t v11 = clientQueue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

- (void)engineLibrary:(id)a3 uploadTask:(id)a4 didFinishWithError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  clientQueue = self->_clientQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100135124;
  v15[3] = &unk_10023DE80;
  void v15[4] = self;
  id v16 = v7;
  id v17 = v8;
  dispatch_block_t v10 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v19 = v10;
  dispatch_block_t v11 = clientQueue;
  id v12 = v8;
  id v13 = v7;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

- (void)engineLibrary:(id)a3 sizeOfResourcesToUploadDidChangeToSize:(unint64_t)a4 sizeOfOriginalResourcesToUpload:(unint64_t)a5 numberOfImages:(unint64_t)a6 numberOfVideos:(unint64_t)a7 numberOfOtherItems:(unint64_t)a8
{
  clientQueue = self->_clientQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100135260;
  v12[3] = &unk_1002469A0;
  void v12[4] = self;
  void v12[5] = a4;
  v12[6] = a5;
  v12[7] = a6;
  v12[8] = a7;
  v12[9] = a8;
  id v9 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v14 = v9;
  dispatch_block_t v10 = clientQueue;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v11);
}

- (void)engineLibrary:(id)a3 provideLocalResource:(id)a4 recordClass:(Class)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  clientQueue = self->_clientQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001353C0;
  v17[3] = &unk_1002469C8;
  void v17[4] = self;
  id v18 = v9;
  id v19 = v10;
  Class v20 = a5;
  id v12 = v17;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v22 = v12;
  id v13 = clientQueue;
  id v14 = v10;
  id v15 = v9;
  dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v13, v16);
}

- (void)engineLibrary:(id)a3 pushAllChangesWithCompletionHandler:(id)a4
{
  id v5 = a4;
  clientQueue = self->_clientQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100135608;
  v11[3] = &unk_10023E058;
  void v11[4] = self;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  id v8 = clientQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)engineLibrary:(id)a3 providePayloadForComputeStates:(id)a4 inFolderWithURL:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
  clientQueue = self->_clientQueue;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1001358E8;
  v21[3] = &unk_10023E1B0;
  id v22 = v12;
  id v23 = self;
  id v24 = v9;
  id v25 = v10;
  id v26 = v11;
  id v14 = v21;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013AA68;
  block[3] = &unk_10023DBC8;
  id v28 = v14;
  id v15 = clientQueue;
  id v16 = v11;
  id v17 = v10;
  id v18 = v9;
  id v19 = v12;
  dispatch_block_t v20 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v15, v20);
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class(self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"<%@ %@>", v3, v5));

  return (NSString *)v6;
}

- (BOOL)_resetStore:(id)a3 reason:(id)a4 resetSelector:(SEL)a5 error:(id *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = (objc_class *)objc_opt_class(v10);
  IMP MethodImplementation = class_getMethodImplementation(v11, a5);
  LOBYTE(a6) = (uint64_t)MethodImplementation(v10, a5, v9, a6);

  return (char)a6;
}

- (void)resetCacheWithOption:(unint64_t)a3 reason:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  id v11 = v10;
  if (a3 == 101)
  {
    [v10 markAsCorrupted];
    v9[2](v9, 0LL);
  }

  else if (a3 == 100)
  {
    v9[2](v9, 0LL);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100135E14;
    v19[3] = &unk_10023DC70;
    void v19[4] = self;
    [v11 wipeStoreAtNextOpeningWithReason:v8 completionBlock:v19];
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100135E70;
    v15[3] = &unk_100246A40;
    unint64_t v18 = a3;
    void v15[4] = self;
    id v16 = v10;
    id v17 = v8;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10013623C;
    v13[3] = &unk_100246248;
    void v13[4] = self;
    id v14 = v9;
    id v12 = [v16 performWriteTransactionWithBlock:v15 completionHandler:v13];
  }
}

- (void)getListOfComponentsWithCompletionHandler:(id)a3
{
}

- (void)getStatusForComponents:(id)a3 completionHandler:(id)a4
{
}

- (void)getStatusArrayForComponents:(id)a3 completionHandler:(id)a4
{
}

- (void)getStatusesForScopesWithIdentifiers:(id)a3 includeStorages:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1001364B4;
  v16[3] = &unk_100246A90;
  BOOL v21 = a4;
  id v17 = v10;
  id v18 = (id)objc_claimAutoreleasedReturnValue([v10 scopes]);
  id v19 = v8;
  id v20 = v9;
  id v11 = v8;
  id v12 = v18;
  id v13 = v10;
  id v14 = v9;
  id v15 = [v13 performReadTransactionWithBlock:v16];
}

- (void)getCloudCacheForRecordWithScopedIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100136C30;
  v13[3] = &unk_1002466F8;
  void v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v9 = v8;
  id v10 = v6;
  id v11 = v7;
  id v12 = [v9 performReadTransactionWithBlock:v13];
}

- (void)cloudCacheGetDescriptionForRecordWithScopedIdentifier:(id)a3 related:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001371D0;
  v15[3] = &unk_100246AB8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  BOOL v19 = a4;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = [v11 performReadTransactionWithBlock:v15];
}

- (void)addInfoToLog:(id)a3
{
  id v3 = a3;
  if (!_CPLSilentLogging)
  {
    uint64_t v4 = __CPLGenericOSLogDomain();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)forceBackupWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  [v5 forceBackupWithActivity:0 forceClientPush:1 completionHandler:v4];
}

- (void)requestClientToPushAllChangesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  [v5 requestClientToPushAllChangesWithCompletionHandler:v4];
}

- (void)requestClientToPullAllChangesInScopeIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
  [v8 requestClientToPullAllChangesWithScopeIdentifiers:v7 completionHandler:v6];
}

- (void)provideScopeChangeForScopeWithIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)provideRecordWithCloudScopeIdentifier:(id)a3 completionHandler:(id)a4
{
}

- (void)provideCloudResource:(id)a3 completionHandler:(id)a4
{
}

- (void)addDropDerivativesRecipe:(id)a3 writeToUserDefaults:(BOOL)a4 withCompletionHandler:(id)a5
{
  BOOL v5 = a4;
  engineLibrary = self->_engineLibrary;
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary syncManager](engineLibrary, "syncManager"));
  [v10 addDropDerivativesRecipe:v9 writeToUserDefaults:v5 withCompletionHandler:v8];
}

- (id)displayableNameForEngineLibrary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);

  if (!v5
    || (objc_opt_respondsToSelector(v5, "displayableNameForLibraryManager:") & 1) == 0
    || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject")),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 displayableNameForLibraryManager:v6]),
        v6,
        !v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 processName]);
  }

  return v7;
}

- (BOOL)isLibraryManagerForEngineLibrary:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject", a3));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);

  if (v5 && (objc_opt_respondsToSelector(v5, "isLibraryManager:") & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
    unsigned __int8 v7 = [v5 isLibraryManager:v6];
  }

  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)attachComputeStates:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  v27[3] = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x3032000000LL;
  v25[3] = sub_10011D36C;
  void v25[4] = sub_10011D37C;
  id v26 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100137EB4;
  v18[3] = &unk_100246B08;
  id v19 = v8;
  id v9 = v6;
  id v20 = v9;
  BOOL v21 = v27;
  id v22 = v23;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001383B4;
  v13[3] = &unk_100246B30;
  id v16 = v25;
  id v17 = v23;
  id v10 = v19;
  id v14 = v10;
  id v11 = v7;
  id v15 = v11;
  id v12 = [v10 performWriteTransactionWithBlock:v18 completionHandler:v13];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

  _Block_object_dispose(v27, 8);
}

- (void)_cleanupComputeStateDownloadQueue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100138510;
  v6[3] = &unk_10023E318;
  v6[4] = self;
  id v7 = v3;
  id v4 = v3;
  id v5 = [v4 performWriteTransactionWithBlock:v6 completionHandler:&stru_100246B50];
}

- (void)_startComputeStateDownload
{
  cleanupComputeStateDownloadTimer = self->_cleanupComputeStateDownloadTimer;
  if (cleanupComputeStateDownloadTimer)
  {
    dispatch_source_cancel((dispatch_source_t)cleanupComputeStateDownloadTimer);
    id v4 = self->_cleanupComputeStateDownloadTimer;
    self->_cleanupComputeStateDownloadTimer = 0LL;
  }

- (void)_endComputeStateDownload
{
  unint64_t computeStateDownloadCount = self->_computeStateDownloadCount;
  if (computeStateDownloadCount)
  {
    unint64_t v5 = computeStateDownloadCount - 1;
    self->_unint64_t computeStateDownloadCount = v5;
    if (!v5)
    {
      id v6 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)self->_clientQueue);
      dispatch_time_t v7 = dispatch_time(0LL, 3600000000000LL);
      dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472LL;
      v12[2] = sub_100138914;
      v12[3] = &unk_10023DDE8;
      id v8 = v6;
      id v13 = v8;
      id v14 = self;
      dispatch_source_set_event_handler(v8, v12);
      cleanupComputeStateDownloadTimer = self->_cleanupComputeStateDownloadTimer;
      self->_cleanupComputeStateDownloadTimer = (OS_dispatch_source *)v8;
      id v10 = v8;

      dispatch_activate(v10);
    }
  }

  else
  {
    uint64_t v11 = sub_100198F88(a2, self);
    sub_100138914(v11);
  }

- (void)fetchComputeStatesForRecordsWithScopedIdentifiers:(id)a3 validator:(id)a4 shouldDecrypt:(BOOL)a5 onDemand:(BOOL)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if ([v13 count])
  {
    BOOL v37 = a5;
    BOOL v38 = a6;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary store](self->_engineLibrary, "store"));
    id v36 = (void *)objc_claimAutoreleasedReturnValue([v16 scopes]);
    v81[0] = 0LL;
    v81[1] = v81;
    v81[2] = 0x3032000000LL;
    v81[3] = sub_10011D36C;
    v81[4] = sub_10011D37C;
    id v82 = 0LL;
    v79[0] = 0LL;
    v79[1] = v79;
    v79[2] = 0x3032000000LL;
    v79[3] = sub_10011D36C;
    v79[4] = sub_10011D37C;
    id v80 = 0LL;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v17 transport]);

    v77[0] = 0LL;
    v77[1] = v77;
    v77[2] = 0x3032000000LL;
    v77[3] = sub_10011D36C;
    v77[4] = sub_10011D37C;
    id v78 = 0LL;
    v75[0] = 0LL;
    v75[1] = v75;
    v75[2] = 0x3032000000LL;
    v75[3] = sub_10011D36C;
    v75[4] = sub_10011D37C;
    id v76 = 0LL;
    v73[0] = 0LL;
    v73[1] = v73;
    v73[2] = 0x3032000000LL;
    v73[3] = sub_10011D36C;
    v73[4] = sub_10011D37C;
    id v74 = 0LL;
    id v18 = (void *)objc_opt_class(self);
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    block = _NSConcreteStackBlock;
    uint64_t v84 = 3221225472LL;
    v85 = sub_10013AA9C;
    id v86 = &unk_100246D40;
    id v87 = v18;
    SEL v88 = a2;
    [v19 setCancellationHandler:&block];
    v71[0] = 0LL;
    v71[1] = v71;
    v71[2] = 0x2020000000LL;
    char v72 = 0;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472LL;
    v65[2] = sub_100138EF0;
    v65[3] = &unk_100246BA0;
    v65[4] = self;
    v68 = v71;
    id v69 = v73;
    id v70 = v75;
    id v20 = v19;
    id v66 = v20;
    id v67 = v15;
    BOOL v21 = objc_retainBlock(v65);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v16 recordComputeStatePushQueue]);
    [v22 noteComputeStateDownloadRequest];

    clientQueue = self->_clientQueue;
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472LL;
    v64[2] = sub_100139274;
    v64[3] = &unk_10023DC70;
    v64[4] = self;
    char v24 = v64;
    block = _NSConcreteStackBlock;
    uint64_t v84 = 3221225472LL;
    v85 = sub_10013AA68;
    id v86 = &unk_10023DBC8;
    id v87 = v24;
    id v25 = clientQueue;
    dispatch_block_t v26 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &block);
    dispatch_async(v25, v26);

    id v27 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v13 count]);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472LL;
    v55[2] = sub_10013927C;
    v55[3] = &unk_100246BF0;
    id v56 = v13;
    int v60 = v81;
    id v57 = v36;
    id v58 = v16;
    v59 = v27;
    v61 = v77;
    id v62 = v79;
    SEL v63 = v75;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_1001397C4;
    v39[3] = &unk_100246CE0;
    id v28 = v21;
    id v47 = v28;
    id v29 = v59;
    id v40 = v29;
    uint64_t v41 = self;
    id v42 = v56;
    id v48 = v73;
    uint64_t v49 = v81;
    unsigned __int8 v50 = v79;
    BOOL v51 = v75;
    BOOL v52 = v77;
    id v30 = v58;
    id v43 = v30;
    id v31 = v57;
    id v44 = v31;
    BOOL v53 = v37;
    id v32 = v20;
    id v45 = v32;
    BOOL v54 = v38;
    id v33 = v35;
    id v46 = v33;
    id v34 = [v30 performWriteTransactionWithBlock:v55 completionHandler:v39];

    _Block_object_dispose(v71, 8);
    _Block_object_dispose(v73, 8);

    _Block_object_dispose(v75, 8);
    _Block_object_dispose(v77, 8);

    _Block_object_dispose(v79, 8);
    _Block_object_dispose(v81, 8);
  }

  else
  {
    (*((void (**)(id, void *, void))v15 + 2))(v15, &__NSDictionary0__struct, 0LL);
  }
}

- (void)reportSetting:(id)a3 hasBeenSetToValue:(id)a4
{
  engineLibrary = self->_engineLibrary;
  id v6 = a4;
  id v7 = a3;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary feedback](engineLibrary, "feedback"));
  [v8 reportSetting:v7 hasBeenSetToValue:v6];
}

- (void)reportMiscInformation:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:CPLMiscInformationAppendCPLReport]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager engineLibrary](self, "engineLibrary"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 store]);

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_10013A284;
    v10[3] = &unk_100245870;
    id v11 = v4;
    id v12 = v7;
    id v13 = self;
    id v8 = v7;
    id v9 = [v8 performReadTransactionWithBlock:v10];
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary feedback](self->_engineLibrary, "feedback"));
    [v8 reportMiscInformation:v4];
  }
}

- (void)blockEngineElement:(id)a3
{
  if (a3)
  {
    engineLibrary = self->_engineLibrary;
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](engineLibrary, "scheduler"));
    [v5 blockEngineElement:v4];
  }

- (void)unblockEngineElement:(id)a3
{
  if (a3)
  {
    engineLibrary = self->_engineLibrary;
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](engineLibrary, "scheduler"));
    [v5 unblockEngineElement:v4];
  }

- (void)unblockEngineElementOnce:(id)a3
{
  if (a3)
  {
    engineLibrary = self->_engineLibrary;
    id v4 = a3;
    id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLEngineLibrary scheduler](engineLibrary, "scheduler"));
    [v5 unblockEngineElementOnce:v4];
  }

- (void)engineLibrary:(id)a3 noteClientIsInForeground:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject", a3));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 owner]);
  [v5 libraryManager:v6 noteClientIsInForeground:v4];
}

- (id)ownerNameForEngineLibrary:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject", a3));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 owner]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ownerNameForLibraryManager:v3]);

  return v5;
}

- (void)engineLibrary:(id)a3 getStatusWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 owner]);
  id v7 = v6;
  if (v6) {
    [v6 libraryManager:v8 getStatusWithCompletionHandler:v5];
  }
  else {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }
}

- (void)engineLibrary:(id)a3 getStatusDictionaryWithCompletionHandler:(id)a4
{
  id v5 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[CPLDirectLibraryManager abstractObject](self, "abstractObject"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v8 owner]);
  id v7 = v6;
  if (v6) {
    [v6 libraryManager:v8 getStatusDictionaryWithCompletionHandler:v5];
  }
  else {
    (*((void (**)(id, void, void))v5 + 2))(v5, 0LL, 0LL);
  }
}

- (CPLEngineLibrary)engineLibrary
{
  return self->_engineLibrary;
}

- (void)setEngineLibrary:(id)a3
{
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (void)setClientQueue:(id)a3
{
}

- (id)configureEngineBeforeOpeningBlock
{
  return self->_configureEngineBeforeOpeningBlock;
}

- (void)setConfigureEngineBeforeOpeningBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end