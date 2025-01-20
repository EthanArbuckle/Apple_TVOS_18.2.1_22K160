@interface CPLCloudKitCleanupStagedScopeTask
- (BOOL)isAuxiliaryOperationResultRelevant;
- (BOOL)shouldLaunchAuxiliaryOperation;
- (CKOperation)auxiliaryOperation;
- (CKOperation)mainOperation;
- (CPLCloudKitCleanupStagedScopeTask)initWithController:(id)a3 stagedScope:(id)a4 stagingScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9;
- (CPLEngineScope)destinationScope;
- (CPLEngineScope)stagedScope;
- (CPLEngineScope)stagingScope;
- (NSDate)dateSinceLastAuxiliaryOperation;
- (id)auxiliaryOperationDidFinishWithError:(id)a3;
- (id)operationDidFinishWithError:(id)a3;
- (void)_fetchAndMoveNextBatchWithUserRecordID:(id)a3;
- (void)_moveBatchRecordWithNames:(id)a3 userRecordID:(id)a4 operationID:(id)a5 moveBatchID:(id)a6 hasMore:(BOOL)a7;
- (void)_sendExitFeedbackWithSourceRecordIDs:(id)a3 destinationRecordIDs:(id)a4 moveError:(id)a5 operationID:(id)a6 moveBatchID:(id)a7;
- (void)dispatchAsync:(id)a3;
- (void)launchAuxiliaryOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5;
- (void)runAuxiliaryOperation;
- (void)runOperations;
- (void)updateContextWithBlock:(id)a3;
- (void)updateOneBatch;
- (void)updateProgress:(double)a3;
@end

@implementation CPLCloudKitCleanupStagedScopeTask

- (CPLCloudKitCleanupStagedScopeTask)initWithController:(id)a3 stagedScope:(id)a4 stagingScope:(id)a5 destinationScope:(id)a6 transportScopeMapping:(id)a7 progressHandler:(id)a8 completionHandler:(id)a9
{
  id v28 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CPLCloudKitCleanupStagedScopeTask;
  v21 = -[CPLCloudKitTransportTask initWithController:](&v32, "initWithController:", a3);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_stagedScope, a4);
    objc_storeStrong((id *)&v22->_stagingScope, a5);
    objc_storeStrong((id *)&v22->_destinationScope, a6);
    -[CPLCloudKitTransportTask setTransportScopeMapping:](v22, "setTransportScopeMapping:", v18);
    id v23 = [v19 copy];
    id progressHandler = v22->_progressHandler;
    v22->_id progressHandler = v23;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000ACF28;
    v29[3] = &unk_1002426D8;
    id v30 = v19;
    id v31 = v20;
    id v25 = [v29 copy];
    id completionHandler = v22->_completionHandler;
    v22->_id completionHandler = v25;
  }

  return v22;
}

- (void)_sendExitFeedbackWithSourceRecordIDs:(id)a3 destinationRecordIDs:(id)a4 moveError:(id)a5 operationID:(id)a6 moveBatchID:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = objc_alloc(&OBJC_CLASS___CPLCloudKitSendSharedLibraryExitFeedbackTask);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_stagingCloudKitScope, "zoneID"));
  destinationCloudKitScope = self->_destinationCloudKitScope;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_1000AD1A8;
  v32[3] = &unk_100242700;
  id v33 = v13;
  id v34 = v12;
  id v21 = v12;
  id v22 = v13;
  id v23 = -[CPLCloudKitSendSharedLibraryExitFeedbackTask initWithController:sourceRecordIDs:destinationRecordIDs:moveError:operationID:moveBatchID:exitZoneID:scope:completionHandler:]( v17,  "initWithController:sourceRecordIDs:destinationRecordIDs:moveError:operationID:moveBatchID:exitZoneID:scope:completionHandler:",  v18,  v16,  v15,  v14,  v21,  v22,  v19,  destinationCloudKitScope,  v32);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask transportGroup](self, "transportGroup"));
  -[CPLCloudKitTransportTask setTransportGroup:](v23, "setTransportGroup:", v24);

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_1000AD314;
  v30[3] = &unk_10023DC70;
  id v31 = v23;
  v27 = v30;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000AF030;
  block[3] = &unk_10023DBC8;
  id v36 = v27;
  id v28 = v23;
  dispatch_block_t v29 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v26, v29);
}

- (void)_moveBatchRecordWithNames:(id)a3 userRecordID:(id)a4 operationID:(id)a5 moveBatchID:(id)a6 hasMore:(BOOL)a7
{
  id v11 = a3;
  id v12 = a4;
  id v33 = a5;
  id v31 = a6;
  id v13 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
  id v14 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v11 count]);
  objc_super v32 = v12;
  v35 = -[CPLCloudKitMoveBackCopyHelper initWithUserRecordID:scopeProvider:]( objc_alloc(&OBJC_CLASS___CPLCloudKitMoveBackCopyHelper),  "initWithUserRecordID:scopeProvider:",  v12,  self);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v15 = v11;
  id v16 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v45 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)i);
        id v21 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitScope recordIDWithRecordName:]( self->_stagingCloudKitScope,  "recordIDWithRecordName:",  v20));
        -[NSMutableArray addObject:](v13, "addObject:", v21);
        id v22 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitScope recordIDWithRecordName:]( self->_destinationCloudKitScope,  "recordIDWithRecordName:",  v20));
        -[NSMutableArray addObject:](v14, "addObject:", v22);
      }

      id v17 = [v15 countByEnumeratingWithState:&v44 objects:v48 count:16];
    }

    while (v17);
  }

  id v23 = v15;

  uint64_t v24 = CPLCloudKitOperationTypeForScope(self->_stagingCloudKitScope);
  uint64_t v25 = CPLCloudKitOperationTypeForScope(self->_destinationCloudKitScope);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1000AD60C;
  v36[3] = &unk_100242728;
  v37 = v13;
  v38 = v14;
  v39 = self;
  id v40 = v33;
  BOOL v43 = a7;
  id v41 = v31;
  id v42 = v32;
  id v26 = v32;
  id v27 = v31;
  id v28 = v33;
  dispatch_block_t v29 = v14;
  id v30 = v13;
  -[CPLCloudKitTransportTask moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "moveRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:",  v30,  0LL,  v24,  v29,  v25,  v35,  v36);
}

- (void)_fetchAndMoveNextBatchWithUserRecordID:(id)a3
{
  id v4 = a3;
  id v12 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v12);
  id v6 = v12;
  if ((v5 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope zoneID](self->_stagingCloudKitScope, "zoneID"));
    int64_t batchSize = self->_batchSize;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000AD914;
    v10[3] = &unk_100242750;
    v10[4] = self;
    id v11 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCKPhotosSharedLibraryOperation getNextBatchToMoveOperationWithZoneID:batchSize:completionHandler:]( &OBJC_CLASS___CPLCKPhotosSharedLibraryOperation,  "getNextBatchToMoveOperationWithZoneID:batchSize:completionHandler:",  v7,  batchSize,  v10));

    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v9,  CPLCloudKitOperationTypeForScope(self->_stagingCloudKitScope),  0LL);
  }

  else
  {
    (*((void (**)(void))self->_completionHandler + 2))();
  }
}

- (void)runAuxiliaryOperation
{
  if (!self->_mainOperation) {
    sub_100197DD0();
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification libraryInfoRecordName]( self->_stagingZoneIdentification,  "libraryInfoRecordName"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitZoneIdentification recordIDWithRecordName:]( self->_stagingZoneIdentification,  "recordIDWithRecordName:",  v3));
    unsigned __int8 v5 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
    id v17 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    v7 = -[CKFetchRecordsOperation initWithRecordIDs:](v5, "initWithRecordIDs:", v6);

    -[CKFetchRecordsOperation setShouldFetchAssetContent:](v7, "setShouldFetchAssetContent:", 0LL);
    id v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472LL;
    id v13 = sub_1000ADE5C;
    id v14 = &unk_100240BE8;
    id v15 = self;
    id v16 = v4;
    id v8 = v4;
    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v7, "setFetchRecordsCompletionBlock:", &v11);
    -[CPLCloudKitCleanupStagedScopeTask launchAuxiliaryOperation:type:withContext:]( self,  "launchAuxiliaryOperation:type:withContext:",  v7,  -[CPLCloudKitZoneIdentification operationType]( self->_stagingZoneIdentification,  "operationType",  v11,  v12,  v13,  v14,  v15),  0LL);
  }

  else
  {
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    dateSinceLastAuxiliaryOperation = self->_dateSinceLastAuxiliaryOperation;
    self->_dateSinceLastAuxiliaryOperation = v9;
  }
}

- (void)runOperations
{
  self->_int64_t batchSize = 100LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  int64_t v4 = (int64_t)[v3 integerForKey:@"CPLCleanupStagedScopeBatchSize"];

  if (v4 >= 1)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_1000AD2D4();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v22 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Using batch size: %ld", buf, 0xCu);
      }
    }

    self->_int64_t batchSize = v4;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_stagingScope, "scopeIdentifier"));
  id v8 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v7));
  stagingCloudKitScope = self->_stagingCloudKitScope;
  self->_stagingCloudKitScope = v8;

  if (self->_stagingCloudKitScope)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](self->_destinationScope, "scopeIdentifier"));
    id v11 = (CPLCloudKitScope *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v10));
    destinationCloudKitScope = self->_destinationCloudKitScope;
    self->_destinationCloudKitScope = v11;

    if (self->_destinationCloudKitScope)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
      id v14 = (CPLCloudKitZoneIdentification *)objc_claimAutoreleasedReturnValue( [v13 zoneIdentificationForCloudKitScope:self->_stagingCloudKitScope engineScope:self->_stagingScope]);
      stagingZoneIdentification = self->_stagingZoneIdentification;
      self->_stagingZoneIdentification = v14;

      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000AE334;
      v20[3] = &unk_10023FB58;
      v20[4] = self;
      -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v20);
      return;
    }

    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    destinationScope = self->_destinationScope;
  }

  else
  {
    id completionHandler = (void (**)(id, void *))self->_completionHandler;
    destinationScope = self->_stagingScope;
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineScope scopeIdentifier](destinationScope, "scopeIdentifier"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  32LL,  @"Missing transport scope for %@",  v18));
  completionHandler[2](completionHandler, v19);
}

- (void)dispatchAsync:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AE3EC;
  v5[3] = &unk_10023DFE0;
  id v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___CPLCloudKitCleanupStagedScopeTask;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[CPLCloudKitTransportTask dispatchAsync:](&v4, "dispatchAsync:", v5);
}

- (void)updateOneBatch
{
  if (self->_mainOperation)
  {
    -[CPLCloudKitTransportTask updateOneBatchForOperation:](self, "updateOneBatchForOperation:");
  }

  else
  {
    v2 = (CPLCloudKitCleanupStagedScopeTask *)sub_100197F88(a2, self);
    -[CPLCloudKitCleanupStagedScopeTask updateContextWithBlock:](v2, v3, v4);
  }

- (void)updateContextWithBlock:(id)a3
{
  id v5 = a3;
  if (self->_mainOperation)
  {
    id v9 = v5;
    -[CPLCloudKitTransportTask updateContextWithBlock:forOperation:](self, "updateContextWithBlock:forOperation:", v5);
  }

  else
  {
    id v6 = (CPLCloudKitCleanupStagedScopeTask *)sub_100198080(a2, self);
    -[CPLCloudKitCleanupStagedScopeTask updateProgress:](v6, v7, v8);
  }

- (void)updateProgress:(double)a3
{
  if (self->_mainOperation)
  {
    -[CPLCloudKitTransportTask updateProgress:forOperation:](self, "updateProgress:forOperation:", a3);
  }

  else
  {
    SEL v3 = (CPLCloudKitCleanupStagedScopeTask *)sub_100198178(a2, self, a3);
    -[CPLCloudKitCleanupStagedScopeTask operationDidFinishWithError:](v3, v4, v5);
  }

- (id)operationDidFinishWithError:(id)a3
{
  id v5 = a3;
  mainOperation = self->_mainOperation;
  if (mainOperation)
  {
    SEL v7 = v5;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitCleanupStagedScopeTask operationDidFinish:error:]( self,  "operationDidFinish:error:",  mainOperation,  v5));

    return v8;
  }

  else
  {
    v10 = (CPLCloudKitCleanupStagedScopeTask *)sub_100198270(a2, self);
    -[CPLCloudKitCleanupStagedScopeTask launchAuxiliaryOperation:type:withContext:](v10, v11, v12, v13, v14);
  }

  return result;
}

- (void)launchAuxiliaryOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5
{
  id v10 = a3;
  id v11 = a5;
  if (self->_auxiliaryOperation) {
    sub_100198368(self, a2);
  }
  objc_storeStrong((id *)&self->_auxiliaryOperation, a3);
  id v12 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  dateSinceLastAuxiliaryOperation = self->_dateSinceLastAuxiliaryOperation;
  self->_dateSinceLastAuxiliaryOperation = v12;

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask sourceBundleIdentifier](self, "sourceBundleIdentifier"));
  id v15 = v14;
  if (!v14)
  {
    a2 = (SEL)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([(id)a2 defaultSourceBundleIdentifier]);
  }

  uint64_t v18 = v15;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CPLCloudKitCleanupStagedScopeTask;
  -[CPLCloudKitTransportTask launchOperation:type:withContext:sourceBundleIdentifiers:]( &v17,  "launchOperation:type:withContext:sourceBundleIdentifiers:",  v10,  a4,  v11,  v16);

  if (!v14)
  {
  }
}

- (id)auxiliaryOperationDidFinishWithError:(id)a3
{
  id v5 = a3;
  auxiliaryOperation = self->_auxiliaryOperation;
  if (auxiliaryOperation)
  {
    SEL v7 = v5;
    double v8 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitCleanupStagedScopeTask operationDidFinish:error:]( self,  "operationDidFinish:error:",  auxiliaryOperation,  v5));
    id v9 = self->_auxiliaryOperation;
    self->_auxiliaryOperation = 0LL;

    return v8;
  }

  else
  {
    id v11 = (CPLCloudKitCleanupStagedScopeTask *)sub_10019844C(a2, self);
    return (id)-[CPLCloudKitCleanupStagedScopeTask shouldLaunchAuxiliaryOperation](v11, v12);
  }

- (BOOL)shouldLaunchAuxiliaryOperation
{
  dateSinceLastAuxiliaryOperation = self->_dateSinceLastAuxiliaryOperation;
  if (!dateSinceLastAuxiliaryOperation) {
    return 1;
  }
  -[NSDate timeIntervalSinceNow](dateSinceLastAuxiliaryOperation, "timeIntervalSinceNow");
  return v3 < -30.0;
}

- (BOOL)isAuxiliaryOperationResultRelevant
{
  return self->_mainOperation != 0LL;
}

- (CPLEngineScope)stagedScope
{
  return self->_stagedScope;
}

- (CPLEngineScope)stagingScope
{
  return self->_stagingScope;
}

- (CPLEngineScope)destinationScope
{
  return self->_destinationScope;
}

- (CKOperation)mainOperation
{
  return self->_mainOperation;
}

- (CKOperation)auxiliaryOperation
{
  return self->_auxiliaryOperation;
}

- (NSDate)dateSinceLastAuxiliaryOperation
{
  return self->_dateSinceLastAuxiliaryOperation;
}

- (void).cxx_destruct
{
}

@end