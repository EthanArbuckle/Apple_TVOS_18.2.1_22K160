@interface TSDDaemonServiceServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (TSDDaemonServiceServer)init;
- (void)dispatchDaemonServiceCallbackForProcess:(int)a3 clientID:(unsigned int)a4 ioResult:(int)a5 args:(const unint64_t *)a6 numArgs:(unsigned int)a7;
@end

@implementation TSDDaemonServiceServer

- (TSDDaemonServiceServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TSDDaemonServiceServer;
  v2 = -[TSDDaemonServiceServer init](&v10, "init");
  if (v2)
  {
    if (qword_100047C88 != -1) {
      dispatch_once(&qword_100047C88, &stru_10003CD20);
    }
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.timesync.expositor");
    listener = v2->_listener;
    v2->_listener = v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.timesync.DaemonService.connections", 0LL);
    connectionsQueue = v2->_connectionsQueue;
    v2->_connectionsQueue = (OS_dispatch_queue *)v5;

    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = (NSMutableArray *)v7;

    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  listener = self->_listener;
  if (listener == v6)
  {
    objc_initWeak(&location, self);
    v9 = objc_alloc_init(&OBJC_CLASS___TSDDaemonServiceServerExported);
    -[TSDDaemonServiceServerExported setObject:](v9, "setObject:", self);
    -[TSDDaemonServiceServerExported setProcessID:](v9, "setProcessID:", [v7 processIdentifier]);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TSXDaemonServiceClientProtocol));
    [v7 setRemoteObjectInterface:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TSXDaemonServiceServerProtocol));
    [v7 setExportedInterface:v11];

    [v7 setExportedObject:v9];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10001C684;
    v18[3] = &unk_10003CD48;
    objc_copyWeak(&v20, &location);
    id v12 = v7;
    id v19 = v12;
    [v12 setInvalidationHandler:v18];
    connectionsQueue = self->_connectionsQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001C8D4;
    v15[3] = &unk_10003CD98;
    v15[4] = self;
    id v16 = v12;
    objc_copyWeak(&v17, &location);
    dispatch_sync((dispatch_queue_t)connectionsQueue, v15);
    objc_destroyWeak(&v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return listener == v6;
}

- (void)dispatchDaemonServiceCallbackForProcess:(int)a3 clientID:(unsigned int)a4 ioResult:(int)a5 args:(const unint64_t *)a6 numArgs:(unsigned int)a7
{
  connectionsQueue = self->_connectionsQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10001CBCC;
  v8[3] = &unk_10003CDE8;
  v8[4] = self;
  v8[5] = a6;
  int v9 = a3;
  unsigned int v10 = a7;
  unsigned int v11 = a4;
  int v12 = a5;
  dispatch_sync((dispatch_queue_t)connectionsQueue, v8);
}

- (void).cxx_destruct
{
}

@end