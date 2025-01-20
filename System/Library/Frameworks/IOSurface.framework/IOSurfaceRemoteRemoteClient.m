@interface IOSurfaceRemoteRemoteClient
- (BOOL)_removeSurface:(unsigned int)a3;
- (IOSurfaceRemoteRemoteClient)initWithRemoteConnection:(id)a3 disconnectedQueue:(id)a4 disconnectedHandler:(id)a5;
- (NSMutableDictionary)surfaceStates;
- (OS_dispatch_queue)disconnectedQueue;
- (OS_xpc_object)remoteConnection;
- (__IOSurfaceClient)_getClient:(unsigned int)a3 inboundExtradata:(id)a4 outboundExtraData:(id *)a5;
- (id)description;
- (id)disconnectedHandler;
- (int)pid;
- (void)_addSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6;
- (void)_handleError:(id)a3;
- (void)_handleMessage:(id)a3;
- (void)dealloc;
- (void)setDisconnectedHandler:(id)a3;
- (void)setDisconnectedQueue:(id)a3;
- (void)setPid:(int)a3;
- (void)setRemoteConnection:(id)a3;
- (void)setSurfaceStates:(id)a3;
@end

@implementation IOSurfaceRemoteRemoteClient

- (IOSurfaceRemoteRemoteClient)initWithRemoteConnection:(id)a3 disconnectedQueue:(id)a4 disconnectedHandler:(id)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  v8 = (_xpc_connection_s *)a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___IOSurfaceRemoteRemoteClient;
  v11 = -[IOSurfaceRemoteRemoteClient init](&v17, sel_init);
  v12 = (void *)objc_opt_new();
  -[IOSurfaceRemoteRemoteClient setSurfaceStates:](v11, "setSurfaceStates:", v12);

  -[IOSurfaceRemoteRemoteClient setDisconnectedQueue:](v11, "setDisconnectedQueue:", v9);
  -[IOSurfaceRemoteRemoteClient setDisconnectedHandler:](v11, "setDisconnectedHandler:", v10);
  -[IOSurfaceRemoteRemoteClient setRemoteConnection:](v11, "setRemoteConnection:", v8);
  -[IOSurfaceRemoteRemoteClient setPid:](v11, "setPid:", xpc_connection_get_pid(v8));
  objc_initWeak(&location, v11);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __94__IOSurfaceRemoteRemoteClient_initWithRemoteConnection_disconnectedQueue_disconnectedHandler___block_invoke;
  handler[3] = &unk_189B5D508;
  objc_copyWeak(&v15, &location);
  xpc_connection_set_event_handler(v8, handler);
  xpc_connection_activate(v8);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v11;
}

void __94__IOSurfaceRemoteRemoteClient_initWithRemoteConnection_disconnectedQueue_disconnectedHandler___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MEMORY[0x186E086B8](v4) == MEMORY[0x1895F9268]) {
      [WeakRetained _handleError:v4];
    }
    else {
      [WeakRetained _handleMessage:v4];
    }
  }
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  -[IOSurfaceRemoteRemoteClient remoteConnection](self, "remoteConnection");
  v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_cancel(v3);

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___IOSurfaceRemoteRemoteClient;
  -[IOSurfaceRemoteRemoteClient dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"IOSurfaceRemoteRemoteClient { remote_pid=%d }",  -[IOSurfaceRemoteRemoteClient pid](self, "pid"));
}

- (void)_handleError:(id)a3
{
  v5[5] = *MEMORY[0x1895F89C0];
  -[IOSurfaceRemoteRemoteClient disconnectedQueue](self, "disconnectedQueue", a3);
  objc_super v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __44__IOSurfaceRemoteRemoteClient__handleError___block_invoke;
  v5[3] = &unk_189B5D5A0;
  v5[4] = self;
  dispatch_async(v4, v5);
}

void __44__IOSurfaceRemoteRemoteClient__handleError___block_invoke(uint64_t a1)
{
  v2 = (void (**)(id, void))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(void *)(a1 + 32));
}

- (void)_addSurface:(__IOSurfaceClient *)a3 mappedAddress:(void *)a4 mappedSize:(unint64_t)a5 extraData:(id)a6
{
  id v10 = a6;
  ID = (const char *)IOSurfaceClientGetID((uint64_t)a3);
  [MEMORY[0x189607968] numberWithUnsignedInt:ID];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
  [v13 objectForKeyedSubscript:v12];
  v14 = (IOSurfaceRemotePerSurfacePerClientState *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[IOSurfaceRemotePerSurfacePerClientState addClientReferenceToSurfaceWithExtraData:]( v14,  "addClientReferenceToSurfaceWithExtraData:",  v10);
  }

  else
  {
    v14 = -[IOSurfaceRemotePerSurfacePerClientState initWithSurface:mappedAddress:mappedSize:extraData:]( objc_alloc(&OBJC_CLASS___IOSurfaceRemotePerSurfacePerClientState),  "initWithSurface:mappedAddress:mappedSize:extraData:",  a3,  a4,  a5,  v10);
    -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setObject:v14 forKeyedSubscript:v12];
  }

  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
    -[IOSurfaceRemoteRemoteClient _addSurface:mappedAddress:mappedSize:extraData:].cold.1(self, ID);
  }
}

- (BOOL)_removeSurface:(unsigned int)a3
{
  v3 = *(const char **)&a3;
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
  [v6 objectForKeyedSubscript:v5];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ([v7 removeClientReferenceToSurface])
    {
      v8 = -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
      [v8 setObject:0 forKeyedSubscript:v5];
    }

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG)) {
      -[IOSurfaceRemoteRemoteClient _removeSurface:].cold.1(self, v3);
    }
  }

  return v7 != 0LL;
}

- (__IOSurfaceClient)_getClient:(unsigned int)a3 inboundExtradata:(id)a4 outboundExtraData:(id *)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  [MEMORY[0x189607968] numberWithUnsignedInt:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IOSurfaceRemoteRemoteClient surfaceStates](self, "surfaceStates");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v9];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:"-[IOSurfaceRemoteRemoteClient _getClient:inboundExtradata:outboundExtraData:]"];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInFunction:v15 file:@"IOSurfaceRemoteServer.m" lineNumber:384 description:@"BUG: Missing state?!?"];
  }

  [v11 mergeExtraData:v8];
  *a5 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (__IOSurfaceClient *)[v11 surface];

  return v12;
}

- (void)_handleMessage:(id)a3
{
  v19[1] = *(id *)MEMORY[0x1895F89C0];
  id v4 = a3;
  xpc_object_t reply = xpc_dictionary_create_reply(v4);
  uint64_t v6 = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)v6;
  if (reply && v6)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(v4, "Method");
    BOOL v9 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEBUG);
    if (uint64 < 0x1B)
    {
      if (v9) {
        -[IOSurfaceRemoteRemoteClient _handleMessage:].cold.2(uint64, self);
      }
      v12 = _handleMessage__method_dispatch[uint64];
      if (uint64 > 2)
      {
        int v13 = -536870160;
        uint64_t v14 = xpc_dictionary_get_uint64(v4, "SurfaceID");
        uint64_t v15 = v14;
        if (uint64 == 3)
        {
          if (-[IOSurfaceRemoteRemoteClient _removeSurface:](self, "_removeSurface:", v14)) {
            int v13 = 0;
          }
          else {
            int v13 = -536870160;
          }
        }

        else
        {
          xpc_dictionary_set_uint64(reply, "SurfaceID", v14);
          xpc_dictionary_get_value(v4, "ExtraData");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = 0LL;
          objc_super v17 = -[IOSurfaceRemoteRemoteClient _getClient:inboundExtradata:outboundExtraData:]( self,  "_getClient:inboundExtradata:outboundExtraData:",  v15,  v16,  v19);
          id v18 = v19[0];

          if (v17)
          {
            int v13 = ((uint64_t (*)(IOSurfaceRemoteRemoteClient *, __IOSurfaceClient *, id, xpc_object_t))v12)( self,  v17,  v4,  reply);
            _ioSurfaceAddClientState((uint64_t)v17, v15, reply);
            if (v18) {
              xpc_dictionary_set_value(reply, "ExtraData", v18);
            }
          }
        }
      }

      else
      {
        int v13 = ((uint64_t (*)(IOSurfaceRemoteRemoteClient *, id, xpc_object_t))v12)(self, v4, reply);
      }

      uint64_t v11 = v13;
      id v10 = reply;
    }

    else
    {
      if (v9) {
        -[IOSurfaceRemoteRemoteClient _handleMessage:].cold.1(self, (const char *)uint64);
      }
      id v10 = reply;
      uint64_t v11 = -536870201LL;
    }

    xpc_dictionary_set_uint64(v10, "ErrorCode", v11);
    xpc_connection_send_message(v7, reply);
  }
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (NSMutableDictionary)surfaceStates
{
  return self->_surfaceStates;
}

- (void)setSurfaceStates:(id)a3
{
}

- (OS_xpc_object)remoteConnection
{
  return self->_remoteConnection;
}

- (void)setRemoteConnection:(id)a3
{
}

- (OS_dispatch_queue)disconnectedQueue
{
  return self->_disconnectedQueue;
}

- (void)setDisconnectedQueue:(id)a3
{
}

- (id)disconnectedHandler
{
  return self->_disconnectedHandler;
}

- (void)setDisconnectedHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_addSurface:(void *)a1 mappedAddress:(const char *)a2 mappedSize:extraData:.cold.1( void *a1,  const char *a2)
{
  OUTLINED_FUNCTION_3_0( &dword_1811BB000,  MEMORY[0x1895F8DA0],  v2,  "Surface %d created by client pid=%d",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeSurface:(void *)a1 .cold.1(void *a1, const char *a2)
{
  OUTLINED_FUNCTION_3_0( &dword_1811BB000,  MEMORY[0x1895F8DA0],  v2,  "Surface %d released by client pid=%d",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleMessage:(void *)a1 .cold.1(void *a1, const char *a2)
{
  int v2 = 134218240;
  uint64_t v3 = a2;
  __int16 v4 = 1024;
  int v5 = OUTLINED_FUNCTION_6(a1, a2);
  _os_log_debug_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Received unknown client method %lu from client %d",  (uint8_t *)&v2,  0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_handleMessage:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v2 = _handleMessage__method_name[a1];
  int v3 = 134218498;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = v2;
  __int16 v7 = 1024;
  int v8 = [a2 pid];
  _os_log_debug_impl( &dword_1811BB000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEBUG,  "Received client method %lu (%s) from client %d",  (uint8_t *)&v3,  0x1Cu);
}

@end