@interface FudXPCConnection
- (BOOL)createSession;
- (BOOL)registerForBSDNotifications;
- (FudXPCConnection)initWithClientName:(id)a3 replyHandlerQueue:(id)a4 messageHandler:(id)a5;
- (void)createConnection;
- (void)dealloc;
- (void)sendMessageToFud:(id)a3;
- (void)sendMessageToFud:(id)a3 reply:(id)a4;
- (void)stop;
@end

@implementation FudXPCConnection

- (FudXPCConnection)initWithClientName:(id)a3 replyHandlerQueue:(id)a4 messageHandler:(id)a5
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___FudXPCConnection;
  v8 = -[FudXPCConnection init](&v21, sel_init);
  v15 = v8;
  v8->connection = 0LL;
  if (!a3)
  {
    v18 = @"Can't create xpc connection without client name";
    goto LABEL_7;
  }

  if (!a5)
  {
    v18 = @"Can't create xpc connection without reply handler";
    goto LABEL_7;
  }

  if (!a4)
  {
    v18 = @"Can't create xpc connection without reply queue";
    goto LABEL_7;
  }

  v8->didStop = 0;
  v8->clientIdentifier = (NSString *)a3;
  v16 = _Block_copy(a5);
  v15->replyQueue = (OS_dispatch_queue *)a4;
  v15->messageHandler = v16;
  dispatch_retain((dispatch_object_t)a4);
  dispatch_queue_t v17 = dispatch_queue_create("com.apple.MobileAccessoryUpdater.FudXPCConnection.connection", 0LL);
  v15->connectionQueue = (OS_dispatch_queue *)v17;
  if (!v17)
  {
    v18 = @"Failed to create queue for xpc connection";
    goto LABEL_7;
  }

  v15->sessionQueue = (OS_dispatch_queue *)dispatch_queue_create( "com.apple.MobileAccessoryUpdater.FudXPCConnection.session",  0LL);
  if (!-[FudXPCConnection registerForBSDNotifications](v15, "registerForBSDNotifications"))
  {
    v18 = @"Failed to register for BSD notifications";
LABEL_7:
    FudLog(3, (uint64_t)v18, v9, v10, v11, v12, v13, v14, (uint64_t)v21.receiver);
    v19 = v15;
    return 0LL;
  }

  return v15;
}

- (void)dealloc
{
  sessionQueue = self->sessionQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__FudXPCConnection_dealloc__block_invoke;
  block[3] = &unk_18A200B30;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)sessionQueue, block);
  connection = self->connection;
  if (connection) {
    xpc_release(connection);
  }
  connectionQueue = self->connectionQueue;
  if (connectionQueue) {
    dispatch_release((dispatch_object_t)connectionQueue);
  }
  v6 = self->sessionQueue;
  if (v6) {
    dispatch_release((dispatch_object_t)v6);
  }
  id messageHandler = self->messageHandler;
  if (messageHandler) {
    _Block_release(messageHandler);
  }
  replyQueue = self->replyQueue;
  if (replyQueue) {
    dispatch_release((dispatch_object_t)replyQueue);
  }

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___FudXPCConnection;
  -[FudXPCConnection dealloc](&v9, sel_dealloc);
}

void __27__FudXPCConnection_dealloc__block_invoke(uint64_t a1)
{
  v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 16LL);
  if (v2) {
    xpc_connection_cancel(v2);
  }
}

- (BOOL)registerForBSDNotifications
{
  objc_super v9 = -[NSString cStringUsingEncoding:](self->clientIdentifier, "cStringUsingEncoding:", 4LL);
  if (!v9)
  {
    dispatch_queue_t v17 = @"Failed to get c string identifier";
    goto LABEL_4;
  }

  connectionQueue = self->connectionQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __47__FudXPCConnection_registerForBSDNotifications__block_invoke;
  handler[3] = &unk_18A200CD8;
  handler[4] = self;
  if (notify_register_dispatch(v9, &self->notifyToken, (dispatch_queue_t)connectionQueue, handler))
  {
    dispatch_queue_t v17 = @"Failed to register for BSD notifications";
LABEL_4:
    FudLog(3, (uint64_t)v17, v10, v11, v12, v13, v14, v15, v19);
    return 0;
  }

  return 1;
}

uint64_t __47__FudXPCConnection_registerForBSDNotifications__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  return [*(id *)(a1 + 32) createSession];
}

- (void)createConnection
{
  if (self->didStop)
  {
    FudLog(3, (uint64_t)@"Can't create connection after it was explicitly stopped", v2, v3, v4, v5, v6, v7, v13);
  }

  else
  {
    FudLog(7, (uint64_t)@"Connecting to fud...", v2, v3, v4, v5, v6, v7, v11);
    mach_service = xpc_connection_create_mach_service( "com.apple.MobileAccessoryUpdater",  (dispatch_queue_t)self->connectionQueue,  0LL);
    uint64_t v10 = MEMORY[0x1895F87A8];
    self->connection = mach_service;
    handler[0] = v10;
    handler[1] = 3221225472LL;
    handler[2] = __36__FudXPCConnection_createConnection__block_invoke;
    handler[3] = &unk_18A200D28;
    handler[4] = self;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(self->connection);
  }

void __36__FudXPCConnection_createConnection__block_invoke(uint64_t a1, uint64_t a2)
{
  if (MEMORY[0x1895BDC78](a2) == MEMORY[0x1895F9268])
  {
    FudLog(3, (uint64_t)@"Lost connection to fud...", v4, v5, v6, v7, v8, v9, v13[0]);
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 16LL);
    if (v12)
    {
      xpc_release(v12);
      *(void *)(*(void *)(a1 + 32) + 16LL) = 0LL;
    }
  }

  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(dispatch_queue_s **)(v10 + 40);
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = (uint64_t)__36__FudXPCConnection_createConnection__block_invoke_2;
    v13[3] = (uint64_t)&unk_18A200D00;
    v13[4] = v10;
    v13[5] = a2;
    dispatch_async(v11, v13);
  }

uint64_t __36__FudXPCConnection_createConnection__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 48LL) + 16LL))();
}

- (BOOL)createSession
{
  if (!self->connection)
  {
    -[FudXPCConnection createConnection](self, "createConnection");
    if (!self->connection)
    {
      v40 = @"Can't perform operation without valid connection to fud";
LABEL_17:
      FudLog(3, (uint64_t)v40, v3, v4, v5, v6, v7, v8, v42);
LABEL_19:
      LOBYTE(v15) = 0;
      return (char)v15;
    }
  }

  uint64_t v15 = -[NSString cStringUsingEncoding:](self->clientIdentifier, "cStringUsingEncoding:", 4LL);
  if (!v15)
  {
    FudLog(3, (uint64_t)@"Can't create session with out c identifier", v9, v10, v11, v12, v13, v14, v42);
    return (char)v15;
  }

  xpc_object_t v16 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v16)
  {
    v40 = @"Failed to create xpc dictionary for session";
    goto LABEL_17;
  }

  dispatch_queue_t v17 = v16;
  xpc_dictionary_set_int64(v16, "Command", 107LL);
  xpc_dictionary_set_string(v17, "ClientIdentifier", v15);
  xpc_object_t v18 = xpc_connection_send_message_with_reply_sync(self->connection, v17);
  if (!v18)
  {
    FudLog(3, (uint64_t)@"NULL reply from session request", v19, v20, v21, v22, v23, v24, v42);
    xpc_release(v17);
    goto LABEL_19;
  }

  v25 = v18;
  if (xpc_dictionary_get_int64(v18, "Response") != 107)
  {
    v41 = @"Invalid response operation to session request!";
LABEL_22:
    FudLog(3, (uint64_t)v41, v26, v27, v28, v29, v30, v31, v42);
    LOBYTE(v15) = 0;
    goto LABEL_11;
  }

  if (!xpc_dictionary_get_BOOL(v25, "Status"))
  {
    v41 = @"No operation status in response";
    goto LABEL_22;
  }

  uint64_t v32 = objectFromXpcDictionary(v25, "Error");
  if (!v32)
  {
    LOBYTE(v15) = 1;
LABEL_11:
    xpc_release(v17);
    goto LABEL_12;
  }

  uint64_t v15 = (char *)v32;
  FudLog(3, (uint64_t)@"Failed to create session: %@", v33, v34, v35, v36, v37, v38, v32);
  xpc_release(v17);

  LOBYTE(v15) = 1;
LABEL_12:
  xpc_release(v25);
  return (char)v15;
}

- (void)stop
{
  connection = self->connection;
  if (connection) {
    xpc_connection_cancel(connection);
  }
  self->didStop = 1;
}

- (void)sendMessageToFud:(id)a3
{
  connection = self->connection;
  if (connection
    || (-[FudXPCConnection createConnection](self, "createConnection"), (connection = self->connection) != 0LL))
  {
    xpc_connection_send_message(connection, a3);
  }

  else
  {
    FudLog(3, (uint64_t)@"Can't send message without connection", v6, v7, v8, v9, v10, v11, v12);
  }

- (void)sendMessageToFud:(id)a3 reply:(id)a4
{
  connection = self->connection;
  if (connection
    || (-[FudXPCConnection createConnection](self, "createConnection"), (connection = self->connection) != 0LL))
  {
    if (a3)
    {
      if (a4)
      {
        xpc_connection_send_message_with_reply(connection, a3, (dispatch_queue_t)self->replyQueue, a4);
        return;
      }

      uint64_t v12 = @"Can't send message with NULL reply handler";
    }

    else
    {
      uint64_t v12 = @"Can't send a NULL message";
    }
  }

  else
  {
    uint64_t v12 = @"Can't send message without connection";
  }

  FudLog(3, (uint64_t)v12, (uint64_t)a3, (uint64_t)a4, v4, v5, v6, v7, v13);
}

@end