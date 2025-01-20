@interface NEIKEv2MOBIKE
- (id)initWithQueue:(void *)a3 tunnelProvider:;
- (void)dealloc;
- (void)initiateMOBIKE:(uint64_t)a3 pathStatus:(void *)a4 serverAddress:(char)a5 earlyDisconnect:;
- (void)mobikeDisconnect;
- (void)mobikeStartWaitTimer;
- (void)mobikeStopWaitTimer;
- (void)startMOBIKE:(uint64_t)a1;
@end

@implementation NEIKEv2MOBIKE

- (void)dealloc
{
  if (self && objc_getProperty(self, a2, 32LL, 1)) {
    -[NEIKEv2MOBIKE mobikeStopWaitTimer](self, v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEIKEv2MOBIKE;
  -[NEIKEv2MOBIKE dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)mobikeStopWaitTimer
{
  if (a1)
  {
    if (objc_getProperty(a1, a2, 32LL, 1))
    {
      Property = (dispatch_source_s *)objc_getProperty(a1, v3, 32LL, 1);
      dispatch_source_cancel(Property);
      objc_setProperty_atomic(a1, v5, 0LL, 32LL);
    }
  }

- (id)initWithQueue:(void *)a3 tunnelProvider:
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  v8 = v7;
  if (!a1) {
    goto LABEL_6;
  }
  if (!v6)
  {
    ne_log_obj();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      a1 = 0LL;
      goto LABEL_6;
    }

    *(_DWORD *)buf = 136315138;
    v15 = "-[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]";
    v12 = "%s called with null queue";
LABEL_12:
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v11, OS_LOG_TYPE_FAULT, v12, buf, 0xCu);
    goto LABEL_10;
  }

  if (!v7)
  {
    ne_log_obj();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    *(_DWORD *)buf = 136315138;
    v15 = "-[NEIKEv2MOBIKE initWithQueue:tunnelProvider:]";
    v12 = "%s called with null tunnelProvider";
    goto LABEL_12;
  }

  v13.receiver = a1;
  v13.super_class = (Class)&OBJC_CLASS___NEIKEv2MOBIKE;
  v9 = (id *)objc_msgSendSuper2(&v13, sel_init);
  a1 = v9;
  if (v9)
  {
    objc_storeStrong(v9 + 5, a2);
    objc_storeWeak(a1 + 3, v8);
  }

- (void)mobikeStartWaitTimer
{
  if (a1 && !objc_getProperty(a1, a2, 32LL, 1))
  {
    char v4 = a1[10];
    Property = (dispatch_queue_s *)objc_getProperty(a1, v3, 40LL, 1);
    if ((v4 & 1) != 0)
    {
      v10[0] = MEMORY[0x1895F87A8];
      v10[1] = 3221225472LL;
      v10[2] = __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke_2;
      v10[3] = &unk_18A090390;
      v10[4] = a1;
      id v6 = v10;
      uint64_t v7 = 10LL;
    }

    else
    {
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke;
      v11[3] = &unk_18A090390;
      v11[4] = a1;
      id v6 = v11;
      uint64_t v7 = 2LL;
    }

    NECreateTimerSource(Property, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(a1, v9, v8, 32LL);
  }

uint64_t __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 && (*(_BYTE *)(v3 + 10) & 1) == 0)
  {
    *(_BYTE *)(v3 + 10) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    SEL v5 = WeakRetained;
    if (WeakRetained)
    {
      WeakRetained[21] &= ~1u;
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __31__NEIKEv2MOBIKE_mobikeReassert__block_invoke;
      v7[3] = &unk_18A0907E8;
      v7[4] = v3;
      [WeakRetained setTunnelNetworkSettings:0 completionHandler:v7];
    }

    uint64_t v3 = *(void *)(a1 + 32);
  }

  -[NEIKEv2MOBIKE mobikeStopWaitTimer]((void *)v3, a2);
  return -[NEIKEv2MOBIKE mobikeStartWaitTimer](*(void *)(a1 + 32));
}

void __37__NEIKEv2MOBIKE_mobikeStartWaitTimer__block_invoke_2(uint64_t a1, const char *a2)
{
}

- (void)mobikeDisconnect
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    if (WeakRetained)
    {
      id v2 = WeakRetained;
      -[NEIKEv2PacketTunnelProvider handleInterfaceDown](WeakRetained);
      id WeakRetained = v2;
    }
  }

void __31__NEIKEv2MOBIKE_mobikeReassert__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 24));
    if (WeakRetained)
    {
      SEL v5 = WeakRetained;
      [WeakRetained setReasserting:1];
    }
  }
}

- (void)startMOBIKE:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SEL v5 = v3;
  if (a1)
  {
    if (v3)
    {
      *(_BYTE *)(a1 + 8) = 1;
      *(_BYTE *)(a1 + 9) = 0;
      if (*(void *)(a1 + 72)
        || (uint64_t v6 = objc_msgSend(objc_getProperty((id)a1, v4, 48, 1), "interfaceIndex"),
            v6 != objc_msgSend(objc_getProperty((id)a1, v7, 56, 1), "interfaceIndex"))
        || objc_getProperty((id)a1, v4, 16LL, 1))
      {
        uint64_t v8 = 1LL;
        Property = (__CFString *)objc_getProperty((id)a1, v4, 16LL, 1);
        v10 = @"0";
        if (Property) {
          v10 = Property;
        }
        v11 = v10;
        [MEMORY[0x189608DF8] endpointWithHostname:v5 port:v11];
        v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v8 = 0LL;
        v12 = 0LL;
      }

      ++*(void *)(a1 + 72);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      if (WeakRetained)
      {
        id v15 = objc_getProperty((id)a1, v13, 48LL, 1);
        objc_setProperty_atomic((id)a1, v16, v15, 56LL);
        objc_getProperty(WeakRetained, v17, 240LL, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc_getProperty((id)a1, v19, 48, 1), "interfaceName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        id v22 = objc_getProperty((id)a1, v21, 40LL, 1);
        v23[1] = 3221225472LL;
        v23[2] = __29__NEIKEv2MOBIKE_startMOBIKE___block_invoke;
        v23[3] = &unk_18A08D718;
        v23[4] = a1;
        v23[0] = MEMORY[0x1895F87A8];
        [v18 sendMOBIKEWithRetries:1 retryInterval:0 interfaceName:v20 invalidateTransport:v8 resetEndpoint:v12 callbackQueue:v22 callback:v23];
      }
    }

    else
    {
      ne_log_obj();
      v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = "-[NEIKEv2MOBIKE startMOBIKE:]";
        _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "%s called with null serverAddress", buf, 0xCu);
      }
    }
  }
}

void __29__NEIKEv2MOBIKE_startMOBIKE___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  if (!v10) {
    goto LABEL_18;
  }
  char v11 = *(_BYTE *)(v10 + 11);
  *(_BYTE *)(v10 + 8) = 0;
  uint64_t v12 = *(void *)(a1 + 32);
  if (!v12) {
    goto LABEL_18;
  }
  *(_BYTE *)(v12 + 11) = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  if (!v13) {
    goto LABEL_18;
  }
  if ((*(_BYTE *)(v13 + 9) & 1) != 0)
  {
    *(void *)(v13 + 72) = 0LL;
  }

  else
  {
    if (*(void *)(v13 + 64) != 1LL)
    {
      *(void *)(v13 + 72) = 0LL;
      goto LABEL_18;
    }

    if (a3)
    {
      *(void *)(v13 + 72) = 0LL;
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14) {
        *(_BYTE *)(v14 + 10) = 0;
      }
      goto LABEL_18;
    }

    if ((v11 & 1) != 0 || *(void *)(v13 + 72) >= 4uLL)
    {
      ne_log_obj();
      SEL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl( &dword_1876B1000,  v17,  OS_LOG_TYPE_ERROR,  "mobike failed after max retries",  (uint8_t *)&v19,  2u);
      }

      -[NEIKEv2MOBIKE mobikeDisconnect](*(void *)(a1 + 32));
      goto LABEL_18;
    }

    ne_log_obj();
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v9;
      _os_log_impl(&dword_1876B1000, v18, OS_LOG_TYPE_INFO, "mobike failed with error %@", (uint8_t *)&v19, 0xCu);
    }
  }

  id v15 = *(void **)(a1 + 32);
  if (v15)
  {
    id Property = objc_getProperty(v15, v8, 80LL, 1);
    -[NEIKEv2MOBIKE startMOBIKE:](v15, Property);
  }

- (void)initiateMOBIKE:(uint64_t)a3 pathStatus:(void *)a4 serverAddress:(char)a5 earlyDisconnect:
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v9 = a4;
  if (a1)
  {
    ne_log_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 134218498;
      uint64_t v20 = a3;
      __int16 v21 = 2048;
      id v22 = a2;
      __int16 v23 = 2112;
      id v24 = v9;
      _os_log_impl( &dword_1876B1000,  v10,  OS_LOG_TYPE_DEFAULT,  "initiate mobike - path status %ld ifIndex %lu server address %@",  (uint8_t *)&v19,  0x20u);
    }

    id v12 = v9;
    if (a2
      && (uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189608E00]) initWithInterfaceIndex:a2], a2 = v13, v12)
      && a3 == 1
      && v13)
    {
      objc_setProperty_atomic((id)a1, v11, v13, 48LL);
      objc_setProperty_atomic((id)a1, v14, v12, 80LL);
      *(_BYTE *)(a1 + 9) = 1;
      *(void *)(a1 + 64) = 1LL;
      -[NEIKEv2MOBIKE mobikeStopWaitTimer]((void *)a1, v15);

      if ((*(_BYTE *)(a1 + 11) & 1) == 0) {
        *(_BYTE *)(a1 + 11) = a5;
      }
      if ((*(_BYTE *)(a1 + 8) & 1) != 0)
      {
        ne_log_obj();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_1876B1000, v18, OS_LOG_TYPE_INFO, "mobike in progress", (uint8_t *)&v19, 2u);
        }
      }

      else
      {
        -[NEIKEv2MOBIKE startMOBIKE:](a1, v12);
      }
    }

    else
    {
      objc_setProperty_atomic((id)a1, v11, 0LL, 48LL);
      objc_setProperty_atomic((id)a1, v16, 0LL, 80LL);
      *(_BYTE *)(a1 + 9) = 0;
      *(void *)(a1 + 64) = 2LL;
      -[NEIKEv2MOBIKE mobikeStartWaitTimer]((_BYTE *)a1, v17);
    }
  }
}

@end