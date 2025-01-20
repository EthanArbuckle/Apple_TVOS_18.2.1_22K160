@interface PDCardCloudManager
+ (BOOL)shouldProcessChangeEventBatchLaterDueToError:(id)a3;
+ (BOOL)shouldProcessPendingChangesSignificantlyLaterDueToError:(id)a3;
+ (BOOL)shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:(id)a3;
- (BOOL)changeEventsAreBeingProcessed;
- (BOOL)handleUpdatedPass:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7;
- (BOOL)isBusy;
- (BOOL)isUploadTooExpensive;
- (PDCardCloudManager)initWithContainer:(id)a3;
- (PDCardCloudManagerContainer)container;
- (PDCardCloudManagerLocalDataSource)dataSource;
- (id)convertConflicts:(id)a3;
- (id)describePasses:(id)a3;
- (id)describeRecord:(id)a3;
- (id)events:(id)a3 matchingPasses:(id)a4;
- (id)identifiersOfChangeEvents:(id)a3;
- (id)identifiersOfPasses:(id)a3;
- (id)localRecordIDs;
- (id)passesChangedByEvents:(id)a3 revokedOut:(id *)a4;
- (id)recordUniqueIDsChangedByEvents:(id)a3;
- (id)reflectRemoteUpdates:(id)a3 perRequest:(id)a4;
- (void)abortChangeProcessing;
- (void)clearChangeHistory;
- (void)deleteCloudSyncRelatedInformation;
- (void)didFinishSync:(id)a3;
- (void)fetchChangeEvents;
- (void)finishChangeProcessing;
- (void)forEachChangeIn:(id)a3 perform:(id)a4;
- (void)forEachDeleteIn:(id)a3 perform:(id)a4;
- (void)handleCatalogUpdateResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5;
- (void)handleInvalidPass:(id)a3 inDatabase:(id)a4 remoteChanges:(id)a5;
- (void)handlePassRemovalResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5;
- (void)handlePassUpdateResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7;
- (void)handlePassUploadResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7;
- (void)handleRemovedPass:(id)a3 updateSaveRequest:(id)a4 shouldSave:(BOOL)a5;
- (void)handleRemovedPassCatalog:(id)a3;
- (void)handleUpdatedPassCatalog:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7;
- (void)markBatchOfChangesAsProcessed:(_NSRange)a3;
- (void)preapareForSyncingAndRegisterChanges:(BOOL)a3;
- (void)prepareToSaveRemoteData;
- (void)processEventBatch:(id)a3 inRange:(_NSRange)a4 completion:(id)a5;
- (void)processNextEventBatch;
- (void)processPassAddEventsFromEvents:(id)a3 completion:(id)a4;
- (void)processPassRemoveEventsFromEvents:(id)a3 completion:(id)a4;
- (void)processPassUpdateEventsFromEvents:(id)a3 completion:(id)a4;
- (void)processPendingCatalogChanges:(id)a3 completion:(id)a4;
- (void)processPendingChanges:(id)a3;
- (void)reduceUnprocessedChangeEventsToLatestOnlyAndSetError;
- (void)reflectRemoteDeletes:(id)a3 perRequest:(id)a4;
- (void)registerProcessPendingChangesCompletion:(id)a3;
- (void)resetMigration;
- (void)saveLocalDataInContainer:(id)a3 completion:(id)a4;
- (void)saveRemoteDataFromContainer:(id)a3 completion:(id)a4;
- (void)setDataSource:(id)a3;
@end

@implementation PDCardCloudManager

+ (BOOL)shouldProcessChangeEventBatchLaterDueToError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([a1 shouldProcessPendingChangesSignificantlyLaterDueToError:v4])
    {
      unsigned __int8 v5 = 1;
    }

    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
      unint64_t v7 = (unint64_t)[v4 code];
      v8 = v6;
      v9 = v8;
      if (v8 == @"PDPassContainerErrorDomain"
        || v8
        && (unsigned int v10 = -[__CFString isEqualToString:]( v8,  "isEqualToString:",  @"PDPassContainerErrorDomain"),  v9,  v10))
      {
        unsigned __int8 v5 = (v7 & 0xFFFFFFFFFFFFFFFDLL) == 204;
      }

      else
      {
        id v11 = [[PKCloudStoreError alloc] initWithError:v4];
        else {
          unsigned __int8 v5 = [v11 isAccountUnavailable];
        }
      }
    }
  }

  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

+ (BOOL)shouldProcessPendingChangesSignificantlyLaterDueToError:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unint64_t v6 = (unint64_t)[v4 code];
    unint64_t v7 = v5;
    v8 = v7;
    if (v7 == @"PDPassContainerErrorDomain"
      || v7
      && (unsigned int v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"PDPassContainerErrorDomain"),
          v8,
          v9))
    {
      unsigned __int8 v10 = (v6 & 0xFFFFFFFFFFFFFFFDLL) == 205;
    }

    else
    {
      id v11 = [[PKCloudStoreError alloc] initWithError:v4];
      if (([v11 isAuthenticationOrQuotaError] & 1) != 0
        || ([v11 isKeychainSyncingInProgress] & 1) != 0
        || ([v11 isPCSError] & 1) != 0)
      {
        unsigned __int8 v10 = 1;
      }

      else
      {
        unsigned __int8 v10 = [v11 isUnrecoverableDecryptionError];
      }
    }
  }

  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (BOOL)shouldProcessPendingChangesWhenConnectedToPowerSupplyDueToError:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  id v5 = [v3 code];

  unint64_t v6 = v4;
  unint64_t v7 = v6;
  if (v6 == @"PDPassContainerErrorDomain")
  {
    unsigned __int8 v8 = 1;
  }

  else if (v6)
  {
    unsigned __int8 v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", @"PDPassContainerErrorDomain");
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  if (v5 == (id)207) {
    BOOL v9 = v8;
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (PDCardCloudManager)initWithContainer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PDCardCloudManager;
  unint64_t v6 = -[PDCardCloudManager init](&v15, "init");
  unint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_container, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 identifier]);
    containerIdentifier = v7->_containerIdentifier;
    v7->_containerIdentifier = (NSString *)v8;

    unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    unprocessedChangeEvents = v7->_unprocessedChangeEvents;
    v7->_unprocessedChangeEvents = v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    processChangeEventsCompletionBlocks = v7->_processChangeEventsCompletionBlocks;
    v7->_processChangeEventsCompletionBlocks = v12;

    -[PDCardCloudManagerContainer setLocalStore:](v7->_container, "setLocalStore:", v7);
  }

  return v7;
}

- (void)preapareForSyncingAndRegisterChanges:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  [v5 containerManager:self willSyncWithContainer:self->_containerIdentifier scanForMissedChanges:v3];
}

- (void)prepareToSaveRemoteData
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  [v3 willDownloadAllDataFromContainer:self->_containerIdentifier];
}

- (void)didFinishSync:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  [v5 didFinishSyncWithContainer:self->_containerIdentifier error:v4];
}

- (void)saveRemoteDataFromContainer:(id)a3 completion:(id)a4
{
  id v5 = a3;
  unint64_t v6 = (void (**)(id, void, void *))a4;
  if ((PKCloudKitPassSyncEnabled(v6, v7) & 1) != 0)
  {
    if (v5)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);

      if (v8)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);
          *(_DWORD *)buf = 138543362;
          v57 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] can't apply batch because there was an error %{public}@ (full-sync-download)",  buf,  0xCu);
        }

        v12 = (void *)objc_claimAutoreleasedReturnValue([v5 errorEncounered]);
        v6[2](v6, 0LL, v12);
      }

      else
      {
        v43 = v6;
        id v44 = v5;
        objc_super v15 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudPasses]);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
        v17 = (void *)objc_claimAutoreleasedReturnValue([v16 localPassesMatchingPasses:v15]);

        v42 = v17;
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "pk_indexDictionaryByApplyingBlock:", &stru_10064E7C8));
        uint64_t v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pk_indexDictionaryByApplyingBlock:", &stru_10064E808));
        uint64_t v19 = PKLogFacilityTypeGetObject(9LL);
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v57 = (PDCardCloudManagerSaveRequest *)v18;
          __int16 v58 = 2114;
          v59 = v50;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] will diff cloud batch: %{public}@ against local matches: %{public}@ (full-sync-download)",  buf,  0x16u);
        }

        v41 = (void *)v18;

        v21 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
        -[PDCardCloudManagerSaveRequest setOriginator:]( v21,  "setOriginator:",  @"-[PDCardCloudManager saveRemoteDataFromContainer:completion:] (full-sync-download)");
        v47 = v21;
        -[PDCardCloudManagerSaveRequest delayExecutionOfRemotePortion](v21, "delayExecutionOfRemotePortion");
        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        id obj = v15;
        id v51 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v51)
        {
          uint64_t v48 = *(void *)v53;
          oslog = v20;
          do
          {
            for (i = 0LL; i != v51; i = (char *)i + 1)
            {
              if (*(void *)v53 != v48) {
                objc_enumerationMutation(obj);
              }
              v23 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
              v24 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue([v23 uniqueID]);
              v25 = (void *)objc_claimAutoreleasedReturnValue([v50 objectForKeyedSubscript:v24]);
              if (v25)
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue([v23 manifestHash]);
                v27 = (void *)objc_claimAutoreleasedReturnValue([v25 manifestHash]);
                unsigned int v28 = [v26 isEqualToData:v27];

                v29 = (void *)objc_claimAutoreleasedReturnValue([v23 modifiedDate]);
                v30 = (void *)objc_claimAutoreleasedReturnValue([v25 modifiedDate]);
                if ([v29 compare:v30] == (id)-1)
                {
                  BOOL v33 = 1;
                }

                else
                {
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v23 sequenceCounter]);
                  v32 = (void *)objc_claimAutoreleasedReturnValue([v25 sequenceCounter]);
                  BOOL v33 = [v31 compare:v32] == (id)-1;
                }

                unsigned int v34 = v28 ^ 1;
              }

              else
              {
                unsigned int v34 = 0;
                BOOL v33 = 0;
              }

              if (v25) {
                uint64_t v35 = v34 & v33;
              }
              else {
                uint64_t v35 = 0LL;
              }
              v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%d, %d, %d)",  v25 != 0LL,  v34,  v33,  v41));
              if (v25)
              {
                if ((v34 & 1) != 0)
                {
                  unsigned int v37 = 0;
                  int v38 = !v33;
                }

                else
                {
                  int v38 = 0;
                  unsigned int v37 = [v25 wasAchivedInCloudStoreWithIdentifier:self->_containerIdentifier] ^ 1;
                }
              }

              else
              {
                int v38 = 0;
                unsigned int v37 = 0;
              }

              v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(%d, %d, %d)",  v35,  v37,  v25 == 0LL));
              v20 = oslog;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543874;
                v57 = v24;
                __int16 v58 = 2114;
                v59 = v36;
                __int16 v60 = 2114;
                v61 = v39;
                _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] cloud pass:%{public}@ comparison:%{public}@ action:%{public}@ (full-sync-download)",  buf,  0x20u);
              }

              if ((_DWORD)v35)
              {
                -[PDCardCloudManagerSaveRequest updateRemotePassWithPass:](v47, "updateRemotePassWithPass:", v25);
              }

              else if ((v38 | v37) == 1 || !v25)
              {
                -[PDCardCloudManagerSaveRequest updateLocalPassWithPass:](v47, "updateLocalPassWithPass:", v23);
              }
            }

            id v51 = [obj countByEnumeratingWithState:&v52 objects:v62 count:16];
          }

          while (v51);
        }

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v57 = v47;
          _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] will apply result of diff: %{public}@ (full-sync-download)",  buf,  0xCu);
        }

        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
        unint64_t v6 = v43;
        [v40 executeSaveRequest:v47 completion:v43];

        id v5 = v44;
      }
    }

    else
    {
      uint64_t v13 = PKLogFacilityTypeGetObject(9LL);
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] can't apply batch because it's nil (full-sync-download)",  buf,  2u);
      }

      v6[2](v6, 0LL, 0LL);
    }
  }

  else if (v6)
  {
    v6[2](v6, 1LL, 0LL);
  }
}

- (void)saveLocalDataInContainer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if ((PKCloudKitPassSyncEnabled(v7, v8) & 1) != 0)
  {
    if (v6)
    {
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v6 errorEncounered]);

      if (v9)
      {
        uint64_t Object = PKLogFacilityTypeGetObject(9LL);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue([v6 errorEncounered]);
          *(_DWORD *)buf = 138543362;
          uint64_t v19 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] can't save data because there was an error %{public}@ (full-sync-upload)",  buf,  0xCu);
        }

        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 errorEncounered]);
        v7[2](v7, 0LL, v13);
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100239450;
        v17[3] = &unk_10063ABB8;
        v17[4] = self;
        [v16 allLocalPasses:v17];

        -[PDCardCloudManager processPendingChanges:](self, "processPendingChanges:", v7);
      }
    }

    else
    {
      uint64_t v14 = PKLogFacilityTypeGetObject(9LL);
      objc_super v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] can't save data because contents are nil (full-sync-upload)",  buf,  2u);
      }

      v7[2](v7, 0LL, 0LL);
    }
  }

  else if (v7)
  {
    v7[2](v7, 1LL, 0LL);
  }
}

- (id)convertConflicts:(id)a3
{
  id v4 = a3;
  if (PKCloudKitPassSyncEnabled(v4, v5))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1002397D0;
    v10[3] = &unk_10064E830;
    v10[4] = self;
    id v6 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
    id v11 = v6;
    -[PDCardCloudManager forEachChangeIn:perform:](self, "forEachChangeIn:perform:", v4, v10);
    uint64_t v7 = v11;
    uint64_t v8 = v6;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

- (void)handleInvalidPass:(id)a3 inDatabase:(id)a4 remoteChanges:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v9 = a5;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 recordName]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[PKPass uniqueIDFromRecordName:](&OBJC_CLASS___PKPass, "uniqueIDFromRecordName:", v11));

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    BOOL v33 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] couldn't convert conflicting record to a pass %{public}@",  buf,  0xCu);
  }

  objc_super v15 = objc_alloc_init(&OBJC_CLASS___PKPass);
  -[PKPass setUniqueID:](v15, "setUniqueID:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v8 creationDate]);
  -[PKPass setIngestedDate:](v15, "setIngestedDate:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue([v8 modificationDate]);
  -[PKPass setModifiedDate:](v15, "setModifiedDate:", v17);

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_systemFieldsData"));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerContainer identifier](self->_container, "identifier"));
  -[PKPass setSystemFieldsMetata:forCloudStoreWithIdentifier:]( v15,  "setSystemFieldsMetata:forCloudStoreWithIdentifier:",  v18,  v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  v31 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v31, 1LL));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v20 localPassesMatchingPasses:v21]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 firstObject]);

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pk_systemFieldsData"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerContainer identifier](self->_container, "identifier"));
    [v23 setSystemFieldsMetata:v24 forCloudStoreWithIdentifier:v25];

    id v26 = objc_alloc(&OBJC_CLASS___PKCloudRecordPass);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v8));
    uint64_t v14 = (os_log_s *)[v26 initWithRecords:v27];

    -[os_log_s setPass:](v14, "setPass:", v23);
    unsigned int v28 = v30;
    [v9 addCloudRecord:v14 forContainerDatabaseIdentifier:v30];
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[PKPass uniqueID](v15, "uniqueID"));
      *(_DWORD *)buf = 138543362;
      BOOL v33 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] couldn't find a local pass %{public}@ to use for conflict resolution",  buf,  0xCu);
    }

    unsigned int v28 = v30;
  }
}

- (id)reflectRemoteUpdates:(id)a3 perRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKCloudKitPassSyncEnabled(v7, v8))
  {
    unsigned int v9 = [v7 storeChangesInDatabase];
    unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___PKCloudRecordArray);
    id v11 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:]( v11,  "setOriginator:",  @"-[PDCardCloudManager reflectRemoteUpdates:perRequest:]");
    uint64_t v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472LL;
    v20 = sub_100239CB0;
    v21 = &unk_10064E858;
    v22 = self;
    v12 = v11;
    v23 = v12;
    char v25 = v9;
    uint64_t v13 = v10;
    v24 = v13;
    -[PDCardCloudManager forEachChangeIn:perform:](self, "forEachChangeIn:perform:", v6, &v18);
    if (v9 && !-[PDCardCloudManagerSaveRequest isEmpty](v12, "isEmpty", v18, v19, v20, v21, v22, v23))
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
      [v14 executeSaveRequest:v12 completion:0];
    }

    objc_super v15 = v24;
    v16 = v13;
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

- (BOOL)handleUpdatedPass:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_alloc(&OBJC_CLASS___PKCloudStoreRecord);
  id v35 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  id v18 = [v16 initWithRecords:v17];

  uint64_t v19 = -[PKPass initWithCloudStoreCoder:](objc_alloc(&OBJC_CLASS___PKPass), "initWithCloudStoreCoder:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pk_systemFieldsData"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManagerContainer identifier](self->_container, "identifier"));
  -[PKPass setSystemFieldsMetata:forCloudStoreWithIdentifier:]( v19,  "setSystemFieldsMetata:forCloudStoreWithIdentifier:",  v20,  v21);

  if (v19)
  {
    id v22 = objc_alloc(&OBJC_CLASS___PKCloudRecordPass);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
    id v24 = [v22 initWithRecords:v23];

    [v24 setPass:v19];
    [v15 addCloudRecord:v24 forContainerDatabaseIdentifier:v13];
    if (v8)
    {
      uint64_t Object = PKLogFacilityTypeGetObject(9LL);
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PKPass uniqueID](v19, "uniqueID"));
        unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager describeRecord:](self, "describeRecord:", v12));
        int v31 = 138543618;
        v32 = v27;
        __int16 v33 = 2112;
        unsigned int v34 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] Received pass update with unique id: %{public}@ %@",  (uint8_t *)&v31,  0x16u);
      }

      [v14 updateLocalPassWithPass:v19];
    }
  }

  else
  {
    uint64_t v29 = PKLogFacilityTypeGetObject(9LL);
    id v24 = (id)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v31) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] Error creating the PKPass from the cloud record",  (uint8_t *)&v31,  2u);
    }
  }

  return v19 != 0LL;
}

- (void)handleUpdatedPassCatalog:(id)a3 inDatabase:(id)a4 updateSaveRequest:(id)a5 shouldSave:(BOOL)a6 remoteChanges:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v39 = a5;
  id v14 = a7;
  id v15 = objc_alloc(&OBJC_CLASS___PKCloudStoreRecord);
  id v42 = v12;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v42, 1LL));
  id v17 = [v15 initWithRecords:v16];

  int v38 = v17;
  id v18 = -[PKCatalog initWithCloudStoreCoder:](objc_alloc(&OBJC_CLASS___PKCatalog), "initWithCloudStoreCoder:", v17);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 existingCatalog]);

  unsigned int v37 = (void *)v20;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[PKCatalog catalogWithLocalCatalog:ubiquitousCatalog:]( &OBJC_CLASS___PKCatalog,  "catalogWithLocalCatalog:ubiquitousCatalog:",  v20,  0LL));
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[PKCatalog catalogWithLocalCatalog:ubiquitousCatalog:]( &OBJC_CLASS___PKCatalog,  "catalogWithLocalCatalog:ubiquitousCatalog:"));
  id v22 = &OBJC_CLASS___PKAccountWebServiceRequestPhysicalCardRequest_ptr;
  v23 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  if (v8)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    char v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager describeRecord:](self, "describeRecord:", v12));
      *(_DWORD *)buf = 138412290;
      v41 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] Received catalog update %@",  buf,  0xCu);
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v27 existingCatalog]);

    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[PKCatalog catalogWithLocalCatalog:ubiquitousCatalog:]( &OBJC_CLASS___PKCatalog,  "catalogWithLocalCatalog:ubiquitousCatalog:",  v28,  v18));
    [v39 updateLocalCatalogWithCatalog:v29];
    id v30 = objc_alloc(&OBJC_CLASS___PKCloudRecordPassCatalog);
    v23 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    int v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
    id v32 = [v30 initWithRecords:v31];

    [v32 setCatalog:v29];
    [v14 addCloudRecord:v32 forContainerDatabaseIdentifier:v13];

    id v22 = &OBJC_CLASS___PKAccountWebServiceRequestPhysicalCardRequest_ptr;
  }

  id v33 = objc_alloc((Class)v22[70]);
  unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue([v23[408] setWithObject:v12]);
  id v35 = [v33 initWithRecords:v34];

  [v35 setCatalog:v21];
  [v14 addCloudRecord:v35 forContainerDatabaseIdentifier:v13];
}

- (void)reflectRemoteDeletes:(id)a3 perRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKCloudKitPassSyncEnabled(v7, v8))
  {
    unsigned int v9 = [v7 storeChangesInDatabase];
    unsigned __int8 v10 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:]( v10,  "setOriginator:",  @"-[PDCardCloudManager reflectRemoteDeletes:perRequest:]");
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10023A3C0;
    v13[3] = &unk_10064E880;
    v13[4] = self;
    id v11 = v10;
    id v14 = v11;
    char v15 = v9;
    -[PDCardCloudManager forEachDeleteIn:perform:](self, "forEachDeleteIn:perform:", v6, v13);
    if (v9 && !-[PDCardCloudManagerSaveRequest isEmpty](v11, "isEmpty"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
      [v12 executeSaveRequest:v11 completion:0];
    }
  }
}

- (void)handleRemovedPass:(id)a3 updateSaveRequest:(id)a4 shouldSave:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([a3 recordName]);
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[PKPass uniqueIDFromRecordName:](&OBJC_CLASS___PKPass, "uniqueIDFromRecordName:", v9));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 existingPassWithUniqueID:v10]);

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    id v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] Received pass removal with unique id %@",  (uint8_t *)&v15,  0xCu);
  }

  if (v12)
  {
    if (v5) {
      [v8 removeLocalPass:v12];
    }
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] The pass with unique id %@ does not exist locally so it will not be deleted.",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)handleRemovedPassCatalog:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 recordName]);
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] The server has removed pass catalog %@",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)processPendingChanges:(id)a3
{
  id v4 = a3;
  if ((PKCloudKitPassSyncEnabled(v4, v5) & 1) != 0)
  {
    id v6 = PDDefaultQueue();
    int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10023A718;
    v8[3] = &unk_10063AC90;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }

  else if (v4)
  {
    (*((void (**)(id, uint64_t, void))v4 + 2))(v4, 1LL, 0LL);
  }
}

- (void)registerProcessPendingChangesCompletion:(id)a3
{
  processChangeEventsCompletionBlocks = self->_processChangeEventsCompletionBlocks;
  id v4 = objc_retainBlock(a3);
  -[NSMutableArray safelyAddObject:](processChangeEventsCompletionBlocks, "safelyAddObject:", v4);
}

- (BOOL)changeEventsAreBeingProcessed
{
  return -[NSMutableArray count](self->_unprocessedChangeEvents, "count") != 0LL;
}

- (void)fetchChangeEvents
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchChangeEvents]);
  uint64_t v5 = (NSMutableArray *)[v4 mutableCopy];
  unprocessedChangeEvents = self->_unprocessedChangeEvents;
  self->_unprocessedChangeEvents = v5;

  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = -[NSMutableArray count](self->_unprocessedChangeEvents, "count");
    int v10 = 134349056;
    id v11 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] fetched %{public}lu change events",  (uint8_t *)&v10,  0xCu);
  }
}

- (BOOL)isUploadTooExpensive
{
  if ((unint64_t)-[NSMutableArray pk_countObjectsPassingTest:]( self->_unprocessedChangeEvents,  "pk_countObjectsPassingTest:",  &stru_10064E8C0) < 0x177) {
    return 0;
  }
  else {
    return PKDeviceHasInternalBatteryAndIsUnplugged();
  }
}

- (void)reduceUnprocessedChangeEventsToLatestOnlyAndSetError
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  unprocessedChangeEvents = self->_unprocessedChangeEvents;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10023AB90;
  v18[3] = &unk_10064E8E8;
  id v5 = v3;
  id v19 = v5;
  -[NSMutableArray pk_removeObjectsPassingTest:](unprocessedChangeEvents, "pk_removeObjectsPassingTest:", v18);
  id v6 = self->_unprocessedChangeEvents;
  int v7 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"recordType",  0LL);
  v20[0] = v7;
  id v8 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"type",  0LL);
  v20[1] = v8;
  id v9 = -[NSSortDescriptor initWithKey:ascending:]( objc_alloc(&OBJC_CLASS___NSSortDescriptor),  "initWithKey:ascending:",  @"timestamp",  1LL);
  v20[2] = v9;
  int v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v20, 3LL));
  id v11 = -[NSMutableArray sortedArrayUsingDescriptors:](v6, "sortedArrayUsingDescriptors:", v10);

  id v12 = (char *)-[NSMutableArray count](self->_unprocessedChangeEvents, "count");
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] upload is too expensive, reduced size due to device constraints",  v17,  2u);
  }

  int v15 = (NSError *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"PDPassContainerErrorDomain",  207LL,  0LL));
  changeProcessingError = self->_changeProcessingError;
  self->_changeProcessingError = v15;
}

- (void)processNextEventBatch
{
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] will try to process pending chages batch",  buf,  2u);
  }

  else {
    uint64_t v5 = 75LL;
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_unprocessedChangeEvents, "subarrayWithRange:", 0LL, v5));
  id v7 = [v6 count];
  BOOL v8 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] processing pending change batch",  buf,  2u);
    }

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10023AD68;
    v9[3] = &unk_100639300;
    v9[4] = self;
    -[PDCardCloudManager processEventBatch:inRange:completion:]( self,  "processEventBatch:inRange:completion:",  v6,  0LL,  v5,  v9);
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] no more change batches to process",  buf,  2u);
    }

    -[PDCardCloudManager finishChangeProcessing](self, "finishChangeProcessing");
  }
}

- (void)abortChangeProcessing
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = self->_processChangeEventsCompletionBlocks;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7) + 16LL))(*(void *)(*((void *)&v9 + 1) + 8LL * (void)v7));
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v9,  v13,  16LL);
    }

    while (v5);
  }

  changeProcessingError = self->_changeProcessingError;
  self->_changeProcessingError = 0LL;

  -[NSMutableArray removeAllObjects](self->_unprocessedChangeEvents, "removeAllObjects", (void)v9);
  -[NSMutableArray removeAllObjects](self->_processChangeEventsCompletionBlocks, "removeAllObjects");
}

- (void)finishChangeProcessing
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v3 = self->_processChangeEventsCompletionBlocks;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void, BOOL))(*(void *)(*((void *)&v13 + 1) + 8LL * (void)v7) + 16LL))( *(void *)(*((void *)&v13 + 1) + 8LL * (void)v7),  self->_changeProcessingError == 0LL);
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v5);
  }

  id v8 = -[NSMutableArray count](self->_processChangeEventsCompletionBlocks, "count");
  changeProcessingError = self->_changeProcessingError;
  self->_changeProcessingError = 0LL;

  -[NSMutableArray removeAllObjects](self->_processChangeEventsCompletionBlocks, "removeAllObjects");
  if (!changeProcessingError && (unint64_t)v8 >= 2)
  {
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v12 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] looks like more process-pending-changes requests were made",  v12,  2u);
    }

    -[PDCardCloudManager fetchChangeEvents](self, "fetchChangeEvents");
    if (-[PDCardCloudManager changeEventsAreBeingProcessed](self, "changeEventsAreBeingProcessed")) {
      -[PDCardCloudManager processNextEventBatch](self, "processNextEventBatch");
    }
  }

- (void)processEventBatch:(id)a3 inRange:(_NSRange)a4 completion:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x3032000000LL;
  v32[3] = sub_10023B310;
  v32[4] = sub_10023B320;
  id v33 = 0LL;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_10023B328;
  v29[3] = &unk_10063B5A8;
  v29[4] = self;
  id v12 = v9;
  id v30 = v12;
  int v31 = v32;
  [v11 addOperation:v29];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_10023B454;
  v26[3] = &unk_10063B5A8;
  v26[4] = self;
  id v13 = v12;
  id v27 = v13;
  unsigned int v28 = v32;
  [v11 addOperation:v26];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10023B580;
  v23[3] = &unk_10063B5A8;
  v23[4] = self;
  id v14 = v13;
  id v24 = v14;
  char v25 = v32;
  [v11 addOperation:v23];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_10023B6AC;
  v18[3] = &unk_10064E938;
  void v18[4] = self;
  uint64_t v20 = v32;
  NSUInteger v21 = location;
  NSUInteger v22 = length;
  id v16 = v10;
  id v19 = v16;
  id v17 = [v11 evaluateWithInput:v15 completion:v18];

  _Block_object_dispose(v32, 8);
}

- (void)processPassAddEventsFromEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_objectsPassingTest:", &stru_10064E958));
  if ([v7 count])
  {
    id v19 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManager passesChangedByEvents:revokedOut:]( self,  "passesChangedByEvents:revokedOut:",  v7,  &v19));
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager describePasses:](self, "describePasses:", v8));
      *(_DWORD *)buf = 138543362;
      NSUInteger v21 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] retroactively adding passes: %{public}@",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager container](self, "container"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10023B9D4;
    v15[3] = &unk_10064E980;
    v15[4] = self;
    id v16 = v19;
    id v17 = v7;
    id v18 = v6;
    [v12 updateCloudPasses:v8 completion:v15];
  }

  else
  {
    uint64_t v13 = PKLogFacilityTypeGetObject(9LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] no pending pass adds detected",  buf,  2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)processPassUpdateEventsFromEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_objectsPassingTest:", &stru_10064E9A0));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10023BCA0;
  v21[3] = &unk_10064E9C8;
  v21[4] = self;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pk_objectsPassingTest:", v21));

  if ([v8 count])
  {
    id v20 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[PDCardCloudManager passesChangedByEvents:revokedOut:]( self,  "passesChangedByEvents:revokedOut:",  v8,  &v20));
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager describePasses:](self, "describePasses:", v9));
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] retroactively updating passes: %{public}@",  buf,  0xCu);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager container](self, "container"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10023BDE0;
    v16[3] = &unk_10064E980;
    v16[4] = self;
    id v17 = v20;
    id v18 = v8;
    id v19 = v6;
    [v13 updateCloudPasses:v9 completion:v16];
  }

  else
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(9LL);
    __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] no pending pass updates detected",  buf,  2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)processPassRemoveEventsFromEvents:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_objectsPassingTest:", &stru_10064E9E8));
  if ([v7 count])
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager recordUniqueIDsChangedByEvents:](self, "recordUniqueIDsChangedByEvents:", v7));
    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] retroactively removing passes: %{public}@",  buf,  0xCu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager container](self, "container"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10023C028;
    v14[3] = &unk_10064BBE8;
    v14[4] = self;
    id v15 = v7;
    id v16 = v6;
    [v11 removeCloudPassesWithLocalUniqueIDs:v8 completion:v14];
  }

  else
  {
    uint64_t v12 = PKLogFacilityTypeGetObject(9LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] no pending pass removes detected",  buf,  2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (void)processPendingCatalogChanges:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "pk_objectsPassingTest:", &stru_10064EA08));
  id v8 = [v7 count];
  uint64_t Object = PKLogFacilityTypeGetObject(9LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] retroactively upadting pass catalog",  buf,  2u);
    }

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager container](self, "container"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 existingCatalog]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10023C21C;
    v15[3] = &unk_10064EA30;
    v15[4] = self;
    id v16 = v7;
    id v17 = v6;
    [v12 updateCloudCatalog:v14 completion:v15];
  }

  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] no pending catalog change detected",  buf,  2u);
    }

    if (v6) {
      (*((void (**)(id, void))v6 + 2))(v6, 0LL);
    }
  }
}

- (id)passesChangedByEvents:(id)a3 revokedOut:(id *)a4
{
  char v25 = a4;
  id v5 = a3;
  id v26 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * (void)i), "recordUniqueID", v25));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 existingPassWithUniqueID:v12]);

        if ([v14 supportsSyncing])
        {
          if ([v14 isRevoked])
          {
            uint64_t Object = PKLogFacilityTypeGetObject(9LL);
            id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v32 = v12;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] event was generated for revoked pass %{public}@, skipping",  buf,  0xCu);
            }

            id v17 = v6;
          }

          else
          {
            id v17 = v26;
          }

          -[NSMutableArray addObject:](v17, "addObject:", v14);
        }

        else
        {
          uint64_t v18 = PKLogFacilityTypeGetObject(9LL);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            id v32 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] event was generated for unsynced pass %{public}@, skipping",  buf,  0xCu);
          }
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }

    while (v9);
  }

  id v20 = -[NSMutableArray count](v6, "count");
  if (v25 && v20)
  {
    id v21 = -[NSMutableArray copy](v6, "copy");
    id v22 = *v25;
    id *v25 = v21;
  }

  id v23 = -[NSMutableArray copy](v26, "copy", v25);

  return v23;
}

- (id)events:(id)a3 matchingPasses:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10023C594;
  v10[3] = &unk_10064E9C8;
  id v11 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager identifiersOfPasses:](self, "identifiersOfPasses:", a4));
  id v7 = v11;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pk_objectsPassingTest:", v10));

  return v8;
}

- (id)recordUniqueIDsChangedByEvents:(id)a3
{
  return objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_10064EA70);
}

- (id)identifiersOfChangeEvents:(id)a3
{
  return objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_10064EA90);
}

- (id)identifiersOfPasses:(id)a3
{
  return objc_msgSend(a3, "pk_arrayByApplyingBlock:", &stru_10064EAB0);
}

- (void)markBatchOfChangesAsProcessed:(_NSRange)a3
{
}

- (void)handlePassUploadResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v12 || v13 || v14)
  {
    id v50 = v16;
    id v19 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:]( v19,  "setOriginator:",  @"-[PDCardCloudManager handlePassUploadResult:andEraseChangeEvents:]");
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    id v54 = v12;
    id v20 = v12;
    id v21 = [v20 countByEnumeratingWithState:&v67 objects:v76 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v68;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v68 != v23) {
            objc_enumerationMutation(v20);
          }
          -[PDCardCloudManagerSaveRequest updateLocalPassWithPass:]( v19,  "updateLocalPassWithPass:",  *(void *)(*((void *)&v67 + 1) + 8LL * (void)i));
        }

        id v22 = [v20 countByEnumeratingWithState:&v67 objects:v76 count:16];
      }

      while (v22);
    }

    __int128 v65 = 0u;
    __int128 v66 = 0u;
    __int128 v63 = 0u;
    __int128 v64 = 0u;
    id v53 = v13;
    id v25 = v13;
    id v26 = [v25 countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v64;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v64 != v28) {
            objc_enumerationMutation(v25);
          }
          -[PDCardCloudManagerSaveRequest resolveRemoteConflictingPass:]( v19,  "resolveRemoteConflictingPass:",  *(void *)(*((void *)&v63 + 1) + 8LL * (void)j));
        }

        id v27 = [v25 countByEnumeratingWithState:&v63 objects:v75 count:16];
      }

      while (v27);
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager events:matchingPasses:](self, "events:matchingPasses:", v15, v20));
    id v31 = [v30 countByEnumeratingWithState:&v59 objects:v74 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v60;
      do
      {
        for (k = 0LL; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v60 != v33) {
            objc_enumerationMutation(v30);
          }
          -[PDCardCloudManagerSaveRequest eraseChangeEvent:]( v19,  "eraseChangeEvent:",  *(void *)(*((void *)&v59 + 1) + 8LL * (void)k));
        }

        id v32 = [v30 countByEnumeratingWithState:&v59 objects:v74 count:16];
      }

      while (v32);
    }

    id v48 = v20;

    __int128 v57 = 0u;
    __int128 v58 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    v49 = self;
    id v51 = v15;
    id v52 = v14;
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager events:matchingPasses:](self, "events:matchingPasses:", v15, v14));
    id v36 = [v35 countByEnumeratingWithState:&v55 objects:v73 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v56;
      do
      {
        for (m = 0LL; m != v37; m = (char *)m + 1)
        {
          if (*(void *)v56 != v38) {
            objc_enumerationMutation(v35);
          }
          v40 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)m);
          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue([v40 recordUniqueID]);
            *(_DWORD *)buf = 138543362;
            v72 = v43;
            _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] erasing invalid add: %{public}@",  buf,  0xCu);
          }

          -[PDCardCloudManagerSaveRequest eraseChangeEvent:](v19, "eraseChangeEvent:", v40);
        }

        id v37 = [v35 countByEnumeratingWithState:&v55 objects:v73 count:16];
      }

      while (v37);
    }

    uint64_t v44 = PKLogFacilityTypeGetObject(9LL);
    v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager describePasses:](v49, "describePasses:", v48));
      *(_DWORD *)buf = 138543362;
      v72 = v46;
      _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] did upload passes: %{public}@",  buf,  0xCu);
    }

    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](v49, "dataSource"));
    [v47 executeSaveRequest:v19 completion:0];

    id v13 = v53;
    id v12 = v54;
    id v15 = v51;
    id v14 = v52;
    id v17 = v50;
  }

  else
  {
    uint64_t v18 = PKLogFacilityTypeGetObject(9LL);
    id v19 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v72 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] failed to upload passes: %{public}@",  buf,  0xCu);
    }
  }
}

- (void)handlePassUpdateResult:(id)a3 conflictingServerPasses:(id)a4 revokedLocalPasses:(id)a5 andEraseChangeEvents:(id)a6 orReportError:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v12 || v13 || v14)
  {
    id v60 = v16;
    id v66 = v14;
    id v19 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:]( v19,  "setOriginator:",  @"-[PDCardCloudManager handlePassUpdateResult:andEraseChangeEvents:]");
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    id v20 = v12;
    id v21 = [v20 countByEnumeratingWithState:&v85 objects:v95 count:16];
    if (v21)
    {
      id v22 = v21;
      uint64_t v23 = *(void *)v86;
      do
      {
        for (i = 0LL; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v86 != v23) {
            objc_enumerationMutation(v20);
          }
          -[PDCardCloudManagerSaveRequest updateLocalPassWithPass:]( v19,  "updateLocalPassWithPass:",  *(void *)(*((void *)&v85 + 1) + 8LL * (void)i));
        }

        id v22 = [v20 countByEnumeratingWithState:&v85 objects:v95 count:16];
      }

      while (v22);
    }

    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    id v61 = v13;
    id v25 = v13;
    id v26 = [v25 countByEnumeratingWithState:&v81 objects:v94 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v28 = *(void *)v82;
      do
      {
        for (j = 0LL; j != v27; j = (char *)j + 1)
        {
          if (*(void *)v82 != v28) {
            objc_enumerationMutation(v25);
          }
          -[PDCardCloudManagerSaveRequest resolveRemoteConflictingPass:]( v19,  "resolveRemoteConflictingPass:",  *(void *)(*((void *)&v81 + 1) + 8LL * (void)j));
        }

        id v27 = [v25 countByEnumeratingWithState:&v81 objects:v94 count:16];
      }

      while (v27);
    }

    id v62 = v12;
    id v63 = v20;

    __int128 v30 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    __int128 v79 = 0u;
    __int128 v80 = 0u;
    __int128 v64 = self;
    id v65 = v15;
    id obj = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager events:matchingPasses:](self, "events:matchingPasses:", v15, v25));
    id v31 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v78;
      do
      {
        for (k = 0LL; k != v32; k = (char *)k + 1)
        {
          if (*(void *)v78 != v33) {
            objc_enumerationMutation(obj);
          }
          id v35 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)k);
          id v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v35 recordType]));
          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v30, "objectForKey:", v36));
          uint64_t v38 = v37;
          if (v37) {
            id v39 = v37;
          }
          else {
            id v39 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          }
          v40 = v39;

          v41 = (void *)objc_claimAutoreleasedReturnValue([v35 recordUniqueID]);
          -[NSMutableSet pk_safelyAddObject:](v40, "pk_safelyAddObject:", v41);

          -[NSMutableDictionary setObject:forKey:](v30, "setObject:forKey:", v40, v36);
        }

        id v32 = [obj countByEnumeratingWithState:&v77 objects:v93 count:16];
      }

      while (v32);
    }

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_10023D130;
    v76[3] = &unk_10064EAD8;
    v76[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v30, "enumerateKeysAndObjectsUsingBlock:", v76);
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    __int128 v72 = 0u;
    __int128 v73 = 0u;
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager events:matchingPasses:](self, "events:matchingPasses:", v65, v63));
    id v43 = [v42 countByEnumeratingWithState:&v72 objects:v92 count:16];
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = *(void *)v73;
      do
      {
        for (m = 0LL; m != v44; m = (char *)m + 1)
        {
          if (*(void *)v73 != v45) {
            objc_enumerationMutation(v42);
          }
          -[PDCardCloudManagerSaveRequest eraseChangeEvent:]( v19,  "eraseChangeEvent:",  *(void *)(*((void *)&v72 + 1) + 8LL * (void)m));
        }

        id v44 = [v42 countByEnumeratingWithState:&v72 objects:v92 count:16];
      }

      while (v44);
    }

    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager events:matchingPasses:](self, "events:matchingPasses:", v65, v66));
    id v48 = [v47 countByEnumeratingWithState:&v68 objects:v91 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v69;
      do
      {
        for (n = 0LL; n != v49; n = (char *)n + 1)
        {
          if (*(void *)v69 != v50) {
            objc_enumerationMutation(v47);
          }
          id v52 = *(void **)(*((void *)&v68 + 1) + 8LL * (void)n);
          uint64_t Object = PKLogFacilityTypeGetObject(9LL);
          id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v55 = (void *)objc_claimAutoreleasedReturnValue([v52 recordUniqueID]);
            *(_DWORD *)buf = 138543362;
            v90 = v55;
            _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] erasing invalid update: %{public}@",  buf,  0xCu);
          }

          -[PDCardCloudManagerSaveRequest eraseChangeEvent:](v19, "eraseChangeEvent:", v52);
        }

        id v49 = [v47 countByEnumeratingWithState:&v68 objects:v91 count:16];
      }

      while (v49);
    }

    uint64_t v56 = PKLogFacilityTypeGetObject(9LL);
    __int128 v57 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v58 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager describePasses:](v64, "describePasses:", v63));
      *(_DWORD *)buf = 138543362;
      v90 = v58;
      _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] did update passes: %{public}@",  buf,  0xCu);
    }

    __int128 v59 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](v64, "dataSource"));
    [v59 executeSaveRequest:v19 completion:0];

    id v13 = v61;
    id v12 = v62;
    id v15 = v65;
    id v14 = v66;
    id v17 = v60;
  }

  else
  {
    uint64_t v18 = PKLogFacilityTypeGetObject(9LL);
    id v19 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v90 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v19,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] failed to update passes update:%@",  buf,  0xCu);
    }
  }
}

- (void)handlePassRemovalResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:]( v11,  "setOriginator:",  @"-[PDCardCloudManager handlePassRemovalResult:andEraseChangeEvents:]");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          -[PDCardCloudManagerSaveRequest eraseChangeEvent:]( v11,  "eraseChangeEvent:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v16),  (void)v21);
          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v14);
    }

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] did remove cloud passes: %{public}@",  buf,  0xCu);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
    [v19 executeSaveRequest:v11 completion:0];
  }

  else
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(9LL);
    id v11 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] error removing passes: %@",  buf,  0xCu);
    }
  }
}

- (void)handleCatalogUpdateResult:(id)a3 andEraseChangeEvents:(id)a4 orReportError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    id v11 = objc_alloc_init(&OBJC_CLASS___PDCardCloudManagerSaveRequest);
    -[PDCardCloudManagerSaveRequest setOriginator:]( v11,  "setOriginator:",  @"-[PDCardCloudManager handleCatalogUpdateResult:andEraseChangeEvents:]");
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        id v16 = 0LL;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          -[PDCardCloudManagerSaveRequest eraseChangeEvent:]( v11,  "eraseChangeEvent:",  *(void *)(*((void *)&v21 + 1) + 8LL * (void)v16),  (void)v21);
          id v16 = (char *)v16 + 1;
        }

        while (v14 != v16);
        id v14 = [v12 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v14);
    }

    uint64_t Object = PKLogFacilityTypeGetObject(9LL);
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] did update cloud pass catalog",  buf,  2u);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
    [v19 executeSaveRequest:v11 completion:0];
  }

  else
  {
    uint64_t v20 = PKLogFacilityTypeGetObject(9LL);
    id v11 = (PDCardCloudManagerSaveRequest *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v26 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_DEFAULT,  "[PDCardCloudManager] failed to update catalog: %{public}@",  buf,  0xCu);
    }
  }
}

- (void)deleteCloudSyncRelatedInformation
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager container](self, "container"));
  [v2 deleteCloudSyncRelatedInformation];
}

- (BOOL)isBusy
{
  if (-[PDCardCloudManager changeEventsAreBeingProcessed](self, "changeEventsAreBeingProcessed")) {
    return 1;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager container](self, "container"));
  unsigned __int8 v5 = [v4 isBusy];

  return v5;
}

- (void)forEachChangeIn:(id)a3 perform:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void, uint64_t))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v7 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v10);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v11]);
        id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v19;
          do
          {
            id v16 = 0LL;
            do
            {
              if (*(void *)v19 != v15) {
                objc_enumerationMutation(v12);
              }
              v6[2](v6, *(void *)(*((void *)&v18 + 1) + 8LL * (void)v16), v11);
              id v16 = (char *)v16 + 1;
            }

            while (v14 != v16);
            id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v14);
        }

        id v10 = (char *)v10 + 1;
      }

      while (v10 != v8);
      id v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v8);
  }
}

- (void)forEachDeleteIn:(id)a3 perform:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, void))a4;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v11);
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v12, 0));
        id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v14)
        {
          id v15 = v14;
          uint64_t v16 = *(void *)v19;
          do
          {
            id v17 = 0LL;
            do
            {
              if (*(void *)v19 != v16) {
                objc_enumerationMutation(v13);
              }
              v6[2](v6, *(void *)(*((void *)&v18 + 1) + 8LL * (void)v17));
              id v17 = (char *)v17 + 1;
            }

            while (v15 != v17);
            id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }

          while (v15);
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v9);
  }
}

- (id)describeRecord:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 modifiedByDevice]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 modificationDate]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"made by: %@ on: %@",  v4,  v5));
  return v6;
}

- (id)describePasses:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) uniqueID]);
        -[NSMutableString appendFormat:](v4, "appendFormat:", @"%@, ", v10);

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  id v11 = -[NSMutableString copy](v4, "copy");
  return v11;
}

- (id)localRecordIDs
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allLocalPassUniqueIDs]);

  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v3, PKCloudPassRecordType);
  id v5 = -[NSMutableDictionary copy](v4, "copy");

  return v5;
}

- (void)resetMigration
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  [v2 resetMigration];
}

- (void)clearChangeHistory
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[PDCardCloudManager dataSource](self, "dataSource"));
  [v2 clearChangeHistory];
}

- (PDCardCloudManagerLocalDataSource)dataSource
{
  return (PDCardCloudManagerLocalDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
}

- (PDCardCloudManagerContainer)container
{
  return self->_container;
}

- (void).cxx_destruct
{
}

@end