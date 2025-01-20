@interface SocketRemoteXpcProxy
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)proxyServer;
- (OS_xpc_remote_connection)peer;
- (SocketRemoteXpcProxy)initWithSocket:(int)a3 device:(id)a4 queue:(id)a5 server:(BOOL)a6;
- (id)onCancel;
- (int)proxyClient;
- (int)takeOwnershipOfClientSocket;
- (void)activate;
- (void)cancel;
- (void)setOnCancel:(id)a3;
@end

@implementation SocketRemoteXpcProxy

- (SocketRemoteXpcProxy)initWithSocket:(int)a3 device:(id)a4 queue:(id)a5 server:(BOOL)a6
{
  id v8 = a4;
  v9 = (dispatch_queue_s *)a5;
  uintptr_t handle = -1LL;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___SocketRemoteXpcProxy;
  v10 = -[SocketRemoteXpcProxy init](&v29, sel_init);
  if (!v10) {
    goto LABEL_14;
  }
  remote_device_get_type(v8);
  if (MEMORY[0x189612040])
  {
    xpc_remote_connection_get_version_flags();
    v12 = (void *)xpc_remote_connection_create_with_connected_fd();
    if (remote_device_xpc_remote_connection_tls_enabled(v8))
    {
      remote_device_copy_xpc_remote_connection_tls_identity(v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = v8;
      xpc_remote_connection_set_tls();
    }

    id v14 = rsd_log();
    int connected_ipv6_pair = remote_socket_create_connected_ipv6_pair((int *)&handle + 1, (int *)&handle, v14);

    if (connected_ipv6_pair)
    {
      v16 = (os_log_s *)rsd_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SocketRemoteXpcProxy initWithSocket:device:queue:server:].cold.2(v16);
      }

      goto LABEL_12;
    }

    int v18 = HIDWORD(handle);
    int v19 = fcntl(SHIDWORD(handle), 3, 0LL);
    fcntl(v18, 4, v19 & 0xFFFFFFFB);
    int v20 = handle;
    int v21 = fcntl(handle, 3, 0LL);
    fcntl(v20, 4, v21 | 4u);
    fcntl(SHIDWORD(handle), 2, 1LL);
    fcntl(handle, 2, 1LL);
    v10->_proxyClient = HIDWORD(handle);
    objc_storeStrong((id *)&v10->_queue, a5);
    peer = v10->_peer;
    v10->_peer = (OS_xpc_remote_connection *)v12;
    id v23 = v12;

    dispatch_source_t v24 = dispatch_source_create(MEMORY[0x1895F8B60], (int)handle, 0LL, v9);
    proxyServer = v10->_proxyServer;
    v10->_proxyServer = (OS_dispatch_source *)v24;

    id onCancel = v10->_onCancel;
    v10->_id onCancel = 0LL;

LABEL_14:
    v17 = v10;
    goto LABEL_15;
  }

  v11 = (os_log_s *)rsd_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    -[SocketRemoteXpcProxy initWithSocket:device:queue:server:].cold.1();
  }

LABEL_12:
  v17 = 0LL;
LABEL_15:

  return v17;
}

void __59__SocketRemoteXpcProxy_initWithSocket_device_queue_server___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
}

- (void)activate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SocketRemoteXpcProxy queue](self, "queue");
  xpc_remote_connection_set_target_queue();
  v5 = -[SocketRemoteXpcProxy peer](self, "peer");
  uint64_t v6 = MEMORY[0x1895F87A8];
  handler[5] = MEMORY[0x1895F87A8];
  handler[6] = 3221225472LL;
  handler[7] = __32__SocketRemoteXpcProxy_activate__block_invoke;
  handler[8] = &unk_189F0BC38;
  handler[9] = self;
  xpc_remote_connection_set_event_handler();

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  handler[0] = v6;
  handler[1] = 3221225472LL;
  handler[2] = __32__SocketRemoteXpcProxy_activate__block_invoke_5;
  handler[3] = &unk_189F0BC60;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  id v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472LL;
  v11[2] = __32__SocketRemoteXpcProxy_activate__block_invoke_7;
  v11[3] = &unk_189F0BC60;
  v11[4] = self;
  dispatch_source_set_cancel_handler(v8, v11);
  v9 = -[SocketRemoteXpcProxy peer](self, "peer");
  xpc_remote_connection_activate();

  -[SocketRemoteXpcProxy proxyServer](self, "proxyServer");
  v10 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
  dispatch_activate(v10);
}

void __32__SocketRemoteXpcProxy_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (MEMORY[0x186E3F8BC]() == MEMORY[0x1895F9268])
  {
    v10 = (os_log_s *)rsd_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138543362;
      size_t v12 = (size_t)v3;
      _os_log_impl(&dword_18696D000, v10, OS_LOG_TYPE_INFO, "RemoteXPC error: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) cancel];
  }

  else
  {
    xpc_dictionary_get_value(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    size_t length = xpc_data_get_length(v4);
    uint64_t v6 = (os_log_s *)rsd_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      size_t v12 = length;
      _os_log_impl( &dword_18696D000,  v6,  OS_LOG_TYPE_INFO,  "Proxying %zu bytes from RemoteXPC to socket",  (uint8_t *)&v11,  0xCu);
    }

    [*(id *)(a1 + 32) proxyServer];
    v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    int handle = dispatch_source_get_handle(v7);
    bytes_ptr = xpc_data_get_bytes_ptr(v4);
    write(handle, bytes_ptr, length);
  }
}

void __32__SocketRemoteXpcProxy_activate__block_invoke_5(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v2 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) proxyServer];
  id v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  int handle = dispatch_source_get_handle(v3);

  [*v2 proxyServer];
  v5 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  size_t v6 = dispatch_source_get_data(v5) + 1;

  v7 = malloc(v6);
  ssize_t v8 = read(handle, v7, v6);
  v9 = (os_log_s *)rsd_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      int v13 = 134217984;
      ssize_t v14 = v8;
      _os_log_impl( &dword_18696D000,  v9,  OS_LOG_TYPE_INFO,  "Proxying %zu bytes from socket over RemoteXPC",  (uint8_t *)&v13,  0xCu);
    }

    empty = (dispatch_source_s *)xpc_dictionary_create_empty();
    xpc_dictionary_set_data(empty, "data", v7, v8);
    [*(id *)(a1 + 32) peer];
    size_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_remote_connection_send_message();
  }

  else
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_18696D000, v9, OS_LOG_TYPE_INFO, "Client closed their socket", (uint8_t *)&v13, 2u);
    }

    [*(id *)(a1 + 32) proxyServer];
    empty = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(empty);
  }

  free(v7);
}

void __32__SocketRemoteXpcProxy_activate__block_invoke_7(uint64_t a1)
{
  v2 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  int handle = dispatch_source_get_handle(v2);

  [*(id *)(a1 + 32) cancel];
  close(handle);
  if (([*(id *)(a1 + 32) proxyClient] & 0x80000000) == 0)
  {
    close([*(id *)(a1 + 32) proxyClient]);
    *(_DWORD *)(*(void *)(a1 + 32) + 8LL) = -1;
  }

  [*(id *)(a1 + 32) onCancel];
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (os_log_s *)rsd_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18696D000, v5, OS_LOG_TYPE_INFO, "Cancel socket proxy", v7, 2u);
    }

    [*(id *)(a1 + 32) onCancel];
    size_t v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v6[2]();

    [*(id *)(a1 + 32) setOnCancel:0];
  }

- (int)takeOwnershipOfClientSocket
{
  int result = -[SocketRemoteXpcProxy proxyClient](self, "proxyClient");
  self->_proxyClient = -1;
  return result;
}

- (void)cancel
{
  id v3 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue();
  dispatch_source_cancel(v3);
  v4 = -[SocketRemoteXpcProxy peer](self, "peer");
  xpc_remote_connection_send_barrier();
}

void __30__SocketRemoteXpcProxy_cancel__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  xpc_remote_connection_cancel();
}

- (OS_xpc_remote_connection)peer
{
  return self->_peer;
}

- (int)proxyClient
{
  return self->_proxyClient;
}

- (OS_dispatch_source)proxyServer
{
  return self->_proxyServer;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)onCancel
{
  return self->_onCancel;
}

- (void)setOnCancel:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithSocket:device:queue:server:.cold.1()
{
}

- (void)initWithSocket:(os_log_s *)a1 device:queue:server:.cold.2(os_log_s *a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_14();
  _os_log_error_impl(&dword_18696D000, a1, OS_LOG_TYPE_ERROR, "creating socket pair failed: %s", v3, 0xCu);
}

@end