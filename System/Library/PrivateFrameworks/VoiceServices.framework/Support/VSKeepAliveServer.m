@interface VSKeepAliveServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (VSKeepAliveServer)init;
- (void)dealloc;
- (void)resume;
@end

@implementation VSKeepAliveServer

- (VSKeepAliveServer)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___VSKeepAliveServer;
  v2 = -[VSKeepAliveServer init](&v9, "init");
  if (v2)
  {
    v3 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v4 = -[NSXPCListener initWithMachServiceName:](v3, "initWithMachServiceName:", VSKeepAliveMachServiceName);
    keepAliveListener = v2->_keepAliveListener;
    v2->_keepAliveListener = v4;

    -[NSXPCListener setDelegate:](v2->_keepAliveListener, "setDelegate:", v2);
    v6 = objc_alloc_init(&OBJC_CLASS___VSServerKeepAliveManager);
    keepAliveManager = v2->_keepAliveManager;
    v2->_keepAliveManager = v6;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VSKeepAliveServer;
  -[VSKeepAliveServer dealloc](&v3, "dealloc");
}

- (void)resume
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4 = a4;
  v5 = objc_alloc_init(&OBJC_CLASS___VSKeepAliveClient);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___VSRemoteKeepAlive));
  [v4 setExportedInterface:v6];

  [v4 setExportedObject:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000EBFB0;
  v9[3] = &unk_1000FAA70;
  v10 = v5;
  v7 = v5;
  [v4 setInvalidationHandler:v9];
  [v4 resume];

  return 1;
}

- (void).cxx_destruct
{
}

@end