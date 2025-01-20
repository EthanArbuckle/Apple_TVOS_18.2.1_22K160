@interface MADAnalyticsEvent
+ (BOOL)supportsSecureCoding;
+ (id)eventWithName:(id)a3 payload:(id)a4;
- (MADAnalyticsEvent)init;
- (MADAnalyticsEvent)initWithCoder:(id)a3;
- (MADAnalyticsEvent)initWithEventName:(id)a3;
- (NSDictionary)eventPayload;
- (NSMutableDictionary)mutableEventPayload;
- (NSString)eventName;
- (NSString)eventUUID;
- (OS_dispatch_queue)stateQueue;
- (id)description;
- (void)_queue_removeEventPayloadEntry:(id)a3;
- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4;
- (void)_queue_setEventPayloadEntryToNull:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removeEventPayloadEntry:(id)a3;
- (void)setEventPayloadEntry:(id)a3 value:(id)a4;
- (void)setEventPayloadEntryToNull:(id)a3;
- (void)setEventUUID:(id)a3;
- (void)setMutableEventPayload:(id)a3;
@end

@implementation MADAnalyticsEvent

+ (id)eventWithName:(id)a3 payload:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = -[MADAnalyticsEvent initWithEventName:](objc_alloc(&OBJC_CLASS___MADAnalyticsEvent), "initWithEventName:", v5);
  if (v6)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allKeys", 0));
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        v12 = 0LL;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)v12);
          v14 = objc_autoreleasePoolPush();
          v15 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:v13]);
          -[MADAnalyticsEvent setEventPayloadEntry:value:](v7, "setEventPayloadEntry:value:", v13, v15);

          objc_autoreleasePoolPop(v14);
          v12 = (char *)v12 + 1;
        }

        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }

      while (v10);
    }
  }

  return v7;
}

- (MADAnalyticsEvent)initWithEventName:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MADAnalyticsEvent;
  id v6 = -[MADAnalyticsEvent init](&v18, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_eventName, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    mutableEventPayload = v7->_mutableEventPayload;
    v7->_mutableEventPayload = v8;

    dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.MAD.CoreAnalyticsEventQueue", v11);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 UUIDString]);
    eventUUID = v7->_eventUUID;
    v7->_eventUUID = (NSString *)v15;
  }

  return v7;
}

- (void)setEventPayloadEntry:(id)a3 value:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0
    || (uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    || (uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v6, v9) & 1) != 0)
    || (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v6, v10) & 1) != 0))
  {
    stateQueue = (dispatch_queue_s *)self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __48__MADAnalyticsEvent_setEventPayloadEntry_value___block_invoke;
    block[3] = &unk_34DB70;
    block[4] = self;
    id v21 = v19;
    id v22 = v6;
    dispatch_sync(stateQueue, block);
  }

  else
  {
    dispatch_queue_t v12 = (objc_class *)objc_opt_class(v6);
    uint64_t v13 = NSStringFromClass(v12);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue(v13);
    _MobileAssetLog( 0LL,  6,  (uint64_t)"-[MADAnalyticsEvent setEventPayloadEntry:value:]",  @"Event payload data %@ is unsupported type %@. Supported Types: NSString, NSNumber, NSData, NSDate",  v14,  v15,  v16,  v17,  (uint64_t)v19);
  }
}

id __48__MADAnalyticsEvent_setEventPayloadEntry_value___block_invoke(uint64_t a1)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_queue_setEventPayloadEntry:value:",  *(void *)(a1 + 40),  *(void *)(a1 + 48));
}

- (void)_queue_setEventPayloadEntry:(id)a3 value:(id)a4
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  id v7 = a4;
  id v8 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[NSMutableDictionary setSafeObject:forKey:](self->_mutableEventPayload, "setSafeObject:forKey:", v7, v8);
}

- (NSString)eventUUID
{
  return self->_eventUUID;
}

- (NSString)eventName
{
  return self->_eventName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsEvent eventName](self, "eventName"));
  [v4 encodeObject:v5 forKey:@"eventName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsEvent eventUUID](self, "eventUUID"));
  [v4 encodeObject:v6 forKey:@"eventUuid"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[MADAnalyticsEvent eventPayload](self, "eventPayload"));
  [v4 encodeObject:v7 forKey:@"eventPayload"];
}

- (NSDictionary)eventPayload
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0LL;
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __33__MADAnalyticsEvent_eventPayload__block_invoke;
  v6[3] = &unk_34DB48;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

void __33__MADAnalyticsEvent_eventPayload__block_invoke(uint64_t a1)
{
  v2 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v6 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) mutableEventPayload]);
  v3 = -[NSDictionary initWithDictionary:](v2, "initWithDictionary:", v6);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSMutableDictionary)mutableEventPayload
{
  return self->_mutableEventPayload;
}

- (void).cxx_destruct
{
}

- (MADAnalyticsEvent)init
{
  return 0LL;
}

- (MADAnalyticsEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = -[MADAnalyticsEvent initWithEventName:](self, "initWithEventName:", 0LL);
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"eventName"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"eventUuid"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    eventUUID = v5->_eventUUID;
    v5->_eventUUID = (NSString *)v10;

    id v12 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSString), 0LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber);
    uint64_t v16 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v14,  v15,  objc_opt_class(&OBJC_CLASS___NSData),  0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_super v18 = (void *)objc_claimAutoreleasedReturnValue( [v4 decodeDictionaryWithKeysOfClasses:v13 objectsOfClasses:v17 forKey:@"eventPayload"]);
    -[NSMutableDictionary addEntriesFromDictionary:](v5->_mutableEventPayload, "addEntriesFromDictionary:", v18);
  }

  return v5;
}

- (void)setEventPayloadEntryToNull:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __48__MADAnalyticsEvent_setEventPayloadEntryToNull___block_invoke;
  block[3] = &unk_34DB98;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

id __48__MADAnalyticsEvent_setEventPayloadEntryToNull___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setEventPayloadEntryToNull:", *(void *)(a1 + 40));
}

- (void)removeEventPayloadEntry:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __45__MADAnalyticsEvent_removeEventPayloadEntry___block_invoke;
  block[3] = &unk_34DB98;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, block);
}

id __45__MADAnalyticsEvent_removeEventPayloadEntry___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEventPayloadEntry:", *(void *)(a1 + 40));
}

- (void)_queue_setEventPayloadEntryToNull:(id)a3
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  mutableEventPayload = self->_mutableEventPayload;
  id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  -[NSMutableDictionary setSafeObject:forKey:](mutableEventPayload, "setSafeObject:forKey:", v7, v5);
}

- (void)_queue_removeEventPayloadEntry:(id)a3
{
  stateQueue = (dispatch_queue_s *)self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_mutableEventPayload,  "setObject:forKeyedSubscript:",  0LL,  v5);
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsEvent eventName](self, "eventName"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsEvent eventUUID](self, "eventUUID"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAnalyticsEvent eventPayload](self, "eventPayload"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"EventName: %@ EventUUID: %@ EventPayload: %@",  v3,  v4,  v5));

  return v6;
}

- (void)setEventUUID:(id)a3
{
}

- (void)setMutableEventPayload:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

@end