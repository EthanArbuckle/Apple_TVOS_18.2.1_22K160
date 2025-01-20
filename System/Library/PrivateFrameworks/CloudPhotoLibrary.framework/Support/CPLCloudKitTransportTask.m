@interface CPLCloudKitTransportTask
+ (BOOL)allowsCellularForDownloadOperationOfResource:(id)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5;
+ (BOOL)allowsCellularForDownloadOperationOfSize:(unint64_t)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5;
+ (NSDictionary)mappingForMoveSteps;
+ (NSDictionary)reverseMappingForMoveSteps;
+ (id)copiedRecordFromSourceRecord:(id)a3 sourceDatabaseScope:(int64_t)a4 toRecordID:(id)a5 helper:(id)a6 action:(id)a7 error:(id *)a8;
+ (id)moveStepFaultInjector;
+ (void)initialize;
+ (void)setMoveStepFaultInjector:(id)a3;
- (BOOL)_mergeFoundCKRecords:(id)a3 updateFoundCPLRecords:(id)a4 remainingScopedIdentifiers:(id)a5 fetchedScopedIdentifiers:(id)a6 userRecordID:(id)a7 targetMapping:(id)a8 error:(id *)a9;
- (BOOL)_operationsShouldBeDiscretionary;
- (BOOL)allowsCellular;
- (BOOL)allowsFetchCache;
- (BOOL)deleteTemporaryFolderWithError:(id *)a3;
- (BOOL)foreground;
- (BOOL)hasBackgroundActivity;
- (BOOL)isBackgroundTask;
- (BOOL)isBoostable;
- (BOOL)isForcedTask;
- (BOOL)isHighPriorityBackground;
- (BOOL)isMetadata;
- (BOOL)isUpload;
- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3;
- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4;
- (BOOL)shouldRunOperationsWithError:(id *)a3;
- (CKOperation)currentOperation;
- (CKOperationGroup)operationGroup;
- (CPLCKRecordFetchCache)fetchCache;
- (CPLCloudKitTaskController)controller;
- (CPLCloudKitTransportTask)initWithController:(id)a3;
- (CPLCloudKitTransportTaskGate)gate;
- (CPLEngineStoreUserIdentifier)transportUserIdentifier;
- (CPLEngineTransportGroup)transportGroup;
- (CPLFingerprintContext)fingerprintContext;
- (CPLSyncSession)session;
- (CPLTransportScopeMapping)transportScopeMapping;
- (NSArray)lastOperationRequestUUIDs;
- (NSDictionary)transportScopes;
- (NSString)idleDescription;
- (NSString)mainScopeIdentifier;
- (NSString)sourceBundleIdentifier;
- (OS_dispatch_queue)synchronousWorkQueue;
- (double)timeoutIntervalForRequest;
- (double)timeoutIntervalForResource;
- (id)_destinationRecordsFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 action:(id)a10 error:(id *)a11;
- (id)_errorForUpdateError:(id)a3 scopeProvider:(id)a4;
- (id)_interpretedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5;
- (id)_interpretedSharedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5;
- (id)_moveChangesFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 error:(id *)a10;
- (id)_networkBehaviorForConfiguration:(id)a3;
- (id)_recordWithRecordID:(id)a3 usingRealRecords:(id)a4 remappedRecordIDs:(id)a5 wantsAllRecords:(BOOL)a6;
- (id)_scopeIdentifierFromZoneID:(id)a3;
- (id)_sharedRecordToPrivateRecord:(id)a3 scopedIdentifier:(id)a4;
- (id)_stringForQoS:(int64_t)a3;
- (id)baseConfigurationForTask;
- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5;
- (id)blockWithAdaptedQOS:(id)a3;
- (id)callbackOperationDidFinishWithError:(id)a3;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4;
- (id)operationDidFinish:(id)a3 error:(id)a4;
- (id)operationDidFinishWithError:(id)a3;
- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)trackingContext;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (void)_acquireActivityAndLaunchOperation;
- (void)_applyMoveChanges:(id)a3 sourceType:(int64_t)a4 destinationType:(int64_t)a5 helper:(id)a6 operationContext:(id)a7 completionHandler:(id)a8;
- (void)_cancelAllOperationsIfBlocked;
- (void)_cancelCallbackProgress;
- (void)_createSparsePrivateRecordsIfNecessary:(id)a3 recordClass:(Class)a4 userRecordID:(id)a5 completionHandler:(id)a6;
- (void)_enumerateAllZonesForSharedDatabase:(BOOL)a3 block:(id)a4 completionHandler:(id)a5;
- (void)_fetchNextOperationType:(id)a3 followRemapping:(BOOL)a4 recordIDMapping:(id)a5 inResult:(id)a6 storeRequestUUIDsIn:(id)a7 completionHandler:(id)a8;
- (void)_fetchRecordWithScopedIdentifiers:(id)a3 followRemapping:(BOOL)a4 completionHandler:(id)a5;
- (void)_fetchRecordsFollowRemappingWithIDs:(id)a3 alreadyFetchRecordIDs:(id)a4 remappedRecordIDs:(id)a5 realRecords:(id)a6 type:(int64_t)a7 storeRequestUUIDsIn:(id)a8 completionHandler:(id)a9;
- (void)_fetchRecordsForRemainingScopedIdentifiers:(id)a3 alreadyFetchedScopedIdentifiers:(id)a4 userRecordID:(id)a5 foundCPLRecords:(id)a6 foundCKRecords:(id)a7 targetMapping:(id)a8 completionHandler:(id)a9;
- (void)_fetchZoneForZoneID:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5;
- (void)_mergePrivateRecord:(id)a3 withSharedRecord:(id)a4 merger:(id)a5;
- (void)_reallyStartOperation;
- (void)_runWithSyncSession:(id)a3;
- (void)_uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 operationContext:(id)a6 uploadAction:(id)a7 completionHandler:(id)a8;
- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)associateMetric:(id)a3;
- (void)cancel;
- (void)cancelIfBlocked;
- (void)copyRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9;
- (void)copyRecordsWithIDs:(id)a3 sourceType:(int64_t)a4 destinationRecordIDs:(id)a5 destinationType:(int64_t)a6 completionHandler:(id)a7;
- (void)dispatchAfter:(double)a3 block:(id)a4;
- (void)dispatchAsync:(id)a3;
- (void)dispatchCallbackOperation:(id)a3 progress:(id)a4;
- (void)dispatchSynchronousWork:(id)a3;
- (void)enumerateAllZonesWithBlock:(id)a3 completionHandler:(id)a4;
- (void)executeSynchronousWork:(id)a3 description:(id)a4 completionHandler:(id)a5;
- (void)executeSynchronousWork:(id)a3 onItems:(id)a4 description:(id)a5 completionHandler:(id)a6;
- (void)fetchFullRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5;
- (void)fetchPlaceholderRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5;
- (void)fetchRecordWithNames:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordWithNames:(id)a3 inScope:(id)a4 completionHandler:(id)a5;
- (void)fetchRecordWithScopedIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchRecordsFollowRemappingWithIDs:(id)a3 wantsAllRecords:(BOOL)a4 type:(int64_t)a5 completionHandler:(id)a6;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 completionHandler:(id)a8;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 perFoundRecordBlock:(id)a8 completionHandler:(id)a9;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6;
- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 wantsAllRecords:(BOOL)a5 type:(int64_t)a6 completionHandler:(id)a7;
- (void)fetchUnknownTargetsInMapping:(id)a3 completionHandler:(id)a4;
- (void)fetchUserRecordIDFetchWithCompletionHandler:(id)a3;
- (void)fetchZoneForScope:(id)a3 completionHandler:(id)a4;
- (void)getTemporaryFolderWithCompletionHandler:(id)a3;
- (void)getUserRecordIDFetchIfNecessaryWithCompletionHandler:(id)a3;
- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5;
- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5 sourceBundleIdentifiers:(id)a6;
- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9;
- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 finalizeMoveChanges:(id)a9 completionHandler:(id)a10;
- (void)popTaskOperation;
- (void)processErrorIfNeeded:(id)a3;
- (void)pushTaskOperation;
- (void)runOperations;
- (void)runWithNoSyncSession;
- (void)runWithinSyncSession:(id)a3;
- (void)setAllowsCellular:(BOOL)a3;
- (void)setAllowsFetchCache:(BOOL)a3;
- (void)setBackgroundTask:(BOOL)a3;
- (void)setBoostable:(BOOL)a3;
- (void)setFetchCache:(id)a3;
- (void)setForcedTask:(BOOL)a3;
- (void)setForeground:(BOOL)a3;
- (void)setGate:(id)a3;
- (void)setHasBackgroundActivity:(BOOL)a3;
- (void)setHighPriorityBackground:(BOOL)a3;
- (void)setIdleDescription:(id)a3;
- (void)setIsMetadata:(BOOL)a3;
- (void)setIsUpload:(BOOL)a3;
- (void)setSourceBundleIdentifier:(id)a3;
- (void)setTrackingContext:(id)a3;
- (void)setTransportScopeMapping:(id)a3;
- (void)setTransportScopes:(id)a3;
- (void)setTransportUserIdentifier:(id)a3;
- (void)setupConfigurationForOperation:(id)a3;
- (void)taskDidFinish;
- (void)updateContextWithBlock:(id)a3;
- (void)updateContextWithBlock:(id)a3 forOperation:(id)a4;
- (void)updateOneBatch;
- (void)updateOneBatchForOperation:(id)a3;
- (void)updatePrivatePropertiesOnAssetsWithScopedIdentifiers:(id)a3 desiredKeys:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 knownRecords:(id)a8 shouldUpdateRecord:(id)a9 updateBlock:(id)a10 completionHandler:(id)a11;
- (void)updateProgress:(double)a3;
- (void)updateProgress:(double)a3 forOperation:(id)a4;
- (void)updateRecords:(id)a3 cloudKitScope:(id)a4 completionHandler:(id)a5;
- (void)uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 completionHandler:(id)a6;
- (void)uploadRecords:(id)a3 cloudKitScope:(id)a4 scopeProvider:(id)a5 completionHandler:(id)a6;
@end

@implementation CPLCloudKitTransportTask

+ (id)copiedRecordFromSourceRecord:(id)a3 sourceDatabaseScope:(int64_t)a4 toRecordID:(id)a5 helper:(id)a6 action:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v71 = v13;
  v66 = a8;
  uint64_t v17 = objc_claimAutoreleasedReturnValue([v15 baseDestinationCKRecordForSourceCKRecord:v13 destinationCKRecordID:v14 error:a8]);
  if (v17)
  {
    v18 = (void *)v17;
    if (!_CPLSilentLogging)
    {
      id v19 = sub_10003AF08();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v13 cplFullDescription]);
        *(_DWORD *)buf = 138412546;
        id v91 = v16;
        __int16 v92 = 2112;
        v93 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@ from record: %@", buf, 0x16u);
      }
    }

    id v65 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneID]);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472LL;
    v83[2] = sub_10003AF48;
    v83[3] = &unk_10023F6D8;
    id v61 = (id)objc_claimAutoreleasedReturnValue([v13 recordID]);
    id v84 = v61;
    int64_t v87 = a4;
    id v63 = v15;
    id v23 = v15;
    id v85 = v23;
    id v62 = v22;
    id v86 = v62;
    v24 = objc_retainBlock(v83);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v13 encryptedValues]);
    v26 = v18;
    v69 = (void *)objc_claimAutoreleasedReturnValue([v18 encryptedValues]);
    v27 = objc_alloc(&OBJC_CLASS___NSSet);
    v70 = v25;
    v28 = (void *)objc_claimAutoreleasedReturnValue([v25 allKeys]);
    v29 = -[NSSet initWithArray:](v27, "initWithArray:", v28);

    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    v30 = v29;
    id v31 = -[NSSet countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v79,  v89,  16LL);
    id v64 = v14;
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v80;
      while (2)
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v80 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v79 + 1) + 8LL * (void)i);
          if ([v23 shouldCopyCKRecordKeyToDestinationCKRecord:v35])
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:v35]);
            id v78 = 0LL;
            int v37 = ((uint64_t (*)(void *, void *, uint64_t, void *, id *))v24[2])(v24, v69, v35, v36, &v78);
            id v38 = v78;
            if (!v37)
            {
              id v67 = v38;

              v26 = 0LL;
              goto LABEL_20;
            }
          }
        }

        id v32 = -[NSSet countByEnumeratingWithState:objects:count:]( v30,  "countByEnumeratingWithState:objects:count:",  &v79,  v89,  16LL);
        if (v32) {
          continue;
        }
        break;
      }

      id v67 = 0LL;
      v26 = v18;
    }

    else
    {
      id v67 = 0LL;
    }

- (id)_destinationRecordsFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 action:(id)a10 error:(id *)a11
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  id v21 = a10;
  uint64_t v22 = CPLCKDatabaseScopeForCPLCloudKitOperationType(a5);
  id v23 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v16 count]);
  v24 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v16 count]);
  uint64_t v51 = 0LL;
  int v52 = &v51;
  uint64_t v53 = 0x3032000000LL;
  id v54 = sub_10003B420;
  v55 = sub_10003B430;
  id v56 = 0LL;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_10003B438;
  v39[3] = &unk_10023F700;
  id v25 = v16;
  id v40 = v25;
  id v26 = v18;
  SEL v49 = a2;
  id v41 = v26;
  id v42 = self;
  id v27 = v19;
  id v43 = v27;
  v28 = v24;
  v29 = v17;
  v30 = v28;
  v44 = v28;
  uint64_t v50 = v22;
  id v31 = v21;
  id v45 = v31;
  id v32 = v20;
  id v46 = v32;
  uint64_t v33 = v23;
  v47 = v33;
  v48 = &v51;
  [v29 enumerateObjectsUsingBlock:v39];
  v34 = (void *)v52[5];
  if (v34)
  {
    uint64_t v35 = 0LL;
    if (a11) {
      *a11 = v34;
    }
  }

  else
  {
    *a8 = v30;
    uint64_t v35 = v33;
  }

  _Block_object_dispose(&v51, 8);
  return v35;
}

- (void)_uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 operationContext:(id)a6 uploadAction:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v40 = 0LL;
  unsigned __int8 v19 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v40);
  id v20 = v40;
  if ((v19 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v21 = sub_10003AF08();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Will upload copied records: %@", buf, 0xCu);
      }
    }

    int64_t v30 = a4;
    id v23 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v14,  0LL);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask fetchCache](self, "fetchCache"));
    id v25 = v24;
    if (v24)
    {
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472LL;
      v38[2] = sub_10003B878;
      v38[3] = &unk_10023F728;
      v38[4] = self;
      id v26 = v16;
      id v27 = v15;
      id v28 = v24;
      id v39 = v28;
      -[CKModifyRecordsOperation setPerRecordSaveBlock:](v23, "setPerRecordSaveBlock:", v38);
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472LL;
      v36[2] = sub_10003B918;
      v36[3] = &unk_10023F750;
      v36[4] = self;
      id v29 = v28;
      id v15 = v27;
      id v16 = v26;
      id v37 = v29;
      -[CKModifyRecordsOperation setPerRecordDeleteBlock:](v23, "setPerRecordDeleteBlock:", v36);
    }

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10003B9B8;
    v31[3] = &unk_10023F7C8;
    v31[4] = self;
    id v32 = v14;
    id v35 = v18;
    id v33 = v15;
    id v34 = v17;
    -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v23, "setModifyRecordsCompletionBlock:", v31);
    -[CKModifyRecordsOperation setSavePolicy:](v23, "setSavePolicy:", 2LL);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v23,  v30,  v16);
  }

  else
  {
    (*((void (**)(id, id))v18 + 2))(v18, v20);
  }
}

- (void)uploadDestinationRecords:(id)a3 destinationType:(int64_t)a4 scopeProvider:(id)a5 completionHandler:(id)a6
{
}

- (void)copyRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9
{
  BOOL v13 = a4;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if ([v16 count])
  {
    id v20 = [v16 count];
    if (v20 == [v17 count])
    {
      if (!_CPLSilentLogging)
      {
        id v21 = sub_10003AF08();
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v39 = v16;
          __int16 v40 = 2112;
          id v41 = v17;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Will copy %@ to %@", buf, 0x16u);
        }
      }

      id v26 = _NSConcreteStackBlock;
      uint64_t v27 = 3221225472LL;
      id v28 = sub_10003C020;
      id v29 = &unk_10023F7F0;
      id v34 = v19;
      id v23 = v16;
      id v30 = v23;
      id v31 = v17;
      id v32 = self;
      int64_t v35 = a5;
      id v33 = v18;
      SEL v36 = a2;
      int64_t v37 = a7;
      v24 = objc_retainBlock(&v26);
      if (v13) {
        -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:",  v23,  1LL,  a5,  v24,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
      }
      else {
        -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v23,  0LL,  1LL,  a5,  v24,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
      }
    }

    else
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"destinationRecordIDs"));
      (*((void (**)(id, void, void *))v19 + 2))(v19, 0LL, v25);
    }
  }

  else
  {
    (*((void (**)(id, void *, void))v19 + 2))(v19, &__NSDictionary0__struct, 0LL);
  }
}

- (void)copyRecordsWithIDs:(id)a3 sourceType:(int64_t)a4 destinationRecordIDs:(id)a5 destinationType:(int64_t)a6 completionHandler:(id)a7
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10003C328;
  v13[3] = &unk_10023EBB0;
  id v14 = a7;
  id v12 = v14;
  -[CPLCloudKitTransportTask copyRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:]( self,  "copyRecordsWithIDs:followRemapping:sourceType:destinationRecordIDs:destinationType:helper:completionHandler:",  a3,  0LL,  a4,  a5,  a6,  self,  v13);
}

- (void)_applyMoveChanges:(id)a3 sourceType:(int64_t)a4 destinationType:(int64_t)a5 helper:(id)a6 operationContext:(id)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  id v41 = 0LL;
  unsigned __int8 v18 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v41);
  id v19 = v41;
  if ((v18 & 1) != 0)
  {
    if (!_CPLSilentLogging)
    {
      id v20 = sub_10003AF08();
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v14;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Applying move changes: %@", buf, 0xCu);
      }
    }

    if (qword_100296008 != -1) {
      dispatch_once(&qword_100296008, &stru_10023F810);
    }
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller", v16));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 databaseForOperationType:a4 relativeToOperationType:a5]);

    id v24 = objc_alloc(&OBJC_CLASS___CKMovePhotosOperation);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v14 changes]);
    id v26 = [v24 initWithMoveChanges:v25 sourceDatabase:v23];

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask fetchCache](self, "fetchCache"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_10003C638;
    v37[3] = &unk_10023F838;
    int64_t v28 = a5;
    id v29 = v14;
    id v38 = v29;
    id v39 = v27;
    __int16 v40 = self;
    id v30 = v27;
    [v26 setPerRecordMoveBlock:v37];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10003CA84;
    v33[3] = &unk_10023F888;
    v33[4] = self;
    id v36 = v17;
    id v34 = v29;
    id v35 = v15;
    [v26 setMovePhotosCompletionBlock:v33];
    int64_t v31 = v28;
    id v16 = v32;
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v26,  v31,  v32);
  }

  else
  {
    (*((void (**)(id, id))v17 + 2))(v17, v19);
  }
}

- (id)_moveChangesFromSourceRecords:(id)a3 recordIDs:(id)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 helper:(id)a7 sourceRecordIDs:(id *)a8 operationContext:(id)a9 error:(id *)a10
{
  id v16 = a3;
  id v35 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  uint64_t v20 = CPLCKDatabaseScopeForCPLCloudKitOperationType(a5);
  id v21 = -[CPLMoveChangesBatch initWithCapacity:]( [CPLMoveChangesBatch alloc],  "initWithCapacity:",  [v16 count]);
  uint64_t v22 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v16 count]);
  uint64_t v48 = 0LL;
  SEL v49 = &v48;
  uint64_t v50 = 0x3032000000LL;
  uint64_t v51 = sub_10003B420;
  int v52 = sub_10003B430;
  id v53 = 0LL;
  if (qword_100296010) {
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitTransportTask mappingForMoveSteps]( &OBJC_CLASS___CPLCloudKitTransportTask,  "mappingForMoveSteps"));
  }
  else {
    id v23 = 0LL;
  }
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10003CEFC;
  v36[3] = &unk_10023F700;
  id v24 = v16;
  id v37 = v24;
  id v25 = v17;
  SEL v46 = a2;
  id v38 = v25;
  id v39 = self;
  id v26 = v18;
  id v40 = v26;
  uint64_t v27 = v22;
  id v41 = v27;
  uint64_t v47 = v20;
  id v28 = v23;
  id v42 = v28;
  id v29 = v19;
  id v43 = v29;
  id v30 = v21;
  v44 = v30;
  id v45 = &v48;
  [v35 enumerateObjectsUsingBlock:v36];
  int64_t v31 = (void *)v49[5];
  if (v31)
  {
    id v32 = 0LL;
    if (a10) {
      *a10 = v31;
    }
  }

  else
  {
    *a8 = v27;
    id v32 = v30;
  }

  _Block_object_dispose(&v48, 8);
  return v32;
}

- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 completionHandler:(id)a9
{
}

- (void)moveRecordsWithIDs:(id)a3 followRemapping:(BOOL)a4 sourceType:(int64_t)a5 destinationRecordIDs:(id)a6 destinationType:(int64_t)a7 helper:(id)a8 finalizeMoveChanges:(id)a9 completionHandler:(id)a10
{
  BOOL v14 = a4;
  id v16 = a3;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  if ([v16 count])
  {
    id v21 = [v16 count];
    if (v21 == [v17 count])
    {
      if (!_CPLSilentLogging)
      {
        id v22 = sub_10003AF08();
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v40 = v16;
          __int16 v41 = 2112;
          id v42 = v17;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Will move %@ to %@", buf, 0x16u);
        }
      }

      uint64_t v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472LL;
      id v29 = sub_10003D69C;
      id v30 = &unk_10023F8F0;
      id v35 = v20;
      id v24 = v16;
      id v31 = v24;
      id v32 = v17;
      id v33 = self;
      int64_t v37 = a5;
      id v34 = v18;
      id v36 = v19;
      int64_t v38 = a7;
      id v25 = objc_retainBlock(&v27);
      if (v14) {
        -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:",  v24,  0LL,  a5,  v25,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35);
      }
      else {
        -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v24,  0LL,  0LL,  a5,  v25,  v27,  v28,  v29,  v30,  v31,  v32,  v33,  v34,  v35);
      }
    }

    else
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors incorrectParametersErrorForParameter:]( &OBJC_CLASS___CPLErrors,  "incorrectParametersErrorForParameter:",  @"destinationRecordIDs"));
      (*((void (**)(id, void, void *))v20 + 2))(v20, 0LL, v26);
    }
  }

  else
  {
    (*((void (**)(id, void *, void))v20 + 2))(v20, &__NSDictionary0__struct, 0LL);
  }
}

+ (id)moveStepFaultInjector
{
  return objc_retainBlock((id)qword_100296010);
}

+ (void)setMoveStepFaultInjector:(id)a3
{
  id v3 = [a3 copy];
  v4 = (void *)qword_100296010;
  qword_100296010 = (uint64_t)v3;
}

+ (NSDictionary)mappingForMoveSteps
{
  v3[0] = &off_100259FA8;
  v3[1] = &off_100259FC0;
  v4[0] = @"none";
  v4[1] = @"originPreMoveRead";
  v3[2] = &off_100259FD8;
  v3[3] = &off_100259FF0;
  v4[2] = @"destinationPreMoveRead";
  v4[3] = @"originSignPostStamp";
  v3[4] = &off_10025A008;
  v3[5] = &off_10025A020;
  v4[4] = @"destinationPostMoveRead";
  v4[5] = @"originPostMoveRead";
  v3[6] = &off_10025A038;
  v4[6] = @"originPostMoveUpdate";
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v4,  v3,  7LL));
}

+ (NSDictionary)reverseMappingForMoveSteps
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003DA48;
  block[3] = &unk_10023E138;
  block[4] = a1;
  if (qword_100296020 != -1) {
    dispatch_once(&qword_100296020, block);
  }
  return (NSDictionary *)(id)qword_100296018;
}

- (BOOL)shouldCopyForCKRecordID:(id)a3 fromCKRecord:(id)a4
{
  return 1;
}

- (id)baseDestinationCKRecordForSourceCKRecord:(id)a3 destinationCKRecordID:(id)a4 error:(id *)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_alloc(&OBJC_CLASS___CKRecord);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v7 recordType]);

  v10 = -[CKRecord initWithRecordType:recordID:](v8, "initWithRecordType:recordID:", v9, v6);
  return v10;
}

- (BOOL)shouldCopyCKRecordKeyToDestinationCKRecord:(id)a3
{
  return 1;
}

- (id)recordNameInDestinationCKRecordFromRecordName:(id)a3 error:(id *)a4
{
  return a3;
}

- (id)finalizedDestinationCKRecordFromProposedCKRecord:(id)a3 error:(id *)a4
{
  return a3;
}

+ (void)initialize
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  byte_1002961F8 = [v2 BOOLForKey:@"CPLTrackOperationTypes"];
}

- (CPLFingerprintContext)fingerprintContext
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fingerprintContext]);

  return (CPLFingerprintContext *)v3;
}

- (CPLCloudKitTransportTask)initWithController:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___CPLCloudKitTransportTask;
  id v6 = -[CPLCloudKitTransportTask init](&v21, "init");
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    uint64_t v9 = CPLCopyDefaultSerialQueueAttributes(v8);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.cpl.cloudkit.task", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

    v7->_allowsCellular = 0;
    BOOL v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    currentOperations = v7->_currentOperations;
    v7->_currentOperations = v13;

    v7->_isMetadata = 1;
    v7->_highPriorityBackground = 0;
    __asm { FMOV            V0.2D, #-1.0 }

    *(_OWORD *)&v7->_timeoutIntervalForRequest = _Q0;
    *(_WORD *)&v7->_boostable = 1;
  }

  return v7;
}

- (NSString)mainScopeIdentifier
{
  return (NSString *)-[CPLCloudKitTaskController mainScopeIdentifier](self->_controller, "mainScopeIdentifier");
}

- (CKOperationGroup)operationGroup
{
  return (CKOperationGroup *)self->_transportGroup;
}

- (BOOL)foreground
{
  if (self->_foregroundHasBeenChanged)
  {
    LOBYTE(v2) = self->_foreground;
  }

  else
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLEngineTransportGroup defaultConfiguration](self->_transportGroup, "defaultConfiguration"));
    unsigned int v2 = [v3 cplDiscretionary] ^ 1;
  }

  return v2;
}

- (void)setForeground:(BOOL)a3
{
  self->_foregroundHasBeenChanged = 1;
  self->_foreground = a3;
}

- (void)_reallyStartOperation
{
  self->_mustCallTaskDidFinish = 1;
  -[CPLCloudKitTransportTask runOperations](self, "runOperations");
  if (self->_mustCallTaskDidFinish
    && !-[NSMutableArray count](self->_currentOperations, "count")
    && !self->_nonCKOperationCount)
  {
    -[CPLCloudKitTransportTask taskDidFinish](self, "taskDidFinish");
  }

- (void)_acquireActivityAndLaunchOperation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLSyncSession cloudKitRescheduler](self->_session, "cloudKitRescheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 goodConditionsDescription]);
  -[CPLCloudKitTransportTask setIdleDescription:](self, "setIdleDescription:", v4);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10005E7D4;
  v8[3] = &unk_10023DEF8;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 acquireBackgroundActivityWithCompletionHandler:v8]);
  id activityRequest = self->_activityRequest;
  self->_id activityRequest = v6;
}

- (void)_runWithSyncSession:(id)a3
{
  id v5 = a3;
  if (!_CPLSilentLogging)
  {
    id v6 = sub_10005E3FC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v21 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Launching %@", buf, 0xCu);
    }
  }

  objc_storeStrong((id *)&self->_session, a3);
  -[CPLCKRecordFetchCache resetTrackingCounts](self->_fetchCache, "resetTrackingCounts");
  [v5 createCloudKitReschedulerIfNecessary];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
  [v8 taskWillStart:self];

  uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSProgress currentProgress](&OBJC_CLASS___NSProgress, "currentProgress"));
  v10 = (void *)v9;
  if (v9)
  {
    self->_hasProgress = 1;
    uint64_t v11 = CPLCopyDefaultSerialQueueAttributes(v9);
    id v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v13 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.cpl.cloudkit.task.progress", v12);
    progressQueue = self->_progressQueue;
    self->_progressQueue = v13;

    id v15 = (NSProgress *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    progress = self->_progress;
    self->_progress = v15;
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10005EAE8;
  v19[3] = &unk_10023DC70;
  v19[4] = self;
  -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v19);
  if (self->_hasProgress)
  {
    id v17 = self->_progressQueue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10005EC48;
    v18[3] = &unk_10023DC70;
    v18[4] = self;
    dispatch_sync((dispatch_queue_t)v17, v18);
  }
}

- (void)runWithNoSyncSession
{
}

- (void)runWithinSyncSession:(id)a3
{
}

- (void)cancel
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10005E3FC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Cancelling %@", buf, 0xCu);
    }
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005EEC4;
  v6[3] = &unk_10023DC98;
  v6[4] = self;
  v6[5] = a2;
  -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v6);
}

- (void)_cancelAllOperationsIfBlocked
{
  if (self->_cancelled) {
    return;
  }
  if (!self->_mustCallTaskDidFinish)
  {
LABEL_27:
    self->_cancelled = 1;
    return;
  }

  if (!-[NSMutableArray count](self->_currentOperations, "count"))
  {
    if (self->_cancelled) {
      return;
    }
    goto LABEL_27;
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v4 = self->_currentOperations;
  id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v22,  v29,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([v3 isOperationBlocked:*(void *)(*((void *)&v22 + 1) + 8 * (void)i)])
        {

          self->_cancelled = 1;
          __int128 v18 = 0u;
          __int128 v19 = 0u;
          __int128 v20 = 0u;
          __int128 v21 = 0u;
          uint64_t v11 = self->_currentOperations;
          id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v28,  16LL);
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v19;
            do
            {
              for (j = 0LL; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v19 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)j);
                [v3 operationHasBeenCancelled:v16];
                [v16 cancel];
              }

              id v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v18,  v28,  16LL);
            }

            while (v13);
          }

          goto LABEL_25;
        }
      }

      id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v22,  v29,  16LL);
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (!_CPLSilentLogging)
  {
    id v9 = sub_10005E3FC();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Delaying cancelling %@, giving it a chance to complete",  buf,  0xCu);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10005F488;
  v17[3] = &unk_10023DC70;
  v17[4] = self;
  -[CPLCloudKitTransportTask dispatchAfter:block:](self, "dispatchAfter:block:", v17, 5.0);
LABEL_25:
}

- (void)cancelIfBlocked
{
  if (!_CPLSilentLogging)
  {
    id v4 = sub_10005E3FC();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Cancelling %@ it not blocked", buf, 0xCu);
    }
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005F588;
  v6[3] = &unk_10023DC98;
  v6[4] = self;
  v6[5] = a2;
  -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v6);
}

- (id)blockWithAdaptedQOS:(id)a3
{
  id v4 = a3;
  if (self->_forcedTask)
  {
    dispatch_qos_class_t v5 = +[CPLEngineSyncManager qualityOfServiceForForcedTasks]( &OBJC_CLASS___CPLEngineSyncManager,  "qualityOfServiceForForcedTasks");
LABEL_5:
    dispatch_block_t v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v5, 0, v4);

    id v4 = v6;
    goto LABEL_6;
  }

  if (self->_backgroundTask)
  {
    dispatch_qos_class_t v5 = +[CPLEngineSyncManager qualityOfServiceForSyncSessions]( &OBJC_CLASS___CPLEngineSyncManager,  "qualityOfServiceForSyncSessions");
    goto LABEL_5;
  }

- (void)dispatchAsync:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask blockWithAdaptedQOS:](self, "blockWithAdaptedQOS:", a3));
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005F828;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  dispatch_block_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064A80;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = queue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)dispatchAfter:(double)a3 block:(id)a4
{
  dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask blockWithAdaptedQOS:](self, "blockWithAdaptedQOS:", a4));
  dispatch_time_t v7 = dispatch_time(0LL, 1000000000 * (uint64_t)a3);
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005F968;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_after(v7, (dispatch_queue_t)queue, v10);
}

- (BOOL)shouldRunOperationsWithError:(id *)a3
{
  if (self->_cancelled)
  {
    dispatch_qos_class_t v5 = (NSError *)objc_claimAutoreleasedReturnValue(+[CPLErrors operationCancelledError](&OBJC_CLASS___CPLErrors, "operationCancelledError"));
LABEL_5:
    dispatch_time_t v7 = v5;
    goto LABEL_6;
  }

  acquireError = self->_acquireError;
  if (acquireError)
  {
    dispatch_qos_class_t v5 = acquireError;
    goto LABEL_5;
  }

  activity = self->_activity;
  if (activity && -[CPLBackgroundActivity shouldDefer](activity, "shouldDefer"))
  {
    dispatch_qos_class_t v5 = (NSError *)objc_claimAutoreleasedReturnValue(+[CPLErrors sessionHasBeenDeferredError](&OBJC_CLASS___CPLErrors, "sessionHasBeenDeferredError"));
    goto LABEL_5;
  }

  gate = self->_gate;
  if (gate)
  {
    id v23 = 0LL;
    unsigned int v12 = -[CPLCloudKitTransportTaskGate shouldRunOperationsForTask:error:]( gate,  "shouldRunOperationsForTask:error:",  self,  &v23);
    id v13 = (NSError *)v23;
    dispatch_time_t v7 = v13;
    if (!v12) {
      goto LABEL_6;
    }
    uint64_t v14 = v13;
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  controller = self->_controller;
  if (controller)
  {
    __int128 v22 = v14;
    unsigned int v16 = -[CPLCloudKitTaskController shouldRunOperationsWithError:]( controller,  "shouldRunOperationsWithError:",  &v22);
    dispatch_time_t v7 = v22;

    if (v16)
    {
      uint64_t v14 = v7;
      goto LABEL_20;
    }

- (CKOperation)currentOperation
{
  dispatch_qos_class_t v5 = (CPLCloudKitTransportTask *)sub_1001938BC(a2, self, &self->_currentOperations);
  -[CPLCloudKitTransportTask launchOperation:type:withContext:](v5, v6, v7, v8, v9);
  return result;
}

- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  unsigned int v12 = sourceBundleIdentifier;
  if (!sourceBundleIdentifier)
  {
    dispatch_qos_class_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    unsigned int v12 = (NSString *)objc_claimAutoreleasedReturnValue([v5 defaultSourceBundleIdentifier]);
  }

  uint64_t v14 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  -[CPLCloudKitTransportTask launchOperation:type:withContext:sourceBundleIdentifiers:]( self,  "launchOperation:type:withContext:sourceBundleIdentifiers:",  v9,  a4,  v10,  v13);

  if (!sourceBundleIdentifier)
  {
  }
}

- (void)launchOperation:(id)a3 type:(int64_t)a4 withContext:(id)a5 sourceBundleIdentifiers:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if (byte_1002961F8) {
    BOOL v14 = _CPLSilentLogging == 0;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    id v15 = sub_10005E3FC();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = objc_claimAutoreleasedReturnValue([v11 cplOperationClassDescription]);
      __int128 v18 = (void *)v17;
      else {
        Class v19 = off_100240B50[a4 - 1];
      }
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Launching %{public}@ with %@", buf, 0x16u);
    }
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_mustCallTaskDidFinish)
  {
    sub_1001939C8(self, v11, a2);
    __break(1u);
  }

  -[CPLCloudKitTransportTask setupConfigurationForOperation:](self, "setupConfigurationForOperation:", v11);
  if (!-[NSMutableArray count](self->_currentOperations, "count"))
  {
    id v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    lastOperationRequestUUIDs = self->_lastOperationRequestUUIDs;
    self->_lastOperationRequestUUIDs = v20;
  }

  -[NSMutableArray addObject:](self->_currentOperations, "addObject:", v11);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1000601D4;
  v49[3] = &unk_1002407D8;
  v49[4] = self;
  id v22 = (id)objc_claimAutoreleasedReturnValue([v11 requestCompletedBlock]);
  id v50 = v22;
  [v11 setRequestCompletedBlock:v49];
  if (-[CPLCloudKitTaskController isForeground](self->_controller, "isForeground")
    && -[CPLCloudKitTransportTask isBoostable](self, "isBoostable")
    && -[CPLCloudKitTaskController canBoostOperations](self->_controller, "canBoostOperations"))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v11 configuration]);
    if ([v23 cplDiscretionary])
    {
      if (!_CPLSilentLogging)
      {
        id v24 = sub_10005E3FC();
        __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v11 cplOperationClassDescription]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Automatically boosting (background) %@ to non discretionary and requiring non-cellular",  buf,  0xCu);
        }
      }

      [v23 setCPLDiscretionary:0];
      [v23 setAllowsCellularAccess:0];
    }
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
  [v27 operationWillStart:v11 forTask:self withContext:v12 bundleIdentifiers:v13];

  if (-[NSMutableSet count](self->_associatedMetrics, "count"))
  {
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v28 = self->_associatedMetrics;
    id v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v45,  v55,  16LL);
    if (v29)
    {
      uint64_t v30 = *(void *)v46;
      do
      {
        for (i = 0LL; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v46 != v30) {
            objc_enumerationMutation(v28);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * (void)i) associateWithOperation:v11];
        }

        id v29 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v28,  "countByEnumeratingWithState:objects:count:",  &v45,  v55,  16LL);
      }

      while (v29);
    }

    id v32 = -[NSMutableSet copy](self->_associatedMetrics, "copy");
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v11 completionBlock]);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    int v52 = sub_100060330;
    id v53 = sub_100060340;
    id v34 = v11;
    id v54 = v34;
    int64_t v37 = _NSConcreteStackBlock;
    uint64_t v38 = 3221225472LL;
    id v39 = sub_100060348;
    id v40 = &unk_100240238;
    __int16 v41 = self;
    id v35 = v32;
    id v42 = v35;
    v44 = buf;
    id v36 = v33;
    id v43 = v36;
    [v34 setCompletionBlock:&v37];

    _Block_object_dispose(buf, 8);
  }

  -[CPLCloudKitTaskController launchOperation:type:]( self->_controller,  "launchOperation:type:",  v11,  a4,  v37,  v38,  v39,  v40,  v41);
  if (self->_cancelled || self->_acquireError) {
    [v11 cancel];
  }
  else {
    -[CPLBackgroundActivity attachToCKOperation:](self->_activity, "attachToCKOperation:", v11);
  }
}

- (void)updateOneBatch
{
  if (-[NSMutableArray count](self->_currentOperations, "count") == (id)1)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_currentOperations, "lastObject"));
    -[CPLCloudKitTransportTask updateOneBatchForOperation:](self, "updateOneBatchForOperation:", v7);
  }

  else
  {
    id v4 = (CPLCloudKitTransportTask *)sub_100193ADC(a2, self, &self->_currentOperations);
    -[CPLCloudKitTransportTask updateProgress:](v4, v5, v6);
  }

- (void)updateProgress:(double)a3
{
  if (-[NSMutableArray count](self->_currentOperations, "count") == (id)1)
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_currentOperations, "lastObject"));
    [v10 operation:v6 updateProgress:a3];
  }

  else
  {
    id v7 = (CPLCloudKitTransportTask *)sub_100193BE8(a2, self, &self->_currentOperations);
    -[CPLCloudKitTransportTask updateContextWithBlock:](v7, v8, v9);
  }

- (void)updateContextWithBlock:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_currentOperations, "count") == (id)1)
  {
    SEL v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_currentOperations, "lastObject"));
    [v5 operation:v6 updateContextWithBlock:v10];
  }

  else
  {
    id v7 = (CPLCloudKitTransportTask *)sub_100193CF4(a2, self, &self->_currentOperations);
    -[CPLCloudKitTransportTask operationDidFinishWithError:](v7, v8, v9);
  }

- (id)operationDidFinishWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[NSMutableArray count](self->_currentOperations, "count") == (id)1)
  {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_currentOperations, "lastObject"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask operationDidFinish:error:](self, "operationDidFinish:error:", v6, v5));

    return v7;
  }

  else
  {
    id v9 = (CPLCloudKitTransportTask *)sub_100193E00(a2, self, &self->_currentOperations);
    -[CPLCloudKitTransportTask _cancelCallbackProgress](v9, v10);
  }

  return result;
}

- (void)_cancelCallbackProgress
{
  if (self->_callbackOperationProgress)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask idleDescription](self, "idleDescription"));
    if (v4)
    {
      if (([v4 hasSuffix:@" (cancelled)"] & 1) == 0)
      {
        id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:@" (cancelled)"]);
        -[CPLCloudKitTransportTask setIdleDescription:](self, "setIdleDescription:", v3);
      }
    }

    -[NSProgress cancel](self->_callbackOperationProgress, "cancel");
  }

- (void)dispatchCallbackOperation:(id)a3 progress:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_callbackOperationProgress) {
    sub_100193F0C((uint64_t)v6, self);
  }
  -[CPLCloudKitTransportTask pushTaskOperation](self, "pushTaskOperation");
  -[CPLCloudKitTransportTask setIdleDescription:](self, "setIdleDescription:", v6);
  objc_storeStrong((id *)&self->_callbackOperationProgress, a4);
  -[NSProgress setTotalUnitCount:]( self->_progress,  "setTotalUnitCount:",  (char *)-[NSProgress totalUnitCount](self->_progress, "totalUnitCount") + 1);
  -[NSProgress addChild:withPendingUnitCount:]( self->_progress,  "addChild:withPendingUnitCount:",  self->_callbackOperationProgress,  1LL);
  if (self->_acquireError)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006097C;
    v14[3] = &unk_10023DC70;
    v14[4] = self;
    -[CPLCloudKitTransportTask dispatchAsync:](self, "dispatchAsync:", v14);
  }

  else if (self->_activity)
  {
    objc_initWeak(&location, self);
    activity = self->_activity;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100060990;
    v11[3] = &unk_100240828;
    objc_copyWeak(&v12, &location);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLBackgroundActivity addDeferHandler:](activity, "addDeferHandler:", v11));
    id activityEligibilityChangeHandler = self->_activityEligibilityChangeHandler;
    self->_id activityEligibilityChangeHandler = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)callbackOperationDidFinishWithError:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_callbackOperationProgress)
  {
    activity = self->_activity;
    if (activity)
    {
      -[CPLBackgroundActivity removeDeferHandler:]( activity,  "removeDeferHandler:",  self->_activityEligibilityChangeHandler);
      id activityEligibilityChangeHandler = self->_activityEligibilityChangeHandler;
      self->_id activityEligibilityChangeHandler = 0LL;
    }

    SEL v8 = (NSError *)v5;
    id v9 = v8;
    acquireError = self->_acquireError;
    if (acquireError)
    {
      id v11 = acquireError;
      id v12 = v9;
    }

    else
    {
      id v11 = v8;
      if (!v8) {
        goto LABEL_7;
      }
      id v11 = v8;
      if (!self->_activity) {
        goto LABEL_7;
      }
      if (!+[CPLCloudKitErrors isCloudKitOperationCancelledError:]( &OBJC_CLASS___CPLCloudKitErrors,  "isCloudKitOperationCancelledError:",  v8))
      {
        id v11 = v9;
      }

      id v11 = v9;
      uint64_t v15 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask idleDescription](self, "idleDescription"));
      id v12 = (void *)v15;
      unsigned int v16 = @"operation";
      if (v15) {
        unsigned int v16 = (const __CFString *)v15;
      }
      id v11 = (NSError *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  257LL,  @"%@ has been deferred",  v16));
    }

LABEL_7:
    -[NSProgress setCompletedUnitCount:]( self->_callbackOperationProgress,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](self->_callbackOperationProgress, "totalUnitCount"));
    callbackOperationProgress = self->_callbackOperationProgress;
    self->_callbackOperationProgress = 0LL;

    -[CPLCloudKitTransportTask setIdleDescription:](self, "setIdleDescription:", 0LL);
    -[CPLCloudKitTransportTask popTaskOperation](self, "popTaskOperation");

    return v11;
  }

  uint64_t v17 = sub_10019403C(a2, self);
  sub_100060C98(v17);
  return result;
}

- (OS_dispatch_queue)synchronousWorkQueue
{
  return self->_synchronousWorkQueue;
}

- (void)dispatchSynchronousWork:(id)a3
{
  id v4 = a3;
  sub_100060C98((uint64_t)self);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask blockWithAdaptedQOS:](self, "blockWithAdaptedQOS:", v4));

  synchronousWorkQueue = self->_synchronousWorkQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100060E20;
  v11[3] = &unk_10023DBC8;
  id v12 = v5;
  id v7 = v11;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100064A80;
  block[3] = &unk_10023DBC8;
  id v14 = v7;
  SEL v8 = synchronousWorkQueue;
  id v9 = v5;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v10);
}

- (void)executeSynchronousWork:(id)a3 description:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v20 = 0LL;
  unsigned __int8 v11 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v20);
  id v12 = v20;
  if ((v11 & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    -[CPLCloudKitTransportTask dispatchCallbackOperation:progress:]( self,  "dispatchCallbackOperation:progress:",  v9,  v13);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100060F68;
    v15[3] = &unk_10023E390;
    id v16 = v13;
    uint64_t v17 = self;
    id v18 = v8;
    id v19 = v10;
    id v14 = v13;
    -[CPLCloudKitTransportTask dispatchSynchronousWork:](self, "dispatchSynchronousWork:", v15);
  }

  else
  {
    (*((void (**)(id, id))v10 + 2))(v10, v12);
  }
}

- (void)executeSynchronousWork:(id)a3 onItems:(id)a4 description:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  queue = self->_queue;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)queue);
  sub_100060C98((uint64_t)self);
  id v15 = [v13 count];
  id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  v15));
  -[CPLCloudKitTransportTask dispatchCallbackOperation:progress:](self, "dispatchCallbackOperation:progress:", v12, v16);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectEnumerator]);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10006171C;
  v20[3] = &unk_1002408F0;
  v20[4] = self;
  id v21 = v16;
  id v22 = v10;
  id v23 = v15;
  id v18 = v10;
  id v19 = v16;
  sub_1000611F4(self, v14, v17, v12, v19, v20);
}

- (NSArray)lastOperationRequestUUIDs
{
  lastOperationRequestUUIDs = self->_lastOperationRequestUUIDs;
  if (lastOperationRequestUUIDs) {
    return (NSArray *)lastOperationRequestUUIDs;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v17 = 0LL;
  unsigned __int8 v8 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v17);
  id v9 = v17;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
    unsigned __int8 v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Acquiring helper %@",  v6);
    -[CPLCloudKitTransportTask dispatchCallbackOperation:progress:]( self,  "dispatchCallbackOperation:progress:",  v11,  v10);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000619A0;
    v13[3] = &unk_10023E160;
    void v13[4] = self;
    id v14 = v6;
    id v15 = v10;
    id v16 = v7;
    id v12 = v10;
    [v12 performAsCurrentWithPendingUnitCount:1 usingBlock:v13];
  }

  else
  {
    (*((void (**)(id, void, id))v7 + 2))(v7, 0LL, v9);
  }
}

- (void)getTemporaryFolderWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, NSURL *, void))a3;
  id v13 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v13);
  id v6 = v13;
  if ((v5 & 1) != 0)
  {
    temporaryFolderURL = self->_temporaryFolderURL;
    if (temporaryFolderURL)
    {
      v4[2](v4, temporaryFolderURL, 0LL);
    }

    else
    {
      unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSProgress progressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "progressWithTotalUnitCount:",  1LL));
      -[CPLCloudKitTransportTask dispatchCallbackOperation:progress:]( self,  "dispatchCallbackOperation:progress:",  @"Getting a temporary folder",  v8);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100061C9C;
      v10[3] = &unk_10023DB10;
      v10[4] = self;
      id v11 = v8;
      id v12 = v4;
      id v9 = v8;
      [v9 performAsCurrentWithPendingUnitCount:1 usingBlock:v10];
    }
  }

  else
  {
    ((void (**)(id, NSURL *, id))v4)[2](v4, 0LL, v6);
  }
}

- (BOOL)deleteTemporaryFolderWithError:(id *)a3
{
  if (self->_temporaryFolderURL)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    temporaryFolderURL = self->_temporaryFolderURL;
    id v11 = 0LL;
    unsigned __int8 v7 = [v5 removeItemAtURL:temporaryFolderURL error:&v11];
    id v8 = v11;

    id v9 = self->_temporaryFolderURL;
    self->_temporaryFolderURL = 0LL;

    if (a3 && (v7 & 1) == 0)
    {
      id v8 = v8;
      unsigned __int8 v7 = 0;
      *a3 = v8;
    }
  }

  else
  {
    id v8 = 0LL;
    unsigned __int8 v7 = 1;
  }

  return v7;
}

- (void)associateMetric:(id)a3
{
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CPLCloudKitTaskController associateMetric:](self->_controller, "associateMetric:", v7);
  associatedMetrics = self->_associatedMetrics;
  if (associatedMetrics)
  {
    -[NSMutableSet addObject:](associatedMetrics, "addObject:", v7);
  }

  else
  {
    unsigned __int8 v5 = -[NSMutableSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithObjects:", v7, 0LL);
    id v6 = self->_associatedMetrics;
    self->_associatedMetrics = v5;
  }
}

- (void)updateOneBatchForOperation:(id)a3
{
  id v10 = a3;
  if ((-[NSMutableArray containsObject:](self->_currentOperations, "containsObject:") & 1) != 0)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
    [v5 operationDidProgressOneBatch:v10];
  }

  else
  {
    id v6 = (CPLCloudKitTransportTask *)sub_10019413C(a2, v10, self);
    -[CPLCloudKitTransportTask updateProgress:forOperation:](v6, v7, v9, v8);
  }

- (void)updateProgress:(double)a3 forOperation:(id)a4
{
  id v12 = a4;
  if ((-[NSMutableArray containsObject:](self->_currentOperations, "containsObject:") & 1) != 0)
  {
    SEL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
    [v7 operation:v12 updateProgress:a3];
  }

  else
  {
    id v8 = (CPLCloudKitTransportTask *)sub_10019426C(a2, v12, self);
    -[CPLCloudKitTransportTask updateContextWithBlock:forOperation:](v8, v9, v10, v11);
  }

- (void)updateContextWithBlock:(id)a3 forOperation:(id)a4
{
  id v13 = a3;
  id v7 = a4;
  if ((-[NSMutableArray containsObject:](self->_currentOperations, "containsObject:", v7) & 1) != 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
    [v8 operation:v7 updateContextWithBlock:v13];
  }

  else
  {
    SEL v9 = (CPLCloudKitTransportTask *)sub_10019439C(a2, v7, self);
    -[CPLCloudKitTransportTask operationDidFinish:error:](v9, v10, v11, v12);
  }

- (id)operationDidFinish:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = (NSError *)a4;
  if ((-[NSMutableArray containsObject:](self->_currentOperations, "containsObject:", v7) & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v24 = sub_10005E3FC();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        id v26 = NSStringFromSelector(a2);
        uint64_t v27 = (CPLCloudKitTransportTask *)objc_claimAutoreleasedReturnValue(v26);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v7 cplOperationClassDescription]);
        *(_DWORD *)buf = 138412546;
        __int16 v41 = v27;
        __int16 v42 = 2112;
        id v43 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "%@ for %@ called while it has not started yet",  buf,  0x16u);
      }
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit /CPLCloudKitTransportTask.m"));
    id v31 = NSStringFromSelector(a2);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v7 cplOperationClassDescription]);
    [v29 handleFailureInMethod:a2, self, v30, 1058, @"%@ for %@ called while it has not started yet", v32, v33 object file lineNumber description];

    abort();
  }

  if (!_CPLSilentLogging)
  {
    id v9 = sub_10005E3FC();
    SEL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      __int16 v41 = self;
      __int16 v42 = 2112;
      id v43 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%@ finished %@", buf, 0x16u);
    }
  }

  -[CPLCloudKitTransportTaskGate operation:forTask:didFinishWithError:]( self->_gate,  "operation:forTask:didFinishWithError:",  v7,  self,  v8);
  -[CPLCloudKitTransportTask processErrorIfNeeded:](self, "processErrorIfNeeded:", v8);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
  [v11 operationDidFinish:v7];

  id v34 = v7;
  -[NSMutableArray removeObject:](self->_currentOperations, "removeObject:", v7);
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v12 = self->_associatedMetrics;
  id v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
  if (v13)
  {
    id v14 = v13;
    id v15 = 0LL;
    uint64_t v16 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v16) {
          objc_enumerationMutation(v12);
        }
        id v18 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        if (([v18 submitted] & 1) == 0 && objc_msgSend(v18, "outstandingBeginCount"))
        {
          if (v15) {
            -[NSMutableSet addObject:](v15, "addObject:", v18);
          }
          else {
            id v15 = -[NSMutableSet initWithObjects:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithObjects:", v18, 0LL);
          }
        }
      }

      id v14 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( v12,  "countByEnumeratingWithState:objects:count:",  &v35,  v39,  16LL);
    }

    while (v14);
  }

  else
  {
    id v15 = 0LL;
  }

  objc_storeStrong((id *)&self->_associatedMetrics, v15);
  if (!v8)
  {
    id v21 = v34;
    goto LABEL_25;
  }

  acquireError = self->_acquireError;
  if (acquireError)
  {
    id v20 = acquireError;
    id v21 = v34;
LABEL_23:

    id v8 = v20;
    goto LABEL_25;
  }

  activity = self->_activity;
  id v21 = v34;
  if (activity && -[CPLBackgroundActivity shouldDefer](activity, "shouldDefer"))
  {
    id v20 = (NSError *)objc_claimAutoreleasedReturnValue(+[CPLErrors sessionHasBeenDeferredError](&OBJC_CLASS___CPLErrors, "sessionHasBeenDeferredError"));
    goto LABEL_23;
  }

- (void)taskDidFinish
{
  if (-[NSMutableArray count](self->_currentOperations, "count"))
  {
    sub_1001945A4(a2, self, &self->_currentOperations);
LABEL_15:
    sub_1001944CC((uint64_t)self, (uint64_t)a2);
  }

  if (!self->_mustCallTaskDidFinish) {
    goto LABEL_15;
  }
  if (self->_temporaryFolderURL)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    temporaryFolderURL = self->_temporaryFolderURL;
    id v15 = 0LL;
    unsigned __int8 v6 = [v4 removeItemAtURL:temporaryFolderURL error:&v15];
    id v7 = v15;

    if ((v6 & 1) == 0 && !_CPLSilentLogging)
    {
      id v8 = sub_10005E3FC();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        SEL v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL path](self->_temporaryFolderURL, "path"));
        *(_DWORD *)buf = 138412546;
        id v17 = v10;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Failed to delete temporary folder at %@: %@",  buf,  0x16u);
      }
    }

    id v11 = self->_temporaryFolderURL;
    self->_temporaryFolderURL = 0LL;
  }

  self->_mustCallTaskDidFinish = 0;
  if (self->_hasProgress)
  {
    progressQueue = self->_progressQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006272C;
    v14[3] = &unk_10023DC70;
    v14[4] = self;
    dispatch_sync((dispatch_queue_t)progressQueue, v14);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTaskController operationTracker](self->_controller, "operationTracker"));
    [v13 taskDidFinish:self];
  }

- (void)pushTaskOperation
{
}

- (void)popTaskOperation
{
}

- (void)processErrorIfNeeded:(id)a3
{
}

- (void)runOperations
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CP LCloudKitTransportTask.m"));
  unsigned __int8 v6 = NSStringFromSelector(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 handleFailureInMethod:a2, self, v5, 1127, @"%@ should be overriden", v7 object file lineNumber description];

  abort();
}

- (BOOL)_operationsShouldBeDiscretionary
{
  if (self->_forcedTask) {
    return 0;
  }
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask session](self, "session"));
  if (v3)
  {
    id v4 = (void *)v3;
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask session](self, "session"));
    unsigned int v6 = [v5 shouldBeDiscretionary];

    if (!v6) {
      return 0;
    }
  }

  if (self->_activity) {
    return 0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask operationGroup](self, "operationGroup"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 defaultConfiguration]);
  unsigned __int8 v10 = [v9 cplDiscretionary];

  return v10;
}

- (void)setupConfigurationForOperation:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask baseConfigurationForTask](self, "baseConfigurationForTask"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask operationGroup](self, "operationGroup"));
  [v4 setGroup:v6];
  [v4 setConfiguration:v5];
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10005E3FC();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 defaultConfiguration]);
      id v10 = sub_100062AB8(self, v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      id v12 = sub_100062AB8(self, v5);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      int v14 = 138413314;
      id v15 = self;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v11;
      __int16 v22 = 2112;
      id v23 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Setting up task %@ (CKOperation %@) with group %@ (%@) and configuration %@",  (uint8_t *)&v14,  0x34u);
    }
  }
}

- (id)baseConfigurationForTask
{
  id v3 = -[CPLCloudKitTaskController newOperationConfiguration](self->_controller, "newOperationConfiguration");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask operationGroup](self, "operationGroup"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 defaultConfiguration]);
  -[CPLBackgroundActivity attachToCKOperationConfiguration:](self->_activity, "attachToCKOperationConfiguration:", v3);
  BOOL v6 = -[CPLCloudKitTransportTask _operationsShouldBeDiscretionary](self, "_operationsShouldBeDiscretionary");
  if (!v6)
  {
    qos_class_t v7 = qos_class_self();
    uint64_t v8 = -1LL;
    uint64_t v9 = 25LL;
    uint64_t v10 = 33LL;
    if (v7 != QOS_CLASS_USER_INTERACTIVE) {
      uint64_t v10 = 9LL;
    }
    if (v7 != QOS_CLASS_USER_INITIATED) {
      uint64_t v9 = v10;
    }
    if (v7 != QOS_CLASS_DEFAULT) {
      uint64_t v8 = v9;
    }
    uint64_t v11 = -1LL;
    uint64_t v12 = 17LL;
    if (v7 != QOS_CLASS_UTILITY) {
      uint64_t v12 = 9LL;
    }
    if (v7) {
      uint64_t v11 = v12;
    }
    else {
      uint64_t v13 = v8;
    }
    [v3 setQualityOfService:v13];
  }

  [v3 setCPLDiscretionary:v6];
  -[CPLCloudKitTransportTask timeoutIntervalForRequest](self, "timeoutIntervalForRequest");
  double v15 = v14;
  [v5 timeoutIntervalForRequest];
  if (v15 >= 0.0 && (v16 < 0.0 || v15 < v16))
  {
    if (!_CPLSilentLogging)
    {
      id v19 = sub_10005E3FC();
      __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 138412290;
        id v29 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "Overriding request timeout for %@",  (uint8_t *)&v28,  0xCu);
      }
    }

    __int16 v18 = v3;
    double v17 = v15;
  }

  else
  {
    [v5 timeoutIntervalForRequest];
    __int16 v18 = v3;
  }

  [v18 setTimeoutIntervalForRequest:v17];
  -[CPLCloudKitTransportTask timeoutIntervalForResource](self, "timeoutIntervalForResource");
  double v22 = v21;
  [v5 timeoutIntervalForResource];
  if (v6 && v23 < 0.0) {
    double v23 = 86400.0;
  }
  if (v22 >= 0.0 && (v23 < 0.0 || v22 < v23))
  {
    if (!_CPLSilentLogging)
    {
      id v25 = sub_10005E3FC();
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 138412290;
        id v29 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEBUG,  "Overriding resource timeout for %@",  (uint8_t *)&v28,  0xCu);
      }
    }

    double v23 = v22;
  }

  [v3 setTimeoutIntervalForResource:v23];
  if (self->_sourceBundleIdentifier) {
    objc_msgSend(v3, "setApplicationBundleIdentifierOverride:");
  }
  if (-[CPLCloudKitTransportTask allowsCellular](self, "allowsCellular")
    && ([v5 allowsCellularAccess] & 1) == 0)
  {
    [v3 setAllowsCellularAccess:1];
  }

  return v3;
}

- (id)_stringForQoS:(int64_t)a3
{
  unint64_t v3 = __ROR8__(a3 - 9, 3);
  if (v3 > 3) {
    return @"def";
  }
  else {
    return off_100240B70[v3];
  }
}

- (id)_networkBehaviorForConfiguration:(id)a3
{
  else {
    return @"non-disc";
  }
}

+ (BOOL)allowsCellularForDownloadOperationOfResource:(id)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([a3 identity]);
  id v9 = [v8 fileSize];

  return [a1 allowsCellularForDownloadOperationOfSize:v9 isForeground:v6 isHighPriority:v5];
}

+ (BOOL)allowsCellularForDownloadOperationOfSize:(unint64_t)a3 isForeground:(BOOL)a4 isHighPriority:(BOOL)a5
{
  return a3 - 1 < 0x63FFFFF && a4 && a5;
}

- (void)getUserRecordIDFetchIfNecessaryWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, CPLEngineStoreUserIdentifier *, void))a3;
  transportUserIdentifier = self->_transportUserIdentifier;
  if (transportUserIdentifier
    && (uint64_t v6 = objc_opt_class(&OBJC_CLASS___CKRecordID), (objc_opt_isKindOfClass(transportUserIdentifier, v6) & 1) != 0))
  {
    id v14 = 0LL;
    unsigned __int8 v7 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v14);
    id v8 = v14;
    if ((v7 & 1) != 0) {
      v4[2](v4, self->_transportUserIdentifier, 0LL);
    }
    else {
      ((void (**)(id, CPLEngineStoreUserIdentifier *, id))v4)[2](v4, 0LL, v8);
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10005E3FC();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = (id)objc_opt_class(self);
        id v11 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Will fetch user identifier as it has not been set on %@",  buf,  0xCu);
      }
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100063088;
    v12[3] = &unk_100240990;
    v12[4] = self;
    uint64_t v13 = v4;
    -[CPLCloudKitTransportTask fetchUserRecordIDFetchWithCompletionHandler:]( self,  "fetchUserRecordIDFetchWithCompletionHandler:",  v12);
  }
}

- (void)fetchUserRecordIDFetchWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v10 = 0LL;
  unsigned __int8 v5 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v10);
  id v6 = v10;
  if ((v5 & 1) != 0)
  {
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[CKFetchRecordsOperation fetchCurrentUserRecordOperation]( &OBJC_CLASS___CKFetchRecordsOperation,  "fetchCurrentUserRecordOperation"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000631F0;
    v8[3] = &unk_1002409E0;
    v8[4] = self;
    id v9 = v4;
    [v7 setFetchRecordsCompletionBlock:v8];
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v7,  1LL,  0LL);
  }

  else
  {
    (*((void (**)(id, void, id))v4 + 2))(v4, 0LL, v6);
  }
}

- (void)_enumerateAllZonesForSharedDatabase:(BOOL)a3 block:(id)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v25 = 0LL;
  unsigned __int8 v10 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v25);
  id v11 = v25;
  if ((v10 & 1) != 0)
  {
    v23[0] = 0LL;
    v23[1] = v23;
    v23[2] = 0x2020000000LL;
    char v24 = 0;
    uint64_t v12 = objc_alloc_init(&OBJC_CLASS___CKFetchDatabaseChangesOperation);
    -[CKFetchDatabaseChangesOperation setFetchAllChanges:](v12, "setFetchAllChanges:", 1LL);
    objc_initWeak(&location, v12);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000636F8;
    v18[3] = &unk_100240A08;
    id v19 = v8;
    __int16 v20 = v23;
    objc_copyWeak(&v21, &location);
    -[CKFetchDatabaseChangesOperation setRecordZoneWithIDChangedBlock:](v12, "setRecordZoneWithIDChangedBlock:", v18);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10006375C;
    v14[3] = &unk_100240A58;
    v14[4] = self;
    id v16 = v23;
    BOOL v17 = v6;
    id v15 = v9;
    -[CKFetchDatabaseChangesOperation setFetchDatabaseChangesCompletionBlock:]( v12,  "setFetchDatabaseChangesCompletionBlock:",  v14);
    if (v6) {
      uint64_t v13 = 2LL;
    }
    else {
      uint64_t v13 = 1LL;
    }
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v12,  v13,  0LL);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

    _Block_object_dispose(v23, 8);
  }

  else
  {
    (*((void (**)(id, uint64_t, id))v9 + 2))(v9, 1LL, v11);
  }
}

- (void)enumerateAllZonesWithBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000639EC;
  v9[3] = &unk_100240A80;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  -[CPLCloudKitTransportTask _enumerateAllZonesForSharedDatabase:block:completionHandler:]( self,  "_enumerateAllZonesForSharedDatabase:block:completionHandler:",  0LL,  v7,  v9);
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLTransportScopeMapping objectForKeyedSubscript:]( self->_transportScopeMapping,  "objectForKeyedSubscript:",  v4));
  if (!v5) {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTaskController cloudKitScopeForScopeIdentifier:]( self->_controller,  "cloudKitScopeForScopeIdentifier:",  v4));
  }

  return v5;
}

- (NSDictionary)transportScopes
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Implementations/CloudKit/CP LCloudKitTransportTask.m"));
  id v6 = NSStringFromSelector(a2);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v4 handleFailureInMethod:a2, self, v5, 1379, @"%@ should never be accessed to read here", v7 object file lineNumber description];

  abort();
}

- (void)setTransportScopes:(id)a3
{
  id v5 = a3;
  if (self->_transportScopeMapping)
  {
    uint64_t v10 = sub_1001946B0(a2, self);
    sub_100063C50(v10, v11, v12);
  }

  else
  {
    id v13 = v5;
    id v6 = objc_alloc(&OBJC_CLASS___CPLTransportScopeMapping);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
    id v8 = -[CPLTransportScopeMapping initWithTranslator:](v6, "initWithTranslator:", v7);
    transportScopeMapping = self->_transportScopeMapping;
    self->_transportScopeMapping = v8;

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100063C50;
    v14[3] = &unk_100240AA8;
    v14[4] = self;
    [v13 enumerateKeysAndObjectsUsingBlock:v14];
  }

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( self,  "cloudKitScopeForScopeIdentifier:",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);

  if (!v6) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTaskController zoneIDFromScopeIdentifier:]( self->_controller,  "zoneIDFromScopeIdentifier:",  v4));
  }

  return v6;
}

- (id)_scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  cacheScopeIdentifiersPerZoneID = self->_cacheScopeIdentifiersPerZoneID;
  if (!cacheScopeIdentifiersPerZoneID)
  {
    if (self->_transportScopeMapping)
    {
      id v6 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[CPLTransportScopeMapping count](self->_transportScopeMapping, "count"));
      id v7 = self->_cacheScopeIdentifiersPerZoneID;
      self->_cacheScopeIdentifiersPerZoneID = v6;

      transportScopeMapping = self->_transportScopeMapping;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_100063DA4;
      v11[3] = &unk_100240AD0;
      void v11[4] = self;
      -[CPLTransportScopeMapping enumerateConcreteScopesWithBlock:]( transportScopeMapping,  "enumerateConcreteScopesWithBlock:",  v11);
      cacheScopeIdentifiersPerZoneID = self->_cacheScopeIdentifiersPerZoneID;
    }

    else
    {
      cacheScopeIdentifiersPerZoneID = 0LL;
    }
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( cacheScopeIdentifiersPerZoneID,  "objectForKeyedSubscript:",  v4));

  return v9;
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask _scopeIdentifierFromZoneID:](self, "_scopeIdentifierFromZoneID:", v4));
  if (!v5) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTaskController scopeIdentifierFromZoneID:]( self->_controller,  "scopeIdentifierFromZoneID:",  v4));
  }

  return v5;
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask _scopeIdentifierFromZoneID:](self, "_scopeIdentifierFromZoneID:", v5));

  if (v6) {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v6));
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

- (CPLEngineStoreUserIdentifier)transportUserIdentifier
{
  return self->_transportUserIdentifier;
}

- (void)setTransportUserIdentifier:(id)a3
{
}

- (CPLEngineTransportGroup)transportGroup
{
  return self->_transportGroup;
}

- (BOOL)isHighPriorityBackground
{
  return self->_highPriorityBackground;
}

- (void)setHighPriorityBackground:(BOOL)a3
{
  self->_highPriorityBackground = a3;
}

- (BOOL)isForcedTask
{
  return self->_forcedTask;
}

- (void)setForcedTask:(BOOL)a3
{
  self->_forcedTask = a3;
}

- (BOOL)isBackgroundTask
{
  return self->_backgroundTask;
}

- (void)setBackgroundTask:(BOOL)a3
{
  self->_backgroundTask = a3;
}

- (BOOL)allowsFetchCache
{
  return self->_allowsFetchCache;
}

- (void)setAllowsFetchCache:(BOOL)a3
{
  self->_allowsFetchCache = a3;
}

- (id)trackingContext
{
  return self->trackingContext;
}

- (void)setTrackingContext:(id)a3
{
}

- (CPLCloudKitTaskController)controller
{
  return self->_controller;
}

- (CPLCloudKitTransportTaskGate)gate
{
  return self->_gate;
}

- (void)setGate:(id)a3
{
}

- (CPLSyncSession)session
{
  return self->_session;
}

- (CPLCKRecordFetchCache)fetchCache
{
  return self->_fetchCache;
}

- (void)setFetchCache:(id)a3
{
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (void)setSourceBundleIdentifier:(id)a3
{
}

- (BOOL)allowsCellular
{
  return self->_allowsCellular;
}

- (void)setAllowsCellular:(BOOL)a3
{
  self->_allowsCellular = a3;
}

- (BOOL)isBoostable
{
  return self->_boostable;
}

- (void)setBoostable:(BOOL)a3
{
  self->_boostable = a3;
}

- (double)timeoutIntervalForRequest
{
  return self->_timeoutIntervalForRequest;
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (BOOL)isUpload
{
  return self->_isUpload;
}

- (void)setIsUpload:(BOOL)a3
{
  self->_isUpload = a3;
}

- (BOOL)isMetadata
{
  return self->_isMetadata;
}

- (void)setIsMetadata:(BOOL)a3
{
  self->_isMetadata = a3;
}

- (NSString)idleDescription
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setIdleDescription:(id)a3
{
}

- (BOOL)hasBackgroundActivity
{
  return self->_hasBackgroundActivity;
}

- (void)setHasBackgroundActivity:(BOOL)a3
{
  self->_hasBackgroundActivity = a3;
}

- (CPLTransportScopeMapping)transportScopeMapping
{
  return self->_transportScopeMapping;
}

- (void)setTransportScopeMapping:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 completionHandler:(id)a8
{
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 desiredKeys:(id)a5 wantsAllRecords:(BOOL)a6 type:(int64_t)a7 perFoundRecordBlock:(id)a8 completionHandler:(id)a9
{
  BOOL v31 = a4;
  id v35 = a3;
  id v37 = a5;
  id v34 = a8;
  __int128 v36 = (void (**)(id, void, void *, id))a9;
  id v53 = 0LL;
  LOBYTE(a8) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v53);
  id v12 = v53;
  id v33 = v12;
  if ((a8 & 1) == 0)
  {
    v36[2](v36, 0LL, &__NSArray0__struct, v12);
    goto LABEL_38;
  }

  unsigned int v13 = -[CPLCloudKitTransportTask allowsFetchCache](self, "allowsFetchCache");
  id v14 = 0LL;
  if (v37)
  {
    id v16 = 0LL;
    id v17 = 0LL;
  }

  else
  {
    id v15 = self;
    id v16 = 0LL;
    id v17 = 0LL;
    if (((v13 ^ 1) & 1) != 0 || v31) {
      goto LABEL_23;
    }
    id v14 = (CPLCKRecordFetchCache *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask fetchCache](self, "fetchCache"));
    if (v14)
    {
      __int16 v18 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v35 count]);
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v19 = v35;
      id v16 = 0LL;
      id v20 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v50 != v21) {
              objc_enumerationMutation(v19);
            }
            uint64_t v23 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
            char v24 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCKRecordFetchCache cachedRecordWithID:](v14, "cachedRecordWithID:", v23));
            if (v24)
            {
              if (!v16) {
                id v16 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v19 count]);
              }
              -[NSMutableDictionary setObject:forKeyedSubscript:](v16, "setObject:forKeyedSubscript:", v24, v23);
            }

            else
            {
              -[NSMutableArray addObject:](v18, "addObject:", v23);
            }
          }

          id v20 = [v19 countByEnumeratingWithState:&v49 objects:v58 count:16];
        }

        while (v20);
      }

      id v17 = -[NSMutableArray copy](v18, "copy");
    }

    else
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___CPLCKRecordFetchCache);
      -[CPLCloudKitTransportTask setFetchCache:](self, "setFetchCache:", v14);
      id v16 = 0LL;
      id v17 = 0LL;
    }
  }

  id v15 = self;
LABEL_23:
  if (!a7) {
    sub_100195730((uint64_t)a2, (uint64_t)v15);
  }
  if (!v17) {
    id v17 = v35;
  }
  if ([v17 count])
  {
    if (v14) {
      -[CPLCKRecordFetchCache willFetchRecordCount:](v14, "willFetchRecordCount:", [v17 count]);
    }
    id v25 = -[CKFetchRecordsOperation initWithRecordIDs:]( objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation),  "initWithRecordIDs:",  v17);
    -[CKFetchRecordsOperation setShouldFetchAssetContent:](v25, "setShouldFetchAssetContent:", v31);
    if (v37) {
      -[CKFetchRecordsOperation setDesiredKeys:](v25, "setDesiredKeys:", v37);
    }
    v48[0] = 0LL;
    v48[1] = v48;
    v48[2] = 0x2020000000LL;
    v48[3] = 0LL;
    if (!_CPLSilentLogging)
    {
      id v26 = sub_1000733A0();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        int v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "componentsJoinedByString:", @", "));
        *(_DWORD *)buf = 138412546;
        v55 = v25;
        __int16 v56 = 2112;
        id v57 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Will launch %@ to fetch %@", buf, 0x16u);
      }
    }

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_1000733E0;
    v44[3] = &unk_1002410F0;
    v44[4] = self;
    __int128 v47 = v48;
    id v45 = v35;
    id v46 = v34;
    -[CKFetchRecordsOperation setPerRecordCompletionBlock:](v25, "setPerRecordCompletionBlock:", v44);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_1000734F4;
    v38[3] = &unk_100241190;
    v38[4] = self;
    id v39 = v17;
    BOOL v43 = a6;
    id v40 = v14;
    __int16 v41 = v16;
    __int16 v42 = v36;
    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v25, "setFetchRecordsCompletionBlock:", v38);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v25,  a7,  0LL);

    _Block_object_dispose(v48, 8);
  }

  else
  {
    id v25 = (CKFetchRecordsOperation *)-[NSMutableDictionary copy](v16, "copy");
    ((void (*)(void))v36[2])();
  }

LABEL_38:
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 wantsAllRecords:(BOOL)a5 type:(int64_t)a6 completionHandler:(id)a7
{
}

- (void)fetchRecordWithNames:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  unsigned int v13 = (void (**)(void, void, void, void))v12;
  if (v11)
  {
    id v26 = self;
    BOOL v27 = v8;
    int v28 = (void (**)(void, void, void, void))v12;
    id v14 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v10 count]);
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v15 = v10;
    id v16 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v32 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
          uint64_t v21 = objc_alloc(&OBJC_CLASS___CKRecordID);
          double v22 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
          uint64_t v23 = -[CKRecordID initWithRecordName:zoneID:](v21, "initWithRecordName:zoneID:", v20, v22);

          -[NSMutableArray addObject:](v14, "addObject:", v23);
        }

        id v17 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v17);
    }

    uint64_t v24 = CPLCloudKitOperationTypeForScope(v11);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_100073DA8;
    v29[3] = &unk_1002411E0;
    unsigned int v13 = v28;
    uint64_t v30 = v28;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( v26,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v14,  v27,  0LL,  v24,  v29);
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
    ((void (**)(void, void, void, void *))v13)[2](v13, 0LL, 0LL, v25);
  }
}

- (void)fetchRecordsWithIDs:(id)a3 fetchResources:(BOOL)a4 inScope:(id)a5 completionHandler:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  if (a5)
  {
    uint64_t v12 = CPLCloudKitOperationTypeForScope(a5);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10007402C;
    v14[3] = &unk_1002411E0;
    id v15 = v11;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v10,  v8,  0LL,  v12,  v14);
  }

  else
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone"));
    (*((void (**)(id, void, void, void *))v11 + 2))(v11, 0LL, 0LL, v13);
  }
}

- (void)fetchRecordWithNames:(id)a3 inScope:(id)a4 completionHandler:(id)a5
{
}

- (void)_fetchNextOperationType:(id)a3 followRemapping:(BOOL)a4 recordIDMapping:(id)a5 inResult:(id)a6 storeRequestUUIDsIn:(id)a7 completionHandler:(id)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if ([v14 count])
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v14 allKeys]);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 firstObject]);

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:v20]);
    id v25 = _NSConcreteStackBlock;
    uint64_t v26 = 3221225472LL;
    BOOL v27 = sub_100074214;
    int v28 = &unk_100241208;
    id v29 = v17;
    id v30 = v16;
    id v31 = v15;
    id v32 = v14;
    id v22 = v20;
    id v33 = v22;
    __int128 v34 = self;
    BOOL v36 = v12;
    id v35 = v18;
    uint64_t v23 = objc_retainBlock(&v25);
    id v24 = objc_msgSend(v22, "integerValue", v25, v26, v27, v28);
    if (v12) {
      -[CPLCloudKitTransportTask fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsFollowRemappingWithIDs:wantsAllRecords:type:completionHandler:",  v21,  0LL,  v24,  v23);
    }
    else {
      -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v21,  0LL,  0LL,  v24,  v23);
    }
  }

  else
  {
    (*((void (**)(id, void))v18 + 2))(v18, 0LL);
  }
}

- (void)_fetchRecordWithScopedIdentifiers:(id)a3 followRemapping:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v48 = 0LL;
  __int128 v38 = self;
  LOBYTE(a5) = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v48);
  id v10 = v48;
  id v11 = v10;
  if ((a5 & 1) != 0)
  {
    BOOL v33 = v6;
    __int128 v34 = (void (**)(void, void, void, void))v9;
    id v35 = v10;
    id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    BOOL v12 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    id v36 = v8;
    unsigned int v13 = (NSMutableArray *)v8;
    id v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v13,  "countByEnumeratingWithState:objects:count:",  &v44,  v49,  16LL);
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v45;
      obj = v13;
      while (2)
      {
        for (i = 0LL; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v45 != v16) {
            objc_enumerationMutation(obj);
          }
          id v18 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
          id v19 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue([v18 identifier]);
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 scopeIdentifier]);
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask cloudKitScopeForScopeIdentifier:]( v38,  "cloudKitScopeForScopeIdentifier:",  v20));

          if (!v21)
          {
            id v32 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  80LL,  @"Missing required zone for %@",  v18));
            id v9 = v34;
            ((void (**)(void, void, void, void *))v34)[2](v34, 0LL, 0LL, v32);
            id v31 = v39;
            id v30 = obj;
            goto LABEL_15;
          }

          id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 recordIDWithRecordName:v19]);
          uint64_t v23 = v12;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v18, v22);
          uint64_t v24 = CPLCloudKitOperationTypeForScope(v21);
          id v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v24));
          uint64_t v26 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( v39,  "objectForKeyedSubscript:",  v25));

          if (!v26)
          {
            uint64_t v26 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSMutableArray count](obj, "count"));
            BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v24));
            -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v26, v27);
          }

          -[NSMutableArray addObject:](v26, "addObject:", v22);

          BOOL v12 = v23;
        }

        unsigned int v13 = obj;
        id v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v49,  16LL);
        if (v15) {
          continue;
        }
        break;
      }
    }

    int v28 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  -[NSMutableArray count](v13, "count"));
    id v29 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_100074740;
    v40[3] = &unk_100241230;
    id v9 = v34;
    __int16 v42 = v28;
    BOOL v43 = v34;
    __int16 v41 = v29;
    id v19 = v28;
    id v30 = v29;
    id v31 = v39;
    -[CPLCloudKitTransportTask _fetchNextOperationType:followRemapping:recordIDMapping:inResult:storeRequestUUIDsIn:completionHandler:]( v38,  "_fetchNextOperationType:followRemapping:recordIDMapping:inResult:storeRequestUUIDsIn:completionHandler:",  v39,  v33,  v12,  v19,  v30,  v40);

    id v32 = v43;
LABEL_15:

    id v11 = v35;
    id v8 = v36;
  }

  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0LL, 0LL, v10);
  }
}

- (void)fetchRecordWithScopedIdentifiers:(id)a3 completionHandler:(id)a4
{
}

- (id)_interpretedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = a5;
    unsigned int v11 = objc_msgSend(v8, "cpl_inExpunged");
    id v32 = 0LL;
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v9 scopeIdentifier]);
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v8,  "cpl_recordChangeMissingResourceProperties:scopeIdentifier:scopeProvider:currentUserRecordID:",  &v32,  v12,  self,  v10));

    id v14 = v32;
    if (v11 && v13)
    {
      if (([v13 allResourcesAreAvailable] & 1) == 0)
      {

        if (!_CPLSilentLogging)
        {
          id v15 = sub_1000733A0();
          unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = (void *)objc_opt_class(0LL);
            *(_DWORD *)buf = 138412546;
            id v34 = v16;
            __int16 v35 = 2112;
            id v36 = v9;
            id v17 = v16;
            id v18 = "Fetched <%@ %@> from server, it is expunged but is expired - discarding";
            id v19 = (os_log_s *)v13;
            os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
LABEL_24:
            _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, 0x16u);

            goto LABEL_25;
          }

          goto LABEL_25;
        }

        goto LABEL_26;
      }
    }

    else if (!v13)
    {
      if (!_CPLSilentLogging)
      {
        id v30 = sub_1000733A0();
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue([v8 recordType]);
          *(_DWORD *)buf = 138412546;
          id v34 = v17;
          __int16 v35 = 2112;
          id v36 = v9;
          id v18 = "Fetched <%@ %@> from server but failed to decode it";
          id v19 = (os_log_s *)v13;
          os_log_type_t v20 = OS_LOG_TYPE_ERROR;
          goto LABEL_24;
        }

- (id)_interpretedSharedChangeFromCKRecord:(id)a3 scopedIdentifier:(id)a4 userRecordID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8
    && (unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v8 recordType]),
        unsigned int v12 = [CPLRecordChangeClassForCKRecordType(v11) supportsSharing],
        v11,
        v12))
  {
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask _interpretedChangeFromCKRecord:scopedIdentifier:userRecordID:]( self,  "_interpretedChangeFromCKRecord:scopedIdentifier:userRecordID:",  v8,  v9,  v10));
  }

  else
  {
    unsigned int v13 = 0LL;
  }

  return v13;
}

- (id)_sharedRecordToPrivateRecord:(id)a3 scopedIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 supportsSharingScopedIdentifier])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 scopedIdentifier]);
    [v5 setSharingRecordScopedIdentifier:v7];
  }

  [v5 setScopedIdentifier:v6];
  [v5 awakeFromStorage];
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordChangeData]);
  [v5 setSharingRecordChangeData:v8];

  [v5 setRecordChangeData:0];
  return v5;
}

- (void)_mergePrivateRecord:(id)a3 withSharedRecord:(id)a4 merger:(id)a5
{
  id v11 = a3;
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 scopedIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 scopedIdentifier]);
  [v8 setScopedIdentifier:v10];

  [v8 awakeFromStorage];
  [v7 mergeRecord:v8 isSharedRecord:1 inPrivateRecord:v11];
}

- (BOOL)_mergeFoundCKRecords:(id)a3 updateFoundCPLRecords:(id)a4 remainingScopedIdentifiers:(id)a5 fetchedScopedIdentifiers:(id)a6 userRecordID:(id)a7 targetMapping:(id)a8 error:(id *)a9
{
  SEL v157 = a2;
  id v15 = a3;
  id v171 = a4;
  id v16 = a5;
  id v162 = a6;
  id v181 = a7;
  id v183 = a8;
  id v17 = objc_alloc(&OBJC_CLASS___CPLSharedRecordMerger);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask controller](self, "controller"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 propertyMapping]);
  os_log_type_t v20 = v17;
  id v21 = v15;
  id v158 = [v20 initWithMapping:v19];

  __int128 v193 = 0u;
  __int128 v194 = 0u;
  __int128 v191 = 0u;
  __int128 v192 = 0u;
  v173 = v16;
  id obj = (id)objc_claimAutoreleasedReturnValue([v16 allObjects]);
  id v174 = [obj countByEnumeratingWithState:&v191 objects:v195 count:16];
  if (v174)
  {
    uint64_t v172 = *(void *)v192;
    v182 = v15;
    v180 = self;
    do
    {
      id v22 = 0LL;
      do
      {
        if (*(void *)v192 != v172) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v191 + 1) + 8LL * (void)v22);
        id v24 = (CPLRecordTarget *)objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "targetForRecordWithScopedIdentifier:", v23, v157));
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CPLRecordTarget otherScopedIdentifier](v24, "otherScopedIdentifier"));
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKeyedSubscript:v23]);
        os_log_type_t v27 = v26;
        if (!v26) {
          goto LABEL_9;
        }
        id v28 = self;
        id v29 = v24;
        id v30 = (void *)objc_claimAutoreleasedReturnValue([v26 recordID]);
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 recordName]);
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v23 identifier]);
        unsigned __int8 v33 = [v31 isEqualToString:v32];

        if ((v33 & 1) != 0)
        {
          id v24 = v29;
          self = v28;
LABEL_9:
          if (v25) {
            goto LABEL_10;
          }
          goto LABEL_24;
        }

        v185 = v22;
        v55 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
        __int16 v56 = (void *)objc_claimAutoreleasedReturnValue([v27 recordID]);
        id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 recordName]);
        id v58 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:]( v55,  "initRelativeToScopedIdentifier:identifier:",  v23,  v57);

        if (v25)
        {
          v59 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
          v60 = v27;
          id v61 = (void *)objc_claimAutoreleasedReturnValue([v27 recordID]);
          id v62 = (void *)objc_claimAutoreleasedReturnValue([v61 recordName]);
          id v63 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:]( v59,  "initRelativeToScopedIdentifier:identifier:",  v25,  v62);

          id v25 = v63;
        }

        else
        {
          v60 = v27;
        }

        id v24 = -[CPLRecordTarget initWithScopedIdentifier:otherScopedIdentifier:targetState:]( objc_alloc(&OBJC_CLASS___CPLRecordTarget),  "initWithScopedIdentifier:otherScopedIdentifier:targetState:",  v58,  v25,  -[CPLRecordTarget targetState](v29, "targetState"));

        [v183 setTarget:v24 forRecordWithScopedIdentifier:v23];
        self = v28;
        os_log_type_t v27 = v60;
        id v22 = v185;
        if (v25)
        {
LABEL_10:
          v184 = v25;
          v186[0] = _NSConcreteStackBlock;
          v186[1] = 3221225472LL;
          v186[2] = sub_100075CC0;
          v186[3] = &unk_100241258;
          v186[4] = v23;
          id v187 = v171;
          v188 = v24;
          id v34 = v183;
          id v189 = v34;
          id v190 = v173;
          __int16 v35 = objc_retainBlock(v186);
          id v36 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask _interpretedChangeFromCKRecord:scopedIdentifier:userRecordID:]( self,  "_interpretedChangeFromCKRecord:scopedIdentifier:userRecordID:",  v27,  v23,  v181));
          if (v36)
          {
            id v37 = v36;
            if ([v36 supportsSharingScopedIdentifier])
            {
              __int128 v38 = v24;
              id v39 = (void *)objc_claimAutoreleasedReturnValue([v184 scopeIdentifier]);
              unsigned int v40 = [v37 isSharedInScopeWithIdentifier:v39];

              if (v40)
              {
                self = v180;
                id v24 = v38;
                if ([v37 inExpunged])
                {

                  goto LABEL_15;
                }
              }

              else
              {
                [v37 setSharingScopeIdentifier:0];
                self = v180;
                id v24 = v38;
              }
            }

            if ([v37 isMasterChange])
            {
              v176 = v24;
              unsigned int v68 = [v37 inExpunged];
              id v21 = v182;
              v69 = (void *)objc_claimAutoreleasedReturnValue([v182 objectForKeyedSubscript:v184]);
              id v70 = v184;
              v71 = v70;
              if (v68)
              {
                v163 = (void (**)(void, void *, id, uint64_t))v35;
                id v72 = v70;
                if (v69)
                {
                  id v73 = (void *)objc_claimAutoreleasedReturnValue([v69 recordID]);
                  __int128 v74 = (void *)objc_claimAutoreleasedReturnValue([v73 recordName]);
                  __int128 v75 = (void *)objc_claimAutoreleasedReturnValue([v71 identifier]);
                  unsigned __int8 v76 = [v74 isEqual:v75];

                  id v72 = v71;
                  if ((v76 & 1) == 0)
                  {
                    __int128 v77 = objc_alloc(&OBJC_CLASS___CPLScopedIdentifier);
                    id v78 = (void *)objc_claimAutoreleasedReturnValue([v69 recordID]);
                    __int128 v79 = (void *)objc_claimAutoreleasedReturnValue([v78 recordName]);
                    id v72 = -[CPLScopedIdentifier initRelativeToScopedIdentifier:identifier:]( v77,  "initRelativeToScopedIdentifier:identifier:",  v71,  v79);
                  }
                }

                __int128 v80 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask _interpretedSharedChangeFromCKRecord:scopedIdentifier:userRecordID:]( v180,  "_interpretedSharedChangeFromCKRecord:scopedIdentifier:userRecordID:",  v69,  v71,  v181));
                __int128 v81 = v80;
                if (!v80)
                {
                  unsigned __int8 v133 = [v162 containsObject:v71];
                  self = v180;
                  if ((v133 & 1) == 0) {
                    goto LABEL_69;
                  }
                  goto LABEL_70;
                }

                self = v180;
                if (([v80 inExpunged] & 1) == 0)
                {
                  __int128 v82 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransportTask _sharedRecordToPrivateRecord:scopedIdentifier:]( v180,  "_sharedRecordToPrivateRecord:scopedIdentifier:",  v81,  v23));
                  v163[2](v163, v82, v72, 2LL);

                  goto LABEL_71;
                }

- (void)_fetchRecordsForRemainingScopedIdentifiers:(id)a3 alreadyFetchedScopedIdentifiers:(id)a4 userRecordID:(id)a5 foundCPLRecords:(id)a6 foundCKRecords:(id)a7 targetMapping:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if ([v15 count])
  {
    id v65 = 0LL;
    unsigned __int8 v22 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v65);
    id v23 = v65;
    id v24 = v23;
    if ((v22 & 1) != 0)
    {
      id v41 = v23;
      id v42 = v18;
      __int128 v46 = v19;
      BOOL v43 = v17;
      id v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472LL;
      v61[2] = sub_100076198;
      v61[3] = &unk_100241280;
      id v44 = v16;
      id v26 = v16;
      os_log_type_t v27 = self;
      id v28 = v26;
      id v62 = v26;
      id v63 = v27;
      id v39 = v27;
      unsigned int v40 = v25;
      id v64 = v40;
      id v29 = objc_retainBlock(v61);
      __int128 v57 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v60 = 0u;
      id v45 = v15;
      id v30 = v15;
      id v31 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
      if (v31)
      {
        id v32 = v31;
        uint64_t v33 = *(void *)v58;
        do
        {
          for (i = 0LL; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v58 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v57 + 1) + 8LL * (void)i);
            uint64_t v36 = objc_claimAutoreleasedReturnValue([v20 targetForRecordWithScopedIdentifier:v35]);
            if (!v36) {
              sub_1001958E0(v35, (uint64_t)a2, (uint64_t)v39);
            }
            id v37 = (void *)v36;
            if ([v28 containsObject:v35])
            {
              __int128 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 otherScopedIdentifier]);
              if (v38) {
                ((void (*)(void *, void *))v29[2])(v29, v38);
              }
            }

            else
            {
              ((void (*)(void *, uint64_t))v29[2])(v29, v35);
            }
          }

          id v32 = [v30 countByEnumeratingWithState:&v57 objects:v66 count:16];
        }

        while (v32);
      }

      if (-[NSMutableArray count](v40, "count"))
      {
        [v28 addObjectsFromArray:v40];
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472LL;
        v48[2] = sub_100076220;
        v48[3] = &unk_1002412A8;
        id v49 = v46;
        __int128 v50 = v39;
        id v18 = v42;
        id v51 = v42;
        id v52 = v30;
        id v53 = v28;
        id v17 = v43;
        id v54 = v43;
        id v55 = v20;
        id v56 = v21;
        -[CPLCloudKitTransportTask _fetchRecordWithScopedIdentifiers:followRemapping:completionHandler:]( v39,  "_fetchRecordWithScopedIdentifiers:followRemapping:completionHandler:",  v40,  1LL,  v48);
      }

      else
      {
        id v18 = v42;
        (*((void (**)(id, void *, void))v21 + 2))(v21, v42, 0LL);
        id v17 = v43;
      }

      id v24 = v41;

      id v16 = v44;
      id v15 = v45;
      id v19 = v46;
    }

    else
    {
      (*((void (**)(id, void, id))v21 + 2))(v21, 0LL, v23);
    }
  }

  else
  {
    (*((void (**)(id, id, void))v21 + 2))(v21, v18, 0LL);
  }
}

- (void)fetchFullRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000763FC;
  v11[3] = &unk_1002412D0;
  id v12 = a3;
  unsigned int v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v11);
}

- (void)fetchUnknownTargetsInMapping:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 hasUnknownTargets])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask transportScopeMapping](self, "transportScopeMapping"));
    unsigned int v9 = [v8 hasStagingScopes];

    if (v9) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 allTargetScopedIdentifiers]);
    }
    else {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 unknownTargetScopedIdentifiers]);
    }
    id v11 = v10;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100076608;
    v12[3] = &unk_1002412F8;
    id v15 = [v10 count];
    char v16 = v9;
    id v13 = v6;
    id v14 = v7;
    -[CPLCloudKitTransportTask fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:]( self,  "fetchFullRecordsForScopedIdentifiers:targetMapping:completionHandler:",  v11,  v13,  v12);
  }

  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0LL);
  }
}

- (void)fetchPlaceholderRecordsForScopedIdentifiers:(id)a3 targetMapping:(id)a4 completionHandler:(id)a5
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000767F4;
  v12[3] = &unk_100241370;
  id v13 = a3;
  id v14 = a4;
  id v16 = a5;
  SEL v17 = a2;
  id v15 = self;
  id v9 = v14;
  id v10 = v16;
  id v11 = v13;
  -[CPLCloudKitTransportTask fetchUnknownTargetsInMapping:completionHandler:]( self,  "fetchUnknownTargetsInMapping:completionHandler:",  v9,  v12);
}

- (void)_fetchZoneForZoneID:(id)a3 operationType:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v21 = 0LL;
  unsigned __int8 v10 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v21);
  id v11 = v21;
  if ((v10 & 1) != 0)
  {
    id v12 = objc_alloc(&OBJC_CLASS___CKFetchRecordZonesOperation);
    id v22 = v8;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL));
    id v14 = -[CKFetchRecordZonesOperation initWithRecordZoneIDs:](v12, "initWithRecordZoneIDs:", v13);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZonesOperation operationID](v14, "operationID"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100076D30;
    v17[3] = &unk_100241398;
    v17[4] = self;
    id v18 = v8;
    id v19 = v15;
    id v20 = v9;
    id v16 = v15;
    -[CKFetchRecordZonesOperation setFetchRecordZonesCompletionBlock:](v14, "setFetchRecordZonesCompletionBlock:", v17);
    -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v14,  a4,  0LL);
  }

  else
  {
    (*((void (**)(id, void, void, id))v9 + 2))(v9, 0LL, 0LL, v11);
  }
}

- (void)fetchZoneForScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  if (v8)
  {
    uint64_t v9 = CPLCloudKitOperationTypeForScope(v6);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10007713C;
    v12[3] = &unk_1002413E8;
    id v13 = v8;
    id v14 = self;
    uint64_t v16 = v9;
    id v15 = v7;
    -[CPLCloudKitTransportTask _fetchZoneForZoneID:operationType:completionHandler:]( self,  "_fetchZoneForZoneID:operationType:completionHandler:",  v10,  v9,  v12);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:description:",  32LL,  @"No zone for %@",  v6));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v11);
  }
}

- (void)_fetchRecordsFollowRemappingWithIDs:(id)a3 alreadyFetchRecordIDs:(id)a4 remappedRecordIDs:(id)a5 realRecords:(id)a6 type:(int64_t)a7 storeRequestUUIDsIn:(id)a8 completionHandler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000773B4;
  v25[3] = &unk_100241438;
  id v26 = a8;
  id v27 = v16;
  id v28 = v15;
  id v29 = v17;
  id v30 = v18;
  id v31 = self;
  id v32 = a9;
  int64_t v33 = a7;
  id v19 = v18;
  id v20 = v17;
  id v21 = v15;
  id v22 = v16;
  id v23 = v32;
  id v24 = v26;
  -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v21,  0LL,  0LL,  a7,  v25);
}

- (id)_recordWithRecordID:(id)a3 usingRealRecords:(id)a4 remappedRecordIDs:(id)a5 wantsAllRecords:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
  if (!v12)
  {
    id v14 = v9;
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v14]);
    id v16 = 0LL;
    if (v15)
    {
      id v9 = v14;
      while (1)
      {
        id v17 = (void *)v15;
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v15]);
        if (v18)
        {
          id v13 = (void *)v18;
          if (_CPLSilentLogging) {
            goto LABEL_31;
          }
          id v24 = sub_1000733A0();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v30 = 138543618;
            id v31 = v14;
            __int16 v32 = 2114;
            int64_t v33 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "%{public}@ has been remapped to %{public}@",  (uint8_t *)&v30,  0x16u);
          }

          goto LABEL_29;
        }

        if (!v16) {
          id v16 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
        }
        -[NSMutableSet addObject:](v16, "addObject:", v9);

        uint64_t v15 = objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v17]);
        id v9 = v17;
        if (!v15)
        {
          if (v6) {
            goto LABEL_13;
          }
          goto LABEL_30;
        }
      }

      if (_CPLSilentLogging)
      {
        id v13 = 0LL;
        goto LABEL_31;
      }

      id v25 = sub_1000733A0();
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v16, "allObjects"));
        id v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsJoinedByString:", @", "));
        int v30 = 138543874;
        id v31 = v14;
        __int16 v32 = 2114;
        int64_t v33 = v17;
        __int16 v34 = 2114;
        uint64_t v35 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%{public}@ has been remapped to %{public}@ in an infinite loop: %{public}@",  (uint8_t *)&v30,  0x20u);
      }

      id v13 = 0LL;
      goto LABEL_29;
    }

    id v17 = v14;
    if (v6)
    {
LABEL_13:
      if ([v17 isEqual:v14])
      {
        if (!_CPLSilentLogging)
        {
          id v19 = sub_1000733A0();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            int v30 = 138543362;
            id v31 = v14;
            id v21 = "%{public}@ record not found on server";
            id v22 = v20;
            uint32_t v23 = 12;
LABEL_27:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v30, v23);
            goto LABEL_28;
          }

          goto LABEL_28;
        }
      }

      else if (!_CPLSilentLogging)
      {
        id v28 = sub_1000733A0();
        id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          int v30 = 138543618;
          id v31 = v14;
          __int16 v32 = 2114;
          int64_t v33 = v17;
          id v21 = "%{public}@ record (remapped to %{public}@) not found on server";
          id v22 = v20;
          uint32_t v23 = 22;
          goto LABEL_27;
        }

- (void)fetchRecordsFollowRemappingWithIDs:(id)a3 wantsAllRecords:(BOOL)a4 type:(int64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = [v10 count];
  id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v14 = -[NSMutableSet initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableSet), "initWithCapacity:", v12);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100077B44;
  v20[3] = &unk_100241460;
  id v21 = v13;
  id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  BOOL v27 = a4;
  id v23 = v10;
  id v24 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  v12);
  id v25 = self;
  id v26 = v11;
  uint64_t v15 = v24;
  id v16 = v10;
  id v17 = v22;
  uint64_t v18 = v13;
  id v19 = v11;
  -[CPLCloudKitTransportTask _fetchRecordsFollowRemappingWithIDs:alreadyFetchRecordIDs:remappedRecordIDs:realRecords:type:storeRequestUUIDsIn:completionHandler:]( self,  "_fetchRecordsFollowRemappingWithIDs:alreadyFetchRecordIDs:remappedRecordIDs:realRecords:type:storeRequestUUIDsIn:completionHandler:",  v16,  v14,  v17,  v15,  a5,  v18,  v20);
}

- (void)_createSparsePrivateRecordsIfNecessary:(id)a3 recordClass:(Class)a4 userRecordID:(id)a5 completionHandler:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 propertyMapping]);
  unsigned __int8 v15 = [v14 doesRecordClassSupportSparseRecords:a4];

  if ((v15 & 1) == 0) {
    sub_1001967E0((uint64_t)a4, (uint64_t)a2, (uint64_t)self);
  }
  id v16 = CKRecordTypeForCPLRecordChangeClass((uint64_t)a4);
  id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedRecordIDsToMissingPrivateRecordIDs]);
  if ([v18 count])
  {
    uint64_t v19 = objc_claimAutoreleasedReturnValue([v11 sharedZoneIdentification]);
    if (!v19) {
      sub_100196718((uint64_t)a2, (uint64_t)self);
    }
    id v20 = (void *)v19;
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v18 allKeys]);
    id v21 = v13;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v11 sharedZoneIdentification]);
    id v24 = [v22 operationType];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_10008A59C;
    v26[3] = &unk_100241B90;
    id v33 = v21;
    id v27 = v18;
    id v28 = v17;
    id v29 = self;
    SEL v34 = a2;
    Class v35 = a4;
    id v30 = v20;
    id v31 = v11;
    id v32 = v12;
    id v23 = v20;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:]( self,  "fetchRecordsWithIDs:fetchResources:wantsAllRecords:type:completionHandler:",  v25,  0LL,  0LL,  v24,  v26);

    id v13 = v21;
  }

  else
  {
    (*((void (**)(id, void *, void))v13 + 2))(v13, &__NSDictionary0__struct, 0LL);
  }
}

- (id)_errorForUpdateError:(id)a3 scopeProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  if (!v8) {
    goto LABEL_9;
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[CPLCloudKitErrors realErrorForError:](&OBJC_CLASS___CPLCloudKitErrors, "realErrorForError:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  unsigned int v11 = [v10 isEqualToString:CKErrorDomain];

  if (!v11 || [v9 code] != (id)26 && objc_msgSend(v9, "code") != (id)28)
  {
    if (v9)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransportTask lastOperationRequestUUIDs](self, "lastOperationRequestUUIDs"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitErrors CPLErrorForCloudKitError:scopeProvider:withRequestUUIDs:description:]( &OBJC_CLASS___CPLCloudKitErrors,  "CPLErrorForCloudKitError:scopeProvider:withRequestUUIDs:description:",  v9,  v7,  v13,  @"Failed to update records"));

      id v9 = (void *)v13;
      goto LABEL_8;
    }

- (void)updatePrivatePropertiesOnAssetsWithScopedIdentifiers:(id)a3 desiredKeys:(id)a4 destinationZoneIdentification:(id)a5 sharedZoneIdentification:(id)a6 targetMapping:(id)a7 knownRecords:(id)a8 shouldUpdateRecord:(id)a9 updateBlock:(id)a10 completionHandler:(id)a11
{
  id v34 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_10008ACF8;
  v36[3] = &unk_100241C58;
  void v36[4] = self;
  id v37 = v34;
  id v38 = v18;
  id v39 = v19;
  id v24 = v18;
  id v40 = v20;
  id v41 = v21;
  id v42 = v17;
  id v43 = a11;
  id v44 = v22;
  id v45 = v23;
  id v25 = v23;
  id v26 = v22;
  id v27 = v17;
  id v28 = v21;
  id v29 = v20;
  id v30 = v19;
  id v31 = v24;
  id v32 = v34;
  id v33 = v43;
  -[CPLCloudKitTransportTask getUserRecordIDFetchIfNecessaryWithCompletionHandler:]( self,  "getUserRecordIDFetchIfNecessaryWithCompletionHandler:",  v36);
}

- (void)updateRecords:(id)a3 cloudKitScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    id v22 = self;
    unsigned int v11 = -[NSMutableDictionary initWithCapacity:]( [NSMutableDictionary alloc],  "initWithCapacity:",  [v8 count]);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v12 = v8;
    id v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
          id v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "recordID", v22));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v17, v18);
        }

        id v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }

      while (v14);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v11, "allKeys"));
    uint64_t v20 = CPLCloudKitOperationTypeForScope(v9);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10008BA38;
    void v23[3] = &unk_100241C80;
    id v24 = v12;
    id v28 = v10;
    id v25 = v11;
    id v26 = v22;
    id v27 = v9;
    id v21 = v11;
    -[CPLCloudKitTransportTask fetchRecordsWithIDs:fetchResources:desiredKeys:wantsAllRecords:type:completionHandler:]( v22,  "fetchRecordsWithIDs:fetchResources:desiredKeys:wantsAllRecords:type:completionHandler:",  v19,  0LL,  &__NSArray0__struct,  0LL,  v20,  v23);
  }

  else
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0LL);
  }
}

- (void)uploadRecords:(id)a3 cloudKitScope:(id)a4 scopeProvider:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v24 = 0LL;
  unsigned __int8 v14 = -[CPLCloudKitTransportTask shouldRunOperationsWithError:](self, "shouldRunOperationsWithError:", &v24);
  id v15 = v24;
  if ((v14 & 1) != 0)
  {
    if ([v10 count])
    {
      id v16 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v10,  &__NSArray0__struct);
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      id v19 = sub_10008BCDC;
      uint64_t v20 = &unk_100241CA8;
      id v21 = self;
      id v23 = v13;
      id v22 = v12;
      -[CKModifyRecordsOperation setModifyRecordsCompletionBlock:](v16, "setModifyRecordsCompletionBlock:", &v17);
      -[CKModifyRecordsOperation setSavePolicy:](v16, "setSavePolicy:", 1LL, v17, v18, v19, v20, v21);
      -[CPLCloudKitTransportTask launchOperation:type:withContext:]( self,  "launchOperation:type:withContext:",  v16,  CPLCloudKitOperationTypeForScope(v11),  0LL);
    }

    else
    {
      (*((void (**)(id, void))v13 + 2))(v13, 0LL);
    }
  }

  else
  {
    (*((void (**)(id, id))v13 + 2))(v13, v15);
  }
}

@end