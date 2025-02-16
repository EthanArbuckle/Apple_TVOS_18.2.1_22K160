@interface MMTConnectionManager
+ (id)sharedInstance;
- (MMTConnectionManager)init;
- (NSMutableSet)activeConnections;
- (OS_dispatch_queue)connectionQueue;
- (void)createConnectionForLockdownConnection:(_lockdown_connection *)a3;
- (void)removeConnection:(id)a3;
- (void)setActiveConnections:(id)a3;
@end

@implementation MMTConnectionManager

+ (id)sharedInstance
{
  if (qword_100014B98 != -1) {
    dispatch_once(&qword_100014B98, &stru_1000106E0);
  }
  return (id)qword_100014B90;
}

- (MMTConnectionManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MMTConnectionManager;
  v2 = -[MMTConnectionManager init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    activeConnections = v2->_activeConnections;
    v2->_activeConnections = (NSMutableSet *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("Connection Manager Queue", 0LL);
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v5;
  }

  return v2;
}

- (void)createConnectionForLockdownConnection:(_lockdown_connection *)a3
{
  dispatch_queue_t v5 = *(os_log_s **)DMCLogObjects(self);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Connecting lockdown connection: %p", buf, 0xCu);
  }

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MMTConnectionManager connectionQueue](self, "connectionQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000050E4;
  v7[3] = &unk_100010708;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v6, v7);
}

- (void)removeConnection:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = *(void **)DMCLogObjects(v4);
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 134217984;
    id v13 = [v4 lockdownConnection];
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Disconnecting lockdown connection: %p",  buf,  0xCu);
  }

  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MMTConnectionManager connectionQueue](self, "connectionQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10000526C;
  v9[3] = &unk_100010730;
  id v10 = v4;
  v11 = self;
  id v8 = v4;
  dispatch_sync(v7, v9);
}

- (NSMutableSet)activeConnections
{
  return self->_activeConnections;
}

- (void)setActiveConnections:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void).cxx_destruct
{
}

@end