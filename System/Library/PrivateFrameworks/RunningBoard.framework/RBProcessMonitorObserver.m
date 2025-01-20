@interface RBProcessMonitorObserver
- (NSString)description;
- (NSString)stateCaptureTitle;
- (RBProcessMonitorObserver)initWithMonitor:(id)a3 forProcess:(id)a4 connection:(id)a5;
- (void)_checkForBadActorWithPendingStates:(id)a3;
- (void)_lock_addAllConfiguredStatesToPending;
- (void)_lock_addConfigurationStatesToPending:(id)a3;
- (void)_lock_clearPendingNonterminalStates;
- (void)_lock_rebuildConfiguration;
- (void)_lock_sendPendingStateUpdates;
- (void)addConfiguration:(id)a3;
- (void)dealloc;
- (void)didObserveProcessExit:(id)a3;
- (void)didResolvePreventLaunchPredicates:(id)a3;
- (void)invalidate;
- (void)processMonitor:(id)a3 didChangeProcessStates:(id)a4;
- (void)removeConfigurationWithIdentifier:(unint64_t)a3;
@end

@implementation RBProcessMonitorObserver

- (RBProcessMonitorObserver)initWithMonitor:(id)a3 forProcess:(id)a4 connection:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    [MEMORY[0x1896077D8] currentHandler];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 handleFailureInMethod:a2, self, @"RBProcessMonitorObserver.m", 97, @"Invalid parameter not satisfying: %@", @"process != nil" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }

  [MEMORY[0x1896077D8] currentHandler];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 handleFailureInMethod:a2, self, @"RBProcessMonitorObserver.m", 96, @"Invalid parameter not satisfying: %@", @"monitor != nil" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  [MEMORY[0x1896077D8] currentHandler];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 handleFailureInMethod:a2, self, @"RBProcessMonitorObserver.m", 98, @"Invalid parameter not satisfying: %@", @"connection != nil" object file lineNumber description];

LABEL_4:
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___RBProcessMonitorObserver;
  v13 = -[RBProcessMonitorObserver init](&v30, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_monitor, a3);
    objc_storeStrong((id *)&v14->_process, a4);
    objc_storeStrong((id *)&v14->_connection, a5);
    v14->_lock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x189603FC8] dictionary];
    configurations = v14->_configurations;
    v14->_configurations = (NSMutableDictionary *)v15;

    v17 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    pendingProcessState = v14->_pendingProcessState;
    v14->_pendingProcessState = v17;

    uint64_t v19 = [MEMORY[0x189603FA8] array];
    pendingExitEvents = v14->_pendingExitEvents;
    v14->_pendingExitEvents = (NSMutableArray *)v19;

    v21 = (void *)MEMORY[0x1896123B0];
    [NSString stringWithFormat:@"RBProcessMonitorObserver:%@", v14->_process];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v21 createBackgroundQueue:v22];
    calloutQueue = v14->_calloutQueue;
    v14->_calloutQueue = (OS_dispatch_queue *)v23;

    RBSMachAbsoluteTime();
    v14->_lastSend = v25;
  }

  return v14;
}

- (void)dealloc
{
  if (self->_connection)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[RBProcessMonitorObserver dealloc]"];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 handleFailureInFunction:v4 file:@"RBProcessMonitorObserver.m" lineNumber:115 description:@"must be invalidated before releasing"];
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RBProcessMonitorObserver;
  -[RBProcessMonitorObserver dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableDictionary count](self->_configurations, "count")) {
    -[RBProcessMonitoring removeObserver:](self->_monitor, "removeObserver:", self);
  }
  -[NSMutableDictionary removeAllObjects](self->_configurations, "removeAllObjects");
  -[RBProcessMap removeAllObjects](self->_pendingProcessState, "removeAllObjects");
  objc_storeWeak((id *)&self->_lastMatchedHandle, 0LL);
  connection = self->_connection;
  self->_connection = 0LL;

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_addConfigurationStatesToPending:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  double v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  id v29 = 0LL;
  -[RBProcessMonitoring monitorSerializationQueue](self->_monitor, "monitorSerializationQueue");
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __66__RBProcessMonitorObserver__lock_addConfigurationStatesToPending___block_invoke;
  block[3] = &unk_18A257098;
  v22 = &v30;
  block[4] = self;
  id v6 = v4;
  id v21 = v6;
  uint64_t v23 = &v24;
  dispatch_sync(v5, block);

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v7 = (id)v31[5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        pendingProcessState = self->_pendingProcessState;
        objc_msgSend(v11, "process", (void)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 identity];
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        id v15 = -[RBProcessMap setValue:forIdentity:](pendingProcessState, "setValue:forIdentity:", v11, v14);
      }

      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v36 count:16];
    }

    while (v8);
  }

  if (([v6 events] & 2) != 0) {
    objc_storeStrong((id *)&self->_pendingPreventLaunchPredicates, (id)v25[5]);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
}

void __66__RBProcessMonitorObserver__lock_addConfigurationStatesToPending___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) statesMatchingConfiguration:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = [*(id *)(a1[4] + 8) preventLaunchPredicates];
  uint64_t v6 = *(void *)(a1[7] + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (void)addConfiguration:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  if (!-[NSMutableDictionary count](self->_configurations, "count")) {
    -[RBProcessMonitoring addObserver:](self->_monitor, "addObserver:", self);
  }
  configurations = self->_configurations;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](configurations, "objectForKey:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  rbs_monitor_log();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      int v13 = 138543362;
      id v14 = v4;
      id v10 = "monitor changed to %{public}@";
LABEL_8:
      _os_log_impl(&dword_188634000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v13, 0xCu);
    }
  }

  else if (v9)
  {
    int v13 = 138543362;
    id v14 = v4;
    id v10 = "monitor established %{public}@";
    goto LABEL_8;
  }

  -[RBProcessMonitorObserver _lock_addConfigurationStatesToPending:](self, "_lock_addConfigurationStatesToPending:", v4);
  id v11 = self->_configurations;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedLongLong:", objc_msgSend(v4, "identifier"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v4, v12);

  -[RBProcessMonitorObserver _lock_rebuildConfiguration](self, "_lock_rebuildConfiguration");
  -[RBProcessMonitorObserver _lock_sendPendingStateUpdates](self, "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_lock_addAllConfiguredStatesToPending
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  -[NSMutableDictionary allValues](self->_configurations, "allValues", 0LL);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[RBProcessMonitorObserver _lock_addConfigurationStatesToPending:]( self,  "_lock_addConfigurationStatesToPending:",  *(void *)(*((void *)&v8 + 1) + 8 * v7++));
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }
}

- (void)removeConfigurationWithIdentifier:(unint64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  configurations = self->_configurations;
  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](configurations, "objectForKeyedSubscript:", v7);
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    __int128 v9 = self->_configurations;
    [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", 0LL, v10);

    -[RBProcessMonitorObserver _lock_rebuildConfiguration](self, "_lock_rebuildConfiguration");
    if (!-[NSMutableDictionary count](self->_configurations, "count")) {
      -[RBProcessMonitoring removeObserver:](self->_monitor, "removeObserver:", self);
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)processMonitor:(id)a3 didChangeProcessStates:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  RBSDispatchAsyncWithQoS();
}

void __66__RBProcessMonitorObserver_processMonitor_didChangeProcessStates___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  if ([*(id *)(*(void *)(a1 + 32) + 72) count])
  {
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v2 = [obj countByEnumeratingWithState:&v34 objects:v45 count:16];
    if (v2)
    {
      uint64_t v4 = v2;
      uint64_t v5 = *(void *)v35;
      *(void *)&__int128 v3 = 134218498LL;
      __int128 v26 = v3;
      uint64_t v27 = *(void *)v35;
      do
      {
        uint64_t v6 = 0LL;
        uint64_t v28 = v4;
        do
        {
          if (*(void *)v35 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v34 + 1) + 8 * v6);
          objc_msgSend(v7, "process", v26);
          __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
          id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 88LL));
          int v10 = [WeakRetained isEqual:v8];

          if (v10)
          {
            __int128 v11 = *(void **)(*(void *)(a1 + 32) + 48LL);
            [v8 identity];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            id v13 = (id)[v11 setValue:v7 forIdentity:v12];
          }

          else
          {
            __int128 v32 = 0u;
            __int128 v33 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            [*(id *)(*(void *)(a1 + 32) + 72) allValues];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v44 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v31;
              while (2)
              {
                for (uint64_t i = 0LL; i != v15; ++i)
                {
                  if (*(void *)v31 != v16) {
                    objc_enumerationMutation(v12);
                  }
                  __int128 v18 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  [v18 stateDescriptor];
                  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v19 && [v18 matchesProcess:v8])
                  {
                    rbs_monitor_log();
                    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                    {
                      [v8 identity];
                      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
                      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 16LL);
                      *(_DWORD *)buf = v26;
                      v39 = v7;
                      __int16 v40 = 2114;
                      v41 = v24;
                      __int16 v42 = 2114;
                      uint64_t v43 = v25;
                      _os_log_debug_impl( &dword_188634000,  v20,  OS_LOG_TYPE_DEBUG,  "Sending state %p for %{public}@ to %{public}@",  buf,  0x20u);
                    }

                    id v21 = *(void **)(*(void *)(a1 + 32) + 48LL);
                    [v8 identity];
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    id v23 = (id)[v21 setValue:v7 forIdentity:v22];

                    objc_storeWeak((id *)(*(void *)(a1 + 32) + 88LL), v8);
                    goto LABEL_22;
                  }
                }

                uint64_t v15 = [v12 countByEnumeratingWithState:&v30 objects:v44 count:16];
                if (v15) {
                  continue;
                }
                break;
              }

- (void)didObserveProcessExit:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  RBSDispatchAsyncWithQoS();
}

void __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (os_unfair_lock_s **)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  if ([*(id *)&(*v2)[18]._os_unfair_lock_opaque count])
  {
    [*(id *)(a1 + 40) handle];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "allValues", 0);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          __int128 v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ([v9 events] && objc_msgSend(v9, "matchesProcess:", v3))
          {
            rbs_monitor_log();
            int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
              __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke_cold_1(v3, (uint64_t)v2, v10);
            }

            id v11 = objc_alloc_init(MEMORY[0x1896122C0]);
            [v11 setProcess:v3];
            [*(id *)(a1 + 40) lastExitContext];
            id v12 = (void *)objc_claimAutoreleasedReturnValue();
            [v11 setContext:v12];

            [*(id *)(*(void *)(a1 + 32) + 56) addObject:v11];
            objc_msgSend(*(id *)(a1 + 32), "_lock_sendPendingStateUpdates");

            goto LABEL_15;
          }
        }

        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (void)didResolvePreventLaunchPredicates:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  RBSDispatchAsyncWithQoS();
}

void __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40LL));
  if ([*((id *)*v2 + 9) count])
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    objc_msgSend(*((id *)*v2 + 9), "allValues", 0);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0LL; i != v5; ++i)
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) events])
          {
            rbs_monitor_log();
            __int128 v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
              __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke_cold_1((uint64_t)v2, v8);
            }

            __int128 v9 = *(void **)(a1 + 40);
            if (v9)
            {
              int v10 = *v2;
              id v11 = v9;
              id v12 = (void *)v10[8];
              v10[8] = v11;
            }

            else
            {
              uint64_t v13 = [MEMORY[0x189604010] set];
              id v12 = (void *)*((void *)*v2 + 8);
              *((void *)*v2 + 8) = v13;
            }

            objc_msgSend(*v2, "_lock_sendPendingStateUpdates");
            goto LABEL_17;
          }
        }

        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

- (NSString)stateCaptureTitle
{
  id v3 = (void *)NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcess description](self->_process, "description");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@-%@", v5, v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)_lock_rebuildConfiguration
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  self->_unsigned int qos = 9;
  objc_storeWeak((id *)&self->_lastMatchedHandle, 0LL);
  stateDescriptor = self->_stateDescriptor;
  self->_stateDescriptor = 0LL;

  [MEMORY[0x189603FE0] set];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary allValues](self->_configurations, "allValues");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int qos = self->_qos;
        unsigned int v13 = [v11 serviceClass];
        if (qos <= v13) {
          unsigned int v14 = v13;
        }
        else {
          unsigned int v14 = qos;
        }
        self->_unsigned int qos = v14;
        [v11 stateDescriptor];
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
        __int128 v16 = v15;
        if (v15)
        {
          [v15 endowmentNamespaces];
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 addObjectsFromArray:v17];

          v8 |= [v16 values];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v7);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  uint64_t v18 = (RBSProcessStateDescriptor *)objc_alloc_init(MEMORY[0x189612348]);
  uint64_t v19 = self->_stateDescriptor;
  self->_stateDescriptor = v18;

  v20 = self->_stateDescriptor;
  [v4 allObjects];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSProcessStateDescriptor setEndowmentNamespaces:](v20, "setEndowmentNamespaces:", v21);

  -[RBSProcessStateDescriptor setValues:](self->_stateDescriptor, "setValues:", v8);
}

- (void)_checkForBadActorWithPendingStates:(id)a3
{
  uint64_t v71 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_alloc_init(MEMORY[0x189607838]);
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x2020000000LL;
  uint64_t v56 = 0LL;
  uint64_t v47 = 0LL;
  v48 = &v47;
  uint64_t v49 = 0x3032000000LL;
  v50 = __Block_byref_object_copy__6;
  v51 = __Block_byref_object_dispose__6;
  id v52 = 0LL;
  v45[0] = 0LL;
  v45[1] = v45;
  v45[2] = 0x3032000000LL;
  v45[3] = __Block_byref_object_copy__6;
  v45[4] = __Block_byref_object_dispose__6;
  uint64_t v46 = &stru_18A257E48;
  v40[0] = MEMORY[0x1895F87A8];
  v40[1] = 3221225472LL;
  v40[2] = __63__RBProcessMonitorObserver__checkForBadActorWithPendingStates___block_invoke;
  v40[3] = &unk_18A2570C0;
  id v7 = v6;
  id v41 = v7;
  __int16 v42 = &v53;
  uint64_t v43 = &v47;
  v44 = v45;
  v39 = v4;
  [v4 enumerateWithBlock:v40];
  rbs_monitor_log();
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = (RBProcess *)v54[3];
    unint64_t v10 = v48[5];
    *(_DWORD *)buf = 134218242;
    v58 = v9;
    __int16 v59 = 2114;
    unint64_t v60 = v10;
    _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_DEFAULT,  "checkForBadActor: %lu instances of '%{public}@' have been terminated since last update read",  buf,  0x16u);
  }

  RBSMachAbsoluteTime();
  double v12 = v11;
  double lastSend = self->_lastSend;
  unint64_t v14 = -[RBProcessMap count](self->_pendingProcessState, "count");
  if (_RBMaxPendingProcessStates_onceToken != -1) {
    dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
  }
  if (v14 <= _RBMaxPendingProcessStates_maxPendingProcessStates || (double v15 = v12 - lastSend, v15 <= 2.0))
  {
    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    unint64_t v16 = llround(v15);
    if (v16 >= 0x7FFFFF) {
      uint64_t v17 = 0x7FFFFFLL;
    }
    else {
      uint64_t v17 = v16;
    }
    uint64_t v18 = v54[3];
    rbs_process_log();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    unint64_t v20 = v18 & 0x1FF | (v17 << 9) | 0xB10CCA1100000000LL;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      process = self->_process;
      unint64_t v36 = -[RBProcessMap count](self->_pendingProcessState, "count");
      if (_RBMaxPendingProcessStates_onceToken != -1) {
        dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
      }
      uint64_t v37 = v54[3];
      uint64_t v38 = v48[5];
      *(_DWORD *)buf = 138544898;
      v58 = process;
      __int16 v59 = 2048;
      unint64_t v60 = v36;
      __int16 v61 = 1024;
      int v62 = _RBMaxPendingProcessStates_maxPendingProcessStates;
      __int16 v63 = 2048;
      double v64 = v15;
      __int16 v65 = 2048;
      uint64_t v66 = v37;
      __int16 v67 = 2114;
      uint64_t v68 = v38;
      __int16 v69 = 2048;
      unint64_t v70 = v20;
      _os_log_error_impl( &dword_188634000,  v19,  OS_LOG_TYPE_ERROR,  "%{public}@ is over the maximum number of pending updates:%lu vs. %u.\n Last unread update sent %f seconds ago.\n %lu of those updates were for terminated '%{public}@' processes.\n ExceptionCode %llx",  buf,  0x44u);
    }

    id v21 = objc_alloc(MEMORY[0x189612398]);
    __int128 v22 = (void *)NSString;
    __int128 v23 = self->_process;
    unint64_t v24 = -[RBProcessMap count](self->_pendingProcessState, "count");
    if (_RBMaxPendingProcessStates_onceToken != -1) {
      dispatch_once(&_RBMaxPendingProcessStates_onceToken, &__block_literal_global_19);
    }
    [v22 stringWithFormat:@"%@ is over the maximum number of pending updates:%lu vs. %u. Last unread update sent %f seconds ago. %lu of those updates were for terminated '%@' processes.", v23, v24, _RBMaxPendingProcessStates_maxPendingProcessStates, *(void *)&v15, v54[3], v48[5]];
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v26 = (void *)[v21 initWithExplanation:v25];

    [v26 setExceptionCode:v20];
    [v26 setExceptionDomain:15];
    [v26 setMaximumTerminationResistance:50];
    [v26 setReportType:1];
    -[RBProcess identity](self->_process, "identity");
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_sp_telemetry_log();
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v28))
    {
      uint64_t v29 = [v27 embeddedApplicationIdentifier];
      __int128 v30 = (void *)v29;
      if (v29)
      {
        int v31 = 0;
        __int128 v32 = (RBProcess *)v29;
      }

      else
      {
        uint64_t v33 = [v27 xpcServiceIdentifier];
        if (v33)
        {
          int v31 = 0;
          __int128 v23 = (RBProcess *)v33;
          __int128 v32 = (RBProcess *)v33;
        }

        else
        {
          [v27 consistentLaunchdJobLabel];
          __int128 v32 = (RBProcess *)objc_claimAutoreleasedReturnValue();
          __int128 v23 = 0LL;
          int v31 = 1;
        }
      }

      *(_DWORD *)buf = 138543362;
      v58 = v32;
      _os_signpost_emit_with_name_impl( &dword_188634000,  v28,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "RBProcessStatesMaxCountReached_ProcessTerminated",  "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ",  buf,  0xCu);
      if (v31) {

      }
      if (!v30) {
    }
      }

    __int128 v34 = self->_process;
    os_unfair_lock_unlock(p_lock);
    -[RBProcess terminateWithContext:](v34, "terminateWithContext:", v26);
  }

  _Block_object_dispose(v45, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v53, 8);
}

void __63__RBProcessMonitorObserver__checkForBadActorWithPendingStates___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 isEmbeddedApplication])
  {
    uint64_t v4 = [v8 embeddedApplicationIdentifier];
  }

  else if ([v8 isXPCService])
  {
    uint64_t v4 = [v8 xpcServiceIdentifier];
  }

  else
  {
    if (![v8 hasConsistentLaunchdJob])
    {
      uint64_t v5 = 0LL;
      goto LABEL_11;
    }

    uint64_t v4 = [v8 consistentLaunchdJobLabel];
  }

  uint64_t v5 = (void *)v4;
  if (v4)
  {
    [*(id *)(a1 + 32) addObject:v4];
    unint64_t v6 = [*(id *)(a1 + 32) countForObject:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
    if (v6 > *(void *)(v7 + 24))
    {
      *(void *)(v7 + 24) = v6;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL), v5);
    }
  }

- (void)_lock_clearPendingNonterminalStates
{
  pendingProcessState = self->_pendingProcessState;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __63__RBProcessMonitorObserver__lock_clearPendingNonterminalStates__block_invoke;
  v4[3] = &unk_18A2570E8;
  v4[4] = self;
  -[RBProcessMap enumerateWithBlock:](pendingProcessState, "enumerateWithBlock:", v4);
}

void __63__RBProcessMonitorObserver__lock_clearPendingNonterminalStates__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
}

- (void)_lock_sendPendingStateUpdates
{
}

uint64_t __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkForBadActorWithPendingStates:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_2(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40LL));
  uint64_t v2 = *(_BYTE **)(a1 + 40);
  if (v2[98])
  {
    objc_msgSend(v2, "_lock_addAllConfiguredStatesToPending");
    *(_BYTE *)(*(void *)(a1 + 40) + 98LL) = 0;
    uint64_t v2 = *(_BYTE **)(a1 + 40);
  }

  v2[96] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40LL));
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97_cold_1(a1);
  }

  id v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40LL));
  uint64_t v4 = *(_BYTE **)(a1 + 40);
  if (v4[98])
  {
    objc_msgSend(v4, "_lock_addAllConfiguredStatesToPending");
    *(_BYTE *)(*(void *)(a1 + 40) + 98LL) = 0;
    uint64_t v4 = *(_BYTE **)(a1 + 40);
  }

  v4[97] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40LL));
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_100(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97_cold_1(a1);
  }

  id v3 = *(id *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40LL));
  uint64_t v4 = *(_BYTE **)(a1 + 40);
  if (v4[98])
  {
    objc_msgSend(v4, "_lock_addAllConfiguredStatesToPending");
    *(_BYTE *)(*(void *)(a1 + 40) + 98LL) = 0;
    uint64_t v4 = *(_BYTE **)(a1 + 40);
  }

  v4[97] = 0;
  objc_msgSend(*(id *)(a1 + 40), "_lock_sendPendingStateUpdates");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 40LL));
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  stateDescriptor = self->_stateDescriptor;
  uint64_t qos = self->_qos;
  -[NSMutableDictionary entriesToStringWithIndent:debug:]( self->_configurations,  "entriesToStringWithIndent:debug:",  2LL,  1LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)[v4 initWithFormat:@"<%@| qos:%u qos:%@ configs:{\n%@\t}>", v5, qos, stateDescriptor, v8];

  os_unfair_lock_unlock(p_lock);
  return (NSString *)v9;
}

- (void).cxx_destruct
{
}

void __50__RBProcessMonitorObserver_didObserveProcessExit___block_invoke_cold_1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [a1 identity];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = *(void *)(*(void *)a2 + 16LL);
  int v7 = 138543618;
  id v8 = v5;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl( &dword_188634000,  a3,  OS_LOG_TYPE_DEBUG,  "Sending exit event for %{public}@ to %{public}@",  (uint8_t *)&v7,  0x16u);
}

void __62__RBProcessMonitorObserver_didResolvePreventLaunchPredicates___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)a1 + 16LL);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl( &dword_188634000,  a2,  OS_LOG_TYPE_DEBUG,  "Sending prevent launch update to %{public}@",  (uint8_t *)&v3,  0xCu);
}

void __57__RBProcessMonitorObserver__lock_sendPendingStateUpdates__block_invoke_97_cold_1(uint64_t a1)
{
}

@end