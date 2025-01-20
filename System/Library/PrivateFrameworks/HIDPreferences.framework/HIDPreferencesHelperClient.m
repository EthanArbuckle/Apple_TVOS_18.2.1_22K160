@interface HIDPreferencesHelperClient
- (BOOL)setupConnectionOnQueue:(id)a3;
- (HIDPreferencesHelperClient)initWithConnection:(id)a3 listener:(id)a4 onQueue:(id)a5;
- (id)handleMessage:(id)a3;
- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7;
- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5;
- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7;
- (void)invalidateConnection;
- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7;
- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5;
- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7;
- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5;
@end

@implementation HIDPreferencesHelperClient

- (HIDPreferencesHelperClient)initWithConnection:(id)a3 listener:(id)a4 onQueue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___HIDPreferencesHelperClient;
  v12 = -[HIDPreferencesHelperClient init](&v17, sel_init);
  p_isa = (id *)&v12->super.isa;
  if (!v12)
  {
LABEL_7:
    v14 = 0LL;
    goto LABEL_8;
  }

  objc_storeStrong((id *)&v12->_connection, a3);
  objc_storeWeak(p_isa + 2, v10);
  if (([p_isa setupConnectionOnQueue:v11] & 1) == 0)
  {
    _IOHIDLogCategory();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient initWithConnection:listener:onQueue:].cold.1();
    }

    goto LABEL_7;
  }

  v14 = p_isa;
LABEL_8:

  return v14;
}

- (BOOL)setupConnectionOnQueue:(id)a3
{
  v4 = (dispatch_queue_s *)a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  xpc_connection_set_target_queue(self->_connection, v4);
  connection = self->_connection;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke;
  v7[3] = &unk_18A278B50;
  objc_copyWeak(&v8, &location);
  xpc_connection_set_event_handler(connection, v7);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return 1;
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  _IOHIDLogCategory();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_3();
  }

  WeakRetained = (xpc_connection_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v6 = MEMORY[0x1895CB598](v3);
    if (v6 == MEMORY[0x1895F9268])
    {
      _IOHIDLogCategory();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_1();
      }

      -[xpc_connection_t invalidateConnection](WeakRetained, "invalidateConnection");
    }

    else if (v6 == MEMORY[0x1895F9250])
    {
      v7 = -[xpc_connection_t handleMessage:](WeakRetained, "handleMessage:", v3);
      if (v7)
      {
        xpc_connection_send_message(WeakRetained[1], v7);
        _IOHIDLogCategory();
        id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_2();
        }
      }
    }
  }
}

- (id)handleMessage:(id)a3
{
  id v4 = a3;
  uint64_t v41 = 0LL;
  v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  v44 = __Block_byref_object_copy_;
  v45 = __Block_byref_object_dispose_;
  id v46 = 0LL;
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v5)
  {
    _IOHIDLogCategory();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient handleMessage:].cold.1();
    }
    goto LABEL_64;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _IOHIDLogCategory();
    v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient handleMessage:].cold.22();
    }
LABEL_64:

    id v11 = 0LL;
    id v13 = 0LL;
    id v10 = 0LL;
    id v12 = 0LL;
    id v6 = 0LL;
LABEL_52:
    id v14 = 0LL;
    goto LABEL_53;
  }

  id v6 = v5;
  _IOHIDLogCategory();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient handleMessage:].cold.21();
  }

  [v6 objectForKeyedSubscript:@"Type"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 integerValue];

  [v6 objectForKeyedSubscript:@"Domain"];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    _IOHIDLogCategory();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[HIDPreferencesHelperClient handleMessage:].cold.2();
    }

    id v11 = 0LL;
    id v13 = 0LL;
    id v10 = 0LL;
LABEL_31:
    id v12 = 0LL;
    goto LABEL_52;
  }

  switch(v9)
  {
    case 1LL:
      [v6 objectForKeyedSubscript:@"Key"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.4();
        }
        goto LABEL_82;
      }

      [v6 objectForKeyedSubscript:@"User"];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.5();
        }
        goto LABEL_57;
      }

      [v6 objectForKeyedSubscript:@"Host"];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _IOHIDLogCategory();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.6();
        }

        goto LABEL_94;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v37[0] = MEMORY[0x1895F87A8];
          v37[1] = 3221225472LL;
          v37[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke;
          v37[3] = &unk_18A278B78;
          v37[4] = self;
          id v12 = v12;
          id v38 = v12;
          id v13 = v13;
          id v39 = v13;
          id v10 = v10;
          id v40 = v10;
          [v11 enumerateKeysAndObjectsUsingBlock:v37];

          goto LABEL_52;
        }

        _IOHIDLogCategory();
        v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.7();
        }
        goto LABEL_51;
      }

      -[HIDPreferencesHelperClient set:value:user:host:domain:]( self,  "set:value:user:host:domain:",  v11,  0LL,  v12,  v13,  v10);
      id v14 = 0LL;
      goto LABEL_53;
    case 2LL:
      [v6 objectForKeyedSubscript:@"User"];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.8();
        }
        goto LABEL_82;
      }

      [v6 objectForKeyedSubscript:@"Host"];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _IOHIDLogCategory();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.9();
        }
        goto LABEL_93;
      }

      [v6 objectForKey:@"Key"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        [v6 objectForKeyedSubscript:@"Key"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          [v11 objectForKeyedSubscript:@"KeysToSet"];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 objectForKeyedSubscript:@"KeysToRemove"];
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[HIDPreferencesHelperClient setMultiple:keysToRemove:user:host:domain:]( self,  "setMultiple:keysToRemove:user:host:domain:",  v18,  v19,  v12,  v13,  v10);
        }

        goto LABEL_52;
      }

      -[HIDPreferencesHelperClient setMultiple:keysToRemove:user:host:domain:]( self,  "setMultiple:keysToRemove:user:host:domain:",  0LL,  0LL,  v12,  v13,  v10);
      id v14 = 0LL;
      goto LABEL_53;
    case 3LL:
      [v6 objectForKeyedSubscript:@"User"];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.12();
        }
        goto LABEL_82;
      }

      [v6 objectForKeyedSubscript:@"Host"];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (!v13)
      {
        _IOHIDLogCategory();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.13();
        }
        goto LABEL_93;
      }

      [v6 objectForKeyedSubscript:@"Key"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v36[0] = MEMORY[0x1895F87A8];
        v36[1] = 3221225472LL;
        v36[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_16;
        v36[3] = &unk_18A278BA0;
        v36[4] = &v41;
        -[HIDPreferencesHelperClient copy:user:host:domain:reply:]( self,  "copy:user:host:domain:reply:",  v11,  v12,  v13,  v10,  v36);
        goto LABEL_47;
      }

      _IOHIDLogCategory();
      v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[HIDPreferencesHelperClient handleMessage:].cold.14();
      }

      goto LABEL_15;
    case 4LL:
      [v6 objectForKeyedSubscript:@"User"];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.16();
        }
        goto LABEL_82;
      }

      [v6 objectForKeyedSubscript:@"Host"];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        [v6 objectForKey:@"Key"];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          [v6 objectForKeyedSubscript:@"Key"];
          id v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            [v11 objectForKey:@"KeysToCopy"];
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              [v11 objectForKeyedSubscript:@"KeysToCopy"];
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v35[0] = MEMORY[0x1895F87A8];
              v35[1] = 3221225472LL;
              v35[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_20;
              v35[3] = &unk_18A278BA0;
              v35[4] = &v41;
              -[HIDPreferencesHelperClient copyMultiple:user:host:domain:reply:]( self,  "copyMultiple:user:host:domain:reply:",  v16,  v12,  v13,  v10,  v35);
            }
          }
        }

        else
        {
          v34[0] = MEMORY[0x1895F87A8];
          v34[1] = 3221225472LL;
          v34[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_2;
          v34[3] = &unk_18A278BA0;
          v34[4] = &v41;
          -[HIDPreferencesHelperClient copyMultiple:user:host:domain:reply:]( self,  "copyMultiple:user:host:domain:reply:",  0LL,  v12,  v13,  v10,  v34);
        }

        goto LABEL_47;
      }

      _IOHIDLogCategory();
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[HIDPreferencesHelperClient handleMessage:].cold.17();
      }
      goto LABEL_93;
    case 5LL:
      [v6 objectForKeyedSubscript:@"User"];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.10();
        }
        goto LABEL_82;
      }

      [v6 objectForKeyedSubscript:@"Host"];
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[HIDPreferencesHelperClient synchronize:host:domain:](self, "synchronize:host:domain:", v12, v13, v10);
LABEL_15:
        id v11 = 0LL;
      }

      else
      {
        _IOHIDLogCategory();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.11();
        }
LABEL_93:

        id v11 = 0LL;
LABEL_94:
        id v13 = 0LL;
      }

      goto LABEL_52;
    case 6LL:
      [v6 objectForKeyedSubscript:@"Key"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.20();
        }
        goto LABEL_82;
      }

      v31[0] = MEMORY[0x1895F87A8];
      v31[1] = 3221225472LL;
      v31[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_22;
      v31[3] = &unk_18A278BA0;
      v31[4] = &v41;
      -[HIDPreferencesHelperClient copyDomain:domain:reply:](self, "copyDomain:domain:reply:", v11, v10, v31);
      id v12 = 0LL;
      id v13 = 0LL;
LABEL_47:
      xpc_object_t reply = xpc_dictionary_create_reply(v4);
      v21 = reply;
      if (reply)
      {
        xpc_dictionary_set_value(reply, "Value", (xpc_object_t)v42[5]);
        id v14 = v21;
        goto LABEL_53;
      }

      _IOHIDLogCategory();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[HIDPreferencesHelperClient handleMessage:].cold.15();
      }
LABEL_51:

      goto LABEL_52;
    case 7LL:
      [v6 objectForKeyedSubscript:@"Key"];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        _IOHIDLogCategory();
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          -[HIDPreferencesHelperClient handleMessage:].cold.18();
        }
LABEL_82:

LABEL_29:
        id v11 = 0LL;
        goto LABEL_30;
      }

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32[0] = MEMORY[0x1895F87A8];
          v32[1] = 3221225472LL;
          v32[2] = __44__HIDPreferencesHelperClient_handleMessage___block_invoke_21;
          v32[3] = &unk_18A278BC8;
          v32[4] = self;
          id v10 = v10;
          id v33 = v10;
          [v11 enumerateKeysAndObjectsUsingBlock:v32];
        }

        else
        {
          _IOHIDLogCategory();
          v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            -[HIDPreferencesHelperClient handleMessage:].cold.19();
          }
LABEL_57:
        }

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) set:a2 value:a3 user:*(void *)(a1 + 40) host:*(void *)(a1 + 48) domain:*(void *)(a1 + 56)];
}

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_16(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = _CFXPCCreateXPCObjectFromCFObject();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_20(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = _CFXPCCreateXPCObjectFromCFObject();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = _CFXPCCreateXPCObjectFromCFObject();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

uint64_t __44__HIDPreferencesHelperClient_handleMessage___block_invoke_21(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setDomain:a2 value:a3 domain:*(void *)(a1 + 40)];
}

void __44__HIDPreferencesHelperClient_handleMessage___block_invoke_22(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = _CFXPCCreateXPCObjectFromCFObject();
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }

- (void)invalidateConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listener);
  connection = self->_connection;
  id v6 = WeakRetained;
  if (connection) {
    BOOL v5 = WeakRetained == 0LL;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    xpc_connection_cancel(connection);
    [v6 removeClient:self];
  }
}

- (void)set:(id)a3 value:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v11 = (__CFString *)a3;
  id v12 = a4;
  id v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  v15 = (__CFString *)a7;
  _IOHIDLogCategory();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413314;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v13;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl( &dword_18876B000,  v16,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Set Key:%@ Value:%@ User:%@ Host:%@ Domain:%@\n",  (uint8_t *)&v17,  0x34u);
  }

  CFPreferencesSetValue(v11, v12, v15, v13, v14);
}

- (void)copy:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v11 = (__CFString *)a3;
  id v12 = (__CFString *)a4;
  id v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  v15 = (void (**)(id, void *))a7;
  _IOHIDLogCategory();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl( &dword_18876B000,  v16,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Copy Key:%@ User:%@ Host:%@ Domain:%@\n",  (uint8_t *)&v19,  0x2Au);
  }

  int v17 = (void *)CFPreferencesCopyValue(v11, v14, v12, v13);
  _IOHIDLogCategory();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:].cold.1();
  }

  if (v15) {
    v15[2](v15, v17);
  }
}

- (void)synchronize:(id)a3 host:(id)a4 domain:(id)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = (__CFString *)a5;
  _IOHIDLogCategory();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    v16 = v9;
    _os_log_debug_impl( &dword_18876B000,  v10,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Synchronize User:%@ Host:%@ Domain:%@\n",  (uint8_t *)&v11,  0x20u);
  }

  CFPreferencesSynchronize(v9, v7, v8);
}

- (void)copyMultiple:(id)a3 user:(id)a4 host:(id)a5 domain:(id)a6 reply:(id)a7
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v11 = (const __CFArray *)a3;
  id v12 = (__CFString *)a4;
  __int16 v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  __int16 v15 = (void (**)(id, CFDictionaryRef))a7;
  _IOHIDLogCategory();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138413058;
    v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v14;
    _os_log_debug_impl( &dword_18876B000,  v16,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Copy Multiple Keys:%@ User:%@ Host:%@ Domain:%@\n",  (uint8_t *)&v19,  0x2Au);
  }

  CFDictionaryRef v17 = CFPreferencesCopyMultiple(v11, v14, v12, v13);
  _IOHIDLogCategory();
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:].cold.1();
  }

  if (v15) {
    v15[2](v15, v17);
  }
}

- (void)setMultiple:(id)a3 keysToRemove:(id)a4 user:(id)a5 host:(id)a6 domain:(id)a7
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v11 = (const __CFDictionary *)a3;
  id v12 = (const __CFArray *)a4;
  __int16 v13 = (__CFString *)a5;
  id v14 = (__CFString *)a6;
  __int16 v15 = (__CFString *)a7;
  _IOHIDLogCategory();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 138413314;
    v18 = v11;
    __int16 v19 = 2112;
    v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    v24 = v14;
    __int16 v25 = 2112;
    v26 = v15;
    _os_log_debug_impl( &dword_18876B000,  v16,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Set Multiple KeysToSet:%@ KeysToRemove:%@ User:%@ Host:%@ Domain:%@\n",  (uint8_t *)&v17,  0x34u);
  }

  CFPreferencesSetMultiple(v11, v12, v15, v13, v14);
}

- (void)copyDomain:(id)a3 domain:(id)a4 reply:(id)a5
{
  v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  _IOHIDLogCategory();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copyDomain:domain:reply:].cold.2();
  }

  int v11 = (void *)CFPreferencesCopyAppValue(v7, v8);
  _IOHIDLogCategory();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[HIDPreferencesHelperClient copy:user:host:domain:reply:].cold.1();
  }

  if (v9) {
    v9[2](v9, v11);
  }
}

- (void)setDomain:(id)a3 value:(id)a4 domain:(id)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v7 = (__CFString *)a3;
  id v8 = a4;
  uint64_t v9 = (__CFString *)a5;
  _IOHIDLogCategory();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_debug_impl( &dword_18876B000,  v10,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Set Domain Value Key:%@ Domain:%@ Value : %@\n",  (uint8_t *)&v11,  0x20u);
  }

  CFPreferencesSetAppValue(v7, v8, v9);
}

- (void).cxx_destruct
{
}

- (void)initWithConnection:listener:onQueue:.cold.1()
{
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_1()
{
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_2()
{
}

void __53__HIDPreferencesHelperClient_setupConnectionOnQueue___block_invoke_cold_3()
{
}

- (void)handleMessage:.cold.1()
{
}

- (void)handleMessage:.cold.2()
{
}

- (void)handleMessage:.cold.3()
{
}

- (void)handleMessage:.cold.4()
{
}

- (void)handleMessage:.cold.5()
{
}

- (void)handleMessage:.cold.6()
{
}

- (void)handleMessage:.cold.7()
{
}

- (void)handleMessage:.cold.8()
{
}

- (void)handleMessage:.cold.9()
{
}

- (void)handleMessage:.cold.10()
{
}

- (void)handleMessage:.cold.11()
{
}

- (void)handleMessage:.cold.12()
{
}

- (void)handleMessage:.cold.13()
{
}

- (void)handleMessage:.cold.14()
{
}

- (void)handleMessage:.cold.15()
{
}

- (void)handleMessage:.cold.16()
{
}

- (void)handleMessage:.cold.17()
{
}

- (void)handleMessage:.cold.18()
{
}

- (void)handleMessage:.cold.19()
{
}

- (void)handleMessage:.cold.20()
{
}

- (void)handleMessage:.cold.21()
{
}

- (void)handleMessage:.cold.22()
{
}

- (void)copy:user:host:domain:reply:.cold.1()
{
}

- (void)copyDomain:domain:reply:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl( &dword_18876B000,  v1,  OS_LOG_TYPE_DEBUG,  "HIDPreferencesHelper Copy Domain Value Key:%@ Domain:%@\n",  v2,  0x16u);
  OUTLINED_FUNCTION_4();
}

@end