@interface PDXPCEventPublisher
- (BOOL)receivedInitialBarrier;
- (NSMutableArray)pendingSendEventCompletions;
- (NSMutableArray)pendingSendEvents;
- (NSMutableSet)tokens;
- (NSString)streamName;
- (OS_dispatch_queue)queue;
- (OS_xpc_event_publisher)publisher;
- (PDXPCEventPublisher)initWithStreamName:(id)a3;
- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 completion:(id)a4;
- (void)setPendingSendEventCompletions:(id)a3;
- (void)setPendingSendEvents:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReceivedInitialBarrier:(BOOL)a3;
- (void)setStreamName:(id)a3;
- (void)setTokens:(id)a3;
@end

@implementation PDXPCEventPublisher

- (PDXPCEventPublisher)initWithStreamName:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PDXPCEventPublisher;
  v6 = -[PDXPCEventPublisher init](&v30, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_streamName, a3);
    dispatch_queue_attr_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create(-[NSString UTF8String](v7->_streamName, "UTF8String"), v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    id v12 = v5;
    uint64_t v13 = xpc_event_publisher_create([v12 UTF8String], v7->_queue);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    publisher = v7->_publisher;
    v7->_publisher = (OS_xpc_event_publisher *)v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingSendEvents = v7->_pendingSendEvents;
    v7->_pendingSendEvents = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingSendEventCompletions = v7->_pendingSendEventCompletions;
    v7->_pendingSendEventCompletions = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    tokens = v7->_tokens;
    v7->_tokens = v20;

    if (v7->_publisher)
    {
      objc_initWeak(&location, v7);
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1002443EC;
      v27[3] = &unk_10064EDF0;
      objc_copyWeak(&v28, &location);
      v22 = objc_retainBlock(v27);
      xpc_event_publisher_set_handler(v7->_publisher, v22);
      v23 = v7->_publisher;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472LL;
      v25[2] = sub_10024444C;
      v25[3] = &unk_10064EE18;
      id v26 = v12;
      xpc_event_publisher_set_error_handler(v23, v25);
      xpc_event_publisher_activate(v7->_publisher);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (v8)
  {
    dispatch_queue_t v10 = xpc_copy_description(v8);
    uint64_t Object = PKLogFacilityTypeGetObject(4LL);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      streamName = self->_streamName;
      *(_DWORD *)buf = 138544130;
      v45 = streamName;
      __int16 v46 = 1024;
      unsigned int v47 = a3;
      __int16 v48 = 2048;
      unint64_t v49 = a4;
      __int16 v50 = 2080;
      v51 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu: %s",  buf,  0x26u);
    }

    if (v10) {
      free(v10);
    }
    if (a3) {
      goto LABEL_7;
    }
LABEL_29:
    tokens = self->_tokens;
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    -[NSMutableSet addObject:](tokens, "addObject:", v18);
LABEL_31:

    goto LABEL_32;
  }

  uint64_t v29 = PKLogFacilityTypeGetObject(4LL);
  objc_super v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = self->_streamName;
    *(_DWORD *)buf = 138543874;
    v45 = v31;
    __int16 v46 = 1024;
    unsigned int v47 = a3;
    __int16 v48 = 2048;
    unint64_t v49 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu",  buf,  0x1Cu);
  }

  if (!a3) {
    goto LABEL_29;
  }
LABEL_7:
  if (a3 == 1)
  {
    v33 = self->_tokens;
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
    -[NSMutableSet removeObject:](v33, "removeObject:", v18);
    goto LABEL_31;
  }

  if (a3 == 2)
  {
    uint64_t v14 = PKLogFacilityTypeGetObject(4LL);
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_streamName;
      *(_DWORD *)buf = 138543362;
      v45 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "XPC event publisher for stream %{public}@ received initial barrier",  buf,  0xCu);
    }

    self->_receivedInitialBarrier = 1;
    id v17 = -[NSMutableArray copy](self->_pendingSendEvents, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingSendEvents, "removeAllObjects");
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v18 = v17;
    id v19 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          -[PDXPCEventPublisher sendEvent:](self, "sendEvent:", *(void *)(*((void *)&v38 + 1) + 8LL * (void)i));
        }

        id v20 = [v18 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }

      while (v20);
    }

    id v23 = -[NSMutableArray copy](self->_pendingSendEventCompletions, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingSendEventCompletions, "removeAllObjects");
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    id v24 = v23;
    id v25 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v35;
      do
      {
        for (j = 0LL; j != v26; j = (char *)j + 1)
        {
          if (*(void *)v35 != v27) {
            objc_enumerationMutation(v24);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v34 + 1) + 8LL * (void)j) + 16LL))(*(void *)(*((void *)&v34 + 1) + 8LL * (void)j));
        }

        id v26 = [v24 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }

      while (v26);
    }

    goto LABEL_31;
  }

- (void)sendEvent:(id)a3
{
}

- (void)sendEvent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1002448F8;
  block[3] = &unk_100639AF0;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)queue, block);
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
}

- (NSMutableArray)pendingSendEventCompletions
{
  return self->_pendingSendEventCompletions;
}

- (void)setPendingSendEventCompletions:(id)a3
{
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
}

- (BOOL)receivedInitialBarrier
{
  return self->_receivedInitialBarrier;
}

- (void)setReceivedInitialBarrier:(BOOL)a3
{
  self->_receivedInitialBarrier = a3;
}

- (void).cxx_destruct
{
}

@end