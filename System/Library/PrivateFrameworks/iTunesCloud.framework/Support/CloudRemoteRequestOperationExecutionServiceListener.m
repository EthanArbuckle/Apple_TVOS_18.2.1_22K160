@interface CloudRemoteRequestOperationExecutionServiceListener
+ (CloudRemoteRequestOperationExecutionServiceListener)sharedRemoteRequestOperationExecutionServiceListener;
- (BOOL)isActive;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)_init;
- (void)dealloc;
- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4;
- (void)start;
- (void)stop;
@end

@implementation CloudRemoteRequestOperationExecutionServiceListener

- (id)_init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CloudRemoteRequestOperationExecutionServiceListener;
  v2 = -[CloudRemoteRequestOperationExecutionServiceListener init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create( "com.apple.itunescloudd.CloudRemoteRequestOperationExecutionServiceListener.accessQueue",  0LL);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICRemoteRequestOperationExecuting machServiceName]( &OBJC_CLASS___ICRemoteRequestOperationExecuting,  "machServiceName"));
    v7 = -[NSXPCListener initWithMachServiceName:](v5, "initWithMachServiceName:", v6);
    serviceListener = v2->_serviceListener;
    v2->_serviceListener = v7;
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CloudRemoteRequestOperationExecutionServiceListener;
  -[CloudRemoteRequestOperationExecutionServiceListener dealloc](&v3, "dealloc");
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
  v5[2] = sub_1000DB754;
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
  block[2] = sub_1000DB704;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)stop
{
  accessQueue = (dispatch_queue_s *)self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000DB6B4;
  block[3] = &unk_1001A6B90;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

- (void)performRemoteRequestOperationWithExecutionContext:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteRequestOperation]);
  [v7 _setShadowOperationForRemoteExecution:1];
  id v8 = [v6 qualityOfService];

  char v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSOperationQueue ic_sharedRequestOperationQueueWithQualityOfService:]( &OBJC_CLASS___NSOperationQueue,  "ic_sharedRequestOperationQueueWithQualityOfService:",  v8));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000DB610;
  v12[3] = &unk_1001A7220;
  id v13 = v7;
  id v14 = v5;
  id v10 = v5;
  id v11 = v7;
  [v11 performRequestOnOperationQueue:v9 withCompletionHandler:v12];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  [v5 setExportedObject:self];
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[ICRemoteRequestOperationExecuting serviceInterface]( &OBJC_CLASS___ICRemoteRequestOperationExecuting,  "serviceInterface"));
  [v5 setExportedInterface:v6];

  v7 = (void *)objc_claimAutoreleasedReturnValue( +[ICRemoteRequestOperationExecuting clientInterface]( &OBJC_CLASS___ICRemoteRequestOperationExecuting,  "clientInterface"));
  [v5 setRemoteObjectInterface:v7];

  [v5 resume];
  return 1;
}

- (void).cxx_destruct
{
}

+ (CloudRemoteRequestOperationExecutionServiceListener)sharedRemoteRequestOperationExecutionServiceListener
{
  if (qword_1001DB7E0 != -1) {
    dispatch_once(&qword_1001DB7E0, &stru_1001A59F8);
  }
  return (CloudRemoteRequestOperationExecutionServiceListener *)(id)qword_1001DB7D8;
}

@end