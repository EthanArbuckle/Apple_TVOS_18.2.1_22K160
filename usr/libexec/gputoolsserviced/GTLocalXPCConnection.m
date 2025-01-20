@interface GTLocalXPCConnection
- (BOOL)isTrusted;
- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4;
- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4;
- (OS_xpc_object)connection;
- (OS_xpc_object)error;
- (id)sendMessageWithReplySync:(id)a3;
- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4;
- (unint64_t)registerDispatcher:(id)a3;
- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4;
- (void)cancel;
- (void)deregisterDispatcher:(unint64_t)a3;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessageAndWaitForDelivery:(id)a3;
- (void)setError:(id)a3;
@end

@implementation GTLocalXPCConnection

- (GTLocalXPCConnection)initWithXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___GTLocalXPCConnection;
  v9 = -[GTLocalXPCConnection init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
  }

  return v10;
}

- (GTLocalXPCConnection)initWithTransactionScopedXPCConnection:(id)a3 messageQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___GTLocalXPCConnection;
  v9 = -[GTLocalXPCConnection init](&v16, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    dispatchers = v10->_dispatchers;
    v10->_dispatchers = v11;

    objc_storeStrong((id *)&v10->_messageQueue, a4);
    uint64_t v13 = os_transaction_create("com.apple.gputoolstransportd.local");
    transaction = v10->_transaction;
    v10->_transaction = (OS_os_transaction *)v13;
  }

  return v10;
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
  id v6 = a3;
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015BB8;
  block[3] = &unk_100030CD8;
  id v10 = v6;
  unint64_t v11 = a4;
  block[4] = self;
  id v8 = v6;
  dispatch_async((dispatch_queue_t)messageQueue, block);
}

- (unint64_t)registerDispatcher:(id)a3
{
  id v4 = a3;
  do
    unint64_t v5 = __ldaxr(&qword_10003DB50);
  while (__stlxr(v5 + 1, &qword_10003DB50));
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015CC8;
  block[3] = &unk_100030CD8;
  id v10 = v4;
  unint64_t v11 = v5;
  block[4] = self;
  id v7 = v4;
  dispatch_async((dispatch_queue_t)messageQueue, block);

  return v5;
}

- (void)deregisterDispatcher:(unint64_t)a3
{
  messageQueue = self->_messageQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100015D8C;
  v4[3] = &unk_100030D00;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async((dispatch_queue_t)messageQueue, v4);
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100015E9C;
  block[3] = &unk_100030D28;
  id v12 = v6;
  uint64_t v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)messageQueue, block);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100016130;
  handler[3] = &unk_100030D50;
  id v12 = v6;
  id v10 = v6;
  xpc_connection_send_message_with_reply(connection, a3, v8, handler);
}

- (id)sendMessageWithReplySync:(id)a3
{
  return xpc_connection_send_message_with_reply_sync(self->_connection, a3);
}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[GTLocalXPCConnection sendMessageWithReplySync:](self, "sendMessageWithReplySync:", a3));
  if (MessageIsValid(v5, a4)) {
    id v6 = v5;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  id v4 = dispatch_group_create();
  dispatch_group_enter(v4);
  connection = self->_connection;
  barrier[0] = _NSConcreteStackBlock;
  barrier[1] = 3221225472LL;
  barrier[2] = sub_1000162B4;
  barrier[3] = &unk_100030D78;
  id v9 = v4;
  id v6 = v4;
  xpc_connection_send_barrier(connection, barrier);
  dispatch_time_t v7 = dispatch_time(0LL, 1000000000LL);
  dispatch_group_wait(v6, v7);
}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  connection = self->_connection;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000163A4;
  v11[3] = &unk_100030DC8;
  objc_copyWeak(&v14, &location);
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  xpc_connection_set_event_handler(connection, v11);
  xpc_connection_activate(self->_connection);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)cancel
{
  messageQueue = self->_messageQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100016534;
  block[3] = &unk_100030D78;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)messageQueue, block);
}

- (BOOL)isTrusted
{
  return 1;
}

- (OS_xpc_object)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end