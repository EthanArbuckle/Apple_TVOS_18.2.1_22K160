id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer:");
}
ACPServer)server;
- (IOHIDRemoteSensorSessionFilter)initWithSession:(id)a3;
- (OS_dispatch_queue)queue;
- (id)filterEvent:(id)a3 forService:(id)a4;
- (id)propertyForKey:(id)a3;
- (void)activate;
- (void)cancel;
- (void)dealloc;
- (void)setQueue:(id)a3;
- (void)setServer:(id)a3;
@end

@implementation IOHIDRemoteSensorSessionFilter

- (IOHIDRemoteSensorSessionFilter)initWithSession:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___IOHIDRemoteSensorSessionFilter;
  v3 = -[IOHIDRemoteSensorSessionFilter init](&v10, "init", a3);
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.hidrc", 0LL);
    -[IOHIDRemoteSensorSessionFilter setQueue:](v3, "setQueue:", v4);

    v5 = objc_alloc(&OBJC_CLASS___HIDRemoteDeviceAACPServer);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IOHIDRemoteSensorSessionFilter queue](v3, "queue"));
    v7 = -[HIDRemoteDeviceAACPServer initWithQueue:](v5, "initWithQueue:", v6);
    -[IOHIDRemoteSensorSessionFilter setServer:](v3, "setServer:", v7);

    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___IOHIDRemoteSensorSessionFilter;
  -[IOHIDRemoteSensorSessionFilter dealloc](&v2, "dealloc");
}

- (id)propertyForKey:(id)a3
{
  if ([a3 isEqualToString:@"SessionFilterDebug"])
  {
    v3 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v3,  "setObject:forKeyedSubscript:",  @"IOHIDRemoteSensorSessionFilter",  @"Class");
  }

  else
  {
    v3 = 0LL;
  }

  return v3;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (id)filterEvent:(id)a3 forService:(id)a4
{
  return a3;
}

- (void)activate
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IOHIDRemoteSensorSessionFilter server](self, "server"));
  [v2 activate];
}

- (void)cancel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[IOHIDRemoteSensorSessionFilter server](self, "server"));
  [v2 cancel];
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (HIDRemoteDeviceAACPServer)server
{
  return (HIDRemoteDeviceAACPServer *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setServer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end