@interface KCSharingDaemonConnection
+ (id)sharedInstance;
+ (id)sharedInvitationNotifier;
- (KCSharingDaemonConnection)initWithConnection:(id)a3 queue:(id)a4 type:(int64_t)a5;
- (KCSharingDaemonConnection)initWithType:(int64_t)a3;
- (NSHashTable)connectionListeners;
- (NSXPCConnection)connection;
- (int64_t)type;
- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4;
- (void)accountChanged;
- (void)addConnectionListener:(id)a3;
- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4;
- (void)connectionWasInterrupted;
- (void)connectionWasInvalidated;
- (void)createGroupWithRequest:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)declineInviteForGroupID:(id)a3 completion:(id)a4;
- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4;
- (void)fetchCurrentUserIdentifierWithReply:(id)a3;
- (void)fetchRemoteChangesWithReply:(id)a3;
- (void)getGroupByGroupID:(id)a3 completion:(id)a4;
- (void)getGroupsWithRequest:(id)a3 completion:(id)a4;
- (void)groupInvitationWasCancelled;
- (void)groupsUpdated;
- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4;
- (void)performMaintenanceWithCompletion:(id)a3;
- (void)provisionWithReply:(id)a3;
- (void)receivedGroupInvitation:(id)a3;
- (void)removeConnectionListener:(id)a3;
- (void)resyncWithCompletion:(id)a3;
- (void)saveLocalChangesWithReply:(id)a3;
- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setConnectionListeners:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateGroupWithRequest:(id)a3 completion:(id)a4;
- (void)verifyGroupsInSyncWithCompletion:(id)a3;
- (void)wipe:(BOOL)a3 reply:(id)a4;
@end

@implementation KCSharingDaemonConnection

- (KCSharingDaemonConnection)initWithType:(int64_t)a3
{
  v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_DEFAULT, -1);
  v6 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

  dispatch_queue_t v7 = dispatch_queue_create("com.apple.KCSharingDaemonConnection.xpcConnection", v6);
  v8 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.security.kcsharing" options:0];
  v9 = -[KCSharingDaemonConnection initWithConnection:queue:type:](self, "initWithConnection:queue:type:", v8, v7, a3);

  return v9;
}

- (KCSharingDaemonConnection)initWithConnection:(id)a3 queue:(id)a4 type:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___KCSharingDaemonConnection;
  v11 = -[KCSharingDaemonConnection init](&v23, sel_init);
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1896078B8] weakObjectsHashTable];
    connectionListeners = v11->_connectionListeners;
    v11->_connectionListeners = (NSHashTable *)v12;

    objc_storeStrong((id *)&v11->_connection, a3);
    v11->_type = a5;
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v11);
    if (a5 == 1)
    {
      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C538240];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      KCSharingSetupInvitationNotificationProtocol(v14);
      objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (a5)
      {
        v14 = 0LL;
        goto LABEL_8;
      }

      [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C5381A0];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      KCSharingSetupServerProtocol(v14);
      objc_claimAutoreleasedReturnValue();
    }

LABEL_8:
    [v9 setRemoteObjectInterface:v14];
    uint64_t v15 = MEMORY[0x1895F87A8];
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke;
    v20[3] = &unk_189672C00;
    objc_copyWeak(&v21, &location);
    [v9 setInterruptionHandler:v20];
    v18[0] = v15;
    v18[1] = 3221225472LL;
    v18[2] = __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke_2;
    v18[3] = &unk_189672C00;
    objc_copyWeak(&v19, &location);
    [v9 setInvalidationHandler:v18];
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C537EC8];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setExportedInterface:v16];

    [v9 setExportedObject:v11];
    [v9 _setQueue:v10];
    [v9 resume];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)addConnectionListener:(id)a3
{
  id v4 = a3;
  v5 = -[KCSharingDaemonConnection connection](self, "connection");
  [v5 _queue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __51__KCSharingDaemonConnection_addConnectionListener___block_invoke;
  v8[3] = &unk_189667490;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)removeConnectionListener:(id)a3
{
  id v4 = a3;
  v5 = -[KCSharingDaemonConnection connection](self, "connection");
  [v5 _queue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __54__KCSharingDaemonConnection_removeConnectionListener___block_invoke;
  v8[3] = &unk_189667490;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)connectionWasInterrupted
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  KCSharingLogObject(@"KCSharingDaemonConnection");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[KCSharingDaemonConnection connection](self, "connection");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1804F4000, v3, OS_LOG_TYPE_INFO, "connection interrupted %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)connectionWasInvalidated
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  KCSharingLogObject(@"KCSharingDaemonConnection");
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[KCSharingDaemonConnection connection](self, "connection");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1804F4000, v3, OS_LOG_TYPE_INFO, "connection invalidated %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KCSharingDaemonConnection;
  -[KCSharingDaemonConnection dealloc](&v4, sel_dealloc);
}

- (void)provisionWithReply:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/provisionWithReply",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  v6 = -[KCSharingDaemonConnection connection](self, "connection");
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __48__KCSharingDaemonConnection_provisionWithReply___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 provisionWithReply:v7];

  os_activity_scope_leave(&state);
}

- (void)setChangeTrackingEnabled:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create( &dword_1804F4000,  "ksd/client/setChangeTrackingEnabled",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  v8 = -[KCSharingDaemonConnection connection](self, "connection");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __60__KCSharingDaemonConnection_setChangeTrackingEnabled_reply___block_invoke;
  v11[3] = &unk_189670540;
  id v9 = v6;
  id v12 = v9;
  [v8 remoteObjectProxyWithErrorHandler:v11];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setChangeTrackingEnabled:v4 reply:v9];

  os_activity_scope_leave(&state);
}

- (void)fetchRemoteChangesWithReply:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/fetchRemoteChangesWithReply",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __57__KCSharingDaemonConnection_fetchRemoteChangesWithReply___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 fetchRemoteChangesWithReply:v7];

  os_activity_scope_leave(&state);
}

- (void)saveLocalChangesWithReply:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/saveLocalChangesWithReply",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __55__KCSharingDaemonConnection_saveLocalChangesWithReply___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 saveLocalChangesWithReply:v7];

  os_activity_scope_leave(&state);
}

- (void)getGroupByGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/getGroupByGroupID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __58__KCSharingDaemonConnection_getGroupByGroupID_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 getGroupByGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)getGroupsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/getGroupsWithRequest",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __61__KCSharingDaemonConnection_getGroupsWithRequest_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 getGroupsWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)createGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/createGroupWithRequest",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63__KCSharingDaemonConnection_createGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 createGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)updateGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/updateGroupWithRequest",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63__KCSharingDaemonConnection_updateGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 updateGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)leaveGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/leaveGroupWithRequest",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __62__KCSharingDaemonConnection_leaveGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 leaveGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)deleteGroupWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/deleteGroupWithRequest",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63__KCSharingDaemonConnection_deleteGroupWithRequest_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 deleteGroupWithRequest:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)acceptInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/acceptInviteForGroupID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63__KCSharingDaemonConnection_acceptInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 acceptInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)declineInviteForGroupID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/declineInviteForGroupID",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __64__KCSharingDaemonConnection_declineInviteForGroupID_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 declineInviteForGroupID:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)checkAvailabilityForHandles:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = _os_activity_create( &dword_1804F4000,  "ksd/client/checkAvailabilityForHandles",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v8, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __68__KCSharingDaemonConnection_checkAvailabilityForHandles_completion___block_invoke;
  v12[3] = &unk_189670540;
  id v10 = v7;
  id v13 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v12];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 checkAvailabilityForHandles:v6 completion:v10];

  os_activity_scope_leave(&state);
}

- (void)wipe:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create(&dword_1804F4000, "ksd/client/wipe", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v7, &state);
  v8 = -[KCSharingDaemonConnection connection](self, "connection");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __40__KCSharingDaemonConnection_wipe_reply___block_invoke;
  v11[3] = &unk_189670540;
  id v9 = v6;
  id v12 = v9;
  [v8 remoteObjectProxyWithErrorHandler:v11];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 wipe:v4 reply:v9];

  os_activity_scope_leave(&state);
}

- (void)fetchCurrentUserIdentifierWithReply:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/fetchCurrentUserIdentifierWithReply",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __65__KCSharingDaemonConnection_fetchCurrentUserIdentifierWithReply___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 fetchCurrentUserIdentifierWithReply:v7];

  os_activity_scope_leave(&state);
}

- (void)receivedGroupInvitation:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/receivedGroupInvitation",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  v8.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v8.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &v8);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 remoteObjectProxy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 receivedGroupInvitation:v4];

  os_activity_scope_leave(&v8);
}

- (void)groupInvitationWasCancelled
{
  v3 = _os_activity_create( &dword_1804F4000,  "ksd/client/groupInvitationWasCancelled",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &v6);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 remoteObjectProxy];
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 groupInvitationWasCancelled];

  os_activity_scope_leave(&v6);
}

- (void)resyncWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/resyncWithCompletion",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __50__KCSharingDaemonConnection_resyncWithCompletion___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  os_activity_scope_state_s v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 resyncWithCompletion:v7];

  os_activity_scope_leave(&state);
}

- (void)verifyGroupsInSyncWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/verifyGroupsInSyncWithCompletion",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __62__KCSharingDaemonConnection_verifyGroupsInSyncWithCompletion___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  os_activity_scope_state_s v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 verifyGroupsInSyncWithCompletion:v7];

  os_activity_scope_leave(&state);
}

- (void)performMaintenanceWithCompletion:(id)a3
{
  id v4 = a3;
  int v5 = _os_activity_create( &dword_1804F4000,  "ksd/client/performMaintenanceWithCompletion",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v5, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __62__KCSharingDaemonConnection_performMaintenanceWithCompletion___block_invoke;
  v9[3] = &unk_189670540;
  id v7 = v4;
  id v10 = v7;
  [v6 remoteObjectProxyWithErrorHandler:v9];
  os_activity_scope_state_s v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 performMaintenanceWithCompletion:v7];

  os_activity_scope_leave(&state);
}

- (void)groupsUpdated
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = _os_activity_create(&dword_1804F4000, "ksd/client/groupsUpdated", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 _queue];
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[KCSharingDaemonConnection connectionListeners](self, "connectionListeners", 0LL);
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v10 groupsUpdated];
        }
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }

  os_activity_scope_leave(&state);
}

- (void)accountChanged
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  v3 = _os_activity_create(&dword_1804F4000, "ksd/client/accountChanged", MEMORY[0x1895F8D48], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v3, &state);
  -[KCSharingDaemonConnection connection](self, "connection");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 _queue];
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  -[KCSharingDaemonConnection connectionListeners](self, "connectionListeners", 0LL);
  os_activity_scope_state_s v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0) {
          [v10 accountChanged];
        }
        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v7);
  }

  os_activity_scope_leave(&state);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSHashTable)connectionListeners
{
  return self->_connectionListeners;
}

- (void)setConnectionListeners:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __62__KCSharingDaemonConnection_performMaintenanceWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__KCSharingDaemonConnection_verifyGroupsInSyncWithCompletion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __50__KCSharingDaemonConnection_resyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __65__KCSharingDaemonConnection_fetchCurrentUserIdentifierWithReply___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __40__KCSharingDaemonConnection_wipe_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __68__KCSharingDaemonConnection_checkAvailabilityForHandles_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __64__KCSharingDaemonConnection_declineInviteForGroupID_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __63__KCSharingDaemonConnection_acceptInviteForGroupID_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __63__KCSharingDaemonConnection_deleteGroupWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __62__KCSharingDaemonConnection_leaveGroupWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __63__KCSharingDaemonConnection_updateGroupWithRequest_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __63__KCSharingDaemonConnection_createGroupWithRequest_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __61__KCSharingDaemonConnection_getGroupsWithRequest_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __58__KCSharingDaemonConnection_getGroupByGroupID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0LL, a2);
  }
  return result;
}

uint64_t __55__KCSharingDaemonConnection_saveLocalChangesWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __57__KCSharingDaemonConnection_fetchRemoteChangesWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __60__KCSharingDaemonConnection_setChangeTrackingEnabled_reply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __48__KCSharingDaemonConnection_provisionWithReply___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __54__KCSharingDaemonConnection_removeConnectionListener___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __51__KCSharingDaemonConnection_addConnectionListener___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:*(void *)(a1 + 40)];
}

void __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInterrupted];
}

void __59__KCSharingDaemonConnection_initWithConnection_queue_type___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionWasInvalidated];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1410);
  }
  return (id)sharedInstance_connection;
}

+ (id)sharedInvitationNotifier
{
  if (sharedInvitationNotifier_onceToken != -1) {
    dispatch_once(&sharedInvitationNotifier_onceToken, &__block_literal_global_121);
  }
  return (id)sharedInvitationNotifier_connection;
}

void __53__KCSharingDaemonConnection_sharedInvitationNotifier__block_invoke()
{
  v0 = -[KCSharingDaemonConnection initWithType:]( objc_alloc(&OBJC_CLASS___KCSharingDaemonConnection),  "initWithType:",  1LL);
  v1 = (void *)sharedInvitationNotifier_connection;
  sharedInvitationNotifier_connection = (uint64_t)v0;
}

void __43__KCSharingDaemonConnection_sharedInstance__block_invoke()
{
  v0 = -[KCSharingDaemonConnection initWithType:]( objc_alloc(&OBJC_CLASS___KCSharingDaemonConnection),  "initWithType:",  0LL);
  v1 = (void *)sharedInstance_connection;
  sharedInstance_connection = (uint64_t)v0;
}

@end