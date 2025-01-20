@interface SDXPCSession
+ (id)sharedSession;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)connections;
- (NSXPCListener)xpcManagerListener;
- (SDXPCSession)init;
- (void)connectionManagerDidInvalidate:(id)a3;
- (void)setConnections:(id)a3;
- (void)setXpcManagerListener:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation SDXPCSession

+ (id)sharedSession
{
  if (qword_100656FA8 != -1) {
    dispatch_once(&qword_100656FA8, &stru_1005CD0C0);
  }
  return (id)qword_100656FA0;
}

- (SDXPCSession)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SDXPCSession;
  v2 = -[SDXPCSession init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    xpcManagerListener = v2->_xpcManagerListener;
    v2->_xpcManagerListener = 0LL;

    v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    connections = v3->_connections;
    v3->_connections = v5;
  }

  return v3;
}

- (void)start
{
  uint64_t v3 = daemon_log(self);
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10009A2C4(v4);
  }

  if (!self->_xpcManagerListener)
  {
    v5 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.sharingd.nsxpc");
    xpcManagerListener = self->_xpcManagerListener;
    self->_xpcManagerListener = v5;

    -[NSXPCListener _setQueue:](self->_xpcManagerListener, "_setQueue:", &_dispatch_main_q);
    -[NSXPCListener setDelegate:](self->_xpcManagerListener, "setDelegate:", self);
    -[NSXPCListener resume](self->_xpcManagerListener, "resume");
  }

- (void)stop
{
  xpcManagerListener = self->_xpcManagerListener;
  if (xpcManagerListener)
  {
    -[NSXPCListener invalidate](xpcManagerListener, "invalidate");
    -[NSXPCListener setDelegate:](self->_xpcManagerListener, "setDelegate:", 0LL);
    v4 = self->_xpcManagerListener;
    self->_xpcManagerListener = 0LL;
  }

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = -[SDConnectionManager initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___SDConnectionManager),  "initWithXPCConnection:",  v5);

  -[NSMutableArray addObject:](self->_connections, "addObject:", v6);
  -[SDConnectionManager setDelegate:](v6, "setDelegate:", self);
  -[SDConnectionManager start](v6, "start");

  return 1;
}

- (void)connectionManagerDidInvalidate:(id)a3
{
}

- (NSXPCListener)xpcManagerListener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setXpcManagerListener:(id)a3
{
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end