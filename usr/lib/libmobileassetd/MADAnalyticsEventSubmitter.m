@interface MADAnalyticsEventSubmitter
- (MADAnalyticsEventSubmitter)init;
- (NSDictionary)events;
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
- (void)submitAllEvents;
- (void)submitEvent:(id)a3;
- (void)submitEventsWithName:(id)a3;
@end

@implementation MADAnalyticsEventSubmitter

- (MADAnalyticsEventSubmitter)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MADAnalyticsEventSubmitter;
  v2 = -[MADAnalyticsEventSubmitter init](&v10, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    events = v2->_events;
    v2->_events = v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mobileassetd.MADAnalyticsEventSubmitterQueue", v6);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (void)setEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__MADAnalyticsEventSubmitter_setEvent___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __39__MADAnalyticsEventSubmitter_setEvent___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_setEvent:");
  }
  else {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter setEvent:]_block_invoke",  @"SET_EVENT: Nil event passed to setEvent",  a5,  a6,  a7,  a8,  a9);
  }
}

- (void)removeEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __42__MADAnalyticsEventSubmitter_removeEvent___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __42__MADAnalyticsEventSubmitter_removeEvent___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_removeEvent:");
  }
  else {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter removeEvent:]_block_invoke",  @"REMOVE_EVENT: Nil event name passed to removeEvent",  a5,  a6,  a7,  a8,  a9);
  }
}

- (void)removeEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __51__MADAnalyticsEventSubmitter_removeEventsWithName___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __51__MADAnalyticsEventSubmitter_removeEventsWithName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_removeEventsWithName:");
  }
  else {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter removeEventsWithName:]_block_invoke",  @"REMOVE_EVENT: Nil event name passed to removeEvent",  a5,  a6,  a7,  a8,  a9);
  }
}

- (void)removeAllEvents
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__MADAnalyticsEventSubmitter_removeAllEvents__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

id __45__MADAnalyticsEventSubmitter_removeAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeAllEvents");
}

- (void)submitEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __42__MADAnalyticsEventSubmitter_submitEvent___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __42__MADAnalyticsEventSubmitter_submitEvent___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  objc_super v10 = *(void **)(a1 + 32);
  else {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter submitEvent:]_block_invoke",  @"SUBMIT_EVENT: Nil/invalid event passed to submit",  a5,  a6,  a7,  a8,  a9);
  }
}

- (void)submitEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __51__MADAnalyticsEventSubmitter_submitEventsWithName___block_invoke;
  block[3] = &unk_34DB98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

void __51__MADAnalyticsEventSubmitter_submitEventsWithName___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8,  uint64_t a9)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend(*(id *)(a1 + 40), "_queue_submitEventsWithName:");
  }
  else {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter submitEventsWithName:]_block_invoke",  @"SUBMIT_EVENTS_WITH_NAME: Nil event name passed to submitEvent",  a5,  a6,  a7,  a8,  a9);
  }
}

- (void)submitAllEvents
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__MADAnalyticsEventSubmitter_submitAllEvents__block_invoke;
  block[3] = &unk_34DBC0;
  void block[4] = self;
  dispatch_sync(stateQueue, block);
}

id __45__MADAnalyticsEventSubmitter_submitAllEvents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_submitAllEvents");
}

- (NSDictionary)events
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  objc_super v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0LL;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __36__MADAnalyticsEventSubmitter_events__block_invoke;
  v6[3] = &unk_34DB48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __36__MADAnalyticsEventSubmitter_events__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithDictionary:",  *(void *)(*(void *)(a1 + 32) + 8LL)));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_queue_setEvent:(id)a3
{
  id v16 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v16 && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v16 eventUUID]), v8, v8))
  {
    if (_MAPreferencesIsVerboseLoggingEnabled()) {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_setEvent:]",  @"SET_EVENT: Adding CoreAnalytics event to submission queue: %@",  v9,  v10,  v11,  v12,  (uint64_t)v16);
    }
    events = self->_events;
    v14 = (void *)objc_claimAutoreleasedReturnValue([v16 eventUUID]);
    -[NSMutableDictionary setSafeObject:forKey:](events, "setSafeObject:forKey:", v16, v14);
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_setEvent:]",  @"SET_EVENT: Nil event passed to setEvent",  v4,  v5,  v6,  v7,  v15);
  }
}

- (void)_queue_removeEvent:(id)a3
{
  id v20 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v20 && (id v8 = (void *)objc_claimAutoreleasedReturnValue([v20 eventUUID]), v8, v8))
  {
    events = self->_events;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v20 eventUUID]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](events, "objectForKey:", v10));

    int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
    if (v11)
    {
      if (IsVerboseLoggingEnabled) {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_removeEvent:]",  @"REMOVE_EVENT: Successfully removed event %@ from queue",  v13,  v14,  v15,  v16,  (uint64_t)v20);
      }
      v17 = self->_events;
      v18 = (void *)objc_claimAutoreleasedReturnValue([v11 eventUUID]);
      -[NSMutableDictionary removeObjectForKey:](v17, "removeObjectForKey:", v18);
    }

    else if (IsVerboseLoggingEnabled)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_removeEvent:]",  @"REMOVE_EVENT: Event %@ does not exist. Nothing to do",  v13,  v14,  v15,  v16,  (uint64_t)v20);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_removeEvent:]",  @"REMOVE_EVENT: Nil event name passed to removeEvent",  v4,  v5,  v6,  v7,  v19);
  }
}

- (void)_queue_removeEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_events, "allValues"));
    int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 eventName]);
          unsigned int v18 = [v17 isEqualToString:v4];

          if (v18)
          {
            if (IsVerboseLoggingEnabled) {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_removeEventsWithName:]",  @"REMOVE_EVENTS_WITH_NAME: Removing %@",  v19,  v20,  v21,  v22,  (uint64_t)v16);
            }
            events = self->_events;
            v24 = (void *)objc_claimAutoreleasedReturnValue([v16 eventUUID]);
            -[NSMutableDictionary removeObjectForKey:](events, "removeObjectForKey:", v24);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v13);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_removeEventsWithName:]",  @"REMOVE_EVENTS_WITH_NAME: Nil event name passed to removeEvent",  v5,  v6,  v7,  v8,  v25);
  }
}

- (void)_queue_removeAllEvents
{
}

- (void)_queue_submitEvent:(id)a3
{
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v18 && (uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v18 eventUUID]), v8, v8))
  {
    events = self->_events;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v18 eventUUID]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](events, "objectForKey:", v10));

    int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
    if (v11)
    {
      if (IsVerboseLoggingEnabled) {
        _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitEvent:]",  @"SUBMIT: Found event %@. Sending",  v13,  v14,  v15,  v16,  (uint64_t)v11);
      }
      -[MADAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v11);
      -[MADAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v11);
    }

    else if (IsVerboseLoggingEnabled)
    {
      _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitEvent:]",  @"SUBMIT: No event found matching %@. Skipping",  v13,  v14,  v15,  v16,  (uint64_t)v18);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitEvent:]",  @"SUBMIT: nil event/uuid passed to submit",  v4,  v5,  v6,  v7,  v17);
  }
}

- (void)_queue_submitEventsWithName:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v4)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_events, "allValues"));
    int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8LL * (void)i);
          uint64_t v16 = objc_autoreleasePoolPush();
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 eventName]);
          unsigned int v18 = [v17 isEqualToString:v4];

          if (v18)
          {
            if (IsVerboseLoggingEnabled) {
              _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitEventsWithName:]",  @"SUBMIT_EVENTS_WITH_NAME: Submitting %@",  v19,  v20,  v21,  v22,  (uint64_t)v15);
            }
            -[MADAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v15);
            -[MADAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v15);
          }

          objc_autoreleasePoolPop(v16);
        }

        id v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v12);
    }
  }

  else
  {
    _MobileAssetLog( 0LL,  3,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitEventsWithName:]",  @"SUBMIT_EVENTS_WITH_NAME: nil event name passed to submitEvent",  v5,  v6,  v7,  v8,  v23);
  }
}

- (void)_queue_submitAllEvents
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_events, "allValues"));
  id v4 = [v3 count];
  _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitAllEvents]",  @"[CoreAnalytics]: SUBMIT_ALL_EVENTS: Will submit %lu total events",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    do
    {
      uint64_t v14 = 0LL;
      do
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)v14);
        uint64_t v16 = objc_autoreleasePoolPush();
        if (IsVerboseLoggingEnabled)
        {
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 eventName]);
          _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_submitAllEvents]",  @"[CoreAnalytics]: SUBMIT_ALL_EVENT: Sending event %@",  v18,  v19,  v20,  v21,  (uint64_t)v17);
        }

        -[MADAnalyticsEventSubmitter _queue_registerSendEvent:](self, "_queue_registerSendEvent:", v15);
        -[MADAnalyticsEventSubmitter _queue_removeEvent:](self, "_queue_removeEvent:", v15);
        objc_autoreleasePoolPop(v16);
        uint64_t v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v12);
  }
}

- (void)_queue_registerSendEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (!v4)
  {
    id v12 = @"[CoreAnalytics] SUBMIT: NO -- Unable to register sending null CoreAnalytics event. ";
    int v13 = 3;
LABEL_8:
    _MobileAssetLog( 0LL,  v13,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_registerSendEvent:]",  v12,  v5,  v6,  v7,  v8,  v14);
    goto LABEL_9;
  }

  int IsVerboseLoggingEnabled = _MAPreferencesIsVerboseLoggingEnabled();
  if (!&_AnalyticsSendEventLazy)
  {
    uint64_t v14 = (uint64_t)v4;
    id v12 = @"[CoreAnalytics] SUBMIT: NO -- Unable to invoke CoreAnalytics on this OS for event %@";
    int v13 = 6;
    goto LABEL_8;
  }

  char v10 = IsVerboseLoggingEnabled;
  if (IsVerboseLoggingEnabled) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_registerSendEvent:]",  @"[CoreAnalytics] SUBMIT: Calling SendEventLazy for %@",  v5,  v6,  v7,  v8,  (uint64_t)v4);
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 eventName]);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = __55__MADAnalyticsEventSubmitter__queue_registerSendEvent___block_invoke;
  v15[3] = &unk_34DBE8;
  char v17 = v10;
  id v16 = v4;
  AnalyticsSendEventLazy(v11, v15);

LABEL_9:
}

id __55__MADAnalyticsEventSubmitter__queue_registerSendEvent___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  if (*(_BYTE *)(a1 + 40)) {
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEventSubmitter _queue_registerSendEvent:]_block_invoke",  @"[CoreAnalytics] SUBMIT: YES -- Submitting CoreAnalytics event: %@",  a5,  a6,  a7,  a8,  *(void *)(a1 + 32));
  }
  return [*(id *)(a1 + 32) eventPayload];
}

- (void).cxx_destruct
{
}

@end