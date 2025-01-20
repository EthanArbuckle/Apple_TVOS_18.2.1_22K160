@interface CKKSOperationDependencies
- (BOOL)considerSelfTrusted:(id)a3 error:(id *)a4;
- (BOOL)intransactionCKRecordChanged:(id)a3 resync:(BOOL)a4;
- (BOOL)intransactionCKRecordDeleted:(id)a3 recordType:(id)a4 resync:(BOOL)a5;
- (BOOL)intransactionCKWriteFailed:(id)a3 attemptedRecordsChanged:(id)a4;
- (BOOL)limitOperationToPriorityViewsSet;
- (BOOL)sendMetric;
- (BOOL)zoneModifierHalted;
- (CKDatabase)ckdatabase;
- (CKKSAccountStateTracker)accountStateTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSDatabaseProviderProtocol)databaseProvider;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)cloudkitRetryAfter;
- (CKKSNearFutureScheduler)requestPolicyCheck;
- (CKKSNearFutureScheduler)savedTLKNotifier;
- (CKKSOperationDependencies)initWithViewStates:(id)a3 contextID:(id)a4 activeAccount:(id)a5 ckdatabase:(id)a6 cloudKitClassDependencies:(id)a7 ckoperationGroup:(id)a8 flagHandler:(id)a9 overallLaunch:(id)a10 accountStateTracker:(id)a11 lockStateTracker:(id)a12 reachabilityTracker:(id)a13 peerProviders:(id)a14 databaseProvider:(id)a15 savedTLKNotifier:(id)a16 personaAdapter:(id)a17 sendMetric:(BOOL)a18;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKOperationGroup)ckoperationGroup;
- (CKOperationGroup)currentOutgoingQueueOperationGroup;
- (NSArray)peerProviders;
- (NSHashTable)keysetProviderOperations;
- (NSMutableSet)currentFetchReasons;
- (NSSet)activeManagedViews;
- (NSSet)allCKKSManagedViews;
- (NSSet)allExternalManagedViews;
- (NSSet)allPriorityViews;
- (NSSet)allViews;
- (NSSet)views;
- (NSSet)viewsOverride;
- (NSString)contextID;
- (OTPersonaAdapter)personaAdapter;
- (OctagonStateFlagHandler)flagHandler;
- (SecLaunchSequence)overallLaunch;
- (TPSpecificUser)activeAccount;
- (TPSyncingPolicy)syncingPolicy;
- (id)currentTrustStates;
- (id)keychainMusrForCurrentAccount;
- (id)readyAndSyncingViews;
- (id)viewNameForItem:(SecDbItem *)a3;
- (id)viewStateForName:(id)a3;
- (id)viewStatesByNames:(id)a3;
- (id)viewsInState:(id)a3;
- (void)applyNewSyncingPolicy:(id)a3 viewStates:(id)a4;
- (void)inspectErrorForRetryAfter:(id)a3;
- (void)limitOperationToPriorityViews;
- (void)operateOnAllViews;
- (void)operateOnSelectViews:(id)a3;
- (void)provideKeySets:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setAllPriorityViews:(id)a3;
- (void)setAllViews:(id)a3;
- (void)setCkdatabase:(id)a3;
- (void)setCkoperationGroup:(id)a3;
- (void)setCloudKitClassDependencies:(id)a3;
- (void)setCurrentOutgoingQueueOperationGroup:(id)a3;
- (void)setKeysetProviderOperations:(id)a3;
- (void)setLimitOperationToPriorityViewsSet:(BOOL)a3;
- (void)setPeerProviders:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setRequestPolicyCheck:(id)a3;
- (void)setSendMetric:(BOOL)a3;
- (void)setStateForActiveCKKSManagedViews:(id)a3;
- (void)setStateForActiveExternallyManagedViews:(id)a3;
- (void)setStateForActiveZones:(id)a3;
- (void)setStateForAllViews:(id)a3;
- (void)setSyncingPolicy:(id)a3;
- (void)setViewsOverride:(id)a3;
- (void)setZoneModifierHalted:(BOOL)a3;
@end

@implementation CKKSOperationDependencies

- (CKKSOperationDependencies)initWithViewStates:(id)a3 contextID:(id)a4 activeAccount:(id)a5 ckdatabase:(id)a6 cloudKitClassDependencies:(id)a7 ckoperationGroup:(id)a8 flagHandler:(id)a9 overallLaunch:(id)a10 accountStateTracker:(id)a11 lockStateTracker:(id)a12 reachabilityTracker:(id)a13 peerProviders:(id)a14 databaseProvider:(id)a15 savedTLKNotifier:(id)a16 personaAdapter:(id)a17 sendMetric:(BOOL)a18
{
  id v50 = a3;
  id v49 = a4;
  id v48 = a5;
  id v47 = a6;
  id v36 = a7;
  id v46 = a7;
  id v45 = a8;
  id v44 = a9;
  id v43 = a10;
  id v42 = a11;
  id v41 = a12;
  id v40 = a13;
  id v39 = a14;
  id v38 = a15;
  id v22 = a16;
  id v23 = a17;
  v52.receiver = self;
  v52.super_class = (Class)&OBJC_CLASS___CKKSOperationDependencies;
  v24 = -[CKKSOperationDependencies init](&v52, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_allViews, a3);
    objc_storeStrong((id *)&v25->_ckdatabase, a6);
    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, v36);
    objc_storeStrong((id *)&v25->_ckoperationGroup, a8);
    objc_storeStrong((id *)&v25->_flagHandler, a9);
    objc_storeStrong((id *)&v25->_overallLaunch, a10);
    objc_storeStrong((id *)&v25->_accountStateTracker, a11);
    objc_storeStrong((id *)&v25->_lockStateTracker, a12);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a13);
    objc_storeStrong((id *)&v25->_peerProviders, a14);
    objc_storeStrong((id *)&v25->_databaseProvider, a15);
    objc_storeStrong((id *)&v25->_savedTLKNotifier, a16);
    objc_storeStrong((id *)&v25->_contextID, a4);
    objc_storeStrong((id *)&v25->_activeAccount, a5);
    currentOutgoingQueueOperationGroup = v25->_currentOutgoingQueueOperationGroup;
    v25->_currentOutgoingQueueOperationGroup = 0LL;

    requestPolicyCheck = v25->_requestPolicyCheck;
    v25->_requestPolicyCheck = 0LL;

    uint64_t v28 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    keysetProviderOperations = v25->_keysetProviderOperations;
    v25->_keysetProviderOperations = (NSHashTable *)v28;

    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    currentFetchReasons = v25->_currentFetchReasons;
    v25->_currentFetchReasons = (NSMutableSet *)v30;

    v25->_limitOperationToPriorityViewsSet = 0;
    objc_storeStrong((id *)&v25->_personaAdapter, a17);
    v25->_sendMetric = a18;
    v32 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:qosClass:block:]( objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler),  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:qosClass:block:",  @"zonemodifier-ckretryafter",  100000000LL,  100000000LL,  0LL,  1005LL,  25LL,  1.0,  &stru_100284698);
    cloudkitRetryAfter = v25->_cloudkitRetryAfter;
    v25->_cloudkitRetryAfter = v32;
  }

  return v25;
}

- (NSSet)views
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies viewsOverride](self, "viewsOverride"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies viewsOverride](self, "viewsOverride"));
  }

  else if (-[CKKSOperationDependencies limitOperationToPriorityViewsSet](self, "limitOperationToPriorityViewsSet"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allPriorityViews](self, "allPriorityViews"));
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews"));
  }

  return (NSSet *)v4;
}

- (NSSet)activeManagedViews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)allCKKSManagedViews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSSet *)v3;
}

- (NSSet)allExternalManagedViews
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return (NSSet *)v3;
}

- (void)setStateForActiveZones:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setViewKeyHierarchyState:v4];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)setStateForActiveCKKSManagedViews:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)setStateForActiveExternallyManagedViews:(id)a3
{
  id v4 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
      }

      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v7);
  }
}

- (void)setStateForAllViews:(id)a3
{
  id v4 = a3;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setViewKeyHierarchyState:v4];
        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }

    while (v7);
  }
}

- (void)operateOnSelectViews:(id)a3
{
  id v4 = a3;
  -[CKKSOperationDependencies setViewsOverride:](self, "setViewsOverride:", v4);
  id v5 = sub_1000AA6AC(@"ckksviews", 0LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Limited view operation to %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)operateOnAllViews
{
  id v3 = sub_1000AA6AC(@"ckksviews", 0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Expanded view operation to %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)limitOperationToPriorityViews
{
  id v3 = sub_1000AA6AC(@"ckksviews", 0LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Limited view operation to priority views %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (id)viewsInState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 viewKeyHierarchyState]);
        unsigned int v13 = [v12 isEqualToString:v4];

        if (v13) {
          [v5 addObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)viewStatesByNames:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
        __int128 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 zoneID]);
        unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 zoneName]);
        unsigned int v14 = [v4 containsObject:v13];

        if (v14) {
          [v5 addObject:v11];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v5;
}

- (id)viewStateForName:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies allViews](self, "allViews", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        unsigned __int8 v12 = [v11 isEqualToString:v4];

        if ((v12 & 1) != 0)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }

      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

- (id)readyAndSyncingViews
{
  id v17 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies views](self, "views"));
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v8 ckksManagedView])
        {
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies syncingPolicy](self, "syncingPolicy"));
          __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
          __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
          if ([v9 isSyncingEnabledForView:v11])
          {
            uint64_t v12 = v6;
            unsigned int v13 = v3;
            __int128 v14 = self;
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v8 viewKeyHierarchyState]);
            unsigned int v18 = [v15 isEqualToString:@"ready"];

            self = v14;
            id v3 = v13;
            uint64_t v6 = v12;

            if (v18) {
              [v17 addObject:v8];
            }
          }

          else
          {
          }
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v5);
  }

  return v17;
}

- (void)applyNewSyncingPolicy:(id)a3 viewStates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v18 = self;
  -[CKKSOperationDependencies setSyncingPolicy:](self, "setSyncingPolicy:", v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      unsigned int v13 = 0LL;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        __int128 v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)v13);
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 priorityViews]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 zoneName]);
        unsigned int v17 = [v15 containsObject:v16];

        if (v17) {
          [v8 addObject:v14];
        }
        unsigned int v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v11);
  }

  -[CKKSOperationDependencies setAllPriorityViews:](v18, "setAllPriorityViews:", v8);
  -[CKKSOperationDependencies setAllViews:](v18, "setAllViews:", v9);
  -[CKKSOperationDependencies setViewsOverride:](v18, "setViewsOverride:", 0LL);
}

- (id)currentTrustStates
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies peerProviders](self, "peerProviders"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = sub_1000AA6AC(@"ckks", 0LL);
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int128 v19 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Fetching account keys for provider %@",  buf,  0xCu);
        }

        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 currentState]);
        [v3 addObject:v12];
      }

      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  return v3;
}

- (BOOL)considerSelfTrusted:(id)a3 error:(id *)a4
{
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = a3;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = *(void *)v19;
    while (2)
    {
      id v9 = 0LL;
      id v10 = v7;
      do
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v9);
        if (objc_msgSend(v11, "essential", (void)v18))
        {
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentSelfPeersError]);
          unsigned int v13 = v12;
          if (v12) {
            id v14 = v12;
          }
          else {
            id v14 = (id)objc_claimAutoreleasedReturnValue([v11 currentTrustedPeersError]);
          }
          uint64_t v7 = v14;

          if ([v11 essential])
          {
            __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v11 currentSelfPeersError]);
            if (v15)
            {
            }

            else
            {
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v11 currentTrustedPeersError]);

              if (!v16)
              {

                LOBYTE(v6) = 1;
                goto LABEL_23;
              }
            }
          }

          id v10 = v7;
        }

        else
        {
          uint64_t v7 = v10;
        }

        id v9 = (char *)v9 + 1;
      }

      while (v6 != v9);
      id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }

    if (a4 && v7)
    {
      id v10 = v7;
      LOBYTE(v6) = 0;
      *a4 = v10;
    }

    else
    {
      id v10 = v7;
    }
  }

  else
  {

    id v10 = 0LL;
  }

- (void)provideKeySets:(id)a3
{
  id v3 = a3;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);
  id v5 = [v4 countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneName]);
        id v12 = sub_1000AA6AC(@"ckkskey", v11);
        unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v30 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Providing keyset (%@) to listeners",  buf,  0xCu);
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v24 objects:v31 count:16];
    }

    while (v6);
  }

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies keysetProviderOperations](self, "keysetProviderOperations"));
  id v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v21;
    do
    {
      for (j = 0LL; j != v16; j = (char *)j + 1)
      {
        if (*(void *)v21 != v17) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)j) provideKeySets:v3];
      }

      id v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }

    while (v16);
  }
}

- (BOOL)intransactionCKRecordChanged:(id)a3 resync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = objc_autoreleasePoolPush();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"parentkeyref"]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"ckksfetch", v11);
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (!v14) {
      goto LABEL_7;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 recordChangeTag]);
    *(_DWORD *)buf = 138413058;
    v62 = v15;
    __int16 v63 = 2112;
    v64 = v16;
    __int16 v65 = 2112;
    v66 = v17;
    __int16 v67 = 2112;
    v68 = v8;
    __int128 v18 = "Processing record modification(%@): %@ changeTag: %@ parentKeyRef: %@";
    __int128 v19 = v13;
    uint32_t v20 = 42;
  }

  else
  {
    if (!v14) {
      goto LABEL_7;
    }
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordType]);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordID]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 recordChangeTag]);
    *(_DWORD *)buf = 138412802;
    v62 = v15;
    __int16 v63 = 2112;
    v64 = v16;
    __int16 v65 = 2112;
    v66 = v17;
    __int128 v18 = "Processing record modification(%@): %@ changeTag: %@";
    __int128 v19 = v13;
    uint32_t v20 = 32;
  }

  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);

LABEL_7:
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned int v22 = [v21 isEqual:@"item"];

  if (v22)
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v60 = 0LL;
    +[CKKSItem intransactionRecordChanged:contextID:resync:error:]( &OBJC_CLASS___CKKSItem,  "intransactionRecordChanged:contextID:resync:error:",  v6,  v23,  v4,  &v60);
    __int128 v24 = v60;
LABEL_11:
    __int128 v27 = v24;
    goto LABEL_12;
  }

  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned int v26 = [v25 isEqual:@"currentitem"];

  if (v26)
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v59 = 0LL;
    +[CKKSCurrentItemPointer intransactionRecordChanged:contextID:resync:error:]( &OBJC_CLASS___CKKSCurrentItemPointer,  "intransactionRecordChanged:contextID:resync:error:",  v6,  v23,  v4,  &v59);
    __int128 v24 = v59;
    goto LABEL_11;
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v6 recordType]);
  unsigned int v36 = [v35 isEqual:@"synckey"];

  if (v36)
  {
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
    v58 = 0LL;
    +[CKKSKey intransactionRecordChanged:contextID:resync:flagHandler:error:]( &OBJC_CLASS___CKKSKey,  "intransactionRecordChanged:contextID:resync:flagHandler:error:",  v6,  v23,  v4,  v37,  &v58);
    id v38 = v58;
LABEL_23:
    __int128 v27 = v38;

LABEL_12:
    if (v27)
    {
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v6 recordID]);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 zoneID]);
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
      id v31 = sub_1000AA6AC(@"ckksfetch", v30);
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 recordType]);
        *(_DWORD *)buf = 138412546;
        v62 = v33;
        __int16 v63 = 2112;
        v64 = v27;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Record modification(%@) failed:: %@",  buf,  0x16u);
      }

      goto LABEL_15;
    }

- (BOOL)intransactionCKRecordDeleted:(id)a3 recordType:(id)a4 resync:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  id v12 = sub_1000AA6AC(@"ckksfetch", v11);
  unsigned int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 recordName]);
    *(_DWORD *)buf = 138412546;
    id v34 = v9;
    __int16 v35 = 2112;
    unsigned int v36 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Processing record deletion(%@): %@",  buf,  0x16u);
  }

  if ([v9 isEqual:@"item"])
  {
    id v15 = &OBJC_CLASS___CKKSItem;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    uint64_t v32 = 0LL;
    uint64_t v17 = (id *)&v32;
    __int128 v18 = &v32;
    goto LABEL_13;
  }

  if ([v9 isEqual:@"currentitem"])
  {
    id v15 = &OBJC_CLASS___CKKSCurrentItemPointer;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    uint64_t v31 = 0LL;
    uint64_t v17 = (id *)&v31;
    __int128 v18 = &v31;
    goto LABEL_13;
  }

  if ([v9 isEqual:@"tlkshare"])
  {
    id v15 = &OBJC_CLASS___CKKSTLKShareRecord;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
    uint64_t v30 = 0LL;
    uint64_t v17 = (id *)&v30;
    __int128 v18 = &v30;
    goto LABEL_13;
  }

  if ([v9 isEqualToString:@"currentkey"])
  {
LABEL_19:
    BOOL v24 = 1;
    goto LABEL_20;
  }

  if (![v9 isEqual:@"devicestate"])
  {
    if (([v9 isEqualToString:@"manifest"] & 1) == 0)
    {
      unsigned int v26 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
      __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 zoneName]);
      id v28 = sub_1000AA6AC(@"ckksfetch", v27);
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v34 = v9;
        __int16 v35 = 2112;
        unsigned int v36 = (os_log_s *)v8;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "unknown record type: %@ %@", buf, 0x16u);
      }

      goto LABEL_17;
    }

    goto LABEL_19;
  }

  id v15 = &OBJC_CLASS___CKKSDeviceStateEntry;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies contextID](self, "contextID"));
  uint64_t v29 = 0LL;
  uint64_t v17 = (id *)&v29;
  __int128 v18 = &v29;
LABEL_13:
  -[__objc2_class intransactionRecordDeleted:contextID:resync:error:]( v15,  "intransactionRecordDeleted:contextID:resync:error:",  v8,  v16,  v5,  v18,  v29,  v30,  v31,  v32);
  __int128 v19 = (os_log_s *)*v17;

  if (!v19) {
    goto LABEL_19;
  }
  uint32_t v20 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 zoneName]);
  id v22 = sub_1000AA6AC(@"ckksfetch", v21);
  __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v34 = v8;
    __int16 v35 = 2112;
    unsigned int v36 = v19;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Record deletion(%@) failed:: %@", buf, 0x16u);
  }

LABEL_17:
  BOOL v24 = 0;
LABEL_20:

  return v24;
}

- (BOOL)intransactionCKWriteFailed:(id)a3 attemptedRecordsChanged:(id)a4
{
  id v5 = a3;
  id v72 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 userInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 domain]);
  if (![v8 isEqual:CKErrorDomain] || objc_msgSend(v5, "code") != (id)2)
  {

    goto LABEL_23;
  }

  if (!v7)
  {
LABEL_23:
    BOOL v19 = 0;
    goto LABEL_24;
  }

  id v69 = v5;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 allValues]);
  id v10 = [v9 countByEnumeratingWithState:&v89 objects:v101 count:16];
  v80 = v7;
  if (!v10)
  {

    goto LABEL_26;
  }

  id v11 = v10;
  uint64_t v12 = *(void *)v90;
  char v13 = 1;
  do
  {
    BOOL v14 = 0LL;
    do
    {
      if (*(void *)v90 != v12) {
        objc_enumerationMutation(v9);
      }
      id v15 = *(void **)(*((void *)&v89 + 1) + 8LL * (void)v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 domain]);
      if (![v16 isEqual:CKErrorDomain])
      {

LABEL_14:
        char v13 = 0;
        goto LABEL_15;
      }

      if ([v15 code] == (id)22 || objc_msgSend(v15, "code") == (id)14)
      {

        goto LABEL_15;
      }

      id v17 = [v15 code];

      if (v17 != (id)11) {
        goto LABEL_14;
      }
LABEL_15:
      BOOL v14 = (char *)v14 + 1;
    }

    while (v11 != v14);
    id v18 = [v9 countByEnumeratingWithState:&v89 objects:v101 count:16];
    id v11 = v18;
  }

  while (v18);

  if ((v13 & 1) == 0) {
    goto LABEL_50;
  }
LABEL_26:
  id v21 = sub_1000AA6AC(@"ckks", 0LL);
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Received a ServerRecordChanged error, attempting to update new records and delete unknown ones",  buf,  2u);
  }

  __int128 v87 = 0u;
  __int128 v88 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v7 allKeys]);
  id v78 = [v23 countByEnumeratingWithState:&v85 objects:v100 count:16];
  if (!v78)
  {

    goto LABEL_50;
  }

  int v24 = 0;
  id v25 = *(id *)v86;
  id obj = *(id *)v86;
  while (2)
  {
    unsigned int v26 = 0LL;
    while (2)
    {
      if (*(id *)v86 != v25) {
        objc_enumerationMutation(v23);
      }
      __int128 v27 = *(void **)(*((void *)&v85 + 1) + 8LL * (void)v26);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v27]);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
      if ([v29 isEqual:CKErrorDomain])
      {
        id v30 = [v28 code];

        if (v30 == (id)14)
        {
          uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v28 userInfo]);
          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey]);

          v33 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneID]);
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
          id v35 = sub_1000AA6AC(@"ckks", v34);
          unsigned int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);

          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v94 = v32;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "On error: updating our idea of: %@",  buf,  0xCu);
          }

          v24 |= -[CKKSOperationDependencies intransactionCKRecordChanged:resync:]( self,  "intransactionCKRecordChanged:resync:",  v32,  1LL);
          goto LABEL_44;
        }
      }

      else
      {
      }

      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
      id v37 = [v28 code];

      if (v37 == (id)11)
      {
        id v38 = v23;
        uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v72 objectForKeyedSubscript:v27]);
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v27 zoneID]);
        unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 zoneName]);
        id v41 = sub_1000AA6AC(@"ckks", v40);
        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);

        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v94 = v27;
          __int16 v95 = 2112;
          v96 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "On error: handling an unexpected delete of: %@ %@",  buf,  0x16u);
        }

        unsigned int v43 = (void *)objc_claimAutoreleasedReturnValue([v32 recordType]);
        v24 |= -[CKKSOperationDependencies intransactionCKRecordDeleted:recordType:resync:]( self,  "intransactionCKRecordDeleted:recordType:resync:",  v27,  v43,  1LL);

        __int128 v23 = v38;
        id v25 = obj;
LABEL_44:
      }

      unsigned int v26 = (char *)v26 + 1;
      uint64_t v7 = v80;
      if (v78 != v26) {
        continue;
      }
      break;
    }

    id v78 = [v23 countByEnumeratingWithState:&v85 objects:v100 count:16];
    if (v78) {
      continue;
    }
    break;
  }

  if ((v24 & 1) != 0)
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies flagHandler](self, "flagHandler"));
    [v44 _onqueueHandleFlag:@"process_incoming_queue"];

    BOOL v19 = 1;
    goto LABEL_79;
  }

- (id)viewNameForItem:(SecDbItem *)a3
{
  CFTypeRef cf = 0LL;
  id v5 = sub_1000E6EA4(a3, 0x10000LL, 0LL, (__CFString **)&cf);
  id v6 = v5;
  if (cf)
  {
    id v7 = sub_1000AA6AC(@"ckks", 0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFTypeRef v19 = cf;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Couldn't fetch attributes from item: %@",  buf,  0xCu);
    }

    CFTypeRef v9 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v9);
    }

    id v10 = 0LL;
  }

  else
  {
    -[__CFDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", a3->var1->var0, kSecClass);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies syncingPolicy](self, "syncingPolicy"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v11 mapDictionaryToView:v6]);

    if (v10)
    {
      id v12 = v10;
    }

    else
    {
      id v13 = sub_1000AA6AC(@"ckks", 0LL);
      BOOL v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies syncingPolicy](self, "syncingPolicy"));
        *(_DWORD *)buf = 138412547;
        CFTypeRef v19 = v15;
        __int16 v20 = 2113;
        id v21 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "No view returned from policy (%@): %{private}@",  buf,  0x16u);
      }
    }
  }

  return v10;
}

- (id)keychainMusrForCurrentAccount
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies activeAccount](self, "activeAccount"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 personaUniqueString]);

  if (v3)
  {
    BOOL v4 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v3);
    id v5 = v4;
    if (v4)
    {
      v9[0] = 0xAAAAAAAAAAAAAAAALL;
      v9[1] = 0xAAAAAAAAAAAAAAAALL;
      -[NSUUID getUUIDBytes:](v4, "getUUIDBytes:", v9);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v9, 16LL));
    }

    else
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue([v3 dataUsingEncoding:4]);
    }

    id v7 = (void *)v6;
  }

  else
  {
    if (qword_1002DEA70 != -1) {
      dispatch_once(&qword_1002DEA70, &stru_100286568);
    }
    id v7 = (void *)CFRetain((CFTypeRef)qword_1002DEA78);
  }

  return v7;
}

- (void)inspectErrorForRetryAfter:(id)a3
{
  id v4 = a3;
  double v5 = CKRetryAfterSecondsForError();
  if (v5 != 0.0)
  {
    double v6 = v5;
    unint64_t v7 = 1000000000 * (unint64_t)v5;
    id v8 = sub_1000AA6AC(@"ckkszonemodifier", 0LL);
    CFTypeRef v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 134218242;
      double v12 = v6;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "CK operation failed with rate-limit, scheduling delay for %.1f seconds: %@",  (uint8_t *)&v11,  0x16u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSOperationDependencies cloudkitRetryAfter](self, "cloudkitRetryAfter"));
    [v10 waitUntil:v7];
  }
}

- (NSSet)allPriorityViews
{
  return (NSSet *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAllPriorityViews:(id)a3
{
}

- (NSSet)allViews
{
  return (NSSet *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAllViews:(id)a3
{
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setActiveAccount:(id)a3
{
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (NSMutableSet)currentFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56LL, 1);
}

- (CKOperationGroup)ckoperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCkoperationGroup:(id)a3
{
}

- (CKDatabase)ckdatabase
{
  return (CKDatabase *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setCkdatabase:(id)a3
{
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setCloudKitClassDependencies:(id)a3
{
}

- (CKOperationGroup)currentOutgoingQueueOperationGroup
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCurrentOutgoingQueueOperationGroup:(id)a3
{
}

- (OctagonStateFlagHandler)flagHandler
{
  return (OctagonStateFlagHandler *)objc_getProperty(self, a2, 96LL, 1);
}

- (SecLaunchSequence)overallLaunch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 104LL, 1);
}

- (CKKSAccountStateTracker)accountStateTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 112LL, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 120LL, 1);
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 128LL, 1);
}

- (NSArray)peerProviders
{
  return (NSArray *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setPeerProviders:(id)a3
{
}

- (TPSyncingPolicy)syncingPolicy
{
  return (TPSyncingPolicy *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setSyncingPolicy:(id)a3
{
}

- (CKKSDatabaseProviderProtocol)databaseProvider
{
  return (CKKSDatabaseProviderProtocol *)objc_getProperty(self, a2, 152LL, 1);
}

- (CKKSNearFutureScheduler)savedTLKNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 160LL, 1);
}

- (CKKSNearFutureScheduler)requestPolicyCheck
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setRequestPolicyCheck:(id)a3
{
}

- (NSHashTable)keysetProviderOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setKeysetProviderOperations:(id)a3
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

- (CKKSNearFutureScheduler)cloudkitRetryAfter
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 184LL, 1);
}

- (NSSet)viewsOverride
{
  return (NSSet *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setViewsOverride:(id)a3
{
}

- (BOOL)limitOperationToPriorityViewsSet
{
  return self->_limitOperationToPriorityViewsSet;
}

- (void)setLimitOperationToPriorityViewsSet:(BOOL)a3
{
  self->_limitOperationToPriorityViewsSet = a3;
}

- (BOOL)zoneModifierHalted
{
  return self->_zoneModifierHalted;
}

- (void)setZoneModifierHalted:(BOOL)a3
{
  self->_zoneModifierHalted = a3;
}

- (void).cxx_destruct
{
}

@end