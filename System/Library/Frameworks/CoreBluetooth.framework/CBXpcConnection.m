@interface CBXpcConnection
- (CBXpcConnection)initWithDelegate:(id)a3 queue:(id)a4 options:(id)a5 sessionType:(int)a6;
- (CBXpcConnectionDelegate)delegate;
- (id)_allocXpcMsg:(unsigned __int16)a3 args:(id)a4;
- (id)_nameForMessage:(unsigned __int16)a3;
- (id)getEventQueue;
- (id)getWhbLocalIdForRemoteId:(id)a3;
- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4;
- (void)_applicationDidEnterBackgroundNotification;
- (void)_applicationWillEnterForegroundNotification;
- (void)_checkIn;
- (void)_checkOut;
- (void)_handleConnectionEvent:(id)a3;
- (void)_handleFinalized;
- (void)_handleInvalid;
- (void)_handleMsg:(id)a3;
- (void)_handleReset;
- (void)_sendBarrier;
- (void)connect;
- (void)didReceiveForwardedDelegateCallbackMessage:(id)a3;
- (void)didReceiveForwardedMessage:(id)a3;
- (void)disconnect;
- (void)forwardWhbMsg:(unsigned __int16)a3 args:(id)a4 cnx:(id)a5;
- (void)removeWhbRemoteId:(id)a3;
- (void)sendMsg:(unsigned __int16)a3 args:(id)a4;
- (void)sendMsgWithReply:(unsigned __int16)a3 args:(id)a4 replyBlock:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4;
- (void)setWhbReplyHandler:(id)a3;
@end

@implementation CBXpcConnection

- (CBXpcConnection)initWithDelegate:(id)a3 queue:(id)a4 options:(id)a5 sessionType:(int)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___CBXpcConnection;
  v13 = -[CBXpcConnection init](&v46, sel_init);
  if (v13)
  {
    v14 = v13;
    if (v11)
    {
      v15 = (dispatch_queue_s *)v11;
    }

    else
    {
      v15 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
      id v17 = MEMORY[0x1895F8AE0];
    }

    objc_storeWeak((id *)&v14->_delegate, v10);
    if (MGGetBoolAnswer())
    {
      v18 = "com.apple.server.bluetooth.le.att.xpc";
      if (a6 == 3) {
        v18 = "com.apple.server.bluetooth.classic.xpc";
      }
      if (a6 == 2) {
        v19 = "com.apple.server.bluetooth.le.pipe.xpc";
      }
      else {
        v19 = v18;
      }
      label = dispatch_queue_get_label(v15);
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v22 = dispatch_queue_create_with_target_V2(label, v21, v15);
      eventQueue = v14->_eventQueue;
      v14->_eventQueue = (OS_dispatch_queue *)v22;

      if (v12) {
        v24 = (NSMutableDictionary *)[v12 mutableCopy];
      }
      else {
        v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
      }
      options = v14->_options;
      v14->_options = v24;

      v14->_sessionType = a6;
      int relative_priority_ptr = 0;
      dispatch_qos_class_t qos_class = dispatch_queue_get_qos_class(v15, &relative_priority_ptr);
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v27, qos_class, relative_priority_ptr);
      v28 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

      v29 = (void *)dispatch_workloop_copy_current();
      v30 = v29;
      if (v29)
      {
        v31 = v29;
        xpcQueue = v14->_xpcQueue;
        v14->_xpcQueue = v31;
      }

      else
      {
        [NSString stringWithFormat:@"com.apple.CoreBluetooth.%@", objc_opt_class()];
        xpcQueue = (OS_dispatch_queue *) objc_claimAutoreleasedReturnValue();
        dispatch_queue_t v33 = dispatch_queue_create((const char *)-[OS_dispatch_queue UTF8String](xpcQueue, "UTF8String"), v28);
        v34 = v14->_xpcQueue;
        v14->_xpcQueue = (OS_dispatch_queue *)v33;
      }

      xpc_connection_t mach_service = xpc_connection_create_mach_service(v19, (dispatch_queue_t)v14->_xpcQueue, 0LL);
      xpcConnection = v14->_xpcConnection;
      v14->_xpcConnection = mach_service;

      v14->_uiAppIsBackgrounded = 0;
      if (NSClassFromString(@"UIApplication"))
      {
        [MEMORY[0x189607958] defaultCenter];
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        [v37 addObserver:v14 selector:sel__applicationDidEnterBackgroundNotification name:@"UIApplicationDidEnterBackgroundNotification" object:0];

        [MEMORY[0x189607958] defaultCenter];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        [v38 addObserver:v14 selector:sel__applicationWillEnterForegroundNotification name:@"UIApplicationWillEnterForegroundNotification" object:0];
      }

      v39 = v14->_xpcConnection;
      handler[0] = MEMORY[0x1895F87A8];
      handler[1] = 3221225472LL;
      handler[2] = __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke;
      handler[3] = &unk_189FB1EA0;
      v16 = v14;
      v44 = v16;
      xpc_connection_set_event_handler(v39, handler);
      xpc_connection_resume(v14->_xpcConnection);
      v16->_xpcConnectionConnected = 0;
    }

    else
    {
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke_2;
      block[3] = &unk_189FB1AE0;
      v42 = v14;
      dispatch_async(v15, block);

      v16 = 0LL;
    }
  }

  else
  {
    v16 = 0LL;
  }

  return v16;
}

uint64_t __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) _handleConnectionEvent:a2];
}

void __62__CBXpcConnection_initWithDelegate_queue_options_sessionType___block_invoke_2(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 xpcConnectionIsInvalid];
}

- (id)getEventQueue
{
  return self->_eventQueue;
}

- (void)sendMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = -[CBXpcConnection _allocXpcMsg:args:](self, "_allocXpcMsg:args:", v4, v6);
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    v9 = v8;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_debug_impl(&dword_186F9B000, v9, OS_LOG_TYPE_DEBUG, "Sending XPC message %@: %@", (uint8_t *)&v11, 0x16u);

    xpc_connection_send_message(self->_xpcConnection, v7);
    if (!self->_uiAppIsBackgrounded) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  xpc_connection_send_message(self->_xpcConnection, v7);
  if (self->_uiAppIsBackgrounded) {
LABEL_5:
  }
    -[CBXpcConnection _sendBarrier](self, "_sendBarrier");
LABEL_6:
}

- (id)sendSyncMsg:(unsigned __int16)a3 args:(id)a4
{
  uint64_t v4 = a3;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = (OS_dispatch_queue *)a4;
  id v7 = -[CBXpcConnection _allocXpcMsg:args:](self, "_allocXpcMsg:args:", v4, v6);
  if ((_DWORD)v4 != 63)
  {
    if (CBLogInitOnce == -1)
    {
      id v12 = (void *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }

    else
    {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      id v12 = (void *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_8;
      }
    }

    v9 = v12;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v4);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    int v20 = 138412546;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_debug_impl( &dword_186F9B000,  v9,  OS_LOG_TYPE_DEBUG,  "Sending synchronous XPC message %@: %@",  (uint8_t *)&v20,  0x16u);
    goto LABEL_5;
  }

  if (CBLogInitOnce == -1)
  {
    v8 = (void *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }

  dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  v8 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
LABEL_4:
    v9 = v8;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", 63LL);
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    xpcQueue = self->_xpcQueue;
    int v20 = 138412803;
    v21 = v10;
    __int16 v22 = 2112;
    v23 = xpcQueue;
    __int16 v24 = 2113;
    v25 = v6;
    _os_log_impl( &dword_186F9B000,  v9,  OS_LOG_TYPE_DEFAULT,  "Sending synchronous XPC message %@ : on %@ with args: %{private}@",  (uint8_t *)&v20,  0x20u);
LABEL_5:
  }

- (void)sendMsgWithReply:(unsigned __int16)a3 args:(id)a4 replyBlock:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  id v10 = -[CBXpcConnection _allocXpcMsg:args:](self, "_allocXpcMsg:args:", v6, v8);
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  int v11 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v11;
    v16 = -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v6);
    *(_DWORD *)buf = 138412546;
    int v20 = v16;
    __int16 v21 = 2112;
    id v22 = v8;
    _os_log_debug_impl(&dword_186F9B000, v15, OS_LOG_TYPE_DEBUG, "Sending XPC message w/ reply %@: %@", buf, 0x16u);
  }

  xpcConnection = self->_xpcConnection;
  eventQueue = (dispatch_queue_s *)self->_eventQueue;
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __52__CBXpcConnection_sendMsgWithReply_args_replyBlock___block_invoke;
  handler[3] = &unk_189FB2B28;
  id v18 = v9;
  id v14 = v9;
  xpc_connection_send_message_with_reply(xpcConnection, v10, eventQueue, handler);
}

void __52__CBXpcConnection_sendMsgWithReply_args_replyBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  CUXPCDecodeNSErrorIfNeeded();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = *(void *)(a1 + 32);
  CBXpcCreateNSDictionaryWithXpcDictionary(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v5, v6);
}

- (void)forwardWhbMsg:(unsigned __int16)a3 args:(id)a4 cnx:(id)a5
{
  uint64_t v6 = a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  xpc_object_t v9 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned int v10 = convertToWhbMsgId(v6);
  if (v10)
  {
    xpc_dictionary_set_int64(v9, "kCBMsgId", v10);
    if (v7)
    {
      [MEMORY[0x189603FC8] dictionaryWithDictionary:v7];
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
      [v8 peerDevice];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 identifier];
      xpc_object_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setValue:v13 forKey:@"kCBMsgArgDeviceUUID"];

      CBXpcCreateXPCDictionaryWithNSDictionary(v11);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v9, "kCBMsgArgs", v14);
    }

    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint64_t v15 = (os_log_s *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      xpc_object_t v17 = v9;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl( &dword_186F9B000,  v15,  OS_LOG_TYPE_DEFAULT,  "Forwarding WHB XPC message %@: %@",  (uint8_t *)&v16,  0x16u);
    }

    [v8 xpcForwardMessage:v9];
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBXpcConnection forwardWhbMsg:args:cnx:].cold.1();
    }
  }
}

- (void)didReceiveForwardedMessage:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int16 int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  uint64_t v6 = convertToCBMsgId(int64);
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    xpc_dictionary_get_value(v4, "kCBMsgArgs");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_object_t v9 = v8;
    if (v8)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      int v11 = (void *)[v10 mutableCopy];
      [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          [v11 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
          uint64_t v15 = (void *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDString:v14];
          [v11 setValue:v15 forKey:@"kCBMsgArgDeviceUUID"];
        }

        id v16 = v11;
      }

      else
      {
        id v16 = v10;
      }
    }

    else
    {
      id v16 = 0LL;
    }

    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    xpc_object_t v17 = (void *)CBLogComponent;
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
    {
      __int16 v18 = v17;
      -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v7);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v20 = 138412546;
      __int16 v21 = v19;
      __int16 v22 = 2112;
      id v23 = v16;
      _os_log_debug_impl( &dword_186F9B000,  v18,  OS_LOG_TYPE_DEBUG,  "WHB forwarded (Initiator->Receiver bluetoothd) msg %@, args %@",  (uint8_t *)&v20,  0x16u);
    }

    -[CBXpcConnection sendMsg:args:](self, "sendMsg:args:", v7, v16);
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBXpcConnection didReceiveForwardedMessage:].cold.1();
    }
  }
}

- (void)didReceiveForwardedDelegateCallbackMessage:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL);
  __int16 int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  uint64_t v7 = convertToCBMsgId(int64);
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
    xpc_dictionary_set_int64(v5, "kCBMsgId", v7);
    xpc_dictionary_get_value(v4, "kCBMsgArgs");
    xpc_object_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v9;
    if (v9)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v9);
      int v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 valueForKey:@"kCBMsgArgDeviceUUID"];
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CBXpcConnection getWhbLocalIdForRemoteId:](self, "getWhbLocalIdForRemoteId:");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_object_t v13 = (void *)[v11 mutableCopy];
      [v13 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
      [v13 setValue:v12 forKey:@"kCBMsgArgDeviceUUID"];
      CBXpcCreateXPCDictionaryWithNSDictionary(v13);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v5, "kCBMsgArgs", v14);
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      uint64_t v15 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        id v16 = v15;
        -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", v8);
        xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        int v20 = v17;
        __int16 v21 = 2112;
        __int16 v22 = v13;
        _os_log_debug_impl( &dword_186F9B000,  v16,  OS_LOG_TYPE_DEBUG,  "WHB reply (Receiver->Initiator) msg %@ %@",  buf,  0x16u);
      }
    }

    -[CBXpcConnection _handleMsg:](self, "_handleMsg:", v5);
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      -[CBXpcConnection didReceiveForwardedDelegateCallbackMessage:].cold.1();
    }
  }
}

- (void)setWhbReplyHandler:(id)a3
{
  id v4 = a3;
  id location = 0LL;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __38__CBXpcConnection_setWhbReplyHandler___block_invoke;
  v8[3] = &unk_189FB4870;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x18959F890](v8);
  id whbReplyHandler = self->_whbReplyHandler;
  self->_id whbReplyHandler = v6;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __38__CBXpcConnection_setWhbReplyHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  unsigned __int16 int64 = xpc_dictionary_get_int64(v3, "kCBMsgId");
  uint64_t v6 = convertToWhbMsgId(int64);
  if ((_DWORD)v6)
  {
    uint64_t v7 = v6;
    xpc_dictionary_set_int64(v4, "kCBMsgId", v6);
    xpc_dictionary_get_value(v3, "kCBMsgArgs");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if (v8)
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v8);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      int v11 = (void *)[v10 mutableCopy];
      [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        [v10 valueForKey:@"kCBMsgArgDeviceUUID"];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          [v11 removeObjectForKey:@"kCBMsgArgDeviceUUID"];
          [v14 UUIDString];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 setValue:v15 forKey:@"kCBMsgArgDeviceUUID"];
        }

        id v16 = v11;
      }

      else
      {
        id v16 = v10;
      }

      CBXpcCreateXPCDictionaryWithNSDictionary(v16);
      xpc_object_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_dictionary_set_value(v4, "kCBMsgArgs", v17);
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      __int16 v18 = (void *)CBLogComponent;
      if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
      {
        id v19 = v18;
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained _nameForMessage:v7];
        __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
        int v22 = 138412546;
        uint64_t v23 = v21;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_debug_impl( &dword_186F9B000,  v19,  OS_LOG_TYPE_DEBUG,  "WhbReplyHandler w/ msgId %@ args %@",  (uint8_t *)&v22,  0x16u);
      }
    }

    else
    {
      id v16 = 0LL;
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      __38__CBXpcConnection_setWhbReplyHandler___block_invoke_cold_1();
    }
  }
}

- (void)setWhbLocalId:(id)a3 forRemoteId:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if (!self->_whbRemoteToLocalUuidMap)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    whbRemoteToLocalUuidMap = self->_whbRemoteToLocalUuidMap;
    self->_whbRemoteToLocalUuidMap = v8;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v10 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( &dword_186F9B000,  v10,  OS_LOG_TYPE_DEFAULT,  "Started tracking Whb localId %@ with remoteId %@",  (uint8_t *)&v11,  0x16u);
  }

  -[NSMutableDictionary setValue:forKey:](self->_whbRemoteToLocalUuidMap, "setValue:forKey:", v6, v7);
}

- (id)getWhbLocalIdForRemoteId:(id)a3
{
  return (id)-[NSMutableDictionary valueForKey:](self->_whbRemoteToLocalUuidMap, "valueForKey:", a3);
}

- (void)removeWhbRemoteId:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  id v5 = (os_log_s *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_186F9B000, v5, OS_LOG_TYPE_DEFAULT, "Removing tracking of remoteId %@", (uint8_t *)&v6, 0xCu);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_whbRemoteToLocalUuidMap, "removeObjectForKey:", v4);
}

- (void)connect
{
  if (!self->_xpcConnectionConnected)
  {
    self->_xpcConnectionConnected = 1;
    -[CBXpcConnection _checkIn](self, "_checkIn");
    -[NSMutableDictionary removeObjectForKey:]( self->_options,  "removeObjectForKey:",  @"kCBInitOptionShowPowerAlert");
  }

- (void)disconnect
{
  id whbReplyHandler = self->_whbReplyHandler;
  self->_id whbReplyHandler = 0LL;

  [MEMORY[0x189607958] defaultCenter];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 removeObserver:self];
}

- (void)setTargetQueue:(id)a3
{
  xpcQueue = (dispatch_queue_s *)a3;
  if (!a3) {
    xpcQueue = (dispatch_queue_s *)self->_xpcQueue;
  }
  xpcConnection = self->_xpcConnection;
  id v5 = a3;
  xpc_connection_set_target_queue(xpcConnection, xpcQueue);
}

- (void)_checkIn
{
  v12[4] = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896077F8] mainBundle];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 bundleIdentifier];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }

  else
  {
    [NSString stringWithUTF8String:getprogname()];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v7 = v6;

  options = self->_options;
  v11[0] = @"kCBMsgArgOptions";
  v11[1] = @"kCBMsgArgName";
  v12[0] = options;
  v12[1] = v7;
  v11[2] = @"kCBMsgArgType";
  [MEMORY[0x189607968] numberWithUnsignedInt:self->_sessionType];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = @"kCBMsgArgVersion";
  v12[2] = v9;
  v12[3] = &unk_189FD5D10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:v11 count:4];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CBXpcConnection sendMsg:args:](self, "sendMsg:args:", 1LL, v10);
}

- (void)_checkOut
{
}

- (void)_sendBarrier
{
}

uint64_t __31__CBXpcConnection__sendBarrier__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)_nameForMessage:(unsigned __int16)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringValue];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_allocXpcMsg:(unsigned __int16)a3 args:(id)a4
{
  unsigned int v4 = a3;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  *(_OWORD *)keys = xmmword_189FB4890;
  id v10 = 0LL;
  xpc_object_t v9 = xpc_int64_create(v4);
  if (v5)
  {
    CBXpcCreateXPCDictionaryWithNSDictionary(v5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    size_t v6 = 2LL;
  }

  else
  {
    size_t v6 = 1LL;
  }

  xpc_object_t v7 = xpc_dictionary_create((const char *const *)keys, &v9, v6);

  return v7;
}

- (void)_handleMsg:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unsigned __int16 int64 = xpc_dictionary_get_int64(v4, "kCBMsgId");
  xpc_dictionary_get_value(v4, "kCBMsgArgs");
  size_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_object_t v7 = v6;
  if (v6)
  {
    CBXpcCreateNSDictionaryWithXpcDictionary(v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  if (CBLogInitOnce != -1) {
    dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
  }
  xpc_object_t v9 = (void *)CBLogComponent;
  if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v9;
    -[CBXpcConnection _nameForMessage:](self, "_nameForMessage:", int64);
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    __int16 v18 = v11;
    __int16 v19 = 2112;
    int v20 = v8;
    _os_log_debug_impl(&dword_186F9B000, v10, OS_LOG_TYPE_DEBUG, "Received XPC message %@: %@", buf, 0x16u);

LABEL_11:
    eventQueue = (dispatch_queue_s *)self->_eventQueue;
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __30__CBXpcConnection__handleMsg___block_invoke;
    v13[3] = &unk_189FB48A8;
    v13[4] = self;
    unsigned __int16 v16 = int64;
    id v14 = v8;
    id v15 = v4;
    dispatch_async(eventQueue, v13);

    goto LABEL_12;
  }

uint64_t __30__CBXpcConnection__handleMsg___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 xpcConnectionDidReceiveMsg:*(unsigned __int16 *)(a1 + 56) args:*(void *)(a1 + 40)];

  uint64_t result = *(void *)(*(void *)(a1 + 32) + 56LL);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)_handleReset
{
}

void __31__CBXpcConnection__handleReset__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 xpcConnectionDidReset];
}

- (void)_handleInvalid
{
}

void __33__CBXpcConnection__handleInvalid__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 xpcConnectionIsInvalid];
}

- (void)_handleFinalized
{
}

- (void)_handleConnectionEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x18959FCE0]();
  if (v5 == MEMORY[0x1895F9250])
  {
    -[CBXpcConnection _handleMsg:](self, "_handleMsg:", v4);
  }

  else if (v5 == MEMORY[0x1895F9268])
  {
    if (v4 == (id)MEMORY[0x1895F9198])
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

      if (WeakRetained) {
        -[CBXpcConnection _handleReset](self, "_handleReset");
      }
      else {
        -[CBXpcConnection _handleFinalized](self, "_handleFinalized");
      }
LABEL_6:

      return;
    }

    if (v4 == (id)MEMORY[0x1895F91A0])
    {
      -[CBXpcConnection _handleInvalid](self, "_handleInvalid");
    }

    else
    {
      if (CBLogInitOnce != -1) {
        dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
      }
      __int16 v13 = (os_log_s *)CBLogComponent;
      if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
        goto LABEL_6;
      }
      -[CBXpcConnection _handleConnectionEvent:].cold.1((uint64_t)v4, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  else
  {
    if (CBLogInitOnce != -1) {
      dispatch_once_f(&CBLogInitOnce, 0LL, (dispatch_function_t)CBLogInit);
    }
    uint8_t v6 = (os_log_s *)CBLogComponent;
    if (!os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR)) {
      goto LABEL_6;
    }
    -[CBXpcConnection _handleConnectionEvent:].cold.2((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12);
  }

- (void)_applicationDidEnterBackgroundNotification
{
  self->_uiAppIsBackgrounded = 1;
  -[CBXpcConnection _sendBarrier](self, "_sendBarrier");
}

- (void)_applicationWillEnterForegroundNotification
{
  self->_uiAppIsBackgrounded = 0;
}

- (CBXpcConnectionDelegate)delegate
{
  return (CBXpcConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)forwardWhbMsg:args:cnx:.cold.1()
{
}

- (void)didReceiveForwardedMessage:.cold.1()
{
}

- (void)didReceiveForwardedDelegateCallbackMessage:.cold.1()
{
}

void __38__CBXpcConnection_setWhbReplyHandler___block_invoke_cold_1()
{
}

- (void)_handleConnectionEvent:(uint64_t)a3 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_handleConnectionEvent:(uint64_t)a3 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end