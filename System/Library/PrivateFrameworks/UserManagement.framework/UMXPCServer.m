@interface UMXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UMXPCServer)init;
- (void)bubbleDidPop;
- (void)deviceLoginSessionStateDidUpdate;
- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)loginUICheckInWithCompletionHandler:(id)a3;
- (void)logoutToLoginSessionWithCompletionHandler:(id)a3;
- (void)personaListDidUpdateCompletionHandler:(id)a3;
- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4;
- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4;
- (void)registerCriticalUserSwitchStakeHolder:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3;
- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4;
- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4;
- (void)resumeQuotas;
- (void)resumeSync;
- (void)suspendQuotasWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithCompletionHandler:(id)a3;
- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6;
- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7;
- (void)terminateSyncWithCompletionHandler:(id)a3;
- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5;
- (void)uploadContentWithCompletionHandler:(id)a3;
- (void)userInteractionIsEnabled;
- (void)userSwitchTaskListDidUpdate;
- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4;
@end

@implementation UMXPCServer

- (UMXPCServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___UMXPCServer;
  v2 = -[UMXPCServer init](&v10, sel_init);
  if (v2)
  {
    uint64_t v3 = sub_185F43DCC();
    se = v2->_se;
    v2->_se = (UMSideEffectsProviding *)v3;

    *(_WORD *)&v2->_didBroadcastUploadContent = 0;
    *(_DWORD *)&v2->_currentlyBroadcastingWillSwitchToUser = 0;
    uint64_t v5 = objc_opt_new();
    switchBlockingTasks = v2->_switchBlockingTasks;
    v2->_switchBlockingTasks = (NSMutableArray *)v5;

    uint64_t v7 = objc_opt_new();
    syncTasks = v2->_syncTasks;
    v2->_syncTasks = (NSMutableArray *)v7;

    v2->_willSwitchToUserAddedTaskCount = 0LL;
    v2->_interruptionRetryCount = 0;
    if ((sub_185F38E68() & 1) == 0) {
      sub_185F47888((uint64_t)v2);
    }
  }

  return v2;
}

- (void)registerUserSwitchStakeHolder:(id)a3
{
}

- (void)registerUserSwitchStakeHolder:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3654C();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F47A68;
  v11[3] = &unk_189DD4AC0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)registerCriticalUserSwitchStakeHolder:(id)a3
{
  id v4 = a3;
  sub_185F3654C();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F47C04;
  v7[3] = &unk_189DD4AE8;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)registerUserSyncStakeholder:(id)a3 withMachServiceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3654C();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F47CE4;
  v11[3] = &unk_189DD4B10;
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)unregisterStakeHolder:(id)a3 status:(unint64_t)a4 reason:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  sub_185F3654C();
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = sub_185F47EF4;
  v13[3] = &unk_189DD4B38;
  id v15 = v9;
  unint64_t v16 = a4;
  id v14 = v8;
  id v11 = v9;
  id v12 = v8;
  sub_185F3672C((uint64_t)v10, self, v13);
}

- (void)switchToLoginUserWithCompletionHandler:(id)a3
{
}

- (void)switchToLoginUserWithError:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  sub_185F3654C();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = sub_185F480F0;
  v8[3] = &unk_189DD4B60;
  id v9 = v5;
  id v7 = v5;
  sub_185F3672C((uint64_t)v6, self, v8);
}

- (void)logoutToLoginSessionWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3654C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F481F8;
  v7[3] = &unk_189DD4B60;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 completionHandler:(id)a6
{
}

- (void)switchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  sub_185F3654C();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = sub_185F483A4;
  v23[3] = &unk_189DD4B88;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  sub_185F3672C((uint64_t)v17, self, v23);
}

- (void)directSwitchToUser:(id)a3 passcodeData:(id)a4 context:(id)a5 preferences:(id)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  sub_185F3654C();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = sub_185F485DC;
  v23[3] = &unk_189DD4B88;
  id v24 = v14;
  id v25 = v12;
  id v26 = v13;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v13;
  id v21 = v12;
  id v22 = v14;
  sub_185F3672C((uint64_t)v17, self, v23);
}

- (void)loginUICheckInWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3654C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F48750;
  v7[3] = &unk_189DD4B60;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)suspendQuotasWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3654C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F48858;
  v7[3] = &unk_189DD4B60;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)resumeQuotas
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F3672C((uint64_t)v3, self, &unk_189DD4BC8);
}

- (void)terminateSyncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3654C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F489F4;
  v7[3] = &unk_189DD4B60;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)resumeSync
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F3672C((uint64_t)v3, self, &unk_189DD4BE8);
}

- (void)userInteractionIsEnabled
{
  if (self) {
    self = (UMXPCServer *)self->_xpcConnection;
  }
  objc_msgSend_remoteObjectProxyWithErrorHandler_(self, a2, (uint64_t)&unk_189DD4C28, v2);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_loginComplete(v6, v3, v4, v5);
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3644C();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F4BBE8;
  v11[3] = &unk_189DD5088;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3644C();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F4BE64;
  v11[3] = &unk_189DD5088;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sub_185F3644C();
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = sub_185F4C06C;
  v11[3] = &unk_189DD50B0;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_185F3672C((uint64_t)v8, self, v11);
}

- (void)userSwitchTaskListDidUpdate
{
  if (self) {
    id WeakRetained = objc_loadWeakRetained(&self->_stakeholder);
  }
  else {
    id WeakRetained = 0LL;
  }
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    sub_185F3654C();
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = sub_185F4C1E0;
    v6[3] = &unk_189DD4AE8;
    v6[4] = self;
    sub_185F3672C((uint64_t)v5, self, v6);
  }

- (void)deviceLoginSessionStateDidUpdate
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v2, @"Update LoginSession Type Cache", v3, v4, v5, v6, v7, v8, v9);

  sub_185F3E198();
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3644C();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F4C6B8;
  v7[3] = &unk_189DD4B60;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)bubbleDidPop
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F3672C((uint64_t)v3, self, &unk_189DD5138);
}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3644C();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F4CB14;
  v7[3] = &unk_189DD50B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3644C();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F4CCCC;
  v7[3] = &unk_189DD50B0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  sub_185F43818();
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  sub_185F43A40((uint64_t)v6, @"Should accept connection", v7, v8, v9, v10, v11, v12, v23);

  char v13 = sub_185F43DD8(v5, @"com.apple.mobile.keybagd.bubbled.sync");
  if ((v13 & 1) != 0)
  {
    sub_185F3654C();
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = sub_185F4CEE4;
    v25[3] = &unk_189DD4AE8;
    id v26 = v5;
    sub_185F3672C((uint64_t)v14, self, v25);
  }

  else
  {
    sub_185F436A0();
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    sub_185F43A40((uint64_t)v15, @"Connection does not have entitlement", v16, v17, v18, v19, v20, v21, v24);
  }

  return v13;
}

- (void).cxx_destruct
{
}

@end