@interface RTEventAgent
- (NSMutableDictionary)clients;
- (NSXPCConnection)connection;
- (RTEventAgent)init;
- (void)createConnection;
- (void)dealloc;
- (void)launchDaemonWithRestorationIdentifier:(id)a3 reply:(id)a4;
- (void)logClients;
- (void)onEventCallback:(int64_t)a3 token:(unint64_t)a4 event:(id)a5;
- (void)provider;
- (void)setClients:(id)a3;
- (void)setConnection:(id)a3;
- (void)setProvider:(void *)a3;
@end

@implementation RTEventAgent

- (RTEventAgent)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RTEventAgent;
  if (-[RTEventAgent init](&v3, "init"))
  {
    [@"com.apple.routined-events" UTF8String];
    xpc_event_provider_create();
  }

  return 0LL;
}

- (void)createConnection
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent connection](self, "connection"));
  [v3 invalidate];

  v4 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  v5 = -[NSXPCConnection initWithMachServiceName:options:]( v4,  "initWithMachServiceName:options:",  RTMachServiceEvent,  4096LL);
  -[RTEventAgent setConnection:](self, "setConnection:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RTEventAgentPluginProtocol));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent connection](self, "connection"));
  [v7 setExportedInterface:v6];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent connection](self, "connection"));
  [v8 setExportedObject:self];

  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RTEventAgentDaemonProtocol));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent connection](self, "connection"));
  [v10 setRemoteObjectInterface:v9];

  objc_claimAutoreleasedReturnValue(-[RTEventAgent connection](self, "connection"));
  -[RTEventAgent provider](self, "provider");
  xpc_event_provider_get_queue();
}

- (void)dealloc
{
  provider = self->_provider;
  if (provider)
  {
    free(provider);
    self->_provider = 0LL;
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___RTEventAgent;
  -[RTEventAgent dealloc](&v5, "dealloc");
}

- (void)onEventCallback:(int64_t)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  v9 = v8;
  if (a3 == 1)
  {
    if (v8
      && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_dictionary
      && (xpc_object_t v12 = xpc_dictionary_get_value(v9, "RestorationIdentifier"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12),
          v13,
          v13))
    {
      xpc_object_t value = xpc_dictionary_get_value(v9, "RestorationIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue(value);
      v16 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_string_get_string_ptr(v15));
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

      id v17 = sub_3180(&qword_4A78);
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        int v22 = 138412290;
        v23 = v11;
        _os_log_debug_impl( &dword_0,  v18,  OS_LOG_TYPE_DEBUG,  "client with restoration identifier, %@, registering for launch on demand",  (uint8_t *)&v22,  0xCu);
      }

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent clients](self, "clients"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a4));
      [v19 setObject:v20 forKey:v11];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent clients](self, "clients"));
        [v21 enumerateKeysAndObjectsUsingBlock:&stru_4178];
      }
    }

    else
    {
      id v10 = sub_3180(&qword_4A78);
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v22) = 0;
        _os_log_debug_impl( &dword_0,  v11,  OS_LOG_TYPE_DEBUG,  "received an unknown event from daemon",  (uint8_t *)&v22,  2u);
      }
    }
  }
}

- (void)launchDaemonWithRestorationIdentifier:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[RTEventAgent clients](self, "clients"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:v6]);

    if (v9)
    {
      -[RTEventAgent provider](self, "provider");
      [v9 unsignedLongLongValue];
      xpc_event_provider_token_fire();
    }

    id v12 = sub_3180(&qword_4A78);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_debug_impl( &dword_0,  v13,  OS_LOG_TYPE_DEBUG,  "no token for restoration identifier, %@",  (uint8_t *)&v14,  0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }

  else
  {
    id v10 = sub_3180(&qword_4A78);
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      id v15 = 0LL;
      _os_log_debug_impl(&dword_0, v11, OS_LOG_TYPE_DEBUG, "invalid restoration identifier, %@", (uint8_t *)&v14, 0xCu);
    }

    if (v7) {
      v7[2](v7, 0LL);
    }
  }
}

- (void)logClients
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    id v3 = (id)objc_claimAutoreleasedReturnValue(-[RTEventAgent clients](self, "clients"));
    [v3 enumerateKeysAndObjectsUsingBlock:&stru_4198];
  }

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void)provider
{
  return self->_provider;
}

- (void)setProvider:(void *)a3
{
  self->_provider = a3;
}

- (NSMutableDictionary)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
}

@end