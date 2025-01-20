@interface DACService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableSet)clients;
- (NSString)entitlement;
- (NSString)resetNotificationName;
- (NSString)serviceName;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (id)_clientForConnection:(id)a3;
- (id)_createClientForConnection:(id)a3;
- (id)_currentClient;
- (id)_initWithServiceName:(id)a3 entitlement:(id)a4 resetNotificationName:(id)a5;
- (void)_addClientForConnection:(id)a3;
- (void)_configureHandlersOnConnection:(id)a3;
- (void)_configureServiceInterfacesOnConnection:(id)a3;
- (void)_lostClient:(id)a3;
- (void)_serviceReady;
@end

@implementation DACService

- (id)_initWithServiceName:(id)a3 entitlement:(id)a4 resetNotificationName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___DACService;
  v12 = -[DACService init](&v27, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeStrong((id *)&v13->_entitlement, a4);
    objc_storeStrong((id *)&v13->_resetNotificationName, a5);
    v14 = -[NSString UTF8String](v13->_serviceName, "UTF8String");
    dispatch_queue_attr_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v15);
    dispatch_queue_t v17 = dispatch_queue_create(v14, v16);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v17;

    v19 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  v13->_serviceName);
    listener = v13->_listener;
    v13->_listener = v19;

    -[NSXPCListener _setQueue:](v13->_listener, "_setQueue:", v13->_queue);
    -[NSXPCListener setDelegate:](v13->_listener, "setDelegate:", v13);
    v21 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = v13->_clients;
    v13->_clients = v21;

    id v23 = sub_100014610(4);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      serviceName = v13->_serviceName;
      *(_DWORD *)buf = 134218242;
      v29 = v13;
      __int16 v30 = 2114;
      v31 = serviceName;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%p new service for %{public}@", buf, 0x16u);
    }
  }

  return v13;
}

- (void)_serviceReady
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DACService listener](self, "listener"));
  [v4 resume];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DACService resetNotificationName](self, "resetNotificationName"));
  if (v5)
  {
    id v6 = objc_claimAutoreleasedReturnValue(-[DACService resetNotificationName](self, "resetNotificationName"));
    notify_post((const char *)[v6 UTF8String]);
  }

  id v7 = sub_100014610(4);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 134217984;
    id v10 = self;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%p service ready", (uint8_t *)&v9, 0xCu);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACService entitlement](self, "entitlement"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:v6]);
  unsigned __int8 v8 = [v7 BOOLValue];

  if ((v8 & 1) != 0)
  {
    -[DACService _configureServiceInterfacesOnConnection:](self, "_configureServiceInterfacesOnConnection:", v5);
    -[DACService _configureHandlersOnConnection:](self, "_configureHandlersOnConnection:", v5);
    -[DACService _addClientForConnection:](self, "_addClientForConnection:", v5);
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
    [v5 _setQueue:v9];

    [v5 resume];
  }

  else
  {
    id v10 = sub_100014610(4);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 134218242;
      v14 = self;
      __int16 v15 = 2114;
      id v16 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%p rejecting unentitled connection %{public}@",  (uint8_t *)&v13,  0x16u);
    }
  }

  return v8;
}

- (void)_configureHandlersOnConnection:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  id v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472LL;
  int v9 = sub_1000058DC;
  id v10 = &unk_10001C540;
  objc_copyWeak(&v11, &location);
  objc_copyWeak(&v12, &from);
  id v6 = objc_retainBlock(&v7);
  objc_msgSend(v4, "setInterruptionHandler:", v6, v7, v8, v9, v10);
  [v4 setInvalidationHandler:v6];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

- (void)_configureServiceInterfacesOnConnection:(id)a3
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue", a3));
  dispatch_assert_queue_V2(v3);
}

- (id)_createClientForConnection:(id)a3
{
  id v3 = a3;
  id v4 = -[DACServiceClient initWithConnection:](objc_alloc(&OBJC_CLASS___DACServiceClient), "initWithConnection:", v3);

  return v4;
}

- (void)_addClientForConnection:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACService _createClientForConnection:](self, "_createClientForConnection:", v4));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
  [v7 addObject:v6];

  id v8 = sub_100014610(4);
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
    int v11 = 134218498;
    id v12 = self;
    __int16 v13 = 2048;
    id v14 = [v10 count];
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%p client connected, now(%lu) client(%{public}@)",  (uint8_t *)&v11,  0x20u);
  }
}

- (void)_lostClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
  [v6 removeObject:v4];

  id v7 = sub_100014610(4);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients"));
    int v10 = 134218498;
    int v11 = self;
    __int16 v12 = 2048;
    id v13 = [v9 count];
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%p lost client, now(%lu) client(%{public}@)",  (uint8_t *)&v10,  0x20u);
  }
}

- (id)_clientForConnection:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[DACService clients](self, "clients", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        int v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 connection]);
        unsigned int v12 = [v4 isEqual:v11];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)_currentClient
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[DACService queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[DACService _clientForConnection:](self, "_clientForConnection:", v4));

  return v5;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)entitlement
{
  return self->_entitlement;
}

- (NSString)resetNotificationName
{
  return self->_resetNotificationName;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void).cxx_destruct
{
}

@end