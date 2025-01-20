@interface AMFIConnection
+ (id)newConnection;
- ($2D7E8C6C30628BCB7896DC93BC7B256F)getSEPStateWithError:(SEL)a3;
- (AMFIConnection)init;
- (id)commitProfileForUuid:(id)a3;
- (id)getStagedProfileWithError:(id *)a3;
- (id)initiateDataMigration;
- (id)initiateDeveloperModeDaemons;
- (id)removeManagedState;
- (id)removeTrustforUuid:(id)a3;
- (id)setDemoState:(unsigned int)a3;
- (id)setManagedState:(id)a3;
- (id)setSupervisedState:(unsigned int)a3;
- (id)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5;
- (id)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withError:(id *)a6;
- (id)stageProfileForUuid:(id)a3;
- (void)dealloc;
@end

@implementation AMFIConnection

- (AMFIConnection)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___AMFIConnection;
  v2 = -[AMFIConnection init](&v7, sel_init);
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.amfi.nsxpc" options:4096];
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v3;

    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C66B478];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v5);

    -[NSXPCConnection resume](v2->connection, "resume");
  }

  return v2;
}

- (void)dealloc
{
  connection = self->connection;
  self->connection = 0LL;

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___AMFIConnection;
  -[AMFIConnection dealloc](&v4, sel_dealloc);
}

+ (id)newConnection
{
  return objc_alloc_init(&OBJC_CLASS___AMFIConnection);
}

- (id)initiateDataMigration
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __39__AMFIConnection_initiateDataMigration__block_invoke;
  v8[3] = &unk_189D46918;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v8);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __39__AMFIConnection_initiateDataMigration__block_invoke_32;
  v7[3] = &unk_189D46918;
  v7[4] = &v9;
  [v4 initiateDataMigrationWithReply:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __39__AMFIConnection_initiateDataMigration__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__AMFIConnection_initiateDataMigration__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_32(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __39__AMFIConnection_initiateDataMigration__block_invoke_32_cold_1();
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)initiateDeveloperModeDaemons
{
  uint64_t v9 = 0LL;
  v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke;
  v8[3] = &unk_189D46918;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v8);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33;
  v7[3] = &unk_189D46918;
  v7[4] = &v9;
  [v4 initiateDeveloperModeDaemonsWithReply:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
    objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33_cold_1();
    }
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- ($2D7E8C6C30628BCB7896DC93BC7B256F)getSEPStateWithError:(SEL)a3
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x5810000000LL;
  v23 = &unk_183D20B8F;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  char v27 = 0;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0LL;
  uint64_t v6 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __39__AMFIConnection_getSEPStateWithError___block_invoke;
  v13[3] = &unk_189D46918;
  v13[4] = &v14;
  v8 = -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v13);
  v12[0] = v6;
  v12[1] = 3221225472LL;
  v12[2] = __39__AMFIConnection_getSEPStateWithError___block_invoke_35;
  v12[3] = &unk_189D46940;
  v12[4] = &v20;
  v12[5] = &v14;
  [v8 getSEPStateWithReply:v12];

  if (a4) {
    *a4 = (id) v15[5];
  }
  uint64_t v9 = v21;
  __int128 v10 = *((_OWORD *)v21 + 3);
  *(_OWORD *)&retstr->var0 = *((_OWORD *)v21 + 2);
  *(_OWORD *)&retstr->var3.var1.var0 = v10;
  *(_OWORD *)&retstr->var3.var1.var1[12] = *((_OWORD *)v9 + 4);
  retstr->var3.var1.var1[28] = *((_BYTE *)v9 + 80);
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return result;
}

void __39__AMFIConnection_getSEPStateWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__AMFIConnection_getSEPStateWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

__n128 __39__AMFIConnection_getSEPStateWithError___block_invoke_35(uint64_t a1, __int128 *a2, id obj)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
  __int128 v4 = *a2;
  __int128 v5 = a2[1];
  __int128 v6 = a2[2];
  *(_BYTE *)(v3 + 80) = *((_BYTE *)a2 + 48);
  *(_OWORD *)(v3 + 48) = v5;
  *(_OWORD *)(v3 + 64) = v6;
  *(_OWORD *)(v3 + 32) = v4;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
  return result;
}

- (id)signTeamID:(id)a3 withSignType:(unsigned int)a4 withLAContext:(id)a5 withError:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v25 = 0LL;
  __int128 v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0LL;
  uint64_t v12 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke;
  v18[3] = &unk_189D46918;
  v18[4] = &v25;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v18);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  v17[1] = 3221225472LL;
  v17[2] = __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_37;
  v17[3] = &unk_189D46968;
  v17[4] = &v19;
  v17[5] = &v25;
  [v14 signTeamID:v10 withSignType:v8 withLAContext:v11 withReply:v17];

  if (a6) {
    *a6 = (id) v26[5];
  }
  id v15 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&v25, 8);
  return v15;
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  __int128 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_37( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)stageProfileForUuid:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  uint64_t v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __38__AMFIConnection_stageProfileForUuid___block_invoke;
  v11[3] = &unk_189D46918;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __38__AMFIConnection_stageProfileForUuid___block_invoke_39;
  v10[3] = &unk_189D46918;
  v10[4] = &v12;
  [v7 stageProfileForUuid:v4 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __38__AMFIConnection_stageProfileForUuid___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke_39(uint64_t a1, void *a2)
{
}

- (id)getStagedProfileWithError:(id *)a3
{
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44__AMFIConnection_getStagedProfileWithError___block_invoke;
  v10[3] = &unk_189D46918;
  v10[4] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __44__AMFIConnection_getStagedProfileWithError___block_invoke_40;
  v9[3] = &unk_189D46990;
  v9[4] = &v11;
  v9[5] = &v17;
  [v6 getStagedProfileWithReply:v9];

  if (a3) {
    *a3 = (id) v18[5];
  }
  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __44__AMFIConnection_getStagedProfileWithError___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)commitProfileForUuid:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __39__AMFIConnection_commitProfileForUuid___block_invoke;
  v11[3] = &unk_189D46918;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __39__AMFIConnection_commitProfileForUuid___block_invoke_42;
  v10[3] = &unk_189D46918;
  v10[4] = &v12;
  [v7 commitProfileForUuid:v4 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__AMFIConnection_commitProfileForUuid___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke_42(uint64_t a1, void *a2)
{
}

- (id)setTrustForUuid:(id)a3 withSignature:(id)a4 withSignType:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = 0LL;
  uint64_t v10 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke;
  v16[3] = &unk_189D46918;
  v16[4] = &v17;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v16);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  v15[1] = 3221225472LL;
  v15[2] = __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_43;
  v15[3] = &unk_189D46918;
  v15[4] = &v17;
  [v12 setTrustForUuid:v8 withSignature:v9 withSignType:v5 withReply:v15];

  id v13 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v13;
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_43(uint64_t a1, void *a2)
{
}

- (id)removeTrustforUuid:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __37__AMFIConnection_removeTrustforUuid___block_invoke;
  v11[3] = &unk_189D46918;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __37__AMFIConnection_removeTrustforUuid___block_invoke_44;
  v10[3] = &unk_189D46918;
  v10[4] = &v12;
  [v7 removeTrustforUuid:v4 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__AMFIConnection_removeTrustforUuid___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke_44(uint64_t a1, void *a2)
{
}

- (id)setSupervisedState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __37__AMFIConnection_setSupervisedState___block_invoke;
  v10[3] = &unk_189D46918;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __37__AMFIConnection_setSupervisedState___block_invoke_45;
  v9[3] = &unk_189D46918;
  v9[4] = &v11;
  [v6 setSupervisedState:v3 withReply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __37__AMFIConnection_setSupervisedState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__AMFIConnection_setSupervisedState___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __37__AMFIConnection_setSupervisedState___block_invoke_45(uint64_t a1, void *a2)
{
}

- (id)setDemoState:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0LL;
  uint64_t v4 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __31__AMFIConnection_setDemoState___block_invoke;
  v10[3] = &unk_189D46918;
  v10[4] = &v11;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v10);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472LL;
  v9[2] = __31__AMFIConnection_setDemoState___block_invoke_46;
  v9[3] = &unk_189D46918;
  v9[4] = &v11;
  [v6 setDemoState:v3 withReply:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __31__AMFIConnection_setDemoState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __31__AMFIConnection_setDemoState___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __31__AMFIConnection_setDemoState___block_invoke_46(uint64_t a1, void *a2)
{
}

- (id)setManagedState:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  uint64_t v5 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __34__AMFIConnection_setManagedState___block_invoke;
  v11[3] = &unk_189D46918;
  v11[4] = &v12;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v11);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __34__AMFIConnection_setManagedState___block_invoke_47;
  v10[3] = &unk_189D46918;
  v10[4] = &v12;
  [v7 setManagedState:v4 withReply:v10];

  id v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __34__AMFIConnection_setManagedState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __34__AMFIConnection_setManagedState___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __34__AMFIConnection_setManagedState___block_invoke_47(uint64_t a1, void *a2)
{
}

- (id)removeManagedState
{
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  uint64_t v12 = __Block_byref_object_copy_;
  uint64_t v13 = __Block_byref_object_dispose_;
  id v14 = 0LL;
  uint64_t v2 = MEMORY[0x1895F87A8];
  connection = self->connection;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __36__AMFIConnection_removeManagedState__block_invoke;
  v8[3] = &unk_189D46918;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  v8);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v7[1] = 3221225472LL;
  v7[2] = __36__AMFIConnection_removeManagedState__block_invoke_48;
  v7[3] = &unk_189D46918;
  v7[4] = &v9;
  [v4 removeManagedStateWithReply:v7];

  id v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __36__AMFIConnection_removeManagedState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[AMFIFMKLog generic](&OBJC_CLASS___AMFIFMKLog, "generic");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __36__AMFIConnection_removeManagedState__block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __36__AMFIConnection_removeManagedState__block_invoke_48(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_cold_1()
{
}

void __39__AMFIConnection_initiateDataMigration__block_invoke_32_cold_1()
{
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_cold_1()
{
}

void __46__AMFIConnection_initiateDeveloperModeDaemons__block_invoke_33_cold_1()
{
}

void __39__AMFIConnection_getSEPStateWithError___block_invoke_cold_1()
{
}

void __66__AMFIConnection_signTeamID_withSignType_withLAContext_withError___block_invoke_cold_1()
{
}

void __38__AMFIConnection_stageProfileForUuid___block_invoke_cold_1()
{
}

void __44__AMFIConnection_getStagedProfileWithError___block_invoke_cold_1()
{
}

void __39__AMFIConnection_commitProfileForUuid___block_invoke_cold_1()
{
}

void __61__AMFIConnection_setTrustForUuid_withSignature_withSignType___block_invoke_cold_1()
{
}

void __37__AMFIConnection_removeTrustforUuid___block_invoke_cold_1()
{
}

void __37__AMFIConnection_setSupervisedState___block_invoke_cold_1()
{
}

void __31__AMFIConnection_setDemoState___block_invoke_cold_1()
{
}

void __34__AMFIConnection_setManagedState___block_invoke_cold_1()
{
}

void __36__AMFIConnection_removeManagedState__block_invoke_cold_1()
{
}

@end