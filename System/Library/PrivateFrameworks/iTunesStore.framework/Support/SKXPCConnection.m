@interface SKXPCConnection
- (SKXPCConnection)init;
- (SKXPCConnection)initWithServiceName:(id)a3;
- (SKXPCConnection)initWithXPCConnection:(id)a3;
- (id)_initSKXPCConnection;
- (id)createXPCEndpoint;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
@end

@implementation SKXPCConnection

- (id)_initSKXPCConnection
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SKXPCConnection;
  v2 = -[SKXPCConnection init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreKit.SKXPCConnection", 0LL);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

- (SKXPCConnection)init
{
  return -[SKXPCConnection initWithServiceName:](self, "initWithServiceName:", 0LL);
}

- (SKXPCConnection)initWithServiceName:(id)a3
{
  if (a3) {
    v4 = (const char *)[a3 UTF8String];
  }
  else {
    v4 = 0LL;
  }
  xpc_connection_t v5 = xpc_connection_create(v4, 0LL);
  xpc_connection_set_legacy();
  objc_super v6 = -[SKXPCConnection initWithXPCConnection:](self, "initWithXPCConnection:", v5);

  return v6;
}

- (SKXPCConnection)initWithXPCConnection:(id)a3
{
  id v5 = a3;
  objc_super v6 = -[SKXPCConnection _initSKXPCConnection](self, "_initSKXPCConnection");
  v7 = (SKXPCConnection *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, a3);
    -[SKXPCConnection _reloadEventHandler](v7, "_reloadEventHandler");
    xpc_connection_resume(v7->_connection);
  }

  return v7;
}

- (id)createXPCEndpoint
{
  return xpc_endpoint_create(self->_connection);
}

- (id)disconnectBlock
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1001800D8;
  v10 = sub_100180100;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100180108;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)messageBlock
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = sub_1001800D8;
  v10 = sub_100180100;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001801F4;
  v5[3] = &unk_10034AFE0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  connection = self->_connection;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  xpc_connection_send_message_with_reply(connection, a3, v8, a4);
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100180358;
  v10[3] = &unk_100350800;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  id v12 = v6;
  uint64_t v8 = v11;
  id v9 = v6;
  -[SKXPCConnection sendMessage:withReply:](self, "sendMessage:withReply:", v7, v10);

  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)setDisconnectBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100180400;
  block[3] = &unk_10034ACE0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (void)setMessageBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001804CC;
  block[3] = &unk_10034ACE0;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

- (void)_reloadEventHandler
{
  id v3 = objc_retainBlock(self->_disconnectBlock);
  id v4 = objc_retainBlock(self->_messageBlock);
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001805C4;
  v8[3] = &unk_100350850;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  xpc_connection_set_event_handler(connection, v8);
}

- (void).cxx_destruct
{
}

@end