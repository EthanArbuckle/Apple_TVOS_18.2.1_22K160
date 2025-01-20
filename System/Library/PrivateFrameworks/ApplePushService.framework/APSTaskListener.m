@interface APSTaskListener
- (APSTaskListener)initWithQueue:(id)a3 apsDaemon:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)activeServers;
- (NSXPCInterface)interface;
- (NSXPCListener)taskListener;
- (OS_dispatch_queue)queue;
- (void)_cleanupConnection:(id)a3;
- (void)dealloc;
@end

@implementation APSTaskListener

- (APSTaskListener)initWithQueue:(id)a3 apsDaemon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___APSTaskListener;
  v9 = -[APSTaskListener init](&v20, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    activeServers = v9->_activeServers;
    v9->_activeServers = v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v9->_daemon, a4);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Starting APSTaskListener service", v19, 2u);
    }

    v13 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v14 = -[NSXPCListener initWithMachServiceName:](v13, "initWithMachServiceName:", kAPSTaskClientServiceName);
    taskListener = v9->_taskListener;
    v9->_taskListener = v14;

    -[NSXPCListener setDelegate:](v9->_taskListener, "setDelegate:", v9);
    -[NSXPCListener _setQueue:](v9->_taskListener, "_setQueue:", v9->_queue);
    uint64_t v16 = objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___APSTaskManagerInterface));
    interface = v9->_interface;
    v9->_interface = (NSXPCInterface *)v16;

    -[NSXPCListener resume](v9->_taskListener, "resume");
  }

  return v9;
}

- (void)dealloc
{
  interface = self->_interface;
  self->_interface = 0LL;

  activeServers = self->_activeServers;
  self->_activeServers = 0LL;

  daemon = self->_daemon;
  self->_daemon = 0LL;

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___APSTaskListener;
  -[APSTaskListener dealloc](&v6, "dealloc");
}

- (void)_cleanupConnection:(id)a3
{
  id v4 = a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = self->_activeServers;
  id v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        id v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "connection", (void)v12));

        if (v11 == v4)
        {
          -[NSMutableArray removeObject:](self->_activeServers, "removeObject:", v10);
          goto LABEL_11;
        }
      }

      id v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v5,  "countByEnumeratingWithState:objects:count:",  &v12,  v16,  16LL);
      if (v7) {
        continue;
      }
      break;
    }
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 valueForEntitlement:@"com.apple.apsd.nsxpc"]);
  unsigned __int8 v9 = [v8 BOOLValue];

  if ((v9 & 1) != 0)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    v10 = -[APSTaskServer initWithConnection:queue:apsDaemon:]( objc_alloc(&OBJC_CLASS___APSTaskServer),  "initWithConnection:queue:apsDaemon:",  v7,  self->_queue,  self->_daemon);
    -[NSMutableArray addObject:](self->_activeServers, "addObject:", v10);
    [v7 setExportedInterface:self->_interface];
    [v7 _setQueue:self->_queue];
    objc_initWeak(&location, v7);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100067AC4;
    v14[3] = &unk_10011F740;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    [v7 setInvalidationHandler:v14];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100067BA8;
    v12[3] = &unk_10011F740;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    [v7 setInterruptionHandler:v12];
    [v7 setExportedObject:v10];
    [v7 resume];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  else
  {
    v10 = (APSTaskServer *)objc_claimAutoreleasedReturnValue(+[APSLog taskManager](&OBJC_CLASS___APSLog, "taskManager"));
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      sub_1000BF240(v7, (os_log_s *)v10);
    }
  }

  return v9;
}

- (NSXPCListener)taskListener
{
  return self->_taskListener;
}

- (NSXPCInterface)interface
{
  return self->_interface;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableArray)activeServers
{
  return self->_activeServers;
}

- (void).cxx_destruct
{
}

@end