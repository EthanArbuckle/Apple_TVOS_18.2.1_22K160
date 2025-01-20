@interface CCDGatekeeper
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (CCDGatekeeper)init;
- (CCDServer)server;
- (NSTimer)idleTimer;
- (double)machTimeScaleFactor;
- (void)idleTimerDidFire:(id)a3;
- (void)resetIdleTimer;
- (void)setIdleTimer:(id)a3;
- (void)setMachTimeScaleFactor:(double)a3;
- (void)setServer:(id)a3;
@end

@implementation CCDGatekeeper

- (CCDGatekeeper)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CCDGatekeeper;
  v2 = -[CCDGatekeeper init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[CCDGatekeeper resetIdleTimer](v2, "resetIdleTimer");
  }
  return v3;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  -[CCDGatekeeper resetIdleTimer](self, "resetIdleTimer");
  uint64_t isKindOfClass = objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:kCCServiceEntitlement]);
  v9 = (void *)isKindOfClass;
  if (isKindOfClass
    && (uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSNumber),
        uint64_t isKindOfClass = objc_opt_isKindOfClass(v9, v10),
        (isKindOfClass & 1) != 0)
    && (uint64_t isKindOfClass = (uint64_t)[v9 BOOLValue], (isKindOfClass & 1) != 0))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___DEPXPCProtocol));
    [v5 setExportedInterface:v11];

    v12 = objc_alloc(&OBJC_CLASS___CCDServicer);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CCDGatekeeper server](self, "server"));
    v14 = -[CCDServicer initWithXPCConnection:server:](v12, "initWithXPCConnection:server:", v5, v13);
    [v5 setExportedObject:v14];

    id v15 = [v5 resume];
    v18 = *(os_log_s **)(DEPLogObjects(v15, v16, v17) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Accepted new connection.", v22, 2u);
    }

    BOOL v19 = 1;
  }

  else
  {
    v20 = *(os_log_s **)(DEPLogObjects(isKindOfClass, v7, v8) + 8);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "rejecting connection because it is not entitled to use this service!",  buf,  2u);
    }

    BOOL v19 = 0;
  }

  return v19;
}

- (void)idleTimerDidFire:(id)a3
{
  v3 = *(os_log_s **)(DEPLogObjects(self, a2, a3) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "idling", v5, 2u);
  }

  Main = CFRunLoopGetMain();
  CFRunLoopStop(Main);
}

- (void)resetIdleTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000077FC;
  block[3] = &unk_1000188D8;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (CCDServer)server
{
  return (CCDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (void)setServer:(id)a3
{
}

- (NSTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (double)machTimeScaleFactor
{
  return self->_machTimeScaleFactor;
}

- (void)setMachTimeScaleFactor:(double)a3
{
  self->_machTimeScaleFactor = a3;
}

- (void).cxx_destruct
{
}

@end