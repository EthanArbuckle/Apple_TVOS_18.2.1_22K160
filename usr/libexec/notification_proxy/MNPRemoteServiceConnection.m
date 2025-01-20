@interface MNPRemoteServiceConnection
- (MNPRemoteServiceConnection)initWithConnection:(id)a3;
- (NSString)description;
- (OS_dispatch_queue)queue;
- (OS_os_transaction)transaction;
- (void)cancel;
- (void)dealloc;
- (void)listen;
- (void)sendMessage:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTransaction:(id)a3;
- (void)shutdown;
@end

@implementation MNPRemoteServiceConnection

- (void)cancel
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___MNPRemoteServiceConnection;
  -[MNPRemoteServiceConnection dealloc](&v2, "dealloc");
}

- (MNPRemoteServiceConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MNPRemoteServiceConnection;
  v6 = -[MNPRemoteServiceConnection init](&v13, "init");
  if (v6)
  {
    uint64_t v7 = os_transaction_create("com.apple.mobile.notification_proxy");
    transaction = v6->_transaction;
    v6->_transaction = (OS_os_transaction *)v7;

    objc_storeStrong((id *)&v6->_conn, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.mobile.notification_proxy_io_queue", 0LL);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    xpc_remote_connection_set_target_queue(v6->_conn, v6->_queue);
    v11 = v6;
  }

  return v6;
}

- (void)sendMessage:(id)a3
{
  v4 = (void *)_CFXPCCreateXPCObjectFromCFObject(a3, a2);
  id v5 = v4;
  if (v4)
  {
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000048B0;
    v8[3] = &unk_100008330;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(queue, v8);
  }

  else
  {
    uint64_t v7 = (os_log_s *)qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Failed to convert dictionary to XPC message.",  buf,  2u);
    }
  }
}

- (void)shutdown
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004928;
  block[3] = &unk_100008358;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)listen
{
  conn = self->_conn;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000049F4;
  v4[3] = &unk_1000083D0;
  objc_copyWeak(&v5, &location);
  v4[4] = self;
  xpc_remote_connection_set_event_handler(conn, v4);
  xpc_remote_connection_activate(self->_conn);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (NSString)description
{
  return (NSString *)@"RemoteXPC";
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end