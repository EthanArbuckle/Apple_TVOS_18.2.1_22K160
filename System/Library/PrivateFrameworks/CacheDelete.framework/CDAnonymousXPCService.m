@interface CDAnonymousXPCService
- (BOOL)createHeartbeatConnection;
- (BOOL)haveCreatedHeartbeat;
- (CDAnonymousXPCService)initWithInfo:(id)a3 endpoint:(id)a4;
- (NSXPCConnection)heartbeatConnection;
- (NSXPCListenerEndpoint)endpoint;
- (void)_servicePing:(id)a3;
- (void)obtainXPCConnection:(id)a3;
- (void)setHaveCreatedHeartbeat:(BOOL)a3;
- (void)setHeartbeatConnection:(id)a3;
@end

@implementation CDAnonymousXPCService

- (CDAnonymousXPCService)initWithInfo:(id)a3 endpoint:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CDAnonymousXPCService;
  v8 = -[CDXPCService initWithInfo:](&v11, "initWithInfo:", a3);
  v9 = v8;
  if (v8)
  {
    if (v7) {
      objc_storeStrong((id *)&v8->_endpoint, a4);
    }
    else {
      +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"EndpointRequiredError",  @"CDAnonymousService Required Endpoint!");
    }
  }

  return v9;
}

- (void)_servicePing:(id)a3
{
  id v4 = a3;
  if (-[CDAnonymousXPCService createHeartbeatConnection](self, "createHeartbeatConnection"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
    uint64_t v6 = CDGetLogHandle("daemon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Pinging heartbeat connection for service %@",  buf,  0xCu);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v8 remoteObjectProxy]);

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __38__CDAnonymousXPCService__servicePing___block_invoke;
    v11[3] = &unk_1000590E0;
    id v12 = v5;
    id v13 = v4;
    id v10 = v5;
    [v9 servicePing:v11];
  }
}

uint64_t __38__CDAnonymousXPCService__servicePing___block_invoke(uint64_t a1)
{
  uint64_t v2 = CDGetLogHandle("daemon");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Heartbeat established for service %@",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)createHeartbeatConnection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
  if (v3)
  {

LABEL_8:
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
    BOOL v22 = v21 != 0LL;
    goto LABEL_9;
  }

  if (-[CDAnonymousXPCService haveCreatedHeartbeat](self, "haveCreatedHeartbeat")) {
    goto LABEL_8;
  }
  uint64_t v4 = CDGetLogHandle("daemon");
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
    *(_DWORD *)buf = 138412290;
    v36 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Establishing heartbeat to service %@",  buf,  0xCu);
  }

  -[CDAnonymousXPCService setHaveCreatedHeartbeat:](self, "setHaveCreatedHeartbeat:", 1LL);
  uint64_t v7 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService endpoint](self, "endpoint"));
  v9 = -[NSXPCConnection initWithListenerEndpoint:](v7, "initWithListenerEndpoint:", v8);
  -[CDAnonymousXPCService setHeartbeatConnection:](self, "setHeartbeatConnection:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
  LODWORD(v8) = v10 == 0LL;

  if (!(_DWORD)v8)
  {
    objc_initWeak((id *)buf, self);
    objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke;
    v32[3] = &unk_100059EE8;
    objc_copyWeak(&v34, (id *)buf);
    id v12 = v11;
    id v33 = v12;
    id v13 = objc_retainBlock(v32);
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472LL;
    v28 = __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke_6;
    v29 = &unk_100059EE8;
    objc_copyWeak(&v31, (id *)buf);
    id v14 = v12;
    id v30 = v14;
    v15 = objc_retainBlock(&v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection", v26, v27, v28, v29));
    [v16 setInvalidationHandler:v13];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
    [v17 setInterruptionHandler:v15];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CacheDeleteServiceProtocol));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
    [v19 setRemoteObjectInterface:v18];

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));
    [v20 resume];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&v34);

    objc_destroyWeak((id *)buf);
    goto LABEL_8;
  }

  uint64_t v24 = CDGetLogHandle("daemon");
  v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
    *(_DWORD *)buf = 138412290;
    v36 = v25;
    _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "Failed to create a heartbeat connection for service %@",  buf,  0xCu);
  }

  BOOL v22 = 0;
LABEL_9:

  return v22;
}

void __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CDGetLogHandle("daemon");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Heartbeat lost for service %@",  (uint8_t *)&v8,  0xCu);
  }

  [WeakRetained setHeartbeatConnection:0];
  int v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained serviceInvalidationHandler]);

  if (v6)
  {
    uint64_t v7 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained serviceInvalidationHandler]);
    v7[2]();
  }
}

void __50__CDAnonymousXPCService_createHeartbeatConnection__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = CDGetLogHandle("daemon");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Connection interrupted for service %@, outstanding messages should be resent!",  (uint8_t *)&v8,  0xCu);
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained serviceInterruptionHandler]);
  if (v6)
  {
    uint64_t v7 = (void (**)(void))objc_claimAutoreleasedReturnValue([WeakRetained serviceInterruptionHandler]);
    v7[2]();
  }
}

- (void)obtainXPCConnection:(id)a3
{
  uint64_t v4 = (void (**)(id, NSError *, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));

  if (!v5)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService heartbeatConnection](self, "heartbeatConnection"));

    if (v7)
    {
      int v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService endpoint](self, "endpoint"));

      if (!v8)
      {
        int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
        +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"com.apple.cache_delete.CDAnonymousXPCService.no_endpoint",  @"Asked to build a connection to %@ but we have no endpoint!",  v6);
        goto LABEL_3;
      }

      uint64_t v9 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDAnonymousXPCService endpoint](self, "endpoint"));
      objc_super v11 = -[NSXPCConnection initWithListenerEndpoint:](v9, "initWithListenerEndpoint:", v10);

      if (v11)
      {
        -[CDXPCService setXpcConnection:](self, "setXpcConnection:", v11);
        id v12 = (NSError *)objc_claimAutoreleasedReturnValue(-[CDXPCService xpcConnection](self, "xpcConnection"));
        v4[2](v4, v12, 0LL);
      }

      else
      {
        uint64_t v15 = *__error();
        uint64_t v16 = CDGetLogHandle("daemon");
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
          *(_DWORD *)buf = 138412546;
          v26 = v22;
          __int16 v27 = 2080;
          v28 = strerror(v15);
          _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Failed to create an XPC Connection to anonymous endpoint %@: %s",  buf,  0x16u);
        }

        id v12 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v15,  0LL);
        v18 = objc_alloc(&OBJC_CLASS___NSError);
        NSErrorUserInfoKey v23 = NSUnderlyingErrorKey;
        uint64_t v24 = v12;
        v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
        v20 = -[NSError initWithDomain:code:userInfo:]( v18,  "initWithDomain:code:userInfo:",  @"CacheDeleteErrorDomain",  6LL,  v19);

        ((void (**)(id, NSError *, NSError *))v4)[2](v4, 0LL, v20);
      }
    }

    else
    {
      uint64_t v13 = CDGetLogHandle("daemon");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
        *(_DWORD *)buf = 138412290;
        v26 = v21;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Heartbeat connection is dead for %@, unable to obtain XPC connection",  buf,  0xCu);
      }

      objc_super v11 = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"CacheDeleteErrorDomain",  6LL,  0LL);
      ((void (**)(id, NSError *, NSError *))v4)[2](v4, 0LL, v11);
    }

    goto LABEL_17;
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue(-[CDService ID](self, "ID"));
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  @"com.apple.cache_delete.CDAnonymousXPCService.duplicate_connection",  @"Asked to build a connection to %@ but we already have a perfectly good one!",  v6);
LABEL_3:

LABEL_17:
}

- (NSXPCListenerEndpoint)endpoint
{
  return self->_endpoint;
}

- (NSXPCConnection)heartbeatConnection
{
  return self->_heartbeatConnection;
}

- (void)setHeartbeatConnection:(id)a3
{
}

- (BOOL)haveCreatedHeartbeat
{
  return self->_haveCreatedHeartbeat;
}

- (void)setHaveCreatedHeartbeat:(BOOL)a3
{
  self->_haveCreatedHeartbeat = a3;
}

- (void).cxx_destruct
{
}

@end