unint64_t xpc_remote_connection_get_version_flags()
{
  return ((unint64_t)XPC_REMOTE_CONNECTION_PROTOCOL_VERSION_CURRENT << 56) | 6;
}

uint64_t xpc_remote_connection_get_failsafe_version_flags()
{
  return 0x100000000000000LL;
}

uint64_t xpc_remote_connection_get_remote_service_version(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  v2 = v1;
  uint64_t v10 = 0LL;
  v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  objc_msgSend(v1, "internal_queue");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __xpc_remote_connection_get_remote_service_version_block_invoke;
  v7[3] = &unk_189F87948;
  id v8 = v2;
  v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_186DD9BB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __xpc_remote_connection_get_remote_service_version_block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 168LL);
  return result;
}

void xpc_remote_connection_set_local_service_version(void *a1, uint64_t a2)
{
  id v3 = a1;
  if (!v3) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  id v4 = v3;
  objc_msgSend(v3, "internal_queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __xpc_remote_connection_set_local_service_version_block_invoke;
  block[3] = &unk_189F87970;
  id v8 = v4;
  uint64_t v9 = a2;
  id v6 = v4;
  dispatch_sync(v5, block);
}

uint64_t __xpc_remote_connection_set_local_service_version_block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  if ((_DWORD)result) {
    __xpc_remote_connection_set_local_service_version_block_invoke_cold_1();
  }
  *(void *)(*(void *)(a1 + 32) + 160LL) = *(void *)(a1 + 40);
  return result;
}

uint64_t xpc_remote_connection_create_with_remote_service(void *a1, void *a2, char a3)
{
  id v6 = a1;
  id v7 = a2;
  if (!v6) {
    xpc_remote_connection_create_with_remote_service_cold_1();
  }
  id v8 = v7;
  uint64_t v9 = _xpc_remote_connection_alloc();
  [(id)v9 setType:1];
  objc_msgSend((id)v9, "setTarget_queue:", v8);
  objc_storeStrong((id *)(v9 + 184), a1);
  *(void *)(v9 + 16_Block_object_dispose(va, 8) = remote_service_get_version();
  unint64_t xpc_remote_connection_version_flags = remote_service_get_xpc_remote_connection_version_flags();
  if (!xpc_remote_connection_version_flags) {
    goto LABEL_8;
  }
  unint64_t v11 = xpc_remote_connection_version_flags;
  if (!HIBYTE(xpc_remote_connection_version_flags) || (xpc_remote_connection_version_flags & 1) != 0)
  {
    _log();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      xpc_remote_connection_create_with_remote_service_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    }

LABEL_8:
    unint64_t v11 = 0x100000000000000LL;
  }

  if (remote_service_xpc_remote_connection_tls_enabled())
  {
    uint64_t v20 = remote_service_copy_xpc_remote_connection_tls_identity();
    if (!v20) {
      xpc_remote_connection_create_with_remote_service_cold_2();
    }
    v21 = (void *)v20;
    remote_service_copy_xpc_remote_connection_tls_verify_block();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "internal_queue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_set_tls((void *)v9, v21, v22, v23);
  }

  v24 = (void *)remote_service_copy_device();
  char xpc_remote_connection_mode_flags = remote_device_get_xpc_remote_connection_mode_flags();
  _xpc_remote_connection_parse_flags((void *)v9, v11, xpc_remote_connection_mode_flags | a3);

  return v9;
}

uint64_t _xpc_remote_connection_alloc()
{
  if (install_libxpc_hooks_onceToken != -1) {
    dispatch_once(&install_libxpc_hooks_onceToken, &__block_literal_global_190);
  }
  uint64_t v0 = objc_opt_new();
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v1 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.xpc.remote.internal", v1);
  objc_msgSend((id)v0, "setInternal_queue:", v2);

  *(_DWORD *)(v0 + 192) = -1;
  *(void *)(v0 + 144) = 1LL;
  return v0;
}

id _log()
{
  if (_log_onceToken != -1) {
    dispatch_once(&_log_onceToken, &__block_literal_global_192);
  }
  return (id)_log_logger;
}

void xpc_remote_connection_set_tls(void *a1, void *a2, void *a3, void *a4)
{
  unint64_t v11 = a1;
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!v7) {
    xpc_remote_connection_set_tls_cold_1();
  }
  objc_msgSend(v11, "setTls_identity:", v7);
  uint64_t v10 = (void *)[v8 copy];
  objc_msgSend(v11, "setTls_verify:", v10);

  objc_msgSend(v11, "setTls_verify_queue:", v9);
}

void _xpc_remote_connection_parse_flags(void *a1, unint64_t a2, char a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  _xpc_remote_connection_parse_mode_flags(v5, a3);
  id v6 = v5;
  unint64_t v7 = HIBYTE(a2);
  if (!HIBYTE(a2) || (a2 & 1) != 0) {
    _xpc_remote_connection_parse_flags_cold_1(&v9, v10);
  }
  v6[66] = v7;
  *((void *)v6 + 9) = a2 & 6;
  id v8 = v6;
}

_DWORD *xpc_remote_connection_create_with_connected_fd(int a1, void *a2, unint64_t a3, char a4)
{
  id v7 = a2;
  id v8 = (_DWORD *)_xpc_remote_connection_alloc();
  [v8 setType:0];
  objc_msgSend(v8, "setTarget_queue:", v7);

  v8[48] = a1;
  _xpc_remote_connection_parse_flags(v8, a3, a4);
  return v8;
}

void *xpc_remote_connection_create_with_nw_connection(void *a1, void *a2, unint64_t a3, char a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v9 = (void *)_xpc_remote_connection_alloc();
  [v9 setType:0];
  objc_msgSend(v9, "setTarget_queue:", v8);

  uint64_t v10 = (void *)v9[25];
  v9[25] = v7;

  _xpc_remote_connection_parse_flags(v9, a3, a4);
  return v9;
}

void *xpc_remote_connection_create_remote_service_listener(const char *a1, void *a2, char a3)
{
  id v5 = a2;
  if (!a1) {
    xpc_remote_connection_create_remote_service_listener_cold_1();
  }
  id v6 = v5;
  id v7 = (void *)_xpc_remote_connection_alloc();
  [v7 setType:2];
  v7[1] = strdup(a1);
  objc_msgSend(v7, "setTarget_queue:", v6);
  _xpc_remote_connection_parse_mode_flags(v7, a3 | 1);

  return v7;
}

void _xpc_remote_connection_parse_mode_flags(void *a1, char a2)
{
  id v3 = a1;
  id v4 = v3;
  if ((a2 & 1) != 0)
  {
    v3[65] = 1;
    *((void *)v3 + 1_Block_object_dispose(va, 8) = 2LL;
    _log();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_parse_mode_flags_cold_1();
    }
  }

  if ((a2 & 2) != 0) {
    v4[208] = 1;
  }
  v4[64] = (a2 & 4) != 0;
}

void xpc_remote_connection_create_connected_pair( void *a1, void *a2, void *a3, unint64_t a4, char a5)
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  v10[0] = 0LL;
  if (!socketpair(1, 1, 0, (int *)v10))
  {
    *a1 = xpc_remote_connection_create_with_connected_fd(v10[0], v9, a4, a5);
    *a2 = xpc_remote_connection_create_with_connected_fd(SHIDWORD(v10[0]), v9, a4, a5 | 1u);
  }
}

uint64_t xpc_remote_connection_create_asymmetric_connected_ipv6_pair( void *a1, unint64_t a2, char a3, void *a4, unint64_t a5, char a6, void *a7)
{
  id v13 = a7;
  _log();
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t connected_ipv6_pair = remote_socket_create_connected_ipv6_pair();

  if (!(_DWORD)connected_ipv6_pair)
  {
    *a1 = xpc_remote_connection_create_with_connected_fd(0, v13, a2, a3);
    *a4 = xpc_remote_connection_create_with_connected_fd(0, v13, a5, a6 | 1u);
  }

  return connected_ipv6_pair;
}

uint64_t xpc_remote_connection_create_connected_ipv6_pair( void *a1, void *a2, void *a3, unint64_t a4, char a5)
{
  return xpc_remote_connection_create_asymmetric_connected_ipv6_pair(a1, a4, a5, a2, a4, a5, a3);
}

uint64_t xpc_remote_connection_copy_remote_address_string(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  dispatch_queue_t v2 = v1;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  uint64_t v13 = 0LL;
  objc_msgSend(v1, "internal_queue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __xpc_remote_connection_copy_remote_address_string_block_invoke;
  v7[3] = &unk_189F87998;
  id v8 = v2;
  id v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  uint64_t v5 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v5;
}

void sub_186DDA51C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void __xpc_remote_connection_copy_remote_address_string_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    dispatch_queue_t v2 = (nw_endpoint *)nw_connection_copy_connected_remote_endpoint();
    if (v2)
    {
      id v3 = v2;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = nw_endpoint_copy_address_string(v2);
      dispatch_queue_t v2 = v3;
    }
  }
}

id xpc_remote_connection_copy_remote_endpoint(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  dispatch_queue_t v2 = v1;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  uint64_t v13 = __Block_byref_object_copy_;
  uint64_t v14 = __Block_byref_object_dispose_;
  id v15 = 0LL;
  objc_msgSend(v1, "internal_queue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __xpc_remote_connection_copy_remote_endpoint_block_invoke;
  v7[3] = &unk_189F87998;
  id v8 = v2;
  id v9 = &v10;
  id v4 = v2;
  dispatch_sync(v3, v7);

  id v5 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_186DDA680( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __xpc_remote_connection_copy_remote_endpoint_block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16LL))
  {
    uint64_t v2 = nw_connection_copy_connected_remote_endpoint();
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

void xpc_remote_connection_set_event_handler(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  objc_msgSend(v4, "setEvent_handler:", v3);
}

void xpc_remote_connection_set_target_queue(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  objc_msgSend(v4, "setTarget_queue:", v3);
}

void xpc_remote_connection_set_traffic_class(void *a1, int a2)
{
  id v3 = a1;
  v3[44] = a2;
}

uint64_t xpc_remote_connection_is_server(void *a1)
{
  id v1 = a1;
  if (!v1) {
    xpc_remote_connection_get_remote_service_version_cold_1();
  }
  uint64_t v2 = v1[65];

  return v2;
}

uint64_t xpc_remote_connection_create_configure_tls_block(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __xpc_remote_connection_create_configure_tls_block_block_invoke;
  v13[3] = &unk_189F879C0;
  id v15 = v7;
  id v16 = v6;
  id v14 = v5;
  id v8 = v7;
  id v9 = v6;
  id v10 = v5;
  uint64_t v11 = [v13 copy];

  return v11;
}

void __xpc_remote_connection_create_configure_tls_block_block_invoke(uint64_t a1, id a2)
{
  options = (sec_protocol_options *)a2;
  sec_protocol_options_set_local_identity(options, *(sec_identity_t *)(a1 + 32));
  sec_protocol_options_set_min_tls_protocol_version(options, tls_protocol_version_TLSv12);
  sec_protocol_options_set_max_tls_protocol_version(options, tls_protocol_version_TLSv12);
  sec_protocol_options_append_tls_ciphersuite_group(options, tls_ciphersuite_group_default);
  sec_protocol_options_set_peer_authentication_required(options, 1);
  id v3 = *(void **)(a1 + 48);
  if (v3)
  {
    id v4 = *(dispatch_queue_s **)(a1 + 40);
    if (v4) {
      sec_protocol_options_set_verify_block(options, v3, v4);
    }
  }
}

void xpc_remote_connection_setup_nw_parameters(void *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  nw_protocol_http2_transport_identifier();
  id v2 = (id)nw_parameters_create_protocol_parameters();
  if (!v2) {
    xpc_remote_connection_setup_nw_parameters_cold_1(&v5, buf);
  }
  id v3 = v2;

  if (xpc_remote_connection_setup_nw_parameters_pred != -1) {
    dispatch_once(&xpc_remote_connection_setup_nw_parameters_pred, &__block_literal_global);
  }
  if (xpc_remote_connection_setup_nw_parameters_window_size != 0x100000)
  {
    _log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = xpc_remote_connection_setup_nw_parameters_window_size;
      _os_log_impl( &dword_186DD8000,  v4,  OS_LOG_TYPE_DEFAULT,  "Using non-default XPC_REMOTE_CONNECTION_H2_WINDOW_SIZE=%d",  buf,  8u);
    }
  }

  nw_protocol_http2_transport_parameters_set_stream_receive_window_size();
  nw_protocol_http2_transport_parameters_set_connection_receive_window_size();
  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();
  nw_parameters_add_protocol_stack_member();
}

const char *__xpc_remote_connection_setup_nw_parameters_block_invoke()
{
  uint64_t result = getenv("XPC_REMOTE_CONNECTION_H2_WINDOW_SIZE");
  if (result)
  {
    uint64_t result = (const char *)strtoul(result, 0LL, 0);
    if (result) {
      xpc_remote_connection_setup_nw_parameters_window_size = (int)result;
    }
  }

  return result;
}

void xpc_remote_connection_activate(void *a1)
{
  id v1 = a1;
  objc_msgSend(v1, "internal_queue");
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __xpc_remote_connection_activate_block_invoke;
  block[3] = &unk_189F87A28;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void __xpc_remote_connection_activate_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) state])
  {
    objc_msgSend(*(id *)(a1 + 32), "event_handler");
    id v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2) {
      __xpc_remote_connection_activate_block_invoke_cold_1();
    }
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      id v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v5 = dispatch_queue_create("com.apple.xpc.remote.target", v4);
      objc_msgSend(*(id *)(a1 + 32), "setTarget_queue:", v5);
    }

    int v6 = [*(id *)(a1 + 32) type];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6 == 2)
    {
      id v8 = v7;
      objc_msgSend(v8, "internal_queue");
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v9);

      [v8 setState:4];
      uint64_t v10 = v8[1];
      objc_msgSend(v8, "internal_queue");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(void *)&__int128 v15 = MEMORY[0x1895F87A8];
      *((void *)&v15 + 1) = 3221225472LL;
      id v16 = ___xpc_remote_connection_listen_block_invoke;
      uint64_t v17 = &unk_189F87B80;
      id v18 = v8;
      uint64_t v12 = v8;
      xpc_remote_listener_create_for_remote_service(v10, v11, &v15, &__block_literal_global_199);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setListener:v13];
    }

    else
    {
      [v7 setState:1];
    }
  }

void _xpc_remote_connection_connect(void *a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_msgSend(v1, "internal_queue");
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  [v1 setState:2];
  _log();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v1;
    _os_log_impl(&dword_186DD8000, v3, OS_LOG_TYPE_INFO, "[%p] Connecting", buf, 0xCu);
  }

  v1[19] = v1[18];
  int v4 = [v1 type];
  switch(v4)
  {
    case 0:
      goto LABEL_8;
    case 1:
      objc_msgSend(v1, "internal_queue");
      dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      int v6 = v1;
      remote_service_connect_socket();

      break;
    case 2:
      __break(1u);
LABEL_8:
      _xpc_remote_connection_connect_complete(v1, -1);
      break;
  }
}

void xpc_remote_connection_cancel(void *a1)
{
  id v1 = a1;
  objc_msgSend(v1, "internal_queue");
  id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __xpc_remote_connection_cancel_block_invoke;
  block[3] = &unk_189F87A28;
  id v5 = v1;
  id v3 = v1;
  dispatch_sync(v2, block);
}

void __xpc_remote_connection_cancel_block_invoke(uint64_t a1)
{
}

void _xpc_remote_connection_cancel(void *a1)
{
  id v2 = a1;
  objc_msgSend(v2, "internal_queue");
  id v1 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v1);

  __xpc_remote_connection_teardown(v2, 0, 89LL);
}

void xpc_remote_connection_send_message(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (MEMORY[0x186E49278]() != MEMORY[0x1895F9250]) {
    xpc_remote_connection_send_message_cold_1();
  }
  objc_msgSend(v3, "internal_queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __xpc_remote_connection_send_message_block_invoke;
  block[3] = &unk_189F87A50;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);
}

void __xpc_remote_connection_send_message_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) state] <= 5)
  {
    uint64_t reply_msg_id = _xpc_dictionary_get_reply_msg_id();
    if (!reply_msg_id || [*(id *)(a1 + 32) state] == 4)
    {
      _xpc_remote_message_create(*(void **)(a1 + 32), *(void **)(a1 + 40));
      id v3 = (void *)objc_claimAutoreleasedReturnValue();
      _log();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
      if (reply_msg_id)
      {
        if (v5)
        {
          uint64_t v6 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v6;
          _os_log_impl(&dword_186DD8000, v4, OS_LOG_TYPE_INFO, "[%p] Sending outgoing reply", buf, 0xCu);
        }

        _xpc_remote_connection_send_reply_message(*(void **)(a1 + 32), v3);
      }

      else
      {
        if (v5)
        {
          uint64_t v7 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v7;
          _os_log_impl(&dword_186DD8000, v4, OS_LOG_TYPE_INFO, "[%p] Enqueueing outgoing message", buf, 0xCu);
        }

        _xpc_remote_connection_enqueue_message(*(void **)(a1 + 32), v3);
      }
    }
  }

void *_xpc_remote_message_create(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = (void *)objc_opt_new();
  uint64_t reply_msg_id = _xpc_dictionary_extract_reply_msg_id();
  v5[1] = reply_msg_id;
  if (reply_msg_id)
  {
    xpc_dictionary_get_remote_connection(v4);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 != v3) {
      _xpc_remote_message_create_cold_2();
    }
  }

  else
  {
    v5[1] = v3[18];
    v3[18] += 2LL;
  }

  size_t v19 = 0LL;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = ___xpc_remote_message_create_block_invoke;
  v16[3] = &unk_189F87F48;
  uint64_t v8 = v5;
  id v17 = v8;
  id v9 = v3;
  id v18 = v9;
  uint64_t v10 = (const void *)MEMORY[0x186E4929C](v4, &v19, v16);
  if (!v10 || !v19) {
    _xpc_remote_message_create_cold_1();
  }
  dispatch_data_t v11 = dispatch_data_create(v10, v19, 0LL, (dispatch_block_t)*MEMORY[0x1895F8A88]);
  uint64_t v12 = (void *)v8[3];
  v8[3] = v11;

  uint64_t v13 = v18;
  uint64_t v14 = v8;

  return v14;
}

void _xpc_remote_connection_send_reply_message(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  if (!v4[1] || (v4[1] & 1LL) != v3[65])
  {
    uint64_t v12 = 0LL;
    memset(v17, 0, sizeof(v17));
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    uint64_t v9 = v4[1];
    int v13 = 134218240;
    uint64_t v14 = v3;
    __int16 v15 = 2048;
    uint64_t v16 = v9;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_6:
    _xpc_remote_connection_send_reply_message_cold_1(&v13, v17);
  }

  uint64_t v5 = v4[1];
  _xpc_remote_connection_send_ool_message_content(v3, v4);
  uint64_t v6 = (void *)*((void *)v3 + 7);
  uint64_t v7 = (void *)v4[3];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  void v10[2] = ___xpc_remote_connection_send_reply_message_block_invoke;
  v10[3] = &unk_189F87D40;
  id v11 = v3;
  uint64_t v8 = v3;
  xpc_remote_channel_send(v6, v5, 131073, v7, v10);
}

void _xpc_remote_connection_enqueue_message(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_msgSend(v3, "internal_queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = v3[10];
  uint64_t v12 = v3;
  id v7 = v4;
  uint64_t v8 = v7;
  if (v3[10])
  {
    uint64_t v9 = (id *)v12[11];
    objc_storeStrong(v9 + 21, a2);
  }

  else
  {
    id v10 = v7;
    uint64_t v9 = (id *)v3[10];
    v3[10] = v10;
  }

  id v11 = v12[11];
  v12[11] = v8;

  if (!v6) {
    _xpc_remote_connection_wakeup(v12);
  }
}

void xpc_remote_connection_send_barrier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_msgSend(v3, "internal_queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __xpc_remote_connection_send_barrier_block_invoke;
  block[3] = &unk_189F87A78;
  id v9 = v3;
  id v10 = v4;
  id v6 = v4;
  id v7 = v3;
  dispatch_sync(v5, block);
}

void __xpc_remote_connection_send_barrier_block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) state] < 6)
  {
    id v2 = (void *)objc_opt_new();
    uint64_t v3 = MEMORY[0x186E48FB4](*(void *)(a1 + 40));
    id v4 = (void *)v2[2];
    v2[2] = v3;

    _log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v6;
      _os_log_impl(&dword_186DD8000, v5, OS_LOG_TYPE_INFO, "[%p] Enqueueing barrier", buf, 0xCu);
    }

    _xpc_remote_connection_enqueue_message(*(void **)(a1 + 32), v2);
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v7, *(dispatch_block_t *)(a1 + 40));
  }

void xpc_remote_connection_send_message_with_reply(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (MEMORY[0x186E49278](v8) != MEMORY[0x1895F9250]) {
    xpc_remote_connection_send_message_cold_1();
  }
  objc_msgSend(v7, "internal_queue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __xpc_remote_connection_send_message_with_reply_block_invoke;
  block[3] = &unk_189F87AC8;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v7;
  dispatch_sync(v11, block);
}

void __xpc_remote_connection_send_message_with_reply_block_invoke(id *a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (_xpc_dictionary_get_reply_msg_id()) {
    __xpc_remote_connection_send_message_with_reply_block_invoke_cold_2(&v20, buf);
  }
  id v2 = (dispatch_queue_s *)a1[6];
  if (!v2)
  {
    dispatch_get_global_queue(0LL, 0LL);
    id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  }

  if ([a1[4] state] < 6)
  {
    uint64_t v3 = _xpc_remote_message_create(a1[4], a1[5]);
    *(_BYTE *)(v3 + 176) = 1;
    _log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = a1[4];
      uint64_t v6 = *(void *)(v3 + 8);
      *(_DWORD *)buf = 134218240;
      id v22 = v5;
      __int16 v23 = 2048;
      uint64_t v24 = v6;
      _os_log_impl(&dword_186DD8000, v4, OS_LOG_TYPE_INFO, "[%p] Enqueueing send of %llx", buf, 0x16u);
    }

    _xpc_remote_connection_enqueue_message(a1[4], (void *)v3);
    uint64_t v7 = objc_opt_new();
    *(void *)(v7 + _Block_object_dispose(va, 8) = *(void *)(v3 + 8);
    objc_storeStrong((id *)(v7 + 24), v2);
    uint64_t v8 = MEMORY[0x186E48FB4](a1[7]);
    id v9 = *(void **)(v7 + 16);
    *(void *)(v7 + 16) = v8;

    id v10 = (void **)a1[4];
    id v11 = (id)v7;
    id v12 = v11;
    id v13 = v10 + 16;
    if (v10[16]) {
      id v13 = (void **)((char *)v10[17] + 32);
    }
    id v14 = *v13;
    *id v13 = v11;
    id v15 = v10;
    id v16 = v12;

    id v17 = v15[17];
    v15[17] = v16;
  }

  else
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __xpc_remote_connection_send_message_with_reply_block_invoke_50;
    v18[3] = &unk_189F87AA0;
    id v19 = a1[7];
    dispatch_async(v2, v18);
    uint64_t v3 = (uint64_t)v19;
  }
}

uint64_t __xpc_remote_connection_send_message_with_reply_block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

id xpc_remote_connection_send_message_with_reply_sync(void *a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  objc_msgSend(v3, "internal_queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  _log();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_connection_send_message_with_reply_sync_cold_4();
  }

  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  __int16 v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0LL;
  objc_msgSend(v3, "internal_queue");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __xpc_remote_connection_send_message_with_reply_sync_block_invoke;
  v16[3] = &unk_189F87AF0;
  id v19 = &v20;
  id v9 = v3;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  xpc_remote_connection_send_message_with_reply(v9, v4, v8, v16);

  _log();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_connection_send_message_with_reply_sync_cold_3();
  }

  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (!v21[5])
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v28 = 0u;
    os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
    int v26 = 134217984;
    uint64_t v27 = 0LL;
    _os_log_send_and_compose_impl();
    uint64_t v15 = _os_crash_msg();
    xpc_remote_connection_send_message_with_reply_sync_cold_1(v15);
  }

  _log();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_connection_send_message_with_reply_sync_cold_2();
  }

  id v13 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v13;
}

void sub_186DDBE0C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

void __xpc_remote_connection_send_message_with_reply_sync_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
  _log();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_connection_send_message_with_reply_sync_block_invoke_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t _xpc_remote_connection_desc(void *a1, char *a2, size_t a3)
{
  if (a3 < 2) {
    return 1LL;
  }
  id v5 = a1;
  uint64_t v6 = type2str[[v5 type]];
  dispatch_semaphore_t v7 = state2str[[v5 state]];
  remote_service_name = _xpc_remote_connection_get_remote_service_name(v5);
  LODWORD(a2) = snprintf( a2,  a3,  "<%s: %p> { type = %s, state = %s, remote service name = %s, server mode = %d, protocol version number = %u, protocol feature flags = 0x%llx, local service version = %llu, remote service version = %llu, tr affic class = %u }",  "remote connection",  v5,  v6,  v7,  remote_service_name,  v5[65],  v5[66],  *((void *)v5 + 9),  *((void *)v5 + 20),  *((void *)v5 + 21),  *((_DWORD *)v5 + 44));

  size_t v9 = (int)a2;
  return v9 + 1;
}

uint64_t _xpc_remote_connection_debug_desc(void *a1, char *a2, size_t a3)
{
  if (a3 < 2) {
    return 1LL;
  }
  id v4 = a1;
  id v10 = type2str[[v4 type]];
  size_t v9 = state2str[[v4 state]];
  remote_service_name = _xpc_remote_connection_get_remote_service_name(v4);
  int v6 = snprintf( a2,  a3,  "<%s: %p> { type = %s, state = %s, remote service name = %s, server mode = %d, protocol version number = %u, pro tocol feature flags = 0x%llx, local service version = %llu, remote service version = %llu, traffic class = %u, (root, reply) helo received = (%d, %d), next msg id = %llu, first msg id = %llu, send in progress = %d, preexis ting socket = %d",  "remote connection",  v4,  v10,  v9,  remote_service_name,  v4[65],  v4[66],  *((void *)v4 + 9),  *((void *)v4 + 20),  *((void *)v4 + 21),  *((_DWORD *)v4 + 44),  v4[32],  v4[48],  *((void *)v4 + 18),  *((void *)v4 + 19),  objc_msgSend(v4, "send_in_progress"),  *((_DWORD *)v4 + 48));

  size_t v7 = v6;
  if (v6 >= a3) {
    size_t v7 = a3 - 1;
  }
  return v7 + 1;
}

uint64_t __install_libxpc_hooks_block_invoke()
{
  qword_18C4B1A40 = objc_opt_class();
  return xpc_install_remote_hooks();
}

void xpc_remote_connection_message_dispose(void *a1, uint64_t a2)
{
  id v3 = a1;
  objc_msgSend(v3, "internal_queue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __xpc_remote_connection_message_dispose_block_invoke;
  v6[3] = &unk_189F87970;
  id v7 = v3;
  uint64_t v8 = a2;
  id v5 = v3;
  dispatch_async(v4, v6);
}

void xpc_remote_connection_send_reply(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  xpc_dictionary_get_remote_connection(v3);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  if (!v1) {
    xpc_remote_connection_send_reply_cold_1(&v4, v5);
  }
  id v2 = v1;

  xpc_remote_connection_send_message(v2, v3);
}

void __xpc_remote_connection_message_dispose_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) state] == 4)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = *(id *)(a1 + 32);
    if (!v2) {
      __xpc_remote_connection_message_dispose_block_invoke_cold_2(&v9, buf);
    }
    uint64_t v4 = v3;
    uint64_t v5 = objc_opt_new();
    *(void *)(v5 + _Block_object_dispose(va, 8) = v2;
    objc_storeStrong((id *)(v5 + 24), MEMORY[0x1895F8AA8]);

    _log();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 134218240;
      uint64_t v11 = v7;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      _os_log_impl(&dword_186DD8000, v6, OS_LOG_TYPE_INFO, "[%p] Sending error reply for msg_id %llu", buf, 0x16u);
    }

    _xpc_remote_connection_send_reply_message(*(void **)(a1 + 32), (void *)v5);
  }

void ___log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.xpc.remote", "connection");
  id v1 = (void *)_log_logger;
  _log_logger = (uint64_t)v0;
}

void ___xpc_remote_connection_listen_block_invoke(uint64_t a1, void *a2, int a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if (!v5) {
    ___xpc_remote_connection_listen_block_invoke_cold_1(&v36, v37);
  }
  if (a3 == -1) {
    ___xpc_remote_connection_listen_block_invoke_cold_2(&v36, v37);
  }
  uint64_t v6 = v5;
  char v7 = remote_device_get_xpc_remote_connection_mode_flags() | 1;
  unint64_t xpc_remote_connection_version_flags = remote_device_get_xpc_remote_connection_version_flags();
  if (!xpc_remote_connection_version_flags) {
    goto LABEL_9;
  }
  unint64_t v9 = xpc_remote_connection_version_flags;
  if (!HIBYTE(xpc_remote_connection_version_flags) || (xpc_remote_connection_version_flags & 1) != 0)
  {
    _log();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_listen_block_invoke_cold_4(v10, v11, v12, v13, v14, v15, v16, v17);
    }

LABEL_9:
    unint64_t v9 = 0x100000000000000LL;
  }

  objc_msgSend(*(id *)(a1 + 32), "target_queue");
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = xpc_remote_connection_create_with_connected_fd(a3, v18, v9, v7);

  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void *)(v20 + 160);
  if (v21)
  {
    xpc_remote_connection_set_local_service_version(v19, v21);
    uint64_t v20 = *(void *)(a1 + 32);
  }

  int v22 = *(_DWORD *)(v20 + 176);
  if (v22) {
    xpc_remote_connection_set_traffic_class(v19, v22);
  }
  if (remote_device_xpc_remote_connection_tls_enabled())
  {
    uint64_t v23 = remote_device_copy_xpc_remote_connection_tls_identity();
    if (!v23) {
      ___xpc_remote_connection_listen_block_invoke_cold_3();
    }
    uint64_t v24 = (void *)v23;
    remote_device_copy_xpc_remote_connection_tls_verify_block();
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "internal_queue");
    int v26 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_set_tls(v19, v24, v25, v26);
  }

  objc_msgSend(*(id *)(a1 + 32), "event_handler");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "target_queue");
  __int128 v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___xpc_remote_connection_listen_block_invoke_196;
  block[3] = &unk_189F87B58;
  id v29 = *(id *)(a1 + 32);
  id v34 = v19;
  id v35 = v27;
  id v33 = v29;
  __int128 v30 = v19;
  id v31 = v27;
  dispatch_async(v28, block);
}

uint64_t ___xpc_remote_connection_listen_block_invoke_196(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) state];
  return result;
}

void ___xpc_remote_connection_listen_block_invoke_2()
{
}

void _xpc_remote_connection_connect_complete(void *a1, int a2)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  uint64_t v4 = v3 + 5;
  if (v3[5]) {
    _xpc_remote_connection_connect_complete_cold_12(&v36, buf);
  }
  id v5 = v3;
  if ([v3 type])
  {
    if (a2 == -1) {
      _xpc_remote_connection_connect_complete_cold_11(&v36, buf);
    }
  }

  else if (a2 != -1)
  {
    _xpc_remote_connection_connect_complete_cold_10(&v36, buf);
  }

  if ([v5 state] == 2)
  {
    if ([v5 type] || (int v9 = *((_DWORD *)v5 + 48), v9 == -1))
    {
      if (a2 == -1)
      {
        id v6 = v5[25];
        if (!v6) {
          _xpc_remote_connection_connect_complete_cold_1();
        }
        objc_storeStrong(v5 + 2, v6);
        id v7 = v5[25];
        v5[25] = 0LL;

        goto LABEL_26;
      }
    }

    else
    {
      *((_DWORD *)v5 + 4_Block_object_dispose(va, 8) = -1;
      a2 = v9;
    }

    if (fcntl(a2, 4, 4LL) == -1) {
      _xpc_remote_connection_connect_complete_cold_4(&v36, buf);
    }
    if (fcntl(a2, 73, 1LL) == -1)
    {
      if (*__error() != 22) {
        _xpc_remote_connection_connect_complete_cold_5(&v36, buf);
      }
      _log();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl( &dword_186DD8000,  v27,  OS_LOG_TYPE_DEFAULT,  "[%p] fcntl(F_SETNOSIGPIPE) failed with EINVAL",  buf,  0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }

    else if (*((_DWORD *)v5 + 44) && (int v42 = *((_DWORD *)v5 + 44), setsockopt(a2, 0xFFFF, 4230, &v42, 4u) == -1))
    {
      if (*__error() != 22) {
        _xpc_remote_connection_connect_complete_cold_6(&v36, buf);
      }
      _log();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl( &dword_186DD8000,  v29,  OS_LOG_TYPE_DEFAULT,  "[%p] fcntl(SO_TRAFFIC_CLASS) failed with EINVAL",  buf,  0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }

    else
    {
      _xpc_remote_connection_create_nw_parameters(v5);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = nw_connection_create_with_connected_socket_and_parameters();
      if (v11)
      {
        id v12 = v5[2];
        v5[2] = (id)v11;

LABEL_26:
        if (!*((_BYTE *)v5 + 208))
        {
          _log();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( &dword_186DD8000,  v13,  OS_LOG_TYPE_DEFAULT,  "xpc_remote_connection_connect_complete setup_nw_listener",  buf,  2u);
          }

          _xpc_remote_connection_setup_nw_listener(v5);
        }

        uint64_t v36 = 0LL;
        v37 = &v36;
        uint64_t v38 = 0x3032000000LL;
        v39 = __Block_byref_object_copy_;
        v40 = __Block_byref_object_dispose_;
        id v41 = 0LL;
        uint64_t v14 = MEMORY[0x1895F87A8];
        v33[0] = MEMORY[0x1895F87A8];
        v33[1] = 3221225472LL;
        v33[2] = ___xpc_remote_connection_connect_complete_block_invoke;
        v33[3] = &unk_189F87C50;
        uint64_t v15 = v5;
        id v34 = v15;
        id v35 = &v36;
        uint64_t v16 = (void *)MEMORY[0x186E48FB4](v33);
        v31[0] = v14;
        v31[1] = 3221225472LL;
        v31[2] = ___xpc_remote_connection_connect_complete_block_invoke_2;
        v31[3] = &unk_189F87C78;
        uint64_t v17 = v15;
        __int128 v32 = v17;
        id v18 = (void *)MEMORY[0x186E48FB4](v31);
        int v19 = v17[64];
        uint64_t v20 = (void *)*((void *)v17 + 2);
        objc_msgSend(v17, "internal_queue");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19) {
          char v22 = 2;
        }
        else {
          char v22 = 3;
        }
        uint64_t v23 = xpc_remote_channel_create(v20, v21, v17[66], v22, v16, v18);
        uint64_t v24 = (void *)v37[5];
        _OWORD v37[5] = v23;

        id v25 = (void *)v37[5];
        if (!v25)
        {
          __int128 v47 = 0u;
          __int128 v48 = 0u;
          __int128 v45 = 0u;
          __int128 v46 = 0u;
          *(_OWORD *)buf = 0u;
          os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
          int v42 = 134217984;
          uint64_t v43 = 0LL;
          _os_log_send_and_compose_impl();
          uint64_t v30 = _os_crash_msg();
          xpc_remote_connection_send_message_with_reply_sync_cold_1(v30);
        }

        objc_storeStrong(v4, v25);
        _log();
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_connect_complete_cold_3();
        }

        v17[32] = 0;
        v17[48] = 0;

        _Block_object_dispose(&v36, 8);
        goto LABEL_48;
      }

      _log();
      __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v5;
        _os_log_impl(&dword_186DD8000, v28, OS_LOG_TYPE_DEFAULT, "[%p] Couldn't create nw_connection", buf, 0xCu);
      }

      _xpc_remote_connection_connect_doa(v5, a2);
    }
  }

  else
  {
    _log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_connect_complete_cold_9();
    }

    if (a2 != -1 && close(a2) == -1) {
      _xpc_remote_connection_connect_complete_cold_8();
    }
  }

LABEL_48:
}

void sub_186DDCE00( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
}

void ___xpc_remote_connection_connect_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  _log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2 == -1)
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v10 = 134218240;
      uint64_t v11 = v9;
      __int16 v12 = 1024;
      int v13 = a3;
      _os_log_impl( &dword_186DD8000,  v6,  OS_LOG_TYPE_INFO,  "[%p] remote_service_connect_socket: %{errno}d",  (uint8_t *)&v10,  0x12u);
    }

    _xpc_remote_connection_connect_failed(*(void **)(a1 + 32), a3);
  }

  else
  {
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 134217984;
      uint64_t v11 = v8;
      _os_log_impl(&dword_186DD8000, v6, OS_LOG_TYPE_INFO, "[%p] Got socket to Remote Service.", (uint8_t *)&v10, 0xCu);
    }

    _xpc_remote_connection_connect_complete(*(void **)(a1 + 32), a2);
  }

void _xpc_remote_connection_connect_failed(void *a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  if (v3[5]) {
    _xpc_remote_connection_connect_failed_cold_5(&v6, v7);
  }
  uint64_t v4 = v3;
  if (v3[2]) {
    _xpc_remote_connection_connect_failed_cold_4(&v6, v7);
  }
  if ([v3 state] == 2)
  {
    if ((_DWORD)a2 == 83)
    {
      _xpc_remote_connection_cancel(v4);
    }

    else
    {
      _xpc_remote_connection_disconnect(v4, a2);
    }
  }

  else
  {
    _log();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_connect_failed_cold_3();
    }
  }
}

void _xpc_remote_connection_connect_doa(void *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  _log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v3;
    _os_log_impl(&dword_186DD8000, v4, OS_LOG_TYPE_DEFAULT, "[%p] fd is DOA; connect failed", buf, 0xCu);
  }

  if (v3[2]) {
    _xpc_remote_connection_connect_failed_cold_4(&v5, buf);
  }
  if (v3[3]) {
    _xpc_remote_connection_connect_doa_cold_3(&v5, buf);
  }
  if (v3[5]) {
    _xpc_remote_connection_connect_failed_cold_5(&v5, buf);
  }
  if (close(a2) == -1) {
    _xpc_remote_connection_connect_complete_cold_8();
  }
  _xpc_remote_connection_connect_failed(v3, 22LL);
}

nw_parameters_t _xpc_remote_connection_create_nw_parameters(void *a1)
{
  id v1 = a1;
  nw_parameters_t v2 = nw_parameters_create();
  xpc_remote_connection_setup_nw_parameters(v2);
  objc_msgSend(v1, "tls_identity");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v1, "tls_identity");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "tls_verify");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "tls_verify_queue");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = v4;
    id v8 = v5;
    nw_protocol_options_t options = nw_tls_create_options();
    configure_tls_block = (void (**)(void, void))xpc_remote_connection_create_configure_tls_block( v7,  v8,  v6);

    ((void (**)(void, nw_protocol_options_t))configure_tls_block)[2](configure_tls_block, options);
    nw_parameters_add_protocol_stack_member();
  }

  return v2;
}

void _xpc_remote_connection_setup_nw_listener(void *a1)
{
  id v1 = a1;
  _xpc_remote_connection_create_nw_parameters(v1);
  nw_parameters_t v2 = (nw_parameters *)objc_claimAutoreleasedReturnValue();
  id v3 = nw_listener_create_with_connection(v1[2], v2);
  -[nw_connection_t internal_queue](v1, "internal_queue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  nw_listener_set_queue(v3, v4);

  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = ___xpc_remote_connection_setup_nw_listener_block_invoke;
  v12[3] = &unk_189F87CA0;
  uint64_t v6 = v1;
  int v13 = v6;
  MEMORY[0x186E48DF8](v3, v12);
  v10[0] = v5;
  v10[1] = 3221225472LL;
  void v10[2] = ___xpc_remote_connection_setup_nw_listener_block_invoke_214;
  v10[3] = &unk_189F87CC8;
  uint64_t v11 = v6;
  id v7 = v6;
  nw_listener_set_new_connection_handler(v3, v10);
  nw_listener_start(v3);
  nw_connection_t v8 = v7[3];
  v7[3] = v3;
  uint64_t v9 = v3;
}

void ___xpc_remote_connection_connect_complete_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  uint64_t v6 = *(id *)(a1 + 32);
  id v7 = v5;
  objc_msgSend(v6, "internal_queue");
  nw_connection_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if ((id)v6[5] != v7) {
    ___xpc_remote_connection_connect_complete_block_invoke_cold_4(&size, &buf);
  }
  if (a2 == 2)
  {
    _log();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( &dword_186DD8000,  v15,  OS_LOG_TYPE_INFO,  "[%p] Root channel received canceled event",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v16 = (void *)v6[2];
    v6[2] = 0LL;

    uint64_t v17 = (void *)v6[5];
    v6[5] = 0LL;

    _xpc_remote_connection_disconnect(v6, a3);
  }

  else if (a2 == 1)
  {
    _log();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl( &dword_186DD8000,  v9,  OS_LOG_TYPE_INFO,  "[%p] Root channel ready, sending HELO",  (uint8_t *)&buf,  0xCu);
    }

    int v10 = v6;
    if ([v10 state] <= 4)
    {
      if ([v10 state] == 2)
      {
        [v10 setState:3];
        if (*((_BYTE *)v10 + 208))
        {
          _log();
          uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf) = 0;
            _os_log_impl( &dword_186DD8000,  v11,  OS_LOG_TYPE_DEFAULT,  "_xpc_remote_connection_ready setup_nw_listener",  (uint8_t *)&buf,  2u);
          }

          _xpc_remote_connection_setup_nw_listener(v10);
        }

        id v12 = MEMORY[0x1895F8AA8];
        xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
        int64_t v14 = v10[20];
        if (v14) {
          xpc_dictionary_set_int64(v13, "ServiceVersion", v14);
        }
        size_t size = 0LL;
        xpc_make_serialization();
        ___xpc_remote_connection_connect_complete_block_invoke_cold_1(&v18, &buf);
      }

      ___xpc_remote_connection_connect_complete_block_invoke_cold_2(&size, &buf);
    }
  }
}

void ___xpc_remote_connection_connect_complete_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
}

void _xpc_remote_connection_handle_read(void *a1, void *a2, id a3, uint64_t a4, void *a5)
{
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  id v10 = a2;
  uint64_t v11 = a5;
  id v12 = v11;
  if (a4 == 2)
  {
    _log();
    int64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_186DD8000, v14, OS_LOG_TYPE_INFO, "[%p] Received a PING", buf, 0xCu);
    }

    goto LABEL_9;
  }

  if (!(_BYTE)a4)
  {
    if ([v9 state] >= 5)
    {
      _log();
      xpc_object_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_186DD8000, v13, OS_LOG_TYPE_INFO, "[%p] Ignoring HELO received after disconnect", buf, 0xCu);
      }

      goto LABEL_6;
    }

    if (*((id *)v9 + 5) != v10)
    {
      if (*((id *)v9 + 7) != v10)
      {
        _log();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          _xpc_remote_connection_handle_read_cold_15();
        }
LABEL_54:

        __int128 v32 = (os_log_s *)v9;
LABEL_55:
        _xpc_remote_connection_disconnect(v32, 53LL);
        goto LABEL_56;
      }

      if (*((_BYTE *)v9 + 48))
      {
        _log();
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          _xpc_remote_connection_handle_read_cold_14();
        }
        goto LABEL_54;
      }

      *((_BYTE *)v9 + 4_Block_object_dispose(va, 8) = 1;
      _log();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_186DD8000, v20, OS_LOG_TYPE_INFO, "[%p] Received reply channel HELO", buf, 0xCu);
      }

LABEL_60:
      int64_t v14 = (os_log_s *)v9;
      if (*((_BYTE *)v14 + 32))
      {
        if (*((_BYTE *)v14 + 48))
        {
          -[os_log_s setState:](v14, "setState:", 4LL);
          _xpc_remote_connection_wakeup(v14);
LABEL_9:

LABEL_10:
          xpc_remote_channel_arm_read(v10);
          goto LABEL_56;
        }

        _log();
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_handle_read_cold_8();
        }
      }

      else
      {
        _log();
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_handle_read_cold_7();
        }
      }

      goto LABEL_9;
    }

    if (*((_BYTE *)v9 + 32))
    {
      _log();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        _xpc_remote_connection_handle_read_cold_13();
      }
      goto LABEL_54;
    }

    *((_BYTE *)v9 + 32) = 1;
    _log();
    int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_186DD8000, v19, OS_LOG_TYPE_INFO, "[%p] Received root channel HELO", buf, 0xCu);
    }

    uint64_t v20 = (os_log_s *)v9;
    if (v12 != (dispatch_data_s *)MEMORY[0x1895F8AA8] && v12)
    {
      *(void *)__int128 buf = 0LL;
      size_t size_ptr = 0LL;
      dispatch_data_t v21 = dispatch_data_create_map(v12, (const void **)buf, &size_ptr);
      uint64_t v22 = xpc_create_from_serialization();
      uint64_t v23 = (void *)v22;
      if (v22)
      {
        uint64_t v24 = MEMORY[0x186E49278](v22);
        uint64_t v25 = MEMORY[0x1895F9250];

        if (v24 == v25)
        {
          int v26 = (void *)MEMORY[0x186E491DC](v23);
          _log();
          uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
            _xpc_remote_connection_handle_read_cold_12();
          }

          free(v26);
          int64_t int64 = xpc_dictionary_get_int64(v23, "ServiceVersion");
          if (int64)
          {
            int64_t v29 = int64;
            _log();
            uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int128 buf = 134218240;
              *(void *)&uint8_t buf[4] = v20;
              __int16 v86 = 2048;
              int64_t v87 = v29;
              _os_log_impl( &dword_186DD8000,  v30,  OS_LOG_TYPE_INFO,  "[%p] HELO message specified ServiceVersion %lld",  buf,  0x16u);
            }

            *((void *)v20 + 21) = v29;
          }

LABEL_59:
          goto LABEL_60;
        }
      }

      else
      {
      }

      _log();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
        _xpc_remote_connection_handle_read_cold_11();
      }

      __int128 v32 = v20;
      goto LABEL_55;
    }

    _log();
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_connection_handle_read_cold_10();
    }
    goto LABEL_59;
  }

  if ((~(_DWORD)a4 & 0x30000) == 0)
  {
    _log();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_1();
    }
    goto LABEL_54;
  }

  if ((a4 & 0x20000) != 0)
  {
    if (*((id *)v9 + 7) != v10 && (*((_BYTE *)v9 + 72) & 4) != 0)
    {
      _log();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        _xpc_remote_connection_handle_read_cold_6();
      }
      goto LABEL_54;
    }

    if (!v11)
    {
      uint64_t v18 = (void *)MEMORY[0x1895F9198];
      id v34 = MEMORY[0x1895F9198];
      goto LABEL_67;
    }
  }

  else if (!v11)
  {
    _log();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_2();
    }
    goto LABEL_54;
  }

  *(void *)__int128 buf = 0LL;
  size_t size_ptr = 0LL;
  dispatch_data_t v67 = dispatch_data_create_map(v11, (const void **)buf, &size_ptr);
  MEMORY[0x186E492B4]();
  uint64_t v79 = MEMORY[0x1895F87A8];
  uint64_t v80 = 3221225472LL;
  v81 = ___xpc_remote_connection_handle_read_block_invoke;
  v82 = &unk_189F87DB8;
  id v16 = v9;
  id v83 = v16;
  uint64_t v17 = xpc_receive_remote_msg();
  if (!v17)
  {
    uint64_t v18 = v67;
    _log();
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_3();
    }

    _xpc_remote_connection_disconnect(v16, 53LL);
    goto LABEL_81;
  }

  uint64_t v18 = (void *)v17;

LABEL_67:
  _log();
  id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    uint64_t v36 = "(wanting reply)";
    *(_DWORD *)__int128 buf = 134218498;
    *(void *)&uint8_t buf[4] = v9;
    if ((a4 & 0x10000) == 0) {
      uint64_t v36 = (const char *)&unk_186DE9239;
    }
    __int16 v86 = 2048;
    int64_t v87 = (int64_t)a3;
    __int16 v88 = 2082;
    v89 = v36;
    _os_log_impl( &dword_186DD8000,  v35,  OS_LOG_TYPE_INFO,  "[%p] Message %llx received %{public}s, dispatching handler block",  buf,  0x20u);
  }

  if ((a4 & 0x20000) != 0)
  {
    v40 = (id *)v9;
    id v41 = (id *)v40[16];
    if (!v41)
    {
LABEL_77:

      goto LABEL_78;
    }

    int v42 = v41;
    while (v42[1] != a3)
    {
      uint64_t v43 = (id *)v42[4];

      int v42 = v43;
      if (!v43) {
        goto LABEL_77;
      }
    }

    __int128 v45 = v40;
    __int128 v46 = v42;
    __int128 v47 = v46;
    __int128 v48 = (id *)v40[16];
    if (v48 == v46)
    {
      v54 = v46;
      objc_storeStrong(v40 + 16, v54[4]);
      v55 = (id *)v54[4];
      if (!v55)
      {
        id v56 = v45[17];
        v45[17] = 0LL;

        v55 = (id *)v54[4];
      }

      v54[4] = 0LL;
    }

    else
    {
      uint64_t v49 = v48;
      if (!v49) {
        goto LABEL_103;
      }
      v50 = v49;
      while (1)
      {
        v51 = (id *)v50[4];
        if (v51 == v47) {
          break;
        }
        v52 = v51;

        v50 = v52;
        if (!v52) {
          goto LABEL_103;
        }
      }

      v68 = v45;
      v55 = v50;
      v57 = v50[4];
      if (!v57) {
        _xpc_remote_connection_handle_read_cold_5(&size_ptr, buf);
      }
      v58 = v57;

      v66 = v58;
      v59 = (void *)v58[4];
      id v60 = v59;
      v61 = v59;
      id v62 = v60;
      objc_storeStrong(v50 + 4, v61);
      v63 = v62;
      __int128 v45 = v68;
      if (!v63)
      {
        objc_storeStrong(v68 + 17, v50);
        v63 = 0LL;
      }

      v54 = v55;
    }

LABEL_103:
    if (v47)
    {
      v64 = (dispatch_queue_s *)v47[3];
      v76[0] = MEMORY[0x1895F87A8];
      v76[1] = 3221225472LL;
      v76[2] = ___xpc_remote_connection_handle_read_block_invoke_228;
      v76[3] = &unk_189F87A50;
      v77 = v47;
      id v78 = v18;
      v65 = v47;
      dispatch_async(v64, v76);
      xpc_remote_channel_arm_read(v10);

LABEL_81:
      goto LABEL_56;
    }

LABEL_78:
    _log();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      _xpc_remote_connection_handle_read_cold_4();
    }

    _xpc_remote_connection_disconnect(v40, 53LL);
    goto LABEL_81;
  }

  objc_msgSend(v9, "event_handler");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "target_queue");
  uint64_t v38 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___xpc_remote_connection_handle_read_block_invoke_2;
  block[3] = &unk_189F87E08;
  id v70 = v9;
  id v71 = v18;
  id v73 = v37;
  id v74 = a3;
  uint64_t v75 = a4;
  id v72 = v10;
  xpc_object_t v13 = v18;
  id v39 = v37;
  dispatch_async(v38, block);

LABEL_6:
LABEL_56:
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5 && nw_error_get_error_domain(v5) == nw_error_domain_posix)
  {
    uint64_t error_code = nw_error_get_error_code(v6);
    _log();
    nw_connection_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_setup_nw_listener_block_invoke_cold_1();
    }
  }

  else
  {
    uint64_t error_code = 0LL;
  }

  _log();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v13 = 134218240;
    uint64_t v14 = v10;
    __int16 v15 = 1024;
    unsigned int v16 = a2;
    _os_log_impl(&dword_186DD8000, v9, OS_LOG_TYPE_INFO, "[%p] listener moved to state %d", (uint8_t *)&v13, 0x12u);
  }

  if (a2 >= 3)
  {
    if (a2 == 4)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      id v12 = *(void **)(v11 + 24);
      *(void *)(v11 + 24) = 0LL;
    }

    _xpc_remote_connection_disconnect(*(void **)(a1 + 32), error_code);
  }
}

void _xpc_remote_connection_disconnect(void *a1, uint64_t a2)
{
  id v4 = a1;
  objc_msgSend(v4, "internal_queue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  __xpc_remote_connection_teardown(v4, 1, a2);
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke_214(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  objc_msgSend(v4, "internal_queue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if ([v4 state] < 5)
  {
    _log();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_186DD8000, v7, OS_LOG_TYPE_DEFAULT, "[%p] Got incoming h2 stream", (uint8_t *)&buf, 0xCu);
    }

    v33[0] = 0LL;
    v33[1] = v33;
    v33[2] = 0x2020000000LL;
    v33[3] = 0LL;
    uint64_t v27 = 0LL;
    __int128 v28 = &v27;
    uint64_t v29 = 0x3032000000LL;
    uint64_t v30 = __Block_byref_object_copy_;
    id v31 = __Block_byref_object_dispose_;
    id v32 = 0LL;
    uint64_t v8 = MEMORY[0x1895F87A8];
    *(void *)&__int128 buf = MEMORY[0x1895F87A8];
    *((void *)&buf + 1) = 3221225472LL;
    id v35 = ___xpc_remote_connection_handle_new_channel_block_invoke;
    uint64_t v36 = &unk_189F87D18;
    id v9 = v4;
    id v37 = v9;
    uint64_t v38 = &v27;
    id v39 = v33;
    uint64_t v10 = (void *)MEMORY[0x186E48FB4](&buf);
    v23[0] = v8;
    v23[1] = 3221225472LL;
    v23[2] = ___xpc_remote_connection_handle_new_channel_block_invoke_218;
    v23[3] = &unk_189F87D68;
    id v11 = v9;
    id v24 = v11;
    uint64_t v25 = &v27;
    int v26 = v33;
    id v12 = (void *)MEMORY[0x186E48FB4](v23);
    objc_msgSend(v11, "internal_queue");
    int v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = xpc_remote_channel_create(v5, v13, *((_BYTE *)v11 + 66), 0, v10, v12);
    __int16 v15 = (void *)v28[5];
    v28[5] = v14;

    if (*((_BYTE *)v11 + 65) && !*((void *)v11 + 7))
    {
      objc_storeStrong((id *)v11 + 7, (id)v28[5]);
    }

    else
    {
      unsigned int v16 = (id *)objc_opt_new();
      objc_storeStrong(v16 + 1, (id)v28[5]);
      id v17 = v11;
      uint64_t v18 = v16;
      int v19 = v18;
      if (*((void *)v17 + 14))
      {
        uint64_t v20 = (id *)*((id *)v17 + 15);
        objc_storeStrong(v20 + 2, v16);
      }

      else
      {
        dispatch_data_t v21 = v18;
        uint64_t v20 = (id *)*((void *)v17 + 14);
        *((void *)v17 + 14) = v21;
      }

      uint64_t v22 = (void *)*((void *)v17 + 15);
      *((void *)v17 + 15) = v19;
    }

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(v33, 8);
  }

  else
  {
    nw_connection_cancel((nw_connection_t)v5);
  }
}

void sub_186DDE69C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __xpc_remote_connection_teardown(void *a1, int a2, uint64_t a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  objc_msgSend(v5, "internal_queue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if ([v5 state] != 7)
  {
    if (!a2 && [v5 state] == 5)
    {
      [v5 setState:6];
      _log();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        id v34 = (id *)v5;
        _os_log_impl(&dword_186DD8000, v7, OS_LOG_TYPE_INFO, "[%p] disconnect => cancel promotion", buf, 0xCu);
      }
    }

    if ([v5 state] < 5)
    {
      if (a2 == 1)
      {
        _log();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = state2str[[v5 state]];
          *(_DWORD *)__int128 buf = 134218498;
          id v34 = (id *)v5;
          __int16 v35 = 2082;
          uint64_t v36 = v11;
          __int16 v37 = 1024;
          int v38 = a3;
          _os_log_impl( &dword_186DD8000,  v9,  OS_LOG_TYPE_DEFAULT,  "[%p] Connection Disconnected (state: %{public}s, error %{errno}d)",  buf,  0x1Cu);
        }
      }

      else
      {
        if (a2) {
          __xpc_remote_connection_teardown_cold_2(&v32, buf);
        }
        _log();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = state2str[[v5 state]];
          *(_DWORD *)__int128 buf = 134218242;
          id v34 = (id *)v5;
          __int16 v35 = 2082;
          uint64_t v36 = v10;
          _os_log_impl( &dword_186DD8000,  v9,  OS_LOG_TYPE_DEFAULT,  "[%p] Connection Canceled (state: %{public}s)",  buf,  0x16u);
        }

        a3 = 89LL;
      }

      *((_DWORD *)v5 + 45) = a3;
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        uint64_t v13 = 6LL;
      }
      else {
        uint64_t v13 = 5LL;
      }
      [v5 setState:v13];
      uint64_t v14 = (nw_listener *)*((void *)v5 + 3);
      if (v14) {
        nw_listener_cancel(v14);
      }
      uint64_t v15 = (void *)*((void *)v5 + 5);
      if (v15)
      {
        xpc_remote_channel_cancel(v15, a3);
      }

      else if (![v5 type])
      {
        int v16 = *((_DWORD *)v5 + 48);
        if (v16 != -1)
        {
          if (close(v16) == -1) {
            _xpc_remote_connection_connect_complete_cold_8();
          }
          *((_DWORD *)v5 + 4_Block_object_dispose(va, 8) = -1;
        }
      }

      id v17 = (void *)*((void *)v5 + 7);
      if (v17) {
        xpc_remote_channel_cancel(v17, a3);
      }
      id v18 = v5;
      int v19 = (void *)*((void *)v18 + 12);
      if (v19)
      {
        uint64_t v20 = 0LL;
        do
        {
          dispatch_data_t v21 = v19;
          objc_storeStrong((id *)v18 + 12, v21[7]);
          id v22 = v21[7];
          if (!v22)
          {
            uint64_t v23 = (void *)*((void *)v18 + 13);
            *((void *)v18 + 13) = 0LL;

            id v22 = v21[7];
          }

          v21[7] = 0LL;

          id v24 = (void (**)(id, uint64_t))v21[5];
          if (v24) {
            v24[2](v24, a3);
          }
          id v25 = v18;
          int v19 = (void *)*((void *)v18 + 12);
          uint64_t v20 = v21;
        }

        while (v19);
      }

      else
      {
        dispatch_data_t v21 = 0LL;
      }

      unsigned int v26 = *((_DWORD *)v5 + 45);
      uint64_t v8 = (id *)v18;
      uint64_t v27 = (void **)v8[14];
      if (v27)
      {
        __int128 v28 = v27;
        do
        {
          _log();
          uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            id v31 = (char *)v28[1];
            *(_DWORD *)__int128 buf = 134218240;
            id v34 = v8;
            __int16 v35 = 2048;
            uint64_t v36 = v31;
            _os_log_debug_impl(&dword_186DD8000, v29, OS_LOG_TYPE_DEBUG, "[%p] Canceling channel (%p)", buf, 0x16u);
          }

          xpc_remote_channel_cancel(v28[1], v26);
          uint64_t v30 = v28[2];

          __int128 v28 = v30;
        }

        while (v30);
      }
    }

    else
    {
      _log();
      uint64_t v8 = (id *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_connection_teardown_cold_1();
      }
    }

    __xpc_remote_connection_teardown_continue(v5);
  }
}

void __xpc_remote_connection_teardown_continue(void *a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_msgSend(v1, "internal_queue");
  nw_parameters_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (*((void *)v1 + 5))
  {
    _log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_6();
    }
  }

  else if (*((void *)v1 + 7))
  {
    _log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_5();
    }
  }

  else if (*((void *)v1 + 3))
  {
    _log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_4();
    }
  }

  else if (*((void *)v1 + 14))
  {
    _log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_connection_teardown_continue_cold_3();
    }
  }

  else
  {
    objc_msgSend(v1, "event_handler");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v1 state] == 5)
    {
      _log();
      id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_impl( &dword_186DD8000,  v5,  OS_LOG_TYPE_DEFAULT,  "[%p] Disconnect complete, delivering XPC_ERROR_CONNECTION_INTERRUTPED",  buf,  0xCu);
      }

      [v1 setState:1];
      uint64_t v6 = (void *)MEMORY[0x1895F9198];
      id v7 = MEMORY[0x1895F9198];
    }

    else
    {
      _log();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v1;
        _os_log_impl( &dword_186DD8000,  v8,  OS_LOG_TYPE_DEFAULT,  "[%p] Cancel complete, delivering XPC_ERROR_CONNECTION_INVALID",  buf,  0xCu);
      }

      [v1 setState:7];
      uint64_t v6 = (void *)MEMORY[0x1895F91A0];
      id v9 = MEMORY[0x1895F91A0];
      objc_msgSend(v1, "setEvent_handler:", 0);
    }

    _xpc_remote_connection_flush(v1, v6);
    if (*((void *)v1 + 12)) {
      __xpc_remote_connection_teardown_continue_cold_1(&v16, buf);
    }
    *((_DWORD *)v1 + 45) = 0;
    objc_msgSend(v1, "target_queue");
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = ____xpc_remote_connection_teardown_continue_block_invoke;
    v12[3] = &unk_189F87CF0;
    id v15 = v4;
    id v13 = v6;
    id v14 = v1;
    id v11 = v6;
    id v3 = v4;
    dispatch_async(v10, v12);
  }
}

void _xpc_remote_connection_flush(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  objc_msgSend(v3, "internal_queue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = _xpc_remote_connection_dequeue_message(v3);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = MEMORY[0x1895F9278];
    do
    {
      if (*(int *)(v7 + 32) >= 1)
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = v7 + 40;
        do
        {
          id v11 = *(id *)(v10 + 8 * v9);
          if (MEMORY[0x186E49278]() != v8) {
            _xpc_remote_connection_flush_cold_1();
          }
          id v12 = v3;
          id v13 = v11;
          id v14 = (dispatch_io_s *)xpc_file_transfer_copy_io();
          dispatch_io_close(v14, 0LL);
          objc_msgSend(v12, "target_queue");
          id v15 = (void *)objc_claimAutoreleasedReturnValue();

          xpc_file_transfer_send_finished();
          uint64_t v16 = *(void **)(v10 + 8 * v9);
          *(void *)(v10 + 8 * v9) = 0LL;

          ++v9;
        }

        while (v9 < *(int *)(v7 + 32));
      }

      if (*(void *)(v7 + 16))
      {
        objc_msgSend(v3, "target_queue");
        id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        dispatch_async(v17, *(dispatch_block_t *)(v7 + 16));
      }

      uint64_t v18 = _xpc_remote_connection_dequeue_message(v3);

      uint64_t v7 = v18;
    }

    while (v18);
  }

  id v19 = v3;
  uint64_t v20 = (void *)*((void *)v19 + 16);
  if (v20)
  {
    id v21 = 0LL;
    uint64_t v22 = MEMORY[0x1895F87A8];
    do
    {
      id v23 = v20;
      objc_storeStrong((id *)v19 + 16, *((id *)v23 + 4));
      id v24 = (void *)*((void *)v23 + 4);
      if (!v24)
      {
        id v25 = (void *)*((void *)v19 + 17);
        *((void *)v19 + 17) = 0LL;

        id v24 = (void *)*((void *)v23 + 4);
      }

      *((void *)v23 + 4) = 0LL;

      unsigned int v26 = (dispatch_queue_s *)*((void *)v23 + 3);
      v28[0] = v22;
      v28[1] = 3221225472LL;
      v28[2] = ___xpc_remote_connection_flush_block_invoke;
      v28[3] = &unk_189F87A50;
      id v21 = v23;
      id v29 = v21;
      id v30 = v4;
      dispatch_async(v26, v28);

      id v27 = v19;
      uint64_t v20 = (void *)*((void *)v19 + 16);
    }

    while (v20);
  }

  else
  {
    id v21 = 0LL;
  }
}

void ____xpc_remote_connection_teardown_continue_block_invoke(void *a1)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  uint64_t v2 = a1[6];
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, a1[4]);
  }

  else
  {
    _log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[5];
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl( &dword_186DD8000,  v3,  OS_LOG_TYPE_DEFAULT,  "[%p] No event handler to deliver teardown complete",  (uint8_t *)&v5,  0xCu);
    }
  }

id _xpc_remote_connection_dequeue_message(void *a1)
{
  id v1 = a1;
  objc_msgSend(v1, "internal_queue");
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  id v3 = v1;
  uint64_t v4 = (void *)*((void *)v3 + 10);
  if (v4)
  {
    int v5 = v4;
    objc_storeStrong((id *)v3 + 10, v5[21]);
    id v6 = v5[21];
    if (!v6)
    {
      uint64_t v7 = (void *)*((void *)v3 + 11);
      *((void *)v3 + 11) = 0LL;

      id v6 = v5[21];
    }

    v5[21] = 0LL;
  }

  return v4;
}

uint64_t ___xpc_remote_connection_flush_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL))();
}

void ___xpc_remote_connection_handle_new_channel_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  if (a2 == 2)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = (id *)(a1 + 32);
    uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    if (v8 == (void *)v6[7])
    {
      v6[7] = 0LL;

      _log();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = *v7;
        *(_DWORD *)__int128 buf = 134218240;
        id v21 = v16;
        __int16 v22 = 1024;
        LODWORD(v23) = a3;
        _os_log_impl( &dword_186DD8000,  v15,  OS_LOG_TYPE_INFO,  "[%p] Reply channel received CANCELED event with error %{errno}d",  buf,  0x12u);
      }

      _xpc_remote_connection_disconnect(*v7, a3);
    }

    else
    {
      uint64_t v9 = _xpc_remote_pending_stream_find(v6, *(id **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
      _log();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v9)
      {
        if (v11)
        {
          id v12 = *(void **)(a1 + 32);
          uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 134218496;
          id v21 = v12;
          __int16 v22 = 2048;
          uint64_t v23 = v13;
          __int16 v24 = 1024;
          int v25 = a3;
          _os_log_impl( &dword_186DD8000,  v10,  OS_LOG_TYPE_INFO,  "[%p] Stream %llu canceled with error %d, leaving tombstone",  buf,  0x1Cu);
        }

        id v14 = *(void **)(v9 + 16);
        *(void *)(v9 + 16) = 0LL;

        *(_DWORD *)(v9 + 4_Block_object_dispose(va, 8) = a3;
        _xpc_remote_pending_stream_insert((id *)*v7, (void *)v9);
      }

      else
      {
        if (v11)
        {
          id v17 = *(void **)(a1 + 32);
          uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 134218240;
          id v21 = v17;
          __int16 v22 = 2048;
          uint64_t v23 = v18;
          _os_log_impl(&dword_186DD8000, v10, OS_LOG_TYPE_INFO, "[%p] Stream %llu canceled but not pending", buf, 0x16u);
        }
      }

      _xpc_remote_stream_remove(*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    }
  }

  else if (a2 == 1)
  {
    _log();
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      ___xpc_remote_connection_handle_new_channel_block_invoke_cold_1();
    }
  }

id *_xpc_remote_pending_stream_find(void *a1, id *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  uint64_t v4 = v3;
  if (a2)
  {
    int v5 = (id *)v3[12];
    if (v5)
    {
      id v6 = v5;
      while (v6[1] != a2)
      {
        uint64_t v7 = (id *)v6[7];

        id v6 = v7;
        if (!v7) {
          goto LABEL_6;
        }
      }

      uint64_t v8 = v4;
      a2 = v6;
      uint64_t v9 = (id *)v4[12];
      if (v9 == a2)
      {
        if (!v9)
        {
LABEL_22:

          goto LABEL_23;
        }

        uint64_t v9 = v9;
        objc_storeStrong(v4 + 12, v9[7]);
        id v14 = (id *)v9[7];
        if (!v14)
        {
          id v15 = v8[13];
          v8[13] = 0LL;

          id v14 = (id *)v9[7];
        }

        v9[7] = 0LL;
      }

      else
      {
        uint64_t v10 = v9;
        if (!v10)
        {
LABEL_23:

          goto LABEL_24;
        }

        BOOL v11 = v10;
        while (1)
        {
          id v12 = (id *)v11[7];
          if (v12 == a2) {
            break;
          }
          uint64_t v13 = v12;

          BOOL v11 = v13;
          if (!v13) {
            goto LABEL_23;
          }
        }

        id v14 = v11;
        id v16 = v11[7];
        if (!v16) {
          _xpc_remote_connection_handle_read_cold_5(&v21, v22);
        }
        id v17 = v16;

        uint64_t v18 = (void *)v17[7];
        id v19 = v18;
        objc_storeStrong(v11 + 7, v18);
        if (!v19) {
          objc_storeStrong(v8 + 13, v11);
        }

        uint64_t v9 = v14;
      }

      goto LABEL_22;
    }

LABEL_6:
    a2 = 0LL;
  }

        break;
    }
  }
}

LABEL_24:
  return a2;
}

void _xpc_remote_pending_stream_insert(id *a1, void *a2)
{
  id v7 = a2;
  uint64_t v4 = a1 + 12;
  if (a1[12]) {
    uint64_t v4 = (id *)((char *)a1[13] + 56);
  }
  objc_storeStrong(v4, a2);
  int v5 = a1;
  id v6 = v5[13];
  v5[13] = v7;
}

void _xpc_remote_stream_remove(void *a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v20 = a1;
  id v3 = a2;
  uint64_t v4 = (id *)v20[14];
  if (v4)
  {
    int v5 = v4;
    while (v5[1] != v3)
    {
      id v6 = (id *)v5[2];

      int v5 = v6;
      if (!v6) {
        goto LABEL_23;
      }
    }

    id v7 = v20;
    uint64_t v8 = v5;
    uint64_t v9 = (id *)v20[14];
    if (v9 == v8)
    {
      if (!v9)
      {
LABEL_21:

        goto LABEL_22;
      }

      uint64_t v9 = v9;
      objc_storeStrong(v20 + 14, v9[2]);
      id v14 = (id *)v9[2];
      if (!v14)
      {
        id v15 = v7[15];
        v7[15] = 0LL;

        id v14 = (id *)v9[2];
      }

      v9[2] = 0LL;
    }

    else
    {
      uint64_t v10 = v9;
      if (!v10)
      {
LABEL_22:

        goto LABEL_23;
      }

      BOOL v11 = v10;
      while (1)
      {
        id v12 = (id *)v11[2];
        if (v12 == v8) {
          break;
        }
        uint64_t v13 = v12;

        BOOL v11 = v13;
        if (!v13) {
          goto LABEL_22;
        }
      }

      id v14 = v11;
      id v16 = v11[2];
      if (!v16) {
        _xpc_remote_connection_handle_read_cold_5(&v21, v22);
      }
      id v17 = v16;

      uint64_t v18 = (void *)v17[2];
      id v19 = v18;
      objc_storeStrong(v11 + 2, v18);
      if (!v19) {
        objc_storeStrong(v7 + 15, v11);
      }

      uint64_t v9 = v14;
    }

    goto LABEL_21;
  }

LABEL_23:
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218( uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  uint64_t v9 = (void **)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v8 + 48))
  {
    uint64_t v10 = *(void **)(v8 + 56);
    if (v10 == *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      _xpc_remote_connection_handle_read((void *)v8, v10, a2, a3, v7);
      goto LABEL_10;
    }
  }

  if ([(id)v8 state] <= 4)
  {
    if ((_BYTE)a3)
    {
      _log();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_6();
      }
LABEL_7:

LABEL_8:
      _xpc_remote_connection_disconnect(*v9, 53LL);
      goto LABEL_10;
    }

    unint64_t v12 = a3 >> 16;
    if (((a3 >> 16) & 0x40) != 0)
    {
      _log();
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        __int128 v28 = *v9;
        *(_DWORD *)__int128 buf = 134217984;
        __int128 v46 = v28;
        _os_log_impl(&dword_186DD8000, v27, OS_LOG_TYPE_INFO, "[%p] Got HEADER for reply channel", buf, 0xCu);
      }

      id v29 = *v9;
      if (*((_BYTE *)*v9 + 65))
      {
        id v30 = (void *)v29[7];
        uint64_t v32 = *(void *)(a1 + 40);
        uint64_t v31 = a1 + 40;
        if (v30 == *(void **)(*(void *)(v32 + 8) + 40LL))
        {
          v43[0] = MEMORY[0x1895F87A8];
          v43[1] = 3221225472LL;
          v43[2] = ___xpc_remote_connection_handle_new_channel_block_invoke_219;
          v43[3] = &unk_189F87D40;
          v44 = v29;
          xpc_remote_channel_send(v30, 0LL, 0x400000, MEMORY[0x1895F8AA8], v43);
          _xpc_remote_connection_handle_read(*v9, *(void **)(*(void *)(*(void *)v31 + 8LL) + 40LL), a2, a3, v7);

          goto LABEL_10;
        }

        _log();
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_5();
        }

        xpc_remote_channel_cancel(*(void **)(*(void *)(*(void *)v31 + 8LL) + 40LL), 0x35u);
      }

      else
      {
        _log();
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_4();
        }
      }

      goto LABEL_8;
    }

    int v13 = WORD1(a3);
    if (*(void *)(*(void *)(a1 + 32) + 56LL) == *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL))
    {
      _log();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_3();
      }
    }

    _log();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = *(void **)(a1 + 32);
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      *(_DWORD *)__int128 buf = 134218496;
      __int128 v46 = v16;
      __int16 v47 = 2048;
      *(void *)__int128 v48 = v17;
      *(_WORD *)&v48[8] = 1024;
      int v49 = v13;
      _os_log_impl(&dword_186DD8000, v15, OS_LOG_TYPE_INFO, "[%p] Got HEADER for stream %lld, flags = 0x%x", buf, 0x1Cu);
    }

    unsigned int v18 = (v12 >> 3) & 2 | (v12 >> 5) & 1;
    if (!v18)
    {
      _log();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_1();
      }
      goto LABEL_7;
    }

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
    id v19 = *(id **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
    if (!v19)
    {
      _log();
      BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_2();
      }
      goto LABEL_7;
    }

    uint64_t v20 = _xpc_remote_pending_stream_find(*v9, v19);
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)(v20 + 24);
      _log();
      uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          int v25 = *(void **)(a1 + 32);
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 134218240;
          __int128 v46 = v25;
          __int16 v47 = 2048;
          *(void *)__int128 v48 = v26;
          _os_log_impl(&dword_186DD8000, v23, OS_LOG_TYPE_INFO, "[%p] Found pending stream ID for %lld", buf, 0x16u);
        }

        if (*(_DWORD *)(v21 + 32) == v18)
        {
          _xpc_remote_channel_send_stream_header( *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL),  v18);
          xpc_remote_channel_attach_stream( *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(_DWORD *)(v21 + 32),  *(void **)(v21 + 24),  *(void **)(v21 + 40));
        }

        else
        {
          _log();
          uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            id v41 = *v9;
            int v42 = *(_DWORD *)(v21 + 32);
            *(_DWORD *)__int128 buf = 134218496;
            __int128 v46 = v41;
            __int16 v47 = 1024;
            *(_DWORD *)__int128 v48 = v42;
            *(_WORD *)&v48[4] = 1024;
            *(_DWORD *)&v48[6] = v18;
            _os_log_error_impl( &dword_186DD8000,  v40,  OS_LOG_TYPE_ERROR,  "[%p] Pending stream direction mismatch: %d != %d",  buf,  0x18u);
          }

          _xpc_remote_connection_disconnect(*v9, 53LL);
        }
      }

      else
      {
        if (v24)
        {
          int v38 = *(void **)(a1 + 32);
          uint64_t v39 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
          *(_DWORD *)__int128 buf = 134218240;
          __int128 v46 = v38;
          __int16 v47 = 2048;
          *(void *)__int128 v48 = v39;
          _os_log_impl(&dword_186DD8000, v23, OS_LOG_TYPE_INFO, "[%p] Found pending tombstone ID for %lld", buf, 0x16u);
        }

        xpc_remote_channel_cancel(*(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), 0x59u);
      }
    }

    else
    {
      _log();
      __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = *(void **)(a1 + 32);
        uint64_t v37 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
        *(_DWORD *)__int128 buf = 134218240;
        __int128 v46 = v36;
        __int16 v47 = 2048;
        *(void *)__int128 v48 = v37;
        _os_log_impl(&dword_186DD8000, v35, OS_LOG_TYPE_INFO, "[%p] Pending incoming stream %lld", buf, 0x16u);
      }

      uint64_t v21 = objc_opt_new();
      *(void *)(v21 + _Block_object_dispose(va, 8) = *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL);
      *(_DWORD *)(v21 + 32) = v18;
      objc_storeStrong((id *)(v21 + 16), *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
      _xpc_remote_pending_stream_insert(*(id **)(a1 + 32), (void *)v21);
    }
  }

LABEL_10:
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_219(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  _log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  int v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_handle_new_channel_block_invoke_219_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_186DD8000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent reply HELO", (uint8_t *)&v7, 0xCu);
  }
}

void _xpc_remote_channel_send_stream_header(void *a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  if (!a2) {
    _xpc_remote_channel_send_stream_header_cold_1(&v8, buf);
  }
  if (!a3) {
    _xpc_remote_channel_send_stream_header_cold_2(&v8, buf);
  }
  uint64_t v6 = v5;
  _log();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 134218240;
    uint64_t v10 = v6;
    __int16 v11 = 2048;
    uint64_t v12 = a2;
    _os_log_impl(&dword_186DD8000, v7, OS_LOG_TYPE_INFO, "[%p] Sending HEADER for stream %lld", buf, 0x16u);
  }

  xpc_remote_channel_send(v6, a2, (a3 & 3) << 20, MEMORY[0x1895F8AA8], 0LL);
}

void ___xpc_remote_connection_ready_block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  _log();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_ready_block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl( &dword_186DD8000,  v5,  OS_LOG_TYPE_INFO,  "[%p] Successfully sent root channel HELO",  (uint8_t *)&v7,  0xCu);
  }
}

id _xpc_remote_connection_create_sub_nw_connection(void *a1)
{
  id v1 = (nw_connection *)a1[2];
  uint64_t v2 = a1;
  id v3 = nw_connection_copy_parameters(v1);
  nw_parameters_t v4 = nw_parameters_copy(v3);

  nw_parameters_set_data_mode();
  nw_parameters_set_server_mode();

  id v5 = (void *)nw_connection_create_with_connection();
  return v5;
}

void ___xpc_remote_connection_ready_block_invoke_223(uint64_t a1, int a2, uint64_t a3)
{
  if (a2 == 2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = (id *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 56);
    *(void *)(v7 + 56) = 0LL;

    if ([*v6 state] <= 4)
    {
      _log();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        ___xpc_remote_connection_ready_block_invoke_223_cold_1();
      }
    }

    _xpc_remote_connection_disconnect(*v6, a3);
  }

  else if (a2 == 1)
  {
    id v3 = *(void **)(a1 + 32);
    nw_parameters_t v4 = (void *)v3[7];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    void v10[2] = ___xpc_remote_connection_ready_block_invoke_2;
    v10[3] = &unk_189F87D40;
    __int16 v11 = v3;
    xpc_remote_channel_send(v4, 0LL, 0x400000, MEMORY[0x1895F8AA8], v10);
  }

void ___xpc_remote_connection_ready_block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  _log();
  nw_parameters_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_handle_new_channel_block_invoke_219_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl( &dword_186DD8000,  v5,  OS_LOG_TYPE_INFO,  "[%p] Successfully sent reply channel HELO",  (uint8_t *)&v7,  0xCu);
  }
}

void ___xpc_remote_connection_ready_block_invoke_224(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
}

void ___xpc_remote_connection_handle_read_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (MEMORY[0x186E49278]() != MEMORY[0x1895F9278]) {
    ___xpc_remote_connection_handle_read_block_invoke_cold_1();
  }
  id v5 = *(id *)(a1 + 32);
  id v4 = v5;
  xpc_file_transfer_set_transport_writing_callbacks();
}

uint64_t ___xpc_remote_connection_handle_read_block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL))();
}

void ___xpc_remote_connection_handle_read_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = ___xpc_remote_connection_handle_read_block_invoke_3;
  v3[3] = &unk_189F87DE0;
  id v4 = *(id *)(a1 + 32);
  __int128 v6 = *(_OWORD *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  dispatch_async(v2, v3);
}

void ___xpc_remote_connection_handle_read_block_invoke_3(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  _log();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = 134218240;
    uint64_t v6 = v3;
    __int16 v7 = 2048;
    uint64_t v8 = v4;
    _os_log_impl( &dword_186DD8000,  v2,  OS_LOG_TYPE_INFO,  "[%p] Handler block for %llx complete, re-arming",  (uint8_t *)&v5,  0x16u);
  }

  xpc_remote_channel_arm_read(*(void **)(a1 + 40));
}

void _xpc_remote_connection_wakeup(void *a1)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_msgSend(v1, "internal_queue");
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if ((objc_msgSend(v1, "send_in_progress") & 1) == 0)
  {
    switch([v1 state])
    {
      case 0u:
        _xpc_remote_connection_wakeup_cold_1();
      case 1u:
        _xpc_remote_connection_connect(v1);
        goto LABEL_4;
      case 2u:
      case 3u:
LABEL_4:
        _log();
        uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          _xpc_remote_connection_wakeup_cold_2();
        }
        goto LABEL_6;
      case 5u:
      case 6u:
      case 7u:
        break;
      default:
        uint64_t v4 = _xpc_remote_connection_dequeue_message(v1);
        uint64_t v3 = (os_log_s *)v4;
        if (v4)
        {
          uint64_t v5 = *(void *)(v4 + 8);
          if (v5 && (*(void *)(v4 + 8) & 1LL) == *((_BYTE *)v1 + 65))
          {
            uint64_t v16 = 0LL;
            __int128 v24 = 0u;
            __int128 v25 = 0u;
            __int128 v22 = 0u;
            __int128 v23 = 0u;
            *(_OWORD *)__int128 buf = 0u;
            os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
            uint64_t v12 = *((void *)v3 + 1);
            int v17 = 134218240;
            id v18 = v1;
            __int16 v19 = 2048;
            uint64_t v20 = v12;
            _os_log_send_and_compose_impl();
            _os_crash_msg();
            __break(1u);
          }

          if (*(_BYTE *)(v4 + 176)) {
            int v6 = 65537;
          }
          else {
            int v6 = 1;
          }
          _log();
          __int16 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int128 buf = 134217984;
            *(void *)&uint8_t buf[4] = v1;
            _os_log_impl(&dword_186DD8000, v7, OS_LOG_TYPE_INFO, "[%p] Send initiated", buf, 0xCu);
          }

          objc_msgSend(v1, "setSend_in_progress:", 1);
          _xpc_remote_connection_send_ool_message_content(v1, v3);
          uint64_t v8 = (void *)MEMORY[0x186E48FB4](*((void *)v3 + 2));
          uint64_t v9 = (void *)*((void *)v1 + 5);
          uint64_t v10 = (void *)*((void *)v3 + 3);
          v13[0] = MEMORY[0x1895F87A8];
          v13[1] = 3221225472LL;
          v13[2] = ___xpc_remote_connection_wakeup_block_invoke;
          v13[3] = &unk_189F87E30;
          id v14 = v1;
          id v15 = v8;
          id v11 = v8;
          xpc_remote_channel_send(v9, v5, v6, v10, v13);
        }

void _xpc_remote_connection_send_ool_message_content(void *a1, void *a2)
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v36 = a1;
  uint64_t v32 = a2;
  if (v32[8] >= 1)
  {
    uint64_t v3 = 0LL;
    id v33 = v32 + 10;
    do
    {
      id v4 = *(id *)&v33[2 * v3];
      if (MEMORY[0x186E49278]() != MEMORY[0x1895F9278]) {
        _xpc_remote_connection_send_ool_message_content_cold_2();
      }
      id v5 = v36;
      id v6 = v4;
      uint64_t transfer_id = xpc_file_transfer_get_transfer_id();
      uint64_t v8 = (void *)xpc_file_transfer_copy_io();
      v37[0] = MEMORY[0x1895F87A8];
      v37[1] = 3221225472LL;
      v37[2] = ___send_file_transfer_block_invoke;
      v37[3] = &unk_189F87E58;
      id v34 = v6;
      id v38 = v34;
      id v39 = v5;
      uint64_t v9 = v39;
      id v10 = v8;
      __int16 v35 = v37;
      objc_msgSend(v9, "internal_queue");
      id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v11);

      _log();
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&_BYTE buf[12] = 2048;
        *(void *)&buf[14] = transfer_id;
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v61) = 1;
        _os_log_impl( &dword_186DD8000,  v12,  OS_LOG_TYPE_DEFAULT,  "[%p] Opening stream_id %lld with direction %x",  buf,  0x1Cu);
      }

      _xpc_remote_connection_create_sub_nw_connection(v9);
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = 0LL;
      v52[1] = v52;
      v52[2] = 0x3032000000LL;
      v52[3] = __Block_byref_object_copy__231;
      v52[4] = __Block_byref_object_dispose__232;
      id v53 = 0LL;
      id v53 = (id)MEMORY[0x186E48FB4](v35);
      uint64_t v46 = 0LL;
      __int16 v47 = &v46;
      uint64_t v48 = 0x3032000000LL;
      int v49 = __Block_byref_object_copy_;
      uint64_t v50 = __Block_byref_object_dispose_;
      id v51 = 0LL;
      v40[0] = MEMORY[0x1895F87A8];
      v40[1] = 3221225472LL;
      v40[2] = ___xpc_remote_connection_open_stream_block_invoke;
      v40[3] = &unk_189F87E80;
      int v42 = &v46;
      uint64_t v44 = transfer_id;
      int v45 = 1;
      id v14 = v9;
      id v41 = v14;
      uint64_t v43 = v52;
      id v15 = (void *)MEMORY[0x186E48FB4](v40);
      *(void *)__int128 buf = MEMORY[0x1895F87A8];
      *(void *)&buf[8] = 3221225472LL;
      *(void *)&uint8_t buf[16] = ___xpc_remote_connection_open_stream_block_invoke_233;
      v61 = &unk_189F87EA8;
      uint64_t v16 = v14;
      uint64_t v66 = transfer_id;
      id v62 = v16;
      v64 = &v46;
      int v67 = 1;
      id v17 = v10;
      id v63 = v17;
      v65 = v52;
      id v18 = (void *)MEMORY[0x186E48FB4](buf);
      objc_msgSend(v16, "internal_queue");
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = xpc_remote_channel_create(v13, v19, *((_BYTE *)v36 + 66), 0, v15, v18);
      uint64_t v21 = (void *)v47[5];
      v47[5] = v20;

      __int128 v22 = (id *)objc_opt_new();
      objc_storeStrong(v22 + 1, (id)v47[5]);
      __int128 v23 = v16;
      __int128 v24 = v22;
      __int128 v25 = v24;
      if (*((void *)v36 + 14))
      {
        uint64_t v26 = (id *)*((id *)v36 + 15);
        objc_storeStrong(v26 + 2, v22);
      }

      else
      {
        id v27 = v24;
        uint64_t v26 = (id *)*((void *)v36 + 14);
        *((void *)v36 + 14) = v27;
      }

      __int128 v28 = (void *)*((void *)v36 + 15);
      *((void *)v36 + 15) = v25;

      _log();
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = v47[5];
        *(_DWORD *)v54 = 134218496;
        id v55 = v36;
        __int16 v56 = 2048;
        uint64_t v57 = transfer_id;
        __int16 v58 = 2048;
        uint64_t v59 = v30;
        _os_log_impl(&dword_186DD8000, v29, OS_LOG_TYPE_DEFAULT, "[%p] Opened stream %lld (%p)", v54, 0x20u);
      }

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(v52, 8);

      uint64_t v31 = *(void **)&v33[2 * v3];
      *(void *)&v33[2 * v3] = 0LL;

      ++v3;
    }

    while (v3 < v32[8]);
  }
}

void sub_186DE0E14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void ___xpc_remote_connection_wakeup_block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = (void *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setSend_in_progress:", 0);
  if (v4[1])
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 40));
  }

  _log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int16 v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_wakeup_block_invoke_cold_1();
    }
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *v4;
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_186DD8000, v7, OS_LOG_TYPE_INFO, "[%p] Send completed", (uint8_t *)&v9, 0xCu);
    }

    _xpc_remote_connection_wakeup(*v4);
  }

void ___send_file_transfer_block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_file_transfer_send_finished();
}

uint64_t __Block_byref_object_copy__231(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x186E48FB4](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__232(uint64_t a1)
{
}

void ___xpc_remote_connection_open_stream_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a2 == 2)
  {
    _log();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 56);
      int v11 = 134218240;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&dword_186DD8000, v5, OS_LOG_TYPE_INFO, "[%p] Got CANCELED for stream %lld", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
    uint64_t v9 = *(void *)(v8 + 40);
    if (v9)
    {
      (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, a3);
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
      uint64_t v10 = *(void **)(v8 + 40);
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    *(void *)(v8 + 40) = 0LL;

    _xpc_remote_stream_remove(*(void **)(a1 + 32), *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  }

  else if (a2 == 1)
  {
    _xpc_remote_channel_send_stream_header( *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(void *)(a1 + 56),  *(_DWORD *)(a1 + 64));
  }

void ___xpc_remote_connection_open_stream_block_invoke_233(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  _log();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 64);
    int v7 = 134218240;
    uint64_t v8 = v3;
    __int16 v9 = 2048;
    uint64_t v10 = v4;
    _os_log_impl(&dword_186DD8000, v2, OS_LOG_TYPE_INFO, "[%p] Got HEADER for stream %lld", (uint8_t *)&v7, 0x16u);
  }

  xpc_remote_channel_attach_stream( *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL),  *(_DWORD *)(a1 + 72),  *(void **)(a1 + 40),  *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0LL;
}

void ___recv_file_transfer_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "internal_queue");
  int v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = ___recv_file_transfer_block_invoke_2;
  block[3] = &unk_189F87ED0;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void ___recv_file_transfer_block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) state] < 5)
  {
    uint64_t transfer_id = (id *)xpc_file_transfer_get_transfer_id();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    __int16 v19 = ___recv_file_transfer_block_invoke_3;
    uint64_t v20 = &unk_189F87E58;
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void **)(a1 + 48);
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 32);
    id v5 = v3;
    id v6 = v4;
    int v7 = v18;
    objc_msgSend(v5, "internal_queue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    uint64_t v9 = _xpc_remote_pending_stream_find(v5, transfer_id);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)(v9 + 16);
      _log();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
      if (v11)
      {
        if (v13)
        {
          *(_DWORD *)__int128 buf = 134218240;
          id v25 = v5;
          __int16 v26 = 2048;
          id v27 = transfer_id;
          _os_log_impl( &dword_186DD8000,  v12,  OS_LOG_TYPE_INFO,  "[%p] Found pending stream channel for %lld",  buf,  0x16u);
        }

        if (*(_DWORD *)(v10 + 32) != 2) {
          ___recv_file_transfer_block_invoke_2_cold_1(&v23, buf);
        }
        _xpc_remote_channel_send_stream_header(*(void **)(v10 + 16), (uint64_t)transfer_id, 2);
        xpc_remote_channel_attach_stream(*(void **)(v10 + 16), 2, v6, v7);
      }

      else
      {
        if (v13)
        {
          *(_DWORD *)__int128 buf = 134218240;
          id v25 = v5;
          __int16 v26 = 2048;
          id v27 = transfer_id;
          _os_log_impl( &dword_186DD8000,  v12,  OS_LOG_TYPE_INFO,  "[%p] Found pending tombstone channel for %lld",  buf,  0x16u);
        }

        ((void (*)(void *, void))v19)(v7, *(unsigned int *)(v10 + 48));
      }
    }

    else
    {
      _log();
      uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134218240;
        id v25 = v5;
        __int16 v26 = 2048;
        id v27 = transfer_id;
        _os_log_impl(&dword_186DD8000, v14, OS_LOG_TYPE_INFO, "[%p] Pending future stream %lld", buf, 0x16u);
      }

      uint64_t v10 = objc_opt_new();
      *(void *)(v10 + _Block_object_dispose(va, 8) = transfer_id;
      *(_DWORD *)(v10 + 32) = 2;
      objc_storeStrong((id *)(v10 + 24), v4);
      uint64_t v15 = MEMORY[0x186E48FB4](v7);
      uint64_t v16 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v15;

      _xpc_remote_pending_stream_insert((id *)v5, (void *)v10);
    }
  }

  else
  {
    objc_msgSend(*(id *)(a1 + 32), "target_queue");
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    xpc_file_transfer_write_finished();
  }

void ___recv_file_transfer_block_invoke_3(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_file_transfer_write_finished();
}

void ___recv_file_transfer_block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = ___recv_file_transfer_block_invoke_5;
  v5[3] = &unk_189F87970;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = a2;
  dispatch_async(v4, v5);
}

void ___recv_file_transfer_block_invoke_5(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) state] <= 4)
  {
    uint64_t v2 = *(id **)(a1 + 40);
    id v3 = *(id *)(a1 + 32);
    objc_msgSend(v3, "internal_queue");
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    uint64_t v5 = _xpc_remote_pending_stream_find(v3, v2);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)(v5 + 16);
      _log();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if (v9)
        {
          *(_DWORD *)__int128 buf = 134218240;
          id v13 = v3;
          __int16 v14 = 2048;
          uint64_t v15 = v2;
          _os_log_impl( &dword_186DD8000,  v8,  OS_LOG_TYPE_INFO,  "[%p] Found pending stream channel for canceling %lld",  buf,  0x16u);
        }

        if (*(_DWORD *)(v6 + 32) != 2) {
          ___recv_file_transfer_block_invoke_5_cold_1(&v11, buf);
        }
        xpc_remote_channel_cancel(*(void **)(v6 + 16), 0x59u);
      }

      else
      {
        if (v9)
        {
          *(_DWORD *)__int128 buf = 134218240;
          id v13 = v3;
          __int16 v14 = 2048;
          uint64_t v15 = v2;
          _os_log_impl( &dword_186DD8000,  v8,  OS_LOG_TYPE_INFO,  "[%p] Found pending tombstone for canceling %lld",  buf,  0x16u);
        }
      }
    }

    else
    {
      _log();
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134218240;
        id v13 = v3;
        __int16 v14 = 2048;
        uint64_t v15 = v2;
        _os_log_impl(&dword_186DD8000, v10, OS_LOG_TYPE_INFO, "[%p] Leaving stream tombstone %lld", buf, 0x16u);
      }

      uint64_t v6 = objc_opt_new();
      *(void *)(v6 + _Block_object_dispose(va, 8) = v2;
      _xpc_remote_pending_stream_insert((id *)v3, (void *)v6);
    }
  }

uint64_t ___xpc_remote_message_create_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (*(int *)(*(void *)(a1 + 32) + 32LL) < 16)
  {
    if (MEMORY[0x186E49278](v4) == MEMORY[0x1895F9278])
    {
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(int *)(v16 + 32);
      *(_DWORD *)(v16 + 32) = v17 + 1;
      objc_storeStrong((id *)(v16 + 8 * v17 + 40), a2);
      uint64_t v14 = 1LL;
      goto LABEL_10;
    }

    if (MEMORY[0x186E49278](v5) == MEMORY[0x1895F9240]
      && (*(_BYTE *)(*(void *)(a1 + 40) + 72LL) & 2) == 0
      && xpc_data_get_length(v5) > 0x4000)
    {
      ___xpc_remote_message_create_block_invoke_cold_2();
    }
  }

  else
  {
    _log();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_message_create_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }

  uint64_t v14 = 0LL;
LABEL_10:

  return v14;
}

void ___xpc_remote_connection_send_reply_message_block_invoke(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  _log();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_connection_send_reply_message_block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_186DD8000, v5, OS_LOG_TYPE_INFO, "[%p] Reply send completed", (uint8_t *)&v7, 0xCu);
  }
}

const char *_xpc_remote_connection_get_remote_service_name(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  name = v1[1];
  if (!name)
  {
    if (v1[23]) {
      name = (const char *)remote_service_get_name();
    }
    else {
      name = "(null)";
    }
  }

  return name;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

  ;
}

double OUTLINED_FUNCTION_3(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL OUTLINED_FUNCTION_4()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t OUTLINED_FUNCTION_7()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_8(os_log_s *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void OUTLINED_FUNCTION_13( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void OUTLINED_FUNCTION_15(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

uint64_t OUTLINED_FUNCTION_16()
{
  return _os_crash_msg();
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

void OUTLINED_FUNCTION_18( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_19(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(va, 8) = a1;
}

uint64_t OUTLINED_FUNCTION_20()
{
  return [v0 state];
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

uint64_t OUTLINED_FUNCTION_26()
{
  return _os_assumes_log();
}

  ;
}

id xpc_remote_channel_create(void *a1, void *a2, char a3, char a4, void *a5, void *a6)
{
  uint64_t v11 = a1;
  uint64_t v12 = a2;
  id v13 = a6;
  id v14 = a5;
  uint64_t v15 = objc_opt_new();
  objc_storeStrong((id *)(v15 + 8), a2);
  *(_BYTE *)(v15 + 73) = a3;
  uint64_t v16 = MEMORY[0x186E48FB4](v14);

  uint64_t v17 = *(void **)(v15 + 24);
  *(void *)(v15 + 24) = v16;

  uint64_t v18 = MEMORY[0x186E48FB4](v13);
  __int16 v19 = *(void **)(v15 + 32);
  *(void *)(v15 + 32) = v18;

  nw_connection_set_queue(v11, v12);
  uint64_t v20 = MEMORY[0x1895F87A8];
  v51[0] = MEMORY[0x1895F87A8];
  v51[1] = 3221225472LL;
  v51[2] = __xpc_remote_channel_create_block_invoke;
  v51[3] = &unk_189F87CA0;
  id v21 = (id)v15;
  id v52 = v21;
  MEMORY[0x186E48D68](v11, v51);
  uint64_t v46 = v20;
  uint64_t v47 = 3221225472LL;
  uint64_t v48 = __xpc_remote_channel_create_block_invoke_21;
  int v49 = &unk_189F87A28;
  id v50 = v21;
  nw_connection_set_read_close_handler();
  uint64_t v41 = v20;
  uint64_t v42 = 3221225472LL;
  uint64_t v43 = __xpc_remote_channel_create_block_invoke_23;
  uint64_t v44 = &unk_189F87A28;
  id v45 = v50;
  nw_connection_set_write_close_handler();
  uint64_t v36 = v20;
  uint64_t v37 = 3221225472LL;
  id v38 = __xpc_remote_channel_create_block_invoke_24;
  id v39 = &unk_189F87A28;
  id v22 = v45;
  id v40 = v22;
  nw_connection_set_cancel_handler();
  if ((a4 & 1) != 0)
  {
    uint64_t v31 = v20;
    uint64_t v32 = 3221225472LL;
    id v33 = __xpc_remote_channel_create_block_invoke_25;
    id v34 = &unk_189F87A28;
    id v35 = v22;
    nw_connection_set_adaptive_write_handler();
  }

  if ((a4 & 2) != 0)
  {
    v29[0] = v20;
    v29[1] = 3221225472LL;
    v29[2] = __xpc_remote_channel_create_block_invoke_26;
    v29[3] = &unk_189F87F90;
    id v30 = v22;
    nw_connection_set_viability_changed_handler(v11, v29);
  }

  nw_connection_start(v11);
  uint64_t v23 = (void *)*((void *)v22 + 2);
  *((void *)v22 + 2) = v11;
  __int128 v24 = v11;

  *((_DWORD *)v22 + 10) = 1;
  _log_0();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    xpc_remote_channel_create_cold_1();
  }

  __int16 v26 = v40;
  id v27 = v22;

  return v27;
}

void __xpc_remote_channel_create_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    CFErrorRef v7 = nw_error_copy_cf_error(v5);
    if (nw_error_get_error_domain(v6) == nw_error_domain_posix)
    {
      int error_code = nw_error_get_error_code(v6);
      goto LABEL_6;
    }
  }

  else
  {
    CFErrorRef v7 = 0LL;
  }

  int error_code = 0;
LABEL_6:
  switch(a2)
  {
    case 2:
    case 5:
      break;
    case 3:
      _log_0();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_cold_5();
      }

      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = v10;
      unsigned int v12 = *((_DWORD *)v10 + 10);
      if (v12 <= 2)
      {
        if (v12 != 1) {
          __xpc_remote_channel_create_block_invoke_cold_4(&v18, v19);
        }
        *((_DWORD *)v10 + 10) = 2;
        _log_0();
        id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          __xpc_remote_channel_create_block_invoke_cold_3();
        }

        (*(void (**)(void))(v11[3] + 16LL))();
        xpc_remote_channel_arm_read(v11);
      }

      break;
    case 4:
      _log_0();
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_cold_2();
      }

      uint64_t v16 = *(_BYTE **)(a1 + 32);
      if (v16[72]) {
        unsigned int v17 = 0;
      }
      else {
        unsigned int v17 = error_code;
      }
      xpc_remote_channel_cancel(v16, v17);
      break;
    default:
      _log_0();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __xpc_remote_channel_create_block_invoke_cold_1();
      }

      break;
  }
}

id _log_0()
{
  if (_log_onceToken_0 != -1) {
    dispatch_once(&_log_onceToken_0, &__block_literal_global_0);
  }
  return (id)_log_logger_0;
}

void xpc_remote_channel_cancel(void *a1, unsigned int a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v3 + 1));
  unsigned int v4 = v3[10];
  if (v4 != 4)
  {
    if (v4 <= 2)
    {
      _log_0();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = state2str_0[v3[10]];
        int v16 = 134218498;
        unsigned int v17 = v3;
        __int16 v18 = 1024;
        unsigned int v19 = a2;
        __int16 v20 = 2082;
        id v21 = v6;
        _os_log_impl( &dword_186DD8000,  v5,  OS_LOG_TYPE_INFO,  "[%p] Canceling with error %d (from state %{public}s)",  (uint8_t *)&v16,  0x1Cu);
      }

      v3[10] = 3;
      v3[11] = a2;
    }

    if (*((void *)v3 + 2))
    {
      _log_0();
      CFErrorRef v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        xpc_remote_channel_cancel_cold_3();
      }

      nw_connection_cancel(*((nw_connection_t *)v3 + 2));
    }

    else
    {
      uint64_t v8 = (dispatch_io_s *)*((void *)v3 + 8);
      if (v8)
      {
        dispatch_io_close(v8, 0LL);
        uint64_t v9 = (void *)*((void *)v3 + 8);
        *((void *)v3 + _Block_object_dispose(va, 8) = 0LL;

        _log_0();
        id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          xpc_remote_channel_cancel_cold_2();
        }
      }

      uint64_t v11 = *((void *)v3 + 7);
      _log_0();
      unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v13 = v12;
      if (v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          xpc_remote_channel_cancel_cold_1();
        }

        dispatch_io_close(*((dispatch_io_t *)v3 + 7), 1uLL);
      }

      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v16 = 134217984;
          unsigned int v17 = v3;
          _os_log_impl(&dword_186DD8000, v13, OS_LOG_TYPE_INFO, "[%p] Cancelation complete", (uint8_t *)&v16, 0xCu);
        }

        v3[10] = 4;
        (*(void (**)(void))(*((void *)v3 + 3) + 16LL))();
        id v14 = (void *)*((void *)v3 + 3);
        *((void *)v3 + 3) = 0LL;

        uint64_t v15 = (void *)*((void *)v3 + 4);
        *((void *)v3 + 4) = 0LL;
      }
    }
  }
}

void __xpc_remote_channel_create_block_invoke_21(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_create_block_invoke_21_cold_4();
  }

  id v3 = *(id *)(a1 + 32);
  int v4 = v3[12];
  switch(v4)
  {
    case 2:
      _log_0();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_21_cold_3();
      }
      goto LABEL_13;
    case 1:
      _log_0();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_21_cold_1();
      }
LABEL_13:

      break;
    case 0:
      _log_0();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __xpc_remote_channel_create_block_invoke_21_cold_2();
      }

      xpc_remote_channel_cancel(v3, 0);
      break;
  }
}

void __xpc_remote_channel_create_block_invoke_23()
{
  os_log_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_create_block_invoke_23_cold_1();
  }
}

void __xpc_remote_channel_create_block_invoke_24(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_create_block_invoke_24_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = 0LL;

  xpc_remote_channel_cancel(*(void **)(a1 + 32), 0x59u);
}

void __xpc_remote_channel_create_block_invoke_25(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  _log_0();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134218240;
    uint64_t v5 = v3;
    __int16 v6 = 1024;
    int v7 = 5;
    _os_log_impl( &dword_186DD8000,  v2,  OS_LOG_TYPE_INFO,  "[%p] aborting connection after %d retransmits",  (uint8_t *)&v4,  0x12u);
  }

  xpc_remote_channel_cancel(*(void **)(a1 + 32), 0x3Cu);
}

void __xpc_remote_channel_create_block_invoke_26(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  _log_0();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = "not viable";
    uint64_t v6 = *(void *)(a1 + 32);
    if (a2) {
      uint64_t v5 = "viable";
    }
    *(_DWORD *)__int128 buf = 134218242;
    uint64_t v11 = v6;
    __int16 v12 = 2080;
    id v13 = v5;
    _os_log_impl(&dword_186DD8000, v4, OS_LOG_TYPE_INFO, "[%p] connection viability changed: %s", buf, 0x16u);
  }

  if (a2)
  {
    int v7 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __xpc_remote_channel_create_block_invoke_29;
    v8[3] = &unk_189F87D40;
    id v9 = v7;
    xpc_remote_channel_send(v9, 0LL, 2, MEMORY[0x1895F8AA8], v8);
  }

void xpc_remote_channel_send(void *a1, uint64_t a2, int a3, void *a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v9 = a1;
  id v10 = a4;
  uint64_t v11 = a5;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)v9 + 1));
  if (v11 && *((_DWORD *)v9 + 10) >= 3u) {
    v11[2](v11, 89LL);
  }
  if (!v10)
  {
    id v10 = (dispatch_data_s *)MEMORY[0x1895F8AA8];
    id v12 = MEMORY[0x1895F8AA8];
  }

  LODWORD(buffer) = 699403154;
  BYTE4(buffer) = *((_BYTE *)v9 + 73);
  BYTE5(buffer) = a3;
  WORD3(buffer) = HIWORD(a3);
  *((void *)&buffer + 1) = dispatch_data_get_size(v10);
  uint64_t v28 = a2;
  id v13 = dispatch_data_create(&buffer, 0x18uLL, 0LL, 0LL);
  concat = dispatch_data_create_concat(v13, v10);
  _log_0();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = v28;
    size_t size = dispatch_data_get_size(v10);
    *(_DWORD *)__int128 buf = 134218496;
    id v30 = v9;
    __int16 v31 = 2048;
    uint64_t v32 = v16;
    __int16 v33 = 2048;
    size_t v34 = size;
    _os_log_impl(&dword_186DD8000, v15, OS_LOG_TYPE_INFO, "[%p] Starting write of msg_id %llu (%zd bytes).", buf, 0x20u);
  }

  __int16 v18 = (nw_connection *)*((void *)v9 + 2);
  unsigned int v19 = (nw_content_context *)*MEMORY[0x189608E88];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __xpc_remote_channel_send_block_invoke;
  v22[3] = &unk_189F88008;
  __int128 v25 = buffer;
  uint64_t v26 = v28;
  id v23 = v9;
  __int128 v24 = v11;
  __int16 v20 = v11;
  id v21 = v9;
  nw_connection_send(v18, concat, v19, 1, v22);
}

void __xpc_remote_channel_create_block_invoke_29(uint64_t a1, int a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  _log_0();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __xpc_remote_channel_create_block_invoke_29_cold_1();
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134217984;
    uint64_t v8 = v6;
    _os_log_impl(&dword_186DD8000, v5, OS_LOG_TYPE_INFO, "[%p] Successfully sent PING", (uint8_t *)&v7, 0xCu);
  }
}

void xpc_remote_channel_arm_read(void *a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v1 = a1;
  uint64_t v2 = v1;
  if (!*((_DWORD *)v1 + 12))
  {
    if (v1[2])
    {
      _log_0();
      uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        xpc_remote_channel_arm_read_cold_3();
      }

      int v4 = (nw_connection *)v2[2];
      completion[0] = MEMORY[0x1895F87A8];
      completion[1] = 3221225472LL;
      completion[2] = __xpc_remote_channel_arm_read_block_invoke;
      completion[3] = &unk_189F87FE0;
      int v7 = v2;
      nw_connection_receive(v4, 0x18u, 0x18u, completion);
      uint64_t v5 = v7;
    }

    else
    {
      if (*((_DWORD *)v1 + 10) <= 2u) {
        xpc_remote_channel_arm_read_cold_1(&v8, v9);
      }
      _log_0();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        xpc_remote_channel_arm_read_cold_2();
      }
    }
  }
}

void __xpc_remote_channel_arm_read_block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  id v12 = (nw_connection **)*(id *)(a1 + 32);
  id v13 = (dispatch_data_s *)v9;
  uint64_t v14 = (nw_error *)v11;
  if (!v14)
  {
    if (!v13)
    {
      if ((a4 & 1) == 0) {
        _os_assumes_log();
      }
      _log_0();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)__int128 buf = 134217984;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl( &dword_186DD8000,  v25,  OS_LOG_TYPE_INFO,  "[%p] Header read returned without data, disconnecting",  buf,  0xCu);
      }

      unsigned int v17 = v12;
      unsigned int error_code = 57;
      goto LABEL_5;
    }

    size_t size_ptr = 0LL;
    buffer_ptr = 0LL;
    dispatch_data_t v18 = dispatch_data_create_map(v13, (const void **)&buffer_ptr, &size_ptr);
    _log_0();
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      __xpc_remote_channel_arm_read_block_invoke_cold_5();
    }

    if (size_ptr == 24 && *(_DWORD *)buffer_ptr == 699403154)
    {
      if (*((unsigned __int8 *)buffer_ptr + 4) == *((unsigned __int8 *)v12 + 73))
      {
        unint64_t v20 = *((void *)buffer_ptr + 1);
        if (!(v20 >> 27))
        {
          uint64_t v31 = *((void *)buffer_ptr + 2);
          uint64_t v32 = *((unsigned __int8 *)buffer_ptr + 5);
          uint64_t v33 = *((unsigned __int16 *)buffer_ptr + 3);
          uint64_t v34 = v32 | (v33 << 16);
          if ((_DWORD)v20)
          {
            if (v12[2])
            {
              _log_0();
              uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
                __xpc_remote_channel_arm_read_block_invoke_cold_4();
              }

              uint64_t v36 = v12[2];
              *(void *)__int128 buf = MEMORY[0x1895F87A8];
              *(void *)&buf[8] = 3221225472LL;
              *(void *)&uint8_t buf[16] = ___xpc_remote_channel_header_handler_block_invoke;
              *(void *)&_BYTE buf[24] = &unk_189F88078;
              uint64_t v42 = v12;
              uint64_t v43 = v31;
              uint64_t v44 = v34;
              int v45 = v20;
              nw_connection_receive(v36, v20, v20, buf);
            }

            else
            {
              if (*((_DWORD *)v12 + 10) <= 2u) {
                __xpc_remote_channel_arm_read_block_invoke_cold_2(&v38, buf);
              }
              _log_0();
              uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
                __xpc_remote_channel_arm_read_block_invoke_cold_3();
              }
            }
          }

          else
          {
            _xpc_remote_channel_deliver_message(v12, v31, v32 | (v33 << 16), 0LL);
          }

          goto LABEL_19;
        }

        _log_0();
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          __xpc_remote_channel_arm_read_block_invoke_cold_1();
        }

        uint64_t v22 = v12;
        unsigned int v23 = 40;
LABEL_18:
        xpc_remote_channel_cancel(v22, v23);
LABEL_19:

        goto LABEL_20;
      }

      _log_0();
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v26 = *((unsigned __int8 *)buffer_ptr + 4);
        int v27 = *((unsigned __int8 *)v12 + 73);
        *(_DWORD *)__int128 buf = 134218496;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&_BYTE buf[12] = 1024;
        *(_DWORD *)&buf[14] = v26;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v27;
        uint64_t v28 = "[%p] Invalid wire version: %d != %d";
        id v29 = v24;
        uint32_t v30 = 24;
LABEL_34:
        _os_log_error_impl(&dword_186DD8000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
      }
    }

    else
    {
      _log_0();
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 134218498;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&_BYTE buf[12] = 1040;
        *(_DWORD *)&buf[14] = size_ptr;
        *(_WORD *)&buf[18] = 2096;
        *(void *)&buf[20] = buffer_ptr;
        uint64_t v28 = "[%p] Invalid header received: %.*P";
        id v29 = v24;
        uint32_t v30 = 28;
        goto LABEL_34;
      }
    }

    uint64_t v22 = v12;
    unsigned int v23 = 22;
    goto LABEL_18;
  }

  _log_0();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 134218242;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v14;
    _os_log_impl( &dword_186DD8000,  v15,  OS_LOG_TYPE_INFO,  "[%p] Header read returned with error=%@, disconnecting",  buf,  0x16u);
  }

  unsigned int error_code = nw_error_get_error_code(v14);
  unsigned int v17 = v12;
LABEL_5:
  xpc_remote_channel_cancel(v17, error_code);
LABEL_20:
}

void __xpc_remote_channel_send_block_invoke(void *a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a2;
  _log_0();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = a1[4];
      uint64_t v7 = a1[8];
      int v12 = 134218498;
      uint64_t v13 = v6;
      __int16 v14 = 2048;
      uint64_t v15 = v7;
      __int16 v16 = 2112;
      unsigned int v17 = v3;
      _os_log_impl( &dword_186DD8000,  v4,  OS_LOG_TYPE_INFO,  "[%p] Send of msg_id %llu complete with error=%@.",  (uint8_t *)&v12,  0x20u);
    }

    uint64_t error_code = nw_error_get_error_code(v3);
  }

  else
  {
    if (v5)
    {
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[8];
      int v12 = 134218240;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl( &dword_186DD8000,  v4,  OS_LOG_TYPE_INFO,  "[%p] Send of msg_id %llu completed successfully",  (uint8_t *)&v12,  0x16u);
    }

    uint64_t error_code = 0LL;
  }

  uint64_t v11 = a1[5];
  if (v11) {
    (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, error_code);
  }
}

void xpc_remote_channel_attach_stream(void *a1, int a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  uint64_t v8 = a3;
  id v9 = a4;
  int v10 = *((_DWORD *)v7 + 10);
  if (v10 == 4) {
    xpc_remote_channel_attach_stream_cold_1(&v28, v29);
  }
  if (*((_DWORD *)v7 + 12)) {
    xpc_remote_channel_attach_stream_cold_7(&v28, v29);
  }
  if (a2 == 3) {
    xpc_remote_channel_attach_stream_cold_2(&v28, v29);
  }
  uint64_t v11 = v9;
  _log_0();
  int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10 == 3)
  {
    if (v13) {
      xpc_remote_channel_attach_stream_cold_3();
    }

    dispatch_io_close(v8, 0LL);
    __int16 v14 = (dispatch_queue_s *)*((void *)v7 + 1);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __xpc_remote_channel_attach_stream_block_invoke;
    block[3] = &unk_189F88030;
    uint64_t v15 = &v27;
    id v27 = v11;
    __int16 v16 = &v26;
    id v26 = v7;
    dispatch_async(v14, block);
  }

  else
  {
    if (v13) {
      xpc_remote_channel_attach_stream_cold_6();
    }

    *((_DWORD *)v7 + 12) = a2;
    objc_storeStrong((id *)v7 + 8, a3);
    unsigned int v17 = (dispatch_queue_s *)*((void *)v7 + 1);
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __xpc_remote_channel_attach_stream_block_invoke_34;
    v22[3] = &unk_189F87E30;
    uint64_t v18 = (dispatch_io_t *)v7;
    unsigned int v23 = v18;
    id v24 = v11;
    dispatch_io_t v19 = dispatch_io_create_with_io(0LL, v8, v17, v22);
    dispatch_io_t v20 = v18[7];
    v18[7] = v19;

    dispatch_io_set_low_water(v18[7], 1uLL);
    if (!v18[7]) {
      xpc_remote_channel_attach_stream_cold_4(&v28, v29);
    }
    uint64_t v15 = (id *)&v23;
    __int16 v16 = &v24;
    int v21 = *((_DWORD *)v7 + 12);
    if (v21 == 2)
    {
      _xpc_remote_channel_enqueue_rx(v18);
    }

    else
    {
      if (v21 != 1) {
        xpc_remote_channel_attach_stream_cold_5();
      }
      _xpc_remote_channel_enqueue_tx(v18);
    }
  }
}

uint64_t __xpc_remote_channel_attach_stream_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(unsigned int *)(*(void *)(a1 + 32) + 44LL));
}

uint64_t __xpc_remote_channel_attach_stream_block_invoke_34(uint64_t a1, unsigned int a2)
{
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __xpc_remote_channel_attach_stream_block_invoke_34_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0LL;

  xpc_remote_channel_cancel(*(void **)(a1 + 32), a2);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void _xpc_remote_channel_enqueue_tx(void *a1)
{
  id v1 = a1;
  if (*((_DWORD *)v1 + 10) <= 2u)
  {
    _log_0();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_channel_enqueue_tx_cold_1();
    }

    uint64_t v3 = (dispatch_io_s *)*((void *)v1 + 7);
    int v4 = (dispatch_queue_s *)*((void *)v1 + 1);
    io_handler[0] = MEMORY[0x1895F87A8];
    io_handler[1] = 3221225472LL;
    io_handler[2] = ___xpc_remote_channel_enqueue_tx_block_invoke;
    io_handler[3] = &unk_189F880F0;
    id v6 = v1;
    dispatch_io_read(v3, 0LL, 0x20000uLL, v4, io_handler);
  }
}

void _xpc_remote_channel_enqueue_rx(void *a1)
{
  id v1 = a1;
  if (*((_DWORD *)v1 + 10) <= 2u)
  {
    _log_0();
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      _xpc_remote_channel_enqueue_rx_cold_1((uint64_t)v1, v2);
    }

    uint64_t v3 = (nw_connection *)*((void *)v1 + 2);
    completion[0] = MEMORY[0x1895F87A8];
    completion[1] = 3221225472LL;
    completion[2] = ___xpc_remote_channel_enqueue_rx_block_invoke;
    completion[3] = &unk_189F87FE0;
    id v5 = v1;
    nw_connection_receive(v3, 1u, 0x20000u, completion);
  }
}

void ___log_block_invoke_0()
{
  os_log_t v0 = os_log_create("com.apple.xpc.remote", "channel");
  id v1 = (void *)_log_logger_0;
  _log_logger_0 = (uint64_t)v0;
}

void _xpc_remote_channel_deliver_message(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v7 = (dispatch_queue_s *)a1[1];
  id v8 = a4;
  id v9 = a1;
  dispatch_assert_queue_V2(v7);
  _log_0();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v12 = 134217984;
    uint64_t v13 = a2;
    _os_log_impl(&dword_186DD8000, v10, OS_LOG_TYPE_INFO, "Delivering %llu", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = v9[4];
  (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v11 + 16))(v11, a2, a3, v8);
}

void ___xpc_remote_channel_header_handler_block_invoke(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v9 = a2;
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = *(unsigned int *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 48);
  uint64_t v15 = *(id *)(a1 + 32);
  __int16 v16 = (dispatch_data_s *)v9;
  unsigned int v17 = (nw_error *)v11;
  if (v17)
  {
    _log_0();
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_header_handler_block_invoke_cold_3();
    }

    unsigned int error_code = nw_error_get_error_code(v17);
    dispatch_io_t v20 = v15;
LABEL_5:
    xpc_remote_channel_cancel(v20, error_code);
    goto LABEL_6;
  }

  if (!v16)
  {
    if ((a4 & 1) == 0) {
      _os_assumes_log();
    }
    _log_0();
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_header_handler_block_invoke_cold_1();
    }

    dispatch_io_t v20 = v15;
    unsigned int error_code = 57;
    goto LABEL_5;
  }

  size_t size = dispatch_data_get_size(v16);
  _log_0();
  uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v23 = v22;
  if (size != v12)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v25 = 134218496;
      id v26 = v15;
      __int16 v27 = 2048;
      uint64_t v28 = v12;
      __int16 v29 = 2048;
      size_t v30 = dispatch_data_get_size(v16);
      _os_log_error_impl( &dword_186DD8000,  v23,  OS_LOG_TYPE_ERROR,  "[%p] Body read returned with short data (message_size=%llu, data_size=%zu), disconnecting",  (uint8_t *)&v25,  0x20u);
    }

    dispatch_io_t v20 = v15;
    unsigned int error_code = 22;
    goto LABEL_5;
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    ___xpc_remote_channel_header_handler_block_invoke_cold_2();
  }

  _xpc_remote_channel_deliver_message(v15, v13, v14, v16);
LABEL_6:
}

void ___xpc_remote_channel_enqueue_tx_block_invoke(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v8 = (void **)(a1 + 32);
  unsigned int v10 = *(_DWORD *)(v9 + 40);
  _log_0();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10 < 3)
  {
    if (v12)
    {
      id v24 = *v8;
      if (v7) {
        size_t size = dispatch_data_get_size(v7);
      }
      else {
        size_t size = 0LL;
      }
      id v26 = "false";
      *(_DWORD *)__int128 buf = 134218754;
      uint64_t v33 = v24;
      __int16 v34 = 2048;
      if (a2) {
        id v26 = "true";
      }
      size_t v35 = size;
      __int16 v36 = 1024;
      unsigned int v37 = a4;
      __int16 v38 = 2080;
      id v39 = v26;
      _os_log_debug_impl( &dword_186DD8000,  v11,  OS_LOG_TYPE_DEBUG,  "[%p] IO read returned %zd bytes, error = %{errno}d, done = %s",  buf,  0x26u);
    }

    uint64_t v13 = (dispatch_data_s *)MEMORY[0x1895F8AA8];
    _log_0();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v14;
    if (v7 == v13 && !a4 && a2)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = *v8;
        *(_DWORD *)__int128 buf = 134217984;
        uint64_t v33 = v16;
        _os_log_impl( &dword_186DD8000,  v15,  OS_LOG_TYPE_INFO,  "[%p] IO read returned EOF, calling write_close",  buf,  0xCu);
      }

      unsigned int v17 = *v8;
      uint64_t v18 = (nw_connection *)*((void *)*v8 + 2);
      dispatch_io_t v19 = (nw_content_context *)*MEMORY[0x189608E90];
      completion[0] = MEMORY[0x1895F87A8];
      completion[1] = 3221225472LL;
      completion[2] = ___xpc_remote_channel_enqueue_tx_block_invoke_45;
      completion[3] = &unk_189F880A0;
      uint64_t v31 = v17;
      nw_connection_send(v18, 0LL, v19, 1, completion);
      id v11 = v31;
    }

    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        ___xpc_remote_channel_enqueue_tx_block_invoke_cold_3();
      }

      dispatch_io_t v20 = *v8;
      int v21 = (nw_connection *)*((void *)*v8 + 2);
      uint64_t v22 = (nw_content_context *)*MEMORY[0x189608E88];
      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = ___xpc_remote_channel_enqueue_tx_block_invoke_46;
      v27[3] = &unk_189F880C8;
      uint64_t v28 = v20;
      char v29 = a2;
      nw_connection_send(v21, v7, v22, 1, v27);
      if (a4)
      {
        _log_0();
        unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          ___xpc_remote_channel_enqueue_tx_block_invoke_cold_2();
        }

        xpc_remote_channel_cancel(*v8, a4);
      }

      id v11 = v28;
    }
  }

  else if (v12)
  {
    ___xpc_remote_channel_enqueue_tx_block_invoke_cold_1();
  }
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  _log_0();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_enqueue_tx_block_invoke_45_cold_1();
    }
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 134217984;
      uint64_t v8 = v6;
      _os_log_impl( &dword_186DD8000,  v5,  OS_LOG_TYPE_INFO,  "[%p] write-close succeeded, marking successful Tx",  (uint8_t *)&v7,  0xCu);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 72LL) = 1;
  }
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (v3)
  {
    _log_0();
    int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 134218242;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      uint64_t v14 = v3;
      _os_log_impl( &dword_186DD8000,  v4,  OS_LOG_TYPE_INFO,  "[%p] Connection write returned error %@",  (uint8_t *)&v11,  0x16u);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    unsigned int error_code = nw_error_get_error_code(v3);
    xpc_remote_channel_cancel(v6, error_code);
  }

  else
  {
    int v8 = *(unsigned __int8 *)(a1 + 40);
    _log_0();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_2();
      }

      _xpc_remote_channel_enqueue_tx(*(void *)(a1 + 32));
    }

    else
    {
      if (v10) {
        ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_1();
      }
    }
  }
}

void ___xpc_remote_channel_enqueue_rx_block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v9 = a2;
  id v10 = a3;
  int v11 = a5;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v12 = a1 + 32;
  if (*(_DWORD *)(v13 + 40) >= 3u)
  {
    _log_0();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      ___xpc_remote_channel_enqueue_rx_block_invoke_cold_3(v12, v9, v14);
    }
  }

  if (!v9 || v11)
  {
    if (v9 || !a4 || v11)
    {
      if (!v11) {
        ___xpc_remote_channel_enqueue_rx_block_invoke_cold_2();
      }
      _log_0();
      unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        id v24 = *(void **)v12;
        *(_DWORD *)__int128 buf = 134218242;
        char v29 = v24;
        __int16 v30 = 2112;
        uint64_t v31 = v11;
        _os_log_impl( &dword_186DD8000,  v23,  OS_LOG_TYPE_INFO,  "[%p] Connection read got error %@. Canceling remote channel.",  buf,  0x16u);
      }

      int v25 = *(void **)v12;
      unsigned int error_code = nw_error_get_error_code(v11);
      int v21 = v25;
    }

    else
    {
      _log_0();
      dispatch_io_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        dispatch_io_t v20 = *(void **)v12;
        *(_DWORD *)__int128 buf = 134217984;
        char v29 = v20;
        _os_log_impl( &dword_186DD8000,  v19,  OS_LOG_TYPE_INFO,  "[%p] Connection read got EOF. Canceling remote channel.",  buf,  0xCu);
      }

      int v21 = *(void **)v12;
      unsigned int error_code = 0;
    }

    xpc_remote_channel_cancel(v21, error_code);
  }

  else
  {
    _log_0();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      ___xpc_remote_channel_enqueue_rx_block_invoke_cold_1(v12, v9, v15);
    }

    __int16 v16 = *(void **)v12;
    unsigned int v17 = *(dispatch_io_s **)(*(void *)v12 + 56LL);
    uint64_t v18 = (dispatch_queue_s *)v16[1];
    io_handler[0] = MEMORY[0x1895F87A8];
    io_handler[1] = 3221225472LL;
    io_handler[2] = ___xpc_remote_channel_enqueue_rx_block_invoke_48;
    io_handler[3] = &unk_189F880F0;
    __int16 v27 = v16;
    dispatch_io_write(v17, 0LL, v9, v18, io_handler);
  }
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_48(uint64_t a1, int a2, void *a3, unsigned int a4)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v7 = a3;
  uint64_t v9 = *(void *)(a1 + 32);
  int v8 = (void **)(a1 + 32);
  if (*(_DWORD *)(v9 + 40) <= 2u)
  {
    if (a4)
    {
      if ((a2 & 1) == 0) {
        ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_2(&v13, buf);
      }
      _log_0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = *v8;
        *(_DWORD *)__int128 buf = 134218240;
        uint64_t v15 = v11;
        __int16 v16 = 1024;
        unsigned int v17 = a4;
        _os_log_impl(&dword_186DD8000, v10, OS_LOG_TYPE_INFO, "[%p] IO write got error %d", buf, 0x12u);
      }

      xpc_remote_channel_cancel(*v8, a4);
LABEL_10:
      _xpc_remote_channel_enqueue_rx(*v8);
      goto LABEL_11;
    }

    _log_0();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_1((int)v8, v7, v12);
    }

    if (a2) {
      goto LABEL_10;
    }
  }

LABEL_11:
}

void OUTLINED_FUNCTION_6_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return _os_log_send_and_compose_impl();
}

  ;
}

void OUTLINED_FUNCTION_15_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void OUTLINED_FUNCTION_16_0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

size_t OUTLINED_FUNCTION_20_0(int a1, dispatch_data_t data)
{
  return dispatch_data_get_size(data);
}

BOOL OUTLINED_FUNCTION_21_0()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void *xpc_remote_listener_create_for_remote_service(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)objc_opt_new();
  int v11 = (void *)v10[1];
  v10[1] = v7;
  id v12 = v7;

  uint64_t v13 = MEMORY[0x186E48FB4](v9);
  uint64_t v14 = (void *)v10[3];
  v10[3] = v13;

  uint64_t v15 = MEMORY[0x186E48FB4](v8);
  __int16 v16 = (void *)v10[4];
  void v10[4] = v15;

  if (_log_onceToken_1 != -1) {
    dispatch_once(&_log_onceToken_1, &__block_literal_global_1);
  }
  unsigned int v17 = (os_log_s *)_log_logger_1;
  if (os_log_type_enabled((os_log_t)_log_logger_1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v21 = a1;
    _os_log_impl(&dword_186DD8000, v17, OS_LOG_TYPE_DEFAULT, "Checking in for remote service: %s", buf, 0xCu);
  }

  dispatch_io_t v19 = v10;
  remote_service_listen_with_device();

  return v19;
}

uint64_t __xpc_remote_listener_create_for_remote_service_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 24LL) + 16LL))();
}

void xpc_remote_listener_cancel(void *a1)
{
  id v1 = a1;
  dispatch_assert_queue_V2(v1[1]);
  if (*((_DWORD *)v1 + 4) != 1)
  {
    *((_BYTE *)v1 + 40) = 1;
    _os_crash();
    __break(1u);
  }

  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void ___log_block_invoke_1()
{
  os_log_t v0 = os_log_create("com.apple.xpc.remote", "listener");
  id v1 = (void *)_log_logger_1;
  _log_logger_1 = (uint64_t)v0;
}

void xpc_remote_connection_get_remote_service_version_cold_1()
{
}

void __xpc_remote_connection_set_local_service_version_block_invoke_cold_1()
{
}

void xpc_remote_connection_create_with_remote_service_cold_1()
{
}

void xpc_remote_connection_create_with_remote_service_cold_2()
{
}

void xpc_remote_connection_create_with_remote_service_cold_3( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void xpc_remote_connection_set_tls_cold_1()
{
}

void xpc_remote_connection_set_tls_cold_2()
{
}

void xpc_remote_connection_set_tls_cold_3()
{
}

void _xpc_remote_connection_parse_flags_cold_1(void *a1, _OWORD *a2)
{
}

void xpc_remote_connection_create_remote_service_listener_cold_1()
{
}

void _xpc_remote_connection_parse_mode_flags_cold_1()
{
}

void xpc_remote_connection_setup_nw_parameters_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_activate_block_invoke_cold_1()
{
}

void __xpc_remote_connection_activate_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_activate_block_invoke_cold_3(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_cold_1(void *a1, _OWORD *a2)
{
}

void xpc_remote_connection_send_message_cold_1()
{
}

void __xpc_remote_connection_send_message_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_message_create_cold_1()
{
}

void _xpc_remote_message_create_cold_2()
{
}

void _xpc_remote_connection_send_reply_message_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_send_message_with_reply_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void xpc_remote_connection_send_message_with_reply_sync_cold_2()
{
}

void xpc_remote_connection_send_message_with_reply_sync_cold_3()
{
}

void xpc_remote_connection_send_message_with_reply_sync_cold_4()
{
}

void __xpc_remote_connection_send_message_with_reply_sync_block_invoke_cold_1()
{
}

void xpc_remote_connection_send_reply_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_message_dispose_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_3()
{
}

void ___xpc_remote_connection_listen_block_invoke_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _xpc_remote_connection_connect_complete_cold_1()
{
}

void _xpc_remote_connection_connect_complete_cold_3()
{
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_21(&dword_186DD8000, v1, v2, "[%p] root channel (%p) created", v3, v4);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_connect_complete_cold_4(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_5(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_6(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_7(void *a1, _OWORD *a2)
{
}

uint64_t _xpc_remote_connection_connect_complete_cold_8()
{
  return OUTLINED_FUNCTION_26();
}

void _xpc_remote_connection_connect_complete_cold_9()
{
}

void _xpc_remote_connection_connect_complete_cold_10(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_11(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_complete_cold_12(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_2(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_3()
{
}

void _xpc_remote_connection_connect_failed_cold_4(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_failed_cold_5(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_connect_doa_cold_3(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_1(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_3(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_connect_complete_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_handle_read_cold_1()
{
}

void _xpc_remote_connection_handle_read_cold_2()
{
}

void _xpc_remote_connection_handle_read_cold_3()
{
}

void _xpc_remote_connection_handle_read_cold_4()
{
}

void _xpc_remote_connection_handle_read_cold_5(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_handle_read_cold_6()
{
}

void _xpc_remote_connection_handle_read_cold_7()
{
}

void _xpc_remote_connection_handle_read_cold_8()
{
}

void _xpc_remote_connection_handle_read_cold_9(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_handle_read_cold_10()
{
}

void _xpc_remote_connection_handle_read_cold_11()
{
}

void _xpc_remote_connection_handle_read_cold_12()
{
  WORD2(OUTLINED_FUNCTION_15( &dword_186DD8000,  v0,  v1,  "[%p] Received reply on a non-reply channel (%p) from a peer that should know better",  v2, v3) = 2080;
  HIWORD(OUTLINED_FUNCTION_15( &dword_186DD8000,  v0,  v1,  "[%p] Received reply on a non-reply channel (%p) from a peer that should know better",  v2, v3) = v0;
  OUTLINED_FUNCTION_21(&dword_186DD8000, v0, v1, "[%p] HELO message received: %s", v2, v3);
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_connection_handle_read_cold_13()
{
}

void _xpc_remote_connection_handle_read_cold_14()
{
}

void _xpc_remote_connection_handle_read_cold_15()
{
}

void ___xpc_remote_connection_setup_nw_listener_block_invoke_cold_1()
{
}

void __xpc_remote_connection_teardown_cold_1()
{
}

void __xpc_remote_connection_teardown_cold_2(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_teardown_continue_cold_1(void *a1, _OWORD *a2)
{
}

void __xpc_remote_connection_teardown_continue_cold_2()
{
}

void __xpc_remote_connection_teardown_continue_cold_3()
{
}

void __xpc_remote_connection_teardown_continue_cold_4()
{
}

void __xpc_remote_connection_teardown_continue_cold_5()
{
}

void __xpc_remote_connection_teardown_continue_cold_6()
{
}

void __xpc_remote_connection_teardown_continue_cold_7(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_flush_cold_1()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_cold_1()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_cold_2( void *a1, _OWORD *a2, id *a3)
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_1()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_2()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_3()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_4()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_5()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_218_cold_6()
{
}

void ___xpc_remote_connection_handle_new_channel_block_invoke_219_cold_1()
{
}

void _xpc_remote_channel_send_stream_header_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_channel_send_stream_header_cold_2(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_connection_ready_block_invoke_cold_1()
{
}

void ___xpc_remote_connection_ready_block_invoke_223_cold_1()
{
}

void ___xpc_remote_connection_handle_read_block_invoke_cold_1()
{
}

void _xpc_remote_connection_wakeup_cold_1()
{
}

void _xpc_remote_connection_wakeup_cold_2()
{
}

void _xpc_remote_connection_send_ool_message_content_cold_1(void *a1, _OWORD *a2)
{
}

void _xpc_remote_connection_send_ool_message_content_cold_2()
{
}

void ___xpc_remote_connection_wakeup_block_invoke_cold_1()
{
}

void ___recv_file_transfer_block_invoke_2_cold_1(void *a1, _OWORD *a2)
{
}

void ___recv_file_transfer_block_invoke_2_cold_2(void *a1, _OWORD *a2)
{
}

void ___recv_file_transfer_block_invoke_5_cold_1(void *a1, _OWORD *a2)
{
}

void ___xpc_remote_message_create_block_invoke_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ___xpc_remote_message_create_block_invoke_cold_2()
{
}

void ___xpc_remote_connection_send_reply_message_block_invoke_cold_1()
{
}

void xpc_remote_channel_create_cold_1()
{
}

void __xpc_remote_channel_create_block_invoke_cold_1()
{
}

void __xpc_remote_channel_create_block_invoke_cold_2()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_16_0(&dword_186DD8000, v1, (uint64_t)v1, "[%p] Got nw_connection failed with error %{public}@", v2);
  OUTLINED_FUNCTION_9();
}

void __xpc_remote_channel_create_block_invoke_cold_3()
{
}

void __xpc_remote_channel_create_block_invoke_cold_4(void *a1, _OWORD *a2)
{
}

void __xpc_remote_channel_create_block_invoke_cold_5()
{
}

void xpc_remote_channel_cancel_cold_1()
{
}

void xpc_remote_channel_cancel_cold_2()
{
}

void xpc_remote_channel_cancel_cold_3()
{
}

void __xpc_remote_channel_create_block_invoke_21_cold_1()
{
}

void __xpc_remote_channel_create_block_invoke_21_cold_2()
{
}

void __xpc_remote_channel_create_block_invoke_21_cold_3()
{
}

void __xpc_remote_channel_create_block_invoke_21_cold_4()
{
}

void __xpc_remote_channel_create_block_invoke_23_cold_1()
{
}

void __xpc_remote_channel_create_block_invoke_24_cold_1()
{
}

void __xpc_remote_channel_create_block_invoke_29_cold_1()
{
}

void xpc_remote_channel_arm_read_cold_1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void xpc_remote_channel_arm_read_cold_2()
{
}

void xpc_remote_channel_arm_read_cold_3()
{
}

void __xpc_remote_channel_arm_read_block_invoke_cold_1()
{
}

void __xpc_remote_channel_arm_read_block_invoke_cold_2(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_21_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_16();
  __break(1u);
}

void __xpc_remote_channel_arm_read_block_invoke_cold_3()
{
}

void __xpc_remote_channel_arm_read_block_invoke_cold_4()
{
}

void __xpc_remote_channel_arm_read_block_invoke_cold_5()
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_14();
  __int16 v3 = 1040;
  int v4 = 24;
  __int16 v5 = 2096;
  uint64_t v6 = v0;
  _os_log_debug_impl( &dword_186DD8000,  v1,  OS_LOG_TYPE_DEBUG,  "[%p] Header recieved. %{struct:remote_wire_header}.*P",  v2,  0x1Cu);
}

void xpc_remote_channel_attach_stream_cold_1(void *a1, _OWORD *a2)
{
}

void xpc_remote_channel_attach_stream_cold_2(void *a1, _OWORD *a2)
{
}

void xpc_remote_channel_attach_stream_cold_3()
{
}

void xpc_remote_channel_attach_stream_cold_4(void *a1, _OWORD *a2)
{
}

void xpc_remote_channel_attach_stream_cold_5()
{
}

void xpc_remote_channel_attach_stream_cold_6()
{
  OUTLINED_FUNCTION_6_0(&dword_186DD8000, v0, v1, "[%p] attaching channel to stream (direction=%d)...", v2, v3);
  OUTLINED_FUNCTION_9();
}

void xpc_remote_channel_attach_stream_cold_7(void *a1, _OWORD *a2)
{
}

void __xpc_remote_channel_attach_stream_block_invoke_34_cold_1()
{
  OUTLINED_FUNCTION_6_0(&dword_186DD8000, v0, v1, "[%p] IO cleanup handler called with error = %{errno}d");
  OUTLINED_FUNCTION_9();
}

void _xpc_remote_channel_enqueue_tx_cold_1()
{
}

void _xpc_remote_channel_enqueue_rx_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = 134218496;
  uint64_t v3 = a1;
  __int16 v4 = 1024;
  int v5 = 1;
  __int16 v6 = 1024;
  int v7 = 0x20000;
  _os_log_debug_impl( &dword_186DD8000,  a2,  OS_LOG_TYPE_DEBUG,  "[%p] Enqueueing connection read for %d to %d bytes",  (uint8_t *)&v2,  0x18u);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13( &dword_186DD8000,  v0,  v1,  "[%p] Body read returned without data, disconnecting",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_2()
{
}

void ___xpc_remote_channel_header_handler_block_invoke_cold_3()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_14();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_15_0(&dword_186DD8000, v1, (uint64_t)v1, "[%p] Body read returned with error=%@, disconnecting", v2);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6(&dword_186DD8000, v0, v1, "[%p] IO read returned post-cancel, ignoring", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_2()
{
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_cold_3()
{
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_45_cold_1()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_15_0(&dword_186DD8000, v1, (uint64_t)v1, "[%p] write close failed with error %@", v2);
  OUTLINED_FUNCTION_9();
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_1()
{
}

void ___xpc_remote_channel_enqueue_tx_block_invoke_46_cold_2()
{
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_1(int a1, dispatch_data_s *a2, os_log_s *a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_20_0(a1, a2);
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0( &dword_186DD8000,  a3,  v4,  "[%p] Connection read succeeded for %zd bytes. Enqueueing IO write.",  v5);
  OUTLINED_FUNCTION_14_0();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_2()
{
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_cold_3(int a1, dispatch_data_s *a2, os_log_s *a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a2) {
    OUTLINED_FUNCTION_20_0(a1, a2);
  }
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_15_0(&dword_186DD8000, a3, v4, "[%p] DROPPING %zu bytes on canceled stream", v5);
  OUTLINED_FUNCTION_14_0();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_1(int a1, dispatch_data_s *a2, os_log_s *a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a2) {
    OUTLINED_FUNCTION_20_0(a1, a2);
  }
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_16_0(&dword_186DD8000, a3, v4, "[%p] IO write complete, %zd bytes remaining", v5);
  OUTLINED_FUNCTION_14_0();
}

void ___xpc_remote_channel_enqueue_rx_block_invoke_48_cold_2(void *a1, _OWORD *a2)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1895F8D70]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895F8D78]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1895F8D80]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1895F8DE0]();
}

uint64_t _xpc_dictionary_extract_reply_msg_id()
{
  return MEMORY[0x1895F9180]();
}

uint64_t _xpc_dictionary_get_reply_msg_id()
{
  return MEMORY[0x1895F9188]();
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create( const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1895FABF8](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return (dispatch_data_t)MEMORY[0x1895FAC08](data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x1895FAC10](data, buffer_ptr, size_ptr);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1895FAC28](data);
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create_with_io( dispatch_io_type_t type, dispatch_io_t io, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1895FACA0](type, io, queue, cleanup_handler);
}

void dispatch_io_read( dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_low_water(dispatch_io_t channel, size_t low_water)
{
}

void dispatch_io_write( dispatch_io_t channel, off_t offset, dispatch_data_t data, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency( dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1895FAD68](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(uint64_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1895FADF0](value);
}

uint64_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1895FAE00](dsema);
}

uint64_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1895FAE08](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x189609158]();
}

nw_parameters_t nw_connection_copy_parameters(nw_connection_t connection)
{
  return (nw_parameters_t)MEMORY[0x189609188](connection);
}

uint64_t nw_connection_create_with_connected_socket_and_parameters()
{
  return MEMORY[0x1896091C0]();
}

uint64_t nw_connection_create_with_connection()
{
  return MEMORY[0x1896091C8]();
}

void nw_connection_receive( nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send( nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

uint64_t nw_connection_set_adaptive_write_handler()
{
  return MEMORY[0x1896092E8]();
}

uint64_t nw_connection_set_cancel_handler()
{
  return MEMORY[0x1896092F8]();
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x189609300]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

uint64_t nw_connection_set_read_close_handler()
{
  return MEMORY[0x189609320]();
}

void nw_connection_set_viability_changed_handler( nw_connection_t connection, nw_connection_BOOLean_event_handler_t handler)
{
}

uint64_t nw_connection_set_write_close_handler()
{
  return MEMORY[0x189609338]();
}

void nw_connection_start(nw_connection_t connection)
{
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1896094E0](endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x189609598](error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return MEMORY[0x1896095A8](error);
}

nw_error_domain_t nw_error_get_error_domain(nw_error_t error)
{
  return MEMORY[0x1896095B0](error);
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create_with_connection(nw_connection_t connection, nw_parameters_t parameters)
{
  return (nw_listener_t)MEMORY[0x1896098B8](connection, parameters);
}

uint64_t nw_listener_set_event_handler()
{
  return MEMORY[0x1896098D8]();
}

void nw_listener_set_new_connection_handler( nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

uint64_t nw_parameters_add_protocol_stack_member()
{
  return MEMORY[0x189609978]();
}

nw_parameters_t nw_parameters_copy(nw_parameters_t parameters)
{
  return (nw_parameters_t)MEMORY[0x189609990](parameters);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x1896099E8]();
}

uint64_t nw_parameters_create_protocol_parameters()
{
  return MEMORY[0x1896099F8]();
}

uint64_t nw_parameters_set_data_mode()
{
  return MEMORY[0x189609B18]();
}

uint64_t nw_parameters_set_server_mode()
{
  return MEMORY[0x189609C68]();
}

uint64_t nw_protocol_http2_transport_identifier()
{
  return MEMORY[0x18960A230]();
}

uint64_t nw_protocol_http2_transport_parameters_set_connection_receive_window_size()
{
  return MEMORY[0x18960A238]();
}

uint64_t nw_protocol_http2_transport_parameters_set_stream_receive_window_size()
{
  return MEMORY[0x18960A240]();
}

sec_protocol_options_t nw_tls_copy_sec_protocol_options(nw_protocol_options_t options)
{
  return (sec_protocol_options_t)MEMORY[0x18960AB98](options);
}

nw_protocol_options_t nw_tls_create_options(void)
{
  return (nw_protocol_options_t)MEMORY[0x18960ABA0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

uint64_t remote_device_copy_xpc_remote_connection_tls_identity()
{
  return MEMORY[0x189611F08]();
}

uint64_t remote_device_copy_xpc_remote_connection_tls_verify_block()
{
  return MEMORY[0x189611F10]();
}

uint64_t remote_device_get_xpc_remote_connection_mode_flags()
{
  return MEMORY[0x189611F40]();
}

uint64_t remote_device_get_xpc_remote_connection_version_flags()
{
  return MEMORY[0x189611F48]();
}

uint64_t remote_device_xpc_remote_connection_tls_enabled()
{
  return MEMORY[0x189611FA0]();
}

uint64_t remote_service_connect_socket()
{
  return MEMORY[0x189611FA8]();
}

uint64_t remote_service_copy_device()
{
  return MEMORY[0x189611FB0]();
}

uint64_t remote_service_copy_xpc_remote_connection_tls_identity()
{
  return MEMORY[0x189611FB8]();
}

uint64_t remote_service_copy_xpc_remote_connection_tls_verify_block()
{
  return MEMORY[0x189611FC0]();
}

uint64_t remote_service_get_name()
{
  return MEMORY[0x189611FC8]();
}

uint64_t remote_service_get_version()
{
  return MEMORY[0x189611FD0]();
}

uint64_t remote_service_get_xpc_remote_connection_version_flags()
{
  return MEMORY[0x189611FD8]();
}

uint64_t remote_service_listen_with_device()
{
  return MEMORY[0x189611FE0]();
}

uint64_t remote_service_xpc_remote_connection_tls_enabled()
{
  return MEMORY[0x189611FF0]();
}

uint64_t remote_socket_create_connected_ipv6_pair()
{
  return MEMORY[0x189611FF8]();
}

void sec_protocol_options_append_tls_ciphersuite_group( sec_protocol_options_t options, tls_ciphersuite_group_t group)
{
}

void sec_protocol_options_set_local_identity(sec_protocol_options_t options, sec_identity_t identity)
{
}

void sec_protocol_options_set_max_tls_protocol_version( sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_min_tls_protocol_version( sec_protocol_options_t options, tls_protocol_version_t version)
{
}

void sec_protocol_options_set_peer_authentication_required( sec_protocol_options_t options, BOOL peer_authentication_required)
{
}

void sec_protocol_options_set_verify_block( sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return MEMORY[0x1895FCFA8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1895FDA98](object);
}

uint64_t xpc_create_from_serialization()
{
  return MEMORY[0x1895FDAE8]();
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1895FDB30](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1895FDB98](keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1895FDC20](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1895FDC38](xdict);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_extension_type_init()
{
  return MEMORY[0x1895FDDE8]();
}

uint64_t xpc_file_transfer_copy_io()
{
  return MEMORY[0x1895FDE10]();
}

uint64_t xpc_file_transfer_get_transfer_id()
{
  return MEMORY[0x1895FDE38]();
}

uint64_t xpc_file_transfer_send_finished()
{
  return MEMORY[0x1895FDE40]();
}

uint64_t xpc_file_transfer_set_transport_writing_callbacks()
{
  return MEMORY[0x1895FDE48]();
}

uint64_t xpc_file_transfer_write_finished()
{
  return MEMORY[0x1895FDE50]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1895FDE70](object);
}

uint64_t xpc_install_remote_hooks()
{
  return MEMORY[0x1895FDEA8]();
}

uint64_t xpc_make_serialization()
{
  return MEMORY[0x1895FDF38]();
}

uint64_t xpc_make_serialization_with_ool()
{
  return MEMORY[0x1895FDF40]();
}

uint64_t xpc_receive_remote_msg()
{
  return MEMORY[0x1895FDF78]();
}

void xpc_transaction_begin(void)
{
}