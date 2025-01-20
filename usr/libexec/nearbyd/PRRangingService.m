@interface PRRangingService
+ (id)serviceWithQueue:(id)a3;
- (BOOL)shouldAcceptNewConnection:(id)a3;
- (BOOL)validateClientEntitlements:(id)a3;
- (NSArray)machServicesNames;
- (PRRangingService)initWithQueue:(id)a3;
- (void)handleXPCDisconnection:(id)a3;
@end

@implementation PRRangingService

- (PRRangingService)initWithQueue:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2, self, @"PRRangingService.mm", 32, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___PRRangingService;
  v7 = -[PRRangingService init](&v12, "init");
  if (v7)
  {
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    xpcSessions = v7->_xpcSessions;
    v7->_xpcSessions = v8;

    objc_storeStrong((id *)&v7->_queue, a3);
  }

  return v7;
}

+ (id)serviceWithQueue:(id)a3
{
  id v3 = a3;
  v4 = -[PRRangingService initWithQueue:](objc_alloc(&OBJC_CLASS___PRRangingService), "initWithQueue:", v3);

  return v4;
}

- (NSArray)machServicesNames
{
  return (NSArray *)&off_1007D2130;
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v4 = a3;
  v5 = (os_log_s *)qword_1008000A0;
  if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
    sub_10038A950(v5);
  }
  int v6 = [v4 processIdentifier];
  BOOL v7 = -[PRRangingService validateClientEntitlements:](self, "validateClientEntitlements:", v4);
  v8 = (os_log_s *)qword_1008000A0;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_DEBUG)) {
      sub_100388208(v6, v8);
    }
    v9 = -[PRRangingServiceProxy initWithConnection:queue:]( objc_alloc(&OBJC_CLASS___PRRangingServiceProxy),  "initWithConnection:queue:",  v4,  self->_queue);
    -[NSMutableSet addObject:](self->_xpcSessions, "addObject:", v9);
    id v10 = sub_100155398();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v4 setRemoteObjectInterface:v11];

    id v12 = sub_100155138();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    [v4 setExportedInterface:v13];

    [v4 setExportedObject:v9];
    [v4 _setQueue:self->_queue];
    objc_initWeak(&location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100022248;
    v21[3] = &unk_1007A2648;
    int v24 = v6;
    objc_copyWeak(&v23, &location);
    v14 = v9;
    v22 = v14;
    [v4 setInterruptionHandler:v21];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100022324;
    v17[3] = &unk_1007A2648;
    int v20 = v6;
    objc_copyWeak(&v19, &location);
    v15 = v14;
    v18 = v15;
    [v4 setInvalidationHandler:v17];
    [v4 resume];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  else if (os_log_type_enabled((os_log_t)qword_1008000A0, OS_LOG_TYPE_ERROR))
  {
    sub_100388278(v6, v8);
  }

  return v7;
}

- (void)handleXPCDisconnection:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v10 handleFailureInMethod:a2, self, @"PRRangingService.mm", 111, @"Invalid parameter not satisfying: %@", @"proxy" object file lineNumber description];
  }

  int v6 = (void *)objc_claimAutoreleasedReturnValue([v5 clientInfo]);
  if (v6)
  {
    BOOL v7 = (os_log_s *)(id)qword_1008000A0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue([v6 objectForKey:PRProcessNameKey]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:PRProcessIdentifierKey]);
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 1024;
      unsigned int v14 = [v9 intValue];
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "PRGenericRangingService: XPC connection teardown. Process name: %@, pid: %d",  buf,  0x12u);
    }
  }

  [v5 terminate];
  -[NSMutableSet removeObject:](self->_xpcSessions, "removeObject:", v5);
}

- (BOOL)validateClientEntitlements:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 valueForEntitlement:@"com.apple.nearbyd.xpc"]);
  BOOL v6 = 0;
  if (v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber, v3);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end