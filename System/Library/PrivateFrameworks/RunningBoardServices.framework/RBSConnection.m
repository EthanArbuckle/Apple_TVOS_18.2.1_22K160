@interface RBSConnection
+ (id)connectionQueue;
+ (id)handshakeQueue;
+ (id)sharedInstance;
+ (id)testConnectionWithConnection:(id)a3;
+ (void)setInDaemon;
- (BOOL)executeTerminateRequest:(id)a3 assertion:(id *)a4 error:(id *)a5;
- (BOOL)invalidateAssertion:(id)a3 error:(id *)a4;
- (BOOL)invalidateAssertionWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)isIdentityAnAngel:(id)a3 withError:(id *)a4;
- (BOOL)saveEndowment:(id)a3 withError:(id *)a4;
- (BOOL)subscribeProcessStateMonitor:(id)a3 configuration:(id)a4 error:(id *)a5;
- (RBSConnection)init;
- (id)_connection;
- (id)_initWithConnection:(id)a1;
- (id)acquireAssertion:(id)a3 error:(id *)a4;
- (id)assertionDescriptorsByPidWithFlattenedAttributes:(BOOL)a3 error:(id *)a4;
- (id)busyExtensionInstancesFromSet:(id)a3 error:(id *)a4;
- (id)captureStateForSubsystem:(id)a3 error:(id *)a4;
- (id)executeLaunchRequest:(id)a3;
- (id)handle;
- (id)handleForKey:(id)a3;
- (id)handleForPredicate:(id)a3 error:(id *)a4;
- (id)hostProcessForInstance:(id)a3 error:(id *)a4;
- (id)identifiersForStateCaptureSubsystems:(id *)a3;
- (id)identity;
- (id)infoPlistResultForInstance:(id)a3 forKeys:(id)a4 error:(id *)a5;
- (id)lastExitContextForInstance:(id)a3 error:(id *)a4;
- (id)limitationsForInstance:(id)a3 error:(id *)a4;
- (id)managedEndpointByLaunchIdentifier;
- (id)portForIdentifier:(id)a3;
- (id)preventLaunchPredicatesWithError:(id *)a3;
- (id)processName:(id)a3;
- (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5;
- (os_unfair_lock_s)_lock_connect;
- (uint64_t)cleanOutStateIfNeeded;
- (void)_disconnect;
- (void)_handleDaemonDidStart;
- (void)_handleMessage:(uint64_t)a1;
- (void)_handshake;
- (void)_lock_announceLostInheritances;
- (void)_lock_connect;
- (void)_lock_setConnection:(uint64_t)a1;
- (void)_subscribeToProcessDeath:(void *)a3 handler:;
- (void)async_assertionWillInvalidate:(id)a3;
- (void)async_assertionsDidInvalidate:(id)a3 withError:(id)a4;
- (void)async_didChangeInheritances:(id)a3 completion:(id)a4;
- (void)async_observedPreventLaunchPredicatesUpdate:(id)a3 completion:(id)a4;
- (void)async_observedProcessExitEvents:(id)a3 completion:(id)a4;
- (void)async_observedProcessStatesDidChange:(id)a3 completion:(id)a4;
- (void)async_processDidExit:(id)a3 withContext:(id)a4;
- (void)async_willExpireAssertionsSoon;
- (void)dealloc;
- (void)intendToExit:(id)a3 withStatus:(id)a4;
- (void)observeProcessAssertionsExpirationWarningWithBlock:(uint64_t)a1;
- (void)registerServiceDelegate:(uint64_t)a1;
- (void)reset;
- (void)subscribeToProcessDeath:(id)a3 handler:(id)a4;
- (void)unsubscribeProcessStateMonitor:(id)a3 configuration:(id)a4;
@end

@implementation RBSConnection

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_6);
  }
  return (id)sharedInstance___sharedInstance_0;
}

void __31__RBSConnection_sharedInstance__block_invoke()
{
  id v0 = -[RBSConnection _initWithConnection:](objc_alloc(&OBJC_CLASS___RBSConnection), 0LL);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;
}

- (id)_initWithConnection:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v29.receiver = a1;
    v29.super_class = (Class)&OBJC_CLASS___RBSConnection;
    a1 = objc_msgSendSuper2(&v29, sel_init);
    if (a1)
    {
      rbs_connection_log();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185F67000, v4, OS_LOG_TYPE_DEFAULT, "Initializing connection", buf, 2u);
      }

      *((_DWORD *)a1 + 10) = 0;
      *((_DWORD *)a1 + 12) = 0;
      *((void *)a1 + 18) = 0LL;
      uint64_t v5 = +[RBSConnection handshakeQueue](&OBJC_CLASS___RBSConnection, "handshakeQueue");
      v6 = (void *)*((void *)a1 + 8);
      *((void *)a1 + 8) = v5;

      uint64_t v7 = +[RBSConnection connectionQueue](&OBJC_CLASS___RBSConnection, "connectionQueue");
      v8 = (void *)*((void *)a1 + 7);
      *((void *)a1 + 7) = v7;

      uint64_t v9 = [MEMORY[0x189607920] strongToWeakObjectsMapTable];
      v10 = (void *)*((void *)a1 + 9);
      *((void *)a1 + 9) = v9;

      uint64_t v11 = [MEMORY[0x189603FE0] set];
      v12 = (void *)*((void *)a1 + 13);
      *((void *)a1 + 13) = v11;

      uint64_t v13 = [MEMORY[0x1896078B8] weakObjectsHashTable];
      v14 = (void *)*((void *)a1 + 10);
      *((void *)a1 + 10) = v13;

      uint64_t v15 = [MEMORY[0x1896078B8] weakObjectsHashTable];
      v16 = (void *)*((void *)a1 + 14);
      *((void *)a1 + 14) = v15;

      id v17 = objc_alloc_init(MEMORY[0x189603FC8]);
      v18 = (void *)*((void *)a1 + 15);
      *((void *)a1 + 15) = v17;

      id v19 = objc_alloc_init(MEMORY[0x189603FC8]);
      v20 = (void *)*((void *)a1 + 11);
      *((void *)a1 + 11) = v19;

      id v21 = objc_alloc_init(MEMORY[0x189603FA8]);
      v22 = (void *)*((void *)a1 + 16);
      *((void *)a1 + 16) = v21;

      if (v3)
      {
        os_unfair_lock_lock((os_unfair_lock_t)a1 + 10);
        -[RBSConnection _lock_setConnection:]((uint64_t)a1, v3);
        *((void *)a1 + 18) = 2LL;
        os_unfair_lock_unlock((os_unfair_lock_t)a1 + 10);
      }

      else
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver( DarwinNotifyCenter,  a1,  (CFNotificationCallback)__RBSDaemonDidStart,  @"com.apple.runningboard.daemonstartup",  0LL,  CFNotificationSuspensionBehaviorCoalesce);
        v24 = (dispatch_queue_s *)*((void *)a1 + 7);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __37__RBSConnection__initWithConnection___block_invoke;
        block[3] = &unk_189DE0C68;
        a1 = a1;
        id v27 = a1;
        dispatch_sync(v24, block);
      }
    }
  }

  return a1;
}

+ (id)testConnectionWithConnection:(id)a3
{
  id v3 = a3;
  id v4 = -[RBSConnection _initWithConnection:](objc_alloc(&OBJC_CLASS___RBSConnection), v3);

  return v4;
}

+ (id)handshakeQueue
{
  if (handshakeQueue_onceToken != -1) {
    dispatch_once(&handshakeQueue_onceToken, &__block_literal_global_55);
  }
  return (id)handshakeQueue_queue;
}

void __31__RBSConnection_handshakeQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.connection.outgoing", v2);
  v1 = (void *)handshakeQueue_queue;
  handshakeQueue_queue = (uint64_t)v0;
}

+ (id)connectionQueue
{
  if (connectionQueue_onceToken != -1) {
    dispatch_once(&connectionQueue_onceToken, &__block_literal_global_57);
  }
  return (id)connectionQueue_queue;
}

void __32__RBSConnection_connectionQueue__block_invoke()
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.runningboardservices.connection.incoming", v2);
  v1 = (void *)connectionQueue_queue;
  connectionQueue_queue = (uint64_t)v0;
}

+ (void)setInDaemon
{
  inRunningBoardDaemon = 1;
}

- (RBSConnection)init
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBSConnection.m" lineNumber:197 description:@"cannot call -init on RBSConnection"];

  return 0LL;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RBSConnection;
  -[RBSConnection dealloc](&v3, sel_dealloc);
}

- (id)identity
{
  if (a1)
  {
    v1 = -[RBSConnection handle](a1);
    [v1 identity];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v2 = 0LL;
  }

  return v2;
}

- (id)handle
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0LL;
  v1 = *(dispatch_queue_s **)(a1 + 64);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __23__RBSConnection_handle__block_invoke;
  v4[3] = &unk_189DE0D50;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_async_and_wait(v1, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __23__RBSConnection_handle__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) && *(void *)(*(void *)(a1 + 32) + 144LL) == 3LL)
  {
    [MEMORY[0x1896077F8] mainBundle];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 executablePath];
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    +[RBSProcessIdentity identityForExecutablePath:pid:auid:]( &OBJC_CLASS___RBSProcessIdentity,  "identityForExecutablePath:pid:auid:",  v7,  getpid(),  0LL);
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue();
    id v4 = -[RBSProcessHandle initWithIdentity:](objc_alloc(&OBJC_CLASS___RBSProcessHandle), "initWithIdentity:", v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8LL);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (id)managedEndpointByLaunchIdentifier
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy__1;
  uint64_t v9 = __Block_byref_object_dispose__1;
  id v10 = 0LL;
  v1 = *(dispatch_queue_s **)(a1 + 64);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __50__RBSConnection_managedEndpointByLaunchIdentifier__block_invoke;
  v4[3] = &unk_189DE0D50;
  v4[4] = a1;
  v4[5] = &v5;
  dispatch_async_and_wait(v1, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__RBSConnection_managedEndpointByLaunchIdentifier__block_invoke(uint64_t a1)
{
}

- (void)registerServiceDelegate:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    uint64_t v5 = *(dispatch_queue_s **)(a1 + 56);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__RBSConnection_registerServiceDelegate___block_invoke;
    block[3] = &unk_189DE0D78;
    void block[4] = a1;
    v8 = sel_registerServiceDelegate_;
    id v7 = v3;
    dispatch_async(v5, block);
  }
}

void __41__RBSConnection_registerServiceDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v3,  "handleFailureInMethod:object:file:lineNumber:description:",  *(void *)(a1 + 48),  *(void *)(*(void *)(a1 + 32) + 32),  *(void *)(a1 + 40));

    uint64_t v2 = *(void *)(a1 + 32);
  }

  objc_storeStrong((id *)(v2 + 32), *(id *)(a1 + 40));
  id v4 = (id)[*(id *)(*(void *)(a1 + 32) + 104) copy];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  if ([v4 count]) {
    [*(id *)(a1 + 40) didReceiveInheritances:v4];
  }
}

- (void)observeProcessAssertionsExpirationWarningWithBlock:(uint64_t)a1
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  id v3 = (os_unfair_lock_s *)(a1 + 48);
  id v4 = a2;
  os_unfair_lock_lock(v3);
  uint64_t v5 = objc_alloc(&OBJC_CLASS____RBSExpirationWarningClient);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __68__RBSConnection_observeProcessAssertionsExpirationWarningWithBlock___block_invoke;
  v9[3] = &unk_189DE0DA0;
  v9[4] = a1;
  v6 = -[_RBSExpirationWarningClient initWithBlock:invalidationBlock:](v5, v4, v9);

  [*(id *)(a1 + 112) addObject:v6];
  os_unfair_lock_unlock(v3);
  rbs_general_log();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v6;
    _os_log_impl( &dword_185F67000,  v7,  OS_LOG_TYPE_DEFAULT,  "Added observer for process assertions expiration warning: %{public}@",  buf,  0xCu);
  }

  return v6;
}

void __68__RBSConnection_observeProcessAssertionsExpirationWarningWithBlock___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  rbs_general_log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl( &dword_185F67000,  v4,  OS_LOG_TYPE_DEFAULT,  "Removed observer for process assertions expiration warning: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 112) removeObject:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
}

- (id)acquireAssertion:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v19 = a3;
  [v19 descriptor];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_assertion_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v5;
    _os_log_impl(&dword_185F67000, v6, OS_LOG_TYPE_INFO, "Acquiring assertion: %{public}@", buf, 0xCu);
  }

  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_acquireAssertionWithDescriptor_error_,  v5,  0LL);
  uint64_t v7 = (SEL *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x189607460];
  while (1)
  {
    -[RBSConnection _connection]((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v20 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v7, v9, v10, &v20);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v20;

    if (v11) {
      break;
    }
    if ([v12 code] != 4101) {
      goto LABEL_13;
    }
    [v12 domain];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    int v14 = [v13 isEqualToString:v8];

    if (!v14) {
      goto LABEL_13;
    }
    rbs_assertion_log();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection acquireAssertion:error:].cold.1(buf, &buf[1], v15);
    }

    [MEMORY[0x189607A40] sleepForTimeInterval:0.1];
  }

  rbs_assertion_log();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[RBSConnection acquireAssertion:error:].cold.2();
  }

  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMapTable setObject:forKey:](self->_acquiredAssertionsByIdentifier, "setObject:forKey:", v19, v11);
  os_unfair_lock_unlock(&self->_assertionLock);
LABEL_13:
  if (a4) {
    *a4 = v12;
  }

  return v11;
}

- (id)_connection
{
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 56));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    -[RBSConnection _lock_connect]((os_unfair_lock_s *)a1);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
    dispatch_async_and_wait(*(dispatch_queue_t *)(a1 + 64), &__block_literal_global_206);
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

- (BOOL)invalidateAssertion:(id)a3 error:(id *)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6) {
    BOOL v7 = -[RBSConnection invalidateAssertionWithIdentifier:error:]( self,  "invalidateAssertionWithIdentifier:error:",  v6,  a4);
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)assertionDescriptorsByPidWithFlattenedAttributes:(BOOL)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  if (assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError)
  {
    if (a4)
    {
      *a4 = (id) assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError;
      return 0LL;
    }

    uint64_t v15 = 0LL;
  }

  else
  {
    [MEMORY[0x189607968] numberWithBool:a3];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_assertionDescriptorsWithFlattenedAttributes_error_,  v7,  0LL);
    uint64_t v8 = (SEL *)objc_claimAutoreleasedReturnValue();

    -[RBSConnection _connection]((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v31 = 0LL;
    v26 = v8;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v8, v9, v10, v11, &v31);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v31;

    if (v13)
    {
      if (a4) {
        *a4 = v13;
      }
      else {
        int v14 = (void *)assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError;
      }
      objc_storeStrong((id *)&assertionDescriptorsByPidWithFlattenedAttributes_error__permanentError, v14);
    }

    [MEMORY[0x189603FC8] dictionary];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    id v16 = v12;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v28 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x189607968];
          [v21 identifier];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "numberWithInt:", objc_msgSend(v23, "clientPid"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          [v15 objectForKey:v24];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            [MEMORY[0x189603FE0] set];
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            [v15 setObject:v25 forKey:v24];
          }

          [v25 addObject:v21];
        }

        uint64_t v18 = [v16 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }

      while (v18);
    }
  }

  return v15;
}

- (id)executeLaunchRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = (__CFString *)a3;
  id v5 = -[RBSLaunchResponse _init](objc_alloc(&OBJC_CLASS___RBSLaunchResponse), "_init");
  id v6 = v5;
  if (executeLaunchRequest__permanentError)
  {
    objc_msgSend(v5, "setError:");
  }

  else
  {
    rbs_general_log();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v4;
      _os_log_impl(&dword_185F67000, v7, OS_LOG_TYPE_INFO, "Sending launch request: %{public}@", buf, 0xCu);
    }

    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_executeLaunchRequest_error_,  v4,  0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v30 = 0LL;
    [v8 sendToConnection:v9 error:&v30];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v30;
    id v12 = (__CFString *)v30;

    [v6 setError:v12];
    [v10 decodeObjectOfClass:objc_opt_class() forKey:@"return-value"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setProcess:v13];
    rbs_general_log();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = @"No Error";
      if (!v13) {
        uint64_t v15 = v12;
      }
      *(_DWORD *)buf = 138543362;
      v32 = v15;
      _os_log_impl(&dword_185F67000, v14, OS_LOG_TYPE_INFO, "Received launch request response: <%{public}@>", buf, 0xCu);
    }

    [v10 decodeObjectOfClass:objc_opt_class() forKey:@"assertion-identifier"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      __int128 v27 = v13;
      __int128 v28 = v12;
      __int128 v29 = v8;
      -[__CFString context](v4, "context");
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 identity];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBSTarget targetWithProcessIdentity:](&OBJC_CLASS___RBSTarget, "targetWithProcessIdentity:", v18);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v17 explanation];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 attributes];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:]( &OBJC_CLASS___RBSAssertionDescriptor,  "descriptorWithIdentifier:target:explanation:attributes:",  v16,  v19,  v20,  v21);
      id v23 = -[RBSAssertion _initWithServerValidatedDescriptor:]( objc_alloc(&OBJC_CLASS___RBSAssertion),  "_initWithServerValidatedDescriptor:",  v22);
      rbs_assertion_log();
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[RBSConnection acquireAssertion:error:].cold.2();
      }

      os_unfair_lock_lock(&self->_assertionLock);
      -[NSMapTable setObject:forKey:](self->_acquiredAssertionsByIdentifier, "setObject:forKey:", v23, v16);
      os_unfair_lock_unlock(&self->_assertionLock);
      [v6 setAssertion:v23];

      id v12 = v28;
      uint64_t v8 = v29;
      id v13 = v27;
    }

    [v10 decodeDictionaryOfClass:objc_opt_class() forKey:@"managed-endpoint-by-launch-identifier"];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v25 count]) {
      [v6 setManagedEndpointByLaunchIdentifier:v25];
    }
  }

  return v6;
}

- (BOOL)executeTerminateRequest:(id)a3 assertion:(id *)a4 error:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  uint64_t v9 = (__CFString *)a3;
  if (executeTerminateRequest_assertion_error__permanentError)
  {
    LOBYTE(v10) = 0;
    if (a5) {
      *a5 = (id) executeTerminateRequest_assertion_error__permanentError;
    }
  }

  else
  {
    rbs_general_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v9;
      _os_log_impl(&dword_185F67000, v11, OS_LOG_TYPE_INFO, "Sending terminate request: %{public}@", buf, 0xCu);
    }
    v34 = -[__CFString context](v9, "context");
    [v34 attributes];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 count];

    uint64_t v33 = a4;
    if (!a4 && v13)
    {
      [MEMORY[0x1896077D8] currentHandler];
      int v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 handleFailureInMethod:a2 object:self file:@"RBSConnection.m" lineNumber:414 description:@"Cannot attempt to create a prevent launch assertion if the client will not retain the assertion"];
    }

    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_executeTerminateRequest_identifier_error_,  v9,  0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v35 = 0LL;
    [v15 sendToConnection:v16 error:&v35];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id obj = v35;
    uint64_t v18 = (__CFString *)v35;

    int v10 = [v17 decodeBoolForKey:@"return-value"];
    rbs_general_log();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = @"Success";
      if (!v10) {
        id v20 = v18;
      }
      *(_DWORD *)buf = 138543362;
      v37 = v20;
      _os_log_impl( &dword_185F67000,  v19,  OS_LOG_TYPE_INFO,  "Received terminate request response: <%{public}@>",  buf,  0xCu);
    }

    [v17 decodeObjectOfClass:objc_opt_class() forKey:@"assertion-identifier"];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      __int128 v29 = v18;
      id v30 = v17;
      id v31 = v15;
      v22 = +[RBSTarget systemTarget](&OBJC_CLASS___RBSTarget, "systemTarget");
      [v34 explanation];
      id v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 attributes];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = +[RBSAssertionDescriptor descriptorWithIdentifier:target:explanation:attributes:]( &OBJC_CLASS___RBSAssertionDescriptor,  "descriptorWithIdentifier:target:explanation:attributes:",  v21,  v22,  v23,  v24);
      id v26 = -[RBSAssertion _initWithServerValidatedDescriptor:]( objc_alloc(&OBJC_CLASS___RBSAssertion),  "_initWithServerValidatedDescriptor:",  v25);
      rbs_assertion_log();
      __int128 v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[RBSConnection acquireAssertion:error:].cold.2();
      }

      os_unfair_lock_lock(&self->_assertionLock);
      -[NSMapTable setObject:forKey:](self->_acquiredAssertionsByIdentifier, "setObject:forKey:", v26, v21);
      os_unfair_lock_unlock(&self->_assertionLock);
      if (v33) {
        *uint64_t v33 = v26;
      }

      uint64_t v17 = v30;
      uint64_t v15 = v31;
      uint64_t v18 = v29;
    }

    if (a5) {
      *a5 = v18;
    }
  }

  return v10;
}

- (id)handleForKey:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = -[RBSConnection _lock_connect]((os_unfair_lock_s *)self);
  BOOL v7 = self->_handleConnection;
  if (!v7)
  {
    rbs_connection_log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = @"com.apple.runningboard";
      _os_log_impl( &dword_185F67000,  v8,  OS_LOG_TYPE_DEFAULT,  "Creating side-channel connection to %{public}@",  buf,  0xCu);
    }

    mach_service = xpc_connection_create_mach_service( (const char *)[@"com.apple.runningboard" UTF8String],  0,  2uLL);
    handleConnection = self->_handleConnection;
    self->_handleConnection = mach_service;

    id v11 = mach_service;
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __30__RBSConnection_handleForKey___block_invoke;
    handler[3] = &unk_189DE0E08;
    BOOL v7 = v11;
    uint64_t v17 = v7;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_activate(v7);
  }

  os_unfair_lock_unlock(p_lock);
  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_lookupHandleForKey_error_,  v5,  0LL);
  id v12 = (SEL *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = objc_opt_class();
  -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v12, v7, v13, 0LL);
  int v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (os_unfair_lock_s)_lock_connect
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return a1;
  }
  uint64_t v1 = (uint64_t)a1;
  os_unfair_lock_assert_owner(a1 + 10);
  uint64_t v2 = *(void **)(v1 + 8);
  if (v2)
  {
LABEL_9:
    a1 = v2;
    return a1;
  }

  if (*(void *)(v1 + 144) == 3LL)
  {
    uint64_t v2 = 0LL;
    goto LABEL_9;
  }

  char CanAccessMachService = RBSSandboxCanAccessMachService();
  rbs_connection_log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if ((CanAccessMachService & 1) != 0)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543362;
      uint64_t v9 = @"com.apple.runningboard";
      _os_log_impl(&dword_185F67000, v5, OS_LOG_TYPE_DEFAULT, "Creating connection to %{public}@", (uint8_t *)&v8, 0xCu);
    }

    xpc_connection_t mach_service = xpc_connection_create_mach_service( (const char *)[@"com.apple.runningboard" UTF8String],  *(dispatch_queue_t *)(v1 + 56),  2uLL);
    -[RBSConnection _lock_setConnection:](v1, mach_service);

    uint64_t v2 = *(void **)(v1 + 8);
    goto LABEL_9;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    -[RBSConnection _lock_connect].cold.1();
  }

  return (os_unfair_lock_s *)0LL;
}

void __30__RBSConnection_handleForKey___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x186E30AB4]() == MEMORY[0x1895F9268])
  {
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }

  else
  {
    uint64_t v4 = MEMORY[0x186E30AB4](v3);
    if (v4 == MEMORY[0x1895F9250])
    {
      rbs_connection_log();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __30__RBSConnection_handleForKey___block_invoke_cold_1();
      }

      xpc_dictionary_apply(v3, &__block_literal_global_104);
    }

    else
    {
      uint64_t v5 = v4;
      uint64_t v6 = MEMORY[0x1895F9238];
      rbs_connection_log();
      BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_FAULT);
      if (v5 == v6)
      {
        if (v8) {
          __30__RBSConnection_handleForKey___block_invoke_cold_2();
        }
      }

      else if (v8)
      {
        __30__RBSConnection_handleForKey___block_invoke_cold_3();
      }
    }
  }
}

uint64_t __30__RBSConnection_handleForKey___block_invoke_102(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  rbs_connection_log();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = a2;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( &dword_185F67000,  v5,  OS_LOG_TYPE_DEFAULT,  "errant message dictionary key:'%s' value:%@",  (uint8_t *)&v7,  0x16u);
  }

  return 1LL;
}

- (id)processName:(id)a3
{
  id v4 = (SEL *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = objc_opt_class();
  id v11 = 0LL;
  -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v4, v5, v6, &v11);
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v11;

  if (v8)
  {
    rbs_process_log();
    __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection processName:].cold.1();
    }
  }

  return v7;
}

- (id)portForIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  rbs_general_log();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_185F67000, v5, OS_LOG_TYPE_INFO, "Fetching port for identifier: %{public}@", buf, 0xCu);
  }

  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_lookupPortForIdentifier_error_,  v4,  0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  [v6 sendToConnection:v7 error:&v14];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v14;

  [v8 decodeObjectOfClass:objc_opt_class() forKey:@"return-value"];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_general_log();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[RBSConnection portForIdentifier:].cold.1();
    }
  }

  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v10;
    _os_log_impl( &dword_185F67000,  v12,  OS_LOG_TYPE_INFO,  "Received port for identifier response: <%{public}@>",  buf,  0xCu);
  }

  return v10;
}

- (id)handleForPredicate:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  if (v6)
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_lookupHandleForPredicate_error_,  v6,  0LL);
    int v7 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = objc_opt_class();
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v7, v8, v9, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }

  else if (a4)
  {
    id v10 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x1896075F0];
    v14[0] = @"No predicate specified";
    [MEMORY[0x189603F68] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 errorWithDomain:@"RBSRequestErrorDomain" code:1 userInfo:v11];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

- (void)subscribeToProcessDeath:(id)a3 handler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = subscribeToProcessDeath_handler__onceToken;
  id v8 = a3;
  if (v7 != -1) {
    dispatch_once(&subscribeToProcessDeath_handler__onceToken, &__block_literal_global_120);
  }
  qos_class_t v9 = qos_class_self();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_2;
  v12[3] = &unk_189DE0E50;
  qos_class_t v14 = v9;
  id v13 = v6;
  id v10 = v6;
  id v11 = (void *)[v12 copy];
  -[RBSConnection _subscribeToProcessDeath:handler:]((uint64_t)self, v8, v11);
}

void __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke()
{
  dispatch_queue_t v0 = +[RBSWorkloop createCalloutQueue:]((uint64_t)&OBJC_CLASS___RBSWorkloop, @"RBSProcessDeathQueue");
  uint64_t v1 = (void *)subscribeToProcessDeath_handler__processDeathQueue;
  subscribeToProcessDeath_handler__processDeathQueue = (uint64_t)v0;
}

void __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)subscribeToProcessDeath_handler__processDeathQueue;
  dispatch_qos_class_t v8 = *(_DWORD *)(a1 + 40);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_3;
  v12[3] = &unk_189DE0BF0;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  RBSDispatchAsyncWithQoS(v7, v8, v12);
}

uint64_t __49__RBSConnection_subscribeToProcessDeath_handler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_subscribeToProcessDeath:(void *)a3 handler:
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void (**)(void, void, void))v6;
  if (!a1) {
    goto LABEL_21;
  }
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 handleFailureInMethod:sel__subscribeToProcessDeath_handler_, a1, @"RBSConnection.m", 550, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

    if (v7) {
      goto LABEL_4;
    }
LABEL_23:
    [MEMORY[0x1896077D8] currentHandler];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:sel__subscribeToProcessDeath_handler_, a1, @"RBSConnection.m", 551, @"Invalid parameter not satisfying: %@", @"handler" object file lineNumber description];

    goto LABEL_4;
  }

  if (!v6) {
    goto LABEL_23;
  }
LABEL_4:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  [*(id *)(a1 + 120) objectForKey:v5];
  dispatch_qos_class_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    [MEMORY[0x189603FA8] array];
    dispatch_qos_class_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 120) setObject:v8 forKey:v5];
    rbs_process_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v5;
      _os_log_impl(&dword_185F67000, v9, OS_LOG_TYPE_INFO, "Subscribing to death of process %{public}@", buf, 0xCu);
    }
  }

  id v10 = (void *)MEMORY[0x186E3067C](v7);
  [v8 addObject:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_subscribeToProcessDeath_error_,  v5,  0LL);
  id v11 = (SEL *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection](a1);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_opt_class();
  id v25 = 0LL;
  -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v11, v12, v13, &v25);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = v25;

  if (v14
    || ([v15 domain],
        id v16 = (void *)objc_claimAutoreleasedReturnValue(),
        int v17 = [v16 isEqualToString:@"RBSRequestErrorDomain"],
        v16,
        v17))
  {
    rbs_process_log();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v18;
    if (v15)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[RBSConnection _subscribeToProcessDeath:handler:].cold.1();
      }
    }

    else if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v27 = v5;
      _os_log_impl( &dword_185F67000,  v19,  OS_LOG_TYPE_INFO,  "Process %{public}@ is already exited, no need to subscribe",  buf,  0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    uint64_t v20 = (void *)MEMORY[0x186E3067C](v7);
    uint64_t v21 = [v8 indexOfObjectIdenticalTo:v20];

    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v22 = (void *)MEMORY[0x186E3067C](v7);
      [v8 removeObjectIdenticalTo:v22];

      if (![v8 count]) {
        [*(id *)(a1 + 120) removeObjectForKey:v5];
      }
      ((void (**)(void, void *, id))v7)[2](v7, v14, v15);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  }

LABEL_21:
}

- (uint64_t)cleanOutStateIfNeeded
{
  if (result)
  {
    v1[0] = MEMORY[0x1895F87A8];
    v1[1] = 3221225472LL;
    v1[2] = __38__RBSConnection_cleanOutStateIfNeeded__block_invoke;
    v1[3] = &unk_189DE0C68;
    v1[4] = result;
    return +[RBSWorkloop performBackgroundWorkWithServiceClass:block:]( &OBJC_CLASS___RBSWorkloop,  "performBackgroundWorkWithServiceClass:block:",  9LL,  v1);
  }

  return result;
}

void __38__RBSConnection_cleanOutStateIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  [MEMORY[0x189603FE0] set];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 80) allObjects];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v7) configuration];
        dispatch_qos_class_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        id v9 = v8;
        if (v8)
        {
          [v8 predicates];
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          [v2 addObjectsFromArray:v10];
        }

        ++v7;
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v5);
  }

  id v11 = (void *)[*(id *)(*(void *)(a1 + 32) + 88) copy];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  void v14[2] = __38__RBSConnection_cleanOutStateIfNeeded__block_invoke_2;
  v14[3] = &unk_189DE0E78;
  uint64_t v12 = *(void *)(a1 + 32);
  id v15 = v2;
  uint64_t v16 = v12;
  id v13 = v2;
  [v11 enumerateKeysAndObjectsUsingBlock:v14];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
}

void __38__RBSConnection_cleanOutStateIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        objc_msgSend(v6, "process", (void)v14);
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v12) = [v12 matchesProcess:v13];

        if ((v12 & 1) != 0)
        {

          goto LABEL_11;
        }

        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 40) + 88) removeObjectForKey:v5];
LABEL_11:
}

- (BOOL)subscribeProcessStateMonitor:(id)a3 configuration:(id)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  if (subscribeProcessStateMonitor_configuration_error__permanentError)
  {
    BOOL v10 = 0;
    if (a5) {
      *a5 = (id) subscribeProcessStateMonitor_configuration_error__permanentError;
    }
    goto LABEL_20;
  }

  os_unfair_lock_lock(&self->_lock);
  if (!-[NSHashTable containsObject:](self->_processMonitors, "containsObject:", v8)) {
    -[NSHashTable addObject:](self->_processMonitors, "addObject:", v8);
  }
  uint64_t v11 = (void *)-[NSMutableDictionary copy](self->_stateByIdentity, "copy");
  [v8 calloutQueue];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_qos_class_t v13 = [v9 serviceClass];
  uint64_t v14 = MEMORY[0x1895F87A8];
  v38[0] = MEMORY[0x1895F87A8];
  v38[1] = 3221225472LL;
  v38[2] = __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke;
  v38[3] = &unk_189DE0C40;
  id v15 = v11;
  id v39 = v15;
  id v16 = v8;
  id v40 = v16;
  RBSDispatchAsyncWithQoS(v12, v13, v38);

  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (preventLaunchPredicates)
  {
    __int128 v18 = (void *)-[NSSet copy](preventLaunchPredicates, "copy");
    [v16 calloutQueue];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_qos_class_t v20 = [v9 serviceClass];
    uint64_t v21 = v14;
    dispatch_qos_class_t v22 = v20;
    v35[0] = v21;
    v35[1] = 3221225472LL;
    v35[2] = __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke_2;
    v35[3] = &unk_189DE0C40;
    id v36 = v16;
    id v37 = v18;
    id v23 = v18;
    RBSDispatchAsyncWithQoS(v19, v22, v35);
  }

  os_unfair_lock_unlock(&self->_lock);
  int has_internal_content = os_variant_has_internal_content();
  rbs_monitor_log();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
  if (has_internal_content)
  {
    if (v26)
    {
      [v9 debugDescription];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v42 = v27;
LABEL_14:
      _os_log_impl( &dword_185F67000,  v25,  OS_LOG_TYPE_DEFAULT,  "Updating configuration of monitor %{public}@",  buf,  0xCu);
    }
  }

  else if (v26)
  {
    [v9 description];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v27;
    goto LABEL_14;
  }

  -[RBSConnection cleanOutStateIfNeeded]((uint64_t)self);
  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_void_subscribeToProcessStateChangesWithConfiguration_error_,  v9,  0LL);
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  id v34 = 0LL;
  id v30 = (id)[v28 sendToConnection:v29 error:&v34];
  id v31 = v34;
  id v32 = v34;

  if (a5) {
    *a5 = v32;
  }
  BOOL v10 = v32 == 0LL;

LABEL_20:
  return v10;
}

void __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) _handleProcessStateChange:*(void *)(*((void *)&v7 + 1) + 8 * v6++)];
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

uint64_t __66__RBSConnection_subscribeProcessStateMonitor_configuration_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreventLaunchUpdate:*(void *)(a1 + 40)];
}

- (void)unsubscribeProcessStateMonitor:(id)a3 configuration:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSHashTable containsObject:](self->_processMonitors, "containsObject:", v6)) {
    -[NSHashTable removeObject:](self->_processMonitors, "removeObject:", v6);
  }
  os_unfair_lock_unlock(&self->_lock);
  rbs_monitor_log();
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v7;
    _os_log_impl( &dword_185F67000,  v8,  OS_LOG_TYPE_DEFAULT,  "unsubscribing configuration of monitor %{public}@",  buf,  0xCu);
  }

  -[RBSConnection cleanOutStateIfNeeded]((uint64_t)self);
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v7, "identifier"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_async_unsubscribeFromProcessStateChangesWithIdentifier_,  v9,  0LL);
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBSConnection _connection]((uint64_t)self);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = (id)[v10 sendToConnection:v11 error:0];
}

- (id)statesForPredicate:(id)a3 withDescriptor:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (statesForPredicate_withDescriptor_error__permanentError)
  {
    __int128 v10 = 0LL;
    if (a5) {
      *a5 = (id) statesForPredicate_withDescriptor_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_statesForPredicate_descriptor_error_,  v8,  v9,  0LL);
    uint64_t v11 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v18 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v11, v12, v13, v14, &v18);
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v18;

    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        id v16 = (void *)statesForPredicate_withDescriptor_error__permanentError;
      }
      objc_storeStrong((id *)&statesForPredicate_withDescriptor_error__permanentError, v16);
    }
  }

  return v10;
}

- (void)intendToExit:(id)a3 withStatus:(id)a4
{
  id v6 = a3;
  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_void_intendToExit_withStatus_,  v6,  a4,  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSConnection _connection]((uint64_t)self);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  id v9 = (id)[v7 sendToConnection:v8 error:&v12];
  id v10 = v12;

  if (v10)
  {
    rbs_process_log();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[RBSConnection intendToExit:withStatus:].cold.1();
    }
  }
}

- (id)lastExitContextForInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (lastExitContextForInstance_error__permanentError)
  {
    id v7 = 0LL;
    if (a4) {
      *a4 = (id) lastExitContextForInstance_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_lastExitContextForInstance_error_,  v6,  0LL);
    id v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v14 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        id v12 = (void *)lastExitContextForInstance_error__permanentError;
      }
      objc_storeStrong((id *)&lastExitContextForInstance_error__permanentError, v12);
    }
  }

  return v7;
}

- (id)limitationsForInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (limitationsForInstance_error__permanentError)
  {
    id v7 = 0LL;
    if (a4) {
      *a4 = (id) limitationsForInstance_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_limitationsForInstance_error_,  v6,  0LL);
    id v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v14 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        id v12 = (void *)limitationsForInstance_error__permanentError;
      }
      objc_storeStrong((id *)&limitationsForInstance_error__permanentError, v12);
    }
  }

  return v7;
}

- (id)hostProcessForInstance:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (hostProcessForInstance_error__permanentError)
  {
    id v7 = 0LL;
    if (a4) {
      *a4 = (id) hostProcessForInstance_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_hostProcessForInstance_error_,  v6,  0LL);
    id v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v14 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        id v12 = (void *)hostProcessForInstance_error__permanentError;
      }
      objc_storeStrong((id *)&hostProcessForInstance_error__permanentError, v12);
    }
  }

  return v7;
}

- (id)infoPlistResultForInstance:(id)a3 forKeys:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (infoPlistResultForInstance_forKeys_error__permanentError)
  {
    uint64_t v10 = 0LL;
    if (a5) {
      *a5 = (id) infoPlistResultForInstance_forKeys_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_infoPlistResultForInstance_forKeys_error_,  v8,  v9,  0LL);
    id v11 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = objc_opt_class();
    id v18 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v11, v12, v13, &v18);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v18;

    [v14 value];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      uint64_t v10 = 0LL;
    }

    if (v15)
    {
      if (a5) {
        *a5 = v15;
      }
      else {
        id v16 = (void *)infoPlistResultForInstance_forKeys_error__permanentError;
      }
      objc_storeStrong((id *)&infoPlistResultForInstance_forKeys_error__permanentError, v16);
    }
  }

  return v10;
}

- (id)captureStateForSubsystem:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (captureStateForSubsystem_error__permanentError)
  {
    id v7 = 0LL;
    if (a4) {
      *a4 = (id) captureStateForSubsystem_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_captureStateForSubsystem_error_,  v6,  0LL);
    id v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v14 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v8, v9, v10, &v14);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v14;

    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        id v12 = (void *)captureStateForSubsystem_error__permanentError;
      }
      objc_storeStrong((id *)&captureStateForSubsystem_error__permanentError, v12);
    }
  }

  return v7;
}

- (id)identifiersForStateCaptureSubsystems:(id *)a3
{
  if (identifiersForStateCaptureSubsystems__permanentError)
  {
    if (a3)
    {
      *a3 = (id) identifiersForStateCaptureSubsystems__permanentError;
      return 0LL;
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_identifiersForStateCaptureSubsystemsWithError_,  0LL);
    id v6 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v13 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v6, v7, v8, v9, &v13);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v13;

    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        id v12 = (void *)identifiersForStateCaptureSubsystems__permanentError;
      }
      objc_storeStrong((id *)&identifiersForStateCaptureSubsystems__permanentError, v12);
    }
  }

  return v10;
}

- (id)busyExtensionInstancesFromSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (busyExtensionInstancesFromSet_error__permanentError)
  {
    id v7 = 0LL;
    if (a4) {
      *a4 = (id) busyExtensionInstancesFromSet_error__permanentError;
    }
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_busyExtensionInstancesFromSet_error_,  v6,  0LL);
    uint64_t v8 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    id v15 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v8, v9, v10, v11, &v15);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v15;

    if (v12)
    {
      if (a4) {
        *a4 = v12;
      }
      else {
        id v13 = (void *)busyExtensionInstancesFromSet_error__permanentError;
      }
      objc_storeStrong((id *)&busyExtensionInstancesFromSet_error__permanentError, v13);
    }
  }

  return v7;
}

- (id)preventLaunchPredicatesWithError:(id *)a3
{
  if (preventLaunchPredicatesWithError__permanentError)
  {
    if (a3)
    {
      *a3 = (id) preventLaunchPredicatesWithError__permanentError;
      return 0LL;
    }

    uint64_t v10 = 0LL;
  }

  else
  {
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_preventLaunchPredicatesWithError_,  0LL);
    id v6 = (SEL *)objc_claimAutoreleasedReturnValue();
    -[RBSConnection _connection]((uint64_t)self);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    id v13 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](v6, v7, v8, v9, &v13);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v13;

    if (v11)
    {
      if (a3) {
        *a3 = v11;
      }
      else {
        id v12 = (void *)preventLaunchPredicatesWithError__permanentError;
      }
      objc_storeStrong((id *)&preventLaunchPredicatesWithError__permanentError, v12);
    }
  }

  return v10;
}

- (void)reset
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = 136315138;
  uint64_t v4 = "-[RBSConnection reset]";
  OUTLINED_FUNCTION_4_0(&dword_185F67000, a1, a3, "%s no longer does anything", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

- (BOOL)saveEndowment:(id)a3 withError:(id *)a4
{
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"RBSConnection.m", 901, @"Invalid parameter not satisfying: %@", @"savedEndowment" object file lineNumber description];
  }

  if (saveEndowment_withError__permanentError)
  {
    LOBYTE(v8) = 0;
    if (a4) {
      *a4 = (id) saveEndowment_withError__permanentError;
    }
  }

  else
  {
    -[RBSConnection _connection]((uint64_t)self);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(&self->_savedEndowmentLock);
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_saveEndowment_withError_,  v7,  0LL);
    uint64_t v10 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = objc_opt_class();
    id v17 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v10, v9, v11, &v17);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v17;
    id v14 = v17;

    if (a4) {
      *a4 = v14;
    }
    int v8 = [v12 BOOLValue];
    if (v8) {
      -[NSMutableArray addObject:](self->_savedEndowments, "addObject:", v7);
    }
    os_unfair_lock_unlock(&self->_savedEndowmentLock);
  }

  return v8;
}

- (void)async_willExpireAssertionsSoon
{
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_185F67000, v3, OS_LOG_TYPE_DEFAULT, "Received process assertions expiration warning!", buf, 2u);
  }

  p_processExpirationLock = &self->_processExpirationLock;
  os_unfair_lock_lock(&self->_processExpirationLock);
  uint64_t v5 = (void *)-[NSHashTable copy](self->_expirationWarningClients, "copy");
  os_unfair_lock_unlock(p_processExpirationLock);
  rbs_general_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_185F67000,  v6,  OS_LOG_TYPE_DEFAULT,  "Notifying client of imminent expiration of assertion",  buf,  2u);
  }

  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __47__RBSConnection_async_willExpireAssertionsSoon__block_invoke;
  v8[3] = &unk_189DE0C68;
  id v9 = v5;
  id v7 = v5;
  +[RBSWorkloop performCalloutWithServiceClass:block:]((uint64_t)&OBJC_CLASS___RBSWorkloop, QOS_CLASS_USER_INITIATED, v8);
}

void __47__RBSConnection_async_willExpireAssertionsSoon__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      uint64_t v5 = 0LL;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        (*(void (**)(void))(*(void *)(*(void *)(*((void *)&v8 + 1) + 8 * v5++) + 8LL) + 16LL))();
      }

      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v3);
  }

  rbs_general_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_185F67000, v6, OS_LOG_TYPE_DEFAULT, "Expiration notification complete", v7, 2u);
  }
}

- (void)async_didChangeInheritances:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  rbs_connection_log();
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[RBSConnection async_didChangeInheritances:completion:].cold.1();
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  inheritances = self->_inheritances;
  [v6 gainedInheritances];
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet unionSet:](inheritances, "unionSet:", v11);

  id v12 = self->_inheritances;
  [v6 lostInheritances];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet minusSet:](v12, "minusSet:", v13);

  id v14 = self->_serviceDelegate;
  os_unfair_lock_unlock(p_lock);
  [v6 gainedInheritances];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 count];

  if (v16)
  {
    [v6 gainedInheritances];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnectionServiceDelegate didReceiveInheritances:](v14, "didReceiveInheritances:", v17);
  }

  [v6 lostInheritances];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 count];

  if (v19)
  {
    [v6 lostInheritances];
    dispatch_qos_class_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBSConnectionServiceDelegate didLoseInheritances:](v14, "didLoseInheritances:", v20);
  }

  v7[2](v7);
}

- (void)async_assertionsDidInvalidate:(id)a3 withError:(id)a4
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189603FE0] set];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_assertionLock);
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v28 + 1) + 8 * v13);
        rbs_assertion_log();
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v14;
          _os_log_debug_impl(&dword_185F67000, v15, OS_LOG_TYPE_DEBUG, "Assertion %{public}@ did invalidate", buf, 0xCu);
        }

        -[NSMapTable objectForKey:](self->_acquiredAssertionsByIdentifier, "objectForKey:", v14);
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        rbs_assertion_log();
        id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        id v18 = v17;
        if (v16)
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v14;
            _os_log_debug_impl( &dword_185F67000,  v18,  OS_LOG_TYPE_DEBUG,  "Removing assertion %{public}@ from dictionary",  buf,  0xCu);
          }

          -[NSMapTable removeObjectForKey:](self->_acquiredAssertionsByIdentifier, "removeObjectForKey:", v14);
          [v8 addObject:v16];
        }

        else
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v34 = v14;
            _os_log_impl( &dword_185F67000,  v18,  OS_LOG_TYPE_INFO,  "Client is not tracking assertion %{public}@",  buf,  0xCu);
          }
        }

        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v28 objects:v35 count:16];
    }

    while (v11);
  }

  os_unfair_lock_unlock(&self->_assertionLock);
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v19 = v8;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v25;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v25 != v22) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * i) _serverInvalidateWithError:v7];
      }

      uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }

    while (v21);
  }
}

- (void)async_assertionWillInvalidate:(id)a3
{
  id v4 = a3;
  rbs_assertion_log();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RBSConnection async_assertionWillInvalidate:].cold.1();
  }

  p_assertionLock = &self->_assertionLock;
  os_unfair_lock_lock(&self->_assertionLock);
  -[NSMapTable objectForKey:](self->_acquiredAssertionsByIdentifier, "objectForKey:", v4);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_assertionLock);
  -[RBSAssertion _serverWillInvalidate]((uint64_t)v7);
}

- (void)async_observedProcessStatesDidChange:(id)a3 completion:(id)a4
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v37 = (void (**)(void))a4;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_processMonitors, "allObjects");
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v49;
    uint64_t v38 = self;
    uint64_t v39 = *(void *)v49;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        rbs_monitor_log();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          [v11 process];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          int v14 = objc_msgSend(v13, "rbs_pid");
          [v11 process];
          id v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 identity];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromRBSTaskState([v11 taskState]);
          uint64_t v17 = v8;
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 endowmentNamespaces];
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          int v20 = [v19 containsObject:@"com.apple.frontboard.visibility"];
          *(_DWORD *)buf = 67109890;
          uint64_t v21 = @"-NotVisible";
          if (v20) {
            uint64_t v21 = @"-Visible";
          }
          int v54 = v14;
          __int16 v55 = 2114;
          v56 = v16;
          __int16 v57 = 2114;
          v58 = v18;
          __int16 v59 = 2114;
          v60 = v21;
          _os_log_impl( &dword_185F67000,  v12,  OS_LOG_TYPE_DEFAULT,  "Received state update for %d (%{public}@, %{public}@%{public}@",  buf,  0x26u);

          uint64_t v8 = v17;
          self = v38;
          uint64_t v9 = v39;
        }

        [v11 process];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 identity];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23) {
          -[RBSConnection async_observedProcessStatesDidChange:completion:].cold.1();
        }
        int v24 = [v11 isEmptyState];
        stateByIdentity = self->_stateByIdentity;
        if (v24) {
          -[NSMutableDictionary removeObjectForKey:](stateByIdentity, "removeObjectForKey:", v23);
        }
        else {
          -[NSMutableDictionary setObject:forKey:](stateByIdentity, "setObject:forKey:", v11, v23);
        }
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v48 objects:v61 count:16];
    }

    while (v8);
  }

  os_unfair_lock_unlock(lock);
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v26 = v35;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v45;
    uint64_t v30 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t j = 0LL; j != v28; ++j)
      {
        if (*(void *)v45 != v29) {
          objc_enumerationMutation(v26);
        }
        id v32 = *(void **)(*((void *)&v44 + 1) + 8 * j);
        [v32 calloutQueue];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_qos_class_t v34 = [v32 serviceClass];
        v41[0] = v30;
        v41[1] = 3221225472LL;
        v41[2] = __65__RBSConnection_async_observedProcessStatesDidChange_completion___block_invoke;
        v41[3] = &unk_189DE0C40;
        id v42 = obj;
        uint64_t v43 = v32;
        RBSDispatchAsyncWithQoS(v33, v34, v41);
      }

      uint64_t v28 = [v26 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }

    while (v28);
  }

  v37[2](v37);
}

void __65__RBSConnection_async_observedProcessStatesDidChange_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 40),  "_handleProcessStateChange:",  *(void *)(*((void *)&v7 + 1) + 8 * v6++),  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)async_observedProcessExitEvents:(id)a3 completion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v17 = (void (**)(void))a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_processMonitors, "allObjects");
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v23;
    uint64_t v12 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        int v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "calloutQueue", v17);
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        dispatch_qos_class_t v16 = [v14 serviceClass];
        v19[0] = v12;
        v19[1] = 3221225472LL;
        v19[2] = __60__RBSConnection_async_observedProcessExitEvents_completion___block_invoke;
        v19[3] = &unk_189DE0C40;
        id v20 = v6;
        uint64_t v21 = v14;
        RBSDispatchAsyncWithQoS(v15, v16, v19);
      }

      uint64_t v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v10);
  }

  v17[2](v17);
}

void __60__RBSConnection_async_observedProcessExitEvents_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "_handleExitEvent:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)async_observedPreventLaunchPredicatesUpdate:(id)a3 completion:(id)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (NSSet *)a3;
  __int128 v7 = (void (**)(void))a4;
  if (!v6)
  {
    [MEMORY[0x189604010] set];
    uint64_t v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }

  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (v6 == preventLaunchPredicates || v6 && preventLaunchPredicates && -[NSSet isEqual:](v6, "isEqual:"))
  {
    os_unfair_lock_unlock(&self->_lock);
    v7[2](v7);
  }

  else
  {
    id v19 = v7;
    objc_storeStrong((id *)&self->_preventLaunchPredicates, v6);
    -[NSHashTable allObjects](self->_processMonitors, "allObjects");
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v24;
      uint64_t v14 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(obj);
          }
          dispatch_qos_class_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "calloutQueue", v19);
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_qos_class_t v18 = [v16 serviceClass];
          v21[0] = v14;
          v21[1] = 3221225472LL;
          v21[2] = __72__RBSConnection_async_observedPreventLaunchPredicatesUpdate_completion___block_invoke;
          v21[3] = &unk_189DE0C40;
          v21[4] = v16;
          __int128 v22 = v6;
          RBSDispatchAsyncWithQoS(v17, v18, v21);
        }

        uint64_t v12 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v12);
    }

    __int128 v7 = v19;
    v19[2](v19);
  }
}

uint64_t __72__RBSConnection_async_observedPreventLaunchPredicatesUpdate_completion___block_invoke( uint64_t a1)
{
  return [*(id *)(a1 + 32) _handlePreventLaunchUpdate:*(void *)(a1 + 40)];
}

- (void)async_processDidExit:(id)a3 withContext:(id)a4
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  rbs_process_log();
  __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_impl( &dword_185F67000,  v8,  OS_LOG_TYPE_DEFAULT,  "Firing exit handlers for %{public}@ with context %{public}@",  buf,  0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_deathHandlers, "objectForKey:", v6);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v10 = (void *)[v9 copy];

  -[NSMutableDictionary removeObjectForKey:](self->_deathHandlers, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0LL;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v15) + 16LL))(*(void *)(*((void *)&v16 + 1) + 8 * v15));
        ++v15;
      }

      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v13);
  }
}

void __37__RBSConnection__initWithConnection___block_invoke(uint64_t a1)
{
}

- (void)_handshake
{
}

- (void)_lock_setConnection:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 40));
    objc_storeStrong((id *)(a1 + 8), a2);
    xpc_connection_set_target_queue(*(xpc_connection_t *)(a1 + 8), *(dispatch_queue_t *)(a1 + 56));
    uint64_t v5 = *(_xpc_connection_s **)(a1 + 8);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __37__RBSConnection__lock_setConnection___block_invoke;
    handler[3] = &unk_189DE0E08;
    void handler[4] = a1;
    xpc_connection_set_event_handler(v5, handler);
    xpc_connection_activate(*(xpc_connection_t *)(a1 + 8));
    id v6 = *(_xpc_connection_s **)(a1 + 8);
    xpc_object_t v7 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_connection_send_message(v6, v7);
  }
}

- (void)_handleMessage:(uint64_t)a1
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 56));
    +[RBSXPCMessage messageForXPCMessage:](&OBJC_CLASS___RBSXPCMessage, "messageForXPCMessage:", v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 method];
    if (v4) {
      BOOL v6 = v5 == 0;
    }
    else {
      BOOL v6 = 1;
    }
    if (v6)
    {
      rbs_connection_log();
      xpc_object_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RBSConnection _handleMessage:].cold.4();
      }
    }

    else
    {
      __int128 v8 = (const char *)v5;
      char v9 = objc_opt_respondsToSelector();
      if ((v9 & 1) != 0)
      {
        rbs_message_log();
        __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[RBSConnection _handleMessage:].cold.2(a1, v8, v10);
        }

        [v4 reply];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = MEMORY[0x1895F87A8];
        v58[0] = MEMORY[0x1895F87A8];
        v58[1] = 3221225472LL;
        v58[2] = __32__RBSConnection__handleMessage___block_invoke;
        v58[3] = &unk_189DE0C68;
        xpc_object_t v7 = v11;
        __int16 v59 = v7;
        uint64_t v13 = (void *)MEMORY[0x186E3067C](v58);
        v56[0] = 0LL;
        v56[1] = v56;
        v56[2] = 0x3032000000LL;
        v56[3] = __Block_byref_object_copy__1;
        v56[4] = __Block_byref_object_dispose__1;
        id v57 = 0LL;
        if (v8 == sel_async_didChangeInheritances_completion_)
        {
          activity_block[0] = v12;
          activity_block[1] = 3221225472LL;
          activity_block[2] = __32__RBSConnection__handleMessage___block_invoke_2;
          activity_block[3] = &unk_189DE0EA0;
          int v54 = v56;
          id v51 = v4;
          uint64_t v52 = a1;
          id v53 = v13;
          __int16 v55 = v8;
          _os_activity_initiate(&dword_185F67000, "didChangeInheritances", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
        }

        else if (v8 == sel_async_willExpireAssertionsSoon)
        {
          v49[0] = v12;
          v49[1] = 3221225472LL;
          v49[2] = __32__RBSConnection__handleMessage___block_invoke_185;
          v49[3] = &unk_189DE0C68;
          v49[4] = a1;
          _os_activity_initiate(&dword_185F67000, "willExpireAssertionsSoon", OS_ACTIVITY_FLAG_DEFAULT, v49);
        }

        else if (v8 == sel_async_assertionWillInvalidate_)
        {
          v44[0] = v12;
          v44[1] = 3221225472LL;
          v44[2] = __32__RBSConnection__handleMessage___block_invoke_2_188;
          v44[3] = &unk_189DE0EC8;
          id v45 = v4;
          uint64_t v46 = a1;
          __int128 v47 = v56;
          __int128 v48 = v8;
          _os_activity_initiate(&dword_185F67000, "assertionWillInvalidate", OS_ACTIVITY_FLAG_DEFAULT, v44);
        }

        else if (v8 == sel_async_assertionsDidInvalidate_withError_)
        {
          v39[0] = v12;
          v39[1] = 3221225472LL;
          v39[2] = __32__RBSConnection__handleMessage___block_invoke_191;
          v39[3] = &unk_189DE0EC8;
          id v40 = v4;
          uint64_t v41 = a1;
          id v42 = v56;
          uint64_t v43 = v8;
          _os_activity_initiate(&dword_185F67000, "assertionsDidInvalidate", OS_ACTIVITY_FLAG_DEFAULT, v39);
        }

        else if (v8 == sel_async_observedProcessStatesDidChange_completion_)
        {
          v33[0] = v12;
          v33[1] = 3221225472LL;
          v33[2] = __32__RBSConnection__handleMessage___block_invoke_194;
          v33[3] = &unk_189DE0EA0;
          id v37 = v56;
          id v34 = v4;
          uint64_t v35 = a1;
          id v36 = v13;
          uint64_t v38 = v8;
          _os_activity_initiate(&dword_185F67000, "observedProcessStatesDidChange", OS_ACTIVITY_FLAG_DEFAULT, v33);
        }

        else if (v8 == sel_async_observedProcessExitEvents_completion_)
        {
          v27[0] = v12;
          v27[1] = 3221225472LL;
          v27[2] = __32__RBSConnection__handleMessage___block_invoke_197;
          v27[3] = &unk_189DE0EA0;
          __int128 v31 = v56;
          id v28 = v4;
          uint64_t v29 = a1;
          id v30 = v13;
          id v32 = v8;
          _os_activity_initiate(&dword_185F67000, "observedProcessExitEvents", OS_ACTIVITY_FLAG_DEFAULT, v27);
        }

        else if (v8 == sel_async_observedPreventLaunchPredicatesUpdate_completion_)
        {
          v21[0] = v12;
          v21[1] = 3221225472LL;
          v21[2] = __32__RBSConnection__handleMessage___block_invoke_201;
          v21[3] = &unk_189DE0EA0;
          uint64_t v25 = v56;
          id v22 = v4;
          uint64_t v23 = a1;
          id v24 = v13;
          __int128 v26 = v8;
          _os_activity_initiate( &dword_185F67000,  "observedPreventLaunchPredicatesUpdate",  OS_ACTIVITY_FLAG_DEFAULT,  v21);
        }

        else if (v8 == sel_async_processDidExit_withContext_)
        {
          v16[0] = v12;
          v16[1] = 3221225472LL;
          v16[2] = __32__RBSConnection__handleMessage___block_invoke_204;
          v16[3] = &unk_189DE0EC8;
          id v17 = v4;
          uint64_t v18 = a1;
          __int128 v19 = v56;
          id v20 = v8;
          _os_activity_initiate(&dword_185F67000, "processDidExit", OS_ACTIVITY_FLAG_DEFAULT, v16);
        }

        else
        {
          rbs_connection_log();
          uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(v8);
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBSConnection _handleMessage:].cold.1(v15, (uint64_t)v60, v14);
          }
        }

        _Block_object_dispose(v56, 8);
      }

      else
      {
        rbs_connection_log();
        xpc_object_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[RBSConnection _handleMessage:].cold.3(v8, v7);
        }
      }
    }
  }
}

uint64_t __32__RBSConnection__handleMessage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) send];
}

void __32__RBSConnection__handleMessage___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    rbs_connection_log();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_didChangeInheritances:completion:", v5, *(void *)(a1 + 48));
  }
}

uint64_t __32__RBSConnection__handleMessage___block_invoke_185(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "async_willExpireAssertionsSoon");
}

void __32__RBSConnection__handleMessage___block_invoke_2_188(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  id v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    rbs_connection_log();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_assertionWillInvalidate:", v5);
  }
}

void __32__RBSConnection__handleMessage___block_invoke_191(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  xpc_object_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = objc_opt_class();
  char v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v12 = 0LL;
  [v7 decodeArgumentWithClass:v8 atIndex:1 allowNil:0 error:&v12];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v9, v12);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    rbs_connection_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_assertionsDidInvalidate:withError:", v6, v10);
  }
}

void __32__RBSConnection__handleMessage___block_invoke_194(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    rbs_connection_log();
    xpc_object_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedProcessStatesDidChange:completion:", v6, *(void *)(a1 + 48));
  }
}

void __32__RBSConnection__handleMessage___block_invoke_197(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:0 error:&obj];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    rbs_connection_log();
    xpc_object_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedProcessExitEvents:completion:", v6, *(void *)(a1 + 48));
  }
}

void __32__RBSConnection__handleMessage___block_invoke_201(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = (id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentCollection:v3 withClass:v4 atIndex:0 allowNil:1 error:&obj];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v5, obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL))
  {
    rbs_connection_log();
    xpc_object_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_observedPreventLaunchPredicatesUpdate:completion:", v6, *(void *)(a1 + 48));
  }
}

void __32__RBSConnection__handleMessage___block_invoke_204(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id obj = 0LL;
  [v2 decodeArgumentWithClass:v3 atIndex:0 allowNil:0 error:&obj];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v4, obj);
  BOOL v6 = *(void **)(a1 + 32);
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = (id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
  id v11 = 0LL;
  [v6 decodeArgumentWithClass:v7 atIndex:1 allowNil:0 error:&v11];
  char v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v8, v11);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL))
  {
    rbs_connection_log();
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1();
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 40), "async_processDidExit:withContext:", v5, v9);
  }
}

void __37__RBSConnection__lock_setConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MEMORY[0x186E30AB4]();
  if (v4 == MEMORY[0x1895F9268])
  {
    id v5 = (id)MEMORY[0x1895F9198];
    rbs_connection_log();
    BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
    if (v3 == v5)
    {
      if (v7) {
        __37__RBSConnection__lock_setConnection___block_invoke_cold_1();
      }

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8LL), &__block_literal_global_208);
      xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 8LL));
      uint64_t v8 = *(void *)(a1 + 32);
      char v9 = *(void **)(v8 + 8);
      *(void *)(v8 + 8) = 0LL;

      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = *(void **)(v10 + 16);
      *(void *)(v10 + 16) = 0LL;

      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
      -[RBSConnection _handshake](*(void *)(a1 + 32));
    }

    else
    {
      if (v7) {
        __37__RBSConnection__lock_setConnection___block_invoke_cold_2();
      }

      -[RBSConnection _disconnect](*(void *)(a1 + 32));
    }
  }

  else if (v4 == MEMORY[0x1895F9250])
  {
    -[RBSConnection _handleMessage:](*(void *)(a1 + 32), v3);
  }
}

- (void)_disconnect
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    id v3 = *(_xpc_connection_s **)(a1 + 8);
    if (v3)
    {
      xpc_connection_set_event_handler(v3, &__block_literal_global_234);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 8));
      uint64_t v4 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0LL;

      id v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = 0LL;
    }

    *(void *)(a1 + 144) = 3LL;
    os_unfair_lock_unlock(v2);
  }

- (void)_lock_announceLostInheritances
{
  if (a1)
  {
    os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 40));
    id v3 = *(id *)(a1 + 32);
    id v2 = (void *)[*(id *)(a1 + 104) copy];
    if ([v2 count]) {
      [v3 didLoseInheritances:v2];
    }
  }

void __27__RBSConnection__handshake__block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v96 = *MEMORY[0x1895F89C0];
  id v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  uint64_t v3 = *(void *)&(*v2)[36]._os_unfair_lock_opaque;
  os_unfair_lock_unlock(*v2 + 10);
  if (v3 != 3)
  {
    unint64_t v4 = 0LL;
    uint64_t v73 = v1;
    while (1)
    {
      rbs_connection_log();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v4 + 1;
        _os_log_impl( &dword_185F67000,  v5,  OS_LOG_TYPE_DEFAULT,  "Sending handshake request attempt #%lu to server",  buf,  0xCu);
      }

      os_unfair_lock_lock(*v2 + 10);
      -[RBSConnection _lock_connect](*v2);
      BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = *(void *)&(*v2)[36]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(*v2 + 10);
      if (v7 == 3 || v6 == 0LL) {
        break;
      }
      +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_handshakeWithRequest_,  *(void *)(v1 + 40),  0LL);
      char v9 = (SEL *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = objc_opt_class();
      id v89 = 0LL;
      -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v6, v10, &v89);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      id v12 = v89;
      if (v11)
      {
        rbs_connection_log();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_185F67000, v13, OS_LOG_TYPE_DEFAULT, "Handshake succeeded", buf, 2u);
        }

        uint64_t v7 = 2LL;
      }

      else
      {
        if (v4 >= 0x3E8) {
          __27__RBSConnection__handshake__block_invoke_cold_4();
        }
        rbs_connection_log();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v12;
          _os_log_error_impl( &dword_185F67000,  v14,  OS_LOG_TYPE_ERROR,  "Handshake failed with error: <%{public}@>",  buf,  0xCu);
        }

        os_unfair_lock_lock(*v2 + 10);
        -[RBSConnection _lock_announceLostInheritances]((uint64_t)*v2);
        os_unfair_lock_unlock(*v2 + 10);
        unsigned int v15 = (unsigned __int16)++v4 / 0xAu;
        if (v15 >= 0xA) {
          uint64_t v16 = 10LL;
        }
        else {
          uint64_t v16 = v15;
        }
        if ((_DWORD)v16)
        {
          rbs_connection_log();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v16;
            _os_log_impl( &dword_185F67000,  v17,  OS_LOG_TYPE_DEFAULT,  "Sleeping for %lus before trying to reconnect",  buf,  0xCu);
          }

          sleep(v16);
        }

        uint64_t v1 = v73;
      }

      if (v11) {
        goto LABEL_30;
      }
    }

    rbs_connection_log();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __27__RBSConnection__handshake__block_invoke_cold_5(&v87, v88, v18);
    }

    -[RBSConnection _disconnect]((uint64_t)*v2);
  }

  id v11 = 0LL;
  uint64_t v7 = 3LL;
LABEL_30:
  os_unfair_lock_lock(*v2 + 10);
  *(void *)&(*v2)[36]._os_unfair_lock_opaque = v7;
  __int128 v19 = *v2;
  if (*(void *)&(*v2)[36]._os_unfair_lock_opaque != 2LL) {
    goto LABEL_67;
  }
  [v11 handle];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 identity];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    [v61 handleFailureInMethod:*(void *)(v1 + 64) object:*(void *)(v1 + 32) file:@"RBSConnection.m" lineNumber:1450 description:@"No process identity was resolved!"];
  }

  rbs_connection_log();
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl(&dword_185F67000, v22, OS_LOG_TYPE_DEFAULT, "Identity resolved as %{public}@", buf, 0xCu);
  }

  [*(id *)&(*v2)[6]._os_unfair_lock_opaque identity];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  id v24 = *v2;
  v72 = v23;
  if (!*(void *)&(*v2)[6]._os_unfair_lock_opaque)
  {
LABEL_38:
    objc_storeStrong((id *)&v24[6], v20);
    [MEMORY[0x189607920] strongToWeakObjectsMapTable];
    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 assertionIdentifiersByOldIdentifier];
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock(*v2 + 11);
    uint64_t v29 = MEMORY[0x1895F87A8];
    v84[0] = MEMORY[0x1895F87A8];
    v84[1] = 3221225472LL;
    v84[2] = __27__RBSConnection__handshake__block_invoke_220;
    v84[3] = &unk_189DE0F50;
    v84[4] = *v2;
    id v70 = v26;
    id v85 = v70;
    id v30 = v28;
    id v86 = v30;
    v71 = v27;
    [v27 enumerateKeysAndObjectsUsingBlock:v84];
    [v11 assertionErrorsByOldIdentifier];
    __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v29;
    v83[1] = 3221225472LL;
    v83[2] = __27__RBSConnection__handshake__block_invoke_222;
    v83[3] = &unk_189DE0F78;
    v83[4] = *v2;
    [v31 enumerateKeysAndObjectsUsingBlock:v83];

    v80[0] = v29;
    v80[1] = 3221225472LL;
    v80[2] = __27__RBSConnection__handshake__block_invoke_224;
    v80[3] = &unk_189DE0C40;
    id v32 = v30;
    uint64_t v33 = *v2;
    id v81 = v32;
    v82 = v33;
    +[RBSWorkloop performBackgroundWork:](&OBJC_CLASS___RBSWorkloop, "performBackgroundWork:", v80);
    if ([*(id *)&(*v2)[18]._os_unfair_lock_opaque count])
    {
      rbs_assertion_log();
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        __27__RBSConnection__handshake__block_invoke_cold_2((uint64_t)v2, v34, v35, v36, v37, v38, v39, v40);
      }
    }

    objc_storeStrong((id *)&(*v2)[18], v26);
    if ([*(id *)&(*v2)[18]._os_unfair_lock_opaque count])
    {
      rbs_connection_log();
      uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        uint64_t v42 = *(void *)&(*v2)[18]._os_unfair_lock_opaque;
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_impl(&dword_185F67000, v41, OS_LOG_TYPE_INFO, "Reacquired assertions: %{public}@", buf, 0xCu);
      }
    }

    os_unfair_lock_unlock(*v2 + 11);
    [v11 managedEndpointByLaunchIdentifier];
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v44 = v43;
    if (v43)
    {
      id v45 = v43;
    }

    else
    {
      [MEMORY[0x189603F68] dictionary];
      id v45 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v46 = v45;

    __int128 v47 = *(void **)&(*v2)[34]._os_unfair_lock_opaque;
    if (v47 && v47 != v46)
    {
      if (v46
        && (CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)&(*v2)[34]._os_unfair_lock_opaque),
            Count == CFDictionaryGetCount((CFDictionaryRef)v46)))
      {
        id v67 = v32;
        v68 = v20;
        v69 = v21;
        uint64_t v74 = v1;
        memset(v95, 0, sizeof(v95));
        id v49 = v47;
        uint64_t v50 = [v49 countByEnumeratingWithState:v95 objects:buf count:16];
        if (v50)
        {
          uint64_t v51 = v50;
          uint64_t v75 = **(void **)&v95[1];
          while (2)
          {
            for (uint64_t i = 0LL; i != v51; ++i)
            {
              if (**(void **)&v95[1] != v75) {
                objc_enumerationMutation(v49);
              }
              uint64_t v53 = *(void *)(*((void *)&v95[0] + 1) + 8 * i);
              [v49 objectForKey:v53];
              int v54 = (void *)objc_claimAutoreleasedReturnValue();
              [v46 objectForKey:v53];
              __int16 v55 = (void *)objc_claimAutoreleasedReturnValue();
              int v56 = [v54 _isEquivalentToEndpoint:v55];

              if (!v56)
              {

                uint64_t v1 = v74;
                id v20 = v68;
                uint64_t v21 = v69;
                id v32 = v67;
                goto LABEL_63;
              }
            }

            uint64_t v51 = [v49 countByEnumeratingWithState:v95 objects:buf count:16];
            if (v51) {
              continue;
            }
            break;
          }
        }

        uint64_t v1 = v74;
        id v20 = v68;
        uint64_t v21 = v69;
        id v32 = v67;
      }

      else
      {
LABEL_63:
        rbs_connection_log();
        id v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
          __27__RBSConnection__handshake__block_invoke_cold_1((uint64_t)v2, (uint64_t)v46, v57);
        }
      }
    }

    v58 = *(void **)&(*v2)[34]._os_unfair_lock_opaque;
    *(void *)&(*v2)[34]._os_unfair_lock_opaque = v46;

    __int128 v19 = *v2;
LABEL_67:
    os_unfair_lock_unlock(v19 + 10);
    if (v7 == 2)
    {
      v76[0] = MEMORY[0x1895F87A8];
      v76[1] = 3221225472LL;
      v76[2] = __27__RBSConnection__handshake__block_invoke_225;
      v76[3] = &unk_189DE0FC8;
      id v77 = *(id *)(v1 + 48);
      id v59 = *(id *)(v1 + 56);
      uint64_t v60 = *(void *)(v1 + 32);
      id v78 = v59;
      uint64_t v79 = v60;
      +[RBSWorkloop performBackgroundWorkWithServiceClass:block:]( &OBJC_CLASS___RBSWorkloop,  "performBackgroundWorkWithServiceClass:block:",  33LL,  v76);
    }

    return;
  }

  uint64_t v25 = v23;
  if ([v23 isEqual:v21])
  {
    id v24 = *v2;
    goto LABEL_38;
  }

  uint64_t v62 = v25;
  uint64_t v63 = [v25 hostIdentity];
  if (v63)
  {
    v64 = (void *)v63;
    [v21 hostIdentity];
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v65)
    {
      rbs_connection_log();
      v66 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
        __27__RBSConnection__handshake__block_invoke_cold_3();
      }

      abort_with_reason();
    }
  }

  __int128 v93 = 0u;
  __int128 v94 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  *(_OWORD *)buf = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  LODWORD(v95[0]) = 138412546;
  *(void *)((char *)v95 + 4) = v21;
  WORD6(v95[0]) = 2112;
  *(void *)((char *)v95 + 14) = v62;
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __27__RBSConnection__handshake__block_invoke_220(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = __27__RBSConnection__handshake__block_invoke_2;
    unsigned int v15 = &unk_189DE0C40;
    char v9 = v7;
    uint64_t v16 = v9;
    id v10 = v6;
    id v17 = v10;
    +[RBSWorkloop performBackgroundWork:](&OBJC_CLASS___RBSWorkloop, "performBackgroundWork:", &v12);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v9, v10, v12, v13, v14, v15);

    id v11 = v16;
  }

  else
  {
    [*(id *)(a1 + 48) addObject:v6];
    rbs_connection_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __27__RBSConnection__handshake__block_invoke_220_cold_1();
    }
  }
}

void __27__RBSConnection__handshake__block_invoke_2(uint64_t a1)
{
}

void __27__RBSConnection__handshake__block_invoke_222(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  rbs_connection_log();
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v5;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl( &dword_185F67000,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to reconnect assertion %{public}@ with error <%{public}@>",  (uint8_t *)&v9,  0x16u);
  }

  [*(id *)(*(void *)(a1 + 32) + 72) objectForKey:v5];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 _serverInvalidateWithError:v6];
}

void __27__RBSConnection__handshake__block_invoke_224(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 40),  "invalidateAssertionWithIdentifier:error:",  *(void *)(*((void *)&v7 + 1) + 8 * v6++),  0,  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

uint64_t __27__RBSConnection__handshake__block_invoke_225(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v5 = v3;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        -[RBSProcessMonitor _reconnect](*(void **)(*((void *)&v11 + 1) + 8 * v7++), v4);
      }

      while (v5 != v7);
      uint64_t v5 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __27__RBSConnection__handshake__block_invoke_2_226;
  v10[3] = &unk_189DE0FA0;
  __int128 v8 = *(void **)(a1 + 40);
  v10[4] = *(void *)(a1 + 48);
  return [v8 enumerateKeysAndObjectsUsingBlock:v10];
}

void __27__RBSConnection__handshake__block_invoke_2_226(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[RBSConnection _subscribeToProcessDeath:handler:]( *(void *)(a1 + 32),  v5,  *(void **)(*((void *)&v11 + 1) + 8 * v10++));
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (BOOL)invalidateAssertionWithIdentifier:(id)a3 error:(id *)a4
{
  p_assertionLock = &self->_assertionLock;
  id v7 = a3;
  os_unfair_lock_lock(p_assertionLock);
  -[NSMapTable removeObjectForKey:](self->_acquiredAssertionsByIdentifier, "removeObjectForKey:", v7);
  os_unfair_lock_unlock(p_assertionLock);
  uint64_t v8 = &selRef_async_invalidateAssertionWithIdentifier_;
  if (a4) {
    uint64_t v8 = &selRef_void_invalidateAssertionWithIdentifier_error_;
  }
  +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  *v8,  v7,  0LL);
  uint64_t v9 = (SEL *)objc_claimAutoreleasedReturnValue();

  -[RBSConnection _connection]((uint64_t)self);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  id v11 = -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v10, 0LL, &v14);
  id v12 = v14;

  if (a4) {
    *a4 = v12;
  }

  return v12 == 0LL;
}

- (BOOL)isIdentityAnAngel:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (isIdentityAnAngel_withError__permanentError)
  {
    char v7 = 0;
    if (a4) {
      *a4 = (id) isIdentityAnAngel_withError__permanentError;
    }
  }

  else
  {
    -[RBSConnection _connection]((uint64_t)self);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBSXPCMessage messageForMethod:varguments:]( &OBJC_CLASS___RBSXPCMessage,  "messageForMethod:varguments:",  sel_isIdentityAnAngel_withError_,  v6,  0LL);
    uint64_t v9 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = objc_opt_class();
    id v15 = 0LL;
    -[RBSXPCMessage invokeOnConnection:withReturnClass:error:](v9, v8, v10, &v15);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v15;
    id v13 = v15;

    if (a4) {
      *a4 = v13;
    }
    char v7 = [v11 BOOLValue];
  }

  return v7;
}

- (void)_handleDaemonDidStart
{
  if (a1)
  {
    id v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(void *)(a1 + 144) == 3LL)
    {
      rbs_connection_log();
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v4 = 0;
        _os_log_impl( &dword_185F67000,  v3,  OS_LOG_TYPE_DEFAULT,  "runningboardd is back; connection can be restored",
          v4,
          2u);
      }

      *(void *)(a1 + 144) = 0LL;
    }

    os_unfair_lock_unlock(v2);
  }

- (void).cxx_destruct
{
}

- (void)acquireAssertion:(os_log_s *)a3 error:.cold.1(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_0(&dword_185F67000, a3, (uint64_t)a3, "XPC failed, retrying assertion acquisition", a1);
}

- (void)acquireAssertion:error:.cold.2()
{
}

- (void)_lock_connect
{
}

void __30__RBSConnection_handleForKey___block_invoke_cold_1()
{
}

void __30__RBSConnection_handleForKey___block_invoke_cold_2()
{
}

void __30__RBSConnection_handleForKey___block_invoke_cold_3()
{
}

- (void)processName:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_185F67000, v0, v1, "Could not get process name: <%{public}@>", v2);
  OUTLINED_FUNCTION_0();
}

- (void)portForIdentifier:.cold.1()
{
}

- (void)_subscribeToProcessDeath:handler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1( &dword_185F67000,  v0,  (uint64_t)v0,  "Error subscribing to death of process %{public}@: <%{public}@>",  v1);
  OUTLINED_FUNCTION_0();
}

- (void)intendToExit:withStatus:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1( &dword_185F67000,  v0,  (uint64_t)v0,  "Could not set intended exit for %{public}@ because %{public}@",  v1);
  OUTLINED_FUNCTION_0();
}

- (void)async_didChangeInheritances:completion:.cold.1()
{
}

- (void)async_assertionWillInvalidate:.cold.1()
{
}

- (void)async_observedProcessStatesDidChange:completion:.cold.1()
{
  __assert_rtn( "-[RBSConnection async_observedProcessStatesDidChange:completion:]",  "RBSConnection.m",  1022,  "identity != nil");
}

- (void)_handleMessage:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0( &dword_185F67000,  a3,  (uint64_t)a3,  "*** Unhandled message from server: %{public}@",  (uint8_t *)a2);
}

- (void)_handleMessage:(os_log_s *)a3 .cold.2(uint64_t a1, SEL aSelector, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 24);
  NSStringFromSelector(aSelector);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_debug_impl( &dword_185F67000,  a3,  OS_LOG_TYPE_DEBUG,  "PERF: %{public}@ Received message from runningboardd: %{public}@",  (uint8_t *)&v6,  0x16u);

  OUTLINED_FUNCTION_2_1();
}

- (void)_handleMessage:(const char *)a1 .cold.3(const char *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  NSStringFromSelector(a1);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0( &dword_185F67000,  a2,  v4,  "Dropping message from server: The client is missing an implementation for %{public}@",  v5);
}

- (void)_handleMessage:.cold.4()
{
}

void __32__RBSConnection__handleMessage___block_invoke_2_cold_1()
{
  uint64_t v2 = (const char *)OUTLINED_FUNCTION_17(v1);
  NSStringFromSelector(v2);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4( &dword_185F67000,  v3,  v4,  "decodeArgumentsWithClass failed for method %{public}@ with error %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_2_1();
}

void __32__RBSConnection__handleMessage___block_invoke_2_188_cold_1()
{
  OUTLINED_FUNCTION_2_1();
}

void __37__RBSConnection__lock_setConnection___block_invoke_cold_1()
{
}

void __37__RBSConnection__lock_setConnection___block_invoke_cold_2()
{
}

void __27__RBSConnection__handshake__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(*(void *)a1 + 136LL);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_16( &dword_185F67000,  a2,  a3,  "managedEndpointByLaunchIdentifier mismatch : previous=%{public}@ new=%{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_0();
}

void __27__RBSConnection__handshake__block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __27__RBSConnection__handshake__block_invoke_cold_3()
{
}

void __27__RBSConnection__handshake__block_invoke_cold_4()
{
  uint64_t v3 = v2;
  [MEMORY[0x1896077D8] currentHandler];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v4,  "handleFailureInMethod:object:file:lineNumber:description:",  *(void *)(v3 + 64),  *v1,  @"RBSConnection.m",  1413,  @"BUG IN RUNNINGBOARD %d RunningBoard handshakes failed",  v0);

  abort();
}

void __27__RBSConnection__handshake__block_invoke_cold_5(uint8_t *a1, _BYTE *a2, os_log_s *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_8_0( &dword_185F67000,  a3,  (uint64_t)a3,  "Handshake aborted as the connection has been invalidated",  a1);
}

void __27__RBSConnection__handshake__block_invoke_220_cold_1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1( &dword_185F67000,  v0,  (uint64_t)v0,  "No old assertion found for %{public}@; new assertion %{public}@ will be invalidated",
    v1);
  OUTLINED_FUNCTION_0();
}

@end