@interface MBHelperServiceDelegate
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (MBHelperServiceDelegate)init;
- (NSMutableArray)connections;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)idleTimer;
- (OS_os_transaction)transaction;
- (int64_t)idleTimerSuspendCount;
- (void)_addConnection:(id)a3;
- (void)_removeConnection:(id)a3;
- (void)activate;
- (void)idle;
- (void)setConnections:(id)a3;
- (void)setIdleTimer:(id)a3;
- (void)setIdleTimerSuspendCount:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setTransaction:(id)a3;
@end

@implementation MBHelperServiceDelegate

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000072BC;
  block[3] = &unk_10001C720;
  block[4] = a1;
  if (qword_100022230 != -1) {
    dispatch_once(&qword_100022230, block);
  }
  return (id)qword_100022228;
}

- (MBHelperServiceDelegate)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MBHelperServiceDelegate;
  v2 = -[MBHelperServiceDelegate init](&v16, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    Name = class_getName(v4);
    dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;

    dispatch_source_t v10 = dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  (dispatch_queue_t)v3->_queue);
    idleTimer = v3->_idleTimer;
    v3->_idleTimer = (OS_dispatch_source *)v10;

    transaction = v3->_transaction;
    v3->_idleTimerSuspendCount = 0LL;
    v3->_transaction = 0LL;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    connections = v3->_connections;
    v3->_connections = v13;

    dispatch_source_set_timer((dispatch_source_t)v3->_idleTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume((dispatch_object_t)v3->_idleTimer);
  }

  return v3;
}

- (void)_addConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007450;
  block[3] = &unk_10001C748;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)_removeConnection:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007530;
  block[3] = &unk_10001C748;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MBGetDefaultLog();
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = [v7 processIdentifier];
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "New connection from pid:%d",  (uint8_t *)&buf,  8u);
    id v10 = [v7 processIdentifier];
    _MBLog(@"DEFAULT", (uint64_t)"New connection from pid:%d", v11, v12, v13, v14, v15, v16, (uint64_t)v10);
  }

  if (qword_100022240 != -1) {
    dispatch_once(&qword_100022240, &stru_10001C768);
  }
  objc_initWeak(&buf, v7);
  [v7 setExportedInterface:qword_100022238];
  v17 = objc_opt_new(&OBJC_CLASS___MBHelperService);
  [v7 setExportedObject:v17];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100007868;
  v19[3] = &unk_10001C790;
  objc_copyWeak(&v20, &buf);
  v19[4] = self;
  [v7 setInvalidationHandler:v19];
  -[MBHelperServiceDelegate _addConnection:](self, "_addConnection:", v7);
  [v7 resume];
  objc_destroyWeak(&v20);

  objc_destroyWeak(&buf);
  return 1;
}

- (void)activate
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100007918;
  block[3] = &unk_10001C7B8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (void)idle
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000079A4;
  block[3] = &unk_10001C7B8;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)queue, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (int64_t)idleTimerSuspendCount
{
  return self->_idleTimerSuspendCount;
}

- (void)setIdleTimerSuspendCount:(int64_t)a3
{
  self->_idleTimerSuspendCount = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (NSMutableArray)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end