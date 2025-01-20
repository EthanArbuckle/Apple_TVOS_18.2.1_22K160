@interface TIRemoteDataServer
+ (id)sharedRemoteDataServer;
+ (void)resolveAssistantFrameworkClasses;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TIRemoteDataServer)init;
- (void)dealloc;
@end

@implementation TIRemoteDataServer

+ (void)resolveAssistantFrameworkClasses
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_100008964;
  v2[3] = &unk_100014A68;
  v2[4] = a2;
  v2[5] = a1;
  if (qword_10001E2A0 != -1) {
    dispatch_once(&qword_10001E2A0, v2);
  }
}

+ (id)sharedRemoteDataServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100008A58;
  block[3] = &unk_100014728;
  block[4] = a1;
  if (qword_10001E2B8 != -1) {
    dispatch_once(&qword_10001E2B8, block);
  }
  return (id)qword_10001E2B0;
}

- (TIRemoteDataServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TIRemoteDataServer;
  v2 = -[TIRemoteDataServer init](&v10, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.remote-data-server", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.TextInput.rdt");
    listener = v2->_listener;
    v2->_listener = v7;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TIRemoteDataServer;
  -[TIRemoteDataServer dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  if (TICanLogMessageAtLevel(1LL))
  {
    uint64_t v6 = TIOSLogFacility();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000B428(v5);
    }
  }

  v8 = objc_opt_new(&OBJC_CLASS___TIRemoteDataHandle);
  [v5 setExportedObject:v8];
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TIRemoteDataProtocol));
  [v5 setExportedInterface:v9];

  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[TIRemoteDataServer dispatchQueue](self, "dispatchQueue"));
  [v5 _setQueue:v10];

  [v5 resume];
  return 1;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end