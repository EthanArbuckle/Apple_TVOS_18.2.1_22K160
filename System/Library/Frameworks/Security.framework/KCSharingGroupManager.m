@interface KCSharingGroupManager
+ (id)sharedInstance;
- (KCSharingDaemonConnection)daemonConnection;
- (KCSharingGroupManager)initWithDaemonConnection:(id)a3;
- (NSString)cachedCurrentUserIdentifier;
- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)accountChanged;
- (void)addSubscriber:(id)a3;
- (void)checkAvailabilityForHandle:(id)a3 completion:(id)a4;
- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4;
- (void)createGroupWithRequest:(id)a3 completion:(id)a4;
- (void)declineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4;
- (void)fetchCurrentUserIdentifierWithReply:(id)a3;
- (void)getGroupByGroupID:(id)a3 completion:(id)a4;
- (void)getGroupsWithRequest:(id)a3 completion:(id)a4;
- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)provisionWithReply:(id)a3;
- (void)removeSubscriber:(id)a3;
- (void)resyncWithCompletion:(id)a3;
- (void)setCachedCurrentUserIdentifier:(id)a3;
- (void)setDaemonConnection:(id)a3;
- (void)updateGroupWithRequest:(id)a3 completion:(id)a4;
- (void)verifyGroupsInSyncWithCompletion:(id)a3;
@end

@implementation KCSharingGroupManager

- (KCSharingGroupManager)initWithDaemonConnection:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___KCSharingGroupManager;
  v6 = -[KCSharingGroupManager init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_daemonConnection, a3);
    cachedCurrentUserIdentifier = v7->_cachedCurrentUserIdentifier;
    v7->_cachedCurrentUserIdentifier = 0LL;

    [v5 addConnectionListener:v7];
  }

  return v7;
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 getGroupByGroupID:v7 completion:v6];
}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 getGroupsWithRequest:v7 completion:v6];
}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 createGroupWithRequest:v7 completion:v6];
}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 updateGroupWithRequest:v7 completion:v6];
}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 leaveGroupWithRequest:v7 completion:v6];
}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 deleteGroupWithRequest:v7 completion:v6];
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 acceptInviteForGroupID:v7 completion:v6];
}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 declineInviteForGroupID:v7 completion:v6];
}

- (void)checkAvailabilityForHandle:(id)a3 completion:(id)a4
{
  v14[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v14[0] = v6;
  [MEMORY[0x189603F18] arrayWithObjects:v14 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __63__KCSharingGroupManager_checkAvailabilityForHandle_completion___block_invoke;
  v11[3] = &unk_1896671C8;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  -[KCSharingGroupManager checkAvailabilityForHandles:completion:]( self,  "checkAvailabilityForHandles:completion:",  v8,  v11);
}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 checkAvailabilityForHandles:v7 completion:v6];
}

- (void)addSubscriber:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addConnectionListener:v4];
}

- (void)removeSubscriber:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 removeConnectionListener:v4];
}

- (void)provisionWithReply:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 provisionWithReply:v4];
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  id v4 = (void (**)(id, void *, void))a3;
  -[KCSharingGroupManager cachedCurrentUserIdentifier](self, "cachedCurrentUserIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[KCSharingGroupManager cachedCurrentUserIdentifier](self, "cachedCurrentUserIdentifier");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6, 0LL);
  }

  else
  {
    -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __61__KCSharingGroupManager_fetchCurrentUserIdentifierWithReply___block_invoke;
    v8[3] = &unk_1896671F0;
    v8[4] = self;
    id v9 = v4;
    [v7 fetchCurrentUserIdentifierWithReply:v8];
  }
}

- (void)resyncWithCompletion:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 resyncWithCompletion:v4];
}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 verifyGroupsInSyncWithCompletion:v4];
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4 = a3;
  -[KCSharingGroupManager daemonConnection](self, "daemonConnection");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 performMaintenanceWithCompletion:v4];
}

- (void)accountChanged
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  KCSharingLogObject(@"KCSharingGroupManager");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[KCSharingGroupManager cachedCurrentUserIdentifier](self, "cachedCurrentUserIdentifier");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138543362;
    id v6 = v4;
    _os_log_impl( &dword_1804F4000,  v3,  OS_LOG_TYPE_DEFAULT,  "Received accountChanged notification, invalidating cached current user identifier: %{public}@",  (uint8_t *)&v5,  0xCu);
  }

  -[KCSharingGroupManager setCachedCurrentUserIdentifier:](self, "setCachedCurrentUserIdentifier:", 0LL);
}

- (KCSharingDaemonConnection)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
}

- (NSString)cachedCurrentUserIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCachedCurrentUserIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

void __61__KCSharingGroupManager_fetchCurrentUserIdentifierWithReply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  KCSharingLogObject(@"KCSharingGroupManager");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138543362;
      id v10 = v5;
      _os_log_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_INFO,  "Fetched current user identifier: %{public}@",  (uint8_t *)&v9,  0xCu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = v6;
    _os_log_error_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to fetch current user identifier: %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  [*(id *)(a1 + 32) setCachedCurrentUserIdentifier:v5];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __63__KCSharingGroupManager_checkAvailabilityForHandle_completion___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = a3;
  [a2 objectForKeyedSubscript:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 BOOLValue];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_3405);
  }
  return (id)sharedInstance_instance;
}

void __39__KCSharingGroupManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___KCSharingGroupManager);
  +[KCSharingDaemonConnection sharedInstance](&OBJC_CLASS___KCSharingDaemonConnection, "sharedInstance");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = -[KCSharingGroupManager initWithDaemonConnection:](v0, "initWithDaemonConnection:", v3);
  v2 = (void *)sharedInstance_instance;
  sharedInstance_instance = v1;
}

@end