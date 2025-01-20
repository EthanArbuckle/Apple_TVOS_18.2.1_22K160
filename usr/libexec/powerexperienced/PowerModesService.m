@interface PowerModesService
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)clients;
- (OS_dispatch_queue)queue;
- (PowerModesService)init;
- (void)registerWithIdentifier:(id)a3 forModes:(id)a4;
- (void)setClients:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)updateClientsforMode:(id)a3 withState:(BOOL)a4;
@end

@implementation PowerModesService

+ (id)sharedInstance
{
  if (qword_10001B730 != -1) {
    dispatch_once(&qword_10001B730, &stru_100014638);
  }
  return (id)qword_10001B728;
}

- (PowerModesService)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PowerModesService;
  v2 = -[PowerModesService initWithMachServiceName:]( &v10,  "initWithMachServiceName:",  @"com.apple.powerexperienced.powermodesservice");
  if (v2)
  {
    v3 = (os_log_s *)qword_10001B738;
    if (os_log_type_enabled((os_log_t)qword_10001B738, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "starting service", v9, 2u);
    }

    -[PowerModesService setDelegate:](v2, "setDelegate:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    -[PowerModesService setClients:](v2, "setClients:", v4);

    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.powerexperienced.powermodesservice", v6);
    -[PowerModesService setQueue:](v2, "setQueue:", v7);
  }

  return v2;
}

- (void)start
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____ContextualPowerModesProtocol));
  [v5 setExportedInterface:v6];

  [v5 setExportedObject:self];
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL____ContextualPowerModesCallbackProtocol));
  [v5 setRemoteObjectInterface:v7];

  v8 = (void *)qword_10001B738;
  if (os_log_type_enabled((os_log_t)qword_10001B738, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v11[0] = 67109120;
    v11[1] = [v5 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "PowerModesManager: listener: accepted new connection from pid %d",  (uint8_t *)v11,  8u);
  }

  [v5 resume];

  return 1;
}

- (void)updateClientsforMode:(id)a3 withState:(BOOL)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PowerModesService queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000091D0;
  block[3] = &unk_100014688;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (void)registerWithIdentifier:(id)a3 forModes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[PowerModesService queue](self, "queue"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100009538;
  v13[3] = &unk_100014538;
  id v14 = v6;
  id v15 = v7;
  id v16 = v8;
  v17 = self;
  id v10 = v8;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v9, v13);
}

- (NSMutableArray)clients
{
  return (NSMutableArray *)self->super._xconnection;
}

- (void)setClients:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end