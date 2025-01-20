@interface UMPersonaCallbackListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (UMPersonaCallbackListener)init;
- (void)bubbleDidPop;
- (void)deviceLoginSessionStateDidUpdate;
- (void)personaListDidUpdateCompletionHandler:(id)a3;
- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3;
- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4;
- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4;
- (void)uploadContentWithCompletionHandler:(id)a3;
- (void)userSwitchTaskListDidUpdate;
- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4;
@end

@implementation UMPersonaCallbackListener

- (UMPersonaCallbackListener)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___UMPersonaCallbackListener;
  v5 = -[UMPersonaCallbackListener init](&v9, sel_init);
  if (v5)
  {
    uint64_t v6 = objc_msgSend_set(MEMORY[0x189603FE0], v2, v3, v4);
    xpcConnections = v5->_xpcConnections;
    v5->_xpcConnections = (NSMutableSet *)v6;
  }

  return v5;
}

- (void)willSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  sub_185F3644C();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = sub_185F52AF8;
  v8[3] = &unk_189DD5288;
  id v9 = v5;
  id v7 = v5;
  sub_185F3672C((uint64_t)v6, self, v8);
}

- (void)readyToSwitchToUser:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  sub_185F3644C();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = sub_185F52BE0;
  v8[3] = &unk_189DD5288;
  id v9 = v5;
  id v7 = v5;
  sub_185F3672C((uint64_t)v6, self, v8);
}

- (void)readyToSwitchToLoginSession:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  sub_185F3644C();
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = sub_185F52CC8;
  v8[3] = &unk_189DD5288;
  id v9 = v5;
  id v7 = v5;
  sub_185F3672C((uint64_t)v6, self, v8);
}

- (void)userSwitchTaskListDidUpdate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F3672C((uint64_t)v3, self, &unk_189DD52C8);
}

- (void)deviceLoginSessionStateDidUpdate
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F3672C((uint64_t)v3, self, &unk_189DD52E8);
}

- (void)uploadContentWithCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3644C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F52EC0;
  v7[3] = &unk_189DD5288;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)bubbleDidPop
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_185F3672C((uint64_t)v3, self, &unk_189DD5308);
}

- (void)personaListDidUpdateCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3644C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F53030;
  v7[3] = &unk_189DD5288;
  id v8 = v4;
  id v6 = v4;
  sub_185F3672C((uint64_t)v5, self, v7);
}

- (void)personaUpdateCallbackForMachServiceCompletionHandler:(id)a3
{
  id v4 = a3;
  sub_185F3644C();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = sub_185F53118;
  v7[3] = &unk_189DD5330;
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
  sub_185F43A40( (uint64_t)v6,  @"Should accept connection for UMPersonaCallbackListener",  v7,  v8,  v9,  v10,  v11,  v12,  v16);

  sub_185F3654C();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = sub_185F53348;
  v17[3] = &unk_189DD5358;
  id v18 = v5;
  id v14 = v5;
  sub_185F3672C((uint64_t)v13, self, v17);

  return 1;
}

- (void).cxx_destruct
{
}

@end