@interface SecuritydXPCClient
+ (void)configureSecuritydXPCProtocol:(id)a3;
- (NSXPCConnection)connection;
- (SecuritydXPCClient)init;
- (id)initTargetingSession:(int)a3;
- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation SecuritydXPCClient

- (SecuritydXPCClient)init
{
  return (SecuritydXPCClient *)-[SecuritydXPCClient initTargetingSession:](self, "initTargetingSession:", 1LL);
}

- (id)initTargetingSession:(int)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SecuritydXPCClient;
  v4 = -[SecuritydXPCClient init](&v19, sel_init);
  if (!v4)
  {
LABEL_13:
    v12 = v4;
    goto LABEL_14;
  }

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C541210];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.securityd.general" options:0];
  -[SecuritydXPCClient setConnection:](v4, "setConnection:", v6);
  v7 = -[SecuritydXPCClient connection](v4, "connection");
  if (v7)
  {
    v8 = -[SecuritydXPCClient connection](v4, "connection");
    [v8 setRemoteObjectInterface:v5];
    v9 = -[SecuritydXPCClient connection](v4, "connection");
    [v9 remoteObjectInterface];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SecuritydXPCClient configureSecuritydXPCProtocol:]( &OBJC_CLASS___SecuritydXPCClient,  "configureSecuritydXPCProtocol:",  v10);

    if (!a3)
    {
      secLogObjForScope("SecuritydXPCClient");
      v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1804F4000, v11, OS_LOG_TYPE_DEBUG, "Possibly targeting foreground session", buf, 2u);
      }

      if (xpc_user_sessions_enabled())
      {
        int foreground_uid = xpc_user_sessions_get_foreground_uid();
        secLogObjForScope("SecuritydXPCClient");
        v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          int v21 = foreground_uid;
          _os_log_debug_impl( &dword_1804F4000,  v14,  OS_LOG_TYPE_DEBUG,  "Targeting foreground session for uid %d",  buf,  8u);
        }
        v15 = -[SecuritydXPCClient connection](v4, "connection");
        [v15 _xpcConnection];
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        xpc_connection_set_target_user_session_uid();
      }
    }
    v17 = -[SecuritydXPCClient connection](v4, "connection");
    [v17 resume];

    goto LABEL_13;
  }

  v12 = 0LL;
LABEL_14:

  return v12;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SecuritydXPCClient;
  -[SecuritydXPCClient dealloc](&v4, sel_dealloc);
}

- (id)protocolWithSync:(BOOL)a3 errorHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = -[SecuritydXPCClient connection](self, "connection");
  v8 = v7;
  if (v4) {
    [v7 synchronousRemoteObjectProxyWithErrorHandler:v6];
  }
  else {
    [v7 remoteObjectProxyWithErrorHandler:v6];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (void)configureSecuritydXPCProtocol:(id)a3
{
  v21[2] = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C5386D8];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 setInterface:v4 forSelector:sel_SecItemAddAndNotifyOnSync_syncCallback_complete_ argumentIndex:1 ofReply:0];
  v5 = +[SecXPCHelper safeErrorClasses](&OBJC_CLASS___SecXPCHelper, "safeErrorClasses");
  id v6 = (void *)MEMORY[0x189604010];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v21 count:2];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setWithArray:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x189604010];
  v20[0] = objc_opt_class();
  v20[1] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v20 count:2];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setWithArray:v10];
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x189604010];
  v19[0] = objc_opt_class();
  v19[1] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v19 count:2];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setWithArray:v13];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x189604010];
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setWithArray:v16];
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 setClasses:v5 forSelector:sel_callCallback_error_ argumentIndex:1 ofReply:0];
  [v3 setClasses:v5 forSelector:sel_SecItemAddAndNotifyOnSync_syncCallback_complete_ argumentIndex:2 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemSetCurrentItemAcrossAllDevices_newCurrentItemHash_accessGroup_identifier_viewHint_oldCurrentItemReference_oldCurrentItemHash_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemUnsetCurrentItemsAcrossAllDevices_identifiers_viewHint_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemFetchCurrentItemAcrossAllDevices_identifier_viewHint_fetchCloudValue_complete_ argumentIndex:2 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemDigest_accessGroup_complete_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secKeychainDeleteMultiuser_complete_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v8 forSelector:sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v11 forSelector:sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemFetchCurrentItemOutOfBand_forceFetch_complete_ argumentIndex:1 ofReply:1];
  [v3 setClasses:v14 forSelector:sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:0];
  [v3 setClasses:v17 forSelector:sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_ argumentIndex:0 ofReply:1];
  [v3 setClasses:v5 forSelector:sel_secItemFetchPCSIdentityByKeyOutOfBand_forceFetch_complete_ argumentIndex:1 ofReply:1];
}

@end