@interface PDApplyManager
- (PDApplyManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 accountManager:(id)a6 databaseRecreated:(BOOL)a7;
- (PDApplyNotificationController)notificationController;
- (id)_queue_featureApplicationWithIdentifier:(id)a3;
- (id)pushNotificationTopics;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_applicationsAreInDirtyStateWithCompletion:(id)a3;
- (void)_applicationsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4;
- (void)_authenticateApplyContext:(id)a3 completion:(id)a4;
- (void)_handleApplyResponse:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_paymentWebServiceContextChanged;
- (void)_postApplicationsChangedNotification;
- (void)_processAddedApplications:(id)a3;
- (void)_processChangedApplications:(id)a3;
- (void)_processDeletedApplications:(id)a3;
- (void)_queue_deleteApplications;
- (void)_queue_deleteApplicationsForAccountIdentifier:(id)a3;
- (void)_queue_mergeApplications:(id)a3 featureFailures:(id)a4;
- (void)_queue_mergeApplications:(id)a3 forAccountIdentifier:(id)a4;
- (void)_queue_performNextApplicationsUpdate;
- (void)_queue_updateApplicationsForAccountIdentifier:(id)a3 withCompletionBlocks:(id)a4 completion:(id)a5;
- (void)_queue_updateApplicationsWithRequests:(id)a3 completion:(id)a4;
- (void)_silentlyShareClaimForApplication:(id)a3 completion:(id)a4;
- (void)_updateApplicationWithIdentifier:(id)a3 completionBlocks:(id)a4;
- (void)_updateApplicationsFromPush:(BOOL)a3 completion:(id)a4;
- (void)_updateCachedAccountApplications;
- (void)_updatePushTopics;
- (void)accountManager:(id)a3 didAddAccount:(id)a4;
- (void)accountManager:(id)a3 didRemoveAccount:(id)a4;
- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5;
- (void)applicationIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)applicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)applicationWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)applicationsForAccountIdentifier:(id)a3 withCompletion:(id)a4;
- (void)applicationsForAccountIdentifierAreInDirtyState:(id)a3 completion:(id)a4;
- (void)applicationsWithCompletion:(id)a3;
- (void)applyPushNotificationToken:(id)a3;
- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5;
- (void)databaseRestored;
- (void)dealloc;
- (void)deleteApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)deleteApplicationsWithCompletion:(id)a3;
- (void)deleteLocalApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)insertOrReplaceApplication:(id)a3 completion:(id)a4;
- (void)mergeApplications:(id)a3 completion:(id)a4;
- (void)mergeApplications:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)noteAccountDeletionWithCompletion:(id)a3;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)queuePerformNextApplicationUpdateWithIdentifier:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setNotificationController:(id)a3;
- (void)submitApplyRequest:(id)a3 completion:(id)a4;
- (void)submitDeleteRequest:(id)a3 completion:(id)a4;
- (void)submitDocumentRequest:(id)a3 completion:(id)a4;
- (void)submitTermsRequest:(id)a3 completion:(id)a4;
- (void)submitVerificationRequest:(id)a3 completion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateApplicationWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateApplicationsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateApplicationsWithCompletion:(id)a3;
@end

@implementation PDApplyManager

- (PDApplyManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 accountManager:(id)a6 databaseRecreated:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v90.receiver = self;
  v90.super_class = (Class)&OBJC_CLASS___PDApplyManager;
  v17 = -[PDApplyManager init](&v90, "init");
  v18 = v17;
  if (v17)
  {
    v79 = v15;
    id v80 = v14;
    id v81 = v13;
    v17->_databaseWillRestore = a7;
    v17->_lockPushTopics._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_t v19 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v19);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.passd.apply.manager", v20);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v21;

    v77 = v20;
    dispatch_queue_t v23 = dispatch_queue_create("com.apple.passd.apply.reply", v20);
    replyQueue = v18->_replyQueue;
    v18->_replyQueue = (OS_dispatch_queue *)v23;

    objc_storeStrong((id *)&v18->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v18->_databaseManager, a5);
    objc_storeStrong((id *)&v18->_accountManager, a6);
    objc_storeStrong((id *)&v18->_paymentWebServiceCoordinator, a4);
    -[PDPaymentWebServiceCoordinator registerObserver:](v18->_paymentWebServiceCoordinator, "registerObserver:", v18);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator applyServicePushTopics]( v18->_paymentWebServiceCoordinator,  "applyServicePushTopics"));
    pushNotificationTopics = v18->_pushNotificationTopics;
    v18->_pushNotificationTopics = (NSSet *)v25;

    -[PDPushNotificationManager registerConsumer:](v18->_pushNotificationManager, "registerConsumer:", v18);
    v27 = (void *)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator sharedWebServiceContext]( v18->_paymentWebServiceCoordinator,  "sharedWebServiceContext"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 regions]);

    v29 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    id v30 = v28;
    id v31 = [v30 countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v31)
    {
      id v32 = v31;
      uint64_t v33 = *(void *)v87;
      do
      {
        for (i = 0LL; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v87 != v33) {
            objc_enumerationMutation(v30);
          }
          uint64_t v35 = *(void *)(*((void *)&v86 + 1) + 8LL * (void)i);
          v36 = (void *)objc_claimAutoreleasedReturnValue([v30 objectForKey:v35]);
          v37 = v36;
          if (v18->_hasApplications) {
            unsigned __int8 v38 = 1;
          }
          else {
            unsigned __int8 v38 = [v36 hasApplications];
          }
          v18->_hasApplications = v38;
          v39 = (void *)objc_claimAutoreleasedReturnValue([v37 applyServiceURL]);
          if (v39) {
            -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v39, v35);
          }
        }

        id v32 = [v30 countByEnumeratingWithState:&v86 objects:v92 count:16];
      }

      while (v32);
    }

    v78 = v16;
    v75 = v30;

    v76 = v29;
    v40 = (NSDictionary *)-[NSMutableDictionary copy](v29, "copy");
    applyServiceURLs = v18->_applyServiceURLs;
    v18->_applyServiceURLs = v40;

    v74 = v18;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager accounts](v18->_databaseManager, "accounts"));
    v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v44 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    id v45 = v42;
    id v46 = [v45 countByEnumeratingWithState:&v82 objects:v91 count:16];
    if (v46)
    {
      id v47 = v46;
      uint64_t v48 = *(void *)v83;
      do
      {
        for (j = 0LL; j != v47; j = (char *)j + 1)
        {
          if (*(void *)v83 != v48) {
            objc_enumerationMutation(v45);
          }
          v50 = *(void **)(*((void *)&v82 + 1) + 8LL * (void)j);
          v51 = (void *)objc_claimAutoreleasedReturnValue([v50 accountIdentifier]);
          v52 = (void *)objc_claimAutoreleasedReturnValue([v50 applyServiceURL]);
          if (v52) {
            -[NSMutableDictionary setObject:forKey:](v43, "setObject:forKey:", v52, v51);
          }
          v53 = (void *)objc_claimAutoreleasedReturnValue([v50 additionalPushTopics]);
          v54 = (void *)objc_claimAutoreleasedReturnValue([v53 applications]);

          if (v54) {
            -[NSMutableDictionary setObject:forKey:](v44, "setObject:forKey:", v54, v51);
          }
        }

        id v47 = [v45 countByEnumeratingWithState:&v82 objects:v91 count:16];
      }

      while (v47);
    }

    accountApplyServiceURLs = v74->_accountApplyServiceURLs;
    v74->_accountApplyServiceURLs = v43;
    v56 = v43;

    accountPushNotificationTopics = v74->_accountPushNotificationTopics;
    v74->_accountPushNotificationTopics = v44;
    v58 = v44;

    id v15 = v79;
    v59 = (void *)objc_claimAutoreleasedReturnValue([v79 featureApplications]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v59 allObjects]);

    v61 = -[NSMutableArray initWithArray:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithArray:", v60);
    applications = v74->_applications;
    v74->_applications = v61;

    -[PDApplyManager _updateCachedAccountApplications](v74, "_updateCachedAccountApplications");
    v63 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingAccountApplicationsUpdateBlocks = v74->_pendingAccountApplicationsUpdateBlocks;
    v74->_pendingAccountApplicationsUpdateBlocks = v63;

    v65 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingApplicationsUpdateBlocks = v74->_pendingApplicationsUpdateBlocks;
    v74->_pendingApplicationsUpdateBlocks = v65;

    v67 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    applicationsBeingUpdated = v74->_applicationsBeingUpdated;
    v74->_applicationsBeingUpdated = v67;

    v69 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    pendingApplicationUpdateBlocks = v74->_pendingApplicationUpdateBlocks;
    v74->_pendingApplicationUpdateBlocks = v69;

    uint64_t v71 = objc_claimAutoreleasedReturnValue( +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality]( &OBJC_CLASS___NSHashTable,  "pk_weakObjectsHashTableUsingPointerPersonality"));
    observers = v74->_observers;
    v74->_observers = (NSHashTable *)v71;

    v74->_lockObservers._os_unfair_lock_opaque = 0;
    [v78 registerObserver:v74];

    id v16 = v78;
    v18 = v74;

    id v14 = v80;
    id v13 = v81;
  }

  return v18;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PDApplyManager;
  -[PDApplyManager dealloc](&v3, "dealloc");
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable addObject:](self->_observers, "addObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_observers, "allObjects"));
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100281F0C;
    v8[3] = &unk_10063AC90;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)replyQueue, v8);
  }
}

- (void)databaseRestored
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100282058;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_mergeApplications:(id)a3 featureFailures:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  unsigned __int8 v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  v36 = self;
  obj = self->_applications;
  id v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v47,  v53,  16LL);
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v48;
    id v39 = v6;
    do
    {
      v11 = 0LL;
      id v40 = v9;
      do
      {
        if (*(void *)v48 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v47 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "errorForFeature:", objc_msgSend(v12, "feature", v35)));
        if (v13)
        {
          -[NSMutableArray addObject:](v42, "addObject:", v12);
          goto LABEL_25;
        }

        if (![v7 count]) {
          goto LABEL_22;
        }
        uint64_t v14 = 0LL;
        while (1)
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v14]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationIdentifier]);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v15 applicationIdentifier]);
          id v18 = v16;
          id v19 = v17;
          if (v18 == v19) {
            break;
          }
          v20 = v19;
          if (v18 && v19)
          {
            unsigned __int8 v21 = [v18 isEqualToString:v19];

            if ((v21 & 1) != 0) {
              goto LABEL_19;
            }
          }

          else
          {
          }
        }

LABEL_19:
        if (v15)
        {
          [v7 removeObjectAtIndex:v14];
          if ([v15 applicationState] != (id)15)
          {
            -[NSMutableArray addObject:](v42, "addObject:", v15);
            id v9 = v40;
            if ((PKEqualObjects(v15, v12) & 1) == 0)
            {
              v52[0] = v12;
              v52[1] = v15;
              v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v52,  2LL));
              -[NSMutableArray addObject:](v37, "addObject:", v22);
            }

            id v6 = v39;
            goto LABEL_24;
          }

          -[NSMutableArray addObject:](v38, "addObject:", v12);
        }

        else
        {
LABEL_22:
          -[NSMutableArray addObject:](v38, "addObject:", v12);
          id v15 = 0LL;
        }

        id v6 = v39;
        id v9 = v40;
LABEL_24:

LABEL_25:
        v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v47,  v53,  16LL);
      id v9 = v23;
    }

    while (v23);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  id v24 = v7;
  id v25 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
  v26 = v35;
  if (v25)
  {
    id v27 = v25;
    uint64_t v28 = *(void *)v44;
    do
    {
      for (i = 0LL; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v44 != v28) {
          objc_enumerationMutation(v24);
        }
        id v30 = *(void **)(*((void *)&v43 + 1) + 8LL * (void)i);
        if (objc_msgSend(v30, "applicationState", v35) != (id)15)
        {
          -[NSMutableArray addObject:](v26, "addObject:", v30);
          -[NSMutableArray addObject:](v42, "addObject:", v30);
        }
      }

      id v27 = [v24 countByEnumeratingWithState:&v43 objects:v51 count:16];
    }

    while (v27);
  }

  id v31 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[PDDatabaseManager setFeatureApplications:](v36->_databaseManager, "setFeatureApplications:", v42));
  uint64_t v33 = -[NSMutableArray initWithArray:](v31, "initWithArray:", v32);
  applications = v36->_applications;
  v36->_applications = v33;

  -[PDApplyManager _updateCachedAccountApplications](v36, "_updateCachedAccountApplications");
  -[PDApplyManager _processAddedApplications:](v36, "_processAddedApplications:", v26);
  -[PDApplyManager _processDeletedApplications:](v36, "_processDeletedApplications:", v38);
  -[PDApplyManager _processChangedApplications:](v36, "_processChangedApplications:", v37);
  if (-[NSMutableArray count](v26, "count")
    || -[NSMutableArray count](v38, "count")
    || -[NSMutableArray count](v37, "count"))
  {
    -[PDApplyManager _postApplicationsChangedNotification](v36, "_postApplicationsChangedNotification", v35);
  }
}

- (void)_queue_mergeApplications:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 mutableCopy];
  id v32 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v37 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v35 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v31 = self;
  uint64_t v33 = v6;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_accountApplications,  "objectForKeyedSubscript:",  v6));
  id v8 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v43;
    do
    {
      v11 = 0LL;
      do
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v42 + 1) + 8LL * (void)v11);
        if (![v7 count]) {
          goto LABEL_20;
        }
        uint64_t v13 = 0LL;
        while (1)
        {
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:v13]);
          id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 applicationIdentifier]);
          id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 applicationIdentifier]);
          id v17 = v15;
          id v18 = v16;
          if (v17 == v18) {
            break;
          }
          id v19 = v18;
          if (v17 && v18)
          {
            unsigned __int8 v20 = [v17 isEqualToString:v18];

            if ((v20 & 1) != 0) {
              goto LABEL_17;
            }
          }

          else
          {
          }
        }

LABEL_17:
        if (v14)
        {
          [v7 removeObjectAtIndex:v13];
          if ([v14 applicationState] == (id)15)
          {
            -[NSMutableArray addObject:](v37, "addObject:", v12);
          }

          else
          {
            -[NSMutableArray addObject:](v35, "addObject:", v14);
            if ((PKEqualObjects(v14, v12) & 1) == 0)
            {
              v47[0] = v12;
              v47[1] = v14;
              unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  v47,  2LL));
              -[NSMutableArray addObject:](v34, "addObject:", v21);
            }
          }
        }

        else
        {
LABEL_20:
          -[NSMutableArray addObject:](v37, "addObject:", v12);
          uint64_t v14 = 0LL;
        }

        v11 = (char *)v11 + 1;
      }

      while (v11 != v9);
      id v22 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
      id v9 = v22;
    }

    while (v22);
  }

  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  id v23 = v7;
  id v24 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v39 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        if ([v28 applicationState] != (id)15)
        {
          -[NSMutableArray addObject:](v32, "addObject:", v28);
          -[NSMutableArray addObject:](v35, "addObject:", v28);
        }
      }

      id v25 = [v23 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }

    while (v25);
  }

  v29 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager setFeatureApplications:forAccountIdentifier:]( v31->_databaseManager,  "setFeatureApplications:forAccountIdentifier:",  v35,  v33));
  id v30 = [v29 mutableCopy];

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v31->_accountApplications,  "setObject:forKeyedSubscript:",  v30,  v33);
  -[PDApplyManager _processAddedApplications:](v31, "_processAddedApplications:", v32);
  -[PDApplyManager _processDeletedApplications:](v31, "_processDeletedApplications:", v37);
  -[PDApplyManager _processChangedApplications:](v31, "_processChangedApplications:", v34);
}

- (void)mergeApplications:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100282A4C;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)mergeApplications:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100282BAC;
  v15[3] = &unk_10063B440;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)insertOrReplaceApplication:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100282CE8;
    block[3] = &unk_100639AF0;
    id v10 = v6;
    v11 = self;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)deleteLocalApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100283048;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)noteAccountDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1002833A4;
  v22[3] = &unk_1006396D8;
  v22[4] = self;
  [v5 addOperation:v22];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = self->_accountApplications;
  id v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)v10);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472LL;
        v17[2] = sub_100283470;
        v17[3] = &unk_10063CB08;
        v17[4] = self;
        v17[5] = v11;
        [v5 addOperation:v17];
        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v18,  v23,  16LL);
    }

    while (v8);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100283548;
  v15[3] = &unk_10063F4B8;
  id v16 = v4;
  id v13 = v4;
  id v14 = [v5 evaluateWithInput:v12 completion:v15];
}

- (void)deleteApplicationsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1002835D8;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)deleteApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100283710;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_deleteApplications
{
  id v3 = -[NSMutableArray copy](self->_applications, "copy");
  -[PDDatabaseManager deleteAllFeatureApplications](self->_databaseManager, "deleteAllFeatureApplications");
  -[NSMutableArray removeAllObjects](self->_applications, "removeAllObjects");
  -[PDApplyManager _postApplicationsChangedNotification](self, "_postApplicationsChangedNotification");
  -[PDApplyManager _processDeletedApplications:](self, "_processDeletedApplications:", v3);
}

- (void)_queue_deleteApplicationsForAccountIdentifier:(id)a3
{
  accountApplications = self->_accountApplications;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](accountApplications, "objectForKeyedSubscript:", v5));
  id v7 = [v6 copy];

  -[PDDatabaseManager deleteFeatureApplicationsWithAccountIdentifier:]( self->_databaseManager,  "deleteFeatureApplicationsWithAccountIdentifier:",  v5);
  -[NSMutableDictionary removeObjectForKey:](self->_accountApplications, "removeObjectForKey:", v5);

  -[PDApplyManager _processDeletedApplications:](self, "_processDeletedApplications:", v7);
}

- (void)_processAddedApplications:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1002838F8;
  v5[3] = &unk_1006512E8;
  id v6 = a3;
  id v7 = self;
  id v4 = v6;
  -[PDApplyManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v5);
}

- (void)_processChangedApplications:(id)a3
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100283CEC;
  v25[3] = &unk_1006512E8;
  id v4 = a3;
  id v26 = v4;
  id v27 = self;
  -[PDApplyManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v25);
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v10 count] == (id)2)
        {
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:0]);
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndexedSubscript:1]);
          if ([v11 applicationState] == (id)5
            && [v11 applicationStateReason] == (id)8
            && [v12 applicationState] == (id)4)
          {
            uint64_t Object = PKLogFacilityTypeGetObject(13LL);
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Silently share claim because application went from pending - manual idv review to open",  buf,  2u);
            }

            v17[0] = _NSConcreteStackBlock;
            v17[1] = 3221225472LL;
            v17[2] = sub_100283E5C;
            v17[3] = &unk_1006417C8;
            v17[4] = self;
            id v15 = v12;
            id v18 = v15;
            id v19 = v11;
            -[PDApplyManager _silentlyShareClaimForApplication:completion:]( self,  "_silentlyShareClaimForApplication:completion:",  v15,  v17);

            goto LABEL_21;
          }

          if ([v12 feature] == (id)5)
          {
            if ([v12 applicationState] == (id)5 && objc_msgSend(v11, "applicationState") != (id)5)
            {
              uint64_t v16 = 2LL;
LABEL_20:
              PKSavingsSetHasDismissedPendingApplicationMessage(v16);
            }

            else if ([v12 applicationState] != (id)5 && objc_msgSend(v11, "applicationState") == (id)5)
            {
              uint64_t v16 = 0LL;
              goto LABEL_20;
            }
          }

- (void)_processDeletedApplications:(id)a3
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1002840DC;
  v14[3] = &unk_1006512E8;
  id v4 = a3;
  id v15 = v4;
  uint64_t v16 = self;
  -[PDApplyManager _accessObserversWithHandler:](self, "_accessObserversWithHandler:", v14);
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "feature", (void)v10) == (id)5) {
          PKSavingsSetHasDismissedPendingApplicationMessage(0LL);
        }
        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v17 count:16];
    }

    while (v7);
  }
}

- (void)_postApplicationsChangedNotification
{
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Posting PKApplyServiceApplicationsChangedDistributedNotification",  v5,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDistributedNotificationCenter defaultCenter]( &OBJC_CLASS___NSDistributedNotificationCenter,  "defaultCenter"));
  [v4 postNotificationName:PKApplyServiceApplicationsChangedDistributedNotification object:0];
}

- (void)_applicationsAreInDirtyStateWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100284318;
  v7[3] = &unk_10063AC90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)workQueue, v7);
}

- (void)_applicationsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10028459C;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)applicationsForAccountIdentifierAreInDirtyState:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100284844;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)applicationIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100284AC4;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)applicationsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100284CC8;
    v7[3] = &unk_10063AC90;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)workQueue, v7);
  }
}

- (void)applicationsForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100284F04;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)applicationWithReferenceIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100285070;
    block[3] = &unk_100639AF0;
    id v10 = v6;
    id v11 = self;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)applicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1002852CC;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)updateApplicationsWithCompletion:(id)a3
{
}

- (void)_updateApplicationsFromPush:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002854E4;
  block[3] = &unk_100644C20;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a3;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)updateApplicationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100285664;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_queue_performNextApplicationsUpdate
{
  if (!self->_isUpdatingApplications)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = &v15;
    uint64_t v17 = 0x2020000000LL;
    char v18 = 0;
    id v3 = -[NSMutableArray copy](self->_pendingApplicationsUpdateBlocks, "copy");
    if ([v3 count]) {
      *((_BYTE *)v16 + 24) = 1;
    }
    id v4 = -[NSMutableDictionary copy](self->_pendingAccountApplicationsUpdateBlocks, "copy");
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1002859E4;
    v14[3] = &unk_100651338;
    void v14[4] = &v15;
    [v4 enumerateKeysAndObjectsUsingBlock:v14];
    if (*((_BYTE *)v16 + 24))
    {
      id v5 = objc_alloc_init(&OBJC_CLASS___PKAsyncUnaryOperationComposer);
      if ([v3 count])
      {
        -[NSMutableArray removeAllObjects](self->_pendingApplicationsUpdateBlocks, "removeAllObjects");
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472LL;
        v12[2] = sub_100285A1C;
        v12[3] = &unk_10063CB08;
        v12[4] = self;
        id v13 = v3;
        [v5 addOperation:v12];
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_100285B00;
      v10[3] = &unk_10063EA48;
      v10[4] = self;
      id v6 = v5;
      id v11 = v6;
      [v4 enumerateKeysAndObjectsUsingBlock:v10];
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = sub_100285CC8;
      v9[3] = &unk_100643EA0;
      v9[4] = self;
      id v8 = [v6 evaluateWithInput:v7 completion:v9];
    }

    _Block_object_dispose(&v15, 8);
  }

- (void)_queue_updateApplicationsWithRequests:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating applications", buf, 2u);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_100285F98;
  v40[3] = &unk_100651360;
  v40[4] = self;
  id v10 = v6;
  id v41 = v10;
  id v11 = v7;
  id v42 = v11;
  id v12 = objc_retainBlock(v40);
  id v13 = -[NSMutableArray count](self->_applications, "count");
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  char v39 = 0;
  *(void *)buf = 0LL;
  uint64_t v33 = buf;
  uint64_t v34 = 0x3032000000LL;
  uint64_t v35 = sub_100286170;
  v36 = sub_100286180;
  id v37 = 0LL;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x3032000000LL;
  v30[3] = sub_100286170;
  v30[4] = sub_100286180;
  id v31 = 0LL;
  id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  BOOL v15 = v13 == 0LL;
  workQueue = self->_workQueue;
  char v17 = !v15;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100286188;
  v21[3] = &unk_100651478;
  id v22 = v10;
  __int128 v23 = self;
  id v26 = v38;
  id v27 = v30;
  __int128 v24 = v14;
  id v25 = v12;
  uint64_t v28 = buf;
  char v29 = v17;
  char v18 = v14;
  id v19 = v12;
  id v20 = v10;
  dispatch_async((dispatch_queue_t)workQueue, v21);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v38, 8);
}

- (void)_queue_updateApplicationsForAccountIdentifier:(id)a3 withCompletionBlocks:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Updating applications for account %@",  (uint8_t *)&buf,  0xCu);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100287180;
  v30[3] = &unk_100648010;
  v30[4] = self;
  id v13 = v8;
  id v31 = v13;
  id v14 = v9;
  id v32 = v14;
  id v15 = v10;
  id v33 = v15;
  uint64_t v16 = objc_retainBlock(v30);
  char v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_accountApplyServiceURLs, "objectForKey:", v13));
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v35 = 0x3032000000LL;
  v36 = sub_100286170;
  id v37 = sub_100286180;
  id v38 = 0LL;
  char v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  workQueue = self->_workQueue;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100287348;
  v24[3] = &unk_100641190;
  v24[4] = self;
  id v25 = v17;
  id v26 = v13;
  id v27 = v18;
  id v28 = v16;
  p___int128 buf = &buf;
  id v20 = v16;
  __int128 v21 = v18;
  id v22 = v13;
  id v23 = v17;
  dispatch_async((dispatch_queue_t)workQueue, v24);

  _Block_object_dispose(&buf, 8);
}

- (void)updateApplicationWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100287AA4;
    block[3] = &unk_100639AF0;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async((dispatch_queue_t)workQueue, block);
  }
}

- (void)queuePerformNextApplicationUpdateWithIdentifier:(id)a3
{
  id v6 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_pendingApplicationUpdateBlocks, "objectForKey:", v6));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationsBeingUpdated, "objectForKey:", v6));
  if (v5)
  {
  }

  else if ([v4 count])
  {
    -[NSMutableDictionary removeObjectForKey:](self->_pendingApplicationUpdateBlocks, "removeObjectForKey:", v6);
    -[NSMutableDictionary setObject:forKey:]( self->_applicationsBeingUpdated,  "setObject:forKey:",  &__kCFBooleanTrue,  v6);
    -[PDApplyManager _updateApplicationWithIdentifier:completionBlocks:]( self,  "_updateApplicationWithIdentifier:completionBlocks:",  v6,  v4);
  }
}

- (void)_updateApplicationWithIdentifier:(id)a3 completionBlocks:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543362;
    id v22 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Updating application with identifier %{public}@",  buf,  0xCu);
  }

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100287D48;
  v18[3] = &unk_1006417C8;
  v18[4] = self;
  id v10 = v6;
  id v19 = v10;
  id v20 = v7;
  id v11 = v7;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100287F88;
  v14[3] = &unk_1006515B8;
  id v15 = v10;
  uint64_t v16 = self;
  char v17 = objc_retainBlock(v18);
  id v12 = v17;
  id v13 = v10;
  -[PDApplyManager applicationWithIdentifier:completion:](self, "applicationWithIdentifier:completion:", v13, v14);
}

- (void)augmentedProductForInstallmentConfiguration:(id)a3 experimentDetails:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Fetching Augmented Product", buf, 2u);
  }

  workQueue = self->_workQueue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100288418;
  v17[3] = &unk_10063B440;
  id v18 = v8;
  id v19 = v9;
  id v20 = self;
  id v21 = v10;
  id v14 = v10;
  id v15 = v9;
  id v16 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v17);
}

- (void)_paymentWebServiceContextChanged
{
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Payment Web Service context changed in PDApplyManager",  buf,  2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002886EC;
  block[3] = &unk_100639300;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_updatePushTopics
{
  id obj = (id)objc_claimAutoreleasedReturnValue( -[PDPaymentWebServiceCoordinator applyServicePushTopics]( self->_paymentWebServiceCoordinator,  "applyServicePushTopics"));
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v3 = -[NSSet copy](self->_pushNotificationTopics, "copy");
  accountPushNotificationTopics = self->_accountPushNotificationTopics;
  if (accountPushNotificationTopics)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](accountPushNotificationTopics, "allValues"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([obj setByAddingObjectsFromArray:v5]);

    id v7 = (void *)v6;
  }

  else
  {
    id v7 = obj;
  }

  id obja = v7;
  objc_storeStrong((id *)&self->_pushNotificationTopics, v7);
  char v8 = PKEqualObjects(v3, self->_pushNotificationTopics);
  os_unfair_lock_unlock(&self->_lockPushTopics);

  if ((v8 & 1) == 0) {
    -[PDPushNotificationManager recalculatePushTopics](self->_pushNotificationManager, "recalculatePushTopics");
  }
}

- (id)_queue_featureApplicationWithIdentifier:(id)a3
{
  id v4 = a3;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v5 = self->_applications;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v41;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v41 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
      id v11 = (id)objc_claimAutoreleasedReturnValue([v10 applicationIdentifier]);
      id v12 = v4;
      id v13 = v12;
      if (v11 == v12) {
        break;
      }
      if (v4 && v11)
      {
        unsigned __int8 v14 = [v11 isEqualToString:v12];

        if ((v14 & 1) != 0) {
          goto LABEL_16;
        }
      }

      else
      {
      }

      if (v7 == (id)++v9)
      {
        id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v40,  v46,  16LL);
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_14;
      }
    }

LABEL_16:
    id v15 = v10;

    if (v15) {
      goto LABEL_42;
    }
  }

  else
  {
LABEL_14:
  }

  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_accountApplications, "allValues"));
  id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v37;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        char v17 = *(void **)(*((void *)&v36 + 1) + 8LL * (void)i);
        __int128 v32 = 0u;
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        id v18 = v17;
        id v19 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v33;
LABEL_24:
          uint64_t v22 = 0LL;
          while (1)
          {
            if (*(void *)v33 != v21) {
              objc_enumerationMutation(v18);
            }
            id v23 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
            id v24 = (id)objc_claimAutoreleasedReturnValue([v23 applicationIdentifier]);
            id v25 = v4;
            id v26 = v25;
            if (v24 == v25) {
              break;
            }
            if (v4 && v24)
            {
              unsigned __int8 v27 = [v24 isEqualToString:v25];

              if ((v27 & 1) != 0) {
                goto LABEL_37;
              }
            }

            else
            {
            }

            if (v20 == (id)++v22)
            {
              id v20 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v20) {
                goto LABEL_24;
              }
              goto LABEL_35;
            }
          }

LABEL_37:
          id v15 = v23;

          if (v15) {
            goto LABEL_41;
          }
        }

        else
        {
LABEL_35:
        }
      }

      id v31 = [obj countByEnumeratingWithState:&v36 objects:v45 count:16];
    }

    while (v31);
  }

  id v15 = 0LL;
LABEL_41:

LABEL_42:
  return v15;
}

- (void)_updateCachedAccountApplications
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v4 = self->_accountApplyServiceURLs;
  id v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
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
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v10 = (void *)objc_claimAutoreleasedReturnValue( -[PDDatabaseManager featureApplicationsWithAccountIdentifier:]( self->_databaseManager,  "featureApplicationsWithAccountIdentifier:",  v9,  (void)v14));
        id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allObjects]);

        id v12 = [v11 mutableCopy];
        -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", v12, v9);
      }

      id v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v6);
  }

  accountApplications = self->_accountApplications;
  self->_accountApplications = v3;
}

- (void)submitApplyRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002891E8;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_authenticateApplyContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Apply request requires authentication", buf, 2u);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 authenticationCrediential]);
  if (v10)
  {
    replyQueue = self->_replyQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100289638;
    v13[3] = &unk_100651678;
    id v14 = v6;
    id v15 = v7;
    PKPersistentBAACertificateAndKey(v10, replyQueue, v13);

    id v12 = v14;
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKApplyErrorDomain,  1LL,  0LL));
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0LL, 0LL, v12);
  }
}

- (void)submitDocumentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002898D8;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)submitVerificationRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100289AA8;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)submitTermsRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100289C78;
  block[3] = &unk_100639AF0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)submitDeleteRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10028A028;
  block[3] = &unk_10063C450;
  id v12 = v6;
  id v13 = v7;
  void block[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

- (void)_handleApplyResponse:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10028A484;
  v15[3] = &unk_10063BA88;
  id v16 = v8;
  __int128 v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v9;
  id v13 = v10;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)workQueue, v15);
}

- (void)_silentlyShareClaimForApplication:(id)a3 completion:(id)a4
{
}

- (void)accountManager:(id)a3 didAddAccount:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10028A7BC;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (void)accountManager:(id)a3 didRemoveAccount:(id)a4
{
  id v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10028A950;
  v8[3] = &unk_1006392B0;
  id v9 = v5;
  id v10 = self;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)workQueue, v8);
}

- (void)accountManager:(id)a3 didUpdateAccount:(id)a4 oldAccount:(id)a5
{
  id v6 = a4;
  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10028AA54;
  v9[3] = &unk_1006392B0;
  id v10 = v6;
  id v11 = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)workQueue, v9);
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  pushNotificationTopics = self->_pushNotificationTopics;
  if (pushNotificationTopics) {
    id v5 = -[NSSet copy](pushNotificationTopics, "copy");
  }
  else {
    id v5 = 0LL;
  }
  accountPushNotificationTopics = self->_accountPushNotificationTopics;
  if (accountPushNotificationTopics)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](accountPushNotificationTopics, "allValues"));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v5 setByAddingObjectsFromArray:v7]);

    id v5 = (id)v8;
  }

  if (![v5 count])
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"com.apple.apply.service"));

    id v5 = (id)v9;
  }

  os_unfair_lock_unlock(p_lockPushTopics);
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Apply push topics: %@", (uint8_t *)&v14, 0xCu);
  }

  id v12 = [v5 copy];
  return v12;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received push for push topic: %@",  (uint8_t *)&buf,  0xCu);
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000LL;
  id v26 = sub_100286170;
  unsigned __int8 v27 = sub_100286180;
  id v28 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
  os_unfair_lock_lock(&self->_lockPushTopics);
  accountPushNotificationTopics = self->_accountPushNotificationTopics;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_10028AF60;
  v20[3] = &unk_1006516E8;
  id v11 = v6;
  id v21 = v11;
  p___int128 buf = &buf;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( accountPushNotificationTopics,  "enumerateKeysAndObjectsUsingBlock:",  v20);
  os_unfair_lock_unlock(&self->_lockPushTopics);

  if ([*(id *)(*((void *)&buf + 1) + 40) count])
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v12 = *(id *)(*((void *)&buf + 1) + 40LL);
    id v13 = (char *)[v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        for (i = 0LL; i != v13; ++i)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          -[PDApplyManager updateApplicationsForAccountWithIdentifier:completion:]( self,  "updateApplicationsForAccountWithIdentifier:completion:");
        }

        id v13 = (char *)[v12 countByEnumeratingWithState:&v16 objects:v23 count:16];
      }

      while (v13);
    }
  }

  else
  {
    -[PDApplyManager _updateApplicationsFromPush:completion:]( self,  "_updateApplicationsFromPush:completion:",  1LL,  &stru_100651708);
  }

  _Block_object_dispose(&buf, 8);
}

- (void)applyPushNotificationToken:(id)a3
{
  uint64_t Object = PKLogFacilityTypeGetObject(13LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (PDApplyNotificationController)notificationController
{
  return self->_notificationController;
}

- (void)setNotificationController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end