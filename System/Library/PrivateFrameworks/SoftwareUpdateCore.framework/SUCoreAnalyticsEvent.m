@interface SUCoreAnalyticsEvent
- (NSDictionary)eventPayload;
- (NSString)eventName;
- (NSString)eventUUID;
- (SUCoreAnalyticsEvent)init;
- (SUCoreAnalyticsEvent)initWithEventName:(id)a3;
- (id)description;
- (void)_queue_removeEventPayloadEntry:(id)a3;
- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4;
- (void)_queue_setEventPayloadEntryToNull:(id)a3;
- (void)removeEventPayloadEntry:(id)a3;
- (void)setEventPayloadEntry:(id)a3 value:(id)a4;
- (void)setEventPayloadEntryToNull:(id)a3;
- (void)setEventUUID:(id)a3;
@end

@implementation SUCoreAnalyticsEvent

- (SUCoreAnalyticsEvent)init
{
  return 0LL;
}

- (SUCoreAnalyticsEvent)initWithEventName:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SUCoreAnalyticsEvent;
  v6 = -[SUCoreAnalyticsEvent init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    mutableEventPayload = v7->_mutableEventPayload;
    v7->_mutableEventPayload = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.SUCore.CoreAnalyticsEventQueue", v10);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v11;

    [MEMORY[0x189607AB8] UUID];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 UUIDString];
    eventUUID = v7->_eventUUID;
    v7->_eventUUID = (NSString *)v14;
  }

  return v7;
}

- (NSDictionary)eventPayload
{
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  v10 = __Block_byref_object_copy__3;
  dispatch_queue_t v11 = __Block_byref_object_dispose__3;
  id v12 = 0LL;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__SUCoreAnalyticsEvent_eventPayload__block_invoke;
  v6[3] = &unk_18A0EF998;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync((dispatch_queue_t)stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __36__SUCoreAnalyticsEvent_eventPayload__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x189603F68] dictionaryWithDictionary:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setEventPayloadEntry:(id)a3 value:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __51__SUCoreAnalyticsEvent_setEventPayloadEntry_value___block_invoke;
    block[3] = &unk_18A0F03C8;
    block[4] = self;
    id v14 = v6;
    id v15 = v7;
    dispatch_sync((dispatch_queue_t)stateQueue, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_queue_t v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v17 = v6;
      __int16 v18 = 2114;
      v19 = v12;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "Event payload data %{public}@ is unsupported type %{public}@. Supported Types: NSString, NSNumber, NSData, NSDate",  buf,  0x16u);
    }
  }
}

uint64_t __51__SUCoreAnalyticsEvent_setEventPayloadEntry_value___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_queue_setEventPayloadEntry:value:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

- (void)setEventPayloadEntryToNull:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__SUCoreAnalyticsEvent_setEventPayloadEntryToNull___block_invoke;
  block[3] = &unk_18A0F0510;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __51__SUCoreAnalyticsEvent_setEventPayloadEntryToNull___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntryToNull:", *(void *)(a1 + 40));
}

- (void)removeEventPayloadEntry:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__SUCoreAnalyticsEvent_removeEventPayloadEntry___block_invoke;
  block[3] = &unk_18A0F0510;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)stateQueue, block);
}

uint64_t __48__SUCoreAnalyticsEvent_removeEventPayloadEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEventPayloadEntry:", *(void *)(a1 + 40));
}

- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4
{
  stateQueue = self->_stateQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)stateQueue);
  -[NSMutableDictionary setSafeObject:forKey:](self->_mutableEventPayload, "setSafeObject:forKey:", v7, v8);
}

- (void)_queue_setEventPayloadEntryToNull:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)stateQueue);
  mutableEventPayload = self->_mutableEventPayload;
  [MEMORY[0x189603FE8] null];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setSafeObject:forKey:](mutableEventPayload, "setSafeObject:forKey:", v7, v5);
}

- (void)_queue_removeEventPayloadEntry:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)stateQueue);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableEventPayload,  "setObject:forKeyedSubscript:",  0LL,  v5);
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  -[SUCoreAnalyticsEvent eventName](self, "eventName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreAnalyticsEvent eventUUID](self, "eventUUID");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreAnalyticsEvent eventPayload](self, "eventPayload");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"EventName: %@ EventUUID: %@ EventPayload: %@", v4, v5, v6];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (void)setEventUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end