@interface LAEndpointProviderServer
+ (BOOL)handleConnection:(id)a3;
- (void)provideEndpoint:(int64_t)a3 uid:(unsigned int)a4 reply:(id)a5;
@end

@implementation LAEndpointProviderServer

+ (BOOL)handleConnection:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___LAEndpointProviderServer);
  objc_storeWeak((id *)&v4->_connection, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___LAProtocolEndpointProviderServer));
  [v3 setExportedInterface:v5];

  [v3 setExportedObject:v4];
  [v3 setInvalidationHandler:&stru_100030AE8];

  return 1;
}

- (void)provideEndpoint:(int64_t)a3 uid:(unsigned int)a4 reply:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v7 = (void (**)(id, void))a5;
  if ((unint64_t)a3 >= 4)
  {
    id v9 = sub_1000049C4();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100020E6C(a3, v10);
    }

    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = qword_100030B90[a3];
  }

  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  v20 = sub_100004BD0;
  v21 = sub_100004BE0;
  id v22 = 0LL;
  if (a3)
  {
    v11 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  v8,  0LL);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSXPCConnection _xpcConnection](v11, "_xpcConnection"));
    xpc_connection_set_target_uid(v12, v5);

    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___LAProtocolEndpointProvider));
    -[NSXPCConnection setRemoteObjectInterface:](v11, "setRemoteObjectInterface:", v13);

    -[NSXPCConnection resume](v11, "resume");
    v14 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v11,  "synchronousRemoteObjectProxyWithErrorHandler:",  &stru_100030B28));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100004C38;
    v16[3] = &unk_100030B50;
    v16[4] = &v17;
    [v14 getEndpoint:v16];

    -[NSXPCConnection invalidate](v11, "invalidate");
    uint64_t v15 = v18[5];
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  v7[2](v7, v15);
  _Block_object_dispose(&v17, 8);
}

- (void).cxx_destruct
{
}

@end