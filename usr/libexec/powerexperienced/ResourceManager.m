@interface ResourceManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)processMonitors;
- (NSMutableDictionary)resourceHints;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)mainQueue;
- (OS_os_transaction)transaction;
- (ResourceManager)init;
- (void)createResourceHint:(id)a3 withReply:(id)a4;
- (void)evaluatePowerModes;
- (void)handleProcessExit:(id)a3;
- (void)monitorProcessExit:(int)a3;
- (void)removeResourceHint:(id)a3;
- (void)removeState:(id)a3;
- (void)restoreResourceHints:(id)a3;
- (void)restoreState;
- (void)saveState:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setProcessMonitors:(id)a3;
- (void)setResourceHints:(id)a3;
- (void)setTransaction:(id)a3;
- (void)start;
- (void)updateResourceHint:(id)a3 withReply:(id)a4;
@end

@implementation ResourceManager

- (void)restoreResourceHints:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100006BF8;
  v7[3] = &unk_100014510;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)createResourceHint:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v9 = (void *)os_transaction_create("com.apple.powerexperienced.resourcehint");
  -[ResourceManager setTransaction:](self, "setTransaction:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v6 setUuid:v10];
  v7[2](v7, v10);

  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100006F7C;
  v15[3] = &unk_100014538;
  id v16 = v8;
  id v17 = v6;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v6;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)updateResourceHint:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000724C;
  v13[3] = &unk_100014560;
  v13[4] = self;
  id v14 = v6;
  id v15 = v8;
  id v16 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (void)removeResourceHint:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEBUG)) {
    sub_10000D4C0((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
  [v12 removeObjectForKey:v4];

  -[ResourceManager evaluatePowerModes](self, "evaluatePowerModes");
  -[ResourceManager removeState:](self, "removeState:", v4);
}

- (void)monitorProcessExit:(int)a3
{
  v5 = -[NSNumber initWithInt:](objc_alloc(&OBJC_CLASS___NSNumber), "initWithInt:", *(void *)&a3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager processMonitors](self, "processMonitors"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v5]);

  if (!v7)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
    uint64_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, a3, 0x80000000uLL, v8);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100007748;
    v11[3] = &unk_100014588;
    v11[4] = self;
    int v12 = a3;
    dispatch_source_set_event_handler(v9, v11);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager processMonitors](self, "processMonitors"));
    [v10 setObject:v9 forKeyedSubscript:v5];

    dispatch_resume(v9);
  }
}

- (void)handleProcessExit:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "process %@ exiting. Releasing resouce hints for this process",  buf,  0xCu);
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
  id v8 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    do
    {
      uint64_t v11 = 0LL;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:v12]);

        id v15 = (id)objc_claimAutoreleasedReturnValue([v14 pid]);
        if (v15 == v4) {
          [v6 addObject:v12];
        }

        uint64_t v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }

    while (v9);
  }

  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v16 = v6;
  id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v17)
  {
    id v19 = v17;
    uint64_t v20 = *(void *)v27;
    *(void *)&__int128 v18 = 138412290LL;
    __int128 v25 = v18;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v16);
        }
        v22 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)v21);
        v23 = (os_log_s *)qword_10001B6F0;
        if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v25;
          id v37 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Removing resource hint %@", buf, 0xCu);
        }

        -[ResourceManager removeResourceHint:](self, "removeResourceHint:", v22, v25, (void)v26);
        v21 = (char *)v21 + 1;
      }

      while (v19 != v21);
      id v19 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }

    while (v19);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager processMonitors](self, "processMonitors"));
  [v24 removeObjectForKey:v4];

  -[ResourceManager evaluatePowerModes](self, "evaluatePowerModes");
}

- (void)saveState:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 uuid]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, @"uuid");

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pid]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v9, @"pid");

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 state]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, @"state");

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v4 resourceType]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v11, @"type");

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:@"resources"]);

  id v14 = (NSMutableDictionary *)[v13 mutableCopy];
  if (!v14) {
    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v4 description]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v6, v15);

  id v16 = (os_log_s *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEBUG)) {
    sub_10000D528((uint64_t)v14, v16, v17, v18, v19, v20, v21, v22);
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  [v23 setValue:v14 forKey:@"resources"];
}

- (void)removeState:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"resources"]);

  id v6 = [v8 mutableCopy];
  [v6 removeObjectForKey:v4];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  [v7 setValue:v6 forKey:@"resources"];
}

- (void)restoreState
{
  v2 = (os_log_s *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "restoring state on init", buf, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager defaults](self, "defaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"resources"]);

  v5 = (os_log_s *)qword_10001B6F0;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int128 v28 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "restoring %@", buf, 0xCu);
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      id v9 = v7;
      uint64_t v10 = *(void *)v23;
      *(void *)&__int128 v8 = 138412290LL;
      __int128 v19 = v8;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
          id v13 = (os_log_s *)qword_10001B6F0;
          if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            __int128 v28 = v12;
            _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "restoring resource with uuid %@",  buf,  0xCu);
          }

          id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v12, v19));
          id v15 = -[ResourceHintWithProperties initWithProperties:]( objc_alloc(&OBJC_CLASS___ResourceHintWithProperties),  "initWithProperties:",  v14);
          if (v15)
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager resourceHints](self, "resourceHints"));
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceHintWithProperties description](v15, "description"));
            [v16 setObject:v15 forKeyedSubscript:v17];
          }
        }

        id v9 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }

      while (v9);
    }
  }

  else if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "no resources to restore", buf, 2u);
  }

  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](self, "mainQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008008;
  block[3] = &unk_1000145B0;
  block[4] = self;
  dispatch_async(v18, block);
}

- (void)evaluatePowerModes
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PowerModesManager sharedInstance](&OBJC_CLASS___PowerModesManager, "sharedInstance"));
  [v2 evaluatePowerModes];
}

- (ResourceManager)init
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___ResourceManager;
  id v2 = -[ResourceManager initWithMachServiceName:]( &v22,  "initWithMachServiceName:",  @"com.apple.powerexperienced.resourceusage");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    xconnection = v2->super._xconnection;
    v2->super._xconnection = v3;

    id v5 = sub_100009834();
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t userQueue = v2->super._userQueue;
    v2->super._dispatch_queue_t userQueue = (dispatch_queue_t)v6;

    os_log_t v8 = os_log_create("com.apple.powerexperienced", "resourcemanager");
    id v9 = (void *)qword_10001B6F0;
    qword_10001B6F0 = (uint64_t)v8;

    uint64_t v10 = (os_log_s *)qword_10001B6F0;
    if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Listening for resource usage connections",  buf,  2u);
    }

    uint64_t v11 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.powerexperienced.resourcemanager");
    id delegate = v2->super._delegate;
    v2->super._id delegate = v11;

    id v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    serviceName = v2->super._serviceName;
    v2->super._serviceName = (NSString *)&v13->super.super.isa;

    id v15 = -[ResourceManager setDelegate:](v2, "setDelegate:", v2);
    uint64_t v17 = (void *)qword_10001B6F0;
    if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = v17;
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[ResourceManager mainQueue](v2, "mainQueue"));
      *(_DWORD *)buf = 138412290;
      __int128 v24 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Initialized ResourceManager with queue %@",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v20 = (os_log_s *)qword_10001B6F0;
    if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_ERROR)) {
      sub_10000D590(v20);
    }
  }

  return v2;
}

+ (id)sharedInstance
{
  if (qword_10001B700 != -1) {
    dispatch_once(&qword_10001B700, &stru_1000145D0);
  }
  return (id)qword_10001B6F8;
}

- (void)start
{
  v3 = (os_log_s *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "starting service", v4, 2u);
  }

  -[ResourceManager activate](self, "activate");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____ResourceManagerProtocol));
  [v5 setExportedInterface:v6];

  id v7 = (void *)qword_10001B6F0;
  if (os_log_type_enabled((os_log_t)qword_10001B6F0, OS_LOG_TYPE_INFO))
  {
    os_log_t v8 = v7;
    v10[0] = 67109120;
    v10[1] = [v5 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "ResourceManager: listener: accepted new connection from pid %d",  (uint8_t *)v10,  8u);
  }

  [v5 setExportedObject:self];
  [v5 resume];

  return 1;
}

- (NSMutableDictionary)resourceHints
{
  return (NSMutableDictionary *)self->super._xconnection;
}

- (void)setResourceHints:(id)a3
{
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setMainQueue:(id)a3
{
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setTransaction:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return (NSUserDefaults *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)processMonitors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setProcessMonitors:(id)a3
{
}

- (void).cxx_destruct
{
}

@end