@interface ACCXPCConnection
- (ACCXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4;
- (ACCXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4;
- (id)_initACCXPCConnection:(id)a3;
- (id)disconnectBlock;
- (id)messageBlock;
- (void)_reloadEventHandler;
- (void)dealloc;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 withReply:(id)a4;
- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4;
- (void)setDisconnectBlock:(id)a3;
- (void)setMessageBlock:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation ACCXPCConnection

- (id)_initACCXPCConnection:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCXPCConnection;
  v5 = -[ACCXPCConnection init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->isValid = 257;
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;
  }

  return v6;
}

- (ACCXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4
{
  id v4 = self;
  v5 = 0LL;
  if (a3 && a4)
  {
    *(_WORD *)&self->isValid = 257;
    id v7 = a3;
    id v8 = a4;
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)[v7 UTF8String], 0, 0);
    objc_super v10 = -[ACCXPCConnection initWithXPCConnection:queueName:](v4, "initWithXPCConnection:queueName:", mach_service, v8);

    id v4 = v10;
    v5 = v4;
  }

  return v5;
}

- (ACCXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4
{
  id v7 = a3;
  id v8 = -[ACCXPCConnection _initACCXPCConnection:](self, "_initACCXPCConnection:", a4);
  v9 = v8;
  if (v8)
  {
    *(_WORD *)&v8->isValid = 257;
    objc_storeStrong((id *)&v8->_connection, a3);
    -[ACCXPCConnection _reloadEventHandler](v9, "_reloadEventHandler");
    xpc_connection_resume(v9->_connection);
  }

  return v9;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ACCXPCConnection;
  -[ACCXPCConnection dealloc](&v2, "dealloc");
}

- (id)disconnectBlock
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy_;
  objc_super v10 = __Block_byref_object_dispose_;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __35__ACCXPCConnection_disconnectBlock__block_invoke;
  v5[3] = &unk_1001FAD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __35__ACCXPCConnection_disconnectBlock__block_invoke(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 24LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)messageBlock
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  v9 = __Block_byref_object_copy_;
  objc_super v10 = __Block_byref_object_dispose_;
  id v11 = 0LL;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __32__ACCXPCConnection_messageBlock__block_invoke;
  v5[3] = &unk_1001FAD20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dispatchQueue, v5);
  id v3 = objc_retainBlock((id)v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__ACCXPCConnection_messageBlock__block_invoke(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(*(void *)(a1 + 32) + 40LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)sendMessage:(id)a3
{
  if (self->isValid) {
    xpc_connection_send_message(self->_connection, a3);
  }
}

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  if (self->isValid) {
    xpc_connection_send_message_with_reply(self->_connection, a3, (dispatch_queue_t)self->_replyQueue, a4);
  }
}

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  uint64_t v6 = (void (**)(id, xpc_object_t))a4;
  if (self->isValid)
  {
    uint64_t v8 = v6;
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(self->_connection, a3);
    if (v8) {
      v8[2](v8, v7);
    }

    uint64_t v6 = v8;
  }
}

- (void)setDisconnectBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__ACCXPCConnection_setDisconnectBlock___block_invoke;
  block[3] = &unk_1001FAD48;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

id __39__ACCXPCConnection_setDisconnectBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id result = *(id *)(a1 + 40);
  if (*(id *)(v3 + 24) != result)
  {
    id v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;

    return [*(id *)(a1 + 32) _reloadEventHandler];
  }

  return result;
}

- (void)setMessageBlock:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __36__ACCXPCConnection_setMessageBlock___block_invoke;
  block[3] = &unk_1001FAD48;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

id __36__ACCXPCConnection_setMessageBlock___block_invoke(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id result = *(id *)(a1 + 40);
  if (*(id *)(v3 + 40) != result)
  {
    id v4 = [result copy];
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    return [*(id *)(a1 + 32) _reloadEventHandler];
  }

  return result;
}

- (void)setReplyQueue:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __34__ACCXPCConnection_setReplyQueue___block_invoke;
  block[3] = &unk_1001F9798;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(dispatchQueue, block);
}

void __34__ACCXPCConnection_setReplyQueue___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v5 = *(void **)(v2 + 32);
  id v4 = (id *)(v2 + 32);
  if (v5 != v3) {
    objc_storeStrong(v4, v3);
  }
}

- (void)setTargetQueue:(id)a3
{
  queue = (dispatch_queue_s *)a3;
  dispatch_set_target_queue((dispatch_object_t)self->_dispatchQueue, queue);
  replyQueue = (dispatch_object_s *)self->_replyQueue;
  if (replyQueue) {
    dispatch_set_target_queue(replyQueue, queue);
  }
}

- (void)_reloadEventHandler
{
  id v3 = objc_retainBlock(self->_disconnectBlock);
  id v4 = objc_retainBlock(self->_messageBlock);
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = __39__ACCXPCConnection__reloadEventHandler__block_invoke;
  handler[3] = &unk_1001FAD98;
  handler[4] = self;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  xpc_connection_set_event_handler(connection, handler);
}

void __39__ACCXPCConnection__reloadEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == &_xpc_error_connection_invalid)
  {
    *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 0;
  }

  else if (v3 != &_xpc_error_connection_interrupted)
  {
    if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472LL;
      v9[2] = __39__ACCXPCConnection__reloadEventHandler__block_invoke_2;
      v9[3] = &unk_1001FAD70;
      id v7 = *(void **)(a1 + 40);
      v9[4] = *(void *)(a1 + 32);
      id v11 = v7;
      id v12 = *(id *)(a1 + 48);
      id v8 = v4;
      id v10 = v8;
      xpc_connection_set_event_handler((xpc_connection_t)v8, v9);
      xpc_connection_resume((xpc_connection_t)v8);
    }

    else if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5) {
        (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v4, *(void *)(*(void *)(a1 + 32) + 8LL));
      }
    }

    goto LABEL_12;
  }

  if (*(_BYTE *)(*(void *)(a1 + 32) + 49LL))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
  }

void __39__ACCXPCConnection__reloadEventHandler__block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 == &_xpc_error_connection_invalid)
  {
    *(_BYTE *)(a1[4] + 48LL) = 0;
    goto LABEL_6;
  }

  if (v3 == &_xpc_error_connection_interrupted)
  {
LABEL_6:
    if (*(_BYTE *)(a1[4] + 49LL))
    {
      uint64_t v5 = a1[6];
      if (v5) {
        goto LABEL_8;
      }
    }

    goto LABEL_9;
  }

  uint64_t v5 = a1[7];
  if (v5)
  {
LABEL_8:
    uint64_t v6 = v4;
    (*(void (**)(void))(v5 + 16))();
    id v4 = v6;
  }

- (void).cxx_destruct
{
}

@end