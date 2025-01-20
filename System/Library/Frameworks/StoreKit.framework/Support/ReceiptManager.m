@interface ReceiptManager
+ (id)managerForClient:(id)a3;
+ (void)handleAppUninstallForBundleIDs:(id)a3;
- (BOOL)_clearCachedLegacyTransactionsWithLogKey:(id)a3;
- (BOOL)_includeFinishedConsumables;
- (BOOL)_needsSubscriptionStatusSyncForStatusDictionary:(id)a3 logKey:(id)a4;
- (BOOL)_resetLastUpdatedForLegacyTransactionsWithLogKey:(id)a3;
- (BOOL)_setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 includesFinishedConsumables:(BOOL)a5 forRevision:(id)a6 logKey:(id)a7 containsSubscriptions:(BOOL *)a8;
- (BOOL)invalidateLegacyTransactionCache;
- (BOOL)isTransactionFinishedForID:(id)a3;
- (NSDate)lastUpdated;
- (NSLock)syncLock;
- (NSOperationQueue)readQueue;
- (NSOperationQueue)syncQueue;
- (ReceiptManager)initWithClient:(id)a3;
- (_TtC9storekitd6Client)client;
- (id)_configureMetricsEventWithBeforeTransactionCount:(unint64_t)a3 beforeTransactions:(id)a4 beforeStatuses:(id)a5;
- (id)databaseStore;
- (void)_appTransactionSyncWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_authenticateWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_checkTransactionAgeAndSyncWithLogKey:(id)a3 completionHandler:(id)a4;
- (void)_checkTransactionAgeOnReadQueueForStatusWithGroupID:(id)a3 completionHandler:(id)a4;
- (void)_manualSyncWithLogKey:(id)a3 completionHandler:(id)a4;
- (void)_setUnfinishedForTransactionIDs:(id)a3 logKey:(id)a4;
- (void)_syncSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_syncTransactionsAndSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)_syncTransactionsWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5;
- (void)appTransactionWithDialogContext:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5;
- (void)authenticateAndSyncWithDialogContext:(id)a3 completionHandler:(id)a4;
- (void)clearTransactions;
- (void)enumerateCurrentReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)enumerateReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5;
- (void)enumerateSubscriptionStatusUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)enumerateUnfinishedTransactionsUsingBlock:(id)a3 completionHandler:(id)a4;
- (void)isEligibleForIntroductoryOfferForSubscriptionGroupID:(id)a3 storefrontID:(id)a4 completionHandler:(id)a5;
- (void)requestUnifiedAppReceiptWithDialogContext:(id)a3 logKey:(id)a4 options:(id)a5 completionHandler:(id)a6;
- (void)setFinishedForTransactionID:(id)a3;
- (void)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forRevision:(id)a5;
- (void)subscriptionStatusForSubscriptionGroupID:(id)a3 completionHandler:(id)a4;
- (void)syncReceiptsWithReason:(int64_t)a3 completionHandler:(id)a4;
- (void)syncSubscriptionStatusWithReason:(int64_t)a3 completionHandler:(id)a4;
@end

@implementation ReceiptManager

+ (id)managerForClient:(id)a3
{
  id v3 = a3;
  if (qword_10032DEE8 != -1) {
    dispatch_once(&qword_10032DEE8, &stru_1002E6ED8);
  }
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10000EBE0;
  v15 = sub_10000EBF0;
  id v16 = 0LL;
  v4 = (dispatch_queue_s *)qword_10032DEE0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10000EBF8;
  v8[3] = &unk_1002E6A00;
  id v9 = v3;
  v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (void)handleAppUninstallForBundleIDs:(id)a3
{
  id v4 = a3;
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  id v5 = (os_log_s *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = a1;
    __int16 v23 = 2114;
    id v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Handling app uninstall for %{public}@",  buf,  0x16u);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[Environment sharedInstance](&OBJC_CLASS___Environment, "sharedInstance"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v14 userDatabase]);
  v7 = -[SQLiteDatabaseStore initWithDatabase:]( objc_alloc(&OBJC_CLASS___InAppReceiptDatabaseStore),  "initWithDatabase:",  v6);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472LL;
        v15[2] = sub_10000EF30;
        v15[3] = &unk_1002E6F00;
        v15[4] = v13;
        v15[5] = a1;
        -[SQLiteDatabaseStore modifyUsingTransaction:](v7, "modifyUsingTransaction:", v15);
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

- (ReceiptManager)initWithClient:(id)a3
{
  id v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS___ReceiptManager;
  id v6 = -[ReceiptManager init](&v38, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_client, a3);
    id v8 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    readQueue = v7->_readQueue;
    v7->_readQueue = v8;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_readQueue, "setMaxConcurrentOperationCount:", 4LL);
    id v10 = objc_opt_new(&OBJC_CLASS___NSLock);
    syncLock = v7->_syncLock;
    v7->_syncLock = v10;

    v12 = objc_opt_new(&OBJC_CLASS___NSOperationQueue);
    syncQueue = v7->_syncQueue;
    v7->_syncQueue = v12;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v7->_syncQueue, "setMaxConcurrentOperationCount:", 1LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 requestBundleID]);
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[InAppReceiptDatabaseShared databasePathsForBundleID:error:]( &OBJC_CLASS___InAppReceiptDatabaseShared,  "databasePathsForBundleID:error:",  v14,  0LL));

    if (v15)
    {
      v31 = v7;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      v30 = v15;
      id v16 = v15;
      id v17 = [v16 countByEnumeratingWithState:&v34 objects:v45 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v35;
        do
        {
          v20 = 0LL;
          do
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8LL * (void)v20);
            id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
            unsigned int v23 = [v22 fileExistsAtPath:v21];

            if (v23)
            {
              if (qword_10032DF38 != -1) {
                dispatch_once(&qword_10032DF38, &stru_1002E7588);
              }
              id v24 = (os_log_s *)qword_10032DF18;
              if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138543618;
                v40 = v32;
                __int16 v41 = 2114;
                uint64_t v42 = v21;
                _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "[%{public}@] Removing app receipts db at %{public}@",  buf,  0x16u);
              }

              v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
              id v33 = 0LL;
              unsigned __int8 v26 = [v25 removeItemAtPath:v21 error:&v33];
              id v27 = v33;

              if ((v26 & 1) == 0)
              {
                if (qword_10032DF38 != -1) {
                  dispatch_once(&qword_10032DF38, &stru_1002E7588);
                }
                v28 = (os_log_s *)qword_10032DF18;
                if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  v40 = v32;
                  __int16 v41 = 2114;
                  uint64_t v42 = v21;
                  __int16 v43 = 2114;
                  id v44 = v27;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "[%{public}@] Error removing receipts at %{public}@ - %{public}@",  buf,  0x20u);
                }
              }
            }

            v20 = (char *)v20 + 1;
          }

          while (v18 != v20);
          id v18 = [v16 countByEnumeratingWithState:&v34 objects:v45 count:16];
        }

        while (v18);
      }

      v7 = v31;
      v15 = v30;
    }
  }

  return v7;
}

- (id)databaseStore
{
  v2 = self;
  objc_sync_enter(v2);
  WeakRetained = (InAppReceiptDatabaseStore *)objc_loadWeakRetained((id *)&v2->_databaseStore);
  if (!WeakRetained)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[Environment sharedInstance](&OBJC_CLASS___Environment, "sharedInstance"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userDatabase]);
    WeakRetained = -[SQLiteDatabaseStore initWithDatabase:]( objc_alloc(&OBJC_CLASS___InAppReceiptDatabaseStore),  "initWithDatabase:",  v5);
    objc_storeWeak((id *)&v2->_databaseStore, WeakRetained);
  }

  objc_sync_exit(v2);

  return WeakRetained;
}

- (void)appTransactionWithDialogContext:(id)a3 ignoreCache:(BOOL)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  uint64_t v11 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestBundleID]);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Getting app transaction for %{public}@",  buf,  0x16u);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncLock](self, "syncLock"));
  [v15 lock];

  if (a4)
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    id v16 = (void *)qword_10032DF18;
    if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v10;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Ignoring cache and requesting app transaction for %{public}@",  buf,  0x16u);
    }

    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_10000FB0C;
    v34[3] = &unk_1002E6F78;
    v34[4] = self;
    id v37 = v9;
    id v35 = v8;
    id v36 = v10;
    -[ReceiptManager _authenticateWithDialogContext:logKey:completionHandler:]( self,  "_authenticateWithDialogContext:logKey:completionHandler:",  v35,  v36,  v34);
  }

  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentAccountToken]);

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v46 = sub_10000EBE0;
    v47 = sub_10000EBF0;
    id v48 = 0LL;
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472LL;
    v38[2] = sub_10000FA50;
    v38[3] = &unk_1002E6F28;
    v40 = buf;
    v38[4] = self;
    id v23 = v21;
    id v39 = v23;
    [v22 readUsingSession:v38];

    if ([*(id *)(*(void *)&buf[8] + 40) length])
    {
      if (qword_10032DF38 != -1) {
        dispatch_once(&qword_10032DF38, &stru_1002E7588);
      }
      id v24 = (os_log_s *)(id)qword_10032DF18;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
        unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v25 requestBundleID]);
        *(_DWORD *)__int16 v41 = 138543618;
        uint64_t v42 = v10;
        __int16 v43 = 2114;
        id v44 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_INFO,  "[%{public}@] Found cached app transaction for %{public}@",  v41,  0x16u);
      }

      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncLock](self, "syncLock"));
      [v27 unlock];

      (*((void (**)(id, void, void))v9 + 2))(v9, *(void *)(*(void *)&buf[8] + 40LL), 0LL);
      _Block_object_dispose(buf, 8);
    }

    else
    {

      _Block_object_dispose(buf, 8);
      if (qword_10032DF38 != -1) {
        dispatch_once(&qword_10032DF38, &stru_1002E7588);
      }
      v28 = (void *)qword_10032DF18;
      if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
      {
        v29 = v28;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
        v31 = (void *)objc_claimAutoreleasedReturnValue([v30 requestBundleID]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v31;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requesting app transaction for %{public}@",  buf,  0x16u);
      }

      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_10000FC58;
      v32[3] = &unk_1002E6F50;
      v32[4] = self;
      id v33 = v9;
      -[ReceiptManager _appTransactionSyncWithDialogContext:logKey:completionHandler:]( self,  "_appTransactionSyncWithDialogContext:logKey:completionHandler:",  v8,  v10,  v32);
    }
  }
}

- (void)authenticateAndSyncWithDialogContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  id v9 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = v9;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestBundleID]);
    *(_DWORD *)buf = 138543618;
    uint64_t v19 = v8;
    __int16 v20 = 2114;
    uint64_t v21 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Starting authenticate and sync for %{public}@",  buf,  0x16u);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10000FE88;
  v15[3] = &unk_1002E6FA0;
  id v16 = v8;
  id v17 = v6;
  v15[4] = self;
  id v13 = v8;
  id v14 = v6;
  -[ReceiptManager _authenticateWithDialogContext:logKey:completionHandler:]( self,  "_authenticateWithDialogContext:logKey:completionHandler:",  v7,  v13,  v15);
}

- (void)clearTransactions
{
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  id v3 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    id v5 = (void *)objc_opt_class(self);
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestBundleID]);
    *(_DWORD *)buf = 138543618;
    v12 = v5;
    __int16 v13 = 2114;
    id v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Clearing transactions for %{public}@",  buf,  0x16u);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10001001C;
  v10[3] = &unk_1002E6FC8;
  v10[4] = self;
  [v9 modifyUsingTransaction:v10];
}

- (void)enumerateCurrentReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager readQueue](self, "readQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000101AC;
  v15[3] = &unk_1002E7068;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 addOperationWithBlock:v15];
}

- (void)enumerateReceiptsForProductID:(id)a3 usingBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager readQueue](self, "readQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100010798;
  v15[3] = &unk_1002E7068;
  id v16 = v8;
  id v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [v11 addOperationWithBlock:v15];
}

- (void)enumerateUnfinishedTransactionsUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager readQueue](self, "readQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100010D5C;
  v11[3] = &unk_1002E70E0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

- (BOOL)invalidateLegacyTransactionCache
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  id v4 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestBundleID]);
    int v10 = 138543874;
    uint64_t v11 = self;
    __int16 v12 = 2114;
    id v13 = v3;
    __int16 v14 = 2114;
    v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@] Invalidating legacy cache for %{public}@",  (uint8_t *)&v10,  0x20u);
  }

  if (-[ReceiptManager _clearCachedLegacyTransactionsWithLogKey:]( self,  "_clearCachedLegacyTransactionsWithLogKey:",  v3))
  {
    BOOL v8 = -[ReceiptManager _resetLastUpdatedForLegacyTransactionsWithLogKey:]( self,  "_resetLastUpdatedForLegacyTransactionsWithLogKey:",  v3);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)isEligibleForIntroductoryOfferForSubscriptionGroupID:(id)a3 storefrontID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager readQueue](self, "readQueue"));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10001143C;
  v17[3] = &unk_1002E7130;
  v17[4] = self;
  id v18 = v11;
  id v19 = v8;
  id v20 = v9;
  id v21 = v10;
  id v13 = v10;
  id v14 = v9;
  id v15 = v8;
  id v16 = v11;
  [v12 addOperationWithBlock:v17];
}

- (BOOL)isTransactionFinishedForID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100011CA0;
  v8[3] = &unk_1002E6F28;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v9 = v6;
  id v10 = self;
  [v5 readUsingSession:v8];

  LOBYTE(self) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)self;
}

- (NSDate)lastUpdated
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10000EBE0;
  uint64_t v11 = sub_10000EBF0;
  id v12 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100011E00;
  v6[3] = &unk_1002E7158;
  v6[4] = self;
  v6[5] = &v7;
  [v3 readUsingSession:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (void)requestUnifiedAppReceiptWithDialogContext:(id)a3 logKey:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  uint64_t v14 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    char v15 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 requestBundleID]);
    *(_DWORD *)buf = 138543874;
    id v38 = v11;
    __int16 v39 = 2114;
    v40 = v17;
    __int16 v41 = 2114;
    id v42 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Requesting unified receipt for %{public}@ with options: %{public}@",  buf,  0x20u);
  }

  id v18 = objc_alloc(&OBJC_CLASS___FetchReceiptTask);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  id v20 = -[FetchReceiptTask initWithClient:](v18, "initWithClient:", v19);

  -[FetchReceiptTask setLogKey:](v20, "setLogKey:", v11);
  -[FetchReceiptTask setDialogContext:](v20, "setDialogContext:", v10);
  id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"expired"]);
  unsigned int v22 = [v21 BOOLValue];

  if (v22) {
    -[FetchReceiptTask setReceiptFlags:]( v20,  "setReceiptFlags:",  -[FetchReceiptTask receiptFlags](v20, "receiptFlags") | 1);
  }
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"revoked"]);
  unsigned int v24 = [v23 BOOLValue];

  if (v24) {
    -[FetchReceiptTask setReceiptFlags:]( v20,  "setReceiptFlags:",  -[FetchReceiptTask receiptFlags](v20, "receiptFlags") | 2);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"vpp"]);
  unsigned int v26 = [v25 BOOLValue];

  if (v26) {
    -[FetchReceiptTask setReceiptFlags:]( v20,  "setReceiptFlags:",  -[FetchReceiptTask receiptFlags](v20, "receiptFlags") | 8);
  }
  objc_initWeak((id *)buf, v20);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1000121D0;
  v31[3] = &unk_1002E7180;
  objc_copyWeak(&v36, (id *)buf);
  id v27 = v12;
  id v32 = v27;
  id v28 = v11;
  id v33 = v28;
  __int128 v34 = self;
  id v29 = v13;
  id v35 = v29;
  -[FetchReceiptTask setCompletionBlock:](v20, "setCompletionBlock:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncQueue](self, "syncQueue"));
  [v30 addOperation:v20];

  objc_destroyWeak(&v36);
  objc_destroyWeak((id *)buf);
}

- (void)setFinishedForTransactionID:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000123EC;
  v9[3] = &unk_1002E71A8;
  id v10 = v4;
  id v11 = self;
  id v12 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 modifyUsingTransaction:v9];
}

- (void)subscriptionStatusForSubscriptionGroupID:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100012554;
  v7[3] = &unk_1002E71F8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ReceiptManager _checkTransactionAgeOnReadQueueForStatusWithGroupID:completionHandler:]( v8,  "_checkTransactionAgeOnReadQueueForStatusWithGroupID:completionHandler:",  v6,  v7);
}

- (void)enumerateSubscriptionStatusUsingBlock:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100012A40;
  v7[3] = &unk_1002E72E8;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  -[ReceiptManager _checkTransactionAgeOnReadQueueForStatusWithGroupID:completionHandler:]( v8,  "_checkTransactionAgeOnReadQueueForStatusWithGroupID:completionHandler:",  0LL,  v7);
}

- (void)setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 forRevision:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  uint64_t v14 = 0LL;
  char v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000130B0;
  v13[3] = &unk_1002E7158;
  v13[4] = self;
  v13[5] = &v14;
  [v12 readUsingSession:v13];

  -[ReceiptManager _setTransactionInfo:unfinishedIDs:includesFinishedConsumables:forRevision:logKey:containsSubscriptions:]( self,  "_setTransactionInfo:unfinishedIDs:includesFinishedConsumables:forRevision:logKey:containsSubscriptions:",  v8,  v9,  *((unsigned __int8 *)v15 + 24),  v10,  v11,  0LL);
  _Block_object_dispose(&v14, 8);
}

- (void)syncReceiptsWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncLock](self, "syncLock"));
  [v8 lock];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000131F4;
  v10[3] = &unk_1002E7310;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  -[ReceiptManager _syncTransactionsAndSubscriptionStatusWithReason:logKey:completionHandler:]( self,  "_syncTransactionsAndSubscriptionStatusWithReason:logKey:completionHandler:",  a3,  v7,  v10);
}

- (void)syncSubscriptionStatusWithReason:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncLock](self, "syncLock"));
  [v8 lock];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100013318;
  v10[3] = &unk_1002E7310;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  -[ReceiptManager _syncSubscriptionStatusWithReason:logKey:completionHandler:]( self,  "_syncSubscriptionStatusWithReason:logKey:completionHandler:",  a3,  v7,  v10);
}

- (void)_appTransactionSyncWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___FetchReceiptTask);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  id v13 = -[FetchReceiptTask initWithClient:](v11, "initWithClient:", v12);

  -[FetchReceiptTask setDialogContext:](v13, "setDialogContext:", v8);
  -[FetchReceiptTask setApiVersion:](v13, "setApiVersion:", 2LL);
  objc_initWeak(&location, v13);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000134F0;
  v17[3] = &unk_1002E7338;
  objc_copyWeak(&v21, &location);
  id v14 = v9;
  id v18 = v14;
  id v19 = self;
  id v15 = v10;
  id v20 = v15;
  -[FetchReceiptTask setCompletionBlock:](v13, "setCompletionBlock:", v17);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncQueue](self, "syncQueue"));
  [v16 addOperation:v13];

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

- (void)_authenticateWithDialogContext:(id)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  unsigned int v12 = objc_msgSend(v11, "objc_clientType");

  if (v12 == 3)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestBundleID]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[OctaneActionContext contextWithBundleID:]( &OBJC_CLASS___OctaneActionContext,  "contextWithBundleID:",  v14));

    if (v15)
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctaneManager sharedInstance](&OBJC_CLASS___OctaneManager, "sharedInstance"));
      unsigned __int8 v17 = [v16 getBoolValueForIdentifier:2 withContext:v15];

      if ((v17 & 1) != 0)
      {
        if (qword_10032DF38 != -1) {
          dispatch_once(&qword_10032DF38, &stru_1002E7588);
        }
        id v18 = (os_log_s *)qword_10032DF18;
        if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v53 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Skipping authenticate for Xcode environment",  buf,  0xCu);
        }

        v10[2](v10, 0LL);
        goto LABEL_28;
      }

      id v33 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:identifier:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:identifier:",  @"Cancel",  @"Cancel"));
      [v33 setStyle:2];
      id v42 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogAction actionWithTitle:identifier:]( &OBJC_CLASS___AMSDialogAction,  "actionWithTitle:identifier:",  @"OK",  @"OK"));
      __int16 v43 = (void *)objc_claimAutoreleasedReturnValue( +[AMSDialogRequest requestWithTitle:message:]( &OBJC_CLASS___AMSDialogRequest,  "requestWithTitle:message:",  @"Sign in with Apple Account",  @"Press OK to simulate authenticating with an Apple Account.\n\n[Environment: Xcode]"));
      [v43 setDefaultAction:v42];
      v54[0] = v33;
      v54[1] = v42;
      id v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v54, 2LL));
      [v43 setButtonActions:v44];

      [v43 setLogKey:v9];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472LL;
      v49[2] = sub_100013CC0;
      v49[3] = &unk_1002E7360;
      id v50 = v9;
      v51 = v10;
      [v8 handleDialogRequest:v43 completionHandler:v49];
    }

    else
    {
      if (qword_10032DF38 != -1) {
        dispatch_once(&qword_10032DF38, &stru_1002E7588);
      }
      v31 = (void *)qword_10032DF18;
      if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_ERROR)) {
        sub_10025B968((uint64_t)v9, v31, self);
      }
      uint64_t v32 = ASDErrorWithDescription( ASDErrorDomain,  950LL,  @"The requested action is invalid for the application.");
      id v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
      ((void (**)(id, void *))v10)[2](v10, v33);
    }

    goto LABEL_28;
  }

  id v15 = (void *)objc_opt_new(&OBJC_CLASS___AMSAuthenticateOptions);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 processInfo]);
  [v15 setClientInfo:v20];

  [v15 setAuthenticationType:2];
  [v15 setDebugReason:@"StoreKit client initiated for syncing transactions"];
  [v15 setLogKey:v9];
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  unsigned int v22 = (void *)objc_claimAutoreleasedReturnValue([v21 account]);

  if (v22)
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    id v23 = (os_log_s *)qword_10032DF18;
    if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEBUG)) {
      sub_10025BA84((uint64_t)v9, v23, v24, v25, v26, v27, v28, v29);
    }
    v30 = -[AMSAuthenticateRequest initWithAccount:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithAccount:options:",  v22,  v15);
  }

  else
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    __int128 v34 = (os_log_s *)qword_10032DF18;
    if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEBUG)) {
      sub_10025BA20((uint64_t)v9, v34, v35, v36, v37, v38, v39, v40);
    }
    v30 = -[AMSAuthenticateRequest initWithDSID:altDSID:username:options:]( objc_alloc(&OBJC_CLASS___AMSAuthenticateRequest),  "initWithDSID:altDSID:username:options:",  0LL,  0LL,  0LL,  v15);
  }

  __int16 v41 = v30;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_100013F4C;
  v45[3] = &unk_1002E7388;
  id v46 = v9;
  v47 = self;
  id v48 = v10;
  [v8 handleAuthenticateRequest:v41 completionHandler:v45];

LABEL_28:
}

- (void)_checkTransactionAgeAndSyncWithLogKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncLock](self, "syncLock"));
  [v8 lock];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  unsigned __int8 v10 = [v9 hasEverHadIAPs];

  if ((v10 & 1) != 0)
  {
    int v11 = 0;
  }

  else
  {
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bag]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[BagKey ignoreIAPQueueCheckSuppression]( &OBJC_CLASS____TtC9storekitd6BagKey,  "ignoreIAPQueueCheckSuppression"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 BOOLForKey:v14]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 valueWithError:0]);
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      if (qword_10032DF38 != -1) {
        dispatch_once(&qword_10032DF38, &stru_1002E7588);
      }
      id v18 = (void *)qword_10032DF18;
      if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = v18;
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 requestBundleID]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Allowing queue check for client with no history of IAPs.",  buf,  0x16u);
      }
    }

    else
    {
      if (qword_10032DF38 != -1) {
        dispatch_once(&qword_10032DF38, &stru_1002E7588);
      }
      unsigned int v22 = (void *)qword_10032DF18;
      if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = v22;
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 requestBundleID]);
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Supressing queue check for client with no history of IAPs.",  buf,  0x16u);
      }
    }

    int v11 = v17 ^ 1;
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  v102 = sub_10000EBE0;
  v103 = sub_10000EBF0;
  id v104 = 0LL;
  uint64_t v89 = 0LL;
  v90 = &v89;
  uint64_t v91 = 0x3032000000LL;
  v92 = sub_10000EBE0;
  v93 = sub_10000EBF0;
  id v94 = 0LL;
  uint64_t v85 = 0LL;
  v86 = &v85;
  uint64_t v87 = 0x2020000000LL;
  char v88 = 0;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_100014EE0;
  v84[3] = &unk_1002E73B0;
  v84[4] = self;
  v84[5] = buf;
  v84[6] = &v89;
  v84[7] = &v85;
  [v26 readUsingSession:v84];

  unsigned int v27 = -[ReceiptManager _includeFinishedConsumables](self, "_includeFinishedConsumables");
  if (*((unsigned __int8 *)v86 + 24) != v27)
  {
    -[ReceiptManager clearTransactions](self, "clearTransactions");
    if (v11)
    {
      if (qword_10032DF38 != -1) {
        dispatch_once(&qword_10032DF38, &stru_1002E7588);
      }
      uint64_t v29 = (os_log_s *)(id)qword_10032DF18;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
        uint64_t v41 = objc_claimAutoreleasedReturnValue([v40 requestBundleID]);
        id v42 = (void *)v41;
        __int16 v43 = @"NO";
        *(_DWORD *)v95 = 138543874;
        id v96 = v6;
        __int16 v97 = 2114;
        if (v27) {
          __int16 v43 = @"YES";
        }
        uint64_t v98 = v41;
        __int16 v99 = 2114;
        v100 = (void *)v43;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Skipping transaction sync for %{public}@ where includeFinishedConsumables (%{public}@) doesn't match cache",  v95,  0x20u);
      }

      goto LABEL_68;
    }

    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    uint64_t v29 = (os_log_s *)(id)qword_10032DF18;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      uint64_t v45 = objc_claimAutoreleasedReturnValue([v44 requestBundleID]);
      id v46 = (void *)v45;
      v47 = @"NO";
      *(_DWORD *)v95 = 138543874;
      id v96 = v6;
      __int16 v97 = 2114;
      if (v27) {
        v47 = @"YES";
      }
      uint64_t v98 = v45;
      __int16 v99 = 2114;
      v100 = (void *)v47;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Forcing transaction sync for %{public}@ because includeFinishedConsumables (%{public}@) doesn't match cache",  v95,  0x20u);
    }

- (BOOL)_clearCachedLegacyTransactionsWithLogKey:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 1;
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  id v5 = (os_log_s *)(id)qword_10032DF18;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 requestBundleID]);
    *(_DWORD *)buf = 138543874;
    id v20 = self;
    __int16 v21 = 2114;
    id v22 = v4;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@] Clearing cached legacy transactions for %{public}@",  buf,  0x20u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000152E8;
  v14[3] = &unk_1002E73D8;
  v14[4] = self;
  v14[5] = &v15;
  [v8 modifyUsingTransaction:v14];

  if (*((_BYTE *)v16 + 24))
  {
    BOOL v9 = 1;
  }

  else
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    unsigned __int8 v10 = (os_log_s *)(id)qword_10032DF18;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 requestBundleID]);
      *(_DWORD *)buf = 138543874;
      id v20 = self;
      __int16 v21 = 2114;
      id v22 = v4;
      __int16 v23 = 2114;
      uint64_t v24 = v13;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%{public}@][%{public}@] Failed to clear cached transactions for %{public}@",  buf,  0x20u);
    }

    BOOL v9 = *((_BYTE *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (BOOL)_includeFinishedConsumables
{
  if (sub_10006B548())
  {
    id v3 = (void *)CFPreferencesCopyAppValue( @"SKIncludeConsumableInAppPurchaseHistory",  +[AppDefaultsManager kSKUserDefaultsIdentifier]( &OBJC_CLASS___AppDefaultsManager,  "kSKUserDefaultsIdentifier"));
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSArray);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 callerBundleID]);
      unsigned __int8 v7 = [v3 containsObject:v6];

      if ((v7 & 1) != 0) {
        return 1;
      }
    }

    else
    {
    }
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 callerBundleID]);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestBundleID]);
  if ([v10 isEqualToString:v12])
  {

LABEL_9:
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 callerBundleURL]);
    char v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v17));

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 infoDictionary]);
    LOBYTE(v17) = objc_msgSend( v19,  "tcr_BOOLForKey:",  @"SKIncludeConsumableInAppPurchaseHistory");

    return (char)v17;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 callerBundleID]);
  unsigned __int8 v15 = [v14 hasSuffix:@".watchkitapp"];

  if ((v15 & 1) != 0) {
    goto LABEL_9;
  }
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  char v26 = 0;
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000155E4;
  v22[3] = &unk_1002E7158;
  v22[4] = self;
  v22[5] = &v23;
  [v20 readUsingSession:v22];

  int v21 = *((unsigned __int8 *)v24 + 24);
  _Block_object_dispose(&v23, 8);
  return v21 != 0;
}

- (void)_manualSyncWithLogKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  v21[3] = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3032000000LL;
  v19[3] = sub_10000EBE0;
  v19[4] = sub_10000EBF0;
  id v20 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x3032000000LL;
  v17[3] = sub_10000EBE0;
  void v17[4] = sub_10000EBF0;
  id v18 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100015850;
  v16[3] = &unk_1002E73B0;
  v16[4] = self;
  v16[5] = v19;
  v16[6] = v21;
  v16[7] = v17;
  [v8 readUsingSession:v16];

  -[ReceiptManager clearTransactions](self, "clearTransactions");
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncLock](self, "syncLock"));
  [v9 lock];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001592C;
  v11[3] = &unk_1002E7428;
  v11[4] = self;
  id v13 = v21;
  id v14 = v19;
  unsigned __int8 v15 = v17;
  id v10 = v7;
  id v12 = v10;
  -[ReceiptManager _syncTransactionsAndSubscriptionStatusWithReason:logKey:completionHandler:]( self,  "_syncTransactionsAndSubscriptionStatusWithReason:logKey:completionHandler:",  4LL,  v6,  v11);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

  _Block_object_dispose(v21, 8);
}

- (id)_configureMetricsEventWithBeforeTransactionCount:(unint64_t)a3 beforeTransactions:(id)a4 beforeStatuses:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  uint64_t v30 = 0LL;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_10000EBE0;
  uint64_t v25 = sub_10000EBF0;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_10000EBE0;
  id v19 = sub_10000EBF0;
  id v20 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100015C14;
  v14[3] = &unk_1002E73B0;
  v14[4] = self;
  v14[5] = &v21;
  void v14[6] = &v27;
  v14[7] = &v15;
  [v10 readUsingSession:v14];

  [(id)v22[5] minusSet:v8];
  [(id)v16[5] minusSet:v9];
  int v11 = objc_opt_new(&OBJC_CLASS____TtC9storekitd22ManualSyncSuccessEvent);
  -[ManualSyncSuccessEvent setTransactionsCountDifference:](v11, "setTransactionsCountDifference:", v28[3] - a3);
  -[ManualSyncSuccessEvent setModifiedOrAddedTransactionsCount:]( v11,  "setModifiedOrAddedTransactionsCount:",  [(id)v22[5] count]);
  -[ManualSyncSuccessEvent setModifiedOrAddedStatusesCount:]( v11,  "setModifiedOrAddedStatusesCount:",  [(id)v16[5] count]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  -[BaseManualSyncEvent configureWithClient:](v11, "configureWithClient:", v12);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return v11;
}

- (BOOL)_resetLastUpdatedForLegacyTransactionsWithLogKey:(id)a3
{
  id v4 = a3;
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  id v5 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 requestBundleID]);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v4;
    *(_WORD *)&buf[22] = 2114;
    uint64_t v23 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@] Invalidating pending transactions cache for %{public}@",  buf,  0x20u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000LL;
  LOBYTE(v23) = 1;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100015FAC;
  v15[3] = &unk_1002E73D8;
  void v15[4] = self;
  void v15[5] = buf;
  [v9 modifyUsingTransaction:v15];

  if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
  {
    BOOL v10 = 1;
  }

  else
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    int v11 = (os_log_s *)(id)qword_10032DF18;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestBundleID]);
      *(_DWORD *)uint64_t v16 = 138543874;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      id v19 = v4;
      __int16 v20 = 2114;
      uint64_t v21 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "[%{public}@][%{public}@] Failed to invalidate cached transactions for %{public}@",  v16,  0x20u);
    }

    BOOL v10 = *(_BYTE *)(*(void *)&buf[8] + 24LL) != 0;
  }

  _Block_object_dispose(buf, 8);

  return v10;
}

- (BOOL)_setTransactionInfo:(id)a3 unfinishedIDs:(id)a4 includesFinishedConsumables:(BOOL)a5 forRevision:(id)a6 logKey:(id)a7 containsSubscriptions:(BOOL *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  uint64_t v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000LL;
  char v37 = 1;
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1000161B0;
  v25[3] = &unk_1002E7450;
  v31 = &v34;
  id v19 = v14;
  id v26 = v19;
  id v20 = v15;
  id v27 = v20;
  uint64_t v28 = self;
  id v21 = v17;
  id v29 = v21;
  uint64_t v32 = a8;
  id v22 = v16;
  id v30 = v22;
  BOOL v33 = a5;
  [v18 modifyUsingTransaction:v25];

  char v23 = *((_BYTE *)v35 + 24);
  _Block_object_dispose(&v34, 8);

  return v23;
}

- (void)_setUnfinishedForTransactionIDs:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100016664;
  v11[3] = &unk_1002E71A8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 modifyUsingTransaction:v11];
}

- (void)_checkTransactionAgeOnReadQueueForStatusWithGroupID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager readQueue](self, "readQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10001679C;
  v11[3] = &unk_1002E74A0;
  void v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 addOperationWithBlock:v11];
}

- (BOOL)_needsSubscriptionStatusSyncForStatusDictionary:(id)a3 logKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"lastUpdated"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bag]);

  int v11 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey subscriptionStatusMaxAge](&OBJC_CLASS____TtC9storekitd6BagKey, "subscriptionStatusMaxAge"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 integerForKey:v11]);

  id v23 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 valueWithError:&v23]);
  id v14 = v23;
  if (v14)
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    id v15 = (void *)qword_10032DF18;
    if (!os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    id v16 = v15;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"subscriptionGroupIdentifier"]);
    *(_DWORD *)buf = 138543874;
    id v25 = v7;
    __int16 v26 = 2114;
    id v27 = v17;
    __int16 v28 = 2114;
    id v29 = v14;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "[%{public}@] Error getting max age for %{public}@ subscription status: %{public}@",  buf,  0x20u);

LABEL_12:
LABEL_13:
    BOOL v21 = 0;
    goto LABEL_14;
  }

  [v13 doubleValue];
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:"));
  if ([v8 compare:v16] != (id)1) {
    goto LABEL_12;
  }
  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  __int16 v18 = (void *)qword_10032DF18;
  if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v18;
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"subscriptionGroupIdentifier"]);
    *(_DWORD *)buf = 138543618;
    id v25 = v7;
    __int16 v26 = 2114;
    id v27 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Forcing subscription status sync for %{public}@ because lastUpdated is older than maxAge",  buf,  0x16u);
  }

  BOOL v21 = 1;
LABEL_14:

  return v21;
}

- (void)_syncSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (a3 != 2) {
    goto LABEL_5;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
  unsigned int v11 = objc_msgSend(v10, "objc_clientType");

  if (v11 == 3) {
    goto LABEL_5;
  }
  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  int64_t v38 = (int64_t)sub_10000EBE0;
  uint64_t v39 = sub_10000EBF0;
  id v40 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472LL;
  v32[2] = sub_100017090;
  v32[3] = &unk_1002E7158;
  v32[4] = self;
  void v32[5] = buf;
  [v12 readUsingSession:v32];

  if (*(void *)(*(void *)&buf[8] + 40LL))
  {
    _Block_object_dispose(buf, 8);

LABEL_5:
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    id v13 = (void *)qword_10032DF18;
    if (os_log_type_enabled((os_log_t)qword_10032DF18, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 requestBundleID]);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v16;
      *(_WORD *)&buf[22] = 2048;
      int64_t v38 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Starting subscription status sync for %{public}@ reason %ld",  buf,  0x20u);
    }

    id v17 = objc_alloc(&OBJC_CLASS___LoadSubscriptionStatusTask);
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v19 = -[LoadSubscriptionStatusTask initWithSubscriptionGroupID:reason:client:]( v17,  "initWithSubscriptionGroupID:reason:client:",  0LL,  a3,  v18);

    -[LoadSubscriptionStatusTask setLogKey:](v19, "setLogKey:", v8);
    objc_initWeak((id *)buf, v19);
    uint64_t v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    __int16 v26 = sub_100017118;
    id v27 = &unk_1002E7338;
    objc_copyWeak(&v31, (id *)buf);
    __int16 v28 = self;
    id v29 = v8;
    id v30 = v9;
    -[LoadSubscriptionStatusTask setCompletionBlock:](v19, "setCompletionBlock:", &v24);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncQueue](self, "syncQueue", v24, v25, v26, v27, v28));
    [v20 addOperation:v19];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)buf);

    goto LABEL_10;
  }

  if (qword_10032DF38 != -1) {
    dispatch_once(&qword_10032DF38, &stru_1002E7588);
  }
  BOOL v21 = (os_log_s *)(id)qword_10032DF18;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 requestBundleID]);
    *(_DWORD *)BOOL v33 = 138543618;
    id v34 = v8;
    __int16 v35 = 2114;
    uint64_t v36 = v23;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Ignoring subscription status sync from push notification for %{public}@ since the app has not queried status",  v33,  0x16u);
  }

  (*((void (**)(id, void))v9 + 2))(v9, 0LL);
  _Block_object_dispose(buf, 8);

LABEL_10:
}

- (void)_syncTransactionsAndSubscriptionStatusWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100017854;
  v10[3] = &unk_1002E7518;
  id v11 = a4;
  id v12 = self;
  id v13 = a5;
  int64_t v14 = a3;
  id v8 = v13;
  id v9 = v11;
  -[ReceiptManager _syncTransactionsWithReason:logKey:completionHandler:]( self,  "_syncTransactionsWithReason:logKey:completionHandler:",  a3,  v9,  v10);
}

- (void)_syncTransactionsWithReason:(int64_t)a3 logKey:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v36 = 0LL;
  char v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  uint64_t v39 = sub_10000EBE0;
  id v40 = sub_10000EBF0;
  id v41 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager databaseStore](self, "databaseStore"));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_100017EE0;
  v35[3] = &unk_1002E7158;
  v35[4] = self;
  v35[5] = &v36;
  [v10 readUsingSession:v35];

  if (a3 != 2
    || v37[5]
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client")),
        BOOL v12 = objc_msgSend(v11, "objc_clientType") == 3,
        v11,
        v12))
  {
    BOOL v13 = -[ReceiptManager _includeFinishedConsumables](self, "_includeFinishedConsumables");
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    int64_t v14 = (os_log_s *)(id)qword_10032DF18;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = v37[5];
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 requestBundleID]);
      *(_DWORD *)buf = 138544130;
      id v43 = v8;
      __int16 v44 = 2048;
      int64_t v45 = a3;
      __int16 v46 = 2114;
      uint64_t v47 = v15;
      __int16 v48 = 2114;
      v49 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Starting receipt sync with reason %ld from revision %{public}@ for %{public}@",  buf,  0x2Au);
    }

    __int16 v18 = objc_alloc(&OBJC_CLASS___LoadInAppReceiptsTask);
    uint64_t v19 = v37[5];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
    BOOL v21 = -[LoadInAppReceiptsTask initWithLocalRevision:reason:includeFinishedConsumables:client:]( v18,  "initWithLocalRevision:reason:includeFinishedConsumables:client:",  v19,  a3,  v13,  v20);

    -[LoadInAppReceiptsTask setLogKey:](v21, "setLogKey:", v8);
    objc_initWeak((id *)buf, v21);
    __int16 v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    __int16 v28 = sub_100017F68;
    id v29 = &unk_1002E7568;
    objc_copyWeak(v33, (id *)buf);
    id v30 = self;
    BOOL v34 = v13;
    id v31 = v8;
    v33[1] = (id)a3;
    id v32 = v9;
    -[LoadInAppReceiptsTask setCompletionBlock:](v21, "setCompletionBlock:", &v26);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager syncQueue](self, "syncQueue", v26, v27, v28, v29, v30));
    [v22 addOperation:v21];

    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (qword_10032DF38 != -1) {
      dispatch_once(&qword_10032DF38, &stru_1002E7588);
    }
    id v23 = (os_log_s *)(id)qword_10032DF18;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[ReceiptManager client](self, "client"));
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 requestBundleID]);
      *(_DWORD *)buf = 138543618;
      id v43 = v8;
      __int16 v44 = 2114;
      int64_t v45 = (int64_t)v25;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Ignoring transaction sync from push notification for %{public}@ since the app has not queried history",  buf,  0x16u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0LL, 0LL);
  }

  _Block_object_dispose(&v36, 8);
}

- (_TtC9storekitd6Client)client
{
  return self->_client;
}

- (NSOperationQueue)readQueue
{
  return self->_readQueue;
}

- (NSLock)syncLock
{
  return self->_syncLock;
}

- (NSOperationQueue)syncQueue
{
  return self->_syncQueue;
}

- (void).cxx_destruct
{
}

@end