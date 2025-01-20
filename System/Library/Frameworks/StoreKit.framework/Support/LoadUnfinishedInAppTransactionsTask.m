@interface LoadUnfinishedInAppTransactionsTask
+ (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3 bundleID:(id)a4 logKey:(id)a5;
+ (BOOL)invalidateCacheForBundleID:(id)a3 withLogKey:(id)a4;
+ (id)_newDataStore;
- (BOOL)_cacheLegacyTransactions:(id)a3 inDataStore:(id)a4;
- (BOOL)_ignoreHasEverHadIAPsWithBag:(id)a3;
- (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3;
- (BOOL)_shouldCheckServerQueueWithDataStore:(id)a3 bag:(id)a4;
- (BOOL)forceServerCheck;
- (LoadUnfinishedInAppTransactionsTask)initWithClient:(id)a3;
- (NSArray)transactions;
- (NSString)logKey;
- (NSURL)receiptInstallURL;
- (_TtC9storekitd6Client)client;
- (id)_cachedLegacyTransactionsFromDataStore:(id)a3 error:(id *)a4;
- (id)_checkServerQueueAndCacheTransactionsWithDataStore:(id)a3 bag:(id)a4 error:(id *)a5;
- (id)_pendingTransactionsResponseWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6;
- (id)_transactionsFromQueueCheckWithBag:(id)a3 error:(id *)a4;
- (int64_t)_pendingTransactionsCountWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6;
- (void)_fromDataStore:(id)a3 getCachedAccountToken:(id *)a4 lastUpdated:(id *)a5;
- (void)main;
- (void)setForceServerCheck:(BOOL)a3;
- (void)setLogKey:(id)a3;
- (void)setReceiptInstallURL:(id)a3;
@end

@implementation LoadUnfinishedInAppTransactionsTask

- (LoadUnfinishedInAppTransactionsTask)initWithClient:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___LoadUnfinishedInAppTransactionsTask;
  v6 = -[Task init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)(v6 + 50), a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    v9 = *(void **)(v7 + 58);
    *(void *)(v7 + 58) = v8;

    v7[42] = 0;
  }

  return (LoadUnfinishedInAppTransactionsTask *)v7;
}

- (void)main
{
  id v3 = +[LoadUnfinishedInAppTransactionsTask _newDataStore]( &OBJC_CLASS___LoadUnfinishedInAppTransactionsTask,  "_newDataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bag]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentAccountToken]);
  if (v7)
  {
  }

  else
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
    unsigned int v9 = objc_msgSend(v8, "objc_clientType");

    if (v9 != 3)
    {
      if (qword_10032E730 != -1) {
        dispatch_once(&qword_10032E730, &stru_1002E8F68);
      }
      v24 = (void *)qword_10032E710;
      if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT))
      {
        v25 = v24;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
        *(_DWORD *)buf = 138543618;
        v38 = self;
        __int16 v39 = 2114;
        v40 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Ignoring pending transaction queue check because there is no account",  buf,  0x16u);
      }

      v27 = *(_TtC9storekitd6Client **)((char *)&self->_client + 2);
      *(_TtC9storekitd6Client **)((char *)&self->_client + 2) = (_TtC9storekitd6Client *)&__NSArray0__struct;

      goto LABEL_38;
    }
  }

  if (-[LoadUnfinishedInAppTransactionsTask _shouldCheckServerQueueWithDataStore:bag:]( self,  "_shouldCheckServerQueueWithDataStore:bag:",  v3,  v5))
  {
    id v36 = 0LL;
    v10 = (_TtC9storekitd6Client *)objc_claimAutoreleasedReturnValue( -[LoadUnfinishedInAppTransactionsTask _checkServerQueueAndCacheTransactionsWithDataStore:bag:error:]( self,  "_checkServerQueueAndCacheTransactionsWithDataStore:bag:error:",  v3,  v5,  &v36));
    id v11 = v36;
    v12 = *(_TtC9storekitd6Client **)((char *)&self->_client + 2);
    *(_TtC9storekitd6Client **)((char *)&self->_client + 2) = v10;

    if (v11)
    {
      id v35 = 0LL;
      -[LoadUnfinishedInAppTransactionsTask _fromDataStore:getCachedAccountToken:lastUpdated:]( self,  "_fromDataStore:getCachedAccountToken:lastUpdated:",  v3,  &v35,  0LL);
      id v13 = v35;
      if (v13
        && (v14 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client")),
            v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentAccountToken]),
            unsigned int v16 = [v13 isEqualToString:v15],
            v15,
            v14,
            v16))
      {
        if (qword_10032E730 != -1) {
          dispatch_once(&qword_10032E730, &stru_1002E8F68);
        }
        if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
          sub_100260640();
        }
        id v34 = v11;
        v17 = (_TtC9storekitd6Client *)objc_claimAutoreleasedReturnValue( -[LoadUnfinishedInAppTransactionsTask _cachedLegacyTransactionsFromDataStore:error:]( self,  "_cachedLegacyTransactionsFromDataStore:error:",  v3,  &v34));
        id v18 = v34;

        v19 = *(_TtC9storekitd6Client **)((char *)&self->_client + 2);
        *(_TtC9storekitd6Client **)((char *)&self->_client + 2) = v17;

        id v11 = v18;
      }

      else
      {
        if (qword_10032E730 != -1) {
          dispatch_once(&qword_10032E730, &stru_1002E8F68);
        }
        if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
          sub_1002605BC();
        }
      }

      goto LABEL_28;
    }

+ (BOOL)invalidateCacheForBundleID:(id)a3 withLogKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _newDataStore];
  LOBYTE(a1) = [a1 _invalidateLegacyTransactionCacheInDataStore:v8 bundleID:v7 logKey:v6];

  return (char)a1;
}

+ (id)_newDataStore
{
  v2 = objc_alloc(&OBJC_CLASS___InAppReceiptDatabaseStore);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[Environment sharedInstance](&OBJC_CLASS___Environment, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 userDatabase]);
  id v5 = -[SQLiteDatabaseStore initWithDatabase:](v2, "initWithDatabase:", v4);

  return v5;
}

- (BOOL)_shouldCheckServerQueueWithDataStore:(id)a3 bag:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  unsigned int v9 = objc_msgSend(v8, "objc_clientType");

  if (v9 == 3)
  {
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    v10 = (void *)qword_10032E710;
    if (!os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543618;
    v43 = self;
    __int16 v44 = 2114;
    v45 = v12;
    id v13 = "[%{public}@][%{public}@]: Checking pending transaction queue for Xcode test environment";
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);

LABEL_12:
    BOOL v15 = 1;
    goto LABEL_42;
  }

  if (-[LoadUnfinishedInAppTransactionsTask forceServerCheck](self, "forceServerCheck"))
  {
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    v14 = (void *)qword_10032E710;
    if (!os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v11 = v14;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543618;
    v43 = self;
    __int16 v44 = 2114;
    v45 = v12;
    id v13 = "[%{public}@][%{public}@]: Forcing pending transaction queue check";
    goto LABEL_11;
  }

  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  if ([v16 hasEverHadIAPs])
  {
  }

  else
  {
    unsigned __int8 v17 = -[LoadUnfinishedInAppTransactionsTask _ignoreHasEverHadIAPsWithBag:]( self,  "_ignoreHasEverHadIAPsWithBag:",  v7);

    if ((v17 & 1) == 0)
    {
      BOOL v15 = 0;
      goto LABEL_42;
    }
  }

  id v40 = 0LL;
  id v41 = 0LL;
  -[LoadUnfinishedInAppTransactionsTask _fromDataStore:getCachedAccountToken:lastUpdated:]( self,  "_fromDataStore:getCachedAccountToken:lastUpdated:",  v6,  &v41,  &v40);
  id v18 = v41;
  id v19 = v40;
  if (v18
    && (v20 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client")),
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentAccountToken]),
        unsigned __int8 v22 = [v21 isEqualToString:v18],
        v21,
        v20,
        (v22 & 1) != 0))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[BagKey transactionReceiptsMaxAge]( &OBJC_CLASS____TtC9storekitd6BagKey,  "transactionReceiptsMaxAge"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v7 integerForKey:v23]);

    id v39 = 0LL;
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 valueWithError:&v39]);
    id v26 = v39;
    if (v26)
    {
      if (qword_10032E730 != -1) {
        dispatch_once(&qword_10032E730, &stru_1002E8F68);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
        sub_100260748();
      }
      BOOL v15 = 0;
    }

    else
    {
      v30 = v19;
      if (!v19) {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
      }
      objc_msgSend(v25, "doubleValue", v25);
      id v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "dateByAddingTimeInterval:"));
      if (!v19) {

      }
      id v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v33 = [v32 compare:v31];

      if (v33 == (id)1)
      {
        id v34 = sub_100047FB8();
        id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
          *(_DWORD *)buf = 138543618;
          v43 = self;
          __int16 v44 = 2114;
          v45 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Checking pending transaction queue because lastUpdated is older than maxAge",  buf,  0x16u);
        }

        BOOL v15 = 1;
      }

      else
      {

        BOOL v15 = 0;
      }

      v25 = v38;
    }
  }

  else
  {
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    v27 = (void *)qword_10032E710;
    if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT))
    {
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
      *(_DWORD *)buf = 138543618;
      v43 = self;
      __int16 v44 = 2114;
      v45 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Checking pending transaction queue because the tokens don't match",  buf,  0x16u);
    }

    BOOL v15 = 1;
  }

LABEL_42:
  return v15;
}

- (BOOL)_ignoreHasEverHadIAPsWithBag:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  unsigned __int8 v6 = [v5 hasEverHadIAPs];

  if ((v6 & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[BagKey ignoreIAPQueueCheckSuppression]( &OBJC_CLASS____TtC9storekitd6BagKey,  "ignoreIAPQueueCheckSuppression"));
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v4 BOOLForKey:v8]);

    id v18 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueWithError:&v18]);
    id v11 = v18;
    unsigned int v7 = [v10 BOOLValue];

    if (v11)
    {
      if (qword_10032E730 != -1) {
        dispatch_once(&qword_10032E730, &stru_1002E8F68);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
        sub_1002607CC();
      }
    }

    else
    {
      if (v7)
      {
        if (qword_10032E730 != -1) {
          dispatch_once(&qword_10032E730, &stru_1002E8F68);
        }
        v12 = (void *)qword_10032E710;
        if (!os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v13 = v12;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
        *(_DWORD *)buf = 138543618;
        v20 = self;
        __int16 v21 = 2114;
        unsigned __int8 v22 = v14;
        BOOL v15 = "[%{public}@][%{public}@]: Allowing pending transaction queue check for client with no history of IAPs";
      }

      else
      {
        if (qword_10032E730 != -1) {
          dispatch_once(&qword_10032E730, &stru_1002E8F68);
        }
        unsigned int v16 = (void *)qword_10032E710;
        if (!os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        id v13 = v16;
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
        *(_DWORD *)buf = 138543618;
        v20 = self;
        __int16 v21 = 2114;
        unsigned __int8 v22 = v14;
        BOOL v15 = "[%{public}@][%{public}@]: Ignoring pending transaction queue check for client with no history of IAPs";
      }

      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
    }

- (id)_checkServerQueueAndCacheTransactionsWithDataStore:(id)a3 bag:(id)a4 error:(id *)a5
{
  id v18 = 0LL;
  id v8 = a3;
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( -[LoadUnfinishedInAppTransactionsTask _transactionsFromQueueCheckWithBag:error:]( self,  "_transactionsFromQueueCheckWithBag:error:",  a4,  &v18));
  id v10 = v18;
  id v11 = v10;
  if (v10)
  {
    if (a5) {
      *a5 = v10;
    }
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
      sub_100260850();
    }
    -[LoadUnfinishedInAppTransactionsTask _invalidateLegacyTransactionCacheInDataStore:]( self,  "_invalidateLegacyTransactionCacheInDataStore:",  v8);

    id v12 = 0LL;
  }

  else
  {
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    id v13 = (void *)qword_10032E710;
    if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
      id v16 = [v9 count];
      *(_DWORD *)buf = 138543874;
      v20 = self;
      __int16 v21 = 2114;
      unsigned __int8 v22 = v15;
      __int16 v23 = 2048;
      id v24 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Found %lu pending transactions in the queue",  buf,  0x20u);
    }

    -[LoadUnfinishedInAppTransactionsTask _cacheLegacyTransactions:inDataStore:]( self,  "_cacheLegacyTransactions:inDataStore:",  v9,  v8);

    id v12 = v9;
  }

  return v12;
}

- (id)_transactionsFromQueueCheckWithBag:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_10032E730 != -1) {
    dispatch_once(&qword_10032E730, &stru_1002E8F68);
  }
  unsigned int v7 = (void *)qword_10032E710;
  if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543362;
    v51 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Starting server purchase queue check",  buf,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 urlRequestEncoder]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
  [v11 setLogUUID:v12];

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask receiptInstallURL](self, "receiptInstallURL"));
  v47 = self;
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v13 queryWith:1 customReceiptURL:v14]);
  id v16 = [v15 mutableCopy];

  unsigned __int8 v17 = self;
  id v49 = 0LL;
  int64_t v18 = -[LoadUnfinishedInAppTransactionsTask _pendingTransactionsCountWithParameters:requestEncoder:bag:error:]( self,  "_pendingTransactionsCountWithParameters:requestEncoder:bag:error:",  v16,  v11,  v6,  &v49);
  id v19 = v49;
  if (v19)
  {
    id v20 = v19;
    if (a4)
    {
      id v20 = v19;
      id v21 = 0LL;
      *a4 = v20;
    }

    else
    {
      id v21 = 0LL;
    }

    goto LABEL_37;
  }

  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](&OBJC_CLASS___NSMutableArray, "arrayWithCapacity:", v18));
  v45 = a4;
  unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v44 = v16;
  id v23 = [v16 mutableCopy];
  id v24 = 0LL;
  while (1)
  {
    if (![v22 count])
    {
      [v23 setObject:0 forKeyedSubscript:@"startId"];
      [v23 setObject:0 forKeyedSubscript:@"endId"];
      goto LABEL_14;
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v22 objectAtIndexedSubscript:0]);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v25, v26) & 1) == 0) {
      break;
    }
    [v23 addEntriesFromDictionary:v25];
    [v22 removeObjectAtIndex:0];

LABEL_14:
    id v48 = v24;
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[LoadUnfinishedInAppTransactionsTask _pendingTransactionsResponseWithParameters:requestEncoder:bag:error:]( v17,  "_pendingTransactionsResponseWithParameters:requestEncoder:bag:error:",  v23,  v11,  v6,  &v48));
    id v20 = v48;

    if (v27)
    {
      v28 = v11;
      id v29 = v6;
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](v17, "client"));
      uint64_t v31 = objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask receiptInstallURL](v17, "receiptInstallURL"));
      id v32 = v17;
      id v33 = (void *)v31;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](v32, "logKey"));
      id v35 = sub_100025EEC(v27, v30, v33, 1LL, v34, 0, 0);
      id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

      [v46 addObjectsFromArray:v36];
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "tcr_arrayForKey:", @"more"));
      if ([v37 count]) {
        [v22 addObjectsFromArray:v37];
      }

      id v6 = v29;
      id v11 = v28;
      unsigned __int8 v17 = v47;
    }

    id v24 = v20;
    if (![v22 count]) {
      goto LABEL_26;
    }
  }

  if (qword_10032E730 != -1) {
    dispatch_once(&qword_10032E730, &stru_1002E8F68);
  }
  if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
    sub_1002608D4();
  }

  id v20 = v24;
LABEL_26:

  id v16 = v44;
  if (v20)
  {
    if (v45)
    {
      id v20 = v20;
      id v21 = 0LL;
      id *v45 = v20;
    }

    else
    {
      id v21 = 0LL;
    }

    v38 = v46;
    goto LABEL_36;
  }

- (int64_t)_pendingTransactionsCountWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[BagKey pendingTransactionsCountURL]( &OBJC_CLASS____TtC9storekitd6BagKey,  "pendingTransactionsCountURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 URLForKey:v13]);

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 requestWithMethod:4 bagURL:v14 parameters:v12]);
  id v29 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 resultWithError:&v29]);
  id v17 = v29;
  if (v17)
  {
    int64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
      sub_1002609DC();
    }
    int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 urlSession]);

    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dataTaskPromiseWithRequest:v16]);
    id v28 = 0LL;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 resultWithError:&v28]);
    id v24 = v28;
    int64_t v18 = v24;
    if (v24)
    {
      if (a6) {
        *a6 = v24;
      }
      if (qword_10032E730 != -1) {
        dispatch_once(&qword_10032E730, &stru_1002E8F68);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
        sub_100260958();
      }
      int64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }

    else
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v23 object]);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"download-queue-item-count"]);
      int64_t v19 = (int64_t)[v26 integerValue];
    }
  }

  return v19;
}

- (id)_pendingTransactionsResponseWithParameters:(id)a3 requestEncoder:(id)a4 bag:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[BagKey pendingTransactionsURL](&OBJC_CLASS____TtC9storekitd6BagKey, "pendingTransactionsURL"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v10 URLForKey:v13]);

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v11 requestWithMethod:4 bagURL:v14 parameters:v12]);
  id v27 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 resultWithError:&v27]);
  id v17 = v27;
  if (v17)
  {
    int64_t v18 = v17;
    if (a6) {
      *a6 = v17;
    }
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
      sub_100260AE4();
    }
    int64_t v19 = 0LL;
  }

  else
  {
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 urlSession]);

    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 dataTaskPromiseWithRequest:v16]);
    id v26 = 0LL;
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 resultWithError:&v26]);
    id v24 = v26;
    int64_t v18 = v24;
    if (v24)
    {
      if (a6) {
        *a6 = v24;
      }
      if (qword_10032E730 != -1) {
        dispatch_once(&qword_10032E730, &stru_1002E8F68);
      }
      if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR)) {
        sub_100260A60();
      }
      int64_t v19 = 0LL;
    }

    else
    {
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v23 object]);
    }
  }

  return v19;
}

- (void)_fromDataStore:(id)a3 getCachedAccountToken:(id *)a4 lastUpdated:(id *)a5
{
  id v8 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  int64_t v19 = sub_10004954C;
  id v20 = sub_10004955C;
  id v21 = 0LL;
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_10004954C;
  v14 = sub_10004955C;
  id v15 = 0LL;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100049564;
  v9[3] = &unk_1002E8F20;
  v9[4] = self;
  v9[5] = &v16;
  v9[6] = &v10;
  [v8 readUsingSession:v9];
  if (a4) {
    *a4 = (id) v17[5];
  }
  if (a5) {
    *a5 = (id) v11[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
}

- (id)_cachedLegacyTransactionsFromDataStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_10032E730 != -1) {
    dispatch_once(&qword_10032E730, &stru_1002E8F68);
  }
  unsigned int v7 = (void *)qword_10032E710;
  if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Checking pending transactions cache",  buf,  0x16u);
  }

  *(void *)buf = 0LL;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000LL;
  id v29 = sub_10004954C;
  v30 = sub_10004955C;
  id v31 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  int64_t v19 = sub_10004954C;
  id v20 = sub_10004955C;
  id v21 = 0LL;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000498FC;
  v15[3] = &unk_1002E8F20;
  v15[4] = self;
  v15[5] = buf;
  v15[6] = &v16;
  [v6 readUsingSession:v15];
  if (a4) {
    *a4 = (id) v17[5];
  }
  if (qword_10032E730 != -1) {
    dispatch_once(&qword_10032E730, &stru_1002E8F68);
  }
  uint64_t v10 = (os_log_s *)(id)qword_10032E710;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
    id v12 = [*(id *)(*(void *)&buf[8] + 40) count];
    *(_DWORD *)unsigned __int8 v22 = 138543874;
    id v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 2048;
    id v27 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[%{public}@][%{public}@]: Found %lu cached pending transactions",  v22,  0x20u);
  }

  id v13 = *(id *)(*(void *)&buf[8] + 40LL);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(buf, 8);
  return v13;
}

- (BOOL)_cacheLegacyTransactions:(id)a3 inDataStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  int64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100049BE4;
  v15[3] = &unk_1002E8F48;
  id v17 = &v18;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  [v7 modifyUsingTransaction:v15];
  if (*((_BYTE *)v19 + 24))
  {
    BOOL v9 = 1;
  }

  else
  {
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    uint64_t v10 = (os_log_s *)(id)qword_10032E710;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 requestBundleID]);
      *(_DWORD *)buf = 138543874;
      id v23 = self;
      __int16 v24 = 2114;
      v25 = v12;
      __int16 v26 = 2114;
      id v27 = v14;
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "[%{public}@][%{public}@]: Failed to cache pending transactions for %{public}@",  buf,  0x20u);
    }

    BOOL v9 = *((_BYTE *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask client](self, "client"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 requestBundleID]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[LoadUnfinishedInAppTransactionsTask logKey](self, "logKey"));
  BOOL v8 = +[LoadUnfinishedInAppTransactionsTask _invalidateLegacyTransactionCacheInDataStore:bundleID:logKey:]( &OBJC_CLASS___LoadUnfinishedInAppTransactionsTask,  "_invalidateLegacyTransactionCacheInDataStore:bundleID:logKey:",  v4,  v6,  v7);

  return v8;
}

+ (BOOL)_invalidateLegacyTransactionCacheInDataStore:(id)a3 bundleID:(id)a4 logKey:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v18 = 0LL;
  int64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100049FC0;
  v15[3] = &unk_1002E73D8;
  id v17 = &v18;
  id v11 = v9;
  id v16 = v11;
  [v8 modifyUsingTransaction:v15];
  if (*((_BYTE *)v19 + 24))
  {
    BOOL v12 = 1;
  }

  else
  {
    if (qword_10032E730 != -1) {
      dispatch_once(&qword_10032E730, &stru_1002E8F68);
    }
    id v13 = (os_log_s *)qword_10032E710;
    if (os_log_type_enabled((os_log_t)qword_10032E710, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = a1;
      __int16 v24 = 2114;
      id v25 = v10;
      __int16 v26 = 2114;
      id v27 = v11;
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "[%{public}@][%{public}@]: Failed to mark pending transactions cache stale for %{public}@",  buf,  0x20u);
    }

    BOOL v12 = *((_BYTE *)v19 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (_TtC9storekitd6Client)client
{
  return *(_TtC9storekitd6Client **)((char *)&self->super.super._error + 2);
}

- (NSString)logKey
{
  return *(NSString **)(&self->super._finished + 1);
}

- (void)setLogKey:(id)a3
{
}

- (NSURL)receiptInstallURL
{
  return *(NSURL **)(&self->_forceServerCheck + 2);
}

- (void)setReceiptInstallURL:(id)a3
{
}

- (BOOL)forceServerCheck
{
  return *(&self->super.super._success + 2);
}

- (void)setForceServerCheck:(BOOL)a3
{
  *(&self->super.super._success + 2) = a3;
}

- (NSArray)transactions
{
  return *(NSArray **)((char *)&self->_client + 2);
}

- (void).cxx_destruct
{
}

@end