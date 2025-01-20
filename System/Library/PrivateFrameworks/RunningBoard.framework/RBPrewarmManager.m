@interface RBPrewarmManager
- (RBPrewarmManager)initWithDelegate:(id)a3 timeProvider:(id)a4;
- (id)_prewarmingQueue;
- (void)_queue_addPrewarmForIdentity:(id)a3;
- (void)_queue_checkForNewPrewarms;
- (void)_queue_runPrewarm;
- (void)_queue_schedulePrewarmForIdentity:(id)a3 withInterval:(id)a4;
- (void)identityDidTerminate:(id)a3;
- (void)prewarmingConfigurationDidChange:(id)a3;
@end

@implementation RBPrewarmManager

- (id)_prewarmingQueue
{
  return self->_prewarmingQueue;
}

- (RBPrewarmManager)initWithDelegate:(id)a3 timeProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }

  else
  {
    [MEMORY[0x1896077D8] currentHandler];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2, self, @"RBPrewarmManager.m", 41, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896077D8] currentHandler];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 handleFailureInMethod:a2, self, @"RBPrewarmManager.m", 42, @"Invalid parameter not satisfying: %@", @"timeProvider" object file lineNumber description];

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RBPrewarmManager;
  v10 = -[RBPrewarmManager init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_delegate, v7);
    objc_storeStrong((id *)&v11->_timeProvider, a4);
    uint64_t v12 = [MEMORY[0x1896123B0] createBackgroundQueue:@"RBPrewarmManager"];
    prewarmingQueue = v11->_prewarmingQueue;
    v11->_prewarmingQueue = (OS_dispatch_queue *)v12;

    v11->_dataLock._os_unfair_lock_opaque = 0;
    v14 = v11;
  }

  return v11;
}

- (void)_queue_runPrewarm
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v12 = self;
  obj = self->_pendingPrewarms;
  uint64_t v3 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    p_delegate = &self->_delegate;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(obj);
        }
        objc_msgSend(MEMORY[0x189612240], "contextWithIdentity:", *(void *)(*((void *)&v14 + 1) + 8 * i), v12);
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 setExplanation:@"RunningBoard Prewarming"];
        v9 = (void *)[objc_alloc(MEMORY[0x189612250]) initWithContext:v8];
        id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
        [WeakRetained executeLaunchRequest:v9 withCompletion:&__block_literal_global_9];
      }

      uint64_t v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v14,  v18,  16LL);
    }

    while (v4);
  }

  pendingPrewarms = v12->_pendingPrewarms;
  v12->_pendingPrewarms = 0LL;
}

- (void)_queue_addPrewarmForIdentity:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  pendingPrewarms = self->_pendingPrewarms;
  if (!pendingPrewarms)
  {
    [MEMORY[0x189603FE0] set];
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_pendingPrewarms;
    self->_pendingPrewarms = v6;

    prewarmingQueue = self->_prewarmingQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __49__RBPrewarmManager__queue_addPrewarmForIdentity___block_invoke;
    block[3] = &unk_18A255C70;
    block[4] = self;
    dispatch_async((dispatch_queue_t)prewarmingQueue, block);
    pendingPrewarms = self->_pendingPrewarms;
  }

  -[NSMutableSet addObject:](pendingPrewarms, "addObject:", v4);
}

uint64_t __49__RBPrewarmManager__queue_addPrewarmForIdentity___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_runPrewarm");
}

- (void)_queue_checkForNewPrewarms
{
  id v4 = self->_lastAppliedConfiguration;
  objc_storeStrong((id *)&self->_lastAppliedConfiguration, self->_currentConfiguration);
  uint64_t v3 = self->_currentConfiguration;
  os_unfair_lock_unlock(&self->_dataLock);
  if (v4 != v3 && (!v4 || !v3 || (-[NSDictionary isEqual:](v4, "isEqual:", v3) & 1) == 0))
  {
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __46__RBPrewarmManager__queue_checkForNewPrewarms__block_invoke;
    v5[3] = &unk_18A256720;
    v6 = v4;
    id v7 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  }
}

void __46__RBPrewarmManager__queue_checkForNewPrewarms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v11 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
}

- (void)_queue_schedulePrewarmForIdentity:(id)a3 withInterval:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_prewarmingQueue);
  if (!self->_prewarmingEventQueue)
  {
    double v8 = -[RBEventQueue initWithQueue:timeProvider:]( objc_alloc(&OBJC_CLASS___RBEventQueue),  "initWithQueue:timeProvider:",  self->_prewarmingQueue,  self->_timeProvider);
    prewarmingEventQueue = self->_prewarmingEventQueue;
    self->_prewarmingEventQueue = v8;
  }

  pendingPrewarms = self->_pendingPrewarms;
  if (!pendingPrewarms || (-[NSMutableSet containsObject:](pendingPrewarms, "containsObject:", v6) & 1) == 0)
  {
    [v7 doubleValue];
    double v12 = v11;
    if (v11 == 0.0) {
      -[RBPrewarmManager _queue_addPrewarmForIdentity:](self, "_queue_addPrewarmForIdentity:", v6);
    }
    if (v12 >= 0.0 && ((*(void *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000LL) >> 53 <= 0x3FE
      || (unint64_t)(*(void *)&v12 - 1LL) <= 0xFFFFFFFFFFFFELL)
    {
      __int128 v15 = objc_alloc_init(&OBJC_CLASS___RBEventQueueEvent);
      -[RBEventQueueEvent setContext:](v15, "setContext:", v6);
      -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
      -[RBEventQueueEvent setEventTime:](v15, "setEventTime:", v12 + v16);
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __67__RBPrewarmManager__queue_schedulePrewarmForIdentity_withInterval___block_invoke;
      v17[3] = &unk_18A256748;
      v17[4] = self;
      -[RBEventQueueEvent setAction:](v15, "setAction:", v17);
      -[RBEventQueue addEvent:](self->_prewarmingEventQueue, "addEvent:", v15);
    }
  }
}

void __67__RBPrewarmManager__queue_schedulePrewarmForIdentity_withInterval___block_invoke( uint64_t a1,  void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 context];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_addPrewarmForIdentity:", v3);
}

- (void)prewarmingConfigurationDidChange:(id)a3
{
  id v4 = (NSDictionary *)a3;
  os_unfair_lock_lock(&self->_dataLock);
  currentConfiguration = self->_currentConfiguration;
  self->_currentConfiguration = v4;
  id v6 = v4;

  os_unfair_lock_unlock(&self->_dataLock);
  prewarmingQueue = self->_prewarmingQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__RBPrewarmManager_prewarmingConfigurationDidChange___block_invoke;
  block[3] = &unk_18A255C70;
  block[4] = self;
  dispatch_async((dispatch_queue_t)prewarmingQueue, block);
}

uint64_t __53__RBPrewarmManager_prewarmingConfigurationDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_checkForNewPrewarms");
}

- (void)identityDidTerminate:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_dataLock);
  -[NSDictionary objectForKey:](self->_currentConfiguration, "objectForKey:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    prewarmingQueue = self->_prewarmingQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__RBPrewarmManager_identityDidTerminate___block_invoke;
    block[3] = &unk_18A255970;
    block[4] = self;
    id v8 = v4;
    id v9 = v5;
    dispatch_async((dispatch_queue_t)prewarmingQueue, block);
  }

  os_unfair_lock_unlock(&self->_dataLock);
}

uint64_t __41__RBPrewarmManager_identityDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_queue_schedulePrewarmForIdentity:withInterval:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

- (void).cxx_destruct
{
}

@end