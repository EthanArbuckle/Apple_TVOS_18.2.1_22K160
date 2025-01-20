@interface PDXPCEventStreamManager
- (PDXPCEventStreamManager)init;
- (PDXPCEventStreamManager)initWithEventStream:(id)a3 startedPaused:(BOOL)a4;
- (void)_deliverEvent:(id)a3 toObservers:(id)a4 withTransaction:(id)a5;
- (void)_deliverEvents:(id)a3 eventsWerePreviouslyDeferred:(BOOL)a4;
- (void)beginEventDelivery;
- (void)registerObserver:(id)a3 withReplyQueue:(id)a4;
- (void)unregisterObserver:(id)a3;
@end

@implementation PDXPCEventStreamManager

- (PDXPCEventStreamManager)init
{
  return 0LL;
}

- (PDXPCEventStreamManager)initWithEventStream:(id)a3 startedPaused:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___PDXPCEventStreamManager;
  v7 = -[PDXPCEventStreamManager init](&v28, "init");
  if (v7)
  {
    v8 = (NSString *)[v6 copy];
    eventStream = v7->_eventStream;
    v7->_eventStream = v8;

    v7->_observersLock._os_unfair_lock_opaque = 0;
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    observers = v7->_observers;
    v7->_observers = v10;

    if (v4)
    {
      v12 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
      pendingEvents = v7->_pendingEvents;
      v7->_pendingEvents = v12;
    }

    dispatch_queue_attr_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v14);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.passd.xpcEventStreamManager.event", v15);
    eventQueue = v7->_eventQueue;
    v7->_eventQueue = (OS_dispatch_queue *)v16;

    dispatch_queue_t v18 = dispatch_queue_create("com.apple.passd.xpcEventStreamManager.reply", v15);
    replyQueue = v7->_replyQueue;
    v7->_replyQueue = (OS_dispatch_queue *)v18;

    uint64_t Object = PKLogFacilityTypeGetObject(0LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v7->_eventStream;
      *(_DWORD *)buf = 138543362;
      v30 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "PDXPCEventStreamManager: Registering for stream %{public}@.",  buf,  0xCu);
    }

    v23 = -[NSString UTF8String](v7->_eventStream, "UTF8String");
    v24 = (dispatch_queue_s *)v7->_eventQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100041878;
    handler[3] = &unk_10063C0A8;
    v27 = v7;
    xpc_set_event_stream_handler(v23, v24, handler);
  }

  return v7;
}

- (void)beginEventDelivery
{
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  BOOL v4 = self->_pendingEvents;
  v5 = self->_pendingEventsTransaction;
  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = 0LL;

  pendingEventsTransaction = self->_pendingEventsTransaction;
  self->_pendingEventsTransaction = 0LL;

  os_unfair_lock_unlock(p_observersLock);
  if (-[NSMutableArray count](v4, "count"))
  {
    eventQueue = self->_eventQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100041A20;
    block[3] = &unk_100639350;
    v10 = v5;
    v11 = self;
    v12 = v4;
    dispatch_async((dispatch_queue_t)eventQueue, block);
  }
}

- (void)registerObserver:(id)a3 withReplyQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    os_unfair_lock_lock(&self->_observersLock);
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v9 = self->_observers;
    id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          dispatch_queue_attr_t v14 = *(void **)(*((void *)&v16 + 1) + 8LL * (void)i);
          id v15 = (id)objc_claimAutoreleasedReturnValue([v14 observer]);
          if (v15)
          {
            -[NSMutableArray addObject:](v8, "addObject:", v15);
            if (v15 == v6)
            {
              [v14 setReplyQueue:v7];

              goto LABEL_13;
            }
          }
        }

        id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v16,  v20,  16LL);
        if (v11) {
          continue;
        }
        break;
      }
    }

    v9 = objc_alloc_init(&OBJC_CLASS___PDXPCEventStreamObserverEntry);
    -[NSMutableArray setObserver:](v9, "setObserver:", v6);
    -[NSMutableArray setReplyQueue:](v9, "setReplyQueue:", v7);
    -[NSMutableArray addObject:](self->_observers, "addObject:", v9);
LABEL_13:

    os_unfair_lock_unlock(&self->_observersLock);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v10 = a3;
  BOOL v4 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  os_unfair_lock_lock(&self->_observersLock);
  v5 = (char *)-[NSMutableArray count](self->_observers, "count");
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableIndexSet);
  if (v5)
  {
    for (i = 0LL; i != v5; ++i)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_observers, "objectAtIndexedSubscript:", i));
      id v9 = (id)objc_claimAutoreleasedReturnValue([v8 observer]);

      if (!v9 || (-[NSMutableArray addObject:](v4, "addObject:", v9), v10) && v9 == v10) {
        -[NSMutableIndexSet addIndex:](v6, "addIndex:", i);
      }
    }
  }

  -[NSMutableArray removeObjectsAtIndexes:](self->_observers, "removeObjectsAtIndexes:", v6);
  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)_deliverEvents:(id)a3 eventsWerePreviouslyDeferred:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  pendingEvents = self->_pendingEvents;
  if (!pendingEvents)
  {
    id v20 = -[NSMutableArray copy](self->_observers, "copy");
    os_unfair_lock_unlock(&self->_observersLock);
    if (!v20) {
      goto LABEL_32;
    }
    id v10 = (id)PDOSTransactionCreate("PDXPCEventStreamManager");
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    id v35 = v6;
    id obj = v6;
    id v21 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (!v21) {
      goto LABEL_28;
    }
    id v22 = v21;
    uint64_t v23 = *(void *)v42;
LABEL_17:
    uint64_t v24 = 0LL;
    while (1)
    {
      if (*(void *)v42 != v23) {
        objc_enumerationMutation(obj);
      }
      v25 = *(void **)(*((void *)&v41 + 1) + 8 * v24);
      uint64_t Object = PKLogFacilityTypeGetObject(0LL);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        if (v28)
        {
          eventStream = self->_eventStream;
          string = xpc_dictionary_get_string(v25, _xpc_event_key_name);
          *(_DWORD *)buf = 138543618;
          v47 = eventStream;
          __int16 v48 = 2080;
          v49 = string;
          v31 = v27;
          v32 = "PDXPCEventStreamManager (%{public}@): (deferred delivery) XPC wake for %s.";
LABEL_25:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x16u);
        }
      }

      else if (v28)
      {
        v33 = self->_eventStream;
        v34 = xpc_dictionary_get_string(v25, _xpc_event_key_name);
        *(_DWORD *)buf = 138543618;
        v47 = v33;
        __int16 v48 = 2080;
        v49 = v34;
        v31 = v27;
        v32 = "PDXPCEventStreamManager (%{public}@): XPC wake for %s.";
        goto LABEL_25;
      }

      -[PDXPCEventStreamManager _deliverEvent:toObservers:withTransaction:]( self,  "_deliverEvent:toObservers:withTransaction:",  v25,  v20,  v10);
      if (v22 == (id)++v24)
      {
        id v22 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (!v22)
        {
LABEL_28:

          goto LABEL_29;
        }

        goto LABEL_17;
      }
    }
  }

  -[NSMutableArray addObjectsFromArray:](pendingEvents, "addObjectsFromArray:", v6);
  if (!self->_pendingEventsTransaction)
  {
    v8 = (OS_os_transaction *)PDOSTransactionCreate("PDXPCEventStreamManager.deferred");
    pendingEventsTransaction = self->_pendingEventsTransaction;
    self->_pendingEventsTransaction = v8;
  }

  os_unfair_lock_unlock(&self->_observersLock);
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v10 = v6;
  id v11 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v11)
  {
    id v12 = v11;
    id v35 = v6;
    uint64_t v13 = *(void *)v38;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v37 + 1) + 8LL * (void)i);
        uint64_t v16 = PKLogFacilityTypeGetObject(0LL);
        __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          __int128 v18 = self->_eventStream;
          __int128 v19 = xpc_dictionary_get_string(v15, _xpc_event_key_name);
          *(_DWORD *)buf = 138543618;
          v47 = v18;
          __int16 v48 = 2080;
          v49 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "PDXPCEventStreamManager (%{public}@): (deferred) XPC wake for %s.",  buf,  0x16u);
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }

    while (v12);
    id v20 = 0LL;
LABEL_29:
    id v6 = v35;
  }

  else
  {
    id v20 = 0LL;
  }

LABEL_32:
}

- (void)_deliverEvent:(id)a3 toObservers:(id)a4 withTransaction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v9 count])
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    id v21 = v9;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v28 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 observer]);
          if (v17)
          {
            __int128 v18 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue([v16 replyQueue]);
            replyQueue = v18;
            if (!v18) {
              replyQueue = self->_replyQueue;
            }
            id v20 = replyQueue;

            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472LL;
            block[2] = sub_10004226C;
            block[3] = &unk_10063B060;
            id v23 = v10;
            id v24 = v17;
            id v25 = v8;
            v26 = self;
            dispatch_async(v20, block);
          }
        }

        id v13 = [v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v13);
    }

    id v9 = v21;
  }
}

- (void).cxx_destruct
{
}

@end