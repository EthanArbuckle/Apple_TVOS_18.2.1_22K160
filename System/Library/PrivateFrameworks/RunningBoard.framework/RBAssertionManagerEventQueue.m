@interface RBAssertionManagerEventQueue
- (RBAssertionManagerEventQueue)initWithTimeProvider:(id)a3;
- (RBAssertionManagerQueueDelegate)delegate;
- (id)description;
- (unint64_t)count;
- (void)_queue_enqueueEventsForAssertion:(uint64_t)a1;
- (void)_queue_enqueueInvalidationEventForAssertion:(double)a3 startTime:;
- (void)_queue_enqueueProcessExpirationEventsForProcesses:(id *)a1;
- (void)_queue_enqueueWarningEventForAssertion:(double)a3 startTime:;
- (void)_queue_removeEventsForContext:(uint64_t)a1;
- (void)_queue_updateEventsForAssertion:(uint64_t)a1;
- (void)setDelegate:(id)a3;
- (void)updateEventsForAssertions:(id)a3;
@end

@implementation RBAssertionManagerEventQueue

- (RBAssertionManagerEventQueue)initWithTimeProvider:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___RBAssertionManagerEventQueue;
  v6 = -[RBAssertionManagerEventQueue init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [MEMORY[0x1896123B0] createSyncingQueue:@"RBAssertionManagerEventQueue"];
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    expirationWarningEvents = v7->_expirationWarningEvents;
    v7->_expirationWarningEvents = v10;

    objc_storeStrong((id *)&v7->_timeProvider, a3);
    v12 = -[RBEventQueue initWithQueue:timeProvider:]( objc_alloc(&OBJC_CLASS___RBEventQueue),  "initWithQueue:timeProvider:",  v7->_queue,  v5);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = v12;
  }

  return v7;
}

- (void)updateEventsForAssertions:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)queue, v7);
}

void __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(void *)(a1 + 32) + 24LL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke_2;
  v6[3] = &unk_18A255B00;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  [v3 batchModify:v6];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

void __58__RBAssertionManagerEventQueue_updateEventsForAssertions___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FE0] set];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "target", (void)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 identity];
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10) {
          [v2 addObject:v10];
        }
        -[RBAssertionManagerEventQueue _queue_updateEventsForAssertion:](*(void *)(a1 + 40), v8);
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  -[RBAssertionManagerEventQueue _queue_enqueueProcessExpirationEventsForProcesses:](*(id **)(a1 + 40), v2);
}

- (void)_queue_updateEventsForAssertion:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    rbs_assertion_log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionManagerEventQueue _queue_updateEventsForAssertion:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    -[RBAssertionManagerEventQueue _queue_removeEventsForContext:](a1, v3);
    -[RBAssertionManagerEventQueue _queue_enqueueEventsForAssertion:](a1, v3);
  }
}

- (void)_queue_enqueueProcessExpirationEventsForProcesses:(id *)a1
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v35 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v26;
      *(void *)&__int128 v6 = 138543874LL;
      __int128 v23 = v6;
      unint64_t v9 = 0x18A254000uLL;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v26 != v8) {
            objc_enumerationMutation(v4);
          }
          __int128 v11 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(a1[4], "removeValueForIdentity:", v11, v23);
          __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12) {
            [a1[3] removeEvent:v12];
          }
          id WeakRetained = objc_loadWeakRetained(a1 + 6);
          [WeakRetained eventQueue:a1 remainingRuntimeForProcessIdentity:v11];
          double v15 = v14;

          if (v15 <= 0.5)
          {
            [a1[4] removeIdentity:v11];
          }

          else
          {
            [a1[5] currentTime];
            double v17 = fmax(v15 + -5.0, 0.0) + v16;
            double v18 = v15 + v16;
            rbs_assertion_log();
            v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              [v11 shortDescription];
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v23;
              v30 = v22;
              __int16 v31 = 2048;
              double v32 = v17;
              __int16 v33 = 2048;
              double v34 = v18;
              _os_log_debug_impl( &dword_188634000,  v19,  OS_LOG_TYPE_DEBUG,  "%{public}@ - New process assertions warning time: %f expiration time: %f.",  buf,  0x20u);

              unint64_t v9 = 0x18A254000LL;
            }

            id v20 = objc_alloc_init(*(Class *)(v9 + 2744));
            [v20 setContext:v11];
            [v20 setEventTime:v17];
            v24[0] = MEMORY[0x1895F87A8];
            v24[1] = 3221225472LL;
            v24[2] = __82__RBAssertionManagerEventQueue__queue_enqueueProcessExpirationEventsForProcesses___block_invoke;
            v24[3] = &unk_18A255B78;
            v24[4] = a1;
            v24[5] = v11;
            *(double *)&v24[6] = v18;
            [v20 setAction:v24];
            id v21 = (id)[a1[4] setValue:v20 forIdentity:v11];
            [a1[3] addEvent:v20];
          }
        }

        uint64_t v7 = [v4 countByEnumeratingWithState:&v25 objects:v35 count:16];
      }

      while (v7);
    }
  }
}

- (unint64_t)count
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __37__RBAssertionManagerEventQueue_count__block_invoke;
  v5[3] = &unk_18A255B28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__RBAssertionManagerEventQueue_count__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 24) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

- (id)description
{
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  uint64_t v9 = __Block_byref_object_copy_;
  uint64_t v10 = __Block_byref_object_dispose_;
  id v11 = 0LL;
  queue = self->_queue;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __43__RBAssertionManagerEventQueue_description__block_invoke;
  v5[3] = &unk_18A255B28;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync((dispatch_queue_t)queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__RBAssertionManagerEventQueue_description__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) count];
  [*(id *)(*(void *)(a1 + 32) + 24) debugDescription];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v2 initWithFormat:@"<%@| eventCount:%lu eventQueue:%@>", v3, v4, v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

- (void)_queue_removeEventsForContext:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    rbs_assertion_log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionManagerEventQueue _queue_removeEventsForContext:].cold.1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }

    [MEMORY[0x189603FA8] array];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    objc_msgSend(*(id *)(a1 + 24), "events", 0);
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v17 context];
          id v18 = (id)objc_claimAutoreleasedReturnValue();

          if (v18 == v3) {
            [v11 addObject:v17];
          }
        }

        uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v14);
    }

    if ([v11 count]) {
      [*(id *)(a1 + 24) removeEvents:v11];
    }
  }
}

- (void)_queue_enqueueEventsForAssertion:(uint64_t)a1
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1 && [v3 isActive] && objc_msgSend(v4, "isValid"))
  {
    rbs_assertion_log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[RBAssertionManagerEventQueue _queue_enqueueEventsForAssertion:].cold.1( (uint64_t)v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11);
    }

    __int128 v12 = *(void **)(a1 + 24);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __65__RBAssertionManagerEventQueue__queue_enqueueEventsForAssertion___block_invoke;
    v13[3] = &unk_18A255B00;
    v13[4] = a1;
    id v14 = v4;
    [v12 batchModify:v13];
  }
}

void __65__RBAssertionManagerEventQueue__queue_enqueueEventsForAssertion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48LL));
  [WeakRetained eventQueue:*(void *)(a1 + 32) startTimeForAssertion:*(void *)(a1 + 40)];
  double v4 = v3;

  -[RBAssertionManagerEventQueue _queue_enqueueWarningEventForAssertion:startTime:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v4);
  -[RBAssertionManagerEventQueue _queue_enqueueInvalidationEventForAssertion:startTime:]( *(void *)(a1 + 32),  *(void **)(a1 + 40),  v4);
}

- (void)_queue_enqueueWarningEventForAssertion:(double)a3 startTime:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    [v5 warningDuration];
    double v8 = v7;
    if ([v6 isActive])
    {
      if ([v6 isValid] && v8 > 0.0)
      {
        [v6 invalidationDuration];
        double v10 = fmax(v9 - v8, 0.0) + a3;
        uint64_t v11 = objc_alloc_init(&OBJC_CLASS___RBEventQueueEvent);
        -[RBEventQueueEvent setContext:](v11, "setContext:", v6);
        -[RBEventQueueEvent setEventTime:](v11, "setEventTime:", v10);
        uint64_t v12 = MEMORY[0x1895F87A8];
        uint64_t v13 = 3221225472LL;
        id v14 = __81__RBAssertionManagerEventQueue__queue_enqueueWarningEventForAssertion_startTime___block_invoke;
        uint64_t v15 = &unk_18A255B50;
        id v16 = v6;
        uint64_t v17 = a1;
        -[RBEventQueueEvent setAction:](v11, "setAction:", &v12);
        objc_msgSend(*(id *)(a1 + 24), "addEvent:", v11, v12, v13, v14, v15);
      }
    }
  }
}

- (void)_queue_enqueueInvalidationEventForAssertion:(double)a3 startTime:
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    if ([v5 isActive])
    {
      if ([v6 isValid])
      {
        [v6 invalidationDuration];
        if (v7 > 0.0)
        {
          if ([v6 endPolicy])
          {
            [v6 invalidationDuration];
            double v9 = fmax(v8 + a3, 0.0);
            double v10 = objc_alloc_init(&OBJC_CLASS___RBEventQueueEvent);
            -[RBEventQueueEvent setContext:](v10, "setContext:", v6);
            -[RBEventQueueEvent setEventTime:](v10, "setEventTime:", v9);
            uint64_t v11 = MEMORY[0x1895F87A8];
            uint64_t v12 = 3221225472LL;
            uint64_t v13 = __86__RBAssertionManagerEventQueue__queue_enqueueInvalidationEventForAssertion_startTime___block_invoke;
            id v14 = &unk_18A255B50;
            id v15 = v6;
            uint64_t v16 = a1;
            -[RBEventQueueEvent setAction:](v10, "setAction:", &v11);
            objc_msgSend(*(id *)(a1 + 24), "addEvent:", v10, v11, v12, v13, v14);
          }
        }
      }
    }
  }
}

void __81__RBAssertionManagerEventQueue__queue_enqueueWarningEventForAssertion_startTime___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v2 = [*(id *)(a1 + 32) isActive];
  rbs_assertion_log();
  id WeakRetained = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_INFO);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl( &dword_188634000,  WeakRetained,  OS_LOG_TYPE_INFO,  "Assertion warning event: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48LL));
    -[os_log_s eventQueue:handleWarningEventForAssertion:]( WeakRetained,  "eventQueue:handleWarningEventForAssertion:",  *(void *)(a1 + 40),  *(void *)(a1 + 32));
  }

  else if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl( &dword_188634000,  WeakRetained,  OS_LOG_TYPE_INFO,  "Ignoring assertion warning event fired for inactive assertion: %{public}@",  (uint8_t *)&v7,  0xCu);
  }
}

void __86__RBAssertionManagerEventQueue__queue_enqueueInvalidationEventForAssertion_startTime___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  char v2 = [*(id *)(a1 + 32) isActive];
  rbs_assertion_log();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id WeakRetained = v3;
  if ((v2 & 1) != 0)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v7 = 138543362;
      uint64_t v8 = v5;
      _os_log_impl( &dword_188634000,  WeakRetained,  OS_LOG_TYPE_DEFAULT,  "Assertion did invalidate due to timeout: %{public}@",  (uint8_t *)&v7,  0xCu);
    }

    id WeakRetained = (os_log_s *)objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48LL));
    -[os_log_s eventQueue:handleInvalidationEventForAssertion:]( WeakRetained,  "eventQueue:handleInvalidationEventForAssertion:",  *(void *)(a1 + 40),  *(void *)(a1 + 32));
  }

  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl( &dword_188634000,  WeakRetained,  OS_LOG_TYPE_INFO,  "Ignoring assertion timeout event fired for inactive assertion: %{public}@",  (uint8_t *)&v7,  0xCu);
  }
}

void __82__RBAssertionManagerEventQueue__queue_enqueueProcessExpirationEventsForProcesses___block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48LL));
  [WeakRetained eventQueue:*(void *)(a1 + 32) handleAssertionsExpirationWarningEventForProcessIdentity:*(void *)(a1 + 40) expirationTime:*(double *)(a1 + 48)];
}

- (RBAssertionManagerQueueDelegate)delegate
{
  return (RBAssertionManagerQueueDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_queue_updateEventsForAssertion:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_queue_removeEventsForContext:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_queue_enqueueEventsForAssertion:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end