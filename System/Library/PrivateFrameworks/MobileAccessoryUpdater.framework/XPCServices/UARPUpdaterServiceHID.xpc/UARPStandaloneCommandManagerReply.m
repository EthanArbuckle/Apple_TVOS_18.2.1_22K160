@interface UARPStandaloneCommandManagerReply
- (UARPStandaloneCommandManagerReply)initWithRemoteServiceEndpoint:(id)a3;
- (id)remoteObject;
- (id)xpcConnectionToRequestor;
- (void)dealloc;
@end

@implementation UARPStandaloneCommandManagerReply

- (UARPStandaloneCommandManagerReply)initWithRemoteServiceEndpoint:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___UARPStandaloneCommandManagerReply;
  v6 = -[UARPStandaloneCommandManagerReply init](&v12, "init");
  v7 = v6;
  if (v6
    && (objc_storeStrong((id *)&v6->_remoteEndpoint, a3),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(-[UARPStandaloneCommandManagerReply xpcConnectionToRequestor](v7, "xpcConnectionToRequestor")),
        xpcConnection = v7->_xpcConnection,
        v7->_xpcConnection = (NSXPCConnection *)v8,
        xpcConnection,
        !v7->_xpcConnection))
  {
    v10 = 0LL;
  }

  else
  {
    v10 = v7;
  }

  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPStandaloneCommandManagerReply;
  -[UARPStandaloneCommandManagerReply dealloc](&v3, "dealloc");
}

- (id)remoteObject
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( xpcConnection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_100028900));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v13 = 136315394;
      v14 = "-[UARPStandaloneCommandManagerReply remoteObject]";
      __int16 v15 = 2112;
      v16 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_INFO,  "%s: remoteObject: %@",  (uint8_t *)&v13,  0x16u);
    }
  }

  else
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_10001CF74(v4, v5, v6, v7, v8, v9, v10, v11);
    }
    objc_super v3 = 0LL;
  }

  return v3;
}

- (id)xpcConnectionToRequestor
{
  v2 = -[NSXPCConnection initWithListenerEndpoint:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithListenerEndpoint:",  self->_remoteEndpoint);
  if (v2)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___UARPStandaloneCommandRequestor));
    -[NSXPCConnection setRemoteObjectInterface:](v2, "setRemoteObjectInterface:", v3);
    uint64_t v4 = objc_opt_class(&OBJC_CLASS___UARPStandaloneCommandReplyRecord);
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray);
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSURL);
    uint64_t v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v2, "remoteObjectInterface"));
    [v9 setClasses:v8 forSelector:"dynamicAssetSolicitationComplete:modelNumber:" argumentIndex:0 ofReply:0];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection remoteObjectInterface](v2, "remoteObjectInterface"));
    [v10 setClasses:v8 forSelector:"dynamicAssetSolicitationComplete:" argumentIndex:0 ofReply:0];

    -[NSXPCConnection resume](v2, "resume");
    uint64_t v11 = v2;
  }

  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_10001D074(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  return v2;
}

- (void).cxx_destruct
{
}

@end