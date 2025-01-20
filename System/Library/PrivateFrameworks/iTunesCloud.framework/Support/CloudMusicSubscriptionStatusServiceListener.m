@interface CloudMusicSubscriptionStatusServiceListener
+ (CloudMusicSubscriptionStatusServiceListener)sharedMusicSubscriptionStatusServiceListener;
- (BOOL)isActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)dealloc;
- (void)performSubscriptionStatusRequest:(id)a3 forUniqueIdentifier:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation CloudMusicSubscriptionStatusServiceListener

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CloudMusicSubscriptionStatusServiceListener;
  v2 = -[CloudMusicSubscriptionStatusServiceListener init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.itunescloudd.CloudMusicSubscriptionStatusServiceListener.accessQueue", 0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusRemoteRequesting machServiceName]( &OBJC_CLASS___ICMusicSubscriptionStatusRemoteRequesting,  "machServiceName"));
    v7 = -[NSXPCListener initWithMachServiceName:](v5, "initWithMachServiceName:", v6);
    serviceListener = v2->_serviceListener;
    v2->_serviceListener = v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CloudMusicSubscriptionStatusServiceListener;
  -[CloudMusicSubscriptionStatusServiceListener dealloc](&v3, "dealloc");
}

- (BOOL)isActive
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10008F7A8;
  v5[3] = &unk_1001A65D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)start
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008F6C8;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)stop
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008F5E8;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)performSubscriptionStatusRequest:(id)a3 forUniqueIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
  char v9 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusController sharedStatusController]( &OBJC_CLASS___ICMusicSubscriptionStatusController,  "sharedStatusController"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10008F3B8;
  v12[3] = &unk_1001A6AF8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v8;
  id v10 = v8;
  id v11 = v6;
  [v9 performSubscriptionStatusRequest:v7 withStatusHandler:v12];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedObject:self];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusRemoteRequesting serviceInterface]( &OBJC_CLASS___ICMusicSubscriptionStatusRemoteRequesting,  "serviceInterface"));
  [v5 setExportedInterface:v6];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[ICMusicSubscriptionStatusRemoteRequesting clientInterface]( &OBJC_CLASS___ICMusicSubscriptionStatusRemoteRequesting,  "clientInterface"));
  [v5 setRemoteObjectInterface:v7];

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[ICDeviceSetupStatusMonitor sharedMonitor](&OBJC_CLASS___ICDeviceSetupStatusMonitor, "sharedMonitor"));
  unsigned int v9 = [v8 isDeviceSetupComplete];

  if (v9)
  {
    [v5 resume];
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[ICDeviceSetupStatusMonitor sharedMonitor]( &OBJC_CLASS___ICDeviceSetupStatusMonitor,  "sharedMonitor"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_10008F3B0;
    v12[3] = &unk_1001A6B90;
    id v13 = v5;
    [v10 performBlockAfterDeviceSetup:v12];
  }

  return 1;
}

- (void).cxx_destruct
{
}

+ (CloudMusicSubscriptionStatusServiceListener)sharedMusicSubscriptionStatusServiceListener
{
  if (qword_1001DB6F8 != -1) {
    dispatch_once(&qword_1001DB6F8, &stru_1001A4118);
  }
  return (CloudMusicSubscriptionStatusServiceListener *)(id)qword_1001DB6F0;
}

@end