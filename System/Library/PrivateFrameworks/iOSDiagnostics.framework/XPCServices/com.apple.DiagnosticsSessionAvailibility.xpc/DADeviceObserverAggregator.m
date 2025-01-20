@interface DADeviceObserverAggregator
+ (id)aggregatorWithObserverClasses:(id)a3;
+ (id)defaultObserverClasses;
- (DADeviceObserverAggregator)init;
- (DADeviceObserverAggregator)initWithObserverClasses:(id)a3;
- (NSArray)observers;
- (NSMutableDictionary)handlers;
- (NSOperationQueue)discoveryQueue;
- (id)allDevices;
- (id)beginDiscoveringDevicesWithHandler:(id)a3;
- (void)_beginObserving;
- (void)_endObserving;
- (void)discoverAllDevicesWithCompletionHandler:(id)a3;
- (void)endDiscoveringDevicesWithIdentifier:(id)a3;
- (void)observerDidChangeDevices:(id)a3;
- (void)setDiscoveryQueue:(id)a3;
- (void)setHandlers:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation DADeviceObserverAggregator

+ (id)aggregatorWithObserverClasses:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithObserverClasses:v4];

  return v5;
}

+ (id)defaultObserverClasses
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___DADeviceObserverLocal),  0LL);
}

- (DADeviceObserverAggregator)init
{
  id v3 = [(id)objc_opt_class(self) defaultObserverClasses];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = -[DADeviceObserverAggregator initWithObserverClasses:](self, "initWithObserverClasses:", v4);

  return v5;
}

- (DADeviceObserverAggregator)initWithObserverClasses:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___DADeviceObserverAggregator;
  id v5 = -[DADeviceObserverAggregator init](&v26, "init");
  if (v5)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    discoveryQueue = v5->_discoveryQueue;
    v5->_discoveryQueue = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v4 count]));
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v9 = v4;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = (void *)objc_opt_new(*(void *)(*((void *)&v22 + 1) + 8LL * (void)v13));
          v15 = objc_alloc(&OBJC_CLASS___DADeviceObserverEnclosure);
          v16 = -[DADeviceObserverEnclosure initWithObserver:delegate:]( v15,  "initWithObserver:delegate:",  v14,  v5,  (void)v22);
          [v8 addObject:v16];

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }

      while (v11);
    }

    v17 = (NSArray *)[v8 copy];
    observers = v5->_observers;
    v5->_observers = v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    handlers = v5->_handlers;
    v5->_handlers = (NSMutableDictionary *)v19;
  }

  return v5;
}

- (id)allDevices
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator observers](self, "observers", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v11 + 1) + 8 * (void)v8) devices]);
        [v3 unionSet:v9];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v6);
  }

  return v3;
}

- (id)beginDiscoveringDevicesWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  objc_sync_enter(v6);
  id v7 = [v4 copy];
  id v8 = objc_retainBlock(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  [v9 setObject:v8 forKeyedSubscript:v5];

  objc_sync_exit(v6);
  -[DADeviceObserverAggregator _beginObserving](self, "_beginObserving");

  return v5;
}

- (void)endDiscoveringDevicesWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  [v5 removeObjectForKey:v4];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  id v7 = [v6 count];

  if (!v7) {
    -[DADeviceObserverAggregator _endObserving](self, "_endObserving");
  }
}

- (void)discoverAllDevicesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000061D0;
  v8[3] = &unk_10000C688;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)observerDidChangeDevices:(id)a3
{
  uint64_t v4 = DiagnosticLogHandleForCategory(1LL);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
    *(_DWORD *)buf = 138412290;
    id v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handlers: %@", buf, 0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator handlers](self, "handlers"));
  id v8 = [v7 copy];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v10)
  {
    id v12 = v10;
    uint64_t v13 = *(void *)v22;
    *(void *)&__int128 v11 = 138412546LL;
    __int128 v20 = v11;
    do
    {
      __int128 v14 = 0LL;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "objectForKeyedSubscript:",  *(void *)(*((void *)&v21 + 1) + 8 * (void)v14),  v20,  (void)v21));
        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator allDevices](self, "allDevices"));
          uint64_t v17 = DiagnosticLogHandleForCategory(1LL);
          v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = objc_retainBlock(v15);
            *(_DWORD *)buf = v20;
            id v26 = v19;
            __int16 v27 = 2112;
            v28 = v16;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Calling handler: %@ with devices: %@",  buf,  0x16u);
          }

          ((void (**)(void, void *))v15)[2](v15, v16);
        }

        __int128 v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v12 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }

    while (v12);
  }
}

- (void)_beginObserving
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator observers](self, "observers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) begin];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (void)_endObserving
{
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverAggregator observers](self, "observers", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) end];
        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }

    while (v4);
  }
}

- (NSOperationQueue)discoveryQueue
{
  return self->_discoveryQueue;
}

- (void)setDiscoveryQueue:(id)a3
{
}

- (NSArray)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (NSMutableDictionary)handlers
{
  return self->_handlers;
}

- (void)setHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end