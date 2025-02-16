@interface NEIKEv2CompanionDatapath
- (id)description;
- (os_unfair_lock_s)connected;
- (uint64_t)getStopReasonFromConnectionError:(uint64_t)a1;
- (void)cancelLocked;
- (void)dealloc;
- (void)resetConnectionLocked;
- (void)setupConnectionLocked;
- (void)signalCompletionSemaphoreLocked;
@end

@implementation NEIKEv2CompanionDatapath

- (id)description
{
  id v4 = objc_alloc(NSString);
  v5 = v4;
  if (!self)
  {
    v15 = (void *)[v4 initWithFormat:@"Cmpn[%llu %@%s%s %@]", 0, 0, ", ", 0];
    v2 = 0LL;
    v12 = 0LL;
    v7 = 0LL;
    v8 = 0LL;
LABEL_12:

    goto LABEL_13;
  }

  unint64_t identifier = self->_identifier;
  v7 = self->_remoteEndpoint;
  v8 = self->_connectedEndpointString;
  v9 = "";
  if (v8) {
    v10 = " vpn-server ";
  }
  else {
    v10 = "";
  }
  v11 = self->_connectedEndpointString;
  if (v11)
  {
    v2 = self->_connectedEndpointString;
    v9 = -[NSString UTF8String](v2, "UTF8String");
    v12 = v11;
  }

  else
  {
    v12 = 0LL;
  }

  unint64_t state = self->_state;
  if (state >= 4) {
    v14 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"Unknown(%u)",  self->_state);
  }
  else {
    v14 = off_18A08D670[state];
  }
  v15 = (void *)[v5 initWithFormat:@"Cmpn[%llu %@%s%s %@]", identifier, v7, v10, v9, v14];

  if (v11) {
    goto LABEL_12;
  }
LABEL_13:

  return v15;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (self && self->_state == 3)
  {
    ne_log_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_impl(&dword_1876B1000, v3, OS_LOG_TYPE_DEFAULT, "%@: dealloc", buf, 0xCu);
    }
  }

  else
  {
    ne_log_obj();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v6 = self;
      _os_log_fault_impl(&dword_1876B1000, v3, OS_LOG_TYPE_FAULT, "%@: dealloc without cancellation", buf, 0xCu);
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NEIKEv2CompanionDatapath;
  -[NEIKEv2CompanionDatapath dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
}

- (void)cancelLocked
{
  *(_BYTE *)(a1 + 9) = 3;
  -[NEIKEv2CompanionDatapath resetConnectionLocked](a1);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    int v3 = -[NEIKEv2CompanionDatapath getStopReasonFromConnectionError:](a1, *(void **)(a1 + 96));
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __40__NEIKEv2CompanionDatapath_cancelLocked__block_invoke;
    v4[3] = &unk_18A08D3E8;
    id v5 = WeakRetained;
    int v6 = v3;
    [v5 stopTunnelWithReason:14 completionHandler:v4];
    -[NEIKEv2CompanionDatapath signalCompletionSemaphoreLocked](a1);
  }
}

- (void)resetConnectionLocked
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 12));
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = a1;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "%@: reset-connection", (uint8_t *)&v5, 0xCu);
  }

  int v3 = *(nw_connection **)(a1 + 32);
  if (v3)
  {
    nw_connection_cancel(v3);
    objc_super v4 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0LL;
  }

- (uint64_t)getStopReasonFromConnectionError:(uint64_t)a1
{
  int v3 = a2;
  objc_super v4 = v3;
  if (a1)
  {
    if (!v3) {
      goto LABEL_9;
    }
    if (nw_error_get_error_domain(v3) == nw_error_domain_dns)
    {
      a1 = 17LL;
      goto LABEL_10;
    }

    if (nw_error_get_error_domain(v4) != nw_error_domain_posix)
    {
LABEL_9:
      a1 = 7LL;
      goto LABEL_10;
    }

    a1 = 7LL;
    uint64_t v5 = (nw_error_get_error_code(v4) - 32);
    if (v5 <= 0x21)
    {
      if (((1LL << v5) & 0x2026C0001LL) != 0)
      {
        a1 = 4LL;
      }

      else if (v5 == 28)
      {
        a1 = 12LL;
      }
    }
  }

void __40__NEIKEv2CompanionDatapath_cancelLocked__block_invoke(uint64_t a1)
{
}

- (void)signalCompletionSemaphoreLocked
{
  v2 = *(dispatch_semaphore_s **)(a1 + 80);
  if (v2)
  {
    dispatch_semaphore_signal(v2);
    int v3 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = 0LL;
  }

- (os_unfair_lock_s)connected
{
  v1 = a1;
  if (a1)
  {
    v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    v1 = (os_unfair_lock_s *)(BYTE1(v1[2]._os_unfair_lock_opaque) == 2);
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

- (void)setupConnectionLocked
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner((os_unfair_lock_t)(a1 + 12));
  ne_log_obj();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v19 = a1;
    _os_log_impl(&dword_1876B1000, v2, OS_LOG_TYPE_DEFAULT, "%@: starting", buf, 0xCu);
  }

  legacy_tcp_socket = (nw_parameters *)nw_parameters_create_legacy_tcp_socket();
  objc_super v4 = nw_parameters_copy_default_protocol_stack(legacy_tcp_socket);
  options = nw_udp_create_options();
  nw_protocol_stack_set_transport_protocol(v4, options);

  nw_parameters_set_required_interface_subtype();
  nw_parameters_set_effective_bundle_id();
  uint64_t v6 = (nw_endpoint *)[*(id *)(a1 + 64) copyCEndpoint];
  nw_parameters_set_local_endpoint(legacy_tcp_socket, v6);

  nw_parameters_set_reuse_local_address(legacy_tcp_socket, 1);
  uint64_t v7 = (nw_endpoint *)[*(id *)(a1 + 56) copyCEndpoint];
  v8 = nw_connection_create(v7, legacy_tcp_socket);

  nw_connection_set_queue(v8, *(dispatch_queue_t *)(a1 + 72));
  objc_initWeak((id *)buf, (id)a1);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke;
  v15[3] = &unk_18A08D438;
  objc_copyWeak(&v17, (id *)buf);
  v9 = v8;
  v16 = v9;
  MEMORY[0x1895ACCFC](v9, v15, v10, v11);
  nw_connection_start(v9);
  v12 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v9;
  v13 = v9;

  ++*(_BYTE *)(a1 + 10);
  v14 = *(void **)(a1 + 96);
  *(void *)(a1 + 96) = 0LL;

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

void __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v8 = (uint64_t)WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 3);
    if (*(_BYTE *)(v8 + 9) == 3 || *(void *)(v8 + 32) != *(void *)(a1 + 32)) {
      goto LABEL_4;
    }
    if (v6 || (a2 & 0xFFFFFFFE) == 4)
    {
      objc_storeStrong((id *)(v8 + 96), a3);
      ne_log_obj();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v8;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2080;
        uint64_t v34 = nw_connection_state_to_string();
        _os_log_impl(&dword_1876B1000, v17, OS_LOG_TYPE_DEFAULT, "%@: connection error %@ state %s", buf, 0x20u);
      }

      if (nw_error_get_error_code(v6) == 48)
      {
        -[NEIKEv2CompanionDatapath resetConnectionLocked](v8);
        if (*(unsigned __int8 *)(v8 + 10) <= 5u)
        {
          objc_initWeak((id *)buf, (id)v8);
          dispatch_time_t v18 = dispatch_time(0x8000000000000000LL, 1000000000LL * *(unsigned __int8 *)(v8 + 10));
          uint64_t v19 = *(void **)(v8 + 72);
          block[0] = MEMORY[0x1895F87A8];
          block[1] = 3221225472LL;
          block[2] = __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_20;
          block[3] = &unk_18A08DB50;
          uint64_t v20 = v19;
          objc_copyWeak(&v28, (id *)buf);
          id v27 = *(id *)(a1 + 32);
          dispatch_after(v18, v20, block);

          os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));
          objc_destroyWeak(&v28);
          objc_destroyWeak((id *)buf);
          goto LABEL_5;
        }
      }

      else if (a2 == 4)
      {
        if (*(_BYTE *)(v8 + 8))
        {
          id v21 = objc_loadWeakRetained((id *)(v8 + 88));
          v22 = v21;
          if (v21)
          {
            -[NEIKEv2PacketTunnelProvider handleCompanionProxyDatapathFailure:](v21, *(const char **)(v8 + 16));
            os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));

            goto LABEL_5;
          }
        }
      }

      -[NEIKEv2CompanionDatapath cancelLocked](v8);
      goto LABEL_4;
    }

    if (a2 != 3)
    {
LABEL_4:
      os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 12));
      goto LABEL_5;
    }

    objc_storeStrong((id *)(v8 + 96), 0LL);
    *(_WORD *)(v8 + 8) = 513;
    v9 = *(nw_connection **)(a1 + 32);
    uint64_t v10 = (nw_protocol_definition *)nw_proxy_copy_shoes_definition();
    nw_protocol_metadata_t v11 = nw_connection_copy_protocol_metadata(v9, v10);

    if (!v11)
    {
      ne_log_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v8;
        _os_log_fault_impl(&dword_1876B1000, v23, OS_LOG_TYPE_FAULT, "%@: no connection metadata found", buf, 0xCu);
      }

      -[NEIKEv2CompanionDatapath cancelLocked](v8);
      goto LABEL_33;
    }

    v12 = (nw_endpoint *)nw_shoes_metadata_copy_remote_endpoint();
    [NSString stringWithUTF8String:nw_endpoint_get_hostname(v12)];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v8 + 40), v13);

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    uint64_t v34 = (uint64_t)__Block_byref_object_copy__11387;
    v35 = __Block_byref_object_dispose__11388;
    id v36 = 0LL;
    v14 = (id *)(id)v8;
    nw_shoes_metadata_enumerate_resolved_endpoints();
    objc_storeStrong(v14 + 6, *(id *)(*(void *)&buf[8] + 40LL));
    v15 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    if (nw_path_uses_interface_type(v15, nw_interface_type_wifi))
    {
      uint64_t v16 = 1LL;
    }

    else
    {
      if (!nw_path_uses_interface_type(v15, nw_interface_type_cellular))
      {
LABEL_28:
        ne_log_obj();
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          id v25 = v14[6];
          *(_DWORD *)v29 = 138412546;
          v30 = v14;
          __int16 v31 = 2112;
          id v32 = v25;
          _os_log_impl(&dword_1876B1000, v24, OS_LOG_TYPE_DEFAULT, "%@: connected w/resolved endpoints %@", v29, 0x16u);
        }

        _Block_object_dispose(buf, 8);
LABEL_33:
        -[NEIKEv2CompanionDatapath signalCompletionSemaphoreLocked](v8);

        goto LABEL_4;
      }

      uint64_t v16 = 2LL;
    }

    v14[3] = (id)v16;
    goto LABEL_28;
  }

void __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_20(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v4 = WeakRetained + 3;
    uint64_t v8 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 3);
    if (BYTE1(v8[2]._os_unfair_lock_opaque) != 3)
    {
      id v5 = *(id *)&v8[8]._os_unfair_lock_opaque;
      if (!v5 || (v6 = *(void *)&v8[8]._os_unfair_lock_opaque, uint64_t v7 = *(void *)(a1 + 32), v5, v6 == v7)) {
        -[NEIKEv2CompanionDatapath setupConnectionLocked](v8);
      }
    }

    os_unfair_lock_unlock(v4);
    int v3 = v8;
  }
}

uint64_t __49__NEIKEv2CompanionDatapath_setupConnectionLocked__block_invoke_21(uint64_t a1, void *a2)
{
  int v3 = a2;
  if (nw_endpoint_get_type(v3) == nw_endpoint_type_address)
  {
    [NSString stringWithUTF8String:nw_endpoint_get_hostname(v3)];
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      uint64_t v7 = *(void *)(v6 + 40);
    }
    else {
      uint64_t v7 = 0LL;
    }
    if (([v4 isEqualToString:v7] & 1) == 0)
    {
      uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      if (!v8)
      {
        id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
        nw_protocol_metadata_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      }

      [v8 addObject:v5];
    }
  }

  return 1LL;
}

@end