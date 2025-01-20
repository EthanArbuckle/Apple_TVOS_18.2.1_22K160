@interface SUCoreAnalyticsEventSubmitter
- (NSDictionary)events;
- (SUCoreAnalyticsEventSubmitter)init;
- (SUCoreLog)eventSubmitterLogger;
- (void)_queue_registerSendEvent:(id)a3;
- (void)_queue_removeAllEvents;
- (void)_queue_removeEvent:(id)a3;
- (void)_queue_removeEventsWithName:(id)a3;
- (void)_queue_setEvent:(id)a3;
- (void)_queue_submitAllEvents;
- (void)_queue_submitEvent:(id)a3;
- (void)_queue_submitEventsWithName:(id)a3;
- (void)removeAllEvents;
- (void)removeEvent:(id)a3;
- (void)removeEventsWithName:(id)a3;
- (void)setEvent:(id)a3;
- (void)setEventSubmitterLogger:(id)a3;
- (void)submitAllEvents;
- (void)submitEvent:(id)a3;
- (void)submitEventsWithName:(id)a3;
@end

@implementation SUCoreAnalyticsEventSubmitter

- (SUCoreAnalyticsEventSubmitter)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SUCoreAnalyticsEventSubmitter;
  v2 = -[SUCoreAnalyticsEventSubmitter init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    events = v2->_events;
    v2->_events = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.SUCore.SUCoreAnalyticsEventSubmitterQueue", v5);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1896127A0]) initWithCategory:@"SUCoreAnalyticsEventSubmitter"];
    eventSubmitterLogger = v2->_eventSubmitterLogger;
    v2->_eventSubmitterLogger = (SUCoreLog *)v8;
  }

  return v2;
}

- (void)setEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke;
  block[3] = &unk_18A0F0510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_setEvent:");
  }

  else
  {
    [v1 eventSubmitterLogger];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1();
    }
  }

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke;
  block[3] = &unk_18A0F0510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_removeEvent:");
  }

  else
  {
    [v1 eventSubmitterLogger];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
    }
  }

- (void)removeEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__SUCoreAnalyticsEventSubmitter_removeEventsWithName___block_invoke;
  block[3] = &unk_18A0F0510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __54__SUCoreAnalyticsEventSubmitter_removeEventsWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_removeEventsWithName:");
  }

  else
  {
    [v1 eventSubmitterLogger];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
    }
  }

- (void)removeAllEvents
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__SUCoreAnalyticsEventSubmitter_removeAllEvents__block_invoke;
  block[3] = &unk_18A0EF970;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEventSubmitter_removeAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllEvents");
}

- (void)submitEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke;
  block[3] = &unk_18A0F0510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2 && ([v2 eventUUID], v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "_queue_submitEvent:", *(void *)(a1 + 32));
  }

  else
  {
    [*(id *)(a1 + 40) eventSubmitterLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke_cold_1();
    }
  }

- (void)submitEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke;
  block[3] = &unk_18A0F0510;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

void __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
  {
    objc_msgSend(v1, "_queue_submitEventsWithName:");
  }

  else
  {
    [v1 eventSubmitterLogger];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke_cold_1();
    }
  }

- (void)submitAllEvents
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__SUCoreAnalyticsEventSubmitter_submitAllEvents__block_invoke;
  block[3] = &unk_18A0EF970;
  void block[4] = self;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEventSubmitter_submitAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = __Block_byref_object_copy__4;
  objc_super v11 = __Block_byref_object_dispose__4;
  id v12 = 0LL;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __39__SUCoreAnalyticsEventSubmitter_events__block_invoke;
  v6[3] = &unk_18A0EF998;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __39__SUCoreAnalyticsEventSubmitter_events__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 8)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_queue_setEvent:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && ([v4 eventUUID], v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138543362;
      id v12 = v4;
      _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "SET_EVENT: Adding CoreAnalytics event to submission queue: %{public}@",  (uint8_t *)&v11,  0xCu);
    }

    events = self->_events;
    [v4 eventUUID];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setSafeObject:forKey:](events, "setSafeObject:forKey:", v4, v9);
  }

  else
  {
    v10 = -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    [v10 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1();
    }
  }
}

- (void)_queue_removeEvent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && ([v4 eventUUID], v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    events = self->_events;
    [v4 eventUUID];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](events, "objectForKey:", v7);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        int v14 = 138543362;
        id v15 = v4;
        _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "REMOVE_EVENT: Successfully removed event %{public}@ from queue",  (uint8_t *)&v14,  0xCu);
      }

      id v12 = self->_events;
      [v8 eventUUID];
      v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v10);
    }

    else if (v11)
    {
      int v14 = 138543362;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "REMOVE_EVENT: Event %{public}@ does not exist. Nothing to do",  (uint8_t *)&v14,  0xCu);
    }
  }

  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1();
    }
  }
}

- (void)_queue_removeEventsWithName:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    v5 = -[NSMutableDictionary allValues](self->_events, "allValues");
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v21;
      *(void *)&__int128 v7 = 138543362LL;
      __int128 v19 = v7;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          BOOL v11 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v11, "eventName", v19);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
            int v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 oslog];
            id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              v25 = v11;
              _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "REMOVE_EVENTS_WITH_NAME: Removing %{public}@",  buf,  0xCu);
            }

            events = self->_events;
            [v11 eventUUID];
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v17);
          }
        }

        uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }

      while (v8);
    }
  }

  else
  {
    v18 = -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    [v18 oslog];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_removeEventsWithName:].cold.1();
    }
  }
}

- (void)_queue_removeAllEvents
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "REMOVE_ALL_EVENTS: Removing all events from submission queue",  v5,  2u);
  }

  -[NSMutableDictionary removeAllObjects](self->_events, "removeAllObjects");
}

- (void)_queue_submitEvent:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4 && ([v4 eventUUID], v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    events = self->_events;
    [v4 eventUUID];
    __int128 v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](events, "objectForKey:", v7);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        int v13 = 138543362;
        int v14 = v8;
        _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "SUBMIT: Found event %{public}@. Sending",  (uint8_t *)&v13,  0xCu);
      }

      -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v8);
      -[SUCoreAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v8);
    }

    else
    {
      if (v11)
      {
        int v13 = 138543362;
        int v14 = (os_log_s *)v4;
        _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "SUBMIT: No event found matching %{public}@. Skipping",  (uint8_t *)&v13,  0xCu);
      }
    }
  }

  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_submitEvent:].cold.1();
    }
  }
}

- (void)_queue_submitEventsWithName:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    v5 = -[NSMutableDictionary allValues](self->_events, "allValues");
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v19;
      *(void *)&__int128 v7 = 138543362LL;
      __int128 v17 = v7;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v5);
          }
          BOOL v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          objc_msgSend(v11, "eventName", v17);
          id v12 = (void *)objc_claimAutoreleasedReturnValue();
          int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
            int v14 = (void *)objc_claimAutoreleasedReturnValue();
            [v14 oslog];
            uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v17;
              __int128 v23 = v11;
              _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "SUBMIT_EVENTS_WITH_NAME: Submitting %{public}@",  buf,  0xCu);
            }

            -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v11);
            -[SUCoreAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v11);
          }
        }

        uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v24 count:16];
      }

      while (v8);
    }
  }

  else
  {
    -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_submitEventsWithName:].cold.1();
    }
  }
}

- (void)_queue_submitAllEvents
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  -[NSMutableDictionary allValues](self->_events, "allValues");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v23 = [v3 count];
    _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "[CoreAnalytics]: SUBMIT_ALL_EVENTS: Will submit %{public}lu total events",  buf,  0xCu);
  }

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v18;
    *(void *)&__int128 v8 = 138543362LL;
    __int128 v16 = v8;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger", v16, (void)v17);
        int v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 oslog];
        int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          [v12 eventName];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v16;
          uint64_t v23 = (uint64_t)v15;
          _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "[CoreAnalytics]: SUBMIT_ALL_EVENT: Sending event %{public}@",  buf,  0xCu);
        }

        -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v12);
        -[SUCoreAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v12);
        ++v11;
      }

      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v9);
  }
}

- (void)_queue_registerSendEvent:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  v5 = -[SUCoreAnalyticsEventSubmitter eventSubmitterLogger](self, "eventSubmitterLogger");
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[CoreAnalytics] SUBMIT: Calling SendEventLazy for %{public}@",  buf,  0xCu);
    }

    [v4 eventName];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = v4;
    AnalyticsSendEventLazy();
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[SUCoreAnalyticsEventSubmitter _queue_registerSendEvent:].cold.1();
    }
  }
}

id __58__SUCoreAnalyticsEventSubmitter__queue_registerSendEvent___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) eventSubmitterLogger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "[CoreAnalytics] SUBMIT: Submitting CoreAnalytics event: %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  [*(id *)(a1 + 40) eventPayload];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (SUCoreLog)eventSubmitterLogger
{
  return self->_eventSubmitterLogger;
}

- (void)setEventSubmitterLogger:(id)a3
{
}

- (void).cxx_destruct
{
}

void __42__SUCoreAnalyticsEventSubmitter_setEvent___block_invoke_cold_1()
{
}

void __45__SUCoreAnalyticsEventSubmitter_removeEvent___block_invoke_cold_1()
{
}

void __45__SUCoreAnalyticsEventSubmitter_submitEvent___block_invoke_cold_1()
{
}

void __54__SUCoreAnalyticsEventSubmitter_submitEventsWithName___block_invoke_cold_1()
{
}

- (void)_queue_removeEventsWithName:.cold.1()
{
}

- (void)_queue_submitEvent:.cold.1()
{
}

- (void)_queue_submitEventsWithName:.cold.1()
{
}

- (void)_queue_registerSendEvent:.cold.1()
{
}

@end