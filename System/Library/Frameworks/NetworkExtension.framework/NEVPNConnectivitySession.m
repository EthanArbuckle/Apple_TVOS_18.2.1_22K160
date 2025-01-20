@interface NEVPNConnectivitySession
- (id)initWithConfiguration:(void *)a3 delegate:(void *)a4 queue:;
@end

@implementation NEVPNConnectivitySession

- (void).cxx_destruct
{
}

uint64_t __56__NEVPNConnectivitySession_cancelWithCompletionHandler___block_invoke( uint64_t a1,  const char *a2)
{
  v3 = *(void **)(a1 + 32);
  if (v3) {
    objc_setProperty_atomic_copy(v3, a2, *(id *)(a1 + 40), 32LL);
  }
  return ne_session_cancel();
}

- (id)initWithConfiguration:(void *)a3 delegate:(void *)a4 queue:
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1
    && (v38.receiver = a1,
        v38.super_class = (Class)&OBJC_CLASS___NEVPNConnectivitySession,
        v11 = (id *)objc_msgSendSuper2(&v38, sel_init),
        (v12 = v11) != 0LL))
  {
    objc_storeStrong(v11 + 1, a2);
    objc_storeWeak(v12 + 3, v9);
    objc_storeStrong(v12 + 5, a4);
    [v8 identifier];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 getUUIDBytes:v44];

    [v8 VPN];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = v14 == 0LL;

    if ((_DWORD)v13)
    {
      [v8 appVPN];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v17 = v16 == 0LL;

      if (v17)
      {
        [v8 alwaysOnVPN];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v19 = v18 == 0LL;

        if (v19)
        {
          [v8 pathController];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v21 = v20 == 0LL;

          if (v21)
          {
            [v8 contentFilter];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v23 = v22 == 0LL;

            if (v23)
            {
              [v8 dnsProxy];
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              BOOL v25 = v24 == 0LL;

              if (v25)
              {
                [v8 dnsSettings];
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                BOOL v27 = v26 == 0LL;

                if (v27)
                {
                  [v8 appPush];
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  BOOL v29 = v28 == 0LL;

                  if (v29)
                  {
                    [v8 relay];
                  }
                }
              }
            }
          }
        }
      }
    }

    uint64_t v30 = ne_session_create();
    if (v30)
    {
      objc_initWeak((id *)location, v12);
      objc_copyWeak(&v37, (id *)location);
      v36 = v12;
      ne_session_set_event_handler();
      v36[2] = (id)v30;
      v15 = v36;

      objc_destroyWeak(&v37);
      objc_destroyWeak((id *)location);
    }

    else
    {
      ne_log_obj();
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        [v8 name];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 identifier];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = ne_session_type_to_string();
        *(_DWORD *)location = 138412802;
        *(void *)&location[4] = v33;
        __int16 v40 = 2112;
        v41 = v34;
        __int16 v42 = 2080;
        uint64_t v43 = v35;
        _os_log_error_impl( &dword_1876B1000,  v31,  OS_LOG_TYPE_ERROR,  "Failed to create a ne_session for %@ (%@), session type %s",  location,  0x20u);
      }

      v15 = 0LL;
    }
  }

  else
  {
    v15 = 0LL;
  }

  return v15;
}

void __65__NEVPNConnectivitySession_initWithConfiguration_delegate_queue___block_invoke( uint64_t a1,  const char *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if ((_DWORD)a2 == 2)
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
    {
      if (!v7[2]
        || (ne_session_release(), (uint64_t v8 = *(void *)(a1 + 32)) != 0)
        && (*(void *)(v8 + 16) = 0LL, (v7 = *(void **)(a1 + 32)) != 0LL))
      {
        if (objc_getProperty(v7, a2, 32LL, 1))
        {
          id Property = *(id *)(a1 + 32);
          if (Property) {
            id Property = objc_getProperty(Property, v9, 32LL, 1);
          }
          v13 = (void (**)(void))Property;
          v12 = *(void **)(a1 + 32);
          if (v12) {
            objc_setProperty_atomic_copy(v12, v11, 0LL, 32LL);
          }
          v13[2]();
        }
      }
    }
  }

  else if ((_DWORD)a2 == 1)
  {
    WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    v4 = WeakRetained;
    if (WeakRetained && (v5 = (os_log_s *)objc_loadWeakRetained(WeakRetained + 3)) != 0LL)
    {
      v6 = v5;
      -[os_log_s sessionStatusDidChange:](v5, "sessionStatusDidChange:", v4);
    }

    else
    {
      ne_log_obj();
      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134218240;
        v15 = v4;
        __int16 v16 = 2048;
        uint64_t v17 = 0LL;
        _os_log_error_impl( &dword_1876B1000,  v6,  OS_LOG_TYPE_ERROR,  "Failed to notify of a session status change because self (%p) or the delegate (%p) is nil",  buf,  0x16u);
      }
    }
  }

@end