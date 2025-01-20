@interface MZUniversalPlaybackPositionSyncHandler
- (BOOL)_shouldStop;
- (BOOL)_synchronize:(id *)a3;
- (BOOL)canRequestStoreSignIn;
- (BOOL)canceled;
- (BOOL)keyValueStoreController:(id)a3 shouldScheduleTransaction:(id)a4;
- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5;
- (BOOL)syncInProgress;
- (MZKeyValueStoreController)kvsController;
- (MZKeyValueStoreTransaction)currentKVSTransaction;
- (MZUPPAsynchronousTask)task;
- (MZUPPBagContext)bagContext;
- (MZUniversalPlaybackPositionDataSource)dataSource;
- (MZUniversalPlaybackPositionSyncHandler)initWithDataSource:(id)a3 bagContext:(id)a4 andTask:(id)a5;
- (MZUniversalPlaybackPositionTransactionContext)dataSourceTransactionContext;
- (MZUppSyncProcessor)transactionProcessor;
- (NSError)fatalSyncError;
- (id)_synchronouslyRunKVSTransaction:(id)a3;
- (id)newKVSGetAllTransactionSinceDomainVersion:(id)a3;
- (id)newKVSGetAllTransactionWithMetadataItems:(id)a3;
- (id)newKVSPutAllTransactionWithMetadataItems:(id)a3;
- (id)newKVSTransactionWithType:(int)a3 keys:(id)a4;
- (void)_dataSourceCancelTransaction;
- (void)_fillEmptyMetadataIdentifiersIfNeeded;
- (void)_resetState;
- (void)_signalKVSTransactionCompletion:(id)a3;
- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5;
- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4;
- (void)setBagContext:(id)a3;
- (void)setCanRequestStoreSignIn:(BOOL)a3;
- (void)setCanceled:(BOOL)a3;
- (void)setCurrentKVSTransaction:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDataSourceTransactionContext:(id)a3;
- (void)setFatalSyncError:(id)a3;
- (void)setKvsController:(id)a3;
- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3;
- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3;
- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3;
- (void)setSyncInProgress:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)setTransactionProcessor:(id)a3;
- (void)synchronizeWithCompletionHandler:(id)a3;
- (void)timeout;
@end

@implementation MZUniversalPlaybackPositionSyncHandler

- (MZUniversalPlaybackPositionSyncHandler)initWithDataSource:(id)a3 bagContext:(id)a4 andTask:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MZUniversalPlaybackPositionSyncHandler;
  v11 = -[MZUniversalPlaybackPositionSyncHandler init](&v27, "init");
  v12 = v11;
  if (v11)
  {
    -[MZUniversalPlaybackPositionSyncHandler setDataSource:](v11, "setDataSource:", v8);
    -[MZUniversalPlaybackPositionSyncHandler setBagContext:](v12, "setBagContext:", v9);
    v13 = -[MZUppSyncProcessor initWithStorageProviderDelegate:]( objc_alloc(&OBJC_CLASS___MZUppSyncProcessor),  "initWithStorageProviderDelegate:",  v12);
    -[MZUniversalPlaybackPositionSyncHandler setTransactionProcessor:](v12, "setTransactionProcessor:", v13);

    -[MZUniversalPlaybackPositionSyncHandler setTask:](v12, "setTask:", v10);
    v14 = objc_alloc(&OBJC_CLASS___MZKeyValueStoreController);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 baseURLForGETAll]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 baseURLForPUTAll]);
    v18 = -[MZKeyValueStoreController initWithDomain:baseURLForGETAll:baseURLForPUTAll:]( v14,  "initWithDomain:baseURLForGETAll:baseURLForPUTAll:",  v15,  v16,  v17);

    -[MZKeyValueStoreController setDelegate:](v18, "setDelegate:", v12);
    -[MZUniversalPlaybackPositionSyncHandler setKvsController:](v12, "setKvsController:", v18);
    dispatch_queue_t v19 = dispatch_queue_create("MZUniversalPlaybackPositionSyncHandler.queue", 0LL);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v19;

    dispatch_queue_t v21 = dispatch_queue_create("MZUniversalPlaybackPositionSyncHandler.syncOperationQueue", 0LL);
    syncOperationQueue = v12->_syncOperationQueue;
    v12->_syncOperationQueue = (OS_dispatch_queue *)v21;

    v23 = (dispatch_object_s *)v12->_syncOperationQueue;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(-32768LL, 0LL);
    v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_set_target_queue(v23, v25);
  }

  return v12;
}

- (void)_resetState
{
  v3 = -[MZUppSyncProcessor initWithStorageProviderDelegate:]( objc_alloc(&OBJC_CLASS___MZUppSyncProcessor),  "initWithStorageProviderDelegate:",  self);
  -[MZUniversalPlaybackPositionSyncHandler setTransactionProcessor:](self, "setTransactionProcessor:", v3);
}

- (void)_dataSourceCancelTransaction
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSource](self, "dataSource"));
  if ((objc_opt_respondsToSelector(v4, "cancelUniversalPlaybackPositionTransaction:") & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue( -[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext]( self,  "dataSourceTransactionContext"));
    [v4 cancelUniversalPlaybackPositionTransaction:v3];
  }
}

- (BOOL)_synchronize:(id *)a3
{
  uint64_t v231 = 0LL;
  v232 = &v231;
  uint64_t v233 = 0x2020000000LL;
  char v234 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000398C4;
  block[3] = &unk_1002404E0;
  block[4] = self;
  block[5] = &v231;
  dispatch_sync(queue, block);
  if (!*((_BYTE *)v232 + 24))
  {
    -[MZUniversalPlaybackPositionSyncHandler _fillEmptyMetadataIdentifiersIfNeeded]( self,  "_fillEmptyMetadataIdentifiersIfNeeded");
    uint64_t v7 = kdebug_trace(723517700LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v8 = _MTLogCategoryUPPSync(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    v218 = a3;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning synchronization", buf, 2u);
    }

    uint64_t v11 = _MTLogCategoryUPPSync(v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Begin STEP 0. Gather local items to sync from data source.",  buf,  2u);
    }

    uint64_t v14 = _MTLogCategoryCloudSync(v13);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    os_signpost_id_t spid = os_signpost_id_generate(v15);

    uint64_t v17 = _MTLogCategoryUPPSync(v16);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = v18;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v19,  OS_SIGNPOST_INTERVAL_BEGIN,  spid,  "UPP.Sync.Step.0.Begin",  "",  buf,  2u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    dispatch_queue_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 metrics]);
    [v21 setLatestUPPSubtask:1];

    objc_initWeak(&location, self);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler dataSource](self, "dataSource"));
    v227[0] = _NSConcreteStackBlock;
    v227[1] = 3221225472LL;
    v227[2] = sub_1000398FC;
    v227[3] = &unk_100241598;
    v219 = &v228;
    objc_copyWeak(&v228, &location);
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 beginTransactionWithItemsToSyncEnumerationBlock:v227]);
    -[MZUniversalPlaybackPositionSyncHandler setDataSourceTransactionContext:]( self,  "setDataSourceTransactionContext:",  v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 metadataItemsFromDataSource]);
    id v26 = [v25 count];
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([(id)v27 metrics]);
    [v28 setNumMetadataItemsFromDataSource:v26];

    v29 = (void *)objc_claimAutoreleasedReturnValue( -[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext]( self,  "dataSourceTransactionContext"));
    LOBYTE(v27) = v29 == 0LL;

    if ((v27 & 1) != 0) {
      goto LABEL_13;
    }
    BOOL v30 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
    if (v30)
    {
      -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction](self, "_dataSourceCancelTransaction");
LABEL_13:
      BOOL v6 = 0;
LABEL_76:
      objc_destroyWeak(v219);
      objc_destroyWeak(&location);
      goto LABEL_77;
    }

    uint64_t v31 = _MTLogCategoryUPPSync(v30);
    v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 metadataItemsFromDataSource]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 allKeys]);
      unsigned int v36 = [v35 count];
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue([v37 metadataItemsFromDataSource]);
      id v39 = (id)objc_claimAutoreleasedReturnValue([v38 allKeys]);
      *(_DWORD *)buf = 67240450;
      *(_DWORD *)v236 = v36;
      *(_WORD *)&v236[4] = 2114;
      *(void *)&v236[6] = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Gathered local %{public}d items to sync from dataSource: %{public}@",  buf,  0x12u);
    }

    uint64_t v41 = _MTLogCategoryUPPSync(v40);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = (void *)objc_claimAutoreleasedReturnValue( -[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext]( self,  "dataSourceTransactionContext"));
      *(_DWORD *)buf = 138543362;
      *(void *)v236 = v43;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "dataSource transaction context = %{public}@",  buf,  0xCu);
    }

    uint64_t v44 = kdebug_trace(723517704LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v45 = _MTLogCategoryUPPSync(v44);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Finish STEP 0.", buf, 2u);
    }

    uint64_t v48 = _MTLogCategoryUPPSync(v47);
    v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
    v50 = v49;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v50,  OS_SIGNPOST_INTERVAL_END,  spid,  "UPP.Sync.Step.0.End",  "",  buf,  2u);
    }

    uint64_t v52 = _MTLogCategoryCloudSync(v51);
    v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
    os_signpost_id_t v54 = os_signpost_id_generate(v53);

    uint64_t v56 = _MTLogCategoryUPPSync(v55);
    v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    v58 = v57;
    if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v58,  OS_SIGNPOST_INTERVAL_BEGIN,  v54,  "UPP.Sync.Step.1.Begin",  "",  buf,  2u);
    }

    uint64_t v59 = kdebug_trace(723517708LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v60 = _MTLogCategoryUPPSync(v59);
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Begin STEP 1. Perform iTMS-kvs getAll to update new items.",  buf,  2u);
    }

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 metrics]);
    [v63 setLatestUPPSubtask:2];

    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v225 = 0u;
    __int128 v226 = 0u;
    __int128 v223 = 0u;
    __int128 v224 = 0u;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
    v66 = (void *)objc_claimAutoreleasedReturnValue([v65 metadataItemsFromDataSource]);
    v67 = (void *)objc_claimAutoreleasedReturnValue([v66 allValues]);

    id v68 = [v67 countByEnumeratingWithState:&v223 objects:v237 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v224;
      do
      {
        for (i = 0LL; i != v68; i = (char *)i + 1)
        {
          if (*(void *)v224 != v69) {
            objc_enumerationMutation(v67);
          }
          v71 = *(void **)(*((void *)&v223 + 1) + 8LL * (void)i);
        }

        id v68 = [v67 countByEnumeratingWithState:&v223 objects:v237 count:16];
      }

      while (v68);
    }

    if ([v64 count])
    {
      id v72 = -[MZUniversalPlaybackPositionSyncHandler newKVSGetAllTransactionWithMetadataItems:]( self,  "newKVSGetAllTransactionWithMetadataItems:",  v64);
      -[MZUniversalPlaybackPositionSyncHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v72);

      BOOL v73 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
      if (v73)
      {
LABEL_60:
        -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction]( self,  "_dataSourceCancelTransaction",  v218);
        BOOL v6 = 0;
LABEL_75:

        goto LABEL_76;
      }

      uint64_t v74 = _MTLogCategoryUPPSync(v73);
      v75 = (os_log_s *)objc_claimAutoreleasedReturnValue(v74);
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v76 = [v64 count];
        *(_DWORD *)buf = 67240450;
        *(_DWORD *)v236 = v76;
        *(_WORD *)&v236[4] = 2112;
        *(void *)&v236[6] = v64;
        _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "Requesting remote items for %{public}d new Items: %{pubic}@",  buf,  0x12u);
      }

      v77 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      v78 = (void *)objc_claimAutoreleasedReturnValue( -[MZUniversalPlaybackPositionSyncHandler _synchronouslyRunKVSTransaction:]( self,  "_synchronouslyRunKVSTransaction:",  v77));

      if (v78)
      {
        if (!v218) {
          goto LABEL_73;
        }
        goto LABEL_71;
      }

      if (-[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop")) {
        goto LABEL_73;
      }
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
      [v79 mergeMetadataItemsFromGetResponse];
    }

    uint64_t v80 = kdebug_trace(723517712LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v81 = _MTLogCategoryUPPSync(v80);
    v82 = (os_log_s *)objc_claimAutoreleasedReturnValue(v81);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Finish STEP 1.", buf, 2u);
    }

    uint64_t v84 = _MTLogCategoryUPPSync(v83);
    v85 = (os_log_s *)objc_claimAutoreleasedReturnValue(v84);
    v86 = v85;
    if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v86,  OS_SIGNPOST_INTERVAL_END,  v54,  "UPP.Sync.Step.1.End",  "",  buf,  2u);
    }

    uint64_t v88 = _MTLogCategoryCloudSync(v87);
    v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
    os_signpost_id_t v90 = os_signpost_id_generate(v89);

    uint64_t v92 = _MTLogCategoryUPPSync(v91);
    v93 = (os_log_s *)objc_claimAutoreleasedReturnValue(v92);
    v94 = v93;
    if (v90 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v94,  OS_SIGNPOST_INTERVAL_BEGIN,  v90,  "UPP.Sync.Step.2.Begin",  "",  buf,  2u);
    }

    uint64_t v95 = kdebug_trace(723517716LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v96 = _MTLogCategoryUPPSync(v95);
    v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v96);
    if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "Begin STEP 2.1. Perform iTMS-kvs getAll for remote changes.",  buf,  2u);
    }

    uint64_t v99 = _MTLogCategoryUPPSync(v98);
    v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
    if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "      Start newKVSGetAllTransactionSinceDomainVersion...",  buf,  2u);
    }

    v101 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
    v102 = (void *)objc_claimAutoreleasedReturnValue([v101 metrics]);
    [v102 setLatestUPPSubtask:3];

    v103 = (void *)objc_claimAutoreleasedReturnValue( -[MZUniversalPlaybackPositionSyncHandler dataSourceTransactionContext]( self,  "dataSourceTransactionContext"));
    v104 = (void *)objc_claimAutoreleasedReturnValue([v103 lastSyncedDomainVersion]);
    id v105 = -[MZUniversalPlaybackPositionSyncHandler newKVSGetAllTransactionSinceDomainVersion:]( self,  "newKVSGetAllTransactionSinceDomainVersion:",  v104);
    -[MZUniversalPlaybackPositionSyncHandler setCurrentKVSTransaction:](self, "setCurrentKVSTransaction:", v105);

    BOOL v106 = -[MZUniversalPlaybackPositionSyncHandler _shouldStop](self, "_shouldStop");
    if (v106) {
      goto LABEL_60;
    }
    uint64_t v107 = _MTLogCategoryUPPSync(v106);
    v108 = (os_log_s *)objc_claimAutoreleasedReturnValue(v107);
    if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEFAULT,  "      Finish newKVSGetAllTransactionSinceDomainVersion.",  buf,  2u);
    }

    uint64_t v110 = _MTLogCategoryUPPSync(v109);
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue(v110);
    if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
    {
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      id v113 = (id)objc_claimAutoreleasedReturnValue([v112 sinceDomainVersion]);
      *(_DWORD *)buf = 138543362;
      *(void *)v236 = v113;
      _os_log_impl( (void *)&_mh_execute_header,  v111,  OS_LOG_TYPE_DEFAULT,  "Requesting remote items from server -since domain-version = %{public}@",  buf,  0xCu);
    }

    uint64_t v115 = _MTLogCategoryUPPSync(v114);
    v116 = (os_log_s *)objc_claimAutoreleasedReturnValue(v115);
    if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_DEFAULT,  "      Start _synchronouslyRunKVSTransaction...",  buf,  2u);
    }

    v117 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    v78 = (void *)objc_claimAutoreleasedReturnValue( -[MZUniversalPlaybackPositionSyncHandler _synchronouslyRunKVSTransaction:]( self,  "_synchronouslyRunKVSTransaction:",  v117));

    uint64_t v119 = _MTLogCategoryUPPSync(v118);
    v120 = (os_log_s *)objc_claimAutoreleasedReturnValue(v119);
    if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v120,  OS_LOG_TYPE_DEFAULT,  "      Finish _synchronouslyRunKVSTransaction.",  buf,  2u);
    }

    if (v78)
    {
      if (!v218)
      {
LABEL_73:
        -[MZUniversalPlaybackPositionSyncHandler _dataSourceCancelTransaction]( self,  "_dataSourceCancelTransaction",  v218);
        BOOL v6 = 0;
LABEL_74:

        goto LABEL_75;
      }

- (void)_fillEmptyMetadataIdentifiersIfNeeded
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 importContext]);

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100039B14;
  v6[3] = &unk_100240240;
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateForNilValueOrEmptyStringForKey:]( &OBJC_CLASS___NSPredicate,  "predicateForNilValueOrEmptyStringForKey:",  kEpisodeMetadataIdentifier));
  id v4 = v8;
  id v5 = v3;
  [v5 performBlockAndWaitWithSave:v6];
}

- (BOOL)_shouldStop
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100039DCC;
  v5[3] = &unk_1002404E0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setCanRequestStoreSignIn:(BOOL)a3
{
  BOOL v3 = a3;
  self->_canRequestStoreSignIn = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  [v4 setCanRequestStoreSignIn:v3];
}

- (void)cancelWithError:(id)a3
{
  id v8 = a3;
  -[MZUniversalPlaybackPositionSyncHandler setCanceled:](self, "setCanceled:", 1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  if ([v4 isIdle])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));

    if (!v5) {
      goto LABEL_7;
    }
    if (!v8)
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
      id v8 = (id)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError transactionCancelledErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "transactionCancelledErrorWithTransaction:underlyingError:",  v6,  0LL));
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:withError:]( self,  "_signalKVSTransactionCompletion:withError:",  v4,  v8);
  }

LABEL_7:
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  if (v8) {
    objc_msgSend(v7, "cancelAllTransactionsCancelCode:", objc_msgSend(v8, "code"));
  }
  else {
    [v7 cancelAllTransactions];
  }
}

- (void)timeout
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError transactionTimeoutErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "transactionTimeoutErrorWithTransaction:underlyingError:",  v4,  0LL));
  -[MZUniversalPlaybackPositionSyncHandler cancelWithError:](self, "cancelWithError:", v3);
}

- (void)cancel
{
}

- (void)synchronizeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v11[0] = 0LL;
  v11[1] = v11;
  v11[2] = 0x2020000000LL;
  char v12 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003A108;
  block[3] = &unk_1002404E0;
  block[4] = self;
  block[5] = v11;
  dispatch_sync(queue, block);
  syncOperationQueue = (dispatch_queue_s *)self->_syncOperationQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10003A138;
  v8[3] = &unk_100240138;
  v8[4] = self;
  id v7 = v4;
  id v9 = v7;
  dispatch_async(syncOperationQueue, v8);
  kdebug_trace(723517692LL, 0LL, 0LL, 0LL, 0LL);

  _Block_object_dispose(v11, 8);
}

- (id)newKVSTransactionWithType:(int)a3 keys:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  kvsController = self->_kvsController;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultDomain](kvsController, "defaultDomain"));
  id v9 = self->_kvsController;
  if ((_DWORD)v4 == 1) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultGetURL](v9, "defaultGetURL"));
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreController defaultSetURL](v9, "defaultSetURL"));
  }
  uint64_t v11 = (void *)v10;
  char v12 = -[MZKeyValueStoreTransaction initWithType:domain:URL:keys:]( objc_alloc(&OBJC_CLASS___MZKeyValueStoreTransaction),  "initWithType:domain:URL:keys:",  v4,  v8,  v10,  v7);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler transactionProcessor](self, "transactionProcessor"));
  -[MZKeyValueStoreTransaction setProcessor:](v12, "setProcessor:", v13);

  uint64_t v14 = -[NSConditionLock initWithCondition:](objc_alloc(&OBJC_CLASS___NSConditionLock), "initWithCondition:", 0LL);
  -[MZKeyValueStoreTransaction setUserInfoValue:forKey:]( v12,  "setUserInfoValue:forKey:",  v14,  @"completionConditionLock");

  return v12;
}

- (id)newKVSPutAllTransactionWithMetadataItems:(id)a3
{
  id v4 = a3;
  if (![v4 count])
  {
    id v5 = 0LL;
    goto LABEL_32;
  }

  v32 = self;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id v33 = v4;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (!v7) {
    goto LABEL_30;
  }
  id v8 = v7;
  uint64_t v9 = *(void *)v35;
  do
  {
    uint64_t v10 = 0LL;
    do
    {
      if (*(void *)v35 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)v10);
      if (objc_msgSend(v11, "isNew", v32))
      {
        id v12 = [v11 bookmarkTime];
        double v14 = v13;
        uint64_t v15 = os_feature_enabled_skip_empty_upp_sync(v12);
        if ((v15 & 1) == 0)
        {
          if (v14 > 0.0) {
            goto LABEL_22;
          }
          goto LABEL_10;
        }
      }

      else if (!((uint64_t (*)(void))os_feature_enabled_skip_empty_upp_sync)())
      {
        goto LABEL_22;
      }

      [v11 bookmarkTime];
      if (v22 > 0.0
        || ([v11 hasBeenPlayed] & 1) != 0
        || [v11 playCount]
        || ([v11 lastDatePlayed], v23 > 0.0)
        || ([v11 lastUserMarkedAsPlayedDate], v24 > 0.0)
        || (uint64_t v15 = (uint64_t)[v11 playStateManuallySet], (v15 & 1) != 0))
      {
LABEL_22:
        v25 = (void *)objc_claimAutoreleasedReturnValue([v11 itemIdentifier]);
        -[NSMutableArray addObject:](v5, "addObject:", v25);

        uint64_t v27 = _MTLogCategoryUPPSync(v26);
        dispatch_queue_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_25;
        }
        *(_DWORD *)buf = 138543362;
        id v39 = v11;
        v20 = v19;
        dispatch_queue_t v21 = "Adding UPP sync item...%{public}@";
        goto LABEL_24;
      }

- (id)newKVSGetAllTransactionWithMetadataItems:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForKey:@"itemIdentifier"]);
  id v5 = -[MZUniversalPlaybackPositionSyncHandler newKVSTransactionWithType:keys:]( self,  "newKVSTransactionWithType:keys:",  1LL,  v4);

  return v5;
}

- (id)newKVSGetAllTransactionSinceDomainVersion:(id)a3
{
  id v4 = @"0";
  if (a3) {
    id v4 = (__CFString *)a3;
  }
  id v5 = v4;
  id v6 = -[MZUniversalPlaybackPositionSyncHandler newKVSTransactionWithType:keys:]( self,  "newKVSTransactionWithType:keys:",  1LL,  0LL);
  [v6 setSinceDomainVersion:v5];

  return v6;
}

- (id)_synchronouslyRunKVSTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler kvsController](self, "kvsController"));
  [v5 scheduleTransaction:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfoValueForKey:@"completionConditionLock"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", 10.0));
  unsigned int v8 = [v6 lockWhenCondition:1 beforeDate:v7];

  if (v8)
  {
    [v6 unlock];
  }

  else
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MZKeyValueStoreError transactionTimeoutErrorWithTransaction:underlyingError:]( &OBJC_CLASS___MZKeyValueStoreError,  "transactionTimeoutErrorWithTransaction:underlyingError:",  v9,  0LL));
    -[MZUniversalPlaybackPositionSyncHandler setFatalSyncError:](self, "setFatalSyncError:", v10);
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler fatalSyncError](self, "fatalSyncError"));

  return v11;
}

- (void)_signalKVSTransactionCompletion:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a3 userInfoValueForKey:@"completionConditionLock"]);
  [v3 lock];
  [v3 unlockWithCondition:1];
}

- (void)_signalKVSTransactionCompletion:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    if (v6)
    {
      uint64_t v11 = _MTLogCategoryUPPSync(v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138543362;
        id v15 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "transaction is being canceled.  error = %{public}@",  (uint8_t *)&v14,  0xCu);
      }
    }

    -[MZUniversalPlaybackPositionSyncHandler setFatalSyncError:](self, "setFatalSyncError:", v6);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler currentKVSTransaction](self, "currentKVSTransaction"));
    -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:]( self,  "_signalKVSTransactionCompletion:",  v13);
  }
}

- (BOOL)keyValueStoreController:(id)a3 shouldScheduleTransaction:(id)a4
{
  return 1;
}

- (BOOL)keyValueStoreController:(id)a3 transaction:(id)a4 didFailWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 isAccountsChangedError];
  if ((_DWORD)v11)
  {
    uint64_t v12 = _MTLogCategoryUPPSync(v11);
    double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v9 sinceDomainVersion]);
      int v20 = 138543362;
      id v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Detected account change.  Getting remote items since version 0 instead of %{public}@\n",  (uint8_t *)&v20,  0xCu);
    }

    [v9 setSinceDomainVersion:@"0"];
    goto LABEL_8;
  }

  if ([v10 isAuthenticationError])
  {
    BOOL v15 = -[MZUniversalPlaybackPositionSyncHandler canRequestStoreSignIn](self, "canRequestStoreSignIn");
    if (!v15)
    {
      uint64_t v17 = _MTLogCategoryUPPSync(v15);
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543362;
        id v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Detected authentication error (%{public}@) -- Bailing out",  (uint8_t *)&v20,  0xCu);
      }

      [v8 resolveError:v10 transaction:v9 resolution:2];
      goto LABEL_12;
    }
  }

  if (([v10 isRecoverableError] & 1) == 0)
  {
LABEL_12:
    -[MZUniversalPlaybackPositionSyncHandler _signalKVSTransactionCompletion:withError:]( self,  "_signalKVSTransactionCompletion:withError:",  v9,  v10);
    BOOL v16 = 1;
    goto LABEL_13;
  }

- (void)keyValueStoreController:(id)a3 transaction:(id)a4 didCancelWithError:(id)a5
{
}

- (void)keyValueStoreController:(id)a3 transactionDidFinish:(id)a4
{
}

- (void)setNumMetadataItemsFromKVSStorage:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);
  [v4 setNumMetadataItemsFromKVSStorage:a3];
}

- (void)setNumMetadataItemsToCommitToDataSource:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);
  [v4 setNumMetadataItemsToCommitToDataSource:a3];
}

- (void)setNumMetadataItemsToCommitToKVSStorage:(int64_t)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MZUniversalPlaybackPositionSyncHandler task](self, "task"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 metrics]);
  [v4 setNumMetadataItemsToCommitToKVSStorage:a3];
}

- (MZKeyValueStoreController)kvsController
{
  return (MZKeyValueStoreController *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setKvsController:(id)a3
{
}

- (MZUniversalPlaybackPositionDataSource)dataSource
{
  return (MZUniversalPlaybackPositionDataSource *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setDataSource:(id)a3
{
}

- (MZUniversalPlaybackPositionTransactionContext)dataSourceTransactionContext
{
  return (MZUniversalPlaybackPositionTransactionContext *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDataSourceTransactionContext:(id)a3
{
}

- (MZUPPBagContext)bagContext
{
  return (MZUPPBagContext *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setBagContext:(id)a3
{
}

- (MZUPPAsynchronousTask)task
{
  return (MZUPPAsynchronousTask *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setTask:(id)a3
{
}

- (BOOL)canRequestStoreSignIn
{
  return self->_canRequestStoreSignIn;
}

- (MZKeyValueStoreTransaction)currentKVSTransaction
{
  return (MZKeyValueStoreTransaction *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCurrentKVSTransaction:(id)a3
{
}

- (BOOL)syncInProgress
{
  return self->_syncInProgress;
}

- (void)setSyncInProgress:(BOOL)a3
{
  self->_syncInProgress = a3;
}

- (BOOL)canceled
{
  return self->_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (NSError)fatalSyncError
{
  return (NSError *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setFatalSyncError:(id)a3
{
}

- (MZUppSyncProcessor)transactionProcessor
{
  return (MZUppSyncProcessor *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setTransactionProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end