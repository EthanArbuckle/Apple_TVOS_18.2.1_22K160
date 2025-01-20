@interface CKKSZoneChangeFetcher
- (BOOL)halted;
- (BOOL)newRequests;
- (BOOL)sendMetric;
- (CKContainer)container;
- (CKKSFetchAllRecordZoneChangesOperation)currentFetch;
- (CKKSNearFutureScheduler)fetchScheduler;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSResultOperation)currentProcessResult;
- (CKKSResultOperation)holdOperation;
- (CKKSZoneChangeFetchDependencyOperation)inflightFetchDependency;
- (CKKSZoneChangeFetchDependencyOperation)successfulFetchDependency;
- (CKKSZoneChangeFetcher)initWithContainer:(id)a3 fetchClass:(Class)a4 reachabilityTracker:(id)a5 altDSID:(id)a6 sendMetric:(BOOL)a7;
- (Class)fetchRecordZoneChangesOperationClass;
- (NSError)lastCKFetchError;
- (NSMapTable)clientMap;
- (NSMutableSet)apnsPushes;
- (NSMutableSet)currentFetchReasons;
- (NSMutableSet)inflightFetchDependencies;
- (NSOperationQueue)operationQueue;
- (NSString)altDSID;
- (NSString)description;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (id)createSuccessfulFetchDependency;
- (id)inflightFetch;
- (id)requestFetchDueToAPNS:(id)a3;
- (id)requestSuccessfulFetch:(id)a3;
- (id)requestSuccessfulFetchForManyReasons:(id)a3;
- (id)strongClientMap;
- (void)_onqueueCreateNewFetch;
- (void)cancel;
- (void)halt;
- (void)holdFetchesUntil:(id)a3;
- (void)maybeCreateNewFetch;
- (void)maybeCreateNewFetchOnQueue;
- (void)notifyZoneChange:(id)a3;
- (void)registerClient:(id)a3 zoneID:(id)a4;
- (void)setAltDSID:(id)a3;
- (void)setApnsPushes:(id)a3;
- (void)setClientMap:(id)a3;
- (void)setCurrentFetch:(id)a3;
- (void)setCurrentFetchReasons:(id)a3;
- (void)setCurrentProcessResult:(id)a3;
- (void)setFetchScheduler:(id)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHoldOperation:(id)a3;
- (void)setInflightFetchDependencies:(id)a3;
- (void)setInflightFetchDependency:(id)a3;
- (void)setLastCKFetchError:(id)a3;
- (void)setName:(id)a3;
- (void)setNewRequests:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setSendMetric:(BOOL)a3;
- (void)setSuccessfulFetchDependency:(id)a3;
@end

@implementation CKKSZoneChangeFetcher

- (CKKSZoneChangeFetcher)initWithContainer:(id)a3 fetchClass:(Class)a4 reachabilityTracker:(id)a5 altDSID:(id)a6 sendMetric:(BOOL)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  v48.receiver = self;
  v48.super_class = (Class)&OBJC_CLASS___CKKSZoneChangeFetcher;
  v16 = -[CKKSZoneChangeFetcher init](&v48, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_container, a3);
    objc_storeStrong((id *)&v17->_fetchRecordZoneChangesOperationClass, a4);
    objc_storeStrong((id *)&v17->_reachabilityTracker, a5);
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    currentFetchReasons = v17->_currentFetchReasons;
    v17->_currentFetchReasons = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    apnsPushes = v17->_apnsPushes;
    v17->_apnsPushes = v20;

    uint64_t v22 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](&OBJC_CLASS___NSMapTable, "strongToWeakObjectsMapTable"));
    clientMap = v17->_clientMap;
    v17->_clientMap = (NSMapTable *)v22;

    name = v17->_name;
    v17->_name = (NSString *)@"zone-change-fetcher";

    v25 = -[NSString UTF8String](v17->_name, "UTF8String");
    dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
    dispatch_queue_t v28 = dispatch_queue_create(v25, v27);
    queue = v17->_queue;
    v17->_queue = (OS_dispatch_queue *)v28;

    v30 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v17->_operationQueue;
    v17->_operationQueue = v30;

    uint64_t v32 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher createSuccessfulFetchDependency](v17, "createSuccessfulFetchDependency"));
    successfulFetchDependency = v17->_successfulFetchDependency;
    v17->_successfulFetchDependency = (CKKSZoneChangeFetchDependencyOperation *)v32;

    uint64_t v34 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    inflightFetchDependencies = v17->_inflightFetchDependencies;
    v17->_inflightFetchDependencies = (NSMutableSet *)v34;

    inflightFetchDependency = v17->_inflightFetchDependency;
    v17->_inflightFetchDependency = 0LL;

    v17->_newRequests = 0;
    objc_storeStrong((id *)&v17->_altDSID, a6);
    v17->_sendMetric = a7;
    if (qword_1002DE960 != -1) {
      dispatch_once(&qword_1002DE960, &stru_1002849E8);
    }
    int v37 = byte_1002DE968;
    int v38 = byte_1002DE968;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v17);
    v39 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    if (v38) {
      uint64_t v40 = 6000000000LL;
    }
    else {
      uint64_t v40 = 120000000000LL;
    }
    if (v37) {
      uint64_t v41 = 100000000LL;
    }
    else {
      uint64_t v41 = 2000000000LL;
    }
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_10017E59C;
    v45[3] = &unk_100291A38;
    objc_copyWeak(&v46, &location);
    v42 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v39,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"zone-change-fetch-scheduler",  v41,  v40,  0LL,  1000LL,  v45,  2.0);
    fetchScheduler = v17->_fetchScheduler;
    v17->_fetchScheduler = v42;

    objc_destroyWeak(&v46);
    objc_destroyWeak(&location);
  }

  return v17;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher fetchScheduler](self, "fetchScheduler"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 nextFireTime]);

  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSDateFormatter);
    -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", @"yyyy-MM-dd HH:mm:ss");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher name](self, "name"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v5, "stringFromDate:", v4));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSZoneChangeFetcher(%@): next fetch at %@",  v6,  v7));
  }

  else
  {
    v5 = (NSDateFormatter *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher name](self, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<CKKSZoneChangeFetcher(%@): no pending fetches",  v5));
  }

  return (NSString *)v8;
}

- (void)registerClient:(id)a3 zoneID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
  [v8 setObject:v9 forKey:v6];

  objc_sync_exit(v7);
}

- (id)strongClientMap
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
  objc_sync_enter(v4);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 keyEnumerator]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher clientMap](self, "clientMap"));
        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:v10]);

        if (v12) {
          [v3 setObject:v12 forKeyedSubscript:v10];
        }

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  objc_sync_exit(v4);
  return v3;
}

- (id)requestSuccessfulFetch:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSZoneChangeFetcher requestSuccessfulFetchForManyReasons:]( self,  "requestSuccessfulFetchForManyReasons:",  v4));

  return v5;
}

- (void)notifyZoneChange:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000AA6AC(@"ckkspush", 0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "received a zone change notification for %@ %@",  (uint8_t *)&v8,  0x16u);
  }

  id v7 = -[CKKSZoneChangeFetcher requestFetchDueToAPNS:](self, "requestFetchDueToAPNS:", v4);
}

- (id)requestFetchDueToAPNS:(id)a3
{
  id v4 = a3;
  uint64_t v27 = 0LL;
  dispatch_queue_t v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 1;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher strongClientMap](self, "strongClientMap"));
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 allKeys]);
  id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
        if ([v11 zoneIsReadyForFetching:v10])
        {
          *((_BYTE *)v28 + 24) = 0;

          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)requestSuccessfulFetchForManyReasons:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  __int128 v15 = sub_10017E1E8;
  __int128 v16 = sub_10017E1F8;
  id v17 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017E26C;
  block[3] = &unk_1002912B8;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (id)inflightFetch
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10017E1E8;
  id v11 = sub_10017E1F8;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10017E200;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)maybeCreateNewFetchOnQueue
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[CKKSZoneChangeFetcher halted](self, "halted"))
  {
    id v4 = sub_1000AA6AC(@"ckksfetcher", 0LL);
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Halted; not starting a new fetch", buf, 2u);
    }

    return;
  }

  if (!-[CKKSZoneChangeFetcher newRequests](self, "newRequests")) {
    return;
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  if (v10)
  {
    v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
    if ((-[dispatch_queue_s isFinished](v3, "isFinished") & 1) == 0)
    {

      return;
    }
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  if (!v6)
  {
    if (v10)
    {
    }

    goto LABEL_16;
  }

  uint64_t v7 = (void *)v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  unsigned __int8 v9 = [v8 isFinished];

  if (v10)
  {
  }

  if ((v9 & 1) != 0) {
LABEL_16:
  }
    -[CKKSZoneChangeFetcher _onqueueCreateNewFetch](self, "_onqueueCreateNewFetch");
}

- (void)maybeCreateNewFetch
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017E1E0;
  block[3] = &unk_1002927F0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueueCreateNewFetch
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher successfulFetchDependency](self, "successfulFetchDependency"));
  -[CKKSZoneChangeFetcher setInflightFetchDependency:](self, "setInflightFetchDependency:", v41);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher inflightFetchDependencies](self, "inflightFetchDependencies"));
  [v4 addObject:v41];

  -[CKKSZoneChangeFetcher setNewRequests:](self, "setNewRequests:", 0LL);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher createSuccessfulFetchDependency](self, "createSuccessfulFetchDependency"));
  -[CKKSZoneChangeFetcher setSuccessfulFetchDependency:](self, "setSuccessfulFetchDependency:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetchReasons](self, "currentFetchReasons"));
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[CKKSZoneChangeFetcher setCurrentFetchReasons:](self, "setCurrentFetchReasons:", v7);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"description",  1LL));
  v50 = v8;
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v50, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 sortedArrayUsingDescriptors:v9]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 componentsJoinedByString:@","]);

  id v12 = sub_1000AA6AC(@"ckksfetcher", 0LL);
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting a new fetch, reasons: %@", buf, 0xCu);
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher apnsPushes](self, "apnsPushes"));
  __int128 v15 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  -[CKKSZoneChangeFetcher setApnsPushes:](self, "setApnsPushes:", v15);

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(+[CKOperationGroup CKKSGroupWithName:](&OBJC_CLASS___CKOperationGroup, "CKKSGroupWithName:", v11));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher strongClientMap](self, "strongClientMap"));
  if (![v17 count])
  {
    id v18 = sub_1000AA6AC(@"ckksfetcher", 0LL);
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "No clients", buf, 2u);
    }
  }

  id v20 = objc_alloc(&OBJC_CLASS___CKKSFetchAllRecordZoneChangesOperation);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher container](self, "container"));
  uint64_t v22 = -[CKKSZoneChangeFetcher fetchRecordZoneChangesOperationClass](self, "fetchRecordZoneChangesOperationClass");
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher altDSID](self, "altDSID"));
  LOBYTE(v40) = -[CKKSZoneChangeFetcher sendMetric](self, "sendMetric");
  __int128 v24 = -[CKKSFetchAllRecordZoneChangesOperation initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:]( v20,  "initWithContainer:fetchClass:clientMap:fetchReasons:apnsPushes:forceResync:ckoperationGroup:altDSID:sendMetric:",  v21,  v22,  v17,  v6,  v14,  0LL,  v16,  v23,  v40);

  if ([v6 containsObject:@"network"])
  {
    id v25 = sub_1000AA6AC(@"ckksfetcher", 0LL);
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "blocking fetch on network reachability",  buf,  2u);
    }

    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher reachabilityTracker](self, "reachabilityTracker"));
    dispatch_queue_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 reachabilityDependency]);
    -[CKKSFetchAllRecordZoneChangesOperation addNullableDependency:](v24, "addNullableDependency:", v28);
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher holdOperation](self, "holdOperation"));
  -[CKKSFetchAllRecordZoneChangesOperation addNullableDependency:](v24, "addNullableDependency:", v29);

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10017DB10;
  v42[3] = &unk_100291308;
  objc_copyWeak(&v46, &location);
  char v30 = v24;
  v43 = v30;
  id v31 = v6;
  id v44 = v31;
  id v32 = v14;
  id v45 = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation operationWithBlock:]( &OBJC_CLASS___CKKSResultOperation,  "operationWithBlock:",  v42));
  -[CKKSZoneChangeFetcher setCurrentProcessResult:](self, "setCurrentProcessResult:", v33);

  uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  [v34 setName:@"zone-change-fetcher-worker"];

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  [v35 addDependency:v30];

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher operationQueue](self, "operationQueue"));
  int v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  [v36 addOperation:v37];

  -[CKKSZoneChangeFetcher setCurrentFetch:](self, "setCurrentFetch:", v30);
  int v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher operationQueue](self, "operationQueue"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  [v38 addOperation:v39];

  objc_destroyWeak(&v46);
  objc_destroyWeak(&location);
}

- (id)createSuccessfulFetchDependency
{
  v3 = objc_alloc_init(&OBJC_CLASS___CKKSZoneChangeFetchDependencyOperation);
  -[CKKSZoneChangeFetchDependencyOperation setName:](v3, "setName:", @"successful-fetch-dependency");
  -[CKKSResultOperation setDescriptionErrorCode:](v3, "setDescriptionErrorCode:", 2LL);
  -[CKKSZoneChangeFetchDependencyOperation setOwner:](v3, "setOwner:", self);
  return v3;
}

- (void)holdFetchesUntil:(id)a3
{
}

- (void)cancel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher fetchScheduler](self, "fetchScheduler"));
  [v2 cancel];
}

- (void)halt
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher fetchScheduler](self, "fetchScheduler"));
  [v3 cancel];

  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017DB04;
  block[3] = &unk_1002927F0;
  void block[4] = self;
  dispatch_sync(v4, block);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  [v5 cancel];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher holdOperation](self, "holdOperation"));
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher holdOperation](self, "holdOperation"));
    [v7 removeDependency:v8];
  }

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentFetch](self, "currentFetch"));
  [v9 waitUntilFinished];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSZoneChangeFetcher currentProcessResult](self, "currentProcessResult"));
  [v10 waitUntilFinished];
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 16LL, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 24LL, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (NSError)lastCKFetchError
{
  return (NSError *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setLastCKFetchError:(id)a3
{
}

- (BOOL)sendMetric
{
  return self->_sendMetric;
}

- (void)setSendMetric:(BOOL)a3
{
  self->_sendMetric = a3;
}

- (CKKSNearFutureScheduler)fetchScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setFetchScheduler:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setName:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (NSMapTable)clientMap
{
  return (NSMapTable *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setClientMap:(id)a3
{
}

- (CKKSFetchAllRecordZoneChangesOperation)currentFetch
{
  return (CKKSFetchAllRecordZoneChangesOperation *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCurrentFetch:(id)a3
{
}

- (CKKSResultOperation)currentProcessResult
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCurrentProcessResult:(id)a3
{
}

- (NSMutableSet)currentFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setCurrentFetchReasons:(id)a3
{
}

- (NSMutableSet)apnsPushes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setApnsPushes:(id)a3
{
}

- (BOOL)newRequests
{
  return self->_newRequests;
}

- (void)setNewRequests:(BOOL)a3
{
  self->_newRequests = a3;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (CKKSZoneChangeFetchDependencyOperation)successfulFetchDependency
{
  return (CKKSZoneChangeFetchDependencyOperation *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setSuccessfulFetchDependency:(id)a3
{
}

- (NSMutableSet)inflightFetchDependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setInflightFetchDependencies:(id)a3
{
}

- (CKKSZoneChangeFetchDependencyOperation)inflightFetchDependency
{
  return (CKKSZoneChangeFetchDependencyOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setInflightFetchDependency:(id)a3
{
}

- (CKKSResultOperation)holdOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setHoldOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end