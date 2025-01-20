@interface TKTokenConfigurationConnection
- (TKTokenConfigurationConnection)initWithEndpoint:(id)a3;
- (id)configurationProtocol;
- (void)dealloc;
- (void)registerForConfigurationChange:(id)a3;
- (void)tokenConfigurationChanged:(id)a3;
@end

@implementation TKTokenConfigurationConnection

- (TKTokenConfigurationConnection)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TKTokenConfigurationConnection;
  v6 = -[TKTokenConfigurationConnection init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpoint, a3);
    uint64_t v8 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    configurationConnections = v7->_configurationConnections;
    v7->_configurationConnections = (NSHashTable *)v8;
  }

  return v7;
}

- (id)configurationProtocol
{
  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:self->_endpoint];
    id v5 = self->_connection;
    self->_connection = v4;
    v6 = +[TKTokenConfiguration interfaceForProtocol](&OBJC_CLASS___TKTokenConfiguration, "interfaceForProtocol");
    -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v6);
    v7 = +[TKTokenConfiguration interfaceForChangeProtocol](&OBJC_CLASS___TKTokenConfiguration, "interfaceForChangeProtocol");
    -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v7);

    uint64_t v8 = -[TKTokenConfigurationConnectionProxy initWithConnection:]( objc_alloc(&OBJC_CLASS___TKTokenConfigurationConnectionProxy),  "initWithConnection:",  self);
    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", v8);

    -[NSXPCConnection resume](self->_connection, "resume");
    connection = self->_connection;
  }

  return -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_4);
}

void __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  TK_LOG_tokencfg();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

- (void)registerForConfigurationChange:(id)a3
{
  id v5 = a3;
  v4 = self->_configurationConnections;
  objc_sync_enter(v4);
  -[NSHashTable addObject:](self->_configurationConnections, "addObject:", v5);
  objc_sync_exit(v4);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKTokenConfigurationConnection;
  -[TKTokenConfigurationConnection dealloc](&v3, sel_dealloc);
}

- (void)tokenConfigurationChanged:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = self->_configurationConnections;
  objc_sync_enter(v5);
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  v6 = self->_configurationConnections;
  uint64_t v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "tokenConfigurationChanged:", v4, (void)v10);
      }

      while (v7 != v9);
      uint64_t v7 = -[NSHashTable countByEnumeratingWithState:objects:count:]( v6,  "countByEnumeratingWithState:objects:count:",  &v10,  v14,  16LL);
    }

    while (v7);
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
}

void __55__TKTokenConfigurationConnection_configurationProtocol__block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "Failed to send configuration request: %{public}@",  (uint8_t *)&v2,  0xCu);
}

@end