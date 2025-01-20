@interface BMCloudKitSyncEngine
- (BMCloudKitSyncEngine)initWithQueue:(id)a3 multiStreamManager:(id)a4 database:(id)a5;
- (BMSyncSessionContext)sessionContext;
- (BMSyncSessionMetricsCollector)metricsCollector;
- (BOOL)isManateeAvailable:(id)a3;
- (BOOL)isRecordNewerThanMostRecentDeleteForSiteIdentifier:(id)a3;
- (BOOL)isSiriCloudSyncEnabled;
- (BOOL)resaveRecordOnError:(int64_t)a3;
- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4;
- (CKContainer)container;
- (CKSyncEngine)ckSyncEngine;
- (CKSyncEngineConfiguration)configuration;
- (CKSyncEngineDataSource)dataSource;
- (NSString)mergeableRecordValueKey;
- (OS_dispatch_queue)queue;
- (id)db;
- (id)handleHighestDeletedLocationRecordToSaveForRecordID:(id)a3;
- (id)handleSyncRecordRecordToSaveForRecordID:(id)a3;
- (id)handleZoneVersionRecordToSaveForRecordID:(id)a3;
- (id)newHighestDeletedLocationRecordIDFor:(id)a3 stream:(id)a4;
- (id)newZoneVersionRecordIDForZone:(id)a3;
- (id)streamConfigurationForZoneID:(id)a3;
- (id)streamConfigurationFromSyncIdentifier:(id)a3;
- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4;
- (void)fetchChangesWithError:(id)a3;
- (void)handleDidSaveRecordHighestDeletedLocation:(id)a3;
- (void)handleDidSaveRecordSyncRecord:(id)a3;
- (void)handleDidSaveRecordZoneVersionRecord:(id)a3;
- (void)handleFailedToSaveRecordHighestDeletedLocation:(id)a3 error:(id)a4;
- (void)handleFailedToSaveRecordSyncRecord:(id)a3 error:(id)a4;
- (void)handleFailedToSaveRecordZoneVersion:(id)a3 error:(id)a4;
- (void)handleFailedToSaveSyncRecordResaveRecord:(id)a3;
- (void)handleFailedToSaveSyncRecordServerManateeDecryptionError:(id)a3 error:(id)a4;
- (void)handleFailedToSaveSyncRecordServerRecordChanged:(id)a3 error:(id)a4;
- (void)handleFailedToSaveSyncRecordUnknownItem:(id)a3;
- (void)handleHighestDeletedLocationDidFetchRecord:(id)a3;
- (void)handleRecordWithIDDeletedSyncRecord:(id)a3;
- (void)handleServerRecordChangedForHighestDeletedLocationError:(id)a3;
- (void)handleSyncRecordDidFetchRecord:(id)a3;
- (void)handleTransitionToNewMergeableValueRecordValueKey;
- (void)handleZoneReset:(id)a3;
- (void)handleZoneVersionDidFetchRecord:(id)a3;
- (void)resaveRecord:(id)a3;
- (void)setCkSyncEngine:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setSessionContext:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4;
- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4;
- (void)syncEngine:(id)a3 didFetchRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecord:(id)a4;
- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4;
- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4;
- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5;
- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5;
- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4;
- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4;
- (void)syncEngineDidEndFetchingChanges:(id)a3;
- (void)syncEngineDidEndModifyingPendingChanges:(id)a3;
- (void)syncEngineWillBeginFetchingChanges:(id)a3;
- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3;
- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5;
- (void)syncSessionDidEnd;
- (void)syncSessionDidStartWithReason:(unint64_t)a3;
- (void)uploadChangesWithError:(id)a3;
@end

@implementation BMCloudKitSyncEngine

- (BOOL)isSiriCloudSyncEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](&OBJC_CLASS___ACAccountStore, "defaultStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "aa_primaryAppleAccount"));
  unsigned __int8 v4 = [v3 isEnabledForDataclass:kAccountDataclassSiri];

  return v4;
}

- (id)db
{
  return self->_db;
}

- (BMCloudKitSyncEngine)initWithQueue:(id)a3 multiStreamManager:(id)a4 database:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___BMCloudKitSyncEngine;
  v12 = -[BMCloudKitSyncEngine init](&v20, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_syncManager, a4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 metricsCollector]);
    metricsCollector = v13->_metricsCollector;
    v13->_metricsCollector = (BMSyncSessionMetricsCollector *)v14;

    objc_storeStrong((id *)&v13->_db, a5);
    objc_storeStrong((id *)&v13->_queue, a3);
    v16 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v13->_operationQueue;
    v13->_operationQueue = v16;

    -[NSOperationQueue setUnderlyingQueue:](v13->_operationQueue, "setUnderlyingQueue:", v9);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    mergeableRecordValueKey = v13->_mergeableRecordValueKey;
    v13->_mergeableRecordValueKey = (NSString *)@"streamCRDT";
  }

  return v13;
}

- (id)streamConfigurationForZoneID:(id)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([a3 zoneName]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[BMCloudKitSyncEngine streamConfigurationFromSyncIdentifier:]( self,  "streamConfigurationFromSyncIdentifier:",  v4));

  return v5;
}

- (id)streamConfigurationFromSyncIdentifier:(id)a3
{
  syncManager = self->_syncManager;
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMDistributedSyncMultiStreamManager distributedSyncManagers](syncManager, "distributedSyncManagers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 streamConfiguration]);
  return v7;
}

- (id)newHighestDeletedLocationRecordIDFor:(id)a3 stream:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase highestDeletedLocationForSiteIdentifier:inStream:]( self->_db,  "highestDeletedLocationForSiteIdentifier:inStream:",  v6,  v7));
  id v9 = v8;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 location]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 day]);
    [v11 timeIntervalSinceReferenceDate];
    uint64_t v13 = (uint64_t)v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase ckRecordForRecordName:zoneName:recordType:]( self->_db,  "ckRecordForRecordName:zoneName:recordType:",  v6,  v7,  3LL));
    v15 = v14;
    if (v14
      && (db = self->_db,
          v17 = (void *)objc_claimAutoreleasedReturnValue([v14 locationID]),
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase locationRowWithLocationID:](db, "locationRowWithLocationID:", v17)),
          v17,
          v18))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 location]);
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v19 day]);
      [v20 timeIntervalSinceReferenceDate];
      uint64_t v22 = (uint64_t)v21;
    }

    else
    {
      uint64_t v22 = 0LL;
    }

    if (v22 >= v13)
    {
      v23 = 0LL;
    }

    else
    {
      -[BMSyncDatabase saveCKRecordHighestDeletedLocationRow:recordName:zoneName:recordExists:]( self->_db,  "saveCKRecordHighestDeletedLocationRow:recordName:zoneName:recordExists:",  v9,  v6,  v7,  v15 != 0LL);
      v24 = -[CKRecordZone initWithZoneName:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneName:", v7);
      v25 = objc_alloc(&OBJC_CLASS___CKRecordID);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](v24, "zoneID"));
      v23 = -[CKRecordID initWithRecordName:zoneID:](v25, "initWithRecordName:zoneID:", v6, v26);
    }
  }

  else
  {
    v23 = 0LL;
  }

  return v23;
}

- (id)newZoneVersionRecordIDForZone:(id)a3
{
  id v3 = a3;
  id v4 = -[CKRecordID initWithRecordName:zoneID:]( objc_alloc(&OBJC_CLASS___CKRecordID),  "initWithRecordName:zoneID:",  @"zoneVersion",  v3);

  return v4;
}

- (void)syncNowWithReason:(unint64_t)a3 activity:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = __biome_log_for_category(11LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "syncNowWithReason", (uint8_t *)&buf, 2u);
  }

  uint64_t v12 = __biome_log_for_category(11LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    unsigned int v14 = -[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled");
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Sync with iCloud for Siri: %d",  (uint8_t *)&buf,  8u);
  }

  objc_initWeak(&buf, self);
  v15 = objc_alloc(&OBJC_CLASS___BMAsyncBlockOperation);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000250F4;
  v18[3] = &unk_100069610;
  objc_copyWeak(v20, &buf);
  v20[1] = (id)a3;
  id v16 = v9;
  id v19 = v16;
  v17 = -[BMAsyncBlockOperation initWithAsyncOperationBlock:](v15, "initWithAsyncOperationBlock:", v18);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v17);

  objc_destroyWeak(v20);
  objc_destroyWeak(&buf);
}

- (void)fetchChangesWithError:(id)a3
{
  id v4 = a3;
  if (-[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled"))
  {
    -[CKSyncEngine setNeedsToFetchChanges](self->_ckSyncEngine, "setNeedsToFetchChanges");
    ckSyncEngine = self->_ckSyncEngine;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100025478;
    v9[3] = &unk_100069660;
    v9[4] = self;
    id v10 = v4;
    -[CKSyncEngine fetchChangesWithCompletionHandler:](ckSyncEngine, "fetchChangesWithCompletionHandler:", v9);
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___NSError);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    uint64_t v12 = @"Sync to iCloud for Siri disabled, no sync via iCloud performed";
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v8 = -[NSError initWithDomain:code:userInfo:](v6, "initWithDomain:code:userInfo:", NSPOSIXErrorDomain, -1LL, v7);

    (*((void (**)(id, NSError *))v4 + 2))(v4, v8);
  }
}

- (void)handleTransitionToNewMergeableValueRecordValueKey
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[BMDistributedSyncMultiStreamManager distributedSyncManagers]( self->_syncManager,  "distributedSyncManagers"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allValues]);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase mergeableRecordValueKey](self->_db, "mergeableRecordValueKey"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine mergeableRecordValueKey](self, "mergeableRecordValueKey"));
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = __biome_log_for_category(11LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine mergeableRecordValueKey](self, "mergeableRecordValueKey"));
      *(_DWORD *)id buf = 138543362;
      v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "transitioning records over to new CKMergeableRecordValue with key %{public}@",  buf,  0xCu);
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    v23 = v4;
    id v11 = v4;
    id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v25;
      do
      {
        v15 = 0LL;
        do
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v15);
          v17 = objc_autoreleasePoolPush();
          v18 = (void *)objc_claimAutoreleasedReturnValue([v16 streamConfiguration]);
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 syncIdentifier]);

          if (!-[BMSyncDatabase clearCKRecordLocalMergeableValueAndSetToSyncForZone:]( self->_db,  "clearCKRecordLocalMergeableValueAndSetToSyncForZone:",  v19))
          {
            uint64_t v20 = __biome_log_for_category(11LL);
            double v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)id buf = 138543362;
              v30 = v19;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_FAULT,  "failed to reset records for stream %{public}@ when transitioning to new CKMergeableRecordValue",  buf,  0xCu);
            }
          }

          objc_autoreleasePoolPop(v17);
          v15 = (char *)v15 + 1;
        }

        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v13);
    }

    -[BMSyncDatabase clearCKSyncEngineMetaData](self->_db, "clearCKSyncEngineMetaData");
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine mergeableRecordValueKey](self, "mergeableRecordValueKey"));
    -[BMSyncDatabase setMergeableRecordValueKey:](self->_db, "setMergeableRecordValueKey:", v22);

    id v4 = v23;
  }
}

- (void)uploadChangesWithError:(id)a3
{
  id v48 = a3;
  v57 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[BMDistributedSyncMultiStreamManager distributedSyncManagers]( self->_syncManager,  "distributedSyncManagers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v66 objects:v75 count:16];
  v58 = self;
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v67;
    uint64_t v49 = *(void *)v67;
    v50 = v5;
    do
    {
      id v9 = 0LL;
      id v51 = v7;
      do
      {
        if (*(void *)v67 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v66 + 1) + 8LL * (void)v9);
        id v11 = objc_autoreleasePoolPush();
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 streamConfiguration]);
        if (sub_100024978(v12))
        {
          uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 syncIdentifier]);
          v56 = v12;
          uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 streamIdentifier]);
          v59 = v10;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 localSiteIdentifier]);
          uint64_t v16 = __biome_log_for_category(11LL);
          v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id buf = 138543362;
            uint64_t v71 = v14;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "ingest events from stream: %{public}@",  buf,  0xCu);
          }

          v55 = (void *)v14;

          context = objc_autoreleasePoolPush();
          unsigned int v18 = -[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled");
          db = self->_db;
          if (v18)
          {
            -[BMSyncDatabase enableAllCKSyncRecordsPreviouslyDisabledForSite:stream:]( self->_db,  "enableAllCKSyncRecordsPreviouslyDisabledForSite:stream:",  v15,  v13);
            uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v59 streamCRDT]);
            [v20 ingestNewChangesForSite:v15 transportType:3];

            double v21 = (void *)v13;
            id v22 = -[BMCloudKitSyncEngine newHighestDeletedLocationRecordIDFor:stream:]( self,  "newHighestDeletedLocationRecordIDFor:stream:",  v15,  v13);
            if (v22) {
              -[NSMutableSet addObject:](v57, "addObject:", v22);
            }
            v52 = v11;
            v53 = v9;
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase CKAtomRowSiteIdentifiers](self->_db, "CKAtomRowSiteIdentifiers"));
            __int128 v62 = 0u;
            __int128 v63 = 0u;
            __int128 v64 = 0u;
            __int128 v65 = 0u;
            id v24 = v23;
            id v25 = [v24 countByEnumeratingWithState:&v62 objects:v74 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v63;
              do
              {
                for (i = 0LL; i != v26; i = (char *)i + 1)
                {
                  if (*(void *)v63 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  uint64_t v29 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)i);
                  v30 = objc_autoreleasePoolPush();
                  if (([v15 isEqual:v29] & 1) == 0)
                  {
                    v31 = (void *)objc_claimAutoreleasedReturnValue([v59 streamCRDT]);
                    [v31 ingestNewChangesForSite:v29 transportType:3];

                    self = v58;
                    id v32 = -[BMCloudKitSyncEngine newHighestDeletedLocationRecordIDFor:stream:]( v58,  "newHighestDeletedLocationRecordIDFor:stream:",  v29,  v21);

                    if (v32)
                    {
                      -[NSMutableSet addObject:](v57, "addObject:", v32);
                      id v22 = v32;
                    }

                    else
                    {
                      id v22 = 0LL;
                    }
                  }

                  objc_autoreleasePoolPop(v30);
                }

                id v26 = [v24 countByEnumeratingWithState:&v62 objects:v74 count:16];
              }

              while (v26);
            }

            uint64_t v8 = v49;
            v5 = v50;
            id v7 = v51;
            id v11 = v52;
            id v9 = v53;
          }

          else
          {
            double v21 = (void *)v13;
            id v22 = (id)objc_claimAutoreleasedReturnValue([v59 localSiteIdentifier]);
            -[BMSyncDatabase disableAllCKSyncRecordsForSite:stream:]( db,  "disableAllCKSyncRecordsForSite:stream:",  v22,  v21);
          }

          objc_autoreleasePoolPop(context);
          id v12 = v56;
        }

        objc_autoreleasePoolPop(v11);
        id v9 = (char *)v9 + 1;
      }

      while (v9 != v7);
      id v7 = [v5 countByEnumeratingWithState:&v66 objects:v75 count:16];
    }

    while (v7);
  }

  v33 = self;
  v34 = objc_autoreleasePoolPush();
  v35 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase ckRecordsToSyncToCloudKitForZone:]( v33->_db,  "ckRecordsToSyncToCloudKitForZone:",  0LL));
  -[NSMutableSet addObjectsFromArray:](v57, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase gatherAllCKSyncRecordRecordsToBeDeleted]( v33->_db,  "gatherAllCKSyncRecordRecordsToBeDeleted"));
  objc_autoreleasePoolPop(v34);
  uint64_t v37 = __biome_log_for_category(11LL);
  v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    id v39 = -[NSMutableSet count](v57, "count");
    id v40 = [v36 count];
    *(_DWORD *)id buf = 134218240;
    uint64_t v71 = (uint64_t)v39;
    __int16 v72 = 2048;
    id v73 = v40;
    _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_INFO,  "syncNowWithReason found %lu records to sync and %lu records to delete",  buf,  0x16u);
  }

  if (v36) {
    -[NSMutableSet minusSet:](v57, "minusSet:", v36);
  }
  if (-[NSMutableSet count](v57, "count") || [v36 count])
  {
    uint64_t v41 = __biome_log_for_category(11LL);
    v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = -[NSMutableSet count](v57, "count");
      id v44 = [v36 count];
      *(_DWORD *)id buf = 134218240;
      uint64_t v71 = (uint64_t)v43;
      __int16 v72 = 2048;
      id v73 = v44;
      _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_INFO,  "syncNowWithReason after removing duplicates, sending CKSyncEngine %lu records to sync and %lu records to delete",  buf,  0x16u);
    }

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v57, "allObjects"));
    v46 = (void *)objc_claimAutoreleasedReturnValue([v36 allObjects]);
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( v58->_ckSyncEngine,  "addRecordIDsToSave:recordIDsToDelete:",  v45,  v46);
    ckSyncEngine = v58->_ckSyncEngine;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472LL;
    v60[2] = sub_100025D9C;
    v60[3] = &unk_100069660;
    v60[4] = v58;
    id v61 = v48;
    -[CKSyncEngine modifyPendingChangesWithCompletionHandler:]( ckSyncEngine,  "modifyPendingChangesWithCompletionHandler:",  v60);
  }

  else
  {
    (*((void (**)(id, void))v48 + 2))(v48, 0LL);
  }
}

- (BOOL)isManateeAvailable:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    switch((unint64_t)[v3 accountStatus])
    {
      case 0uLL:
      case 2uLL:
      case 3uLL:
        uint64_t v5 = __biome_log_for_category(11LL);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_100042338();
        }
        goto LABEL_17;
      case 1uLL:
        unsigned __int8 v9 = [v4 deviceToDeviceEncryptionAvailability];
        if ((v9 & 1) == 0) {
          goto LABEL_13;
        }
        uint64_t v10 = __biome_log_for_category(11LL);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "This account is eligible to sync with manatee containers",  buf,  2u);
        }

        if ((v9 & 2) == 0)
        {
LABEL_13:
          uint64_t v12 = __biome_log_for_category(11LL);
          id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            sub_100042398();
          }
          goto LABEL_17;
        }

        uint64_t v16 = __biome_log_for_category(11LL);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v17 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Manatee is available on the current device",  v17,  2u);
        }

        BOOL v14 = 1;
        break;
      case 4uLL:
        uint64_t v13 = __biome_log_for_category(11LL);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000423F8();
        }
        goto LABEL_17;
      default:
        uint64_t v8 = __biome_log_for_category(11LL);
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000422D8();
        }
        goto LABEL_17;
    }
  }

  else
  {
    uint64_t v7 = __biome_log_for_category(11LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000422AC();
    }
LABEL_17:
    BOOL v14 = 0;
  }

  return v14;
}

- (void)startWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002635C;
  block[3] = &unk_1000696B0;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync((dispatch_queue_t)queue, block);
  if (*((_BYTE *)v11 + 24))
  {
    container = self->_container;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000265D0;
    v7[3] = &unk_1000696D8;
    v7[4] = self;
    id v8 = v4;
    -[CKContainer accountInfoWithCompletionHandler:](container, "accountInfoWithCompletionHandler:", v7);
  }

  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0LL, 0LL);
  }

  _Block_object_dispose(&v10, 8);
}

- (void)syncSessionDidStartWithReason:(unint64_t)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncSessionMetricsCollector sessionContext](self->_metricsCollector, "sessionContext"));
  -[BMCloudKitSyncEngine setSessionContext:](self, "setSessionContext:", v5);

  metricsCollector = self->_metricsCollector;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine sessionContext](self, "sessionContext"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v8 sessionID]);
  -[BMSyncSessionMetricsCollector recordSessionStart:transport:reason:isReciprocal:]( metricsCollector,  "recordSessionStart:transport:reason:isReciprocal:",  v7,  3LL,  a3,  0LL);
}

- (void)syncSessionDidEnd
{
  metricsCollector = self->_metricsCollector;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine sessionContext](self, "sessionContext"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sessionID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase lastCloudKitSyncDate](self->_db, "lastCloudKitSyncDate"));
  -[BMSyncSessionMetricsCollector recordSessionEnd:lastSyncDate:]( metricsCollector,  "recordSessionEnd:lastSyncDate:",  v5,  v6);

  -[BMCloudKitSyncEngine setSessionContext:](self, "setSessionContext:", 0LL);
  db = self->_db;
  id v8 = objc_opt_new(&OBJC_CLASS___NSDate);
  -[BMSyncDatabase setLastCloudKitSyncDate:](db, "setLastCloudKitSyncDate:", v8);
}

- (void)syncEngine:(id)a3 zoneWithIDChanged:(id)a4
{
  id v4 = a4;
  uint64_t v5 = __biome_log_for_category(11LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
    int v8 = 138543362;
    unsigned __int8 v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "zoneWithIDChanged: %{public}@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)syncEngine:(id)a3 failedToFetchChangesForRecordZoneID:(id)a4 error:(id)a5
{
  id v5 = a4;
  uint64_t v6 = __biome_log_for_category(11LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    int v9 = 138543362;
    uint64_t v10 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "failedToFetchChangesForRecordZoneID: %{public}@",  (uint8_t *)&v9,  0xCu);
  }
}

- (BOOL)syncEngine:(id)a3 shouldFetchChangesForZoneID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine streamConfigurationForZoneID:](self, "streamConfigurationForZoneID:", v5));
  unsigned int v7 = sub_100024978(v6);
  uint64_t v8 = __biome_log_for_category(11LL);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v6 streamIdentifier]);
    uint64_t v12 = (void *)v11;
    char v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if (v7) {
      char v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    uint64_t v20 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "shouldFetchChangesForZoneID: %{public}@ (%{public}@) returning: %{public}@",  (uint8_t *)&v15,  0x20u);
  }

  return v7;
}

- (void)syncEngine:(id)a3 didDeleteRecordWithID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = __biome_log_for_category(11LL);
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    *(_DWORD *)id buf = 138543618;
    double v21 = v8;
    __int16 v22 = 2114;
    v23 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "didDeleteRecordWithID: %{public}@ in zone: %{public}@",  buf,  0x16u);
  }

  uint64_t v11 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
  int v15 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v11, "initWithZoneName:recordName:", v13, v14);

  queue = self->_queue;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100026C1C;
  v18[3] = &unk_100068E68;
  void v18[4] = self;
  __int16 v19 = v15;
  __int16 v17 = v15;
  dispatch_sync((dispatch_queue_t)queue, v18);
}

- (BOOL)isRecordNewerThanMostRecentDeleteForSiteIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___BMStreamCRDTLocation);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);
  uint64_t v11 = -[BMStreamCRDTLocation initWithZoneName:recordName:](v5, "initWithZoneName:recordName:", v8, v10);

  if (v11)
  {
    db = self->_db;
    char v13 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation siteIdentifier](v11, "siteIdentifier"));
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation streamName](v11, "streamName"));
    int v15 = (void *)objc_claimAutoreleasedReturnValue( -[BMSyncDatabase highestDeletedLocationForSiteIdentifier:inStream:]( db,  "highestDeletedLocationForSiteIdentifier:inStream:",  v13,  v14));

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 location]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 day]);
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[BMStreamCRDTLocation day](v11, "day"));
      id v19 = [v17 compare:v18];

      BOOL v20 = v19 == (id)-1LL;
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneID]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[BMCloudKitSyncEngine streamConfigurationForZoneID:](self, "streamConfigurationForZoneID:", v24));

      -[BMStreamCRDTLocation secondsUntilExpirationWithStreamConfiguration:]( v11,  "secondsUntilExpirationWithStreamConfiguration:",  v25);
      BOOL v20 = v26 > 0.0;
    }
  }

  else
  {
    uint64_t v21 = __biome_log_for_category(11LL);
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      sub_100042508();
    }

    BOOL v20 = 0;
  }

  return v20;
}

- (void)handleSyncRecordDidFetchRecord:(id)a3
{
  id v5 = a3;
  if (-[BMCloudKitSyncEngine isSiriCloudSyncEnabled](self, "isSiriCloudSyncEnabled"))
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100026ECC;
    block[3] = &unk_100068E68;
    id v7 = v5;
    uint64_t v8 = self;
    dispatch_sync((dispatch_queue_t)queue, block);
  }
}

- (void)handleZoneVersionDidFetchRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000272F4;
  block[3] = &unk_100068E68;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)handleHighestDeletedLocationDidFetchRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027478;
  block[3] = &unk_100068E68;
  id v8 = v4;
  int v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v5 = a4;
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);
    int v14 = 138543362;
    int v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "didFetchRecord: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 recordType]);
  uint64_t v11 = sub_100024AA0(v10);

  switch(v11)
  {
    case 3LL:
      -[BMCloudKitSyncEngine handleHighestDeletedLocationDidFetchRecord:]( self,  "handleHighestDeletedLocationDidFetchRecord:",  v5);
      break;
    case 2LL:
      -[BMCloudKitSyncEngine handleZoneVersionDidFetchRecord:](self, "handleZoneVersionDidFetchRecord:", v5);
      break;
    case 1LL:
      -[BMCloudKitSyncEngine handleSyncRecordDidFetchRecord:](self, "handleSyncRecordDidFetchRecord:", v5);
      break;
    default:
      uint64_t v12 = __biome_log_for_category(11LL);
      char v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        sub_10004269C(v5, v13);
      }

      break;
  }
}

- (void)handleDidSaveRecordZoneVersionRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"zoneVersionUUID"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027918;
  block[3] = &unk_100069700;
  void block[4] = self;
  id v14 = v4;
  id v15 = v5;
  id v16 = v8;
  id v10 = v8;
  id v11 = v5;
  id v12 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)handleDidSaveRecordHighestDeletedLocation:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000279E4;
  block[3] = &unk_100068E68;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)handleDidSaveRecordSyncRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 recordName]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"crdtDeleted"]);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100027B5C;
  block[3] = &unk_100069728;
  void block[4] = self;
  id v17 = v4;
  id v18 = v10;
  id v19 = v9;
  id v20 = v7;
  id v12 = v7;
  id v13 = v9;
  id v14 = v10;
  id v15 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 didSaveRecord:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);

  int v9 = (void *)objc_claimAutoreleasedReturnValue([v5 recordID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 recordName]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 recordType]);
  uint64_t v12 = sub_100024AA0(v11);

  uint64_t v13 = __biome_log_for_category(11LL);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 recordType]);
    int v19 = 138543874;
    id v20 = v10;
    __int16 v21 = 2114;
    __int16 v22 = v15;
    __int16 v23 = 2114;
    id v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "didSaveRecord: %{public}@ recordType: %{public}@ zone: %{public}@",  (uint8_t *)&v19,  0x20u);
  }

  switch(v12)
  {
    case 3LL:
      -[BMCloudKitSyncEngine handleDidSaveRecordHighestDeletedLocation:]( self,  "handleDidSaveRecordHighestDeletedLocation:",  v5);
      break;
    case 2LL:
      -[BMCloudKitSyncEngine handleDidSaveRecordZoneVersionRecord:](self, "handleDidSaveRecordZoneVersionRecord:", v5);
      break;
    case 1LL:
      -[BMCloudKitSyncEngine handleDidSaveRecordSyncRecord:](self, "handleDidSaveRecordSyncRecord:", v5);
      break;
    default:
      uint64_t v16 = __biome_log_for_category(11LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 recordType]);
        int v19 = 138543874;
        id v20 = v10;
        __int16 v21 = 2114;
        __int16 v22 = v18;
        __int16 v23 = 2114;
        id v24 = v8;
        _os_log_fault_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_FAULT,  "didSaveRecord: %{public}@ unknown recordType: %{public}@ zone: %{public}@",  (uint8_t *)&v19,  0x20u);
      }

      break;
  }
}

- (void)syncEngine:(id)a3 didSaveRecordZone:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "zoneID", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);

  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didSaveRecordZone: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000282FC;
  v11[3] = &unk_100068E68;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_sync((dispatch_queue_t)queue, v11);
}

- (void)syncEngine:(id)a3 didUpdateMetadata:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000283E8;
  block[3] = &unk_100068E68;
  void block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 failedToDeleteRecordWithID:(id)a4 error:(id)a5
{
  id v5 = a4;
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
    int v11 = 138543618;
    id v12 = v8;
    __int16 v13 = 2114;
    id v14 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "failedToDeleteRecordWithID: %{public}@, zone:%{public}@",  (uint8_t *)&v11,  0x16u);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecordZone:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 zoneID]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);

  uint64_t v10 = __biome_log_for_category(11LL);
  int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543618;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "failedToSaveRecordZone:%{public}@ error:%{public}@",  buf,  0x16u);
  }

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100028658;
  v14[3] = &unk_100068E68;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  dispatch_sync((dispatch_queue_t)queue, v14);
}

- (void)handleZoneReset:(id)a3
{
  id v11 = a3;
  queue = self->_queue;
  if (queue) {
    dispatch_assert_queue_V2((dispatch_queue_t)queue);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[BMSyncDatabase ckZoneForZoneName:](self->_db, "ckZoneForZoneName:", v11));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attemptedRecoveryDate]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v8 = v7;
  if (v6)
  {
    [v7 timeIntervalSinceDate:v6];
    BOOL v10 = v9 > 14400.0;
  }

  else
  {
    BOOL v10 = 1;
  }

  if (![v5 recoveryState] && v10) {
    -[BMSyncDatabase ckZoneSetAttemptedRecoveryDate:state:forZoneName:]( self->_db,  "ckZoneSetAttemptedRecoveryDate:state:forZoneName:",  v8,  1LL,  v11);
  }
}

- (void)handleFailedToSaveSyncRecordUnknownItem:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000288B8;
  block[3] = &unk_100068E68;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)handleFailedToSaveSyncRecordResaveRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);

  if (v6)
  {
    queue = self->_queue;
    __int16 v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472LL;
    id v24 = sub_100028B80;
    id v25 = &unk_100068E68;
    double v26 = self;
    id v8 = v4;
    id v27 = v8;
    dispatch_sync((dispatch_queue_t)queue, &v22);
    double v9 = objc_alloc(&OBJC_CLASS___CKRecordZone);
    BOOL v10 = -[CKRecordZone initWithZoneID:](v9, "initWithZoneID:", v6, v22, v23, v24, v25, v26);
    ckSyncEngine = self->_ckSyncEngine;
    uint64_t v29 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:]( ckSyncEngine,  "addRecordZonesToSave:recordZoneIDsToDelete:",  v12,  0LL);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecordZone zoneID](v10, "zoneID"));
    id v14 = -[BMCloudKitSyncEngine newZoneVersionRecordIDForZone:](self, "newZoneVersionRecordIDForZone:", v13);

    id v15 = self->_ckSyncEngine;
    v28[0] = v14;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    v28[1] = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v28, 2LL));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](v15, "addRecordIDsToSave:recordIDsToDelete:", v17, 0LL);

    uint64_t v18 = __biome_log_for_category(11LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_10004297C(v6, v8);
    }
  }

  else
  {
    uint64_t v20 = __biome_log_for_category(11LL);
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1000428E8(v4, v21);
    }
  }
}

- (void)handleFailedToSaveSyncRecordServerRecordChanged:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028CA8;
  block[3] = &unk_100069700;
  id v15 = v7;
  uint64_t v16 = self;
  id v17 = v9;
  id v18 = v6;
  id v11 = v6;
  id v12 = v9;
  id v13 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)handleFailedToSaveSyncRecordServerManateeDecryptionError:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);

  uint64_t v10 = __biome_log_for_category(11LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)id buf = 138543874;
    id v17 = v9;
    __int16 v18 = 2114;
    id v19 = v6;
    __int16 v20 = 2114;
    id v21 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Manatee identity loss reported: record:%{public}@, zoneID:%{public}@, error:%{public}@",  buf,  0x20u);
  }

  queue = self->_queue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000292A4;
  v14[3] = &unk_100068E68;
  v14[4] = self;
  id v15 = v9;
  id v13 = v9;
  dispatch_sync((dispatch_queue_t)queue, v14);
}

- (void)handleFailedToSaveRecordSyncRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (uint64_t)[v7 code];
  if (v8 <= 25)
  {
    if (v8 == 11)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordUnknownItem:]( self,  "handleFailedToSaveSyncRecordUnknownItem:",  v6);
      goto LABEL_14;
    }

    if (v8 == 14)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordServerRecordChanged:error:]( self,  "handleFailedToSaveSyncRecordServerRecordChanged:error:",  v6,  v7);
      goto LABEL_14;
    }
  }

  else
  {
    if (v8 == 26 || v8 == 28)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordResaveRecord:]( self,  "handleFailedToSaveSyncRecordResaveRecord:",  v6);
      goto LABEL_14;
    }

    if (v8 == 112)
    {
      -[BMCloudKitSyncEngine handleFailedToSaveSyncRecordServerManateeDecryptionError:error:]( self,  "handleFailedToSaveSyncRecordServerManateeDecryptionError:error:",  v6,  v7);
      goto LABEL_14;
    }
  }

  uint64_t v9 = __biome_log_for_category(11LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_100042B68();
  }

LABEL_14:
}

- (void)handleFailedToSaveRecordZoneVersion:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_1000294D4;
  id v15 = &unk_100068E68;
  uint64_t v16 = self;
  id v9 = v6;
  id v17 = v9;
  dispatch_sync((dispatch_queue_t)queue, &v12);
  if (-[BMCloudKitSyncEngine resaveRecordOnError:]( self,  "resaveRecordOnError:",  objc_msgSend(v7, "code", v12, v13, v14, v15, v16)))
  {
    -[BMCloudKitSyncEngine resaveRecord:](self, "resaveRecord:", v9);
  }

  else
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100042BC8();
    }
  }
}

- (void)handleFailedToSaveRecordHighestDeletedLocation:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  id v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100029628;
  id v15 = &unk_100068E68;
  uint64_t v16 = self;
  id v9 = v6;
  id v17 = v9;
  dispatch_sync((dispatch_queue_t)queue, &v12);
  if (-[BMCloudKitSyncEngine resaveRecordOnError:]( self,  "resaveRecordOnError:",  objc_msgSend(v7, "code", v12, v13, v14, v15, v16)))
  {
    -[BMCloudKitSyncEngine resaveRecord:](self, "resaveRecord:", v9);
  }

  else if ([v7 code] == (id)14)
  {
    -[BMCloudKitSyncEngine handleServerRecordChangedForHighestDeletedLocationError:]( self,  "handleServerRecordChangedForHighestDeletedLocationError:",  v7);
  }

  else
  {
    uint64_t v10 = __biome_log_for_category(11LL);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100042C28();
    }
  }
}

- (BOOL)resaveRecordOnError:(int64_t)a3
{
  return a3 == 26 || a3 == 28;
}

- (void)resaveRecord:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneID]);

  if (v6)
  {
    id v7 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v6);
    ckSyncEngine = self->_ckSyncEngine;
    id v17 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    -[CKSyncEngine addRecordZonesToSave:recordZoneIDsToDelete:]( ckSyncEngine,  "addRecordZonesToSave:recordZoneIDsToDelete:",  v9,  0LL);

    uint64_t v10 = self->_ckSyncEngine;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 recordID]);
    uint64_t v16 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:](v10, "addRecordIDsToSave:recordIDsToDelete:", v12, 0LL);

    uint64_t v13 = __biome_log_for_category(11LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004297C(v6, v4);
    }
  }

  else
  {
    uint64_t v15 = __biome_log_for_category(11LL);
    id v7 = (CKRecordZone *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      sub_1000428E8(v4, (os_log_s *)v7);
    }
  }
}

- (void)handleServerRecordChangedForHighestDeletedLocationError:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:CKRecordChangedErrorClientRecordKey]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"day"]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"day"]);
  id v11 = [v10 longValue];
  if ((uint64_t)v11 > (uint64_t)[v9 longValue])
  {
    ckSyncEngine = self->_ckSyncEngine;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    uint64_t v15 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));
    -[CKSyncEngine addRecordIDsToSave:recordIDsToDelete:]( ckSyncEngine,  "addRecordIDsToSave:recordIDsToDelete:",  v14,  0LL);
  }
}

- (void)syncEngine:(id)a3 failedToSaveRecord:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneID]);

  uint64_t v12 = __biome_log_for_category(11LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneName]);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v8 recordID]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 recordName]);
    int v19 = 138543874;
    __int16 v20 = v14;
    __int16 v21 = 2114;
    __int16 v22 = v16;
    __int16 v23 = 2114;
    id v24 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "failedToSaveRecord: %{public}@, %{public}@ %{public}@",  (uint8_t *)&v19,  0x20u);
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v8 recordType]);
  uint64_t v18 = sub_100024AA0(v17);

  __asm { BR              X9 }

- (id)handleHighestDeletedLocationRecordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = sub_100029C20;
  id v17 = sub_100029C30;
  id v18 = 0LL;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100029C38;
  block[3] = &unk_100069750;
  id v10 = v4;
  id v11 = self;
  uint64_t v12 = &v13;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (id)handleZoneVersionRecordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  uint64_t v15 = sub_100029C20;
  uint64_t v16 = sub_100029C30;
  id v17 = 0LL;
  queue = self->_queue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100029F20;
  v9[3] = &unk_100069778;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, v9);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)handleSyncRecordRecordToSaveForRecordID:(id)a3
{
  id v4 = a3;
  uint64_t v25 = 0LL;
  double v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_100029C20;
  uint64_t v29 = sub_100029C30;
  id v30 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x3032000000LL;
  v23[3] = sub_100029C20;
  v23[4] = sub_100029C30;
  id v24 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x3032000000LL;
  v21[3] = sub_100029C20;
  v21[4] = sub_100029C30;
  id v22 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 zoneName]);

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002A194;
  block[3] = &unk_1000697A0;
  void block[4] = self;
  id v15 = v7;
  id v16 = v5;
  id v17 = v4;
  id v18 = &v25;
  int v19 = v23;
  __int16 v20 = v21;
  id v9 = v4;
  id v10 = v5;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
  id v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(&v25, 8);
  return v12;
}

- (id)syncEngine:(id)a3 recordToSaveForRecordID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = __biome_log_for_category(11LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "recordToSaveForRecordID %{public}@",  (uint8_t *)&v16,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
  unsigned int v10 = [v9 isEqualToString:@"zoneVersion"];

  if (v10)
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[BMCloudKitSyncEngine handleZoneVersionRecordToSaveForRecordID:]( self,  "handleZoneVersionRecordToSaveForRecordID:",  v5));
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 recordName]);
    unsigned int v13 = [v12 containsString:@","];

    if (v13) {
      uint64_t v11 = objc_claimAutoreleasedReturnValue( -[BMCloudKitSyncEngine handleSyncRecordRecordToSaveForRecordID:]( self,  "handleSyncRecordRecordToSaveForRecordID:",  v5));
    }
    else {
      uint64_t v11 = objc_claimAutoreleasedReturnValue( -[BMCloudKitSyncEngine handleHighestDeletedLocationRecordToSaveForRecordID:]( self,  "handleHighestDeletedLocationRecordToSaveForRecordID:",  v5));
    }
  }

  uint64_t v14 = (void *)v11;

  return v14;
}

- (void)syncEngine:(id)a3 failedToDeleteRecordZoneWithID:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 zoneName]);
  uint64_t v9 = __biome_log_for_category(11LL);
  unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543618;
    int v16 = v8;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "failedToDeleteRecordZoneWithID: %{public}@ error: %{public}@",  buf,  0x16u);
  }

  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10002AB00;
  v13[3] = &unk_100068E68;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  dispatch_sync((dispatch_queue_t)queue, v13);
}

- (void)syncEngine:(id)a3 didDeleteRecordZoneWithID:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  uint64_t v7 = __biome_log_for_category(11LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)id buf = 138543362;
    int v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "didDeleteRecordZoneWithID: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002AC8C;
  block[3] = &unk_1000697C8;
  void block[4] = self;
  id v13 = v6;
  id v14 = v5;
  id v10 = v5;
  id v11 = v6;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 zoneWithIDWasDeleted:(id)a4
{
  id v5 = a4;
  uint64_t v6 = __biome_log_for_category(11LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
    *(_DWORD *)id buf = 138543362;
    id v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "zoneWithIDWasDeleted: %{public}@", buf, 0xCu);
  }

  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002B054;
  v11[3] = &unk_100068E68;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_sync((dispatch_queue_t)queue, v11);
}

- (void)handleRecordWithIDDeletedSyncRecord:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B148;
  block[3] = &unk_100068E68;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngine:(id)a3 recordWithIDWasDeleted:(id)a4 recordType:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = __biome_log_for_category(11LL);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v7 recordName]);
    int v12 = 138543618;
    id v13 = v11;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "recordWithIDWasDeleted: %{public}@, type=%{public}@",  (uint8_t *)&v12,  0x16u);
  }

  if (sub_100024AA0(v8) == 1) {
    -[BMCloudKitSyncEngine handleRecordWithIDDeletedSyncRecord:](self, "handleRecordWithIDDeletedSyncRecord:", v7);
  }
}

- (void)syncEngineWillBeginFetchingChanges:(id)a3
{
  uint64_t v3 = __biome_log_for_category(11LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "syncEngineWillBeginFetchingChanges", v5, 2u);
  }
}

- (void)syncEngineDidEndFetchingChanges:(id)a3
{
  uint64_t v4 = __biome_log_for_category(11LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "syncEngineDidEndFetchingChanges", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002B4EC;
  block[3] = &unk_100068B70;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)syncEngineWillBeginModifyingPendingChanges:(id)a3
{
  uint64_t v3 = __biome_log_for_category(11LL);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "syncEngineWillBeginModifyingPendingChanges",  v5,  2u);
  }
}

- (void)syncEngineDidEndModifyingPendingChanges:(id)a3
{
  uint64_t v4 = __biome_log_for_category(11LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "syncEngineDidEndModifyingPendingChanges", buf, 2u);
  }

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002C260;
  block[3] = &unk_100068B70;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (BMSyncSessionMetricsCollector)metricsCollector
{
  return self->_metricsCollector;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CKSyncEngineDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKSyncEngineConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (CKSyncEngine)ckSyncEngine
{
  return self->_ckSyncEngine;
}

- (void)setCkSyncEngine:(id)a3
{
}

- (NSString)mergeableRecordValueKey
{
  return self->_mergeableRecordValueKey;
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end