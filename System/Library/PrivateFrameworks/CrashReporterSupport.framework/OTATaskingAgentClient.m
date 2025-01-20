@interface OTATaskingAgentClient
+ (id)sharedClient;
- (BOOL)deletePreference:(id)a3 forUser:(id)a4 inDomain:(id)a5;
- (BOOL)setPreference:(id)a3 forUser:(id)a4 inDomain:(id)a5 toValue:(void *)a6;
- (OTATaskingAgentClient)init;
- (id)awdKey;
- (id)crashreporterKey;
- (unsigned)uidForUser:(id)a3;
@end

@implementation OTATaskingAgentClient

+ (id)sharedClient
{
  if (sharedClient_onceToken != -1) {
    dispatch_once(&sharedClient_onceToken, &__block_literal_global_1);
  }
  return (id)sharedClient__sharedInstance;
}

void __37__OTATaskingAgentClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___OTATaskingAgentClient);
  v1 = (void *)sharedClient__sharedInstance;
  sharedClient__sharedInstance = (uint64_t)v0;
}

- (OTATaskingAgentClient)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___OTATaskingAgentClient;
  v2 = -[OTATaskingAgentClient init](&v9, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.OTATaskingAgent" options:4096];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C68DC08];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->_connection, "resume");
    uint64_t v6 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v2->_connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  &__block_literal_global_56);
    synchRemoteObjectProxy = v2->_synchRemoteObjectProxy;
    v2->_synchRemoteObjectProxy = (OTATaskingAgent *)v6;
  }

  return v2;
}

void __29__OTATaskingAgentClient_init__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = a2;
    _os_log_impl( &dword_186224000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Connection error to OTATaskingAgent. Error: %@",  (uint8_t *)&v3,  0xCu);
  }

- (BOOL)setPreference:(id)a3 forUser:(id)a4 inDomain:(id)a5 toValue:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  uint64_t v13 = -[OTATaskingAgentClient uidForUser:](self, "uidForUser:", v11);
  if ((_DWORD)v13)
  {
    synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __64__OTATaskingAgentClient_setPreference_forUser_inDomain_toValue___block_invoke;
    v17[3] = &unk_189E35A18;
    v17[4] = &v18;
    -[OTATaskingAgent setPreferenceForDomain:preference:value:UID:withReply:]( synchRemoteObjectProxy,  "setPreferenceForDomain:preference:value:UID:withReply:",  v12,  v10,  a6,  v13,  v17);
  }

  char v15 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);

  return v15;
}

uint64_t __64__OTATaskingAgentClient_setPreference_forUser_inDomain_toValue___block_invoke( uint64_t result,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (BOOL)deletePreference:(id)a3 forUser:(id)a4 inDomain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  uint64_t v11 = -[OTATaskingAgentClient uidForUser:](self, "uidForUser:", v9);
  if ((_DWORD)v11)
  {
    synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __59__OTATaskingAgentClient_deletePreference_forUser_inDomain___block_invoke;
    v15[3] = &unk_189E35A18;
    v15[4] = &v16;
    -[OTATaskingAgent deletePreferenceForDomain:preference:UID:withReply:]( synchRemoteObjectProxy,  "deletePreferenceForDomain:preference:UID:withReply:",  v10,  v8,  v11,  v15);
  }

  char v13 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);

  return v13;
}

uint64_t __59__OTATaskingAgentClient_deletePreference_forUser_inDomain___block_invoke( uint64_t result,  char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = a2;
  return result;
}

- (id)crashreporterKey
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__OTATaskingAgentClient_crashreporterKey__block_invoke;
  v7[3] = &unk_189E35A40;
  v7[4] = &v8;
  -[OTATaskingAgent crashreporterKeyWithReply:](synchRemoteObjectProxy, "crashreporterKeyWithReply:", v7);
  if ([(id)v9[5] isEqualToString:@"<no_entitlement>"])
  {
    int v3 = (void *)v9[5];
    v9[5] = 0LL;

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( &dword_186224000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error while retrieving crashreporterKey. Does this process have the entitlement - com.apple.osanalytics.otataski ng-service-access ?",  v6,  2u);
    }

    if (crashreporterKey_onceToken != -1) {
      dispatch_once(&crashreporterKey_onceToken, &__block_literal_global_62);
    }
  }

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke(uint64_t a1, void *a2)
{
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
  if (v0) {
    __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (id)awdKey
{
  uint64_t v8 = 0LL;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__0;
  id v12 = __Block_byref_object_dispose__0;
  id v13 = 0LL;
  synchRemoteObjectProxy = self->_synchRemoteObjectProxy;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __31__OTATaskingAgentClient_awdKey__block_invoke;
  v7[3] = &unk_189E35A40;
  v7[4] = &v8;
  -[OTATaskingAgent awdKeyWithReply:](synchRemoteObjectProxy, "awdKeyWithReply:", v7);
  if ([(id)v9[5] isEqualToString:@"<no_entitlement>"])
  {
    uint64_t v3 = (void *)v9[5];
    v9[5] = 0LL;

    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl( &dword_186224000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_DEFAULT,  "Error while retrieving awdKey. Does this process have the entitlement - com.apple.osanalytics.otatasking-service-access ?",  v6,  2u);
    }

    if (awdKey_onceToken != -1) {
      dispatch_once(&awdKey_onceToken, &__block_literal_global_64);
    }
  }

  id v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __31__OTATaskingAgentClient_awdKey__block_invoke(uint64_t a1, void *a2)
{
}

void __31__OTATaskingAgentClient_awdKey__block_invoke_63()
{
  BOOL v0 = os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_FAULT);
  if (v0) {
    __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (unsigned)uidForUser:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  uint64_t v4 = getpwnam((const char *)[v3 UTF8String]);
  if (v4)
  {
    unsigned int pw_uid = v4->pw_uid;
    if (!pw_uid && os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v7 = "Modifying defaults as root is not allowed, skipping request";
      uint32_t v8 = 2;
LABEL_7:
      _os_log_impl(&dword_186224000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v8);
      unsigned int pw_uid = 0;
    }
  }

  else
  {
    unsigned int pw_uid = 0;
    if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v3;
      uint64_t v6 = (os_log_s *)MEMORY[0x1895F8DA0];
      uint64_t v7 = "Unknown user '%@', skipping request";
      uint32_t v8 = 12;
      goto LABEL_7;
    }
  }

  return pw_uid;
}

- (void).cxx_destruct
{
}

void __41__OTATaskingAgentClient_crashreporterKey__block_invoke_61_cold_1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end