@interface IOSurfaceRemoteServer
- (IOSurfaceRemoteServer)initWithListener:(id)a3 options:(id)a4;
- (NSMutableArray)clients;
- (OS_dispatch_queue)queue;
- (OS_xpc_object)listener;
- (void)_handleClientConnection:(id)a3;
- (void)_handleClientDisconnected:(id)a3;
- (void)dealloc;
- (void)setClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setQueue:(id)a3;
- (void)shutdown;
@end

@implementation IOSurfaceRemoteServer

- (IOSurfaceRemoteServer)initWithListener:(id)a3 options:(id)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v6 = (_xpc_connection_s *)a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___IOSurfaceRemoteServer;
  v8 = -[IOSurfaceRemoteServer init](&v16, sel_init);
  -[IOSurfaceRemoteServer setListener:](v8, "setListener:", v6);
  v9 = (void *)objc_opt_new();
  -[IOSurfaceRemoteServer setClients:](v8, "setClients:", v9);

  dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INTERACTIVE, 0);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  v11 = dispatch_queue_create("com.apple.IOSurfaceRemoteServer", v10);
  -[IOSurfaceRemoteServer setQueue:](v8, "setQueue:", v11);
  objc_initWeak(&location, v8);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __50__IOSurfaceRemoteServer_initWithListener_options___block_invoke;
  handler[3] = &unk_189B5D508;
  objc_copyWeak(&v14, &location);
  xpc_connection_set_event_handler(v6, handler);
  xpc_connection_set_target_queue(v6, v11);
  xpc_connection_activate(v6);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __50__IOSurfaceRemoteServer_initWithListener_options___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (MEMORY[0x186E086B8](v5) == MEMORY[0x1895F9238])
  {
    [WeakRetained _handleClientConnection:v5];
  }

  else if (v5 == (id)MEMORY[0x1895F91A0])
  {
    [WeakRetained clients];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 removeAllObjects];
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  -[IOSurfaceRemoteServer listener](self, "listener");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IOSurfaceRemoteServer;
  -[IOSurfaceRemoteServer dealloc](&v4, sel_dealloc);
}

- (void)shutdown
{
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v2);
}

- (void)_handleClientConnection:(id)a3
{
  location[1] = *(id *)MEMORY[0x1895F89C0];
  objc_super v4 = (_xpc_connection_s *)a3;
  xpc_connection_get_pid(v4);
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[IOSurfaceRemoteServer _handleClientConnection:].cold.1();
  }
  objc_initWeak(location, self);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___IOSurfaceRemoteRemoteClient);
  v6 = -[IOSurfaceRemoteServer queue](self, "queue");
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __49__IOSurfaceRemoteServer__handleClientConnection___block_invoke;
  v10[3] = &unk_189B5D530;
  objc_copyWeak(&v11, location);
  id v7 = -[IOSurfaceRemoteRemoteClient initWithRemoteConnection:disconnectedQueue:disconnectedHandler:]( v5,  "initWithRemoteConnection:disconnectedQueue:disconnectedHandler:",  v4,  v6,  v10);

  -[IOSurfaceRemoteServer queue](self, "queue");
  v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);
  v9 = -[IOSurfaceRemoteServer clients](self, "clients");
  [v9 addObject:v7];

  objc_destroyWeak(&v11);
  objc_destroyWeak(location);
}

void __49__IOSurfaceRemoteServer__handleClientConnection___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleClientDisconnected:v3];
}

- (void)_handleClientDisconnected:(id)a3
{
  id v4 = a3;
  [v4 pid];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[IOSurfaceRemoteServer _handleClientDisconnected:].cold.1();
  }
  -[IOSurfaceRemoteServer queue](self, "queue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  v6 = -[IOSurfaceRemoteServer clients](self, "clients");
  [v6 removeObject:v4];
}

- (OS_xpc_object)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_handleClientConnection:.cold.1()
{
  OUTLINED_FUNCTION_0_0(&dword_1811BB000, MEMORY[0x1895F8DA0], v0, "Client connected pid=%d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

- (void)_handleClientDisconnected:.cold.1()
{
  OUTLINED_FUNCTION_0_0(&dword_1811BB000, MEMORY[0x1895F8DA0], v0, "Client disconnected pid=%d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end