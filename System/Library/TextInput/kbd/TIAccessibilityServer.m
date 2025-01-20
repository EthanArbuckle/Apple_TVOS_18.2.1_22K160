@interface TIAccessibilityServer
+ (id)sharedAccessibilityServer;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)dispatchQueue;
- (TIAccessibilityServer)init;
- (void)dealloc;
@end

@implementation TIAccessibilityServer

+ (id)sharedAccessibilityServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100005B80;
  block[3] = &unk_100014728;
  block[4] = a1;
  if (qword_10001E240 != -1) {
    dispatch_once(&qword_10001E240, block);
  }
  return (id)qword_10001E238;
}

- (TIAccessibilityServer)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TIAccessibilityServer;
  v2 = -[TIAccessibilityServer init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.TextInput.accessibility", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = objc_alloc(&OBJC_CLASS___NSXPCListener);
    v8 = -[NSXPCListener initWithMachServiceName:](v7, "initWithMachServiceName:", TIAccessibilityServiceName);
    listener = v2->_listener;
    v2->_listener = v8;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener _setQueue:](v2->_listener, "_setQueue:", v2->_dispatchQueue);
    -[NSXPCListener resume](v2->_listener, "resume");
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TIAccessibilityServer;
  -[TIAccessibilityServer dealloc](&v3, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.accessibility.api"]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if (objc_opt_isKindOfClass(v6, v7) & 1) != 0 && ([v6 BOOLValue])
  {
    if (TICanLogMessageAtLevel(1LL))
    {
      uint64_t v8 = TIOSLogFacility();
      v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10000B178(v5);
      }
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TIAccessibilityInterface));
    [v5 setExportedInterface:v10];

    objc_super v11 = objc_alloc_init(&OBJC_CLASS___TIAccessibilityHandler);
    [v5 setExportedObject:v11];

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TIAccessibilityServer dispatchQueue](self, "dispatchQueue"));
    [v5 _setQueue:v12];

    [v5 resume];
    BOOL v13 = 1;
  }

  else
  {
    BOOL v13 = 0;
    if (TICanLogMessageAtLevel(0LL))
    {
      uint64_t v14 = TIOSLogFacility();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10000B218(v5);
      }

      BOOL v13 = 0;
    }
  }

  return v13;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
}

@end