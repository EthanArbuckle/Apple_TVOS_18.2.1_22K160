@interface CKKSFetchAllRecordZoneChangesOperation
- (BOOL)forceResync;
- (BOOL)moreComing;
- (BOOL)resync;
- (BOOL)sendMetric;
- (CKContainer)container;
- (CKKSFetchAllRecordZoneChangesOperation)init;
- (CKKSFetchAllRecordZoneChangesOperation)initWithContainer:(id)a3 fetchClass:(Class)a4 clientMap:(id)a5 fetchReasons:(id)a6 apnsPushes:(id)a7 forceResync:(BOOL)a8 ckoperationGroup:(id)a9 altDSID:(id)a10 sendMetric:(BOOL)a11;
- (CKKSFetchRecordZoneChangesOperation)fetchRecordZoneChangesOperation;
- (CKKSResultOperation)fetchCompletedOperation;
- (CKOperationGroup)ckoperationGroup;
- (Class)fetchRecordZoneChangesOperationClass;
- (NSDictionary)clientMap;
- (NSMutableArray)fetchedZoneIDs;
- (NSMutableDictionary)allClientOptions;
- (NSMutableDictionary)changeTokens;
- (NSMutableDictionary)deletions;
- (NSMutableDictionary)modifications;
- (NSMutableSet)resyncingZones;
- (NSSet)apnsPushes;
- (NSSet)fetchReasons;
- (NSString)altDSID;
- (unint64_t)fetchedItems;
- (unint64_t)totalDeletions;
- (unint64_t)totalModifications;
- (void)cancel;
- (void)groupStart;
- (void)performFetch;
- (void)queryClientsForChangeTokens;
- (void)sendChangesToClient:(id)a3 moreComing:(BOOL)a4;
- (void)setAllClientOptions:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setApnsPushes:(id)a3;
- (void)setChangeTokens:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setClientMap:(id)a3;
- (void)setDeletions:(id)a3;
- (void)setFetchCompletedOperation:(id)a3;
- (void)setFetchReasons:(id)a3;
- (void)setFetchRecordZoneChangesOperation:(id)a3;
- (void)setFetchedItems:(unint64_t)a3;
- (void)setFetchedZoneIDs:(id)a3;
- (void)setForceResync:(BOOL)a3;
- (void)setModifications:(id)a3;
- (void)setMoreComing:(BOOL)a3;
- (void)setResync:(BOOL)a3;
- (void)setResyncingZones:(id)a3;
- (void)setSendMetric:(BOOL)a3;
- (void)setTotalDeletions:(unint64_t)a3;
- (void)setTotalModifications:(unint64_t)a3;
@end

@implementation CKKSFetchAllRecordZoneChangesOperation

- (CKKSFetchAllRecordZoneChangesOperation)init
{
  return 0LL;
}

- (CKKSFetchAllRecordZoneChangesOperation)initWithContainer:(id)a3 fetchClass:(Class)a4 clientMap:(id)a5 fetchReasons:(id)a6 apnsPushes:(id)a7 forceResync:(BOOL)a8 ckoperationGroup:(id)a9 altDSID:(id)a10 sendMetric:(BOOL)a11
{
  id v36 = a3;
  id v35 = a5;
  id v34 = a6;
  id v33 = a7;
  id v32 = a9;
  id v18 = a10;
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___CKKSFetchAllRecordZoneChangesOperation;
  v19 = -[CKKSGroupOperation init](&v37, "init");
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)(v19 + 142), a3);
    objc_storeStrong((id *)(v20 + 134), a4);
    objc_storeStrong((id *)(v20 + 214), a5);
    objc_storeStrong((id *)(v20 + 222), a9);
    v20[129] = a8;
    objc_storeStrong((id *)(v20 + 158), a6);
    objc_storeStrong((id *)(v20 + 166), a7);
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v22 = *(void **)(v20 + 174);
    *(void *)(v20 + 174) = v21;

    v23 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v24 = *(void **)(v20 + 182);
    *(void *)(v20 + 182) = v23;

    v25 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v26 = *(void **)(v20 + 190);
    *(void *)(v20 + 190) = v25;

    uint64_t v27 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v28 = *(void **)(v20 + 262);
    *(void *)(v20 + 262) = v27;

    *(void *)(v20 + 246) = 0LL;
    *(void *)(v20 + 254) = 0LL;
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"record-zone-changes-completed",  &stru_100284D70));
    v30 = *(void **)(v20 + 270);
    *(void *)(v20 + 270) = v29;

    v20[130] = 0;
    objc_storeStrong((id *)(v20 + 238), a10);
    v20[131] = a11;
    [v20 setQualityOfService:25];
  }

  return (CKKSFetchAllRecordZoneChangesOperation *)v20;
}

- (void)queryClientsForChangeTokens
{
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap"));
  id v4 = [v3 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v30;
    *(void *)&__int128 v5 = 138412546LL;
    __int128 v26 = v5;
    uint64_t v27 = *(void *)v30;
    do
    {
      v8 = 0LL;
      id v28 = v6;
      do
      {
        if (*(void *)v30 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap", v26));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);

        v12 = (void *)objc_claimAutoreleasedReturnValue([v11 participateInFetch:v9]);
        if ([v12 participateInFetch])
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
          [v13 addObject:v9];

          v14 = objc_alloc_init(&OBJC_CLASS___CKFetchRecordZoneChangesConfiguration);
          if (!-[CKKSFetchAllRecordZoneChangesOperation forceResync](self, "forceResync"))
          {
            v15 = v3;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
            v17 = (void *)objc_claimAutoreleasedReturnValue([v16 objectForKeyedSubscript:v9]);

            if (v17)
            {
              id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
              v19 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:v9]);
              -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:]( v14,  "setPreviousServerChangeToken:",  v19);

              id v20 = sub_1000AA6AC(@"ckksfetch", 0LL);
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
                v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:v9]);
                *(_DWORD *)buf = v26;
                uint64_t v34 = v9;
                __int16 v35 = 2112;
                id v36 = v23;
                _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Using cached change token for %@: %@",  buf,  0x16u);
              }
            }

            else
            {
              v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 changeToken]);
              -[CKFetchRecordZoneChangesConfiguration setPreviousServerChangeToken:]( v14,  "setPreviousServerChangeToken:",  v21);
            }

            v3 = v15;

            uint64_t v7 = v27;
          }

          if (([v12 resync] & 1) != 0
            || -[CKKSFetchAllRecordZoneChangesOperation forceResync](self, "forceResync"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation resyncingZones](self, "resyncingZones"));
            [v24 addObject:v9];
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
          [v25 setObject:v14 forKeyedSubscript:v9];

          id v6 = v28;
        }

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }

    while (v6);
  }
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  -[CKKSFetchAllRecordZoneChangesOperation setAllClientOptions:](self, "setAllClientOptions:", v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  -[CKKSFetchAllRecordZoneChangesOperation setFetchedZoneIDs:](self, "setFetchedZoneIDs:", v4);

  -[CKKSFetchAllRecordZoneChangesOperation queryClientsForChangeTokens](self, "queryClientsForChangeTokens");
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
  id v6 = [v5 count];

  if (v6)
  {
    -[CKKSFetchAllRecordZoneChangesOperation performFetch](self, "performFetch");
  }

  else
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  50LL,  @"No clients want a fetch right now"));
    -[CKKSResultOperation setError:](self, "setError:", v7);

    id v8 = sub_1000AA6AC(@"ckksfetch", 0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation error](self, "error"));
      int v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling fetch: %@", (uint8_t *)&v11, 0xCu);
    }

    -[CKKSFetchAllRecordZoneChangesOperation setClientMap:](self, "setClientMap:", &__NSDictionary0__struct);
  }

- (void)performFetch
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v88 = 0u;
  __int128 v89 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
  __int128 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);

  id v6 = [v5 countByEnumeratingWithState:&v86 objects:v102 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v87;
    do
    {
      id v8 = 0LL;
      do
      {
        if (*(void *)v87 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap"));
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v9]);
        unsigned __int8 v12 = [v11 zoneIsReadyForFetching:v9];

        if ((v12 & 1) == 0) {
          [v3 addObject:v9];
        }
        id v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v86 objects:v102 count:16];
    }

    while (v6);
  }

  v13 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v14 = kSecurityRTCFieldIsPrioritized;
  uint64_t v100 = kSecurityRTCFieldIsPrioritized;
  v101 = &__kCFBooleanFalse;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v101,  &v100,  1LL));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation altDSID](self, "altDSID"));
  BOOL v17 = -[CKKSFetchAllRecordZoneChangesOperation sendMetric](self, "sendMetric");
  id v18 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v13,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v15,  v16,  kSecurityRTCEventNameZoneChangeFetch,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  v17);

  if ([v3 count])
  {
    id v19 = sub_1000AA6AC(@"ckksfetch", 0LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v94 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Dropping the following zones from this fetch cycle: %@",  buf,  0xCu);
    }

    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    id v21 = v3;
    id v22 = [v21 countByEnumeratingWithState:&v82 objects:v99 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v83;
      do
      {
        v24 = 0LL;
        do
        {
          if (*(void *)v83 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v82 + 1) + 8LL * (void)v24);
          __int128 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
          [v26 removeObject:v25];

          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
          [v27 setObject:0 forKeyedSubscript:v25];

          v24 = (char *)v24 + 1;
        }

        while (v22 != v24);
        id v22 = [v21 countByEnumeratingWithState:&v82 objects:v99 count:16];
      }

      while (v22);
    }
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
  BOOL v29 = [v28 count] == 0;

  if (!v29)
  {
    uint64_t v97 = kSecurityRTCFieldNumViews;
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v30 count]));
    v98 = v31;
    __int128 v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v98,  &v97,  1LL));
    -[AAFAnalyticsEventSecurity addMetrics:](v18, "addMetrics:", v32);

    id v33 = sub_1000AA6AC(@"ckksfetch", 0LL);
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
      *(_DWORD *)buf = 138412546;
      v94 = v35;
      __int16 v95 = 2112;
      v96 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Beginning fetch: %@ options: %@", buf, 0x16u);
    }

    objc_super v37 = -[objc_class alloc]( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperationClass]( self,  "fetchRecordZoneChangesOperationClass"),  "alloc");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchedZoneIDs](self, "fetchedZoneIDs"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation allClientOptions](self, "allClientOptions"));
    v40 = -[objc_class initWithRecordZoneIDs:configurationsByRecordZoneID:]( v37,  "initWithRecordZoneIDs:configurationsByRecordZoneID:",  v38,  v39);
    -[CKKSFetchAllRecordZoneChangesOperation setFetchRecordZoneChangesOperation:]( self,  "setFetchRecordZoneChangesOperation:",  v40);

    v41 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v41 setFetchAllChanges:0];

    v42 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 configuration]);
    [v43 setIsCloudKitSupportOperation:1];

    v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation ckoperationGroup](self, "ckoperationGroup"));
    v45 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v45 setGroup:v44];

    id v46 = sub_1000AA6AC(@"ckksfetch", 0LL);
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation ckoperationGroup](self, "ckoperationGroup"));
      *(_DWORD *)buf = 138412290;
      v94 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Operation group is %@", buf, 0xCu);
    }

    v49 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
    if (([v49 containsObject:@"api"] & 1) == 0)
    {
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
      if (([v50 containsObject:@"initialfetch"] & 1) == 0)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
        if (![v51 containsObject:@"more-coming"])
        {
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchReasons](self, "fetchReasons"));
          unsigned __int8 v69 = [v68 containsObject:@"keyhierarchy"];

          if ((v69 & 1) == 0) {
            goto LABEL_33;
          }
          goto LABEL_32;
        }
      }
    }

LABEL_32:
    v52 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v52 setQualityOfService:25];

    uint64_t v91 = v14;
    v92 = &__kCFBooleanTrue;
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v92,  &v91,  1LL));
    -[AAFAnalyticsEventSecurity addMetrics:](v18, "addMetrics:", v53);

LABEL_33:
    v80[0] = _NSConcreteStackBlock;
    v80[1] = 3221225472LL;
    v80[2] = sub_1000A4760;
    v80[3] = &unk_100284D98;
    objc_copyWeak(&v81, &location);
    v54 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v54 setRecordChangedBlock:v80];

    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472LL;
    v78[2] = sub_1000A48D4;
    v78[3] = &unk_100284DC0;
    objc_copyWeak(&v79, &location);
    v55 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v55 setRecordWithIDWasDeletedBlock:v78];

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_1000A4A3C;
    v76[3] = &unk_100284DE8;
    objc_copyWeak(&v77, &location);
    v56 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v56 setRecordZoneChangeTokensUpdatedBlock:v76];

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472LL;
    v73[2] = sub_1000A4B6C;
    v73[3] = &unk_100284E10;
    objc_copyWeak(&v75, &location);
    v57 = v18;
    v74 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v58 setRecordZoneFetchCompletionBlock:v73];

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472LL;
    v70[2] = sub_1000A4EB0;
    v70[3] = &unk_100284E38;
    objc_copyWeak(&v72, &location);
    v71 = v57;
    v59 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v59 setFetchRecordZoneChangesCompletionBlock:v70];

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchCompletedOperation](self, "fetchCompletedOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v60);

    v61 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    -[CKKSGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v61);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation container](self, "container"));
    v63 = (void *)objc_claimAutoreleasedReturnValue([v62 privateCloudDatabase]);
    v64 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
    [v63 addOperation:v64];

    objc_destroyWeak(&v72);
    objc_destroyWeak(&v75);
    objc_destroyWeak(&v77);
    objc_destroyWeak(&v79);
    objc_destroyWeak(&v81);
    goto LABEL_37;
  }

  id v65 = sub_1000AA6AC(@"ckksfetch", 0LL);
  v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEFAULT,  "No zones to fetch. Skipping operation.",  buf,  2u);
  }

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation fetchCompletedOperation](self, "fetchCompletedOperation"));
  -[CKKSGroupOperation runBeforeGroupFinished:](self, "runBeforeGroupFinished:", v67);

LABEL_37:
  objc_destroyWeak(&location);
}

- (void)sendChangesToClient:(id)a3 moreComing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation clientMap](self, "clientMap"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    int v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation modifications](self, "modifications"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000A4500;
    v32[3] = &unk_100284E60;
    id v12 = v6;
    id v33 = v12;
    id v13 = v9;
    id v34 = v13;
    [v11 enumerateKeysAndObjectsUsingBlock:v32];

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation deletions](self, "deletions"));
    __int128 v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    id v28 = sub_1000A4630;
    BOOL v29 = &unk_100284E88;
    id v15 = v12;
    id v30 = v15;
    id v16 = v10;
    id v31 = v16;
    [v14 enumerateKeysAndObjectsUsingBlock:&v26];

    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation resyncingZones](self, "resyncingZones", v26, v27, v28, v29));
    id v18 = [v17 containsObject:v15];

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation changeTokens](self, "changeTokens"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:v15]);
    [v8 changesFetched:v13 deletedRecordIDs:v16 zoneID:v15 newChangeToken:v20 moreComing:v4 resync:v18];

    if ((_DWORD)v18 && !v4)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v15 zoneName]);
      id v22 = sub_1000AA6AC(@"ckksfetch", v21);
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "No more changes for zone; turning off resync bit",
          buf,
          2u);
      }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSFetchAllRecordZoneChangesOperation resyncingZones](self, "resyncingZones"));
      [v24 removeObject:v15];
    }
  }

  else
  {
    id v25 = sub_1000AA6AC(@"ckksfetch", 0LL);
    id v13 = (id)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "no client registered for %@, so why did we get any data?",  buf,  0xCu);
    }
  }
}

- (void)cancel
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSFetchAllRecordZoneChangesOperation fetchRecordZoneChangesOperation]( self,  "fetchRecordZoneChangesOperation"));
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CKKSFetchAllRecordZoneChangesOperation;
  -[CKKSGroupOperation cancel](&v4, "cancel");
}

- (Class)fetchRecordZoneChangesOperationClass
{
  return (Class)objc_getProperty(self, a2, 134LL, 1);
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 142LL, 1);
}

- (BOOL)resync
{
  return (uint64_t)self->super._startOperation & 1;
}

- (void)setResync:(BOOL)a3
{
  LOBYTE(self->super._startOperation) = a3;
}

- (NSMutableArray)fetchedZoneIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 150LL, 1);
}

- (void)setFetchedZoneIDs:(id)a3
{
}

- (NSSet)fetchReasons
{
  return (NSSet *)objc_getProperty(self, a2, 158LL, 1);
}

- (void)setFetchReasons:(id)a3
{
}

- (NSSet)apnsPushes
{
  return (NSSet *)objc_getProperty(self, a2, 166LL, 1);
}

- (void)setApnsPushes:(id)a3
{
}

- (NSMutableDictionary)modifications
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 174LL, 1);
}

- (void)setModifications:(id)a3
{
}

- (NSMutableDictionary)deletions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 182LL, 1);
}

- (void)setDeletions:(id)a3
{
}

- (NSMutableDictionary)changeTokens
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 190LL, 1);
}

- (void)setChangeTokens:(id)a3
{
}

- (CKKSFetchRecordZoneChangesOperation)fetchRecordZoneChangesOperation
{
  return (CKKSFetchRecordZoneChangesOperation *)objc_getProperty(self, a2, 198LL, 1);
}

- (void)setFetchRecordZoneChangesOperation:(id)a3
{
}

- (NSMutableDictionary)allClientOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 206LL, 1);
}

- (void)setAllClientOptions:(id)a3
{
}

- (NSDictionary)clientMap
{
  return (NSDictionary *)objc_getProperty(self, a2, 214LL, 1);
}

- (void)setClientMap:(id)a3
{
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 222LL, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (unint64_t)fetchedItems
{
  return *(unint64_t *)((char *)&self->_changeTokens + 6);
}

- (void)setFetchedItems:(unint64_t)a3
{
  *(NSMutableDictionary **)((char *)&self->_changeTokens + 6) = (NSMutableDictionary *)a3;
}

- (BOOL)forceResync
{
  return BYTE1(self->super._startOperation) & 1;
}

- (void)setForceResync:(BOOL)a3
{
  BYTE1(self->super._startOperation) = a3;
}

- (BOOL)moreComing
{
  return BYTE2(self->super._startOperation) & 1;
}

- (void)setMoreComing:(BOOL)a3
{
  BYTE2(self->super._startOperation) = a3;
}

- (NSString)altDSID
{
  return (NSString *)objc_getProperty(self, a2, 238LL, 1);
}

- (void)setAltDSID:(id)a3
{
}

- (BOOL)sendMetric
{
  return BYTE3(self->super._startOperation) & 1;
}

- (void)setSendMetric:(BOOL)a3
{
  BYTE3(self->super._startOperation) = a3;
}

- (unint64_t)totalModifications
{
  return *(unint64_t *)((char *)&self->_allClientOptions + 6);
}

- (void)setTotalModifications:(unint64_t)a3
{
  *(NSMutableDictionary **)((char *)&self->_allClientOptions + 6) = (NSMutableDictionary *)a3;
}

- (unint64_t)totalDeletions
{
  return *(unint64_t *)((char *)&self->_clientMap + 6);
}

- (void)setTotalDeletions:(unint64_t)a3
{
  *(NSDictionary **)((char *)&self->_clientMap + 6) = (NSDictionary *)a3;
}

- (NSMutableSet)resyncingZones
{
  return (NSMutableSet *)objc_getProperty(self, a2, 262LL, 1);
}

- (void)setResyncingZones:(id)a3
{
}

- (CKKSResultOperation)fetchCompletedOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 270LL, 1);
}

- (void)setFetchCompletedOperation:(id)a3
{
}

- (void).cxx_destruct
{
}

@end