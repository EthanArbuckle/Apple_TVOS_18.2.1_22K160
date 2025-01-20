@interface AXMServiceXPCServer
- (AXMServiceXPCServer)init;
- (AXMServiceXPCServerDelegate)delegate;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connections;
- (void)_destroyXPCConnection:(id)a3;
- (void)prewarmVisionEngineService;
- (void)run;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7;
@end

@implementation AXMServiceXPCServer

- (AXMServiceXPCServer)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___AXMServiceXPCServer;
  v2 = -[AXMServiceXPCServer init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[AXMServiceXPCServer setConnections:](v3, "setConnections:", v4);
  }

  return v3;
}

- (void)run
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSXPCListener serviceListener](&OBJC_CLASS___NSXPCListener, "serviceListener"));
  [v3 setDelegate:self];
  [v3 resume];
}

- (void)_destroyXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXMediaLogService(v4);
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Will destroy connection to client: %@",  buf,  0xCu);
  }

  p_lock = &self->_lock;
  v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = __45__AXMServiceXPCServer__destroyXPCConnection___block_invoke;
  v12 = &unk_1000082E0;
  v13 = self;
  id v14 = v4;
  id v8 = v4;
  AX_PERFORM_WITH_LOCK(p_lock, &v9);
  objc_msgSend(v8, "invalidate", v9, v10, v11, v12, v13);
}

void __45__AXMServiceXPCServer__destroyXPCConnection___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connections]);
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)prewarmVisionEngineService
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __49__AXMServiceXPCServer_prewarmVisionEngineService__block_invoke;
  block[3] = &unk_100008268;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

void __49__AXMServiceXPCServer_prewarmVisionEngineService__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v1 prewarmVisionEngineService];
}

- (void)visionEngine:(id)a3 evaluateSource:(id)a4 context:(id)a5 options:(int64_t)a6 result:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = AXMediaLogService(v15);
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    *(_DWORD *)buf = 134217984;
    uint64_t v30 = (int)[v18 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_INFO,  "Received evaluate source request from: %ld",  buf,  0xCu);
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __74__AXMServiceXPCServer_visionEngine_evaluateSource_context_options_result___block_invoke;
  v23[3] = &unk_100008308;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  int64_t v28 = a6;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(&_dispatch_main_q, v23);
}

void __74__AXMServiceXPCServer_visionEngine_evaluateSource_context_options_result___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v2 visionEngine:*(void *)(a1 + 40) evaluateSource:*(void *)(a1 + 48) context:*(void *)(a1 + 56) options:*(void *)(a1 + 72) result:*(void *)(a1 + 64)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    [v7 auditToken];
  }
  else {
    memset(v28, 0, sizeof(v28));
  }
  uint64_t HasEntitlement = AXMAuditTokenTaskHasEntitlement(v28, AXMServiceAccessEntitlement);
  BOOL v10 = HasEntitlement;
  if ((HasEntitlement & 1) != 0)
  {
    uint64_t v11 = AXMServiceInterface();
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    [v8 setExportedInterface:v12];

    [v8 setExportedObject:self];
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AXMServiceClientInterface));
    [v8 setRemoteObjectInterface:v13];

    objc_initWeak(&location, v8);
    [v8 setInterruptionHandler:&__block_literal_global];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_63;
    v25[3] = &unk_100008370;
    v25[4] = self;
    objc_copyWeak(&v26, &location);
    [v8 setInvalidationHandler:v25];
    [v8 resume];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_64;
    v23[3] = &unk_1000082E0;
    v23[4] = self;
    id v14 = v8;
    id v24 = v14;
    uint64_t v15 = AX_PERFORM_WITH_LOCK(&self->_lock, v23);
    uint64_t v16 = AXMediaLogService(v15);
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v14 auditSessionIdentifier]));
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v14 processIdentifier]));
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v18;
      __int16 v31 = 2112;
      v32 = v19;
      __int16 v33 = 2112;
      id v34 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Accepting connection from client. AuditID:%@. PID:%@. connection: %@",  buf,  0x20u);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  else
  {
    uint64_t v20 = AXMediaLogService(HasEntitlement);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[AXMServiceXPCServer listener:shouldAcceptNewConnection:].cold.1(v8, v21);
    }
  }

  return v10;
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke(id a1)
{
  uint64_t v1 = AXMediaLogService(a1);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection from client interrupted", v3, 2u);
  }
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_63(uint64_t a1)
{
  uint64_t v2 = AXMediaLogService(a1);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_63_cold_1(v3);
  }

  id v4 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v4 _destroyXPCConnection:WeakRetained];
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_64(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connections]);
  [v2 addObject:*(void *)(a1 + 40)];
}

- (AXMServiceXPCServerDelegate)delegate
{
  return (AXMServiceXPCServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:(os_log_s *)a2 .cold.1(void *a1, os_log_s *a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [a1 processIdentifier]));
  int v5 = 138412546;
  id v6 = v4;
  __int16 v7 = 2112;
  id v8 = a1;
  _os_log_fault_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_FAULT,  "Invalid client tried to connect to AXMediaUtilitiesService. Does not have entitlement: AXMServiceAccessEntitlement. PID:%@. connection: %@",  (uint8_t *)&v5,  0x16u);
}

void __58__AXMServiceXPCServer_listener_shouldAcceptNewConnection___block_invoke_63_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Connection from client invalidated", v1, 2u);
}

@end