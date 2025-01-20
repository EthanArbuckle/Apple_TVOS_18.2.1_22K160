@interface ICSharedListeningService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)controllers;
- (void)dealloc;
- (void)setControllers:(id)a3;
@end

@implementation ICSharedListeningService

- (void)dealloc
{
  id v3 = sub_1000017A4();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v8 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService: %p: deallocating.",  buf,  0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharedListeningService controllers](self, "controllers"));
  [v5 removeAllObjects];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ICSharedListeningService;
  -[ICSharedListeningService dealloc](&v6, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v25 = a3;
  id v6 = a4;
  v7 = v6;
  if (v6) {
    [v6 auditToken];
  }
  else {
    memset(v33, 0, sizeof(v33));
  }
  uint64_t v8 = MSVBundleIDForAuditToken(v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  id v10 = [v9 length];
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharedListeningService controllers](self, "controllers"));
    BOOL v12 = v11 == 0LL;

    if (v12)
    {
      v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      -[ICSharedListeningService setControllers:](self, "setControllers:", v13);
    }

    id v14 = sub_1000017A4();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v35 = self;
      __int16 v36 = 2112;
      v37 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "ICSharedListeningService: %p: accepting new connection %@.",  buf,  0x16u);
    }

    v16 = -[ICHostedSharedListeningConnectionController initWithConnection:bundleID:]( objc_alloc(&OBJC_CLASS___ICHostedSharedListeningConnectionController),  "initWithConnection:bundleID:",  v7,  v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSharedListeningService controllers](self, "controllers"));
    [v17 addObject:v16];

    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICSharedListeningConnectionServiceProtocol));
    [v7 setExportedObject:v16];
    [v7 setExportedInterface:v24];
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ICSharedListeningConnectionClientProtocol));
    v19 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError), 0LL);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    [v18 setClasses:v20 forSelector:"receiveConnectionError:" argumentIndex:0 ofReply:0];

    v21 = +[NSSet setWithObjects:](&OBJC_CLASS___NSSet, "setWithObjects:", objc_opt_class(&OBJC_CLASS___NSError), 0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    [v18 setClasses:v22 forSelector:"receiveFatalError:" argumentIndex:0 ofReply:0];

    [v7 setRemoteObjectInterface:v18];
    objc_initWeak((id *)buf, self);
    objc_initWeak(&location, v16);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000017E4;
    v29[3] = &unk_100004198;
    objc_copyWeak(&v30, (id *)buf);
    objc_copyWeak(&v31, &location);
    v29[4] = self;
    [v7 setInvalidationHandler:v29];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_100001948;
    v26[3] = &unk_100004198;
    objc_copyWeak(&v27, (id *)buf);
    objc_copyWeak(&v28, &location);
    v26[4] = self;
    [v7 setInterruptionHandler:v26];
    [v7 resume];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
    objc_destroyWeak((id *)buf);
  }

  else
  {
    [v7 invalidate];
  }

  return v10 != 0LL;
}

- (NSMutableArray)controllers
{
  return self->_controllers;
}

- (void)setControllers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end