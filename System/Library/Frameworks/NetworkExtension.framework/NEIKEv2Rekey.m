@interface NEIKEv2Rekey
- (id)invokeChildRekeyHandler;
- (id)invokeIKERekeyHandler;
- (void)dealloc;
- (void)invalidateTimers;
- (void)startChildTimer:(void *)a3 timeoutHandler:;
- (void)startIKETimer:(void *)a3 timeoutHandler:;
@end

@implementation NEIKEv2Rekey

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NEIKEv2Rekey;
  -[NEIKEv2Rekey dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)invalidateTimers
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 16LL, 1))
    {
      objc_msgSend(objc_getProperty(a1, v3, 16, 1), "invalidate");
      objc_setProperty_atomic(a1, v4, 0LL, 16LL);
    }

    if (objc_getProperty(a1, v3, 24LL, 1))
    {
      objc_msgSend(objc_getProperty(a1, v5, 24, 1), "invalidate");
      objc_setProperty_atomic(a1, v6, 0LL, 24LL);
    }

    if (objc_getProperty(a1, v5, 40LL, 1))
    {
      Property = (dispatch_source_s *)objc_getProperty(a1, v7, 40LL, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v9, 0LL, 40LL);
    }

    if (objc_getProperty(a1, v7, 48LL, 1))
    {
      v11 = (dispatch_source_s *)objc_getProperty(a1, v10, 48LL, 1);
      dispatch_source_cancel(v11);
      objc_setProperty_atomic(a1, v12, 0LL, 48LL);
    }
  }

- (void)startIKETimer:(void *)a3 timeoutHandler:
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v7 = v5;
  if (a1)
  {
    if (a2) {
      a1[2] = a2;
    }
    if (v5) {
      objc_setProperty_atomic_copy(a1, v6, v5, 56LL);
    }
    int v8 = a1[2];
    uint64_t v9 = 45LL * v8;
    if (v8 <= 2) {
      double v10 = (double)v8 * 5.0;
    }
    else {
      double v10 = 15.0;
    }
    if (objc_opt_class())
    {
      if (objc_getProperty(a1, v11, 16LL, 1))
      {
        objc_msgSend(objc_getProperty(a1, v12, 16, 1), "cancel");
      }

      else
      {
        if (objc_getProperty(a1, v12, 32LL, 1))
        {
          id v13 = objc_alloc(NSString);
          v15 = (__CFString *)[v13 initWithFormat:@"com.apple.networkextension[%@ IKE Lifetime]", objc_getProperty(a1, v14, 32, 1)];
        }

        else
        {
          v15 = @"com.apple.networkextension[NEIKEv2PacketTunnelProvider IKE Lifetime]";
        }

        v16 = (void *)[objc_alloc(MEMORY[0x189612AA0]) initWithIdentifier:v15];
        objc_setProperty_atomic(a1, v17, v16, 16LL);
      }

      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)NEGetSystemWakeTime();
        *(_DWORD *)buf = 138413058;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        __int16 v49 = 2112;
        v50 = v19;
        _os_log_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_INFO,  "%@: Setting Rekey IKE timer for %llu seconds, leeway %f seconds, last wake date %@",  buf,  0x2Au);
      }

      objc_initWeak((id *)buf, a1);
      id v21 = objc_getProperty(a1, v20, 16LL, 1);
      id v22 = MEMORY[0x1895F8AE0];
      v41[0] = MEMORY[0x1895F87A8];
      v41[1] = 3221225472LL;
      v41[2] = __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke;
      v41[3] = &unk_18A08D7F8;
      objc_copyWeak(&v42, (id *)buf);
      [v21 scheduleWithFireInterval:MEMORY[0x1895F8AE0] leewayInterval:v41 queue:(double)(unint64_t)v9 handler:v10];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (objc_getProperty(a1, v11, 40LL, 1))
      {
        Property = (dispatch_source_s *)objc_getProperty(a1, v23, 40LL, 1);
        dispatch_source_cancel(Property);
        objc_setProperty_atomic(a1, v25, 0LL, 40LL);
      }

      ne_log_obj();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        _os_log_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_INFO,  "%@: Setting Rekey IKE timer for %llu seconds, leeway %f seconds",  buf,  0x20u);
      }

      dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, MEMORY[0x1895F8AE0]);
      objc_setProperty_atomic(a1, v28, v27, 40LL);

      if (objc_getProperty(a1, v29, 40LL, 1))
      {
        v31 = (dispatch_source_s *)objc_getProperty(a1, v30, 40LL, 1);
        dispatch_time_t v32 = dispatch_time(0x8000000000000000LL, 1000000000 * v9);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));

        objc_initWeak((id *)buf, a1);
        id v34 = objc_getProperty(a1, v33, 40LL, 1);
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke_5;
        handler[3] = &unk_18A08FAC8;
        v35 = (dispatch_source_s *)v34;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_source_set_event_handler(v35, handler);

        v37 = (dispatch_object_s *)objc_getProperty(a1, v36, 40LL, 1);
        dispatch_activate(v37);
        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        ne_log_obj();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1876B1000, v38, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
        }
      }
    }
  }
}

- (id)invokeIKERekeyHandler
{
  id result = objc_getProperty(a1, a2, 56LL, 1);
  if (result)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, v4, 56LL, 1);
    return (id)Property[2]();
  }

  return result;
}

void __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startIKETimer:timeoutHandler:](WeakRetained, 0LL, 0LL);
    -[NEIKEv2Rekey invokeIKERekeyHandler](v3, v2);
    id WeakRetained = v3;
  }
}

void __45__NEIKEv2Rekey_startIKETimer_timeoutHandler___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startIKETimer:timeoutHandler:](WeakRetained, 0LL, 0LL);
    -[NEIKEv2Rekey invokeIKERekeyHandler](v3, v2);
    id WeakRetained = v3;
  }
}

- (void)startChildTimer:(void *)a3 timeoutHandler:
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v7 = v5;
  if (a1)
  {
    if (a2) {
      a1[3] = a2;
    }
    if (v5) {
      objc_setProperty_atomic_copy(a1, v6, v5, 64LL);
    }
    int v8 = a1[3];
    uint64_t v9 = 45LL * v8;
    if (v8 <= 2) {
      double v10 = (double)v8 * 5.0;
    }
    else {
      double v10 = 15.0;
    }
    if (objc_opt_class())
    {
      if (objc_getProperty(a1, v11, 24LL, 1))
      {
        objc_msgSend(objc_getProperty(a1, v12, 24, 1), "cancel");
      }

      else
      {
        if (objc_getProperty(a1, v12, 32LL, 1))
        {
          id v13 = objc_alloc(NSString);
          v15 = (__CFString *)[v13 initWithFormat:@"com.apple.networkextension[%@ Child Lifetime]", objc_getProperty(a1, v14, 32, 1)];
        }

        else
        {
          v15 = @"com.apple.networkextension[NEIKEv2PacketTunnelProvider Child Lifetime]";
        }

        v16 = (void *)[objc_alloc(MEMORY[0x189612AA0]) initWithIdentifier:v15];
        objc_setProperty_atomic(a1, v17, v16, 24LL);
      }

      ne_log_obj();
      v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)NEGetSystemWakeTime();
        *(_DWORD *)buf = 138413058;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        __int16 v49 = 2112;
        v50 = v19;
        _os_log_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_INFO,  "%@: Setting Rekey Child timer for %llu seconds, leeway %f seconds, last wake date %@",  buf,  0x2Au);
      }

      objc_initWeak((id *)buf, a1);
      id v21 = objc_getProperty(a1, v20, 24LL, 1);
      id v22 = MEMORY[0x1895F8AE0];
      v41[0] = MEMORY[0x1895F87A8];
      v41[1] = 3221225472LL;
      v41[2] = __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke;
      v41[3] = &unk_18A08D7F8;
      objc_copyWeak(&v42, (id *)buf);
      [v21 scheduleWithFireInterval:MEMORY[0x1895F8AE0] leewayInterval:v41 queue:(double)(unint64_t)v9 handler:v10];

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }

    else
    {
      if (objc_getProperty(a1, v11, 48LL, 1))
      {
        Property = (dispatch_source_s *)objc_getProperty(a1, v23, 48LL, 1);
        dispatch_source_cancel(Property);
        objc_setProperty_atomic(a1, v25, 0LL, 48LL);
      }

      ne_log_obj();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        v44 = a1;
        __int16 v45 = 2048;
        uint64_t v46 = v9;
        __int16 v47 = 2048;
        double v48 = v10;
        _os_log_impl( &dword_1876B1000,  v26,  OS_LOG_TYPE_INFO,  "%@: Setting Rekey Child timer for %llu seconds, leeway %f seconds",  buf,  0x20u);
      }

      dispatch_source_t v27 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, MEMORY[0x1895F8AE0]);
      objc_setProperty_atomic(a1, v28, v27, 48LL);

      if (objc_getProperty(a1, v29, 48LL, 1))
      {
        v31 = (dispatch_source_s *)objc_getProperty(a1, v30, 48LL, 1);
        dispatch_time_t v32 = dispatch_time(0x8000000000000000LL, 1000000000 * v9);
        dispatch_source_set_timer(v31, v32, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v10 * 1000000000.0));

        objc_initWeak((id *)buf, a1);
        id v34 = objc_getProperty(a1, v33, 48LL, 1);
        handler[0] = MEMORY[0x1895F87A8];
        handler[1] = 3221225472LL;
        handler[2] = __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke_11;
        handler[3] = &unk_18A08FAC8;
        v35 = (dispatch_source_s *)v34;
        objc_copyWeak(&v40, (id *)buf);
        dispatch_source_set_event_handler(v35, handler);

        v37 = (dispatch_object_s *)objc_getProperty(a1, v36, 48LL, 1);
        dispatch_activate(v37);
        objc_destroyWeak(&v40);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        ne_log_obj();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1876B1000, v38, OS_LOG_TYPE_FAULT, "dispatch_source_create failed", buf, 2u);
        }
      }
    }
  }
}

- (id)invokeChildRekeyHandler
{
  id result = objc_getProperty(a1, a2, 64LL, 1);
  if (result)
  {
    Property = (uint64_t (**)(void))objc_getProperty(a1, v4, 64LL, 1);
    return (id)Property[2]();
  }

  return result;
}

void __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startChildTimer:timeoutHandler:](WeakRetained, 0LL, 0LL);
    -[NEIKEv2Rekey invokeChildRekeyHandler](v3, v2);
    id WeakRetained = v3;
  }
}

void __47__NEIKEv2Rekey_startChildTimer_timeoutHandler___block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    -[NEIKEv2Rekey startChildTimer:timeoutHandler:](WeakRetained, 0LL, 0LL);
    -[NEIKEv2Rekey invokeChildRekeyHandler](v3, v2);
    id WeakRetained = v3;
  }
}

@end