@interface PPSClientRegistrationHelper
- (BOOL)permissionsForSubsystem:(id)a3 category:(id)a4;
- (NSXPCConnection)connectionToServer;
- (id)createXPCConnection;
- (void)closeXPCConnection;
- (void)setConnectionToServer:(id)a3;
@end

@implementation PPSClientRegistrationHelper

- (BOOL)permissionsForSubsystem:(id)a3 category:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((os_variant_is_darwinos() & 1) != 0)
  {
    BOOL v8 = 0;
  }

  else
  {
    v9 = -[PPSClientRegistrationHelper createXPCConnection](self, "createXPCConnection");
    uint64_t v12 = 0LL;
    v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __64__PPSClientRegistrationHelper_permissionsForSubsystem_category___block_invoke;
    v11[3] = &unk_189E9E940;
    v11[4] = &v12;
    [v9 checkPermissionForSubsystem:v6 category:v7 withReply:v11];
    -[PPSClientRegistrationHelper closeXPCConnection](self, "closeXPCConnection");
    BOOL v8 = *((_BYTE *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }

  return v8;
}

uint64_t __64__PPSClientRegistrationHelper_permissionsForSubsystem_category___block_invoke( uint64_t result,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (id)createXPCConnection
{
  v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.PerfPowerTelemetryClientRegistrationService"];
  connectionToServer = self->_connectionToServer;
  self->_connectionToServer = v3;

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C693D98];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_connectionToServer, "setRemoteObjectInterface:", v5);

  -[NSXPCConnection setInterruptionHandler:]( self->_connectionToServer,  "setInterruptionHandler:",  &__block_literal_global_0);
  -[NSXPCConnection setInvalidationHandler:]( self->_connectionToServer,  "setInvalidationHandler:",  &__block_literal_global_7);
  -[NSXPCConnection resume](self->_connectionToServer, "resume");
  logHandle();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v8 = 0;
    _os_log_impl(&dword_186654000, v6, OS_LOG_TYPE_INFO, "Spinning up XPC service", v8, 2u);
  }

  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( self->_connectionToServer,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_10);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke()
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_cold_1(v0);
  }
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_6()
{
  v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl( &dword_186654000,  v0,  OS_LOG_TYPE_INFO,  "Client Permission check completed. Invalidating XPC Connection.",  v1,  2u);
  }
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  logHandle();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_8_cold_1(v2, v3);
  }
}

- (void)closeXPCConnection
{
}

- (NSXPCConnection)connectionToServer
{
  return self->_connectionToServer;
}

- (void)setConnectionToServer:(id)a3
{
}

- (void).cxx_destruct
{
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_186654000, log, OS_LOG_TYPE_ERROR, "Connection was interrupted.", v1, 2u);
}

void __50__PPSClientRegistrationHelper_createXPCConnection__block_invoke_8_cold_1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 description];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_186654000, a2, OS_LOG_TYPE_ERROR, "Connection error: %@", (uint8_t *)&v4, 0xCu);
}

@end