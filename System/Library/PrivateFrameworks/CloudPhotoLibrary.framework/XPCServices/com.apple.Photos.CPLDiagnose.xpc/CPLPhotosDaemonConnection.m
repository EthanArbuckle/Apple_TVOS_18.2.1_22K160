@interface CPLPhotosDaemonConnection
- (CPLPhotosDaemonConnection)init;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)queue;
- (id)managementServiceWithError:(id *)a3;
- (id)proxyWithErrorHandler:(id)a3;
- (void)close;
- (void)dealloc;
@end

@implementation CPLPhotosDaemonConnection

- (CPLPhotosDaemonConnection)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___CPLPhotosDaemonConnection;
  v2 = -[CPLPhotosDaemonConnection init](&v14, "init");
  if (v2)
  {
    v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.photos.service",  0LL);
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___CPLPhotosDaemonProtocol));
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___PLAssetsdLibraryManagementServiceProtocol));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___PLPhotoLibraryIdentifier),  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v5 setClasses:v8 forSelector:"findPhotoLibraryIdentifiersMatchingSearchCriteria:reply:" argumentIndex:0 ofReply:1];

    [v4 setInterface:v5 forSelector:"getLibraryManagementServiceWithReply:" argumentIndex:0 ofReply:1];
    -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.cpl.daemon.connection", 0LL);
    -[NSXPCConnection _setQueue:](v3, "_setQueue:", v9);

    connection = v2->_connection;
    v2->_connection = v3;

    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[NSXPCConnection _queue](v2->_connection, "_queue"));
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v11;

    -[NSXPCConnection resume](v2->_connection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CPLPhotosDaemonConnection;
  -[CPLPhotosDaemonConnection dealloc](&v3, "dealloc");
}

- (void)close
{
}

- (id)proxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  connection = self->_connection;
  if (!connection) {
    sub_10001C860((uint64_t)self, (uint64_t)a2);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connection,  "remoteObjectProxyWithErrorHandler:",  v5));

  return v7;
}

- (id)managementServiceWithError:(id *)a3
{
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = sub_100004654;
  v38 = sub_100004664;
  id v39 = 0LL;
  uint64_t v28 = 0LL;
  v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = sub_100004654;
  v32 = sub_100004664;
  id v33 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_10000466C;
  v22[3] = &unk_100030AF0;
  v24 = v26;
  v25 = &v34;
  id v5 = dispatch_semaphore_create(0LL);
  v23 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLPhotosDaemonConnection proxyWithErrorHandler:](self, "proxyWithErrorHandler:", v22));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1000046DC;
  v17[3] = &unk_100030B18;
  v19 = v26;
  v20 = &v28;
  v21 = &v34;
  v7 = v5;
  v18 = v7;
  [v6 getLibraryManagementServiceWithReply:v17];
  dispatch_time_t v8 = dispatch_time(0LL, 30000000000LL);
  if (dispatch_semaphore_wait(v7, v8))
  {
    queue = (dispatch_queue_s *)self->_queue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100004778;
    v13[3] = &unk_100030B40;
    v15 = v26;
    v16 = &v34;
    objc_super v14 = v7;
    dispatch_sync(queue, v13);
  }

  v10 = (void *)v29[5];
  if (a3 && !v10)
  {
    *a3 = (id) v35[5];
    v10 = (void *)v29[5];
  }

  id v11 = v10;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
}

@end