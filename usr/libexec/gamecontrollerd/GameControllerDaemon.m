@interface GameControllerDaemon
+ (id)sharedInstance;
+ (void)run;
- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4;
- (BOOL)acceptNewConnection:(id)a3 fromHIDServer:(id)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (GameControllerDaemon)init;
- (id)_init;
- (id)clientForConnection:(id)a3;
- (id)serviceFor:(id)a3 client:(id)a4;
- (void)_start;
- (void)client:(id)a3 connectionsDidChange:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)refreshClientTransaction;
- (void)registerAgentConnection:(id)a3;
- (void)unregisterAgentConnection:(id)a3;
@end

@implementation GameControllerDaemon

+ (void)run
{
  v2 = _os_activity_create( (void *)&_mh_execute_header,  "Daemon Start",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v2, &v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GameControllerDaemon sharedInstance](&OBJC_CLASS___GameControllerDaemon, "sharedInstance"));
  [v3 _start];

  os_activity_scope_leave(&v4);
}

+ (id)sharedInstance
{
  if (qword_100011FD8 != -1) {
    dispatch_once(&qword_100011FD8, &stru_10000C5E8);
  }
  return (id)qword_100011FD0;
}

- (id)_init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___GameControllerDaemon;
  v2 = -[GameControllerDaemon init](&v24, "init");
  v3 = v2;
  if (v2)
  {
    GCLookupSetFallbackProvider(v2);
    os_activity_scope_state_s v4 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.GameController.gamecontrollerd.app");
    appServiceListener = v3->_appServiceListener;
    v3->_appServiceListener = v4;

    -[NSXPCListener setDelegate:](v3->_appServiceListener, "setDelegate:", v3);
    v6 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.GameController.gamecontrollerd.driver");
    driverServiceListener = v3->_driverServiceListener;
    v3->_driverServiceListener = v6;

    -[NSXPCListener setDelegate:](v3->_driverServiceListener, "setDelegate:", v3);
    v8 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.GameController.gamecontrollerd.haptics");
    hapticServiceListener = v3->_hapticServiceListener;
    v3->_hapticServiceListener = v8;

    -[NSXPCListener setDelegate:](v3->_hapticServiceListener, "setDelegate:", v3);
    v10 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.GameController.gamecontrollerd.agent");
    agentServiceListener = v3->_agentServiceListener;
    v3->_agentServiceListener = v10;

    -[NSXPCListener setDelegate:](v3->_agentServiceListener, "setDelegate:", v3);
    v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    agentRegistrations = v3->_agentRegistrations;
    v3->_agentRegistrations = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clients = v3->_clients;
    v3->_clients = v14;

    v16 = objc_opt_new(&OBJC_CLASS___GameControllerDaemonAnalytics);
    analytics = v3->_analytics;
    v3->_analytics = v16;

    v18 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.GameController");
    v19 = v18;
    if (!v18) {
      v19 = (NSUserDefaults *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults"));
    }
    objc_storeStrong((id *)&v3->_defaults, v19);
    if (!v18) {

    }
    v20 = -[GCSSettingsStore initWithUserDefaults:]( objc_alloc(&OBJC_CLASS___GCSSettingsStore),  "initWithUserDefaults:",  v3->_defaults);
    settingsStore = v3->_settingsStore;
    v3->_settingsStore = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue( +[_GCControllerManagerServer sharedInstance]( &OBJC_CLASS____GCControllerManagerServer,  "sharedInstance"));
    [v22 addObserver:v3 forKeyPath:@"activeControllerDevices" options:5 context:off_100011E40];

    xpc_set_event_stream_handler("com.apple.iokit.match.gamecontroller", 0LL, &stru_10000C628);
  }

  return v3;
}

- (GameControllerDaemon)init
{
  return 0LL;
}

- (void)_start
{
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[_GCControllerManagerServer sharedInstance]( &OBJC_CLASS____GCControllerManagerServer,  "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"activeControllerDevices"];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___GameControllerDaemon;
  -[GameControllerDaemon dealloc](&v4, "dealloc");
}

- (id)serviceFor:(id)a3 client:(id)a4
{
  v6 = (__objc2_prot *)a3;
  id v7 = a4;
  if (&OBJC_PROTOCOL___GCAnalytics == v6)
  {
    uint64_t v10 = 64LL;
LABEL_8:
    id v9 = *(id *)&self->GCDaemon_opaque[v10];
    goto LABEL_9;
  }

  if (&OBJC_PROTOCOL___GCUserDefaults == v6)
  {
    uint64_t v10 = 72LL;
    goto LABEL_8;
  }

  if (&OBJC_PROTOCOL___GCSSettingsStoreService == v6)
  {
    uint64_t v10 = 80LL;
    goto LABEL_8;
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___GameControllerDaemon;
  id v8 = -[GameControllerDaemon serviceFor:client:](&v13, "serviceFor:client:", v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue(v8);
LABEL_9:
  v11 = v9;

  return v11;
}

- (id)clientForConnection:(id)a3
{
  id v4 = a3;
  v5 = self->_clients;
  objc_sync_enter(v5);
  id v6 = [[_GCIPCRemoteProcess alloc] initWithConnection:v4];
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet member:](self->_clients, "member:", v6));

  if (!v7)
  {
    id v7 = [[_GCIPCRemoteProcess alloc] initWithConnection:v4];
    -[NSMutableSet addObject:](self->_clients, "addObject:", v7);
    [v7 addObserver:self forKeyPath:@"connections" options:1 context:0];
    -[GameControllerDaemon refreshClientTransaction](self, "refreshClientTransaction");
    if (sub_1000065FC())
    {
      id v9 = sub_100006820();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Added client: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  objc_sync_exit(v5);

  return v7;
}

- (void)refreshClientTransaction
{
  v3 = self->_clients;
  objc_sync_enter(v3);
  if (sub_1000065FC())
  {
    id v6 = sub_100006820();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = (OS_os_transaction *)-[NSMutableSet count](self->_clients, "count");
      unint64_t activeDevicesCount = self->_activeDevicesCount;
      int v13 = 134218240;
      v14 = v8;
      __int16 v15 = 2048;
      unint64_t v16 = activeDevicesCount;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "refreshClientTransaction - %lu clients and %lu active devices",  (uint8_t *)&v13,  0x16u);
    }
  }

  if (-[NSMutableSet count](self->_clients, "count") && self->_activeDevicesCount)
  {
    if (self->_clientTransaction) {
      goto LABEL_8;
    }
    id v4 = (OS_os_transaction *)os_transaction_create("gamecontrollerd has a client and a game controller device is active");
    clientTransaction = self->_clientTransaction;
    self->_clientTransaction = v4;
  }

  else
  {
    clientTransaction = self->_clientTransaction;
    self->_clientTransaction = 0LL;
  }

LABEL_8:
  if (sub_1000065FC())
  {
    id v10 = sub_100006820();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = self->_clientTransaction;
      int v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "client transaction = %@", (uint8_t *)&v13, 0xCu);
    }
  }

  objc_sync_exit(v3);
}

- (void)client:(id)a3 connectionsDidChange:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_clients;
  objc_sync_enter(v8);
  if (![v7 count])
  {
    [v6 removeObserver:self forKeyPath:@"connections" context:0];
    -[NSMutableSet removeObject:](self->_clients, "removeObject:", v6);
    if (sub_1000065FC())
    {
      id v9 = sub_100006820();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        id v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removed client: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  -[GameControllerDaemon refreshClientTransaction](self, "refreshClientTransaction");
  objc_sync_exit(v8);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create( (void *)&_mh_execute_header,  "Incoming Connection",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v6, &v21);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[GameControllerDaemon clientForConnection:](self, "clientForConnection:", v5));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  unsigned int v9 = [v8 isEqualToString:@"com.apple.GameController.gamecontrollerd.app"];

  if (v9)
  {
    unsigned __int8 v10 = -[GameControllerDaemon acceptNewConnection:fromGCEnabledApp:]( self,  "acceptNewConnection:fromGCEnabledApp:",  v5,  v7);
LABEL_5:
    unsigned __int8 v13 = v10;
    goto LABEL_6;
  }

  int v11 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  unsigned int v12 = [v11 isEqualToString:@"com.apple.GameController.gamecontrollerd.driver"];

  if (v12)
  {
    unsigned __int8 v10 = -[GameControllerDaemon acceptNewConnection:fromHIDServer:](self, "acceptNewConnection:fromHIDServer:", v5, v7);
    goto LABEL_5;
  }

  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
  unsigned int v16 = [v15 isEqualToString:@"com.apple.GameController.gamecontrollerd.haptics"];

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[_GCHapticServerManager sharedInstance](&OBJC_CLASS____GCHapticServerManager, "sharedInstance"));
    unsigned __int8 v13 = [v17 acceptNewConnection:v5 fromHapticsEnabledApp:v7];
  }

  else
  {
    if (sub_1000065FC())
    {
      id v18 = sub_100006820();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
        *(_DWORD *)buf = 138412546;
        id v23 = v5;
        __int16 v24 = 2112;
        v25 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Rejecting connection '%@' for unknown mach service '%@'",  buf,  0x16u);
      }
    }

    unsigned __int8 v13 = 0;
  }

- (BOOL)acceptNewConnection:(id)a3 fromHIDServer:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sub_1000065FC())
  {
    id v11 = sub_100006820();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Accepting driver connection '%@' to mach service '%@'",  (uint8_t *)&v14,  0x16u);
    }
  }

  id v7 = [[_GCDriverClientConnection alloc] initWithConnection:v5 fromProcess:v6];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_GCControllerManagerServer sharedInstance]( &OBJC_CLASS____GCControllerManagerServer,  "sharedInstance"));
  unsigned __int8 v9 = [v8 acceptIncomingDriverConnection:v7];

  return v9;
}

- (BOOL)acceptNewConnection:(id)a3 fromGCEnabledApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (sub_1000065FC())
  {
    id v11 = sub_100006820();
    unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 serviceName]);
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2112;
      v17 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Accepting app connection '%@' to mach service '%@'",  (uint8_t *)&v14,  0x16u);
    }
  }

  id v7 = [[_GCAppClientConnection alloc] initWithConnection:v5 fromProcess:v6];
  [v6 addConnection:v7];

  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[_GCControllerManagerServer sharedInstance]( &OBJC_CLASS____GCControllerManagerServer,  "sharedInstance"));
  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue( +[_GCAppClientProxy clientProxyWithConnection:server:]( &OBJC_CLASS____GCAppClientProxy,  "clientProxyWithConnection:server:",  v7,  v8));

  [v7 setServer:v9];
  [v7 resume];

  return 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_100011E40 == a6)
  {
    if ([v10 isEqualToString:@"activeControllerDevices"])
    {
      int v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSKeyValueChangeNewKey]);
      self->_unint64_t activeDevicesCount = (unint64_t)[v14 count];
      -[GameControllerDaemon refreshClientTransaction](self, "refreshClientTransaction");
      goto LABEL_7;
    }

- (void)registerAgentConnection:(id)a3
{
  id v7 = a3;
  id v4 = self->_agentRegistrations;
  objc_sync_enter(v4);
  agentRegistrations = self->_agentRegistrations;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v7 userIdentifier]));
  -[NSMutableDictionary setObject:forKey:](agentRegistrations, "setObject:forKey:", v7, v6);

  objc_sync_exit(v4);
}

- (void)unregisterAgentConnection:(id)a3
{
  id v7 = a3;
  id v4 = self->_agentRegistrations;
  objc_sync_enter(v4);
  agentRegistrations = self->_agentRegistrations;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v7 userIdentifier]));
  -[NSMutableDictionary removeObjectForKey:](agentRegistrations, "removeObjectForKey:", v6);

  [v7 invalidate];
  objc_sync_exit(v4);
}

- (void).cxx_destruct
{
}

@end