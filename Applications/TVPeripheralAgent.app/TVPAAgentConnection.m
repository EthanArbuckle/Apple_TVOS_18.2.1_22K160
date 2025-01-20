@interface TVPAAgentConnection
+ (id)_clientBundleIdentifierFromConnection:(id)a3;
- (NSString)clientBundleIdentifier;
- (NSXPCConnection)remoteConnection;
- (TVPAAgentConnection)init;
- (TVPAAgentConnection)initWithConnection:(id)a3;
- (void)beginSuppressingPeripheralHUDWithOptions:(unint64_t)a3;
- (void)endSuppressingPeripheralHUDWithOptions:(unint64_t)a3;
- (void)resume;
- (void)setRemoteConnection:(id)a3;
- (void)shouldConnectToAudioDeviceWithCompletionHandler:(id)a3;
@end

@implementation TVPAAgentConnection

- (TVPAAgentConnection)initWithConnection:(id)a3
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0LL;
  v10.receiver = v3;
  v10.super_class = (Class)&OBJC_CLASS___TVPAAgentConnection;
  v12 = -[TVPAAgentConnection init](&v10, "init");
  objc_storeStrong((id *)&v12, v12);
  if (v12)
  {
    objc_storeStrong((id *)&v12->_remoteConnection, location[0]);
    v9 =  +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TVPSServerInterface);
    [location[0] setExportedInterface:v9];
    [location[0] setExportedObject:v12];
    v4 = (void *)objc_opt_class(v12);
    v5 = (NSString *)[v4 _clientBundleIdentifierFromConnection:v12->_remoteConnection];
    clientBundleIdentifier = v12->_clientBundleIdentifier;
    v12->_clientBundleIdentifier = v5;

    objc_storeStrong((id *)&v9, 0LL);
  }

  v8 = v12;
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  return v8;
}

- (TVPAAgentConnection)init
{
  v3 = self;
  -[TVPAAgentConnection doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  objc_storeStrong((id *)&v3, 0LL);
  return 0LL;
}

- (void)resume
{
  v2 = -[TVPAAgentConnection remoteConnection](self, "remoteConnection");
  -[NSXPCConnection resume](v2, "resume");
}

- (void)shouldConnectToAudioDeviceWithCompletionHandler:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (location[0])
  {
    v3 = (void (**)(id, unint64_t, void))location[0];
    v4 = +[TVPeripheralAgentService sharedInstance](&OBJC_CLASS___TVPeripheralAgentService, "sharedInstance");
    v3[2](v3, -[TVPeripheralAgentService shouldConnectToAudioDevice](v4, "shouldConnectToAudioDevice"), 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (void)beginSuppressingPeripheralHUDWithOptions:(unint64_t)a3
{
  v21 = self;
  SEL v20 = a2;
  v19 = (void *)a3;
  v8 = -[TVPAAgentConnection remoteConnection](self, "remoteConnection");
  id v18 =  -[NSXPCConnection valueForEntitlement:]( v8,  "valueForEntitlement:",  @"com.apple.tvperipheralagent.suppress-remote-connectivity-hud");

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v18, v3) & 1) != 0 && ([v18 BOOLValue])
  {
    queue = &_dispatch_main_q;
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_100008128;
    v16 = &unk_1000386C8;
    v17[1] = v19;
    v17[0] = v21;
    dispatch_async(queue, &v12);

    objc_storeStrong(v17, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_1000081B4();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v5 = type;
      v6 = -[TVPAAgentConnection clientBundleIdentifier](v21, "clientBundleIdentifier");
      v9 = v6;
      sub_10000822C((uint64_t)v22, (uint64_t)v9);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v5,  "beginSuppressingPeripheralHUDWithOptions: request by %{public}@ failed - not entitled.",  v22,  0xCu);

      objc_storeStrong((id *)&v9, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v18, 0LL);
}

- (void)endSuppressingPeripheralHUDWithOptions:(unint64_t)a3
{
  v21 = self;
  SEL v20 = a2;
  v19 = (void *)a3;
  v8 = -[TVPAAgentConnection remoteConnection](self, "remoteConnection");
  id v18 =  -[NSXPCConnection valueForEntitlement:]( v8,  "valueForEntitlement:",  @"com.apple.tvperipheralagent.suppress-remote-connectivity-hud");

  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v18, v3) & 1) != 0 && ([v18 BOOLValue])
  {
    queue = &_dispatch_main_q;
    v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = sub_1000084A4;
    v16 = &unk_1000386C8;
    v17[1] = v19;
    v17[0] = v21;
    dispatch_async(queue, &v12);

    objc_storeStrong(v17, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)sub_1000081B4();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v5 = type;
      v6 = -[TVPAAgentConnection clientBundleIdentifier](v21, "clientBundleIdentifier");
      v9 = v6;
      sub_10000822C((uint64_t)v22, (uint64_t)v9);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v5,  "endSuppressingPeripheralHUDWithOptions: request by %{public}@ failed - not entitled.",  v22,  0xCu);

      objc_storeStrong((id *)&v9, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v18, 0LL);
}

+ (id)_clientBundleIdentifierFromConnection:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  if (location[0])
  {
    [location[0] auditToken];
  }

  else
  {
    __int128 v9 = 0u;
    __int128 v10 = 0u;
  }

  id v8 = 0LL;
  v7[0] = v9;
  v7[1] = v10;
  if (CPCopyBundleIdentifierAndTeamFromAuditToken(v7, &v8, 0LL))
  {
    id location[3] = v8;
    id v3 = v8;
    id v4 = v11;
    id v11 = v3;
  }

  id v6 = v11;
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v6;
}

- (NSXPCConnection)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end