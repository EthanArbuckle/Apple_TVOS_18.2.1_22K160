@interface TCCDEventPublisher
+ (id)sharedPublisher;
- (TCCDEventPublisher)init;
- (void)_addPendingEvent:(id)a3;
- (void)_addSubscriber:(unint64_t)a3 withFilterCriteria:(id)a4;
- (void)_handleError:(int)a3;
- (void)_handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5;
- (void)_publishPendingEvents;
- (void)_removeSubscriber:(unint64_t)a3;
- (void)checkEntitlementForSubscriber:(id)a3 completionHandler:(id)a4;
- (void)publish:(id)a3;
- (void)sendEvent:(id)a3 toSubscriber:(id)a4;
@end

@implementation TCCDEventPublisher

+ (id)sharedPublisher
{
  if (qword_100078450 != -1) {
    dispatch_once(&qword_100078450, &stru_100065F80);
  }
  return (id)qword_100078448;
}

- (TCCDEventPublisher)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___TCCDEventPublisher;
  v2 = -[TCCDEventPublisher init](&v22, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    subscribers = v2->_subscribers;
    v2->_subscribers = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    pendingEvents = v2->_pendingEvents;
    v2->_pendingEvents = (NSMutableArray *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create("TCCDEventPublisherQueue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    uint64_t v11 = xpc_event_publisher_create("com.apple.tccd.events", v2->_queue);
    uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
    publisher = v2->_publisher;
    v2->_publisher = (OS_xpc_event_publisher *)v12;

    objc_initWeak(&location, v2);
    v14 = v2->_publisher;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100036A94;
    v19[3] = &unk_100065FA8;
    objc_copyWeak(&v20, &location);
    xpc_event_publisher_set_handler(v14, v19);
    v15 = v2->_publisher;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100036AF4;
    v17[3] = &unk_100065FD0;
    objc_copyWeak(&v18, &location);
    xpc_event_publisher_set_error_handler(v15, v17);
    xpc_event_publisher_activate(v2->_publisher);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)_handleError:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = tcc_events_log();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000378AC(v3, v5);
  }
}

- (void)_handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8 = a5;
  dispatch_queue_t v9 = v8;
  if (v8)
  {
    v10 = xpc_copy_description(v8);
    id v11 = tcc_events_log();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = "Add";
      if (a3 == 1) {
        v15 = "Remove";
      }
      int v16 = 136446722;
      if (a3 == 2) {
        v15 = "Initial Barrier";
      }
      v17 = v15;
      __int16 v18 = 2048;
      unint64_t v19 = a4;
      __int16 v20 = 2082;
      v21 = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Received event: action=%{public}s, token=%llu, descriptor=%{public}s",  (uint8_t *)&v16,  0x20u);
    }

    free(v10);
  }

  else
  {
    id v13 = tcc_events_log();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_10003792C(a3, a4, v14);
    }
  }

  switch(a3)
  {
    case 2u:
      self->_receivedInitialBarrier = 1;
      -[TCCDEventPublisher _publishPendingEvents](self, "_publishPendingEvents");
      break;
    case 1u:
      -[TCCDEventPublisher _removeSubscriber:](self, "_removeSubscriber:", a4);
      break;
    case 0u:
      -[TCCDEventPublisher _addSubscriber:withFilterCriteria:](self, "_addSubscriber:withFilterCriteria:", a4, v9);
      break;
  }
}

- (void)_addSubscriber:(unint64_t)a3 withFilterCriteria:(id)a4
{
  id v6 = a4;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036DA0;
  block[3] = &unk_100065FF8;
  id v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)checkEntitlementForSubscriber:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  publisher = self->_publisher;
  id v9 = [v6 token];
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100036F84;
  v13[3] = &unk_100066020;
  id v14 = v6;
  v15 = self;
  id v16 = v7;
  id v11 = v7;
  id v12 = v6;
  xpc_event_publisher_fire_with_reply(publisher, v9, 0LL, queue, v13);
}

- (void)_removeSubscriber:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100037228;
  v4[3] = &unk_100066048;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)_addPendingEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableArray addObject:](self->_pendingEvents, "addObject:", v4);
  id v5 = tcc_events_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100037AD0((uint64_t)v4, v6, v7);
  }

  if ((unint64_t)-[NSMutableArray count](self->_pendingEvents, "count") >= 0x21)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_pendingEvents, "removeObjectAtIndex:", 0LL);
    id v8 = tcc_events_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100037A58((uint64_t)self, v9);
    }
  }
}

- (void)_publishPendingEvents
{
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  uint64_t v3 = self->_pendingEvents;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[TCCDEventPublisher publish:]( self,  "publish:",  *(void *)(*((void *)&v8 + 1) + 8LL * (void)v7),  (void)v8);
        uint64_t v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v8,  v12,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_pendingEvents, "removeAllObjects");
}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  publisher = self->_publisher;
  id v9 = [v7 token];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue([v6 xpcObject]);
  uint64_t v11 = xpc_event_publisher_fire(publisher, v9, v10);

  if ((_DWORD)v11)
  {
    id v12 = tcc_events_log();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138543874;
      id v15 = v6;
      __int16 v16 = 2114;
      id v17 = v7;
      __int16 v18 = 2082;
      uint64_t v19 = xpc_strerror(v11);
      _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "Sending %{public}@ to %{public}@ failed with error: %{public}s",  (uint8_t *)&v14,  0x20u);
    }
  }
}

- (void)publish:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10003768C;
  v7[3] = &unk_1000656B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
}

@end