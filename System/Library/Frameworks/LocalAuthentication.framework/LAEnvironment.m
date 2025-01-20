@interface LAEnvironment
+ (LAEnvironment)currentUser;
- (LAEnvironment)init;
- (LAEnvironmentState)state;
- (id)_createConnectionToDaemon;
- (void)_bootstrapServiceType:(id)a3 completion:(id)a4;
- (void)_environmentServiceEndpointWithCompletion:(id)a3;
- (void)_notifyObserversAboutUpdateFrom:(id)a3;
- (void)_registerDarwinNotification;
- (void)_synchronousProxyToEnvironmentServiceWithCompletion:(id)a3;
- (void)_synchronousProxyToEnvironmentServiceWithEndpoint:(id)a3 completion:(id)a4;
- (void)_unregisterDarwinNotification;
- (void)_updateState;
- (void)_updateStateWithSynchronousProxyToEnvironmentService:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)waitForStateUpdate;
@end

@implementation LAEnvironment

+ (LAEnvironment)currentUser
{
  if (currentUser_onceToken != -1) {
    dispatch_once(&currentUser_onceToken, &__block_literal_global_0);
  }
  return (LAEnvironment *)(id)currentUser_currentUser;
}

void __28__LAEnvironment_currentUser__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___LAEnvironment);
  v1 = (void *)currentUser_currentUser;
  currentUser_currentUser = (uint64_t)v0;
}

- (LAEnvironment)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___LAEnvironment;
  v2 = -[LAEnvironment init](&v10, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189610780] createDefaultSerialQueueWithIdentifier:@"LAEnvironment work queue"];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    uint64_t v7 = [MEMORY[0x189610780] createDefaultSerialQueueWithIdentifier:@"LAEnvironment observer queue"];
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v7;

    -[LAEnvironment _registerDarwinNotification](v2, "_registerDarwinNotification");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LAEnvironment;
  -[LAEnvironment dealloc](&v3, sel_dealloc);
}

- (void)_registerDarwinNotification
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  int v2 = 136446466;
  objc_super v3 = "com.apple.LocalAuthentication.environment.StateDidChange";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_fault_impl( &dword_186EAF000,  a2,  OS_LOG_TYPE_FAULT,  "Failed to register %{public}s: %u",  (uint8_t *)&v2,  0x12u);
}

void __44__LAEnvironment__registerDarwinNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateState];
}

- (void)_unregisterDarwinNotification
{
  int notifyToken = self->_notifyToken;
  if (notifyToken) {
    notify_cancel(notifyToken);
  }
}

- (LAEnvironmentState)state
{
  uint64_t v9 = 0LL;
  objc_super v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0LL;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __22__LAEnvironment_state__block_invoke;
  block[3] = &unk_189F99020;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync((dispatch_queue_t)workQueue, block);
  id v4 = (id)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);

  return (LAEnvironmentState *)v4;
}

void __22__LAEnvironment_state__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_super v3 = (void *)WeakRetained[1];
    id v4 = WeakRetained;
    if (!v3)
    {
      [WeakRetained _updateState];
      objc_super v3 = (void *)v4[1];
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v3);
    id WeakRetained = v4;
  }
}

- (void)_updateState
{
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __29__LAEnvironment__updateState__block_invoke;
  v3[3] = &unk_189F99048;
  objc_copyWeak(&v4, &location);
  -[LAEnvironment _synchronousProxyToEnvironmentServiceWithCompletion:]( self,  "_synchronousProxyToEnvironmentServiceWithCompletion:",  v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __29__LAEnvironment__updateState__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    int v2 = (id *)(a1 + 32);
    id v3 = a2;
    id WeakRetained = objc_loadWeakRetained(v2);
    [WeakRetained _updateStateWithSynchronousProxyToEnvironmentService:v3];
  }

- (void)_updateStateWithSynchronousProxyToEnvironmentService:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0LL;
  [MEMORY[0x189607968] numberWithUnsignedInt:geteuid()];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __70__LAEnvironment__updateStateWithSynchronousProxyToEnvironmentService___block_invoke;
  v12[3] = &unk_189F99070;
  v12[4] = &v19;
  v12[5] = &v13;
  [v4 environmentStateForUser:v5 completion:v12];

  if (v20[5])
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    uint64_t v6 = self->_state;
    id v7 = objc_alloc(&OBJC_CLASS___LAEnvironmentState);
    v8 = -[LAEnvironmentState initWithCoreState:](v7, "initWithCoreState:", v20[5]);
    state = self->_state;
    self->_state = v8;

    -[LAEnvironment _notifyObserversAboutUpdateFrom:](self, "_notifyObserversAboutUpdateFrom:", v6);
  }

  else
  {
    LACLogEnvironment();
    uint64_t v6 = (LAEnvironmentState *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      uid_t v10 = geteuid();
      uint64_t v11 = v14[5];
      *(_DWORD *)buf = 67109378;
      uid_t v26 = v10;
      __int16 v27 = 2112;
      uint64_t v28 = v11;
      _os_log_impl( &dword_186EAF000,  (os_log_t)v6,  OS_LOG_TYPE_DEFAULT,  "Failed to query environment state for user %u: %@",  buf,  0x12u);
    }
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

void __70__LAEnvironment__updateStateWithSynchronousProxyToEnvironmentService___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uid_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)_synchronousProxyToEnvironmentServiceWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __69__LAEnvironment__synchronousProxyToEnvironmentServiceWithCompletion___block_invoke;
  v6[3] = &unk_189F99098;
  id v5 = v4;
  id v7 = v5;
  objc_copyWeak(&v8, &location);
  -[LAEnvironment _environmentServiceEndpointWithCompletion:](self, "_environmentServiceEndpointWithCompletion:", v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&location);
}

void __69__LAEnvironment__synchronousProxyToEnvironmentServiceWithCompletion___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _synchronousProxyToEnvironmentServiceWithEndpoint:v4 completion:*(void *)(a1 + 32)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }
}

- (void)_synchronousProxyToEnvironmentServiceWithEndpoint:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x189607B30];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithListenerEndpoint:v7];

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B40A0];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setRemoteObjectInterface:v9];

  uid_t v10 = (void *)MEMORY[0x189604010];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 remoteObjectInterface];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 setClasses:v18 forSelector:sel_environmentStateForUser_completion_ argumentIndex:0 ofReply:1];

  [v8 activate];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __78__LAEnvironment__synchronousProxyToEnvironmentServiceWithEndpoint_completion___block_invoke;
  v22[3] = &unk_189F990C0;
  id v20 = v5;
  id v23 = v20;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:v22];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21) {
    (*((void (**)(id, void *, void))v20 + 2))(v20, v21, 0LL);
  }
  [v8 invalidate];
}

uint64_t __78__LAEnvironment__synchronousProxyToEnvironmentServiceWithEndpoint_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_environmentServiceEndpointWithCompletion:(id)a3
{
  environmentServiceEndpoint = self->_environmentServiceEndpoint;
  else {
    -[LAEnvironment _bootstrapServiceType:completion:]( self,  "_bootstrapServiceType:completion:",  @"kLAServiceTypeEnvironment",  a3);
  }
}

- (void)_bootstrapServiceType:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LAEnvironment _createConnectionToDaemon](self, "_createConnectionToDaemon");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = MEMORY[0x1895F87A8];
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = __50__LAEnvironment__bootstrapServiceType_completion___block_invoke;
  id v18 = &unk_189F990C0;
  id v19 = v6;
  id v9 = v6;
  [v8 synchronousRemoteObjectProxyWithErrorHandler:&v15];
  uid_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)NSString;
  [MEMORY[0x1896079D8] processInfo];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 processIdentifier];
  objc_msgSend(v11, "stringWithFormat:", @"%d", v13, v15, v16, v17, v18);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 bootstrapSessionServiceType:v7 serviceClientID:v14 completionHandler:v9];

  [v8 invalidate];
}

uint64_t __50__LAEnvironment__bootstrapServiceType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)_createConnectionToDaemon
{
  id v3 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.CoreAuthentication.daemon" options:0];
  [MEMORY[0x1896087A0] interfaceWithInternalProtocol:&unk_18C6B4100];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setRemoteObjectInterface:v4];

  [v3 _setQueue:self->_workQueue];
  [v3 activate];
  return v3;
}

- (void)waitForStateUpdate
{
}

- (void)addObserver:(id)a3
{
  id v6 = a3;
  -[LAEnvironment state](self, "state");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = self->_observers;
  objc_sync_enter(v5);
  -[NSHashTable addObject:](self->_observers, "addObject:", v6);
  objc_sync_exit(v5);
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = self->_observers;
  objc_sync_enter(v4);
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  objc_sync_exit(v4);
}

- (void)_notifyObserversAboutUpdateFrom:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!-[LAEnvironmentState isEqual:](self->_state, "isEqual:", v4))
  {
    id v5 = self->_observers;
    objc_sync_enter(v5);
    id v6 = (void *)MEMORY[0x189603F18];
    -[NSHashTable allObjects](self->_observers, "allObjects");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 arrayWithArray:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0LL;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            uint64_t v14 = self;
            observerQueue = self->_observerQueue;
            block[0] = MEMORY[0x1895F87A8];
            block[1] = 3221225472LL;
            block[2] = __49__LAEnvironment__notifyObserversAboutUpdateFrom___block_invoke;
            block[3] = &unk_189F990E8;
            block[4] = v13;
            id v18 = v14;
            id v19 = v4;
            uint64_t v16 = v14;
            dispatch_async((dispatch_queue_t)observerQueue, block);
          }

          ++v12;
        }

        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v10);
    }
  }
}

uint64_t __49__LAEnvironment__notifyObserversAboutUpdateFrom___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) environment:*(void *)(a1 + 40) stateDidChangeFromOldState:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
}

@end