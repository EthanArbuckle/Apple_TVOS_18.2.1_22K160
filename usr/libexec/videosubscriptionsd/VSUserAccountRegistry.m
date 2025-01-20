@interface VSUserAccountRegistry
- (BOOL)_isValidForDeleteQueryForCurrentTask;
- (BOOL)_isValidForUpdateQueryForCurrentTask:(id)a3;
- (BOOL)currentUpdateSessionIsForced;
- (BOOL)saveContext:(id)a3 withError:(id *)a4;
- (BOOL)shouldAllowUserAccountUpdate:(id)a3;
- (BOOL)storesLoaded;
- (NSDate)lastUpdateTime;
- (NSOperationQueue)privateQueue;
- (OS_dispatch_source)timer;
- (VSPreferences)preferences;
- (VSPrivacyFacade)privacyFacade;
- (VSRemoteNotifier)remoteNotifier;
- (VSUserAccountPersistentContainer)container;
- (VSUserAccountRegistry)init;
- (VSUserAccountRegistry)initWithDelegate:(id)a3;
- (VSUserAccountRegistryDelegate)delegate;
- (VSUserAccountUpdateManager)updateManager;
- (WLKSettingsStore)sharedSettingsStore;
- (id)_predicateForFetchingAllResults;
- (id)_predicateForFetchingZeroResults;
- (id)_predicateForIsSignedOut:(BOOL)a3;
- (id)_predicateForQueryRequestWithOptions:(int64_t)a3;
- (id)_predicateForUserAccountFromCurrentDevice;
- (id)_predicateForUserAccountFromDeviceID:(id)a3;
- (id)_predicateForUserAccountFromSourceID:(id)a3;
- (id)_predicateForUserAccountWithDeviceIdentifier:(id)a3 sourceIdentifier:(id)a4 sourceType:(id)a5;
- (id)_predicateForUserAccountWithNonnullBillingCycleEndDate;
- (id)_predicateForUserAccountWithNonnullUpdateURL;
- (id)_predicateForUserAccountWithSourceType:(id)a3;
- (id)_securityTaskForCurrentConnection;
- (id)_sortForUserAccountBillingCycleEndDateASC:(BOOL)a3;
- (id)_sortForUserAccountModifiedTimeASC:(BOOL)a3;
- (id)_updateRequestForAccount:(id)a3;
- (id)_userAccountForPersistentUserAccount:(id)a3 context:(id)a4;
- (id)createSaveContext;
- (id)prepareUserAccountsToVend:(id)a3 withSecurityTask:(id)a4;
- (os_unfair_lock_s)loadingStoresLock;
- (void)_deduplicatePersistentUserAccounts:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_deletePersistentUserAccount:(id)a3 withContext:(id)a4 completion:(id)a5;
- (void)_deleteUserAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_forceRefreshAccount:(id)a3;
- (void)_getMaxUpdateFrequencyNumberWithCompletionHandler:(id)a3;
- (void)_insertUserAccount:(id)a3 completion:(id)a4;
- (void)_loadStoresAndMigrateIfRequiredWithCompletion:(id)a3;
- (void)_persistentAccountsForUserAccount:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_populatePersistentUserAccount:(id)a3 withUserAccount:(id)a4 context:(id)a5;
- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7;
- (void)_queryUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5;
- (void)_queryUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7;
- (void)_removeNonConnectedSignedOutUserAccounts;
- (void)_setUpdateRequestManagerWithRequests:(id)a3;
- (void)_setupObservers;
- (void)_subscriptionsForMigrationWithCompletion:(id)a3;
- (void)_update;
- (void)deleteUserAccount:(id)a3 completion:(id)a4;
- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4;
- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4;
- (void)forceUpdateUserAccountsWithCompletion:(id)a3;
- (void)insertUserAccount:(id)a3 completion:(id)a4;
- (void)queryUserAccountsWithOptions:(int64_t)a3 completion:(id)a4;
- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7;
- (void)queryUserAccountsWithPredicate:(id)a3 completion:(id)a4;
- (void)registerSubscription:(id)a3;
- (void)removeSubscriptions:(id)a3;
- (void)resetTimer;
- (void)setContainer:(id)a3;
- (void)setCurrentUpdateSessionIsForced:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLastUpdateTime:(id)a3;
- (void)setLoadingStoresLock:(os_unfair_lock_s)a3;
- (void)setPreferences:(id)a3;
- (void)setPrivacyFacade:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setRemoteNotifier:(id)a3;
- (void)setSharedSettingsStore:(id)a3;
- (void)setStoresLoaded:(BOOL)a3;
- (void)setTimer:(id)a3;
- (void)setUpdateManager:(id)a3;
- (void)updateManager:(id)a3 updateRequestDidFinish:(id)a4;
- (void)updateManagerDidFinish:(id)a3;
- (void)updateUserAccount:(id)a3 completion:(id)a4;
@end

@implementation VSUserAccountRegistry

- (VSUserAccountRegistry)init
{
  return -[VSUserAccountRegistry initWithDelegate:](self, "initWithDelegate:", 0LL);
}

- (VSUserAccountRegistry)initWithDelegate:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___VSUserAccountRegistry;
  v5 = -[VSUserAccountRegistry init](&v29, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    preferences = v6->_preferences;
    v6->_preferences = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = v9;

    v11 = v6->_privateQueue;
    v12 = (objc_class *)objc_opt_class(v6);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[NSOperationQueue setName:](v11, "setName:", v14);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_privateQueue, "setMaxConcurrentOperationCount:", 1LL);
    v15 = objc_alloc(&OBJC_CLASS___VSRemoteNotifier);
    v16 = -[VSRemoteNotifier initWithNotificationName:]( v15,  "initWithNotificationName:",  VSUserAccountsDidChangeNotification);
    remoteNotifier = v6->_remoteNotifier;
    v6->_remoteNotifier = v16;

    v18 = objc_alloc(&OBJC_CLASS___VSPrivacyFacade);
    id v19 = objc_alloc_init(&OBJC_CLASS___VSPrivacyVoucherLockbox);
    v20 = -[VSPrivacyFacade initWithVoucherLockbox:](v18, "initWithVoucherLockbox:", v19);
    privacyFacade = v6->_privacyFacade;
    v6->_privacyFacade = v20;

    v22 = (VSUserAccountPersistentContainer *)-[VSUserAccountPersistentContainer initInMemory:]( objc_alloc(&OBJC_CLASS___VSUserAccountPersistentContainer),  "initInMemory:",  0LL);
    container = v6->_container;
    v6->_container = v22;

    v6->_loadingStoresLock._os_unfair_lock_opaque = 0;
    uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    lastUpdateTime = v6->_lastUpdateTime;
    v6->_lastUpdateTime = (NSDate *)v24;

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100003A2C;
    v27[3] = &unk_1000144C8;
    v28 = v6;
    -[VSUserAccountRegistry _loadStoresAndMigrateIfRequiredWithCompletion:]( v28,  "_loadStoresAndMigrateIfRequiredWithCompletion:",  v27);
  }

  return v6;
}

- (void)_setupObservers
{
  id v3 = WLKSettingsDidChangeNotification;
  objc_initWeak(&location, self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003C20;
  v7[3] = &unk_1000144F0;
  objc_copyWeak(&v8, &location);
  id v6 = [v4 addObserverForName:v3 object:0 queue:v5 usingBlock:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_loadStoresAndMigrateIfRequiredWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100003D34;
  v7[3] = &unk_1000145B8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)_subscriptionsForMigrationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, BOOL, void))a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry delegate](self, "delegate"));
  id v6 = (void *)v5;
  if (v5
    && (uint64_t v7 = objc_opt_respondsToSelector(v5, "userAccountRegistry:willPerformMigrationIfRequiredWithBlock:"),
        (v7 & 1) != 0))
  {
    uint64_t v11 = VSDefaultLogObject(v7, v8, v9, v10);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Will invoke migration delegate method.",  buf,  2u);
    }

    id v13 = objc_alloc_init(&OBJC_CLASS___VSWaitGroup);
    uint64_t v31 = 0LL;
    v32 = &v31;
    uint64_t v33 = 0x2020000000LL;
    char v34 = 0;
    *(void *)buf = 0LL;
    v26 = buf;
    uint64_t v27 = 0x3032000000LL;
    v28 = sub_100004088;
    objc_super v29 = sub_100004098;
    id v30 = 0LL;
    [v13 enter];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_1000048F0;
    v21[3] = &unk_1000145E0;
    v23 = &v31;
    uint64_t v24 = buf;
    id v14 = v13;
    id v22 = v14;
    [v6 userAccountRegistry:self willPerformMigrationIfRequiredWithBlock:v21];
    if ([v14 waitWithMilliseconds:2000])
    {
      BOOL v15 = *((_BYTE *)v32 + 24) != 0;
      uint64_t v16 = *((void *)v26 + 5);
    }

    else
    {
      uint64_t v19 = VSErrorLogObject();
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        sub_10000C7E4();
      }

      BOOL v15 = 0LL;
      uint64_t v16 = 0LL;
    }

    v4[2](v4, v15, v16);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v31, 8);
  }

  else
  {
    uint64_t v17 = VSErrorLogObject();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      sub_10000C7B8();
    }

    v4[2](v4, 0LL, 0LL);
  }
}

- (void)queryUserAccountsWithOptions:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForQueryRequestWithOptions:]( self,  "_predicateForQueryRequestWithOptions:",  a3));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100004AB0;
  v11[3] = &unk_100014630;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  -[VSUserAccountRegistry queryUserAccountsWithPredicate:completion:]( self,  "queryUserAccountsWithPredicate:completion:",  v8,  v11);
}

- (void)queryUserAccountsWithOptions:(int64_t)a3 sourceIdentifier:(id)a4 sourceType:(id)a5 deviceIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForQueryRequestWithOptions:]( self,  "_predicateForQueryRequestWithOptions:",  a3));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:]( self,  "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:",  v13,  v15,  v14));

  v25[0] = v16;
  v25[1] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v25, 2LL));
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v18));

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100004D20;
  v22[3] = &unk_100014630;
  v22[4] = self;
  id v23 = (id)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  id v24 = v12;
  id v20 = v12;
  id v21 = v23;
  -[VSUserAccountRegistry queryUserAccountsWithPredicate:completion:]( self,  "queryUserAccountsWithPredicate:completion:",  v19,  v22);
}

- (void)updateUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[VSUserAccountRegistry shouldAllowUserAccountUpdate:](self, "shouldAllowUserAccountUpdate:", v6))
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_10000527C;
    v53[3] = &unk_100014680;
    id v10 = &v54;
    id v11 = v8;
    id v54 = v11;
    id v12 = &v55;
    id v13 = v6;
    id v55 = v13;
    [v9 addOperationWithBlock:v53];

    BOOL v14 = -[VSUserAccountRegistry _isValidForUpdateQueryForCurrentTask:]( self,  "_isValidForUpdateQueryForCurrentTask:",  v13);
    if (v14)
    {
      uint64_t v18 = VSDefaultLogObject(v14, v15, v16, v17);
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v60 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "user account update permitted: %@",  buf,  0xCu);
      }

      id v20 = (id)objc_claimAutoreleasedReturnValue([v13 accountProviderIdentifier]);
      id v21 = [v20 length];
      if (v21)
      {
        uint64_t v25 = VSDefaultLogObject(v21, v22, v23, v24);
        v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "user account indicates an account provider identifier.",  buf,  2u);
        }

        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privacyFacade](self, "privacyFacade"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
        objc_super v29 = v28;
        if (v28) {
          [v28 auditToken];
        }
        else {
          memset(v52, 0, sizeof(v52));
        }
        unsigned __int8 v38 = objc_msgSend(v27, "isAccessGrantedForAuditToken:", v52, &v54);

        if ((v38 & 1) != 0)
        {
          unsigned __int8 v39 = 1;
        }

        else
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _securityTaskForCurrentConnection]( self,  "_securityTaskForCurrentConnection"));
          unsigned __int8 v39 = [v40 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService];
        }

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[VSAccountStore sharedAccountStore](&OBJC_CLASS___VSAccountStore, "sharedAccountStore"));
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_1000053B0;
        v46[3] = &unk_100014720;
        id v20 = v20;
        id v47 = v20;
        unsigned __int8 v51 = v39;
        id v48 = v13;
        v49 = self;
        id v50 = v7;
        [v41 fetchAccountsWithCompletionHandler:v46];

        id v10 = v42;
      }

      else
      {
        -[VSUserAccountRegistry insertUserAccount:completion:](self, "insertUserAccount:completion:", v13, v7);
      }
    }

    else
    {
      id v20 = (id)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v20 signingIdentifier]);
      uint64_t v34 = VSErrorLogObject();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        sub_10000C810();
      }

      if (v7)
      {
        uint64_t v36 = VSPublicError(1LL, 6LL, 0LL);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472LL;
        v43[2] = sub_100005820;
        v43[3] = &unk_100014658;
        id v44 = (id)objc_claimAutoreleasedReturnValue(v36);
        id v45 = v7;
        id v37 = v44;
        VSPerformCompletionHandler(v43);
      }
    }

    goto LABEL_26;
  }

  uint64_t v30 = VSErrorLogObject();
  uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
    sub_10000C870();
  }

  if (v7)
  {
    uint64_t v32 = VSPublicError(1LL, 3LL, 0LL);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_10000526C;
    v56[3] = &unk_100014658;
    id v10 = &v58;
    id v12 = &v57;
    id v57 = (id)objc_claimAutoreleasedReturnValue(v32);
    id v58 = v7;
    id v11 = v57;
    VSPerformCompletionHandler(v56);
LABEL_26:
  }
}

- (void)deleteUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000059B0;
  v18[3] = &unk_100014680;
  id v10 = v8;
  id v19 = v10;
  id v11 = v6;
  id v20 = v11;
  [v9 addOperationWithBlock:v18];

  if (-[VSUserAccountRegistry _isValidForDeleteQueryForCurrentTask](self, "_isValidForDeleteQueryForCurrentTask"))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry createSaveContext](self, "createSaveContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100005AF8;
    v14[3] = &unk_1000146F8;
    id v13 = &v15;
    id v15 = v7;
    -[VSUserAccountRegistry _deleteUserAccount:context:completion:]( self,  "_deleteUserAccount:context:completion:",  v11,  v12,  v14);
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100005AA8;
    v16[3] = &unk_1000146A8;
    id v13 = &v17;
    id v17 = v7;
    VSPerformCompletionHandler(v16);
  }
}

- (void)forceUpdateUserAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  unsigned int v6 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalUserAccountServiceForceUpdate];

  if (v6)
  {
    uint64_t v11 = VSDefaultLogObject(v7, v8, v9, v10);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Forcefully updating user accounts",  (uint8_t *)buf,  2u);
    }

    objc_initWeak(buf, self);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_100005DC8;
    v18[3] = &unk_100014748;
    objc_copyWeak(&v20, buf);
    id v19 = v4;
    [v13 addOperationWithBlock:v18];

    objc_destroyWeak(&v20);
    objc_destroyWeak(buf);
  }

  else
  {
    uint64_t v14 = VSErrorLogObject();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000C9BC();
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100005E68;
    v16[3] = &unk_1000146A8;
    id v17 = v4;
    VSPerformCompletionHandler(v16);
  }
}

- (void)forceRefreshUserAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[VSUserAccountRegistry _isValidForUpdateQueryForCurrentTask:](self, "_isValidForUpdateQueryForCurrentTask:", v6);
  if (v8)
  {
    uint64_t v12 = VSDefaultLogObject(v8, v9, v10, v11);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Forcefully updating user account",  (uint8_t *)buf,  2u);
    }

    objc_initWeak(buf, self);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100006040;
    v19[3] = &unk_100014770;
    objc_copyWeak(&v22, buf);
    id v20 = v6;
    id v21 = v7;
    [v14 addOperationWithBlock:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak(buf);
  }

  else
  {
    uint64_t v15 = VSErrorLogObject();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000C9E8();
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1000060E8;
    v17[3] = &unk_1000146A8;
    id v18 = v7;
    VSPerformCompletionHandler(v17);
  }
}

- (void)queryUserAccountsWithPredicate:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry createSaveContext](self, "createSaveContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000061A8;
  v10[3] = &unk_100014798;
  id v11 = v6;
  id v9 = v6;
  -[VSUserAccountRegistry _queryUserAccountsWithPredicate:context:completion:]( self,  "_queryUserAccountsWithPredicate:context:completion:",  v7,  v8,  v10);
}

- (void)insertUserAccount:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000062CC;
  v7[3] = &unk_1000146F8;
  id v8 = a4;
  id v6 = v8;
  -[VSUserAccountRegistry _insertUserAccount:completion:](self, "_insertUserAccount:completion:", a3, v7);
}

- (void)fetchActiveSubscriptionsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  uint64_t v9 = VSDefaultLogObject(v5, v6, v7, v8);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[VSUserAccountRegistry fetchActiveSubscriptionsWithOptions:completionHandler:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000064E0;
  v12[3] = &unk_100014798;
  id v13 = v5;
  id v11 = v5;
  -[VSUserAccountRegistry queryUserAccountsWithOptions:completion:]( self,  "queryUserAccountsWithOptions:completion:",  0LL,  v12);
}

- (void)registerSubscription:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  VSSubscriptionValueTransformerName));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v7]);

  if (!v5) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [subscriptionTransformer transformedValue:subscription] parameter must not be nil.");
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 transformedValue:v7]);
  -[VSUserAccountRegistry updateUserAccount:completion:](self, "updateUserAccount:completion:", v6, 0LL);
}

- (void)removeSubscriptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    uint64_t v9 = VSSubscriptionValueTransformerName;
    NSExceptionName v21 = NSInvalidArgumentException;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8LL * (void)i);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSValueTransformer valueTransformerForName:]( &OBJC_CLASS___NSValueTransformer,  "valueTransformerForName:",  v9,  v21));
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 transformedValue:v11]);

        if (!v13) {
          +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  v21,  @"The [subscriptionTransformer transformedValue:subscription] parameter must not be nil.");
        }
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 transformedValue:v11]);
        -[NSMutableArray addObject:](v5, "addObject:", v14);
      }

      id v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }

    while (v7);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  uint64_t v15 = v5;
  id v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0LL; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)j);
        [v20 setSignedOut:1];
        -[VSUserAccountRegistry updateUserAccount:completion:](self, "updateUserAccount:completion:", v20, 0LL);
      }

      id v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v15,  "countByEnumeratingWithState:objects:count:",  &v23,  v31,  16LL);
    }

    while (v17);
  }
}

- (BOOL)saveContext:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  else {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

- (id)createSaveContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry container](self, "container"));
  id v3 = [v2 newBackgroundContext];

  [v3 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  [v3 setAutomaticallyMergesChangesFromParent:1];
  return v3;
}

- (BOOL)shouldAllowUserAccountUpdate:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 serialNumber]);

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);
  if (!v6) {
    [v3 setDeviceIdentifier:v5];
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);
  objc_msgSend(v3, "setFromCurrentDevice:", objc_msgSend(v7, "isEqual:", v5));

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceIdentifier]);
  LOBYTE(v7) = v8 != 0LL;

  return (char)v7;
}

- (id)_updateRequestForAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[VSUserAccountRegistry currentUpdateSessionIsForced](self, "currentUpdateSessionIsForced");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v4 updateURL]);

  if (v6
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 subscriptionBillingCycleEndDate]),
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now")),
        unsigned int v9 = objc_msgSend(v7, "vs_isAfter:", v8) | v5,
        v8,
        v7,
        v9 == 1))
  {
    id v10 = [[VSUserAccountUpdateRequest alloc] initWithUserAccount:v4];
  }

  else
  {
    id v10 = 0LL;
  }

  return v10;
}

- (void)_setUpdateRequestManagerWithRequests:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[VSUserAccountUpdateManager initWithUserAccountUpdateRequests:]( objc_alloc(&OBJC_CLASS___VSUserAccountUpdateManager),  "initWithUserAccountUpdateRequests:",  v4);

  -[VSUserAccountUpdateManager setDelegate:](v5, "setDelegate:", self);
  -[VSUserAccountUpdateManager updateUserAccounts](v5, "updateUserAccounts");
  -[VSUserAccountRegistry setUpdateManager:](self, "setUpdateManager:", v5);
}

- (void)_forceRefreshAccount:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10000719C;
  v7[3] = &unk_100014680;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)_update
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000073B0;
  v4[3] = &unk_100014810;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)resetTimer
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_1000076FC;
  v2[3] = &unk_1000148B0;
  v2[4] = self;
  -[VSUserAccountRegistry _getMaxUpdateFrequencyNumberWithCompletionHandler:]( self,  "_getMaxUpdateFrequencyNumberWithCompletionHandler:",  v2);
}

- (void)_getMaxUpdateFrequencyNumberWithCompletionHandler:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AMSBag vs_defaultBag](&OBJC_CLASS___AMSBag, "vs_defaultBag"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 integerForKey:VSAMSBagKeyMaximumUserAccountUpdateFrequency]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100007F58;
  v7[3] = &unk_1000148D8;
  id v8 = v3;
  id v6 = v3;
  [v5 valueWithCompletion:v7];
}

- (void)_removeNonConnectedSignedOutUserAccounts
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry privateQueue](self, "privateQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100007FD4;
  v4[3] = &unk_100014810;
  v4[4] = self;
  [v3 addOperationWithBlock:v4];
}

- (void)_insertUserAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  if (-[VSUserAccountRegistry shouldAllowUserAccountUpdate:](self, "shouldAllowUserAccountUpdate:", v6))
  {
    v31[0] = 0LL;
    v31[1] = v31;
    v31[2] = 0x3032000000LL;
    v31[3] = sub_100004088;
    v31[4] = sub_100004098;
    id v32 = 0LL;
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry createSaveContext](self, "createSaveContext"));
    id v10 = objc_alloc_init(&OBJC_CLASS___VSWaitGroup);
    [v10 enter];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000086D4;
    v26[3] = &unk_100014978;
    v26[4] = self;
    id v11 = v9;
    id v27 = v11;
    __int128 v30 = v31;
    id v12 = v10;
    id v28 = v12;
    id v13 = v6;
    id v29 = v13;
    -[VSUserAccountRegistry _persistentAccountsForUserAccount:context:completion:]( self,  "_persistentAccountsForUserAccount:context:completion:",  v13,  v11,  v26);
    [v12 wait];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000089AC;
    v19[3] = &unk_1000149A0;
    __int128 v25 = v31;
    id v14 = v11;
    id v20 = v14;
    NSExceptionName v21 = self;
    id v22 = v13;
    id v23 = v8;
    id v24 = v7;
    [v14 performBlock:v19];

    _Block_object_dispose(v31, 8);
  }

  else
  {
    uint64_t v15 = VSErrorLogObject();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10000CB50();
    }

    uint64_t v17 = VSPublicError(1LL, 3LL, 0LL);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    (*((void (**)(id, void *))v7 + 2))(v7, v18);
  }
}

- (void)_persistentAccountsForUserAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 sourceIdentifier]);
  id v13 = [v10 sourceType];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:]( self,  "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:",  v11,  v12,  v14));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100008DFC;
  v18[3] = &unk_1000149C8;
  id v19 = v8;
  id v20 = v9;
  id v16 = v9;
  id v17 = v8;
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:context:completion:]( self,  "_queryPersistentUserAccountsWithPredicate:context:completion:",  v15,  v17,  v18);
}

- (void)_deduplicatePersistentUserAccounts:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, void))a5;
  id v11 = [v8 count];
  if ((unint64_t)v11 < 2)
  {
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
    v10[2](v10, v28, 0LL);
  }

  else
  {
    uint64_t v15 = VSDefaultLogObject(v11, v12, v13, v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v8 count];
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Found %lu duplicate persistent user accounts that match the user account to insert.",  (uint8_t *)&buf,  0xCu);
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _sortForUserAccountModifiedTimeASC:]( self,  "_sortForUserAccountModifiedTimeASC:",  1LL));
    v43 = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v43, 1LL));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v8 sortedArrayUsingDescriptors:v18]);

    id v20 = [v19 mutableCopy];
    NSExceptionName v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lastObject]);
    BOOL v22 = v21 == 0LL;

    if (v22) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The [accountsToRemove lastObject] parameter must not be nil.");
    }
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v20 lastObject]);
    [v20 removeLastObject];
    id v29 = (void *)v23;
    __int128 v30 = v19;
    uint64_t v31 = v10;
    id v32 = v8;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v39 = 0x3032000000LL;
    v40 = sub_100004088;
    v41 = sub_100004098;
    id v42 = 0LL;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    id v24 = v20;
    id v25 = [v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v25)
    {
      uint64_t v26 = *(void *)v34;
      do
      {
        id v27 = 0LL;
        do
        {
          if (*(void *)v34 != v26) {
            objc_enumerationMutation(v24);
          }
          -[VSUserAccountRegistry _deletePersistentUserAccount:withContext:completion:]( self,  "_deletePersistentUserAccount:withContext:completion:",  v29,  v30,  v31,  v32,  _NSConcreteStackBlock,  3221225472LL,  sub_100009274,  &unk_1000149F0,  *(void *)(*((void *)&v33 + 1) + 8LL * (void)v27),  &buf,  (void)v33);
          id v27 = (char *)v27 + 1;
        }

        while (v25 != v27);
        id v25 = [v24 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }

      while (v25);
    }

    id v10 = v31;
    id v8 = v32;
    v31[2](v31, v29, *(void *)(*((void *)&buf + 1) + 40LL));
    _Block_object_dispose(&buf, 8);
  }
}

- (void)_deleteUserAccount:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sourceIdentifier]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceIdentifier]);
  id v13 = [v10 sourceType];

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v13));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:]( self,  "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:",  v12,  v11,  v14));

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100009488;
  v18[3] = &unk_100014A18;
  id v19 = v8;
  id v20 = v9;
  void v18[4] = self;
  id v16 = v8;
  id v17 = v9;
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:context:completion:]( self,  "_queryPersistentUserAccountsWithPredicate:context:completion:",  v15,  v16,  v18);
}

- (void)_deletePersistentUserAccount:(id)a3 withContext:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000967C;
  v11[3] = &unk_100014A40;
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  id v15 = a5;
  id v8 = v15;
  id v9 = v13;
  id v10 = v12;
  [v9 performBlock:v11];
}

- (void)_queryUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_queryUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100009914;
  v14[3] = &unk_100014A18;
  id v15 = a6;
  id v16 = a7;
  void v14[4] = self;
  id v12 = v15;
  id v13 = v16;
  -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:]( self,  "_queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:",  a3,  a4,  a5,  v12,  v14);
}

- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 context:(id)a4 completion:(id)a5
{
}

- (void)_queryPersistentUserAccountsWithPredicate:(id)a3 sorts:(id)a4 fetchLimit:(id)a5 context:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100009BAC;
  v21[3] = &unk_100014A90;
  id v25 = v14;
  id v26 = a7;
  id v22 = v15;
  id v23 = v12;
  id v24 = v13;
  id v16 = v14;
  id v17 = v13;
  id v18 = v12;
  id v19 = v26;
  id v20 = v15;
  -[VSUserAccountRegistry _loadStoresAndMigrateIfRequiredWithCompletion:]( self,  "_loadStoresAndMigrateIfRequiredWithCompletion:",  v21);
}

- (void)_populatePersistentUserAccount:(id)a3 withUserAccount:(id)a4 context:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  id v11 = [v10 deviceType];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_10000A0B0;
  v14[3] = &unk_100014AB8;
  id v15 = v7;
  id v16 = v8;
  id v17 = v11;
  id v12 = v8;
  id v13 = v7;
  [v9 performBlockAndWait:v14];
}

- (id)_userAccountForPersistentUserAccount:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v40 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 sourceIdentifier]);
  id v7 = [v5 sourceType];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 serialNumber]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);
  id v11 = [v10 isEqual:v9];
  id v12 = objc_alloc(&OBJC_CLASS___VSUserAccount);
  id v13 = [v5 accountType];
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 updateURL]);
  id v15 = -[VSUserAccount initWithAccountType:updateURL:sourceType:sourceIdentifier:]( v12,  "initWithAccountType:updateURL:sourceType:sourceIdentifier:",  v13,  v14,  v7,  v6);

  -[VSUserAccount setRequiresSystemTrust:](v15, "setRequiresSystemTrust:", [v5 requiresSystemTrust]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v5 providerID]);
  id v17 = [v16 copy];
  -[VSUserAccount setAccountProviderIdentifier:](v15, "setAccountProviderIdentifier:", v17);

  id v18 = (void *)objc_claimAutoreleasedReturnValue([v5 accountIdentifier]);
  -[VSUserAccount setIdentifier:](v15, "setIdentifier:", v18);

  -[VSUserAccount setSignedOut:](v15, "setSignedOut:", [v5 signedOut]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 tierIdentifiers]);
  -[VSUserAccount setTierIdentifiers:](v15, "setTierIdentifiers:", v19);

  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 billingIdentifier]);
  id v21 = [v20 copy];
  -[VSUserAccount setBillingIdentifier:](v15, "setBillingIdentifier:", v21);

  id v22 = (void *)objc_claimAutoreleasedReturnValue([v5 authenticationData]);
  id v23 = [v22 copy];
  -[VSUserAccount setAuthenticationData:](v15, "setAuthenticationData:", v23);

  -[VSUserAccount setDeviceCategory:]( v15,  "setDeviceCategory:",  +[VSUserAccount deviceCategoryFromDeviceType:]( VSUserAccount,  "deviceCategoryFromDeviceType:",  [v5 deviceType]));
  -[VSUserAccount setFromCurrentDevice:](v15, "setFromCurrentDevice:", v11);
  -[VSUserAccount setKeychainItemHash:](v15, "setKeychainItemHash:", [v5 keychainItemHash]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v5 modified]);
  -[VSUserAccount setModified:](v15, "setModified:", v24);

  id v25 = (void *)objc_claimAutoreleasedReturnValue([v5 created]);
  -[VSUserAccount setCreated:](v15, "setCreated:", v25);

  -[VSUserAccount setIsDeveloperCreated:](v15, "setIsDeveloperCreated:", [v5 developer]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v5 appleSubscription]);
  -[VSUserAccount setAppleSubscription:](v15, "setAppleSubscription:", v26);

  id v27 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceIdentifier]);
  -[VSUserAccount setDeviceIdentifier:](v15, "setDeviceIdentifier:", v27);

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceName]);
  if (v28 || !(_DWORD)v11)
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v5 deviceName]);
    -[VSUserAccount setDeviceName:](v15, "setDeviceName:", v29);
  }

  else
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 name]);
    -[VSUserAccount setDeviceName:](v15, "setDeviceName:", v30);
  }

  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v5 billingCycleEndDate]);
  -[VSUserAccount setSubscriptionBillingCycleEndDate:](v15, "setSubscriptionBillingCycleEndDate:", v31);

  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccount accountProviderIdentifier](v15, "accountProviderIdentifier"));
  if (!-[VSUserAccount sourceType](v15, "sourceType") && [v32 length])
  {
    if (!v32) {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The accountProviderIdentifierOrNil parameter must not be nil.");
    }
    id v33 = v32;
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:]( self,  "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:",  0LL,  v33,  &off_100014FE8));
    id v35 = objc_alloc_init(&OBJC_CLASS___VSSemaphore);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10000A794;
    v41[3] = &unk_100014BC0;
    id v42 = v33;
    v43 = v15;
    id v44 = v35;
    id v36 = v35;
    id v37 = v33;
    -[VSUserAccountRegistry _queryPersistentUserAccountsWithPredicate:context:completion:]( self,  "_queryPersistentUserAccountsWithPredicate:context:completion:",  v34,  v40,  v41);
    [v36 wait];
  }

  return v15;
}

- (id)_securityTaskForCurrentConnection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));

  if (!v2) {
    +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInternalInconsistencyException,  @"Attempted to get security task from non-XPC thread.");
  }
  return +[VSSecurityTask securityTaskForCurrentConnection]( &OBJC_CLASS___VSSecurityTask,  "securityTaskForCurrentConnection");
}

- (BOOL)_isValidForDeleteQueryForCurrentTask
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  unsigned __int8 v3 = [v2 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalUserAccountServiceDelete];

  return v3;
}

- (BOOL)_isValidForUpdateQueryForCurrentTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  if ([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService]) {
    goto LABEL_2;
  }
  if (([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameUserAccountService] & 1) == 0
    && ([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSmootSubscriptionService] & 1) == 0)
  {
    uint64_t v12 = VSErrorLogObject();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000D06C();
    }
    goto LABEL_30;
  }

  unsigned int v7 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSubscriptionServiceReadWriteWebSources];
  id v8 = [v4 sourceType];
  if (!v7)
  {
    if (v8 == (id)2)
    {
      uint64_t v11 = VSErrorLogObject();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000CF0C();
      }
    }

    else
    {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v5 signingIdentifier]);
      id v10 = v13;
      if (v13)
      {
        id v10 = v13;
        id v14 = [v4 sourceType];
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 sourceIdentifier]);
        unsigned __int8 v16 = [v15 isEqualToString:v10];

        if (v14)
        {
          uint64_t v17 = VSErrorLogObject();
          id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_10000CFF8(v4, v18);
          }
        }

        if ((v16 & 1) == 0)
        {
          uint64_t v19 = VSErrorLogObject();
          id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_10000CF64(v4, (uint64_t)v10, v20);
          }
        }

        if (v14) {
          BOOL v6 = 0;
        }
        else {
          BOOL v6 = v16;
        }

        goto LABEL_31;
      }

      uint64_t v21 = VSErrorLogObject();
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_10000CF38();
      }
    }

- (id)prepareUserAccountsToVend:(id)a3 withSecurityTask:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    uint64_t v12 = VSEntitlementNameInternalUserAccountService;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        -[NSMutableArray addObject:](v7, "addObject:", v14);
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }

  return v7;
}

- (id)_sortForUserAccountModifiedTimeASC:(BOOL)a3
{
  return +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"modified",  a3);
}

- (id)_sortForUserAccountBillingCycleEndDateASC:(BOOL)a3
{
  return +[NSSortDescriptor sortDescriptorWithKey:ascending:]( &OBJC_CLASS___NSSortDescriptor,  "sortDescriptorWithKey:ascending:",  @"billingCycleEndDate",  a3);
}

- (id)_predicateForFetchingZeroResults
{
  return +[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 0LL);
}

- (id)_predicateForFetchingAllResults
{
  return +[NSPredicate predicateWithValue:](&OBJC_CLASS___NSPredicate, "predicateWithValue:", 1LL);
}

- (id)_predicateForIsSignedOut:(BOOL)a3
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"%K = %d",  @"signedOut",  [v3 intValue]));

  return v4;
}

- (id)_predicateForUserAccountFromDeviceID:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"deviceIdentifier",  a3);
}

- (id)_predicateForUserAccountFromCurrentDevice
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](&OBJC_CLASS___VSDevice, "currentDevice"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 serialNumber]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountFromDeviceID:]( self,  "_predicateForUserAccountFromDeviceID:",  v4));

  return v5;
}

- (id)_predicateForUserAccountFromSourceID:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"sourceIdentifier",  a3);
}

- (id)_predicateForUserAccountWithSourceType:(id)a3
{
  return +[NSPredicate predicateWithFormat:]( NSPredicate,  "predicateWithFormat:",  @"%K = %d",  @"sourceType",  [a3 integerValue]);
}

- (id)_predicateForUserAccountWithNonnullUpdateURL
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  @"updateURL");
}

- (id)_predicateForUserAccountWithNonnullBillingCycleEndDate
{
  return +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K != NULL",  @"billingCycleEndDate");
}

- (id)_predicateForUserAccountWithDeviceIdentifier:(id)a3 sourceIdentifier:(id)a4 sourceType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (v9)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountFromSourceID:]( self,  "_predicateForUserAccountFromSourceID:",  v9));
    -[NSMutableArray addObject:](v11, "addObject:", v12);
  }

  if (v10)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithSourceType:]( self,  "_predicateForUserAccountWithSourceType:",  v10));
    -[NSMutableArray addObject:](v11, "addObject:", v13);
  }

  if (v8)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountFromDeviceID:]( self,  "_predicateForUserAccountFromDeviceID:",  v8));
    -[NSMutableArray addObject:](v11, "addObject:", v14);
  }

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v11));

  return v15;
}

- (id)_predicateForQueryRequestWithOptions:(int64_t)a3
{
  char v3 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _securityTaskForCurrentConnection](self, "_securityTaskForCurrentConnection"));
  unsigned __int8 v6 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalUserAccountService];
  if ([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSubscriptionServiceFetchFromAllSources]) {
    unsigned int v7 = 1;
  }
  else {
    unsigned int v7 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameInternalSubscriptionService];
  }
  if (([v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameUserAccountService] & 1) != 0
    || (id v8 = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSmootSubscriptionService],
        ((v7 | v8) & 1) != 0))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
    v41 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithSourceType:]( self,  "_predicateForUserAccountWithSourceType:",  &off_100014FE8));

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
    id v40 = (void *)objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithSourceType:]( self,  "_predicateForUserAccountWithSourceType:",  &off_100015000));

    LODWORD(v13) = [v5 shouldAllowAccessForBooleanEntitlement:VSEntitlementNameSubscriptionServiceReadWriteWebSources];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
    if ((_DWORD)v13)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountWithSourceType:]( self,  "_predicateForUserAccountWithSourceType:",  &off_100015018));

      id v14 = (void *)v15;
    }

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v5 signingIdentifier]);
    if (v16) {
      char v17 = v7;
    }
    else {
      char v17 = 1;
    }
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingAllResults](self, "_predicateForFetchingAllResults"));
    if ((v17 & 1) == 0)
    {
      uint64_t v19 = objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountFromSourceID:]( self,  "_predicateForUserAccountFromSourceID:",  v16));

      __int128 v18 = (void *)v19;
    }

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingAllResults](self, "_predicateForFetchingAllResults"));
    if ((v3 & 1) == 0)
    {
      uint64_t v21 = objc_claimAutoreleasedReturnValue( -[VSUserAccountRegistry _predicateForUserAccountFromCurrentDevice]( self,  "_predicateForUserAccountFromCurrentDevice"));

      id v20 = (void *)v21;
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingAllResults](self, "_predicateForFetchingAllResults"));
    uint64_t v39 = (void *)v16;
    if ((v6 & 1) == 0)
    {
      uint64_t v23 = objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForIsSignedOut:](self, "_predicateForIsSignedOut:", 0LL));

      id v22 = (void *)v23;
    }

    v46[0] = v18;
    v46[1] = v20;
    v46[2] = v22;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v46, 3LL));
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v24));

    v45[0] = v41;
    v45[1] = v40;
    v45[2] = v14;
    id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 3LL));
    id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate orPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "orPredicateWithSubpredicates:",  v26));

    v44[0] = v25;
    v44[1] = v27;
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSCompoundPredicate andPredicateWithSubpredicates:]( &OBJC_CLASS___NSCompoundPredicate,  "andPredicateWithSubpredicates:",  v28));

    uint64_t v34 = VSDefaultLogObject(v30, v31, v32, v33);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      v43 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "VSUserAccountRegistry Using Predicate: %@",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v36 = VSDefaultLogObject(v8, v9, v10, v11);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "VSUserAccountRegistry - No Internal or Minimum Entitlement, Returning Predicate NO",  buf,  2u);
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry _predicateForFetchingZeroResults](self, "_predicateForFetchingZeroResults"));
  }

  return v29;
}

- (void)updateManager:(id)a3 updateRequestDidFinish:(id)a4
{
  id v5 = a4;
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userAccount]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 updatedUserAccount]);
  if (-[VSUserAccountRegistry shouldAllowUserAccountUpdate:](self, "shouldAllowUserAccountUpdate:", v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 updateError]);

    if (v8)
    {
      uint64_t v9 = VSErrorLogObject();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000D0F8(v5, v10);
      }
    }

    else
    {
      if (!v7) {
        goto LABEL_8;
      }
      id v12 = [v7 sourceType];
      if (v12 == [v6 sourceType]
        && (id v13 = (void *)objc_claimAutoreleasedReturnValue([v7 sourceIdentifier]),
            id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 sourceIdentifier]),
            unsigned int v15 = [v13 isEqual:v14],
            v14,
            v13,
            v15))
      {
        uint64_t v20 = VSDefaultLogObject(v16, v17, v18, v19);
        uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v5;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Updated user account allowed for insert: %@",  buf,  0xCu);
        }

        id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 updateURL]);
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
        [v7 setModifierIdentifier:v23];

        uint64_t v28 = VSDefaultLogObject(v24, v25, v26, v27);
        id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v7 modifierIdentifier]);
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Modifier identifier: %@", buf, 0xCu);
        }

        [v7 setModifierType:VSMetricAccountUpdateValueModifierTypeJS];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_10000BAE4;
        v32[3] = &unk_1000144C8;
        uint64_t v33 = v7;
        -[VSUserAccountRegistry _insertUserAccount:completion:](self, "_insertUserAccount:completion:", v33, v32);
        uint64_t v10 = v33;
      }

      else
      {
        uint64_t v31 = VSErrorLogObject();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10000D098();
        }
      }
    }
  }

  else
  {
    uint64_t v11 = VSErrorLogObject();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000CB50();
    }
  }

LABEL_8:
}

- (void)updateManagerDidFinish:(id)a3
{
  id v4 = a3;
  -[VSUserAccountRegistry setUpdateManager:](self, "setUpdateManager:", 0LL);
  -[VSUserAccountRegistry setCurrentUpdateSessionIsForced:](self, "setCurrentUpdateSessionIsForced:", 0LL);
  -[VSUserAccountRegistry resetTimer](self, "resetTimer");
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[VSUserAccountRegistry delegate](self, "delegate"));
  [v5 userAccountRegistry:self didFinishUpdatingUserAccountsWithManager:v4];
}

- (VSUserAccountRegistryDelegate)delegate
{
  return (VSUserAccountRegistryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (VSUserAccountPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (BOOL)currentUpdateSessionIsForced
{
  return self->_currentUpdateSessionIsForced;
}

- (void)setCurrentUpdateSessionIsForced:(BOOL)a3
{
  self->_currentUpdateSessionIsForced = a3;
}

- (VSUserAccountUpdateManager)updateManager
{
  return self->_updateManager;
}

- (void)setUpdateManager:(id)a3
{
}

- (WLKSettingsStore)sharedSettingsStore
{
  return self->_sharedSettingsStore;
}

- (void)setSharedSettingsStore:(id)a3
{
}

- (VSPrivacyFacade)privacyFacade
{
  return self->_privacyFacade;
}

- (void)setPrivacyFacade:(id)a3
{
}

- (NSDate)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (void)setLastUpdateTime:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (BOOL)storesLoaded
{
  return self->_storesLoaded;
}

- (void)setStoresLoaded:(BOOL)a3
{
  self->_storesLoaded = a3;
}

- (os_unfair_lock_s)loadingStoresLock
{
  return self->_loadingStoresLock;
}

- (void)setLoadingStoresLock:(os_unfair_lock_s)a3
{
  self->_loadingStoresLock = a3;
}

- (void).cxx_destruct
{
}

@end