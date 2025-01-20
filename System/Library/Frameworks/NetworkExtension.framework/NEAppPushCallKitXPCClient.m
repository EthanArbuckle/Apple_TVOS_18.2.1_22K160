@interface NEAppPushCallKitXPCClient
- (NEAppPushCallKitXPCClient)init;
- (void)dealloc;
- (void)registerVoIPMessagePayload;
- (void)setConnection:(uint64_t)a1;
- (void)voipNetworkExtensionPayloadReceived:(id)a3 mustPostCall:(BOOL)a4 withCompletionHandler:(id)a5;
- (void)voipNetworkExtensionRegistrationFailed;
@end

@implementation NEAppPushCallKitXPCClient

- (NEAppPushCallKitXPCClient)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NEAppPushCallKitXPCClient;
  v2 = -[NEAppPushCallKitXPCClient init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    connection = v2->_connection;
    v2->_connection = 0LL;

    v3->_lock._os_unfair_lock_opaque = 0;
    objc_initWeak(&location, v3);
    v5 = (dispatch_queue_s *)MEMORY[0x1895F8AE0];
    id v6 = MEMORY[0x1895F8AE0];
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __33__NEAppPushCallKitXPCClient_init__block_invoke;
    v8[3] = &unk_18A08FAA0;
    objc_copyWeak(&v9, &location);
    notify_register_dispatch("com.apple.pushkit.launch.voip", &v3->_callKitToken, v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEAppPushCallKitXPCClient;
  -[NEAppPushCallKitXPCClient dealloc](&v3, sel_dealloc);
}

- (void)voipNetworkExtensionPayloadReceived:(id)a3 mustPostCall:(BOOL)a4 withCompletionHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  ne_log_obj();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)v19 = 138412546;
    *(void *)&v19[4] = self;
    *(_WORD *)&v19[12] = 2112;
    *(void *)&v19[14] = v7;
    _os_log_debug_impl(&dword_1876B1000, v9, OS_LOG_TYPE_DEBUG, "%@ callkit delivered payload %@", v19, 0x16u);
  }

  id v10 = v7;
  id v11 = v8;
  uint64_t v12 = objc_opt_self();
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = (void *)[objc_alloc(MEMORY[0x189603FC8]) initWithDictionary:v10];
    [v13 objectForKeyedSubscript:@"ap-push-config-uuid"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v15 = +[NEAppPushManager loadedManagers]();
      ne_log_obj();
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        if (v17)
        {
          uint64_t v18 = [v15 count];
          *(_DWORD *)v19 = 134217984;
          *(void *)&v19[4] = v18;
          _os_log_debug_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEBUG, "loaded manager count %zd", v19, 0xCu);
        }

        *(void *)v19 = MEMORY[0x1895F87A8];
        *(void *)&v19[8] = 3221225472LL;
        *(void *)&v19[16] = __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke;
        v20 = &unk_18A08C6F8;
        v21 = v14;
        uint64_t v24 = v12;
        id v22 = v13;
        id v23 = v11;
        [v15 enumerateKeysAndObjectsUsingBlock:v19];

        v16 = v21;
      }

      else if (v17)
      {
        *(_WORD *)v19 = 0;
        _os_log_debug_impl(&dword_1876B1000, v16, OS_LOG_TYPE_DEBUG, "no loaded managers found", v19, 2u);
      }
    }

    else
    {
      ne_log_obj();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v19 = 138412546;
        *(void *)&v19[4] = v12;
        *(_WORD *)&v19[12] = 2112;
        *(void *)&v19[14] = @"ap-push-config-uuid";
        _os_log_error_impl( &dword_1876B1000,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "%@ received payload without [%@] key",  v19,  0x16u);
      }
    }
  }

  else
  {
    ne_log_obj();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v19 = 138412290;
      *(void *)&v19[4] = v12;
      _os_log_error_impl( &dword_1876B1000,  (os_log_t)v13,  OS_LOG_TYPE_ERROR,  "%@ received invalid incoming call payload",  v19,  0xCu);
    }
  }
}

- (void)voipNetworkExtensionRegistrationFailed
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  objc_super v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_debug_impl( &dword_1876B1000,  v3,  OS_LOG_TYPE_DEBUG,  "%@ registration with CallKit failed",  (uint8_t *)&v4,  0xCu);
  }
}

- (void).cxx_destruct
{
}

void __33__NEAppPushCallKitXPCClient_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "com.apple.pushkit.launch.voip";
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "Received notification %s", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    [*(id *)(v4 + 16) invalidate];
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
    -[NEAppPushCallKitXPCClient setConnection:](v4);
    -[NEAppPushCallKitXPCClient registerVoIPMessagePayload](v4);
  }
}

- (void)setConnection:(uint64_t)a1
{
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  uint64_t v4 = *(void *)(a1 + 16);
  objc_super v3 = (id *)(a1 + 16);
  if (v4) {
    objc_storeStrong(v3, 0LL);
  }
  os_unfair_lock_unlock(v2);
}

- (void)registerVoIPMessagePayload
{
  v21[1] = *(id *)MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 8);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
    objc_super v3 = *(void **)(a1 + 16);
    if (!v3)
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.callkit.networkextension.voip" options:0];
      int v5 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v4;

      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6F71D8];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 16) setExportedInterface:v6];

      [*(id *)(a1 + 16) setExportedObject:a1];
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6FDC20];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 16) setRemoteObjectInterface:v7];

      objc_initWeak(&location, (id)a1);
      uint64_t v8 = MEMORY[0x1895F87A8];
      *(void *)&__int128 buf = MEMORY[0x1895F87A8];
      *((void *)&buf + 1) = 3221225472LL;
      v19 = __39__NEAppPushCallKitXPCClient_connection__block_invoke;
      v20 = &unk_18A08FAC8;
      objc_copyWeak(v21, &location);
      [*(id *)(a1 + 16) setInterruptionHandler:&buf];
      uint64_t v12 = v8;
      uint64_t v13 = 3221225472LL;
      v14 = __39__NEAppPushCallKitXPCClient_connection__block_invoke_13;
      v15 = &unk_18A08FAC8;
      objc_copyWeak(&v16, &location);
      [*(id *)(a1 + 16) setInvalidationHandler:&v12];
      objc_msgSend(*(id *)(a1 + 16), "resume", v12, v13, v14, v15);
      objc_destroyWeak(&v16);
      objc_destroyWeak(v21);
      objc_destroyWeak(&location);
      objc_super v3 = *(void **)(a1 + 16);
    }

    id v9 = v3;
    os_unfair_lock_unlock(v2);
    [v9 remoteObjectProxy];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 registerVoIPNetworkExtension];

    ne_log_obj();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a1;
      _os_log_debug_impl(&dword_1876B1000, v11, OS_LOG_TYPE_DEBUG, "%@ registered with CallKit", (uint8_t *)&buf, 0xCu);
    }
  }

void __39__NEAppPushCallKitXPCClient_connection__block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "CallKit xpc connection interrupted", v5, 2u);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    [*(id *)(v4 + 16) invalidate];
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 8));
    -[NEAppPushCallKitXPCClient setConnection:](v4);
  }
}

void __39__NEAppPushCallKitXPCClient_connection__block_invoke_13(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v5 = 0;
    _os_log_debug_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEBUG, "CallKit xpc connection invalidated", v5, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    -[NEAppPushCallKitXPCClient setConnection:]((uint64_t)WeakRetained);
  }
}

@end