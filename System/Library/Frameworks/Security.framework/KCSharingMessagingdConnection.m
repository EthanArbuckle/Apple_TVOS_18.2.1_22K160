@interface KCSharingMessagingdConnection
+ (id)sharedInstance;
- (KCSharingMessagingdConnection)init;
- (KCSharingMessagingdConnection)initWithConnection:(id)a3 interface:(id)a4 queue:(id)a5;
- (NSXPCConnection)connection;
- (void)cancelPendingInvitesForGroup:(id)a3 participantHandles:(id)a4 completion:(id)a5;
- (void)connectionWasInterrupted;
- (void)connectionWasInvalidated;
- (void)dealloc;
- (void)didAcceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)didDeclineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4;
- (void)fetchReceivedInvitesWithCompletion:(id)a3;
- (void)sendNewInvitesForGroup:(id)a3 completion:(id)a4;
- (void)setConnection:(id)a3;
@end

@implementation KCSharingMessagingdConnection

- (KCSharingMessagingdConnection)init
{
  v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_DEFAULT, -1);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v5 = dispatch_queue_create("com.apple.KCSharingMessagingdConnection.xpcConnection", v4);
  v6 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.keychainsharingmessagingd" options:0];
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C53ABF0];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  KCSharingSetupMessagingdServerProtocol(v7);
  objc_claimAutoreleasedReturnValue();

  v8 = -[KCSharingMessagingdConnection initWithConnection:interface:queue:]( self,  "initWithConnection:interface:queue:",  v6,  v7,  v5);
  return v8;
}

- (KCSharingMessagingdConnection)initWithConnection:(id)a3 interface:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___KCSharingMessagingdConnection;
  v12 = -[KCSharingMessagingdConnection init](&v21, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v13);
    [v9 setRemoteObjectInterface:v10];
    uint64_t v14 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke;
    v18[3] = &unk_189672C00;
    objc_copyWeak(&v19, &location);
    [v9 setInterruptionHandler:v18];
    v16[0] = v14;
    v16[1] = 3221225472LL;
    v16[2] = __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke_2;
    v16[3] = &unk_189672C00;
    objc_copyWeak(&v17, &location);
    [v9 setInvalidationHandler:v16];
    [v9 _setQueue:v11];
    [v9 resume];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)connectionWasInterrupted
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  KCSharingLogObject(@"KCSharingMessagingdConnection");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[KCSharingMessagingdConnection connection](self, "connection");
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1804F4000, v3, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)connectionWasInvalidated
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  KCSharingLogObject(@"KCSharingMessagingdConnection");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = -[KCSharingMessagingdConnection connection](self, "connection");
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1804F4000, v3, OS_LOG_TYPE_INFO, "connection invalidated %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___KCSharingMessagingdConnection;
  -[KCSharingMessagingdConnection dealloc](&v3, sel_dealloc);
}

- (void)sendNewInvitesForGroup:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksmd/client/sendNewInvitesForGroup",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __67__KCSharingMessagingdConnection_sendNewInvitesForGroup_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 sendNewInvitesForGroup:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)cancelPendingInvitesForGroup:(id)a3 participantHandles:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _os_activity_create( &dword_1804F4000,  "ksmd/client/cancelPendingInvitesForGroup",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v11, &state);
  v12 = -[KCSharingMessagingdConnection connection](self, "connection");
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __92__KCSharingMessagingdConnection_cancelPendingInvitesForGroup_participantHandles_completion___block_invoke;
  v15[3] = &unk_189670540;
  id v13 = v10;
  id v16 = v13;
  [v12 remoteObjectProxyWithErrorHandler:v15];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 cancelPendingInvitesForGroup:v8 participantHandles:v9 completion:v13];

  os_activity_scope_leave(&state);
}

- (void)didAcceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( &dword_1804F4000,  "ksmd/client/didAcceptInviteForGroupID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __70__KCSharingMessagingdConnection_didAcceptInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 didAcceptInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)didDeclineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( &dword_1804F4000,  "ksmd/client/didDeclineInviteForGroupID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __71__KCSharingMessagingdConnection_didDeclineInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 didDeclineInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)fetchReceivedInviteWithGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create( &dword_1804F4000,  "ksmd/client/fetchReceivedInviteWithGroupID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __75__KCSharingMessagingdConnection_fetchReceivedInviteWithGroupID_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 fetchReceivedInviteWithGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)fetchReceivedInvitesWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksmd/client/fetchReceivedInvitesWithCompletion",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingMessagingdConnection connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __68__KCSharingMessagingdConnection_fetchReceivedInvitesWithCompletion___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 fetchReceivedInvitesWithCompletion:v7];

  os_activity_scope_leave(&state);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __68__KCSharingMessagingdConnection_fetchReceivedInvitesWithCompletion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __75__KCSharingMessagingdConnection_fetchReceivedInviteWithGroupID_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __71__KCSharingMessagingdConnection_didDeclineInviteForGroupID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __70__KCSharingMessagingdConnection_didAcceptInviteForGroupID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __92__KCSharingMessagingdConnection_cancelPendingInvitesForGroup_participantHandles_completion___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __67__KCSharingMessagingdConnection_sendNewInvitesForGroup_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInterrupted];
}

void __68__KCSharingMessagingdConnection_initWithConnection_interface_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInvalidated];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3841 != -1) {
    dispatch_once(&sharedInstance_onceToken_3841, &__block_literal_global_3842);
  }
  return (id)sharedInstance_connection_3843;
}

void __47__KCSharingMessagingdConnection_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___KCSharingMessagingdConnection);
  v1 = (void *)sharedInstance_connection_3843;
  sharedInstance_connection_3843 = (uint64_t)v0;
}

@end