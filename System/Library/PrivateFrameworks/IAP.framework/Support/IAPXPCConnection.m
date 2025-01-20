@interface IAPXPCConnection
- (IAPXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4;
- (IAPXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4;
- (id)_initIAPXPCConnection:(id)a3;
- (id)copyReplyQueue;
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

@implementation IAPXPCConnection

- (id)_initIAPXPCConnection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___IAPXPCConnection;
  v4 = -[IAPXPCConnection init](&v7, "init");
  v5 = v4;
  if (!v4) {
    return v5;
  }
  *(_WORD *)&v4->isValid = 257;
  id result = dispatch_queue_create((const char *)[a3 UTF8String], 0);
  if (((unint64_t)&v5->_dispatchQueue & 7) == 0)
  {
    v5->_dispatchQueue = (OS_dispatch_queue *)result;
    return v5;
  }

  __break(0x5516u);
  return result;
}

- (IAPXPCConnection)initWithServiceName:(id)a3 queueName:(id)a4
{
  v4 = 0LL;
  if (!a3 || !a4) {
    return v4;
  }
  *(_WORD *)&self->isValid = 257;
  id result = (IAPXPCConnection *)[a3 UTF8String];
  if (result)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service((const char *)result, 0LL, 0LL);
    id result = -[IAPXPCConnection initWithXPCConnection:queueName:]( self,  "initWithXPCConnection:queueName:",  mach_service,  a4);
    if (mach_service)
    {
      v4 = result;
      xpc_release(mach_service);
      return v4;
    }
  }

  __break(0x5510u);
  return result;
}

- (IAPXPCConnection)initWithXPCConnection:(id)a3 queueName:(id)a4
{
  id result = -[IAPXPCConnection _initIAPXPCConnection:](self, "_initIAPXPCConnection:", a4);
  v6 = result;
  if (!result) {
    return v6;
  }
  *(_WORD *)&result->isValid = 257;
  if (!a3) {
    goto LABEL_7;
  }
  id result = (IAPXPCConnection *)xpc_retain(a3);
  if ((((int)v6 + 8) & 7LL) == 0)
  {
    v6->_connection = (OS_xpc_object *)result;
    -[IAPXPCConnection _reloadEventHandler](v6, "_reloadEventHandler");
    id result = (IAPXPCConnection *)v6->_connection;
    if (result)
    {
      xpc_connection_resume((xpc_connection_t)result);
      return v6;
    }

- (void)dealloc
{
  p_connection = &self->_connection;
  if (*p_connection) {
    xpc_release(*p_connection);
  }
  p_dispatchQueue = &self->_dispatchQueue;
  if (*p_dispatchQueue) {
    dispatch_release((dispatch_object_t)*p_dispatchQueue);
  }
  p_replyQueue = &self->_replyQueue;
  if (*p_replyQueue) {
    dispatch_release((dispatch_object_t)*p_replyQueue);
  }
  if ((((_BYTE)self + 24) & 7) != 0 || (self->_disconnectBlock, (((_BYTE)self + 40) & 7) != 0))
  {
LABEL_13:
    __break(0x5516u);
  }

  else
  {

    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___IAPXPCConnection;
    -[IAPXPCConnection dealloc](&v6, "dealloc");
  }

- (id)disconnectBlock
{
  uint64_t v5 = 0LL;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  v8 = sub_1000D11AC;
  v9 = sub_1000D11BC;
  uint64_t v10 = 0LL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    v2 = (dispatch_queue_s *)*((void *)self + 2);
    if (v2)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1000D11C8;
      v4[3] = &unk_10010A360;
      v4[4] = self;
      v4[5] = &v5;
      dispatch_sync(v2, v4);
      id v3 = (id)v6[5];
      _Block_object_dispose(&v5, 8);
      return v3;
    }
  }

  __break(0x5510u);
  return self;
}

- (id)messageBlock
{
  uint64_t v5 = 0LL;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  v8 = sub_1000D11AC;
  v9 = sub_1000D11BC;
  uint64_t v10 = 0LL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    v2 = (dispatch_queue_s *)*((void *)self + 2);
    if (v2)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1000D12EC;
      v4[3] = &unk_10010A360;
      v4[4] = self;
      v4[5] = &v5;
      dispatch_sync(v2, v4);
      id v3 = (id)v6[5];
      _Block_object_dispose(&v5, 8);
      return v3;
    }
  }

  __break(0x5510u);
  return self;
}

- (id)copyReplyQueue
{
  uint64_t v5 = 0LL;
  objc_super v6 = &v5;
  uint64_t v7 = 0x3052000000LL;
  v8 = sub_1000D13F0;
  v9 = sub_1000D1400;
  uint64_t v10 = 0LL;
  if ((((unint64_t)self + 16) & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    v2 = (dispatch_queue_s *)*((void *)self + 2);
    if (v2)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1000D140C;
      v4[3] = &unk_10010A388;
      v4[4] = self;
      v4[5] = &v5;
      dispatch_sync(v2, v4);
      id v3 = (void *)v6[5];
      _Block_object_dispose(&v5, 8);
      return v3;
    }
  }

  __break(0x5510u);
  return self;
}

- (void)sendMessage:(id)a3
{
  if (self->isValid >= 2u)
  {
    __break(0x550Au);
    goto LABEL_9;
  }

  if (self->isValid)
  {
    p_connection = &self->_connection;
    if (((unint64_t)&self->_connection & 7) == 0)
    {
      if (a3 && *p_connection)
      {
        xpc_connection_send_message(*p_connection, a3);
        return;
      }

      goto LABEL_10;
    }

- (void)sendMessage:(id)a3 withReply:(id)a4
{
  if (self->isValid)
  {
    if (((unint64_t)&self->_connection & 7) == 0)
    {
      if (!a3 || !self->_connection) {
        goto LABEL_11;
      }
      if (((unint64_t)&self->_replyQueue & 7) == 0)
      {
        if (a4)
        {
          xpc_connection_send_message_with_reply(self->_connection, a3, (dispatch_queue_t)self->_replyQueue, a4);
          return;
        }

        goto LABEL_11;
      }
    }

    __break(0x5516u);
LABEL_11:
    __break(0x5510u);
LABEL_12:
    __break(0x550Au);
  }

- (void)sendSynchronousMessage:(id)a3 withReply:(id)a4
{
  if (self->isValid)
  {
    p_connection = &self->_connection;
    if (((unint64_t)&self->_connection & 7) != 0)
    {
LABEL_13:
      __break(0x5516u);
      return;
    }

    if (a3 && *p_connection)
    {
      xpc_object_t v6 = xpc_connection_send_message_with_reply_sync(*p_connection, a3);
      if (a4) {
        (*((void (**)(id, xpc_object_t))a4 + 2))(a4, v6);
      }
      if (v6)
      {
        xpc_release(v6);
        return;
      }
    }

    __break(0x5510u);
LABEL_12:
    __break(0x550Au);
    goto LABEL_13;
  }

- (void)setDisconnectBlock:(id)a3
{
  if (((unint64_t)&self->_dispatchQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    if (dispatchQueue)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1000D15E0;
      v4[3] = &unk_10010A3B0;
      v4[4] = self;
      v4[5] = a3;
      dispatch_sync(dispatchQueue, v4);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setMessageBlock:(id)a3
{
  if (((unint64_t)&self->_dispatchQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    if (dispatchQueue)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1000D16C0;
      v4[3] = &unk_10010A3B0;
      v4[4] = self;
      v4[5] = a3;
      dispatch_sync(dispatchQueue, v4);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setReplyQueue:(id)a3
{
  if (((unint64_t)&self->_dispatchQueue & 7) != 0)
  {
    __break(0x5516u);
  }

  else
  {
    dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
    if (dispatchQueue)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472LL;
      v4[2] = sub_1000D17A0;
      v4[3] = &unk_100104538;
      v4[4] = self;
      v4[5] = a3;
      dispatch_sync(dispatchQueue, v4);
      return;
    }
  }

  __break(0x5510u);
}

- (void)setTargetQueue:(id)a3
{
  if ((((_BYTE)self + 16) & 7) != 0
    || (dispatch_set_target_queue((dispatch_object_t)self->_dispatchQueue, (dispatch_queue_t)a3),
        p_replyQueue = &self->_replyQueue,
        ((unint64_t)&self->_replyQueue & 7) != 0))
  {
    __break(0x5516u);
  }

  else if (*p_replyQueue)
  {
    dispatch_set_target_queue((dispatch_object_t)*p_replyQueue, (dispatch_queue_t)a3);
  }

- (void)_reloadEventHandler
{
  int v12 = 0;
  id v3 = (const __CFString *)MGCopyAnswerWithError(@"9UCjT7Qfi4xLVvPAKIzTCQ", 0LL, &v12);
  v4 = v3;
  if (v3) {
    BOOL v5 = v12 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5)
  {
    CFTypeID v6 = CFGetTypeID(v3);
    if (v6 == CFStringGetTypeID() && CFStringCompare(v4, @"NonUI", 0LL) == kCFCompareEqualTo) {
      self->retryInvalidConnections = 0;
    }
  }

  else if (!v3)
  {
    goto LABEL_11;
  }

  CFRelease(v4);
LABEL_11:
  if ((((_BYTE)self + 24) & 7) != 0
    || (((_BYTE)self + 40) & 7) != 0
    || (p_connection = &self->_connection, ((unint64_t)&self->_connection & 7) != 0))
  {
    __break(0x5516u);
  }

  else
  {
    v8 = *p_connection;
    if (*p_connection)
    {
      id disconnectBlock = self->_disconnectBlock;
      id messageBlock = self->_messageBlock;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_1000D1998;
      v11[3] = &unk_10010A400;
      v11[4] = self;
      v11[5] = disconnectBlock;
      v11[6] = messageBlock;
      xpc_connection_set_event_handler(v8, v11);
      return;
    }
  }

  __break(0x5510u);
}

@end