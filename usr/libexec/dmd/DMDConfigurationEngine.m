@interface DMDConfigurationEngine
- (CATOperation)initializationOperation;
- (CATOperationQueue)queue;
- (DMDActivationPredicateObserverManager)activationPredicateObserverManager;
- (DMDConfigurationDatabase)database;
- (DMDConfigurationEngine)initWithDatabase:(id)a3 policyPersistence:(id)a4 activationManager:(id)a5;
- (DMDConfigurationEngineDelegate)delegate;
- (DMDDeviceStateProvider)deviceStateProvider;
- (DMDEngineDatabaseInitializationOperation)databaseInitializationOperation;
- (DMDEventSubscriptionManager)eventSubscriptionManager;
- (DMDPolicyPersistence)policyPersistence;
- (DMDTaskOperationProvider)taskOperationProvider;
- (NSError)initializationError;
- (NSMutableDictionary)organizationControllerByIdentifier;
- (NSString)description;
- (id)engineProcessingOperation:(id)a3 assetResolverForOrganizationWithIdentifier:(id)a4;
- (id)engineProcessingOperation:(id)a3 enqueuedOperationsForOrganizationWithIdentifier:(id)a4;
- (void)_cleanupOrphanedPolicies;
- (void)_updateOrganizationControllers;
- (void)activationPredicateObserverManager:(id)a3 didObserveChangeForPredicateWithIdentifier:(id)a4;
- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4;
- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4;
- (void)databaseInitializationOperationDidFinish;
- (void)declarationModificationOperationDidFinish:(id)a3 completionHandler:(id)a4;
- (void)delegateDidResume;
- (void)delegateWillSuspend;
- (void)enqueueDatabaseModificationOperation:(id)a3 completionHandler:(id)a4;
- (void)enqueueDeclarationProcessingOperationIfNeeded;
- (void)enqueueOperation:(id)a3;
- (void)enqueueOperations:(id)a3;
- (void)handleConfigurationSourceRegistrationRequest:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5;
- (void)handleCreateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4;
- (void)handleDeactivateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4;
- (void)handleFetchConfigurationOrganizationsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleFetchDeclarationsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleFetchStreamEvents:(id)a3 completionHandler:(id)a4;
- (void)handleInstallSubscriptionRequest:(id)a3 completionHandler:(id)a4;
- (void)handleRemoveSubscriptionRequest:(id)a3 completionHandler:(id)a4;
- (void)handleSetDeclarationsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleUpdateCommandsRequest:(id)a3 completionHandler:(id)a4;
- (void)handleUpdateDeclarationsRequest:(id)a3 completionHandler:(id)a4;
- (void)initializationOperationDidFinish:(id)a3;
- (void)processDeclarationsForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)processStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)refreshStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)registerConfigurationSourceOperation:(id)a3 didUpdateRegistrationForConfigurationSource:(id)a4;
- (void)resume;
- (void)sendEvents:(id)a3 organizationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setActivationPredicateObserverManager:(id)a3;
- (void)setDatabase:(id)a3;
- (void)setDatabaseInitializationOperation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceStateProvider:(id)a3;
- (void)setEventSubscriptionManager:(id)a3;
- (void)setInitializationError:(id)a3;
- (void)setInitializationOperation:(id)a3;
- (void)setOrganizationControllerByIdentifier:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTaskOperationProvider:(id)a3;
- (void)suspend;
- (void)updateEventSubscriptions;
- (void)updateOrganizationControllers;
@end

@implementation DMDConfigurationEngine

- (DMDConfigurationEngine)initWithDatabase:(id)a3 policyPersistence:(id)a4 activationManager:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v29 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 76, @"Invalid parameter not satisfying: %@", @"database" object file lineNumber description];
  }

  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___DMDConfigurationEngine;
  v13 = -[DMDConfigurationEngine init](&v35, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_database, a3);
    v15 = objc_opt_new(&OBJC_CLASS___CATOperationQueue);
    queue = v14->_queue;
    v14->_queue = v15;

    v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%p.configuration-engine",  objc_opt_class(v14),  v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[CATOperationQueue setName:](v14->_queue, "setName:", v18);

    -[CATOperationQueue setMaxConcurrentOperationCount:](v14->_queue, "setMaxConcurrentOperationCount:", 1LL);
    -[CATOperationQueue setSuspended:](v14->_queue, "setSuspended:", 1LL);
    v19 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    organizationControllerByIdentifier = v14->_organizationControllerByIdentifier;
    v14->_organizationControllerByIdentifier = v19;

    objc_storeStrong((id *)&v14->_activationPredicateObserverManager, a5);
    -[DMDActivationPredicateObserverManager setDelegate:](v14->_activationPredicateObserverManager, "setDelegate:", v14);
    v21 = objc_opt_new(&OBJC_CLASS___DMDEngineDatabaseInitializationOperation);
    databaseInitializationOperation = v14->_databaseInitializationOperation;
    v14->_databaseInitializationOperation = v21;

    -[DMDEngineDatabaseOperation setDatabase:](v14->_databaseInitializationOperation, "setDatabase:", v10);
    objc_storeStrong((id *)&v14->_policyPersistence, a4);
    v23 = objc_opt_new(&OBJC_CLASS___DMDEventSubscriptionManager);
    eventSubscriptionManager = v14->_eventSubscriptionManager;
    v14->_eventSubscriptionManager = v23;

    objc_initWeak(&location, v14);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_100022270;
    v32[3] = &unk_10009E350;
    objc_copyWeak(&v33, &location);
    -[DMDEventSubscriptionManager setEventsHandler:](v14->_eventSubscriptionManager, "setEventsHandler:", v32);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472LL;
    v30[2] = sub_100022508;
    v30[3] = &unk_10009E378;
    objc_copyWeak(&v31, &location);
    uint64_t v25 = objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v30));
    initializationOperation = v14->_initializationOperation;
    v14->_initializationOperation = (CATOperation *)v25;

    -[CATOperation addTarget:selector:forOperationEvents:]( v14->_initializationOperation,  "addTarget:selector:forOperationEvents:",  v14,  "initializationOperationDidFinish:",  6LL);
    -[CATOperation addDependency:]( v14->_initializationOperation,  "addDependency:",  v14->_databaseInitializationOperation);
    -[CATOperationQueue addOperation:](v14->_queue, "addOperation:", v14->_databaseInitializationOperation);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    [v27 addOperation:v14->_initializationOperation];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }

  return v14;
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 operations]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
  uint64_t v5 = DMFObjectDescription(self, @"Database:\n%@\nEngine operations:\n%@\nOrganizations:\n%@");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (void)setDeviceStateProvider:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine databaseInitializationOperation](self, "databaseInitializationOperation"));
  [v6 setDeviceStateProvider:v5];
}

- (void)resume
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    v7 = NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 150, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100022744;
  v9[3] = &unk_10009E070;
  v9[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v9));
  [v4 setQueuePriority:8];
  -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  [v5 setSuspended:0];
}

- (void)suspend
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 165, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000228CC;
  v8[3] = &unk_10009E070;
  v8[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v8));
  [v4 setQueuePriority:8];
  -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v4);
}

- (void)handleCreateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v7)
  {
    v6[2](v6, v7);
  }

  else
  {
    v8 = objc_opt_new(&OBJC_CLASS___DMDEngineCreateConfigurationOrganizationOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v8, "setDatabase:", v9);

    -[DMDEngineCreateConfigurationOrganizationOperation setRequest:](v8, "setRequest:", v13);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v13 organizationIdentifier]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v13 organizationDisplayName]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Create organization %@ “%@” ",  v10,  v11));
    -[DMDEngineCreateConfigurationOrganizationOperation setName:](v8, "setName:", v12);

    -[DMDEngineCreateConfigurationOrganizationOperation setQueuePriority:](v8, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v8,  v6);
  }
}

- (void)handleDeactivateConfigurationOrganizationRequest:(id)a3 completionHandler:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v7)
  {
    v6[2](v6, v7);
  }

  else
  {
    v8 = objc_opt_new(&OBJC_CLASS___DMDEngineDeactivateConfigurationOrganizationOperation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v8, "setDatabase:", v9);

    -[DMDEngineDeactivateConfigurationOrganizationOperation setRequest:](v8, "setRequest:", v11);
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Deactivate organization for %@",  v11));
    -[DMDEngineDeactivateConfigurationOrganizationOperation setName:](v8, "setName:", v10);

    -[DMDEngineDeactivateConfigurationOrganizationOperation setQueuePriority:](v8, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v8,  v6);
  }
}

- (void)handleFetchConfigurationOrganizationsRequest:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100022C3C;
  v8[3] = &unk_10009E3A0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [v6 addOperationWithBlock:v8];
}

- (void)handleFetchStreamEvents:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, 0LL, v8);
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100022F40;
    v10[3] = &unk_10009E3F0;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v10));
    [v9 setQueuePriority:4];
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v9);
  }
}

- (void)handleConfigurationSourceRegistrationRequest:(id)a3 clientIdentifier:(id)a4 completionHandler:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v10)
  {
    v9[2](v9, v10);
  }

  else
  {
    id v11 = objc_opt_new(&OBJC_CLASS___DMDEngineRegisterConfigurationSourceOperation);
    -[DMDEngineRegisterConfigurationSourceOperation setRequest:](v11, "setRequest:", v13);
    -[DMDEngineRegisterConfigurationSourceOperation setClientIdentifier:](v11, "setClientIdentifier:", v8);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v11, "setDatabase:", v12);

    -[DMDEngineRegisterConfigurationSourceOperation setDelegate:](v11, "setDelegate:", self);
    -[DMDEngineRegisterConfigurationSourceOperation setQueuePriority:](v11, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v11,  v9);
  }
}

- (void)handleSetDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }

  else
  {
    uint64_t v9 = DMFConfigurationEngineLog(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Engine enqueuing operation to set declarations from %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    id v12 = objc_opt_new(&OBJC_CLASS___DMDEngineSetDeclarationsOperation);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v12, "setDatabase:", v13);

    -[DMDEngineSetDeclarationsOperation setRequest:](v12, "setRequest:", v6);
    -[DMDEngineSetDeclarationsOperation setQueuePriority:](v12, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v12,  v7);
  }
}

- (void)handleUpdateDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }

  else
  {
    uint64_t v9 = DMFConfigurationEngineLog(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Engine enqueuing operation to update declarations from %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    id v12 = objc_opt_new(&OBJC_CLASS___DMDEngineUpdateDeclarationsOperation);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v12, "setDatabase:", v13);

    -[DMDEngineUpdateDeclarationsOperation setRequest:](v12, "setRequest:", v6);
    -[DMDEngineUpdateDeclarationsOperation setQueuePriority:](v12, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v12,  v7);
  }
}

- (void)handleFetchDeclarationsRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, 0LL, v8);
  }

  else
  {
    uint64_t v9 = DMFConfigurationEngineLog(0LL);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v6 organizationIdentifier]);
      int v14 = 138543362;
      v15 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Engine enqueuing operation to fetch declarations for %{public}@",  (uint8_t *)&v14,  0xCu);
    }

    id v12 = objc_opt_new(&OBJC_CLASS___DMDEngineFetchDeclarationsOperation);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v12, "setDatabase:", v13);

    -[DMDEngineFetchDeclarationsOperation setRequest:](v12, "setRequest:", v6);
    -[DMDEngineFetchDeclarationsOperation setCompletionHandler:](v12, "setCompletionHandler:", v7);
    -[DMDEngineFetchDeclarationsOperation setQueuePriority:](v12, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v12);
  }
}

- (void)processDeclarationsForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }

  else
  {
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    int v14 = sub_10002384C;
    v15 = &unk_10009E3F0;
    v16 = self;
    id v9 = v6;
    id v17 = v9;
    v18 = v7;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  &v12));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Process Declarations for %@",  v9,  v12,  v13,  v14,  v15,  v16));
    [v10 setName:v11];

    [v10 setQueuePriority:4];
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v10);
  }
}

- (void)processStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, v8);
  }

  else
  {
    id v9 = objc_opt_new(&OBJC_CLASS___DMDEngineProcessStatusOperation);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v9, "setDatabase:", v10);

    -[DMDEngineProcessStatusOperation setOrganizationIdentifier:](v9, "setOrganizationIdentifier:", v6);
    -[DMDEngineProcessStatusOperation setQueuePriority:](v9, "setQueuePriority:", 4LL);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100023CB8;
    v11[3] = &unk_10009DE08;
    id v12 = v7;
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v9,  v11);
  }
}

- (void)refreshStatusForOrganizationWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v8)
  {
    v7[2](v7, 0LL, v8);
  }

  else
  {
    id v9 = objc_opt_new(&OBJC_CLASS___DMDEngineRefreshStatusOperation);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v9, "setDatabase:", v10);

    -[DMDEngineRefreshStatusOperation setOrganizationIdentifier:](v9, "setOrganizationIdentifier:", v6);
    -[DMDEngineRefreshStatusOperation setQueuePriority:](v9, "setQueuePriority:", 4LL);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100023E50;
    v12[3] = &unk_10009E440;
    uint64_t v13 = v9;
    int v14 = v7;
    id v11 = v9;
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v11,  v12);
  }
}

- (void)handleUpdateCommandsRequest:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v7)
  {
    v6[2](v6, v7);
  }

  else
  {
    id v8 = objc_opt_new(&OBJC_CLASS___DMDEngineUpdateCommandsOperation);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v8, "setDatabase:", v9);

    -[DMDEngineUpdateCommandsOperation setRequest:](v8, "setRequest:", v10);
    -[DMDEngineUpdateCommandsOperation setQueuePriority:](v8, "setQueuePriority:", 4LL);
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v8,  v6);
  }
}

- (void)handleInstallSubscriptionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002406C;
  v11[3] = &unk_10009E468;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)handleRemoveSubscriptionRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100024410;
  v11[3] = &unk_10009E490;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 performBackgroundTask:v11];
}

- (void)sendEvents:(id)a3 organizationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(id, void *))a5;
  if (!v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v16 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 487, @"Invalid parameter not satisfying: %@", @"organizationIdentifier" object file lineNumber description];
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v12)
  {
    v11[2](v11, v12);
  }

  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10002480C;
    v17[3] = &unk_10009E4B8;
    v17[4] = self;
    id v13 = v10;
    id v18 = v13;
    v20 = v11;
    id v19 = v9;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v17));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Send Events for %@",  v13));
    [v14 setName:v15];

    [v14 setQueuePriority:4];
    -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v14);
  }
}

- (void)initializationOperationDidFinish:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationOperation](self, "initializationOperation"));

  if (v5 == v4) {
    -[DMDConfigurationEngine setInitializationOperation:](self, "setInitializationOperation:", 0LL);
  }
}

- (void)databaseInitializationOperationDidFinish
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine databaseInitializationOperation](self, "databaseInitializationOperation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 error]);

  -[DMDConfigurationEngine setDatabaseInitializationOperation:](self, "setDatabaseInitializationOperation:", 0LL);
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
    id v6 = [v5 mutableCopy];

    [v6 removeObjectForKey:DMFErrorFailedConfigurationDatabaseStoreKey];
    [v6 removeObjectForKey:NSUnderlyingErrorKey];
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v7,  [v4 code],  v6));
    -[DMDConfigurationEngine setInitializationError:](self, "setInitializationError:", v8);

    uint64_t v10 = DMFConfigurationEngineLog(v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100061F7C(v4);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
    [v12 cancelAllOperations];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
    [v13 setSuspended:1];

    -[DMDConfigurationEngine delegateWillSuspend](self, "delegateWillSuspend");
  }

  else
  {
    -[DMDConfigurationEngine updateOrganizationControllers](self, "updateOrganizationControllers");
    -[DMDConfigurationEngine updateEventSubscriptions](self, "updateEventSubscriptions");
    -[DMDConfigurationEngine _cleanupOrphanedPolicies](self, "_cleanupOrphanedPolicies");
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v6 addObserver:self selector:"_updateOrganizationControllers" name:@"DMDConfigurationOrganizationsDidChangeNotification" object:0];
  }
}

- (void)enqueueDatabaseModificationOperation:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v6 = objc_retainBlock(a4);
  [v7 addTarget:self selector:"declarationModificationOperationDidFinish:completionHandler:" forOperationEvents:6 userInfo:v6];

  -[DMDConfigurationEngine enqueueOperation:](self, "enqueueOperation:", v7);
}

- (void)declarationModificationOperationDidFinish:(id)a3 completionHandler:(id)a4
{
  if (a4)
  {
    id v7 = a4;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([a3 error]);
    (*((void (**)(id, void *))a4 + 2))(v7, v8);
  }

  -[DMDConfigurationEngine enqueueDeclarationProcessingOperationIfNeeded]( self,  "enqueueDeclarationProcessingOperationIfNeeded",  a3);
}

- (void)enqueueDeclarationProcessingOperationIfNeeded
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));

  if (!v4)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v22 handleFailureInMethod:a2 object:self file:@"DMDConfigurationEngine.m" lineNumber:582 description:@"Cannot enqueue an operation if we failed to initialize the database."];
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  id v6 = (DMDEngineDatabaseProcessingOperation *)objc_claimAutoreleasedReturnValue([v5 operations]);

  id v7 = -[DMDEngineDatabaseProcessingOperation countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
LABEL_5:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v31 != v8) {
        objc_enumerationMutation(v6);
      }
      uint64_t v10 = *(void *)(*((void *)&v30 + 1) + 8 * v9);
      uint64_t v11 = objc_opt_class(&OBJC_CLASS___DMDEngineDatabaseProcessingOperation);
      if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = -[DMDEngineDatabaseProcessingOperation countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v30,  v35,  16LL);
        if (v7) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:

    uint64_t v13 = DMFConfigurationEngineLog(v12);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Engine enqueuing operation to process pending declarations in database",  (uint8_t *)buf,  2u);
    }

    v15 = objc_opt_new(&OBJC_CLASS___DMDEngineDatabaseProcessingOperation);
    -[DMDEngineDatabaseProcessingOperation setQueuePriority:](v15, "setQueuePriority:", 0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    -[DMDEngineDatabaseOperation setDatabase:](v15, "setDatabase:", v16);

    -[DMDEngineDatabaseProcessingOperation setDelegate:](v15, "setDelegate:", self);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine deviceStateProvider](self, "deviceStateProvider"));
    -[DMDEngineDatabaseProcessingOperation setDeviceStateProvider:](v15, "setDeviceStateProvider:", v17);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine taskOperationProvider](self, "taskOperationProvider"));
    -[DMDEngineDatabaseProcessingOperation setTaskOperationProvider:](v15, "setTaskOperationProvider:", v18);

    id v19 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine activationPredicateObserverManager]( self,  "activationPredicateObserverManager"));
    -[DMDEngineDatabaseProcessingOperation setActivationPredicateObserverManager:]( v15,  "setActivationPredicateObserverManager:",  v19);

    objc_initWeak(buf, self);
    v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    uint64_t v25 = sub_100025244;
    v26 = &unk_10009E4E0;
    id v6 = v15;
    v27 = v6;
    objc_copyWeak(&v28, buf);
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  &v23));
    -[DMDEngineDatabaseProcessingOperation setQueuePriority:](v6, "setQueuePriority:", 0LL, v23, v24, v25, v26);
    [v20 addDependency:v6];
    v34[0] = v6;
    v34[1] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
    -[DMDConfigurationEngine enqueueOperations:](self, "enqueueOperations:", v21);

    objc_destroyWeak(&v28);
    objc_destroyWeak(buf);
  }
}

- (void)enqueueOperation:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));

  if (!v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"DMDConfigurationEngine.m" lineNumber:617 description:@"Cannot enqueue an operation if we failed to initialize the database."];

    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v9 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 618, @"Invalid parameter not satisfying: %@", @"operation" object file lineNumber description];

    goto LABEL_3;
  }

  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  id v10 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
  -[DMDConfigurationEngine enqueueOperations:](self, "enqueueOperations:", v7);
}

- (void)enqueueOperations:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));

  if (!v6)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2 object:self file:@"DMDConfigurationEngine.m" lineNumber:623 description:@"Cannot enqueue an operation if we failed to initialize the database."];
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)v11);
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationOperation](self, "initializationOperation", (void)v16));
        if (v13) {
          [v12 addDependency:v13];
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue"));
  [v14 addOperations:v7 waitUntilFinished:0];
}

- (void)_updateOrganizationControllers
{
}

- (void)updateOrganizationControllers
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v28 = NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    [v27 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 638, @"%@ must be called from the main thread", v29 object file lineNumber description];
  }

  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequest]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequest"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 viewContext]);
  id v41 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 executeFetchRequest:v31 error:&v41]);
  id v30 = v41;

  if (!v6)
  {
    uint64_t v8 = DMFConfigurationEngineLog(v7);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10006206C(v30);
    }
  }

  id obj = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine organizationControllerByIdentifier](self, "organizationControllerByIdentifier"));
  objc_sync_enter(obj);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allKeys]);
  id v12 = [v11 mutableCopy];

  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v13 = v6;
  id v14 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v38;
    do
    {
      __int128 v16 = 0LL;
      do
      {
        if (*(void *)v38 != v15) {
          objc_enumerationMutation(v13);
        }
        __int128 v17 = -[DMDConfigurationOrganizationController initWithOrganization:delegate:]( objc_alloc(&OBJC_CLASS___DMDConfigurationOrganizationController),  "initWithOrganization:delegate:",  *(void *)(*((void *)&v37 + 1) + 8LL * (void)v16),  self);
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](v17, "identifier"));
        [v18 setObject:v17 forKeyedSubscript:v19];

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](v17, "identifier"));
        [v12 removeObject:v20];

        __int128 v16 = (char *)v16 + 1;
      }

      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v37 objects:v43 count:16];
    }

    while (v14);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v21 = v12;
  id v22 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v34;
    do
    {
      uint64_t v24 = 0LL;
      do
      {
        if (*(void *)v34 != v23) {
          objc_enumerationMutation(v21);
        }
        uint64_t v25 = *(void *)(*((void *)&v33 + 1) + 8LL * (void)v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
        [v26 removeObjectForKey:v25];

        uint64_t v24 = (char *)v24 + 1;
      }

      while (v22 != v24);
      id v22 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }

    while (v22);
  }

  objc_sync_exit(obj);
}

- (void)updateEventSubscriptions
{
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v19 = NSStringFromSelector(a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v18 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 665, @"%@ must be called from the main thread", v20 object file lineNumber description];
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[DMDEventSubscriptionRegistration fetchRequest]( &OBJC_CLASS___DMDEventSubscriptionRegistration,  "fetchRequest"));
  [v4 setRelationshipKeyPathsForPrefetching:&off_1000A55F8];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewContext]);
  id v22 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 executeFetchRequest:v4 error:&v22]);
  id v8 = v22;

  if (!v7)
  {
    uint64_t v10 = DMFConfigurationEngineLog(v9);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100062160(v8);
    }
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine eventSubscriptionManager](self, "eventSubscriptionManager"));
  id v21 = v8;
  unsigned __int8 v13 = [v12 setEventSubscriptionRegistrations:v7 error:&v21];
  id v14 = v21;

  if ((v13 & 1) == 0)
  {
    uint64_t v16 = DMFConfigurationEngineLog(v15);
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000620E8(v14);
    }
  }
}

- (void)_cleanupOrphanedPolicies
{
  v3 = (void *)os_transaction_create("com.apple.dmd.policy.cleanup.org");
  id v4 = (void *)os_transaction_create("com.apple.dmd.policy.cleanup.declaration");
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  v26 = sub_100023980;
  v27 = sub_100023990;
  id v28 = 0LL;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100023980;
  id v21 = sub_100023990;
  id v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewContext]);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100025D24;
  v16[3] = &unk_10009E508;
  v16[4] = &v23;
  v16[5] = &v17;
  [v6 performBlockAndWait:v16];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine policyPersistence](self, "policyPersistence"));
  uint64_t v8 = v24[5];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000260E8;
  v14[3] = &unk_10009E530;
  id v9 = v3;
  id v15 = v9;
  [v7 removeOrphanedPoliciesNotBelongingToExistingOrganizationIdentifiers:v8 completionHandler:v14];
  uint64_t v10 = v18[5];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100026140;
  v12[3] = &unk_10009E530;
  id v11 = v4;
  id v13 = v11;
  [v7 removeOrphanedPoliciesNotBelongingToExistingDeclarationIdentifiersByOrganizationIdentifier:v10 completionHandler:v12];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

- (void)activationPredicateObserverManager:(id)a3 didObserveChangeForPredicateWithIdentifier:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError", a3, a4));
  if (!v5)
  {
    -[DMDConfigurationEngine enqueueDeclarationProcessingOperationIfNeeded]( self,  "enqueueDeclarationProcessingOperationIfNeeded");
    id v5 = 0LL;
  }
}

- (void)configurationSourceController:(id)a3 fetchStatusUpdatesWithCompletionHandler:(id)a4
{
  id v7 = a3;
  uint64_t v8 = (void (**)(id, void, void *, Block_layout *))a4;
  if (!v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 757, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine initializationError](self, "initializationError"));
  if (v9)
  {
    v8[2](v8, 0LL, v9, &stru_10009E570);
  }

  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10002633C;
    v12[3] = &unk_10009E3F0;
    id v13 = v7;
    id v14 = self;
    id v15 = v8;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[DMDBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___DMDBlockOperation,  "blockOperationWithBlock:",  v12));
    [v10 setQueuePriority:8];
    -[DMDConfigurationEngine enqueueDatabaseModificationOperation:completionHandler:]( self,  "enqueueDatabaseModificationOperation:completionHandler:",  v10,  &stru_10009E628);
  }
}

- (void)configurationSourceController:(id)a3 fetchEventsWithCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v12 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 854, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100026F24;
  v13[3] = &unk_10009E468;
  id v15 = self;
  id v16 = v8;
  id v14 = v7;
  id v10 = v8;
  id v11 = v7;
  [v9 performBackgroundTask:v13];
}

- (id)engineProcessingOperation:(id)a3 enqueuedOperationsForOrganizationWithIdentifier:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine queue](self, "queue", a3, a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operations]);

  return v5;
}

- (id)engineProcessingOperation:(id)a3 assetResolverForOrganizationWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
  objc_sync_enter(v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:v7]);

  objc_sync_exit(v8);
  return v10;
}

- (void)registerConfigurationSourceOperation:(id)a3 didUpdateRegistrationForConfigurationSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    __int128 v35 = NSStringFromSelector(a2);
    __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    [v34 handleFailureInMethod:a2, self, @"DMDConfigurationEngine.m", 917, @"%@ must be called from the main thread", v36 object file lineNumber description];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
  objc_sync_enter(v9);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 organizationIdentifier]);
  id v12 = (DMDConfigurationOrganizationController *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:v11]);

  if (!v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 organizationIdentifier]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[DMDConfigurationOrganization fetchRequestMatchingConfigurationOrganizationWithIdentifier:]( &OBJC_CLASS___DMDConfigurationOrganization,  "fetchRequestMatchingConfigurationOrganizationWithIdentifier:",  v13));

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 viewContext]);
    id v37 = 0LL;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 executeFetchRequest:v14 error:&v37]);
    id v18 = v37;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v17 firstObject]);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine database](self, "database"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 viewContext]);
    [v21 refreshObject:v19 mergeChanges:0];

    id v12 = -[DMDConfigurationOrganizationController initWithOrganization:delegate:]( objc_alloc(&OBJC_CLASS___DMDConfigurationOrganizationController),  "initWithOrganization:delegate:",  v19,  self);
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationEngine organizationControllerByIdentifier]( self,  "organizationControllerByIdentifier"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationOrganizationController identifier](v12, "identifier"));
    [v22 setObject:v12 forKeyedSubscript:v23];
  }

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( -[DMDConfigurationOrganizationController configurationSourceWithIdentifier:]( v12,  "configurationSourceWithIdentifier:",  v24));

  if (v25)
  {
    uint64_t v27 = DMFConfigurationEngineLog(v26);
    id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543362;
      __int128 v39 = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Re-registering configuration source %{public}@",  buf,  0xCu);
    }

    [v25 updateWithConfigurationSource:v8];
  }

  else
  {
    uint64_t v30 = DMFConfigurationEngineLog(v26);
    __int128 v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v8 identifier]);
      *(_DWORD *)buf = 138543362;
      __int128 v39 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Registering new configuration source %{public}@",  buf,  0xCu);
    }

    id v33 =  -[DMDConfigurationOrganizationController registerConfigurationSource:]( v12,  "registerConfigurationSource:",  v8);
  }

  objc_sync_exit(v9);
}

- (void)delegateDidResume
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "configurationEngineDidResume:") & 1) != 0) {
    [v3 configurationEngineDidResume:self];
  }
}

- (void)delegateWillSuspend
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[DMDConfigurationEngine delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "configurationEngineWillSuspend:") & 1) != 0) {
    [v3 configurationEngineWillSuspend:self];
  }
}

- (DMDPolicyPersistence)policyPersistence
{
  return (DMDPolicyPersistence *)objc_getProperty(self, a2, 8LL, 1);
}

- (DMDConfigurationEngineDelegate)delegate
{
  return (DMDConfigurationEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (DMDDeviceStateProvider)deviceStateProvider
{
  return self->_deviceStateProvider;
}

- (DMDTaskOperationProvider)taskOperationProvider
{
  return self->_taskOperationProvider;
}

- (void)setTaskOperationProvider:(id)a3
{
}

- (DMDActivationPredicateObserverManager)activationPredicateObserverManager
{
  return self->_activationPredicateObserverManager;
}

- (void)setActivationPredicateObserverManager:(id)a3
{
}

- (DMDConfigurationDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
}

- (CATOperationQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSError)initializationError
{
  return (NSError *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setInitializationError:(id)a3
{
}

- (DMDEngineDatabaseInitializationOperation)databaseInitializationOperation
{
  return self->_databaseInitializationOperation;
}

- (void)setDatabaseInitializationOperation:(id)a3
{
}

- (CATOperation)initializationOperation
{
  return self->_initializationOperation;
}

- (void)setInitializationOperation:(id)a3
{
}

- (NSMutableDictionary)organizationControllerByIdentifier
{
  return self->_organizationControllerByIdentifier;
}

- (void)setOrganizationControllerByIdentifier:(id)a3
{
}

- (DMDEventSubscriptionManager)eventSubscriptionManager
{
  return self->_eventSubscriptionManager;
}

- (void)setEventSubscriptionManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end