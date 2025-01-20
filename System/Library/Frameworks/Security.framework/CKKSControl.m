@interface CKKSControl
+ (id)CKKSControlObject:(BOOL)a3 error:(id *)a4;
+ (id)controlObject:(id *)a3;
- (BOOL)synchronous;
- (CKKSControl)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)objectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)deleteSEView:(id)a3 reply:(id)a4;
- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchSEViewKeyHierarchy:(id)a3 reply:(id)a4;
- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6;
- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4;
- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5;
- (void)rpcFastStatus:(id)a3 reply:(id)a4;
- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6;
- (void)rpcFetchAndProcessChanges:(id)a3 reply:(id)a4;
- (void)rpcFetchAndProcessChangesIfNoRecentFetch:(id)a3 reply:(id)a4;
- (void)rpcFetchAndProcessClassAChanges:(id)a3 reply:(id)a4;
- (void)rpcGetCKDeviceIDWithReply:(id)a3;
- (void)rpcKnownBadState:(id)a3 reply:(id)a4;
- (void)rpcPerformanceCounters:(id)a3;
- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4;
- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5;
- (void)rpcResetLocal:(id)a3 reply:(id)a4;
- (void)rpcResync:(id)a3 reply:(id)a4;
- (void)rpcResyncLocal:(id)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6;
- (void)rpcStatus:(id)a3 reply:(id)a4;
- (void)rpcTLKMissing:(id)a3 reply:(id)a4;
- (void)setConnection:(id)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)toggleHavoc:(id)a3;
@end

@implementation CKKSControl

- (CKKSControl)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___CKKSControl;
  v6 = -[CKKSControl init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CKKSControl;
  -[CKKSControl dealloc](&v4, sel_dealloc);
}

- (id)objectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = -[CKKSControl synchronous](self, "synchronous");
  v6 = -[CKKSControl connection](self, "connection");
  v7 = v6;
  if (v5) {
    [v6 synchronousRemoteObjectProxyWithErrorHandler:v4];
  }
  else {
    [v6 remoteObjectProxyWithErrorHandler:v4];
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)rpcStatus:(id)a3 reply:(id)a4
{
}

- (void)rpcFastStatus:(id)a3 reply:(id)a4
{
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke;
  v18[3] = &unk_189670540;
  id v12 = v10;
  id v19 = v12;
  id v13 = a3;
  v14 = -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v18);
  v16[0] = v11;
  v16[1] = 3221225472LL;
  v16[2] = __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke_2;
  v16[3] = &unk_1896650E8;
  v16[4] = self;
  id v17 = v12;
  id v15 = v12;
  [v14 rpcStatus:v13 fast:v7 waitForNonTransientState:a5 reply:v16];
}

- (void)rpcResetLocal:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  secLogObjForScope("ckkscontrol");
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a local reset for view %@", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __35__CKKSControl_rpcResetLocal_reply___block_invoke;
  v15[3] = &unk_189670540;
  id v10 = v7;
  id v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __35__CKKSControl_rpcResetLocal_reply___block_invoke_2;
  v13[3] = &unk_189665110;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 rpcResetLocal:v6 reply:v13];
}

- (void)rpcResetCloudKit:(id)a3 reason:(id)a4 reply:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  secLogObjForScope("ckkscontrol");
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v8;
    _os_log_impl(&dword_1804F4000, v11, OS_LOG_TYPE_DEFAULT, "Requesting a CloudKit reset for view %@", buf, 0xCu);
  }

  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke;
  v18[3] = &unk_189670540;
  id v13 = v9;
  id v19 = v13;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v18);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472LL;
  v16[2] = __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke_2;
  v16[3] = &unk_189665110;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 rpcResetCloudKit:v8 reason:v10 reply:v16];
}

- (void)rpcResyncLocal:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  secLogObjForScope("ckkscontrol");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a local resync for view %@", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __36__CKKSControl_rpcResyncLocal_reply___block_invoke;
  v15[3] = &unk_189670540;
  id v10 = v7;
  id v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __36__CKKSControl_rpcResyncLocal_reply___block_invoke_2;
  v13[3] = &unk_189665110;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 rpcResyncLocal:v6 reply:v13];
}

- (void)rpcResync:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  secLogObjForScope("ckkscontrol");
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a resync for view %@", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __31__CKKSControl_rpcResync_reply___block_invoke;
  v15[3] = &unk_189670540;
  id v10 = v7;
  id v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __31__CKKSControl_rpcResync_reply___block_invoke_2;
  v13[3] = &unk_189665110;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 rpcResync:v6 reply:v13];
}

- (void)rpcFetchAndProcessChanges:(id)a3 classA:(BOOL)a4 onlyIfNoRecentFetch:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a6;
  secLogObjForScope("ckkscontrol");
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v22 = v10;
    _os_log_impl(&dword_1804F4000, v12, OS_LOG_TYPE_DEFAULT, "Requesting a fetch for view %@", buf, 0xCu);
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke;
  v19[3] = &unk_189670540;
  id v14 = v11;
  id v20 = v14;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v19);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472LL;
  v17[2] = __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke_2;
  v17[3] = &unk_189665110;
  v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v15 rpcFetchAndProcessChanges:v10 classA:v8 onlyIfNoRecentFetch:v7 reply:v17];
}

- (void)rpcFetchAndProcessChanges:(id)a3 reply:(id)a4
{
}

- (void)rpcFetchAndProcessChangesIfNoRecentFetch:(id)a3 reply:(id)a4
{
}

- (void)rpcFetchAndProcessClassAChanges:(id)a3 reply:(id)a4
{
}

- (void)rpcPushOutgoingChanges:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  secLogObjForScope("ckkscontrol");
  BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Requesting a push for view %@", buf, 0xCu);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke;
  v15[3] = &unk_189670540;
  id v10 = v7;
  id v16 = v10;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v15);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke_2;
  v13[3] = &unk_189665110;
  v13[4] = self;
  id v14 = v10;
  id v12 = v10;
  [v11 rpcPushOutgoingChanges:v6 reply:v13];
}

- (void)rpcCKMetric:(id)a3 attributes:(id)a4 reply:(id)a5
{
  id v8 = a5;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke;
  v17[3] = &unk_189670540;
  id v10 = v8;
  id v18 = v10;
  id v11 = a4;
  id v12 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v17);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke_2;
  v15[3] = &unk_189665110;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 rpcCKMetric:v12 attributes:v11 reply:v15];
}

- (void)rpcPerformanceCounters:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __38__CKKSControl_rpcPerformanceCounters___block_invoke;
  v11[3] = &unk_189670540;
  id v6 = v4;
  id v12 = v6;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472LL;
  v9[2] = __38__CKKSControl_rpcPerformanceCounters___block_invoke_2;
  v9[3] = &unk_189665138;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 performanceCounters:v9];
}

- (void)rpcGetCKDeviceIDWithReply:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke;
  v11[3] = &unk_189670540;
  id v6 = v4;
  id v12 = v6;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472LL;
  v9[2] = __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke_2;
  v9[3] = &unk_189665160;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 rpcGetCKDeviceIDWithReply:v9];
}

- (void)rpcTLKMissing:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __35__CKKSControl_rpcTLKMissing_reply___block_invoke;
  v8[3] = &unk_18966F5C0;
  id v9 = v6;
  id v7 = v6;
  -[CKKSControl rpcFastStatus:reply:](self, "rpcFastStatus:reply:", a3, v8);
}

- (void)rpcKnownBadState:(id)a3 reply:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __38__CKKSControl_rpcKnownBadState_reply___block_invoke;
  v8[3] = &unk_18966F5C0;
  id v9 = v6;
  id v7 = v6;
  -[CKKSControl rpcFastStatus:reply:](self, "rpcFastStatus:reply:", a3, v8);
}

- (void)proposeTLKForSEView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = a7;
  uint64_t v13 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke;
  v23[3] = &unk_189670540;
  id v14 = v12;
  id v24 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v23);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  v21[1] = 3221225472LL;
  v21[2] = __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke_2;
  v21[3] = &unk_189665110;
  v21[4] = self;
  id v22 = v14;
  id v20 = v14;
  [v19 proposeTLKForSEView:v18 proposedTLK:v17 wrappedOldTLK:v16 tlkShares:v15 reply:v21];
}

- (void)fetchSEViewKeyHierarchy:(id)a3 reply:(id)a4
{
}

- (void)fetchSEViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke;
  v16[3] = &unk_189670540;
  id v10 = v8;
  id v17 = v10;
  id v11 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v16);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v14[1] = 3221225472LL;
  v14[2] = __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke_2;
  v14[3] = &unk_189665188;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [v12 fetchSEViewKeyHierarchy:v11 forceFetch:v5 reply:v14];
}

- (void)modifyTLKSharesForSEView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10 = a6;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke;
  v20[3] = &unk_189670540;
  id v12 = v10;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v20);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472LL;
  v18[2] = __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke_2;
  v18[3] = &unk_189665110;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 modifyTLKSharesForSEView:v15 adding:v14 deleting:v13 reply:v18];
}

- (void)deleteSEView:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __34__CKKSControl_deleteSEView_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __34__CKKSControl_deleteSEView_reply___block_invoke_2;
  v12[3] = &unk_189665110;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 deleteSEView:v9 reply:v12];
}

- (void)toggleHavoc:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __27__CKKSControl_toggleHavoc___block_invoke;
  v11[3] = &unk_189670540;
  id v6 = v4;
  id v12 = v6;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472LL;
  v9[2] = __27__CKKSControl_toggleHavoc___block_invoke_2;
  v9[3] = &unk_1896651B0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [v7 toggleHavoc:v9];
}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke;
  v14[3] = &unk_189670540;
  id v8 = v6;
  id v15 = v8;
  id v9 = a3;
  -[CKKSControl objectProxyWithErrorHandler:](self, "objectProxyWithErrorHandler:", v14);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472LL;
  v12[2] = __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke_2;
  v12[3] = &unk_1896671C8;
  v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 pcsMirrorKeysForServices:v9 reply:v12];
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_synchronous = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

uint64_t __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __46__CKKSControl_pcsMirrorKeysForServices_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __27__CKKSControl_toggleHavoc___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __27__CKKSControl_toggleHavoc___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __34__CKKSControl_deleteSEView_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __34__CKKSControl_deleteSEView_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __62__CKKSControl_modifyTLKSharesForSEView_adding_deleting_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __56__CKKSControl_fetchSEViewKeyHierarchy_forceFetch_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __77__CKKSControl_proposeTLKForSEView_proposedTLK_wrappedOldTLK_tlkShares_reply___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __38__CKKSControl_rpcKnownBadState_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v16 = a1;
    char v5 = 0;
    int v18 = 0;
    uint64_t v6 = *(void *)v20;
    uint64_t v7 = @"view";
    id v8 = @"keystate";
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v7, v16);
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 objectForKeyedSubscript:v8];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v11 isEqualToString:@"global"] & 1) == 0)
        {
          id v13 = v8;
          id v14 = v7;
          if (([v12 isEqualToString:@"waitfortlk"] & 1) == 0) {
            [v12 isEqualToString:@"error"];
          }
          char v15 = [v12 isEqualToString:@"waitforunlock"];
          if (([v12 isEqualToString:@"waitfortlkcreation"] & 1) == 0
            && ([v12 isEqualToString:@"waitfortlkupload"] & 1) == 0)
          {
            [v12 isEqualToString:@"waitfortrust"];
          }

          v5 |= v15;
          v18 |= [v12 isEqualToString:@"loggedout"];
          uint64_t v7 = v14;
          id v8 = v13;
        }
      }

      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v4);
    a1 = v16;
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __35__CKKSControl_rpcTLKMissing_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v7 objectForKeyedSubscript:@"view"];
        id v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 objectForKeyedSubscript:@"keystate"];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v8 isEqualToString:@"global"] & 1) == 0
          && ([v9 isEqualToString:@"waitfortlk"] & 1) == 0)
        {
          [v9 isEqualToString:@"error"];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __41__CKKSControl_rpcGetCKDeviceIDWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __38__CKKSControl_rpcPerformanceCounters___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __38__CKKSControl_rpcPerformanceCounters___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __44__CKKSControl_rpcCKMetric_attributes_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __44__CKKSControl_rpcPushOutgoingChanges_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("ckkscontrol");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      uint64_t v6 = "Push finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    uint64_t v6 = "Push finished successfully";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
}

uint64_t __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __74__CKKSControl_rpcFetchAndProcessChanges_classA_onlyIfNoRecentFetch_reply___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("ckkscontrol");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      uint64_t v6 = "Fetch finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    uint64_t v6 = "Fetch finished successfully";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
}

uint64_t __31__CKKSControl_rpcResync_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __31__CKKSControl_rpcResync_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("ckkscontrol");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      uint64_t v6 = "Resync finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    uint64_t v6 = "Resync finished successfully";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
}

uint64_t __36__CKKSControl_rpcResyncLocal_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __36__CKKSControl_rpcResyncLocal_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("ckkscontrol");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      uint64_t v6 = "Local resync finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    uint64_t v6 = "Local resync finished successfully";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
}

uint64_t __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __45__CKKSControl_rpcResetCloudKit_reason_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("ckkscontrol");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      uint64_t v6 = "CloudKit reset finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    uint64_t v6 = "CloudKit reset finished successfully";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
}

uint64_t __35__CKKSControl_rpcResetLocal_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __35__CKKSControl_rpcResetLocal_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  secLogObjForScope("ckkscontrol");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v9 = 138412290;
      id v10 = v3;
      uint64_t v6 = "Local reset finished with error: %@";
      uint64_t v7 = v4;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, v8);
    }
  }

  else if (v5)
  {
    LOWORD(v9) = 0;
    uint64_t v6 = "Local reset finished successfully";
    uint64_t v7 = v4;
    uint32_t v8 = 2;
    goto LABEL_6;
  }

  (*(void (**)(void, id))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), v3);
}

uint64_t __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __61__CKKSControl_rpcStatus_fast_waitForNonTransientState_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

+ (id)controlObject:(id *)a3
{
  return +[CKKSControl CKKSControlObject:error:](&OBJC_CLASS___CKKSControl, "CKKSControlObject:error:", 0LL, a3);
}

+ (id)CKKSControlObject:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  v12[1] = *MEMORY[0x1895F89C0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.securityd.ckks" options:0];
  if (v6)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C5411B0];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    CKKSSetupControlProtocol(v7);
    objc_claimAutoreleasedReturnValue();

    [v6 setRemoteObjectInterface:v7];
    [v6 resume];
    a4 = -[CKKSControl initWithConnection:](objc_alloc(&OBJC_CLASS___CKKSControl), "initWithConnection:", v6);
    [a4 setSynchronous:v5];
  }

  else if (a4)
  {
    uint32_t v8 = (void *)MEMORY[0x189607870];
    uint64_t v11 = *MEMORY[0x1896075E0];
    v12[0] = @"Couldn't create connection (no reason given)";
    [MEMORY[0x189603F68] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 errorWithDomain:@"securityd" code:-1 userInfo:v9];
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0LL;
  }

  return a4;
}

@end