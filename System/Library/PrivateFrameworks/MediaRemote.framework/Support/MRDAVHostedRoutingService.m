@interface MRDAVHostedRoutingService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MRDAVHostedRoutingService)init;
- (MRDHostedRoutingController)hostedRoutingController;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (id)endpointForDeviceUID:(id)a3;
- (id)endpointForOrigin:(id)a3;
- (void)collectDiagnostic:(id)a3;
- (void)hostedDiscoverySessionDidInvalidate:(id)a3;
@end

@implementation MRDAVHostedRoutingService

- (MRDAVHostedRoutingService)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___MRDAVHostedRoutingService;
  v2 = -[MRDAVHostedRoutingService init](&v17, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSXPCListener anonymousListener](&OBJC_CLASS___NSXPCListener, "anonymousListener"));
    anonymousListener = v3->_anonymousListener;
    v3->_anonymousListener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v3->_anonymousListener, "setDelegate:", v3);
    v12 = objc_alloc_init(&OBJC_CLASS___MRDAVHostedRoutingController);
    hostedRoutingController = v3->_hostedRoutingController;
    v3->_hostedRoutingController = &v12->super;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    hostedDiscoverySessions = v3->_hostedDiscoverySessions;
    v3->_hostedDiscoverySessions = v14;

    -[NSXPCListener resume](v3->_anonymousListener, "resume");
  }

  return v3;
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  return -[NSXPCListener endpoint](self->_anonymousListener, "endpoint");
}

- (id)endpointForOrigin:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10005ABE0;
  v16 = sub_10005ABF0;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005ABF8;
  block[3] = &unk_100399DF8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)endpointForDeviceUID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  v15 = sub_10005ABE0;
  v16 = sub_10005ABF0;
  id v17 = 0LL;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005AEA4;
  block[3] = &unk_100399DF8;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)hostedDiscoverySessionDidInvalidate:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B048;
  block[3] = &unk_100398E60;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = -[MRDAVHostedDiscoverySession initWithConnection:hostedRoutingController:]( objc_alloc(&OBJC_CLASS___MRDAVHostedDiscoverySession),  "initWithConnection:hostedRoutingController:",  v5,  self->_hostedRoutingController);

  -[MRDAVHostedDiscoverySession setDelegate:](v6, "setDelegate:", self);
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10005B110;
  v10[3] = &unk_100398E60;
  v10[4] = self;
  v11 = v6;
  id v8 = v6;
  dispatch_sync(serialQueue, v10);

  return 1;
}

- (void)collectDiagnostic:(id)a3
{
  id v4 = a3;
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005B198;
  block[3] = &unk_100398E60;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(serialQueue, block);
}

- (MRDHostedRoutingController)hostedRoutingController
{
  return self->_hostedRoutingController;
}

- (void).cxx_destruct
{
}

@end