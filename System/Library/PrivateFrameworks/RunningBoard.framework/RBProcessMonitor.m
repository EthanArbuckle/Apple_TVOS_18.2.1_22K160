@interface RBProcessMonitor
+ (id)_clientStateForServerState:(void *)a3 process:;
- (NSString)description;
- (NSString)stateCaptureTitle;
- (OS_dispatch_queue)monitorSerializationQueue;
- (RBProcessMonitor)initWithStateCaptureManager:(id)a3 historialStatistics:(id)a4 xnuWrapper:(id)a5;
- (id)preventLaunchPredicates;
- (id)statesMatchingConfiguration:(id)a3;
- (id)statesMatchingPredicate:(id)a3;
- (void)_queue_adjustMemoryPageThresholdLimitationForProcess:(void *)a3 oldState:(void *)a4 newState:;
- (void)_queue_publishState:(void *)a3 forIdentity:;
- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a1;
- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a1;
- (void)_queue_updateServerState:(void *)a3 forProcess:(char)a4 force:;
- (void)addObserver:(id)a3;
- (void)didAddProcess:(id)a3 withState:(id)a4;
- (void)didRemoveProcess:(id)a3 withState:(id)a4;
- (void)didResolvePreventLaunchPredicates:(id)a3;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeStateForProcessIdentity:(id)a3;
- (void)suppressUpdatesForIdentity:(id)a3;
- (void)trackStateForProcessIdentity:(id)a3;
- (void)unsuppressUpdatesForIdentity:(id)a3;
@end

@implementation RBProcessMonitor

- (RBProcessMonitor)initWithStateCaptureManager:(id)a3 historialStatistics:(id)a4 xnuWrapper:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___RBProcessMonitor;
  v12 = -[RBProcessMonitor init](&v31, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v14 = dispatch_queue_create("RBProcessMonitor", v13);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___RBProcessIndex);
    processIndex = v12->_processIndex;
    v12->_processIndex = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    stateMap = v12->_stateMap;
    v12->_stateMap = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    suppressedState = v12->_suppressedState;
    v12->_suppressedState = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    publishedState = v12->_publishedState;
    v12->_publishedState = v22;

    v24 = (NSCountedSet *)objc_alloc_init(MEMORY[0x189607838]);
    suppressedIdentities = v12->_suppressedIdentities;
    v12->_suppressedIdentities = v24;

    v12->_observersLock._os_unfair_lock_opaque = 0;
    v26 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    observers = v12->_observers;
    v12->_observers = v26;

    objc_storeStrong((id *)&v12->_stateCaptureManager, a3);
    objc_storeStrong((id *)&v12->_historicalStatistics, a4);
    v28 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    runningVisibleApps = v12->_runningVisibleApps;
    v12->_runningVisibleApps = v28;

    objc_storeStrong((id *)&v12->_xnuWrapper, a5);
  }

  return v12;
}

- (void)addObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMutableSet addObject:](self->_observers, "addObject:", v5);
  -[RBHistoricalStatisticsMaintaining notifyMonitorCount:]( self->_historicalStatistics,  "notifyMonitorCount:",  -[NSMutableSet count](self->_observers, "count"));
  os_unfair_lock_unlock(p_observersLock);
  -[RBStateCaptureManaging addItem:](self->_stateCaptureManager, "addItem:", v5);
}

- (void)removeObserver:(id)a3
{
  stateCaptureManager = self->_stateCaptureManager;
  id v5 = a3;
  -[RBStateCaptureManaging removeItem:](stateCaptureManager, "removeItem:", v5);
  os_unfair_lock_lock(&self->_observersLock);
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v5);

  -[RBHistoricalStatisticsMaintaining notifyMonitorCount:]( self->_historicalStatistics,  "notifyMonitorCount:",  -[NSMutableSet count](self->_observers, "count"));
  os_unfair_lock_unlock(&self->_observersLock);
}

- (id)preventLaunchPredicates
{
  preventLaunchPredicates = self->_preventLaunchPredicates;
  if (preventLaunchPredicates)
  {
    v4 = preventLaunchPredicates;
  }

  else
  {
    [MEMORY[0x189604010] set];
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)statesMatchingPredicate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[RBProcessMap allValue](self->_stateMap, "allValue");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "process", (void)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v9);
  }

  return v6;
}

- (id)statesMatchingConfiguration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 stateDescriptor];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v6 = -[RBProcessMap allValue](self->_stateMap, "allValue", 0LL);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v5 = 0LL;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v11 process];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v4 matchesProcess:v12])
          {
            if (!v5)
            {
              [MEMORY[0x189603FA8] array];
              id v5 = (void *)objc_claimAutoreleasedReturnValue();
            }

            [v5 addObject:v11];
          }
        }

        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v8);
    }

    else
    {
      id v5 = 0LL;
    }
  }

  return v5;
}

- (void)didAddProcess:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44__RBProcessMonitor_didAddProcess_withState___block_invoke;
  block[3] = &unk_18A255970;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

void __44__RBProcessMonitor_didAddProcess_withState___block_invoke(uint64_t a1)
{
}

- (void)_queue_updateServerState:(void *)a3 forProcess:(char)a4 force:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if (!v7)
    {
      [MEMORY[0x1896077D8] currentHandler];
      objc_super v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 handleFailureInMethod:sel__queue_updateServerState_forProcess_force_ object:a1 file:@"RBProcessMonitor.m" lineNumber:285 description:@"serverState can not be nil"];
    }

    context = (void *)MEMORY[0x1895C9F58]();
    [v8 identity];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }

    else
    {
      [v7 identity];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v12 = v11;

    [*(id *)(a1 + 16) valueForIdentity:v12];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBProcessMonitor _clientStateForServerState:process:]((uint64_t)&OBJC_CLASS___RBProcessMonitor, v7, v8);
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBProcessMonitor _queue_adjustMemoryPageThresholdLimitationForProcess:oldState:newState:](a1, v12, v13, v14);
    char v37 = 0;
    if ((a4 & 1) != 0 || [v14 isDifferentFromState:v13 significantly:&v37])
    {
      if ([v8 isReported])
      {
        rbs_monitor_log();
        __int128 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          [v12 shortDescription];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 taskState];
          NSStringFromRBSTaskState();
          char v33 = a4;
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 role];
          NSStringFromRBSRole();
          v32 = v13;
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 endowmentInfos];
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v39 = v16;
          __int16 v40 = 2114;
          v41 = v17;
          __int16 v42 = 2114;
          v43 = v18;
          __int16 v44 = 2112;
          v45 = v19;
          _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "Calculated state for %{public}@: %{public}@ (role: %{public}@) (endowments: %@) ",  buf,  0x2Au);

          id v13 = v32;
          a4 = v33;
        }
      }

      char v20 = [v14 isEmptyState];
      v21 = *(void **)(a1 + 16);
      if ((v20 & 1) != 0) {
        id v22 = (id)[v21 removeValueForIdentity:v12];
      }
      else {
        id v23 = (id)[v21 setValue:v14 forIdentity:v12];
      }
      id v24 = (id)[*(id *)(a1 + 24) removeValueForIdentity:v12];
      if ((a4 & 1) != 0 || v37 || ([*(id *)(a1 + 40) containsObject:v12] & 1) == 0)
      {
        -[RBProcessMonitor _queue_publishState:forIdentity:](a1, v14, v12);
        -[RBProcessMonitor _queue_suppressUpdatesForIdentity:](a1, v12);
        dispatch_time_t v27 = dispatch_time(0LL, 100000000LL);
        v28 = *(dispatch_queue_s **)(a1 + 104);
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __62__RBProcessMonitor__queue_updateServerState_forProcess_force___block_invoke;
        block[3] = &unk_18A255B00;
        block[4] = a1;
        id v36 = v12;
        dispatch_after(v27, v28, block);
      }

      else
      {
        rbs_monitor_log();
        v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[RBProcessMonitor _queue_updateServerState:forProcess:force:].cold.1();
        }

        id v26 = (id)[*(id *)(a1 + 24) setValue:v14 forIdentity:v12];
      }
    }

    else
    {
      rbs_monitor_log();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        [v12 shortDescription];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v39 = v30;
        _os_log_impl( &dword_188634000,  v29,  OS_LOG_TYPE_INFO,  "Ignoring insignificant state update for %{public}@",  buf,  0xCu);
      }
    }

    objc_autoreleasePoolPop(context);
  }
}

- (void)didUpdateProcessStates:(id)a3
{
  id v4 = a3;
  if ([v4 hasChanges])
  {
    queue = self->_queue;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __43__RBProcessMonitor_didUpdateProcessStates___block_invoke;
    v6[3] = &unk_18A255B00;
    id v7 = v4;
    id v8 = self;
    dispatch_async((dispatch_queue_t)queue, v6);
  }
}

void __43__RBProcessMonitor_didUpdateProcessStates___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "identity", (void)v12);
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [*(id *)(*(void *)(a1 + 40) + 8) processForIdentity:v8];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = *(void *)(a1 + 40);
        [v7 updatedState];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessMonitor _queue_updateServerState:forProcess:force:](v10, v11, v9, 0);
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v4);
  }
}

- (void)didRemoveProcess:(id)a3 withState:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__RBProcessMonitor_didRemoveProcess_withState___block_invoke;
  block[3] = &unk_18A255970;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async((dispatch_queue_t)queue, block);
}

uint64_t __47__RBProcessMonitor_didRemoveProcess_withState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeProcess:*(void *)(a1 + 48)];
}

- (void)didResolvePreventLaunchPredicates:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __54__RBProcessMonitor_didResolvePreventLaunchPredicates___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __54__RBProcessMonitor_didResolvePreventLaunchPredicates___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72LL), *(id *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 56LL);
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
        objc_msgSend( *(id *)(*((void *)&v7 + 1) + 8 * v6++),  "didResolvePreventLaunchPredicates:",  *(void *)(a1 + 40),  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48LL));
}

- (void)trackStateForProcessIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__RBProcessMonitor_trackStateForProcessIdentity___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

uint64_t __49__RBProcessMonitor_trackStateForProcessIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) addIdentity:*(void *)(a1 + 40)];
}

- (void)removeStateForProcessIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50__RBProcessMonitor_removeStateForProcessIdentity___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

uint64_t __50__RBProcessMonitor_removeStateForProcessIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeIdentity:*(void *)(a1 + 40)];
}

- (void)suppressUpdatesForIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__RBProcessMonitor_suppressUpdatesForIdentity___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __47__RBProcessMonitor_suppressUpdatesForIdentity___block_invoke(uint64_t a1)
{
}

- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v4 = (id *)(a1 + 40);
    [v5 addObject:v3];
    if ([*v4 countForObject:v3] == 1)
    {
      rbs_monitor_log();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[RBProcessMonitor _queue_suppressUpdatesForIdentity:].cold.2((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
      }
    }

    rbs_monitor_log();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[RBProcessMonitor _queue_suppressUpdatesForIdentity:].cold.1(v4, (uint64_t)v3, v13);
    }
  }
}

- (void)unsuppressUpdatesForIdentity:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__RBProcessMonitor_unsuppressUpdatesForIdentity___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __49__RBProcessMonitor_unsuppressUpdatesForIdentity___block_invoke(uint64_t a1)
{
}

- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = [*(id *)(a1 + 40) countForObject:v3];
    if (v4)
    {
      uint64_t v5 = v4;
      rbs_monitor_log();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:].cold.2(v5, (uint64_t)v3, v6);
      }

      [*(id *)(a1 + 40) removeObject:v3];
      if (v5 == 1)
      {
        rbs_monitor_log();
        uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
          -[RBProcessMonitor _queue_unsuppressUpdatesForIdentity:].cold.1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
        }

        [*(id *)(a1 + 24) valueForIdentity:v3];
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14) {
          -[RBProcessMonitor _queue_publishState:forIdentity:](a1, v14, v3);
        }
        [*(id *)(a1 + 24) removeIdentity:v3];
      }
    }
  }
}

- (NSString)stateCaptureTitle
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)_clientStateForServerState:(void *)a3 process:
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = objc_opt_self();
  if (!v4)
  {
    uint64_t v9 = v6;
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 handleFailureInMethod:sel__clientStateForServerState_process_, v9, @"RBProcessMonitor.m", 210, @"Invalid parameter not satisfying: %@", @"serverState != nil" object file lineNumber description];
  }

  [v4 clientStateForProcess:v5];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_queue_publishState:(void *)a3 forIdentity:
{
  v25[1] = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    rbs_monitor_log();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[RBProcessMonitor _queue_publishState:forIdentity:].cold.1();
    }

    [*(id *)(a1 + 32) valueForIdentity:v6];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 encodeWithPreviousState:v8];
    v25[0] = v5;
    [MEMORY[0x189603F18] arrayWithObjects:v25 count:1];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v10 = *(id *)(a1 + 56);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0LL;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend( *(id *)(*((void *)&v20 + 1) + 8 * v14++),  "processMonitor:didChangeProcessStates:",  a1,  v9,  (void)v20);
        }

        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v12);
    }

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    char v15 = [v5 isEmptyState];
    __int128 v16 = *(void **)(a1 + 32);
    if ((v15 & 1) != 0)
    {
      id v17 = (id)[v16 removeValueForIdentity:v6];
      id v18 = (id)[*(id *)(a1 + 16) removeValueForIdentity:v6];
    }

    else
    {
      id v19 = (id)[v16 setValue:v5 forIdentity:v6];
    }
  }
}

- (void)_queue_adjustMemoryPageThresholdLimitationForProcess:(void *)a3 oldState:(void *)a4 newState:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1 && [*(id *)(a1 + 96) ballastOffsetMB] && objc_msgSend(v7, "isApplication"))
  {
    if ([v8 taskState] == 4)
    {
      [v8 endowmentNamespaces];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      int v11 = [v10 containsObject:*MEMORY[0x189612510]];
    }

    else
    {
      int v11 = 0;
    }

    if ([v9 taskState] == 4)
    {
      [v9 endowmentNamespaces];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = [v12 containsObject:*MEMORY[0x189612510]];

      if (((v11 | v13 ^ 1) & 1) == 0)
      {
        [*(id *)(a1 + 88) addObject:v7];
        if ([*(id *)(a1 + 88) count] == 1)
        {
          if ([*(id *)(a1 + 96) setBallastDrained:0] < 0)
          {
            rbs_general_log();
            uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[RBProcessMonitor _queue_adjustMemoryPageThresholdLimitationForProcess:oldState:newState:].cold.1( (uint64_t)v7,  v14);
            }
          }

          rbs_process_log();
          char v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            id v19 = v7;
            _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "Foreground app is %@, setting ballast drained to NO",  (uint8_t *)&v18,  0xCu);
          }
        }
      }
    }

    else
    {
      LOBYTE(v13) = 0;
    }

    if (v11)
    {
      if ((v13 & 1) == 0)
      {
        [*(id *)(a1 + 88) removeObject:v7];
        if (![*(id *)(a1 + 88) count])
        {
          if ([*(id *)(a1 + 96) setBallastDrained:1] < 0)
          {
            rbs_process_log();
            __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = 138412290;
              id v19 = v7;
              _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_DEFAULT,  "Error setting ballast drained to YES for %@",  (uint8_t *)&v18,  0xCu);
            }
          }

          rbs_process_log();
          id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 138412290;
            id v19 = v7;
            _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_DEFAULT,  "The last foreground app removed was app is %@, setting ballast drained to YES",  (uint8_t *)&v18,  0xCu);
          }
        }
      }
    }
  }
}

void __62__RBProcessMonitor__queue_updateServerState_forProcess_force___block_invoke(uint64_t a1)
{
}

- (NSString)description
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  id v4 = (void *)-[NSMutableSet copy](self->_observers, "copy");
  os_unfair_lock_unlock(p_observersLock);
  uint64_t v5 = [v4 count];
  id v6 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allObjects];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 componentsJoinedByString:@",\n\t"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)[v6 initWithFormat:@"<%@| count:%lu observers:{\n\t%@\n\t}>", v7, v5, v9];

  return (NSString *)v10;
}

- (OS_dispatch_queue)monitorSerializationQueue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

- (void)_queue_updateServerState:forProcess:force:.cold.1()
{
}

- (void)_queue_suppressUpdatesForIdentity:(os_log_s *)a3 .cold.1(id *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [*a1 countForObject:a2];
  int v6 = 134218242;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl( &dword_188634000,  a3,  OS_LOG_TYPE_DEBUG,  "Incrementing suppression state to %lu for %{public}@",  (uint8_t *)&v6,  0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_queue_suppressUpdatesForIdentity:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_queue_unsuppressUpdatesForIdentity:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_queue_unsuppressUpdatesForIdentity:(os_log_s *)a3 .cold.2(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)id v3 = 134218242;
  *(void *)&v3[4] = a1 - 1;
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_1( &dword_188634000,  a2,  a3,  "Decrementing suppression state to %lu for %{public}@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_1_1();
}

- (void)_queue_publishState:forIdentity:.cold.1()
{
}

- (void)_queue_adjustMemoryPageThresholdLimitationForProcess:(uint64_t)a1 oldState:(os_log_s *)a2 newState:.cold.1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v4 = __error();
  uint64_t v5 = strerror(*v4);
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2082;
  uint64_t v9 = v5;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Error setting ballast drained for %@: %{public}s",  (uint8_t *)&v6,  0x16u);
  OUTLINED_FUNCTION_1();
}

@end