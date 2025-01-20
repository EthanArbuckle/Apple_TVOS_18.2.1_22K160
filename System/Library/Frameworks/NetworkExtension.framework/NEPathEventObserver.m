@interface NEPathEventObserver
- (NEPathEventObserver)init;
- (NEPathEventObserver)initWithQueue:(id)a3 eventHandler:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)handleEvent:(void *)a3 forPID:(void *)a4 UUID:;
@end

@implementation NEPathEventObserver

- (NEPathEventObserver)init
{
  return 0LL;
}

- (NEPathEventObserver)initWithQueue:(id)a3 eventHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___NEPathEventObserver;
  v8 = -[NEPathEventObserver init](&v17, sel_init);
  v10 = v8;
  if (v8)
  {
    objc_setProperty_atomic_copy(v8, v9, v7, 32LL);
    objc_initWeak(&location, v10);
    v11 = (void *)MEMORY[0x1895F87A8];
    v14[1] = (id)MEMORY[0x1895F87A8];
    v14[2] = (id)3221225472LL;
    v14[3] = __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke;
    v14[4] = &unk_18A08E848;
    objc_copyWeak(&v15, &location);
    v10->_cellBlockedObserver = (network_config_cellular_blocked_observer_s *)network_config_cellular_blocked_observer_create();
    v13[1] = v11;
    v13[2] = (id)3221225472LL;
    v13[3] = __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_2;
    v13[4] = &unk_18A08E848;
    objc_copyWeak(v14, &location);
    v10->_cellFailedObserver = (network_config_cellular_blocked_observer_s *)network_config_cellular_failed_observer_create();
    objc_copyWeak(v13, &location);
    v10->_wifiBlockedObserver = (network_config_cellular_blocked_observer_s *)network_config_wifi_blocked_observer_create();
    objc_destroyWeak(v13);
    objc_destroyWeak(v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (void)cancel
{
  if (self)
  {
    cellBlockedObserver = self->_cellBlockedObserver;
    if (cellBlockedObserver)
    {
      MEMORY[0x1895ACBA0](cellBlockedObserver, a2);
      self->_cellBlockedObserver = 0LL;
    }

    cellFailedObserver = self->_cellFailedObserver;
    if (cellFailedObserver)
    {
      MEMORY[0x1895ACBA0](cellFailedObserver, a2);
      self->_cellFailedObserver = 0LL;
    }

    wifiBlockedObserver = self->_wifiBlockedObserver;
    if (wifiBlockedObserver)
    {
      MEMORY[0x1895ACBA0](wifiBlockedObserver, a2);
      self->_wifiBlockedObserver = 0LL;
    }
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEPathEventObserver;
  -[NEPathEventObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)1, v6, v5);
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)2, v6, v5);
}

void __50__NEPathEventObserver_initWithQueue_eventHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  -[NEPathEventObserver handleEvent:forPID:UUID:](WeakRetained, (void *)3, v6, v5);
}

- (void)handleEvent:(void *)a3 forPID:(void *)a4 UUID:
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!a1) {
    goto LABEL_27;
  }
  if (v7 && MEMORY[0x1895ADD58](v7) == MEMORY[0x1895F92F0])
  {
    int value = xpc_uint64_get_value(v7);
    if (v8)
    {
      if (MEMORY[0x1895ADD58](v8) == MEMORY[0x1895F92F8])
      {
        bytes = xpc_uuid_get_bytes(v8);
        if (proc_pidinfo(value, 17, 1uLL, out, 56) == 56)
        {
          if (uuid_compare(bytes, (const unsigned __int8 *)out))
          {
            uuid_unparse(bytes, (char *)buf);
            ne_log_obj();
            id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = off_18A08E868[(void)a2 - 1];
              int v28 = 138412802;
              v29 = v16;
              __int16 v30 = 1024;
              int v31 = value;
              __int16 v32 = 2080;
              v33 = buf;
              _os_log_impl( &dword_1876B1000,  v15,  OS_LOG_TYPE_INFO,  "NEPathEvent %@ PID %u does not match UUID %s, is delegating traffic",  (uint8_t *)&v28,  0x1Cu);
            }

            goto LABEL_5;
          }
        }
      }
    }

    uint64_t v17 = NECopySigningIdentifierForPIDwithAuditToken();
    if (v17)
    {
      v18 = (void *)v17;
      ne_log_obj();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = off_18A08E868[(void)a2 - 1];
        *(_DWORD *)uuid_string_t out = 138412546;
        *(void *)&out[4] = v20;
        *(_WORD *)&out[12] = 2112;
        *(void *)&out[14] = v18;
        _os_log_impl(&dword_1876B1000, v19, OS_LOG_TYPE_DEFAULT, "NEPathEvent %@ for %@ by PID", (uint8_t *)out, 0x16u);
      }

      v21 = -[NEPathEvent initWithType:bundleID:]((id *)objc_alloc(&OBJC_CLASS___NEPathEvent), a2, v18);
      if (v21) {
        goto LABEL_26;
      }
    }
  }

  if (!v8) {
    goto LABEL_27;
  }
LABEL_5:
  if (MEMORY[0x1895ADD58](v8) != MEMORY[0x1895F92F8]) {
    goto LABEL_27;
  }
  v9 = xpc_uuid_get_bytes(v8);
  uuid_unparse(v9, out);
  uint64_t v10 = NEHelperCacheCopySigningIdentifierMapping();
  v11 = (void *)v10;
  if (!v10 || MEMORY[0x1895ADD58](v10) != MEMORY[0x1895F92E8])
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v27 = off_18A08E868[(void)a2 - 1];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = out;
      _os_log_error_impl( &dword_1876B1000,  v12,  OS_LOG_TYPE_ERROR,  "NEPathEvent %@ failed to find bundle ID for UUID %s",  buf,  0x16u);
    }

    goto LABEL_27;
  }

  [NSString stringWithUTF8String:xpc_string_get_string_ptr(v11)];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ne_log_obj();
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = off_18A08E868[(void)a2 - 1];
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v25;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2080;
    *(void *)&buf[24] = out;
    _os_log_impl(&dword_1876B1000, v24, OS_LOG_TYPE_DEFAULT, "NEPathEvent %@ for %@ by UUID %s", buf, 0x20u);
  }

  v21 = -[NEPathEvent initWithType:bundleID:]((id *)objc_alloc(&OBJC_CLASS___NEPathEvent), a2, v23);
  if (v21)
  {
LABEL_26:
    Property = (void (**)(id, id *))objc_getProperty(a1, v22, 32LL, 1);
    Property[2](Property, v21);
  }

@end