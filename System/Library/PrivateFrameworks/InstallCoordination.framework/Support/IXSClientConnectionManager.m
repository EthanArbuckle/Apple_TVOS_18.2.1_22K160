@interface IXSClientConnectionManager
+ (id)sharedInstance;
+ (void)configureService;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (IXSClientConnectionManager)init;
- (NSHashTable)allConnections;
- (OS_dispatch_queue)allConnectionsQueue;
@end

@implementation IXSClientConnectionManager

+ (void)configureService
{
  id v2 = [(id)objc_opt_class(a1) sharedInstance];
}

+ (id)sharedInstance
{
  if (qword_1000E8ED8 != -1) {
    dispatch_once(&qword_1000E8ED8, &stru_1000CD9C0);
  }
  return (id)qword_1000E8ED0;
}

- (IXSClientConnectionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IXSClientConnectionManager;
  id v2 = -[IXSClientConnectionManager init](&v10, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    allConnections = v2->_allConnections;
    v2->_allConnections = (NSHashTable *)v3;

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.installcoordinationd.IXSClientConnection.allConnections", v6);
    allConnectionsQueue = v2->_allConnectionsQueue;
    v2->_allConnectionsQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = sub_10000C398(v7, (uint64_t)@"com.apple.private.InstallCoordination.allowed");
  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[IXClientProtocolInterface interface](&OBJC_CLASS___IXClientProtocolInterface, "interface"));
    [v7 setExportedInterface:v9];

    objc_super v10 = -[IXSClientConnection initWithConnection:]( objc_alloc(&OBJC_CLASS___IXSClientConnection),  "initWithConnection:",  v7);
    [v7 setExportedObject:v10];
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[IXClientDelegateProtocolInterface interface]( &OBJC_CLASS___IXClientDelegateProtocolInterface,  "interface"));
    [v7 setRemoteObjectInterface:v11];

    [v7 setInterruptionHandler:&stru_1000CD9E0];
    objc_initWeak((id *)location, v10);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10002D824;
    v25[3] = &unk_1000CDA08;
    objc_copyWeak(&v26, (id *)location);
    v25[4] = self;
    [v7 setInvalidationHandler:v25];
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSClientConnectionManager allConnectionsQueue](self, "allConnectionsQueue"));
    v19 = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    v21 = sub_10002D9B0;
    v22 = &unk_1000CCCB8;
    v23 = self;
    v13 = v10;
    v24 = v13;
    dispatch_sync(v12, &v19);

    objc_msgSend(v7, "resume", v19, v20, v21, v22, v23);
    objc_destroyWeak(&v26);
    objc_destroyWeak((id *)location);
  }

  else
  {
    int v14 = [v7 processIdentifier];
    v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v13 = (IXSClientConnection *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      v16 = sub_10000C26C(v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[IXSClientConnectionManager listener:shouldAcceptNewConnection:]";
      __int16 v28 = 2112;
      v29 = v17;
      __int16 v30 = 1024;
      int v31 = v14;
      __int16 v32 = 2112;
      v33 = @"com.apple.private.InstallCoordination.allowed";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "%s: Process %@ (pid %d) is missing %@ entitlement so rejecting connection attempt.",  location,  0x26u);
    }
  }

  return v8;
}

- (NSHashTable)allConnections
{
  return self->_allConnections;
}

- (OS_dispatch_queue)allConnectionsQueue
{
  return self->_allConnectionsQueue;
}

- (void).cxx_destruct
{
}

@end