@interface ServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (ServiceDelegate)init;
@end

@implementation ServiceDelegate

- (ServiceDelegate)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ServiceDelegate;
  v2 = -[ServiceDelegate init](&v7, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___SnapshotService);
    snapshotService = v2->_snapshotService;
    v2->_snapshotService = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___MKSnapshotServiceProtocol));
  [v7 setExportedInterface:v8];

  [v7 setExportedObject:self->_snapshotService];
  objc_initWeak(&location, v7);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10000442C;
  v12[3] = &unk_1000082F8;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  [v7 setInvalidationHandler:v12];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100004478;
  v10[3] = &unk_1000082F8;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  [v7 setInterruptionHandler:v10];
  [v7 resume];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return 1;
}

- (void).cxx_destruct
{
}

@end