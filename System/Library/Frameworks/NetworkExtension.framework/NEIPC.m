@interface NEIPC
- (void)logMessageType:(int)a1 data:(void *)a2 actionString:(void *)a3;
- (void)setupMessageHandlingWithQueue:(void *)a1;
- (void)stop;
@end

@implementation NEIPC

- (void).cxx_destruct
{
}

- (void)logMessageType:(int)a1 data:(void *)a2 actionString:(void *)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (nelog_is_debug_logging_enabled())
  {
    if ([v5 length])
    {
      id v7 = v5;
      CC_SHA1((const void *)[v7 bytes], objc_msgSend(v7, "length"), md);
      [MEMORY[0x189603F48] dataWithBytesNoCopy:md length:20 freeWhenDone:0];
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      v8 = 0LL;
    }

    ne_log_obj();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = [v5 length];
      [v8 description];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = 138413058;
      id v13 = v6;
      __int16 v14 = 1024;
      int v15 = a1;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_debug_impl( &dword_1876B1000,  v9,  OS_LOG_TYPE_DEBUG,  "%@ an IPC message with type %u and length %lu, hash %@",  (uint8_t *)&v12,  0x26u);
    }
  }
}

void __35__NEIPC_handleMessage_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (isa_nsdata(v6))
  {
    id v4 = v6;
    xpc_dictionary_set_data(reply, "data", (const void *)[v4 bytes], objc_msgSend(v4, "length"));
  }

  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  id v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, reply);
}

- (void)stop
{
  if (a1)
  {
    self = a1;
    objc_sync_enter(self);
    if (objc_getProperty(self, v1, 16LL, 1))
    {
      v3 = (_xpc_connection_s *)objc_getProperty(self, v2, 16LL, 1);
      xpc_connection_cancel(v3);

      objc_setProperty_atomic(self, v4, 0LL, 16LL);
    }

    if (objc_getProperty(self, v2, 24LL, 1))
    {
      id v6 = (_xpc_connection_s *)objc_getProperty(self, v5, 24LL, 1);
      xpc_connection_cancel(v6);

      objc_setProperty_atomic(self, v7, 0LL, 24LL);
    }

    objc_setProperty_atomic_copy(self, v5, 0LL, 8LL);
    objc_sync_exit(self);
  }

- (void)setupMessageHandlingWithQueue:(void *)a1
{
  if (a1)
  {
    v3 = a2;
    Property = (_xpc_connection_s *)objc_getProperty(a1, v4, 16LL, 1);
    xpc_connection_set_target_queue(Property, v3);

    SEL v7 = (_xpc_connection_s *)objc_getProperty(a1, v6, 16LL, 1);
    handler[0] = MEMORY[0x1895F87A8];
    handler[1] = 3221225472LL;
    handler[2] = __39__NEIPC_setupMessageHandlingWithQueue___block_invoke;
    handler[3] = &unk_18A090220;
    handler[4] = a1;
    xpc_connection_set_event_handler(v7, handler);
    v9 = (_xpc_connection_s *)objc_getProperty(a1, v8, 16LL, 1);
    xpc_connection_resume(v9);
  }

void __39__NEIPC_setupMessageHandlingWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v16 = a2;
  id v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  id v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v4, 8LL, 1))
  {
    SEL v7 = *(void **)(a1 + 32);
    if (v7) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v6, 8LL, 1);
    }
    else {
      id Property = 0LL;
    }
    id v9 = Property;
    id v10 = v16;
    v11 = (void (**)(id, void, uint64_t, void *, uint8_t *))v9;
    if (v7)
    {
      if (v10 && MEMORY[0x1895ADD58](v10) == MEMORY[0x1895F9250])
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v10, "type");
        size_t length = 0LL;
        data = (void *)xpc_dictionary_get_data(v10, "data", &length);
        BOOL v15 = xpc_dictionary_get_BOOL(v10, "needs-reply");
        if (data)
        {
          [MEMORY[0x189603F48] dataWithBytes:data length:length];
          data = (void *)objc_claimAutoreleasedReturnValue();
        }

        -[NEIPC logMessageType:data:actionString:](uint64, data, @"Received");
        if (v15)
        {
          *(void *)buf = MEMORY[0x1895F87A8];
          uint64_t v18 = 3221225472LL;
          v19 = __35__NEIPC_handleMessage_withHandler___block_invoke;
          v20 = &unk_18A08DC10;
          id v21 = v10;
          v11[2](v11, 0LL, uint64, data, buf);
        }

        else
        {
          v11[2](v11, 0LL, uint64, data, 0LL);
        }
      }

      else
      {
        ne_log_obj();
        int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_INFO,  "The IPC connection was closed by the remote end",  buf,  2u);
        }

        -[NEIPC stop](v7);
        v11[2](v11, 1LL, 0LL, 0LL, 0LL);
      }
    }
  }

  objc_sync_exit(v3);
}

void __51__NEIPC_startInListenModeWithQueue_messageHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SEL v4 = v3;
  if (v3 && MEMORY[0x1895ADD58](v3) == MEMORY[0x1895F9238])
  {
    id v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    SEL v7 = *(void **)(a1 + 32);
    if (v7) {
      objc_setProperty_atomic(v7, v6, v4, 16LL);
    }
    ne_log_obj();
    SEL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id Property = *(id *)(a1 + 32);
      if (Property) {
        id Property = objc_getProperty(Property, v9, 16LL, 1);
      }
      v11 = (_xpc_connection_s *)Property;
      v12[0] = 67109120;
      v12[1] = xpc_connection_get_pid(v11);
      _os_log_debug_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_DEBUG,  "Received a new connection from %d",  (uint8_t *)v12,  8u);
    }

    -[NEIPC setupMessageHandlingWithQueue:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    objc_sync_exit(v5);
  }
}

void __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke( uint64_t a1,  xpc_object_t xdict)
{
  size_t length = 0LL;
  data = xpc_dictionary_get_data(xdict, "data", &length);
  if (data)
  {
    [MEMORY[0x189603F48] dataWithBytes:data length:length];
    SEL v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    SEL v4 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

@end