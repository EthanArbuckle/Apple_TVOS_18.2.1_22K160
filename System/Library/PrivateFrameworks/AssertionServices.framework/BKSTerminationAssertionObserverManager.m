@interface BKSTerminationAssertionObserverManager
- (BKSTerminationAssertionObserverManager)init;
- (BOOL)hasTerminationAssertionForBundleID:(id)a3;
- (unint64_t)efficacyForBundleID:(id)a3;
- (void)_createMonitor;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
@end

@implementation BKSTerminationAssertionObserverManager

- (BKSTerminationAssertionObserverManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___BKSTerminationAssertionObserverManager;
  v2 = -[BKSTerminationAssertionObserverManager init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = [MEMORY[0x1896123B0] createBackgroundQueue:@"com.apple.runningboardservices.bksterminationassertion.callout"];
    calloutQueue = v3->_calloutQueue;
    v3->_calloutQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x189603FE0] set];
    launchPreventedBundleIDs = v3->_launchPreventedBundleIDs;
    v3->_launchPreventedBundleIDs = (NSMutableSet *)v6;

    -[BKSTerminationAssertionObserverManager _createMonitor](v3, "_createMonitor");
  }

  return v3;
}

- (void)addObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  if (!observers)
  {
    [MEMORY[0x189603FE0] set];
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }

  -[NSMutableSet addObject:](observers, "addObject:", v7);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", v5);

  if (!-[NSMutableSet count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0LL;
  }

  os_unfair_lock_unlock(p_lock);
}

- (unint64_t)efficacyForBundleID:(id)a3
{
  if (-[BKSTerminationAssertionObserverManager hasTerminationAssertionForBundleID:]( self,  "hasTerminationAssertionForBundleID:",  a3))
  {
    return 3LL;
  }

  else
  {
    return 0LL;
  }

- (BOOL)hasTerminationAssertionForBundleID:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_monitorIsReady)
  {
    LOBYTE(v6) = -[NSMutableSet containsObject:](self->_launchPreventedBundleIDs, "containsObject:", v4);
  }

  else
  {
    id v7 = objc_alloc(MEMORY[0x1896122D0]);
    [MEMORY[0x1896122E8] identityForEmbeddedApplicationIdentifier:v4 jobLabel:v4 auid:geteuid() platform:6];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v9 = (void *)[v7 initWithIdentity:v8];

    [MEMORY[0x1896121C0] sharedInstance];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 preventLaunchPredicatesWithError:0];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v12 = v11;
    uint64_t v6 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v13 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v12);
          }
          if (objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "matchesProcess:", v9, (void)v16))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }

        uint64_t v6 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (void)_createMonitor
{
  self->_monitorIsReady = 0;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke;
  v5[3] = &unk_189E3B4E0;
  v5[4] = self;
  [MEMORY[0x189612310] monitorWithConfiguration:v5];
  v3 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
  monitor = self->_monitor;
  self->_monitor = v3;
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEvents:2];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_2;
  v4[3] = &unk_189E3B4B8;
  v4[4] = *(void *)(a1 + 32);
  [v3 setPreventLaunchUpdateHandle:v4];
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_2( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v80 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32LL));
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 1;
  uint64_t v56 = a1;
  v55 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  [MEMORY[0x189603FE0] set];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v74;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v74 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        [v11 bundleIdentifier];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          [v11 bundleIdentifier];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 addObject:v13];
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v73 objects:v79 count:16];
    }

    while (v8);
  }

  v51 = v6;

  v14 = (void *)[v5 mutableCopy];
  [v14 minusSet:*(void *)(*(void *)(v56 + 32) + 48)];
  v49 = (void *)[*(id *)(*(void *)(v56 + 32) + 48) mutableCopy];
  [v49 minusSet:v5];
  v52 = v5;
  objc_storeStrong((id *)(*(void *)(v56 + 32) + 48LL), v5);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v56 + 32) + 32LL));
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v70;
    uint64_t v53 = *MEMORY[0x1896075F0];
    do
    {
      for (uint64_t j = 0LL; j != v17; ++j)
      {
        if (*(void *)v70 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v69 + 1) + 8 * j);
        uint64_t v21 = (void *)MEMORY[0x1896122D0];
        [MEMORY[0x189612320] predicateMatchingBundleIdentifier:v20];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        id v68 = 0LL;
        [v21 handleForPredicate:v22 error:&v68];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        id v24 = v68;

        if (v23)
        {
          [v23 currentState];
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          char v26 = [v25 isRunning];

          if ((v26 & 1) == 0) {
            goto LABEL_23;
          }
        }

        else
        {
          [v24 userInfo];
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          [v27 objectForKeyedSubscript:v53];
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v28 == @"Specified predicate matched multiple processes") {
            goto LABEL_24;
          }
          v29 = v28;
          if (!v28)
          {

LABEL_23:
            v31 = *(dispatch_queue_s **)(*(void *)(v56 + 32) + 40LL);
            block[0] = MEMORY[0x1895F87A8];
            block[1] = 3221225472LL;
            block[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_3;
            block[3] = &unk_189E3B490;
            id v66 = v55;
            uint64_t v67 = v20;
            dispatch_async(v31, block);
            v27 = v66;
LABEL_24:

            goto LABEL_25;
          }

          char v30 = -[__CFString isEqual:](v28, "isEqual:", @"Specified predicate matched multiple processes");

          if ((v30 & 1) == 0) {
            goto LABEL_23;
          }
        }

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_3(uint64_t a1)
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
        objc_msgSend( *(id *)(*((void *)&v7 + 1) + 8 * v6++),  "noteTerminationAssertionEfficacyChangedTo:forBundleIdentifier:",  3,  *(void *)(a1 + 40),  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

void __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_4(uint64_t a1)
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
        objc_msgSend( *(id *)(*((void *)&v7 + 1) + 8 * v6++),  "noteTerminationAssertionEfficacyChangedTo:forBundleIdentifier:",  0,  *(void *)(a1 + 40),  (void)v7);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
}

@end