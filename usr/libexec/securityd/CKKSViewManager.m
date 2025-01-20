@interface CKKSViewManager
+ (id)manager;
+ (void)callSyncCallbackWithErrorNoAccount:(id)a3;
- (BOOL)allowClientRPC:(id *)a3;
- (BOOL)peekCallbackForUUID:(id)a3;
- (BOOL)waitForTrustReady;
- (CKContainer)container;
- (CKKSAccountStateTracker)accountTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSCondition)completedSecCKKSInitialize;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSRateLimiter)globalRateLimiter;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSViewManager)initWithContainer:(id)a3 sosAdapter:(id)a4 accountStateTracker:(id)a5 lockStateTracker:(id)a6 reachabilityTracker:(id)a7 personaAdapter:(id)a8 cloudKitClassDependencies:(id)a9 accountsAdapter:(id)a10;
- (NSMutableDictionary)pendingSyncCallbacks;
- (NSOperationQueue)operationQueue;
- (NSSet)viewAllowList;
- (NSXPCListener)listener;
- (OTAccountsAdapter)accountsAdapter;
- (OTPersonaAdapter)personaAdapter;
- (OTSOSAdapter)sosPeerAdapter;
- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4;
- (id)claimCallbackForUUID:(id)a3;
- (id)currentTLKsFilteredByPolicy:(BOOL)a3 error:(id *)a4;
- (id)defaultViewError;
- (id)getGlobalRateLimiter;
- (id)pendingCallbackUUIDs;
- (id)restartCKKSAccountSync:(id)a3;
- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3;
- (id)sanitizeErrorDomain:(id)a3;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)deleteSEView:(id)a3 reply:(id)a4;
- (void)dropAllActors;
- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7;
- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)haltAll;
- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6;
- (void)lockStateChangeNotification:(BOOL)a3;
- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6;
- (void)notifyNewTLKsInKeychain;
- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4;
- (void)performanceCounters:(id)a3;
- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)registerSyncStatusCallback:(id)a3 callback:(id)a4;
- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5;
- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6;
- (void)rpcGetCKDeviceIDWithReply:(id)a3;
- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4;
- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)rpcResetLocal:(id)a3 reply:(id)a4;
- (void)rpcResync:(id)a3 reply:(id)a4;
- (void)rpcResyncLocal:(id)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6;
- (void)setAccountTracker:(id)a3;
- (void)setAccountsAdapter:(id)a3;
- (void)setCloudKitClassDependencies:(id)a3;
- (void)setCompletedSecCKKSInitialize:(id)a3;
- (void)setContainer:(id)a3;
- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10;
- (void)setGlobalRateLimiter:(id)a3;
- (void)setListener:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPendingSyncCallbacks:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setSosPeerAdapter:(id)a3;
- (void)setViewAllowList:(id)a3;
- (void)setupAnalytics;
- (void)syncBackupAndNotifyAboutSync;
- (void)toggleHavoc:(id)a3;
- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6;
- (void)xpc24HrNotification;
@end

@implementation CKKSViewManager

- (CKKSViewManager)initWithContainer:(id)a3 sosAdapter:(id)a4 accountStateTracker:(id)a5 lockStateTracker:(id)a6 reachabilityTracker:(id)a7 personaAdapter:(id)a8 cloudKitClassDependencies:(id)a9 accountsAdapter:(id)a10
{
  id v38 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v17 = a9;
  id v32 = a10;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___CKKSViewManager;
  v18 = -[CKKSViewManager init](&v39, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_cloudKitClassDependencies, a9);
    objc_storeStrong((id *)&v19->_sosPeerAdapter, a4);
    viewAllowList = v19->_viewAllowList;
    v19->_viewAllowList = 0LL;

    objc_storeStrong((id *)&v19->_container, a3);
    objc_storeStrong((id *)&v19->_accountTracker, a5);
    objc_storeStrong((id *)&v19->_lockStateTracker, a6);
    -[CKKSLockStateTracker addLockStateObserver:](v19->_lockStateTracker, "addLockStateObserver:", v19);
    objc_storeStrong((id *)&v19->_reachabilityTracker, a7);
    objc_storeStrong((id *)&v19->_personaAdapter, a8);
    objc_storeStrong((id *)&v19->_accountsAdapter, a10);
    id v21 =  +[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:]( OctagonAPSReceiver,  "receiverForNamedDelegatePort:apsConnectionClass:",  @"com.apple.securityd.aps",  [v17 apsConnectionClass]);
    v22 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingSyncCallbacks = v19->_pendingSyncCallbacks;
    v19->_pendingSyncCallbacks = v24;

    v26 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    completedSecCKKSInitialize = v19->_completedSecCKKSInitialize;
    v19->_completedSecCKKSInitialize = v26;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    listener = v19->_listener;
    v19->_listener = (NSXPCListener *)v28;

    -[NSXPCListener setDelegate:](v19->_listener, "setDelegate:", v19);
    -[NSXPCListener resume](v19->_listener, "resume");
    id v30 =  -[CKKSAccountStateTracker registerForNotificationsOfCloudKitAccountStatusChange:]( v19->_accountTracker,  "registerForNotificationsOfCloudKitAccountStatusChange:",  v19);
  }

  return v19;
}

- (BOOL)allowClientRPC:(id *)a3
{
  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68) {
    return 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager personaAdapter](self, "personaAdapter"));
  unsigned __int8 v6 = [v5 currentThreadIsForPrimaryiCloudAccount];

  if ((v6 & 1) != 0) {
    return 1;
  }
  v8 = sub_10001267C("ckks");
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Rejecting client RPC for non-primary persona",  v11,  2u);
  }

  if (!a3) {
    return 0;
  }
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  65LL,  @"CKKS APIs do not support non-primary users"));
  BOOL result = 0;
  *a3 = v10;
  return result;
}

- (BOOL)waitForTrustReady
{
  uint64_t v5 = 0LL;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E24E8;
  block[3] = &unk_100292300;
  block[4] = &v5;
  if (qword_1002DE9E0 != -1) {
    dispatch_once(&qword_1002DE9E0, block);
  }
  char v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setupAnalytics
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_1000E16E0;
  v24[3] = &unk_100285C68;
  objc_copyWeak(&v25, &location);
  double v4 = SFAnalyticsSamplerIntervalOncePerReport;
  id v5 =  [v3 AddMultiSamplerForName:@"CKKS-healthSummary" withTimeInterval:v24 block:SFAnalyticsSamplerIntervalOncePerReport];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSViewManager ckksAccountSyncForContainer:contextID:]( self,  "ckksAccountSyncForContainer:contextID:",  @"com.apple.security.keychain",  @"defaultContext"));
  uint64_t v7 = v6;
  if (v6)
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    char v8 = (void *)objc_claimAutoreleasedReturnValue([v6 viewList]);
    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v21;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKKS-%@-healthSummary",  v12));
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472LL;
          v16[2] = sub_1000E1A10;
          v16[3] = &unk_100285C90;
          objc_copyWeak(&v19, &location);
          id v17 = v7;
          uint64_t v18 = v12;
          id v15 = [v13 AddMultiSamplerForName:v14 withTimeInterval:v16 block:v4];

          objc_destroyWeak(&v19);
        }

        id v9 = [v8 countByEnumeratingWithState:&v20 objects:v27 count:16];
      }

      while (v9);
    }
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
}

- (id)getGlobalRateLimiter
{
  if (qword_1002DE9F0 != -1) {
    dispatch_once(&qword_1002DE9F0, &stru_100285CB0);
  }
  globalRateLimiter = self->_globalRateLimiter;
  p_globalRateLimiter = &self->_globalRateLimiter;
  v3 = globalRateLimiter;
  if (globalRateLimiter) {
    return v3;
  }
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = sub_1000E1538;
  v13 = sub_1000E1548;
  id v14 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000E1550;
  block[3] = &unk_100292300;
  block[4] = &v9;
  dispatch_sync((dispatch_queue_t)qword_1002DE9E8, block);
  objc_storeStrong((id *)p_globalRateLimiter, (id)v10[5]);
  uint64_t v7 = *p_globalRateLimiter;
  _Block_object_dispose(&v9, 8);

  return v7;
}

- (void)lockStateChangeNotification:(BOOL)a3
{
  if (a3)
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v4 setDateProperty:v3 forKey:@"lastUnlock"];
  }

- (id)restartCKKSAccountSync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 syncingPolicy]);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSViewManager restartCKKSAccountSyncWithoutSettingPolicy:]( self,  "restartCKKSAccountSyncWithoutSettingPolicy:",  v4));

  [v6 setCurrentSyncingPolicy:v5 policyIsFresh:0];
  return v6;
}

- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ckksAccountSyncForContainer:v6 contextID:v5 possibleAccount:0]);

  if (!v8)
  {
    id v9 = sub_1000AA6AC(@"ckksAccountSyncForContainer", 0LL);
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "failed to get CKKSKeychainView", v12, 2u);
    }
  }

  return v8;
}

- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 restartCKKSAccountSyncWithoutSettingPolicy:v3]);

  return v5;
}

- (void)registerSyncStatusCallback:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  objc_sync_enter(v8);
  id v9 = sub_1000AA6AC(@"ckkscallback", 0LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "registered callback for UUID: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v11 = objc_retainBlock(v7);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  [v12 setObject:v11 forKeyedSubscript:v6];

  objc_sync_exit(v8);
}

- (id)claimCallbackForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v4]);

    if (v7)
    {
      id v8 = sub_1000AA6AC(@"ckkscallback", 0LL);
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "fetched UUID: %@", (uint8_t *)&v13, 0xCu);
      }
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    [v10 setObject:0 forKeyedSubscript:v4];

    id v11 = objc_retainBlock(v7);
    objc_sync_exit(v5);
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (BOOL)peekCallbackForUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    objc_sync_enter(v5);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    unsigned __int8 v8 = [v7 containsObject:v4];

    objc_sync_exit(v5);
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)pendingCallbackUUIDs
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  objc_sync_enter(v3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v6 = [v5 copy];

  objc_sync_exit(v3);
  return v6;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if ([v6 accountStatus] != (id)1
    || (objc_msgSend(v6, "hasValidCredentials", v20) & 1) == 0)
  {
    id obj = (id)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks", v20));
    objc_sync_enter(obj);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
    id v8 = [v7 count];

    if (v8)
    {
      id v9 = sub_1000AA6AC(@"ckkscallback", 0LL);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No CK account; failing all pending sync callbacks",
          buf,
          2u);
      }

      __int128 v24 = 0u;
      __int128 v25 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allKeys]);

      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v23;
        do
        {
          id v15 = 0LL;
          do
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8LL * (void)v15);
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 objectForKeyedSubscript:v16]);
            +[CKKSViewManager callSyncCallbackWithErrorNoAccount:]( &OBJC_CLASS___CKKSViewManager,  "callSyncCallbackWithErrorNoAccount:",  v18);

            id v15 = (char *)v15 + 1;
          }

          while (v13 != v15);
          id v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }

        while (v13);
      }

      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager pendingSyncCallbacks](self, "pendingSyncCallbacks"));
      [v19 removeAllObjects];
    }

    objc_sync_exit(obj);
  }
}

- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6
{
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    if (a5)
    {
      id v11 = sub_1000E705C(a5, (uint64_t)&off_10028F460, 0LL);
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if ([v12 length])
      {
        if (v12) {
          id v13 = -[NSUUID initWithUUIDBytes:]( [NSUUID alloc], "initWithUUIDBytes:", [v12 bytes]);
        }
        else {
          id v13 = 0LL;
        }
        unsigned int v15 = 0;
      }

      else
      {
        if (qword_1002DEA70 != -1) {
          dispatch_once(&qword_1002DEA70, &stru_100286568);
        }
        unsigned int v15 = [v12 isEqualToData:qword_1002DEA78];
        id v13 = 0LL;
      }
    }

    else
    {
      id v13 = 0LL;
      unsigned int v15 = 0;
    }

    if (a6)
    {
      uint64_t v16 = sub_1000E705C(a6, (uint64_t)&off_10028F460, 0LL);
      id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      if ([v17 length])
      {
        if (v17)
        {
          uint64_t v18 = objc_alloc(&OBJC_CLASS___NSUUID);
          id v19 = v17;
          id v20 = -[NSUUID initWithUUIDBytes:](v18, "initWithUUIDBytes:", [v19 bytes]);

          unsigned int v21 = 0;
          BOOL v22 = v13 != 0LL;
          BOOL v23 = v20 != 0LL;
          if (v13 && v20)
          {
            v61 = self;
            __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v13, "UUIDString"));
            __int128 v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](v20, "UUIDString"));
            unsigned __int8 v26 = [v24 isEqualToString:v25];

            if ((v26 & 1) == 0)
            {
              id v56 = sub_1000AA6AC(@"handleKeychainEventDbConnection", 0LL);
              v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v56);
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)v69 = v13;
                *(_WORD *)&v69[8] = 2112;
                v70 = v20;
                v43 = "musr for added and deleted are different. added's musr:%@, deleted's musr: %@";
                v44 = v42;
                uint32_t v45 = 22;
                goto LABEL_66;
              }

- (id)defaultViewError
{
  NSErrorUserInfoKey v6 = NSLocalizedDescriptionKey;
  char v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No syncing view for %@, %@",  @"com.apple.security.keychain",  @"defaultContext"));
  id v7 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v7,  &v6,  1LL));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  11LL,  v3));

  return v4;
}

- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10
{
  id v32 = a3;
  id v31 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = (void (**)(id, id))a10;
  unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v22 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v33 = 0LL;
  BOOL v23 = (void *)objc_claimAutoreleasedReturnValue( [v21 ckksForClientRPC:v22 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v33]);
  id v24 = v33;

  if (!v23 || v24)
  {
    id v27 = sub_1000AA6AC(@"ckks", 0LL);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v35 = @"com.apple.security.keychain";
      __int16 v36 = 2112;
      uint64_t v37 = @"defaultContext";
      __int16 v38 = 2112;
      id v39 = v24;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    unsigned __int8 v26 = v31;
    if (v24)
    {
      v20[2](v20, v24);
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v20[2](v20, v29);
    }

    __int128 v25 = v32;
  }

  else
  {
    unsigned __int8 v26 = v31;
    __int128 v25 = v32;
    [v23 setCurrentItemForAccessGroup:v32 hash:v31 accessGroup:v15 identifier:v16 viewHint:v17 replacing:v18 hash:v19 complete:v20];
  }
}

- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v15 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v22 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 ckksForClientRPC:v15 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v22]);
  id v17 = v22;

  if (v16) {
    BOOL v18 = v17 == 0LL;
  }
  else {
    BOOL v18 = 0;
  }
  if (v18)
  {
    [v16 unsetCurrentItemsForAccessGroup:v10 identifiers:v11 viewHint:v12 complete:v13];
  }

  else
  {
    id v19 = sub_1000AA6AC(@"ckks", 0LL);
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v24 = @"com.apple.security.keychain";
      __int16 v25 = 2112;
      unsigned __int8 v26 = @"defaultContext";
      __int16 v27 = 2112;
      id v28 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    if (v17)
    {
      v13[2](v13, v17);
    }

    else
    {
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v13[2](v13, v21);
    }
  }
}

- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void, id))a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v17 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v24 = 0LL;
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 ckksForClientRPC:v17 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v24]);
  id v19 = v24;

  if (v18) {
    BOOL v20 = v19 == 0LL;
  }
  else {
    BOOL v20 = 0;
  }
  if (v20)
  {
    [v18 getCurrentItemForAccessGroup:v12 identifier:v13 viewHint:v14 fetchCloudValue:v8 complete:v15];
  }

  else
  {
    id v21 = sub_1000AA6AC(@"ckks", 0LL);
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      unsigned __int8 v26 = @"com.apple.security.keychain";
      __int16 v27 = 2112;
      id v28 = @"defaultContext";
      __int16 v29 = 2112;
      id v30 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    if (v19)
    {
      v15[2](v15, 0LL, v19);
    }

    else
    {
      BOOL v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v15[2](v15, 0LL, v23);
    }
  }
}

- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v18]);
  id v13 = v18;

  if (v12) {
    BOOL v14 = v13 == 0LL;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [v12 getCurrentItemOutOfBand:v8 forceFetch:v6 complete:v9];
  }

  else
  {
    id v15 = sub_1000AA6AC(@"ckks", 0LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      BOOL v20 = @"com.apple.security.keychain";
      __int16 v21 = 2112;
      id v22 = @"defaultContext";
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    if (v13)
    {
      v9[2](v9, 0LL, v13);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v9[2](v9, 0LL, v17);
    }
  }
}

- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v18 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v18]);
  id v13 = v18;

  if (v12) {
    BOOL v14 = v13 == 0LL;
  }
  else {
    BOOL v14 = 0;
  }
  if (v14)
  {
    [v12 fetchPCSIdentityOutOfBand:v8 forceFetch:v6 complete:v9];
  }

  else
  {
    id v15 = sub_1000AA6AC(@"ckks", 0LL);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      BOOL v20 = @"com.apple.security.keychain";
      __int16 v21 = 2112;
      id v22 = @"defaultContext";
      __int16 v23 = 2112;
      id v24 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    if (v13)
    {
      v9[2](v9, 0LL, v13);
    }

    else
    {
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v9[2](v9, 0LL, v17);
    }
  }
}

- (void)notifyNewTLKsInKeychain
{
  id v3 = sub_1000AA6AC(@"ckksbackup", 0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "New TLKs have arrived", v5, 2u);
  }

  -[CKKSViewManager syncBackupAndNotifyAboutSync](self, "syncBackupAndNotifyAboutSync");
}

- (void)syncBackupAndNotifyAboutSync
{
  char v2 = sub_1001C41CC((uint64_t)self, (uint64_t)a2);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = v3;
  if (v3)
  {
    [v3 performTransaction:&stru_100285CD0];
  }

  else
  {
    id v5 = sub_1000AA6AC(@"ckks", 0LL);
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to get account object", v7, 2u);
    }
  }
}

- (id)currentTLKsFilteredByPolicy:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v8 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v55 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 ckksForClientRPC:v8 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v55]);
  id v10 = v55;

  if (v9) {
    BOOL v11 = v10 == 0LL;
  }
  else {
    BOOL v11 = 0;
  }
  if (!v11)
  {
    id v12 = sub_1000AA6AC(@"ckks", 0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      unint64_t v58 = @"com.apple.security.keychain";
      __int16 v59 = 2112;
      v60 = @"defaultContext";
      __int16 v61 = 2112;
      id v62 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    if (a4)
    {
      if (v10) {
        id v14 = v10;
      }
      else {
        id v14 = (id)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      }
      id v46 = 0LL;
      *a4 = v14;
    }

    else
    {
      id v46 = 0LL;
    }

    goto LABEL_47;
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 findKeySets:0]);
  id v16 = [v15 timeout:10000000000];
  [v15 waitUntilFinished];
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 error]);

  if (!v17)
  {
    id v47 = a4;
    id v45 = v10;
    v48 = v9;
    id v46 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue([v15 intendedZoneIDs]);
    id v21 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
    if (!v21) {
      goto LABEL_43;
    }
    id v22 = v21;
    uint64_t v23 = *(void *)v52;
    while (1)
    {
      for (i = 0LL; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v52 != v23) {
          objc_enumerationMutation(obj);
        }
        __int16 v25 = *(void **)(*((void *)&v51 + 1) + 8LL * (void)i);
        if (v5)
        {
          unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v48 syncingPolicy]);
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 viewsToPiggybackTLKs]);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneName]);
          unsigned int v29 = [v27 containsObject:v28];

          if (!v29) {
            continue;
          }
        }

        id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 keysets]);
        id v31 = (__CFString *)objc_claimAutoreleasedReturnValue([v30 objectForKeyedSubscript:v25]);

        if (v31)
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tlk](v31, "tlk"));

          if (v32)
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString tlk](v31, "tlk"));
            id v50 = 0LL;
            id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 ensureKeyLoadedForContextID:&stru_100294B48 cache:0 error:&v50]);
            id v35 = (__CFString *)v50;

            if (v34) {
              BOOL v36 = v35 == 0LL;
            }
            else {
              BOOL v36 = 0;
            }
            if (v36)
            {
              id v43 = [v34 copy];
              [v46 addObject:v43];
            }

            else
            {
              id v37 = sub_1000AA6AC(@"ckks", 0LL);
              __int16 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v58 = v35;
                _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Error loading key: %@", buf, 0xCu);
              }

              if (v47) {
                *id v47 = v35;
              }
            }

            goto LABEL_40;
          }

          id v42 = sub_1000AA6AC(@"ckks", 0LL);
          id v35 = (__CFString *)objc_claimAutoreleasedReturnValue(v42);
          if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v58 = v31;
            unsigned __int8 v40 = (os_log_s *)v35;
            id v41 = "Do not have TLK: %@";
LABEL_37:
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, v41, buf, 0xCu);
          }
        }

        else
        {
          id v39 = sub_1000AA6AC(@"ckks", 0LL);
          id v35 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            unint64_t v58 = 0LL;
            unsigned __int8 v40 = (os_log_s *)v35;
            id v41 = "Do not have keyset: %@";
            goto LABEL_37;
          }
        }

- (void)performanceCounters:(id)a3
{
}

- (void)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v21 = 0LL;
  unsigned __int8 v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v21);
  id v9 = (__CFString *)v21;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v20 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v20]);
    id v13 = v20;

    if (!v12 || v13)
    {
      id v17 = sub_1000AA6AC(@"ckks", 0LL);
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v23 = @"com.apple.security.keychain";
        __int16 v24 = 2112;
        __int16 v25 = @"defaultContext";
        __int16 v26 = 2112;
        id v27 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
LABEL_17:

        goto LABEL_18;
      }

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v7[2](v7, v14);
    }

    else
    {
      if (v6) {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
      }
      else {
        id v14 = 0LL;
      }
      id v19 = [v12 rpcResetLocal:v14 reply:v7];
    }

    goto LABEL_17;
  }

  id v15 = sub_10001267C("ckks");
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a resetLocal RPC: %@", buf, 0xCu);
  }

  v7[2](v7, v9);
LABEL_18:
}

- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5
{
  id v7 = a3;
  unsigned __int8 v8 = (void (**)(id, id))a5;
  id v22 = 0LL;
  unsigned __int8 v9 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v22);
  id v10 = (__CFString *)v22;
  if ((v9 & 1) != 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v12 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v21 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( [v11 ckksForClientRPC:v12 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v21]);
    id v14 = v21;

    if (!v13 || v14)
    {
      id v18 = sub_1000AA6AC(@"ckks", 0LL);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v24 = @"com.apple.security.keychain";
        __int16 v25 = 2112;
        __int16 v26 = @"defaultContext";
        __int16 v27 = 2112;
        id v28 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v14)
      {
        v8[2](v8, v14);
LABEL_17:

        goto LABEL_18;
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v8[2](v8, v15);
    }

    else
    {
      if (v7) {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
      }
      else {
        id v15 = 0LL;
      }
      id v20 = [v13 rpcResetCloudKit:v15 reply:v8];
    }

    goto LABEL_17;
  }

  id v16 = sub_10001267C("ckks");
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Rejecting a resetCloudKit RPC: %@", buf, 0xCu);
  }

  v8[2](v8, v10);
LABEL_18:
}

- (void)rpcResync:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v31 = 0LL;
  unsigned __int8 v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v31);
  unsigned __int8 v9 = (__CFString *)v31;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v30 = 0LL;
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v30]);
    id v13 = v30;

    if (!v12 || v13)
    {
      id v23 = sub_1000AA6AC(@"ckks", 0LL);
      __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v33 = @"com.apple.security.keychain";
        __int16 v34 = 2112;
        id v35 = @"defaultContext";
        __int16 v36 = 2112;
        id v37 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }

      else
      {
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v7[2](v7, v25);
      }
    }

    else
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___CKKSResultOperation);
      -[CKKSResultOperation setName:](v14, "setName:", @"rpc-resync-cloudkit");
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v14);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      v26[2] = sub_1000E12EC;
      v26[3] = &unk_100290F30;
      objc_copyWeak(&v28, &location);
      __int16 v27 = v7;
      -[CKKSResultOperation setCompletionBlock:](v14, "setCompletionBlock:", v26);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v12, "zoneName"));
      id v16 = sub_1000AA6AC(@"ckksresync", v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Beginning resync (CloudKit) for %@",  buf,  0xCu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString resyncWithCloud](v12, "resyncWithCloud"));
      -[CKKSResultOperation addSuccessDependency:](v14, "addSuccessDependency:", v18);
      id v19 = -[CKKSResultOperation timeout:](v14, "timeout:", 240000000000LL);
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager operationQueue](self, "operationQueue"));
      [v20 addOperation:v14];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    id v21 = sub_10001267C("ckks");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Rejecting a resync RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)rpcResyncLocal:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v30 = 0LL;
  unsigned __int8 v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v30);
  unsigned __int8 v9 = (__CFString *)v30;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v29 = 0LL;
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v29]);
    id v13 = v29;

    if (!v12 || v13)
    {
      id v22 = sub_1000AA6AC(@"ckks", 0LL);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v32 = @"com.apple.security.keychain";
        __int16 v33 = 2112;
        __int16 v34 = @"defaultContext";
        __int16 v35 = 2112;
        id v36 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }

      else
      {
        __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v7[2](v7, v24);
      }
    }

    else
    {
      id v14 = objc_alloc_init(&OBJC_CLASS___CKKSResultOperation);
      -[CKKSResultOperation setName:](v14, "setName:", @"rpc-resync-local");
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v14);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_1000E11DC;
      v25[3] = &unk_100290F30;
      objc_copyWeak(&v27, &location);
      __int16 v26 = v7;
      -[CKKSResultOperation setCompletionBlock:](v14, "setCompletionBlock:", v25);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v12, "zoneName"));
      id v16 = sub_1000AA6AC(@"ckksresync", v15);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v32 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Beginning resync (local) for %@",  buf,  0xCu);
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString resyncLocal](v12, "resyncLocal"));
      -[CKKSResultOperation addSuccessDependency:](v14, "addSuccessDependency:", v18);
      id v19 = -[CKKSResultOperation timeout:](v14, "timeout:", 240000000000LL);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    id v20 = sub_10001267C("ckks");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Rejecting a resync-local RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void, id))a6;
  id v24 = 0LL;
  unsigned __int8 v12 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v24);
  id v13 = (__CFString *)v24;
  if ((v12 & 1) != 0)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v15 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v23 = 0LL;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( [v14 ckksForClientRPC:v15 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v23]);
    id v17 = v23;

    if (!v16 || v17)
    {
      id v20 = sub_1000AA6AC(@"ckks", 0LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v26 = @"com.apple.security.keychain";
        __int16 v27 = 2112;
        id v28 = @"defaultContext";
        __int16 v29 = 2112;
        id v30 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v17)
      {
        v11[2](v11, 0LL, v17);
      }

      else
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v11[2](v11, 0LL, v22);
      }
    }

    else
    {
      [v16 rpcStatus:v10 fast:v8 waitForNonTransientState:a5 reply:v11];
    }
  }

  else
  {
    id v18 = sub_10001267C("ckks");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a status RPC: %@", buf, 0xCu);
    }

    v11[2](v11, 0LL, v13);
  }
}

- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, id))a6;
  if ((sub_100098648((uint64_t)v11, v12) & 1) != 0)
  {
    id v44 = 0LL;
    unsigned __int8 v13 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v44);
    id v14 = (__CFString *)v44;
    if ((v13 & 1) != 0)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
      id v16 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
      id v43 = 0LL;
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue( [v15 ckksForClientRPC:v16 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v43]);
      id v18 = v43;

      if (!v17 || v18)
      {
        id v27 = sub_1000AA6AC(@"ckks", 0LL);
        id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          id v46 = @"com.apple.security.keychain";
          __int16 v47 = 2112;
          v48 = @"defaultContext";
          __int16 v49 = 2112;
          id v50 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
        }

        if (v18)
        {
          v11[2](v11, v18);
        }

        else
        {
          id v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
          v11[2](v11, v37);
        }
      }

      else
      {
        if (v7)
        {
          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString earliestFetchTime](v17, "earliestFetchTime"));
          [v19 timeIntervalSinceNow];
          BOOL v38 = v20 > -600.0;
          if (v20 > -600.0)
          {
            id v21 = sub_1000AA6AC(@"ckks", 0LL);
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Skipping fetch because a recent fetch was performed",  buf,  2u);
            }
          }
        }

        else
        {
          BOOL v38 = 0;
        }

        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"rpc-fetch-and-process-result",  &stru_100285CF0));
        id location = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&location, v29);
        v39[0] = _NSConcreteStackBlock;
        v39[1] = 3221225472LL;
        v39[2] = sub_1000E1160;
        v39[3] = &unk_100290F30;
        objc_copyWeak(&v41, &location);
        unsigned __int8 v40 = v11;
        [v29 setCompletionBlock:v39];
        id v30 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v17, "zoneName"));
        id v31 = sub_1000AA6AC(@"ckks", v30);
        id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v46 = v17;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Beginning fetch for %@", buf, 0xCu);
        }

        if (v38) {
          uint64_t v33 = objc_claimAutoreleasedReturnValue( -[__CFString rpcProcessIncomingQueue:errorOnClassAFailure:]( v17,  "rpcProcessIncomingQueue:errorOnClassAFailure:",  0LL,  v8));
        }
        else {
          uint64_t v33 = objc_claimAutoreleasedReturnValue( -[__CFString rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:]( v17,  "rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:",  0LL,  @"api",  v8));
        }
        __int16 v34 = (void *)v33;
        [v29 addSuccessDependency:v33];
        __int16 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager operationQueue](self, "operationQueue"));
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v29 timeout:300000000000]);
        [v35 addOperation:v36];

        objc_destroyWeak(&v41);
        objc_destroyWeak(&location);
      }
    }

    else
    {
      __int16 v25 = sub_10001267C("ckks");
      __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetch-and-process RPC: %@",  buf,  0xCu);
      }

      v11[2](v11, v14);
    }
  }

  else
  {
    id v23 = sub_1000AA6AC(@"ckks", 0LL);
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Skipping fetchAndProcessCKChanges due to disabled CKKS",  buf,  2u);
    }

    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  9LL,  @"CKKS disabled"));
    v11[2](v11, v14);
  }
}

- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  id v33 = 0LL;
  unsigned __int8 v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v33);
  unsigned __int8 v9 = (__CFString *)v33;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v32 = 0LL;
    uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v32]);
    id v27 = v32;

    if (!v12 || v27)
    {
      id v20 = sub_1000AA6AC(@"ckks", 0LL);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v35 = @"com.apple.security.keychain";
        __int16 v36 = 2112;
        id v37 = @"defaultContext";
        __int16 v38 = 2112;
        id v39 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v27)
      {
        v7[2](v7, v27);
      }

      else
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v7[2](v7, v22);
      }
    }

    else
    {
      unsigned __int8 v13 = objc_alloc_init(&OBJC_CLASS___CKKSResultOperation);
      -[CKKSResultOperation setName:](v13, "setName:", @"rpc-push");
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, v13);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_1000E10E8;
      v28[3] = &unk_100290F30;
      objc_copyWeak(&v30, &location);
      __int16 v29 = v7;
      -[CKKSResultOperation setCompletionBlock:](v13, "setCompletionBlock:", v28);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString zoneName](v12, "zoneName"));
      id v15 = sub_1000AA6AC(@"ckks-rpc", v14);
      id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v35 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Beginning push for %@", buf, 0xCu);
      }

      if (v6) {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
      }
      else {
        id v17 = 0LL;
      }
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"rpc-push"));
      id v24 = (void *)objc_claimAutoreleasedReturnValue( -[__CFString rpcProcessOutgoingQueue:operationGroup:]( v12,  "rpcProcessOutgoingQueue:operationGroup:",  v17,  v23));

      if (v6) {
      -[CKKSResultOperation addSuccessDependency:](v13, "addSuccessDependency:", v24);
      }
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager operationQueue](self, "operationQueue"));
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSResultOperation timeout:](v13, "timeout:", 300000000000LL));
      [v25 addOperation:v26];

      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }

  else
  {
    id v18 = sub_10001267C("ckks");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Rejecting a push RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)rpcGetCKDeviceIDWithReply:(id)a3
{
  id v11 = 0LL;
  id v4 = (void (**)(id, void *))a3;
  unsigned __int8 v5 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v11);
  id v6 = v11;
  if ((v5 & 1) != 0)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager accountTracker](self, "accountTracker"));
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ckdeviceID]);
    v4[2](v4, v8);

    id v4 = (void (**)(id, void *))v7;
  }

  else
  {
    unsigned __int8 v9 = sub_10001267C("ckks");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Rejecting a push RPC: %@", buf, 0xCu);
    }

    v4[2](v4, @"error");
  }
}

- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  id v22 = 0LL;
  unsigned __int8 v11 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v22);
  id v12 = v22;
  if ((v11 & 1) != 0)
  {
    if (v8)
    {
      id v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472LL;
      id v19 = sub_1000E10DC;
      id v20 = &unk_100285D18;
      id v21 = -[SecEventMetric initWithEventName:](objc_alloc(&OBJC_CLASS___SecEventMetric), "initWithEventName:", v8);
      id v13 = v21;
      [v9 enumerateKeysAndObjectsUsingBlock:&v17];
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[SecMetrics managerObject](&OBJC_CLASS___SecMetrics, "managerObject", v17, v18, v19, v20));
      [v14 submitEvent:v13];

      v10[2](v10, 0LL);
    }

    else
    {
      id v13 = (SecEventMetric *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  51LL,  @"No metric name"));
      ((void (**)(id, SecEventMetric *))v10)[2](v10, v13);
    }
  }

  else
  {
    id v15 = sub_10001267C("ckks");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Rejecting a ckmetric RPC: %@", buf, 0xCu);
    }

    ((void (**)(id, id))v10)[2](v10, v12);
  }
}

- (id)sanitizeErrorDomain:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    unsigned int v6 = [v5 isEqualToString:@"securityd"];

    if (v6)
    {
      id v7 = [v4 code];
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSOSStatusErrorDomain,  v7,  v8));
      uint64_t v10 = CKXPCSuitableError(v9);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      uint64_t v12 = CKXPCSuitableError(v4);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    }
  }

  else
  {
    unsigned __int8 v11 = 0LL;
  }

  return v11;
}

- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, id))a7;
  id v34 = 0LL;
  unsigned __int8 v17 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v34);
  uint64_t v18 = (__CFString *)v34;
  if ((v17 & 1) != 0)
  {
    id v30 = v12;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v20 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v33 = 0LL;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( [v19 ckksForClientRPC:v20 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v33]);
    id v22 = v33;

    if (!v21 || v22)
    {
      id v25 = sub_1000AA6AC(@"ckks", 0LL);
      __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      id v12 = v30;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v38 = @"com.apple.security.keychain";
        __int16 v39 = 2112;
        unsigned __int8 v40 = @"defaultContext";
        __int16 v41 = 2112;
        id v42 = v22;
        _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v22)
      {
        v16[2](v16, v22);
      }

      else
      {
        NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
        id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No CKKS for %@, %@",  @"com.apple.security.keychain",  @"defaultContext"));
        __int16 v36 = v27;
        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
        __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  11LL,  v28));
        v16[2](v16, v29);

        id v12 = v30;
      }
    }

    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1000E1094;
      v31[3] = &unk_100285D40;
      v31[4] = self;
      id v32 = v16;
      id v12 = v30;
      [v21 proposeTLKForExternallyManagedView:v30 proposedTLK:v13 wrappedOldTLK:v14 tlkShares:v15 reply:v31];
    }
  }

  else
  {
    id v23 = sub_10001267C("ckks");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v38 = v18;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Rejecting a proposeTLK RPC: %@", buf, 0xCu);
    }

    v16[2](v16, v18);
  }
}

- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v26 = 0LL;
  unsigned __int8 v10 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v26);
  unsigned __int8 v11 = (__CFString *)v26;
  if ((v10 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v13 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v25 = 0LL;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [v12 ckksForClientRPC:v13 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v25]);
    id v15 = v25;

    if (!v14 || v15)
    {
      id v18 = sub_1000AA6AC(@"ckks", 0LL);
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v30 = @"com.apple.security.keychain";
        __int16 v31 = 2112;
        id v32 = @"defaultContext";
        __int16 v33 = 2112;
        id v34 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v15)
      {
        (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0LL, 0LL, 0LL, v15);
      }

      else
      {
        NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No CKKS for %@, %@",  @"com.apple.security.keychain",  @"defaultContext"));
        id v28 = v20;
        id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  11LL,  v21));
        (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0LL, 0LL, 0LL, v22);
      }
    }

    else
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000E0FFC;
      v23[3] = &unk_100285D68;
      v23[4] = self;
      id v24 = v9;
      [v14 fetchExternallyManagedViewKeyHierarchy:v8 forceFetch:v6 reply:v23];
    }
  }

  else
  {
    id v16 = sub_10001267C("ckks");
    unsigned __int8 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchSEViewHierarchy RPC: %@",  buf,  0xCu);
    }

    (*((void (**)(id, void, void, void, __CFString *))v9 + 2))(v9, 0LL, 0LL, 0LL, v11);
  }
}

- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  id v30 = 0LL;
  unsigned __int8 v14 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v30);
  id v15 = (__CFString *)v30;
  if ((v14 & 1) != 0)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v17 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v29 = 0LL;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 ckksForClientRPC:v17 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v29]);
    id v19 = v29;

    if (!v18 || v19)
    {
      id v22 = sub_1000AA6AC(@"ckks", 0LL);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = @"com.apple.security.keychain";
        __int16 v35 = 2112;
        __int16 v36 = @"defaultContext";
        __int16 v37 = 2112;
        id v38 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v19)
      {
        v13[2](v13, v19);
      }

      else
      {
        NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No CKKS for %@, %@",  @"com.apple.security.keychain",  @"defaultContext"));
        id v32 = v24;
        id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
        id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  11LL,  v25));
        v13[2](v13, v26);
      }
    }

    else
    {
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000E0FB4;
      v27[3] = &unk_100285D40;
      v27[4] = self;
      id v28 = v13;
      [v18 modifyTLKSharesForExternallyManagedView:v10 adding:v11 deleting:v12 reply:v27];
    }
  }

  else
  {
    id v20 = sub_10001267C("ckks");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Rejecting a modifyTLKShares RPC: %@",  buf,  0xCu);
    }

    v13[2](v13, v15);
  }
}

- (void)deleteSEView:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v24 = 0LL;
  unsigned __int8 v8 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v24);
  id v9 = (__CFString *)v24;
  if ((v8 & 1) != 0)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v11 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v23 = 0LL;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v10 ckksForClientRPC:v11 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v23]);
    id v13 = v23;

    if (!v12 || v13)
    {
      id v16 = sub_1000AA6AC(@"ckks", 0LL);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v28 = @"com.apple.security.keychain";
        __int16 v29 = 2112;
        id v30 = @"defaultContext";
        __int16 v31 = 2112;
        id v32 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v13)
      {
        v7[2](v7, v13);
      }

      else
      {
        NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No CKKS for %@, %@",  @"com.apple.security.keychain",  @"defaultContext"));
        id v26 = v18;
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  11LL,  v19));
        v7[2](v7, v20);
      }
    }

    else
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000E0F6C;
      v21[3] = &unk_100285D40;
      v21[4] = self;
      id v22 = v7;
      [v12 resetExternallyManagedCloudKitView:v6 reply:v21];
    }
  }

  else
  {
    unsigned __int8 v14 = sub_10001267C("ckks");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Rejecting a deleteSEView RPC: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }
}

- (void)toggleHavoc:(id)a3
{
  id v4 = (void (**)(id, void, id))a3;
  id v17 = 0LL;
  unsigned __int8 v5 = -[CKKSViewManager allowClientRPC:](self, "allowClientRPC:", &v17);
  id v6 = (__CFString *)v17;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
    id v8 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
    id v16 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( [v7 ckksForClientRPC:v8 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v16]);
    id v10 = v16;

    if (!v9 || v10)
    {
      id v13 = sub_1000AA6AC(@"ckks", 0LL);
      unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v19 = @"com.apple.security.keychain";
        __int16 v20 = 2112;
        id v21 = @"defaultContext";
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
      }

      if (v10)
      {
        v4[2](v4, 0LL, v10);
      }

      else
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
        v4[2](v4, 0LL, v15);
      }
    }

    else
    {
      [v9 toggleHavoc:v4];
    }
  }

  else
  {
    id v11 = sub_10001267C("ckks");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rejecting a toggleHavoc RPC: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v6);
  }
}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v9 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  id v16 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( [v8 ckksForClientRPC:v9 createIfMissing:1 allowNonPrimaryAccounts:1 error:&v16]);
  id v11 = v16;

  if (v10) {
    BOOL v12 = v11 == 0LL;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12)
  {
    [v10 pcsMirrorKeysForServices:v6 reply:v7];
  }

  else
  {
    id v13 = sub_1000AA6AC(@"ckks", 0LL);
    unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v18 = @"com.apple.security.keychain";
      __int16 v19 = 2112;
      __int16 v20 = @"defaultContext";
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "No CKKS view for %@, %@, error: %@",  buf,  0x20u);
    }

    if (v11)
    {
      v7[2](v7, 0LL, v11);
    }

    else
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSViewManager defaultViewError](self, "defaultViewError"));
      v7[2](v7, 0LL, v15);
    }
  }
}

- (void)xpc24HrNotification
{
  id v3 = sub_1000AA6AC(@"ckks", 0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received a 24hr notification from XPC", buf, 2u);
  }

  if (!-[CKKSViewManager waitForTrustReady](self, "waitForTrustReady"))
  {
    id v5 = sub_1000AA6AC(@"ckks", 0LL);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trust not ready, still going ahead", v10, 2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSViewManager ckksAccountSyncForContainer:contextID:]( self,  "ckksAccountSyncForContainer:contextID:",  @"com.apple.security.keychain",  @"defaultContext"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"periodic-device-state-update"));
  id v9 =  [v7 updateDeviceState:1 waitForKeyHierarchyInitialization:30000000000 ckoperationGroup:v8];
  [v7 xpc24HrNotification];
}

- (void)haltAll
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  [v2 haltAll];
}

- (void)dropAllActors
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  [v2 dropAllActors];
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setContainer:(id)a3
{
}

- (CKKSAccountStateTracker)accountTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccountTracker:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (CKKSCondition)completedSecCKKSInitialize
{
  return (CKKSCondition *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setCompletedSecCKKSInitialize:(id)a3
{
}

- (CKKSRateLimiter)globalRateLimiter
{
  return (CKKSRateLimiter *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setGlobalRateLimiter:(id)a3
{
}

- (OTSOSAdapter)sosPeerAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSosPeerAdapter:(id)a3
{
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setAccountsAdapter:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setListener:(id)a3
{
}

- (NSSet)viewAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setViewAllowList:(id)a3
{
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setCloudKitClassDependencies:(id)a3
{
}

- (NSMutableDictionary)pendingSyncCallbacks
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setPendingSyncCallbacks:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)callSyncCallbackWithErrorNoAccount:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"securityd",  -67729LL,  @"No iCloud account available; item is not expected to sync"));
  (*((void (**)(id, void, id))a3 + 2))(v4, 0LL, v5);
}

+ (id)manager
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[OTManager manager](&OBJC_CLASS___OTManager, "manager"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 viewManager]);

  return v3;
}

@end