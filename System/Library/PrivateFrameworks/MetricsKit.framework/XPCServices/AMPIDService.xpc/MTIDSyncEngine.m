@interface MTIDSyncEngine
+ (double)transactionTimeout;
+ (void)setTransactionTimeout:(double)a3;
- (CKContainer)container;
- (CKRecordZoneID)zoneID;
- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6;
- (MTIDSyncEngineDelegate)delegate;
- (NSMutableArray)transactions;
- (NSMutableSet)pendingRecordIDs;
- (NSMutableSet)queuedRecordIDs;
- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution;
- (OS_dispatch_queue)queue;
- (id)fetchRecordWithIDs:(id)a3;
- (int64_t)qualityOfService;
- (int64_t)state;
- (void)_beginTransaction;
- (void)_endTransaction;
- (void)accountDidChange:(id)a3;
- (void)addPendingRecordID:(id)a3;
- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5;
- (void)commit;
- (void)deleteRecordsWithIDs:(id)a3;
- (void)fetchAllRecords;
- (void)fetchRecordWithID:(id)a3;
- (void)handleDeletedRecordID:(id)a3 error:(id)a4;
- (void)handleEngineStartedWithError:(id)a3;
- (void)handleFetchedRecords:(id)a3 error:(id)a4;
- (void)handleSavedRecord:(id)a3 error:(id)a4;
- (void)handleUserRecordID:(id)a3;
- (void)removePendingRecordID:(id)a3;
- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4;
- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3;
- (void)setContainer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPendingRecordIDs:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setQueuedRecordIDs:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setTransactions:(id)a3;
- (void)setZoneID:(id)a3;
- (void)setupContainerWithIdentifier:(id)a3;
- (void)startEngine;
@end

@implementation MTIDSyncEngine

- (MTIDSyncEngine)initWithContainerIdentifier:(id)a3 zoneID:(id)a4 queue:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MTIDSyncEngine;
  v14 = -[MTIDSyncEngine init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    -[MTIDSyncEngine setQueue:](v14, "setQueue:", v12);
    -[MTIDSyncEngine setDelegate:](v15, "setDelegate:", v13);
    -[MTIDSyncEngine setZoneID:](v15, "setZoneID:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[MTIDSyncEngine setQueuedRecordIDs:](v15, "setQueuedRecordIDs:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[MTIDSyncEngine setPendingRecordIDs:](v15, "setPendingRecordIDs:", v17);

    -[MTIDSyncEngine setupContainerWithIdentifier:](v15, "setupContainerWithIdentifier:", v10);
    -[MTIDSyncEngine setQualityOfService:](v15, "setQualityOfService:", 17LL);
  }

  return v15;
}

- (void)setupContainerWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"accountDidChange:" name:CKAccountChangedNotification object:0];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTFrameworkEnvironment sharedEnvironment](&OBJC_CLASS___MTFrameworkEnvironment, "sharedEnvironment"));
  else {
    uint64_t v7 = 1LL;
  }

  id v8 = [[CKContainerID alloc] initWithContainerIdentifier:v4 environment:v7];
  v9 = -[CKContainer initWithContainerID:](objc_alloc(&OBJC_CLASS___CKContainer), "initWithContainerID:", v8);
  -[MTIDSyncEngine setContainer:](self, "setContainer:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine container](self, "container"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 containerID]);
  id v12 = [v11 environment];

  if (v12 == (id)2)
  {
    id v13 = MTMetricsKitOSLog();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "MetricsKit: AMPIDService is using iCloud container in the sandbox environment",  v15,  2u);
    }
  }
}

- (void)accountDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((id)-[MTIDSyncEngine state](v5, "state") == (id)2)
  {
    id v6 = MTMetricsKitOSLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Restarting ID sync engine because account has changed",  v8,  2u);
    }

    -[MTIDSyncEngine setState:](v5, "setState:", 0LL);
    -[MTIDSyncEngine startEngine](v5, "startEngine");
  }

  objc_sync_exit(v5);
}

- (void)setState:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_state = a3;
  if (!a3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine pendingRecordIDs](obj, "pendingRecordIDs"));
    [v4 removeAllObjects];

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queuedRecordIDs](obj, "queuedRecordIDs"));
    [v5 removeAllObjects];

    -[MTIDSyncEngine _endTransaction](obj, "_endTransaction");
  }

  objc_sync_exit(obj);
}

- (void)startEngine
{
  obj = self;
  objc_sync_enter(obj);
  if (-[MTIDSyncEngine state](obj, "state"))
  {
    objc_sync_exit(obj);
  }

  else
  {
    -[MTIDSyncEngine setState:](obj, "setState:", 1LL);
    objc_sync_exit(obj);

    objc_initWeak(&location, obj);
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine container](obj, "container"));
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_1000093BC;
    v4[3] = &unk_1000208A0;
    objc_copyWeak(&v5, &location);
    [v2 fetchUserRecordIDWithCompletionHandler:v4];

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }

- (id)fetchRecordWithIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___MTPromise);
  id v6 = MTMetricsKitOSLog();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Started fetching record with IDs",  buf,  2u);
  }

  id v8 = -[CKFetchRecordsOperation initWithRecordIDs:]( objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation),  "initWithRecordIDs:",  v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution]( self,  "applicationBundleIdentifierOverrideForNetworkAttribution"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordsOperation configuration](v8, "configuration"));
  [v10 setApplicationBundleIdentifierOverrideForNetworkAttribution:v9];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100009AAC;
  v15[3] = &unk_1000208C8;
  id v11 = v5;
  v16 = v11;
  -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v8, "setFetchRecordsCompletionBlock:", v15);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine container](self, "container"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 privateCloudDatabase]);
  [v13 addOperation:v8];

  return v11;
}

- (void)fetchRecordWithID:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ((id)-[MTIDSyncEngine state](v5, "state") == (id)2)
  {
    objc_sync_exit(v5);

    id v6 = MTMetricsKitOSLog();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 recordName]);
      *(_DWORD *)buf = 138412290;
      v21 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Started fetching record with ID %@",  buf,  0xCu);
    }

    -[MTIDSyncEngine addPendingRecordID:](v5, "addPendingRecordID:", v4);
    v9 = objc_alloc(&OBJC_CLASS___CKFetchRecordsOperation);
    id v19 = v4;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
    id v11 = -[CKFetchRecordsOperation initWithRecordIDs:](v9, "initWithRecordIDs:", v10);

    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution]( v5,  "applicationBundleIdentifierOverrideForNetworkAttribution"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordsOperation configuration](v11, "configuration"));
    [v13 setApplicationBundleIdentifierOverrideForNetworkAttribution:v12];

    objc_initWeak((id *)buf, v5);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100009DF8;
    v16[3] = &unk_1000208F0;
    id v17 = v4;
    objc_copyWeak(&v18, (id *)buf);
    -[CKFetchRecordsOperation setFetchRecordsCompletionBlock:](v11, "setFetchRecordsCompletionBlock:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine container](v5, "container"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 privateCloudDatabase]);
    [v15 addOperation:v11];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    -[MTIDSyncEngine startEngine](v5, "startEngine");
    objc_sync_exit(v5);
  }
}

- (void)fetchAllRecords
{
  obj = self;
  objc_sync_enter(obj);
  if ((id)-[MTIDSyncEngine state](obj, "state") == (id)2)
  {
    objc_sync_exit(obj);

    id v2 = MTMetricsKitOSLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Started fetching all record changes",  (uint8_t *)buf,  2u);
    }

    id v4 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine zoneID](obj, "zoneID"));
    v24 = v5;
    v25 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));

    uint64_t v7 = objc_alloc(&OBJC_CLASS___CKFetchRecordZoneChangesOperation);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine zoneID](obj, "zoneID"));
    v23 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    id v10 = -[CKFetchRecordZoneChangesOperation initWithRecordZoneIDs:configurationsByRecordZoneID:]( v7,  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v9,  v6);

    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution]( obj,  "applicationBundleIdentifierOverrideForNetworkAttribution"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKFetchRecordZoneChangesOperation configuration](v10, "configuration"));
    [v12 setApplicationBundleIdentifierOverrideForNetworkAttribution:v11];

    objc_initWeak(buf, obj);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_10000A290;
    v20[3] = &unk_100020918;
    objc_copyWeak(&v21, buf);
    -[CKFetchRecordZoneChangesOperation setRecordChangedBlock:](v10, "setRecordChangedBlock:", v20);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10000A338;
    v18[3] = &unk_100020940;
    objc_copyWeak(&v19, buf);
    -[CKFetchRecordZoneChangesOperation setRecordWithIDWasDeletedBlock:](v10, "setRecordWithIDWasDeletedBlock:", v18);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10000A384;
    v16[3] = &unk_100020968;
    objc_copyWeak(&v17, buf);
    -[CKFetchRecordZoneChangesOperation setRecordZoneFetchCompletionBlock:]( v10,  "setRecordZoneFetchCompletionBlock:",  v16);
    -[MTIDSyncEngine _beginTransaction](obj, "_beginTransaction");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine container](obj, "container"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 privateCloudDatabase]);
    [v14 addOperation:v10];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }

  else
  {
    -[MTIDSyncEngine startEngine](obj, "startEngine");
    objc_sync_exit(obj);
  }

- (void)saveRecordsWithIDs:(id)a3 qualityOfService:(int64_t)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = self;
    objc_sync_enter(v7);
    if (-[MTIDSyncEngine qualityOfService](v7, "qualityOfService") < a4) {
      -[MTIDSyncEngine setQualityOfService:](v7, "setQualityOfService:", a4);
    }
    if ((id)-[MTIDSyncEngine state](v7, "state") == (id)2)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queuedRecordIDs](v7, "queuedRecordIDs"));
      id v9 = [v8 count];

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queuedRecordIDs](v7, "queuedRecordIDs"));
      [v10 addObjectsFromArray:v6];

      if (!v9)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queuedRecordIDs](v7, "queuedRecordIDs"));
        id v12 = [v11 count];

        if (v12)
        {
          dispatch_time_t v13 = dispatch_time(0LL, 1000000000LL);
          v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queue](v7, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10000A574;
          block[3] = &unk_100020560;
          block[4] = v7;
          dispatch_after(v13, v14, block);
        }
      }
    }

    else
    {
      -[MTIDSyncEngine startEngine](v7, "startEngine");
    }

    objc_sync_exit(v7);
  }
}

- (void)commit
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queuedRecordIDs](v2, "queuedRecordIDs"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);

  id v5 = -[MTIDSyncEngine qualityOfService](v2, "qualityOfService");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queuedRecordIDs](v2, "queuedRecordIDs"));
  [v6 removeAllObjects];

  -[MTIDSyncEngine setQualityOfService:](v2, "setQualityOfService:", 17LL);
  objc_sync_exit(v2);

  if ([v4 count])
  {
    id v7 = MTMetricsKitOSLog();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 134218240;
      id v10 = [v4 count];
      __int16 v11 = 2048;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Started saving %ld records with qos %ld",  (uint8_t *)&v9,  0x16u);
    }

    -[MTIDSyncEngine addRecordIDsToSave:recordIDsToDelete:qualityOfService:]( v2,  "addRecordIDsToSave:recordIDsToDelete:qualityOfService:",  v4,  0LL,  v5);
  }
}

- (void)deleteRecordsWithIDs:(id)a3
{
}

- (void)addRecordIDsToSave:(id)a3 recordIDsToDelete:(id)a4 qualityOfService:(int64_t)a5
{
  id v8 = a3;
  id v26 = a4;
  int v9 = self;
  objc_sync_enter(v9);
  if ((id)-[MTIDSyncEngine state](v9, "state") == (id)2)
  {
    int64_t v25 = a5;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v11 = v8;
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v34;
      do
      {
        v14 = 0LL;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine delegate](v9, "delegate"));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 recordWithID:v15]);

          if (v17)
          {
            -[MTIDSyncEngine addPendingRecordID:](v9, "addPendingRecordID:", v15);
            [v10 addObject:v17];
          }

          v14 = (char *)v14 + 1;
        }

        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v12);
    }

    objc_initWeak(&location, v9);
    id v18 = -[CKModifyRecordsOperation initWithRecordsToSave:recordIDsToDelete:]( objc_alloc(&OBJC_CLASS___CKModifyRecordsOperation),  "initWithRecordsToSave:recordIDsToDelete:",  v10,  v26);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v18, "configuration"));
    [v19 setQualityOfService:v25];

    v20 = (void *)objc_claimAutoreleasedReturnValue( -[MTIDSyncEngine applicationBundleIdentifierOverrideForNetworkAttribution]( v9,  "applicationBundleIdentifierOverrideForNetworkAttribution"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKModifyRecordsOperation configuration](v18, "configuration"));
    [v21 setApplicationBundleIdentifierOverrideForNetworkAttribution:v20];

    -[CKModifyRecordsOperation setSavePolicy:](v18, "setSavePolicy:", 0LL);
    -[CKModifyRecordsOperation setAtomic:](v18, "setAtomic:", 0LL);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_10000AA88;
    v30[3] = &unk_100020990;
    objc_copyWeak(&v31, &location);
    -[CKModifyRecordsOperation setPerRecordCompletionBlock:](v18, "setPerRecordCompletionBlock:", v30);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10000AAEC;
    v27[3] = &unk_1000209B8;
    id v22 = v10;
    id v28 = v22;
    objc_copyWeak(&v29, &location);
    -[CKModifyRecordsOperation setCompletionBlock:](v18, "setCompletionBlock:", v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine container](v9, "container"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 privateCloudDatabase]);
    [v24 addOperation:v18];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);

    objc_destroyWeak(&location);
  }

  else
  {
    -[MTIDSyncEngine startEngine](v9, "startEngine");
  }

  objc_sync_exit(v9);
}

- (void)addPendingRecordID:(id)a3
{
  id v6 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine pendingRecordIDs](v4, "pendingRecordIDs"));
  [v5 addObject:v6];

  -[MTIDSyncEngine _beginTransaction](v4, "_beginTransaction");
  objc_sync_exit(v4);
}

- (void)removePendingRecordID:(id)a3
{
  id v8 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine pendingRecordIDs](v4, "pendingRecordIDs"));
  [v5 removeObject:v8];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine pendingRecordIDs](v4, "pendingRecordIDs"));
  id v7 = [v6 count];

  if (!v7) {
    -[MTIDSyncEngine _endTransaction](v4, "_endTransaction");
  }
  objc_sync_exit(v4);
}

+ (double)transactionTimeout
{
  return *(double *)&qword_1000282A8;
}

+ (void)setTransactionTimeout:(double)a3
{
  qword_1000282A8 = *(void *)&a3;
}

- (void)_beginTransaction
{
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10000AEB8;
  uint64_t v15 = sub_10000AEC8;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine transactions](self, "transactions"));
  v3 = (void *)v12[5];
  if (!v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", 1LL));
    id v5 = (void *)v12[5];
    v12[5] = v4;

    -[MTIDSyncEngine setTransactions:](self, "setTransactions:", v12[5]);
    v3 = (void *)v12[5];
  }

  if (![v3 count])
  {
    id v6 = (void *)v12[5];
    id v7 = (void *)os_transaction_create("com.apple.AMPIDService.SyncEngineQueue");
    [v6 addObject:v7];
  }

  +[MTIDSyncEngine transactionTimeout](&OBJC_CLASS___MTIDSyncEngine, "transactionTimeout");
  dispatch_time_t v9 = dispatch_time(0LL, (uint64_t)(v8 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000AED0;
  block[3] = &unk_1000204A0;
  block[4] = &v11;
  dispatch_after(v9, &_dispatch_main_q, block);
  _Block_object_dispose(&v11, 8);
}

- (void)_endTransaction
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine transactions](self, "transactions"));
  [v2 removeAllObjects];
}

- (void)handleUserRecordID:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000AFA8;
  v7[3] = &unk_1000209E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)handleEngineStartedWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  -[MTIDSyncEngine setState:](v5, "setState:", 2LL * (v4 == 0LL));
  objc_sync_exit(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queue](v5, "queue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000B0C0;
  v8[3] = &unk_1000209E0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)handleSavedRecord:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if ([v8 isEqual:CKErrorDomain])
  {
    id v9 = [v7 code];

    if (v9 == (id)14)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey]);

      if (v11)
      {
        id v12 = MTMetricsKitOSLog();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 recordName]);
          *(_DWORD *)buf = 138412290;
          id v28 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "MetricsKit: Server has a newer version of record with ID %@, use server record instead",  buf,  0xCu);
        }

        id v16 = v11;
        id v7 = 0LL;
        id v6 = v16;
      }

      goto LABEL_11;
    }
  }

  else
  {
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if (![v17 isEqual:CKErrorDomain])
  {

    goto LABEL_13;
  }

  id v18 = [v7 code];

  if (v18 == (id)11)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine delegate](self, "delegate"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    [v11 recordWasDeleted:v19];

LABEL_11:
  }

- (void)handleFetchedRecords:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to fetch records with error %@",  buf,  0xCu);
    }
  }

  else
  {
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queue](self, "queue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10000B5D4;
    v11[3] = &unk_1000209E0;
    id v12 = (os_log_s *)v6;
    uint64_t v13 = self;
    dispatch_async(v10, v11);

    id v9 = v12;
  }
}

- (void)handleDeletedRecordID:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = MTMetricsKitOSLog();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 recordName]);
      *(_DWORD *)buf = 138412546;
      id v15 = v10;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "MetricsKit: Failed to delete record with ID %@ error %@",  buf,  0x16u);
    }
  }

  else
  {
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MTIDSyncEngine queue](self, "queue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10000B82C;
    v12[3] = &unk_1000209E0;
    v12[4] = self;
    id v13 = v6;
    dispatch_async(v11, v12);
  }
}

- (int64_t)state
{
  return self->_state;
}

- (MTIDSyncEngineDelegate)delegate
{
  return (MTIDSyncEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSString)applicationBundleIdentifierOverrideForNetworkAttribution
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setApplicationBundleIdentifierOverrideForNetworkAttribution:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CKContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (CKRecordZoneID)zoneID
{
  return self->_zoneID;
}

- (void)setZoneID:(id)a3
{
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (NSMutableSet)queuedRecordIDs
{
  return self->_queuedRecordIDs;
}

- (void)setQueuedRecordIDs:(id)a3
{
}

- (NSMutableSet)pendingRecordIDs
{
  return self->_pendingRecordIDs;
}

- (void)setPendingRecordIDs:(id)a3
{
}

- (NSMutableArray)transactions
{
  return (NSMutableArray *)objc_loadWeakRetained((id *)&self->_transactions);
}

- (void)setTransactions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end