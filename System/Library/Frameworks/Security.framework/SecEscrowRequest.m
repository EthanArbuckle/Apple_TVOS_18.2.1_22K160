@interface SecEscrowRequest
+ (id)request:(id *)a3;
- (BOOL)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 error:(id *)a5;
- (BOOL)escrowCompletedWithinLastSeconds:(double)a3;
- (BOOL)pendingEscrowUpload:(id *)a3;
- (BOOL)resetAllRequests:(id *)a3;
- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4;
- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5;
- (NSXPCConnection)connection;
- (SecEscrowRequest)initWithConnection:(id)a3;
- (id)fetchPrerecord:(id)a3 error:(id *)a4;
- (id)fetchRequestWaitingOnPasscode:(id *)a3;
- (id)fetchStatuses:(id *)a3;
- (unint64_t)storePrerecordsInEscrow:(id *)a3;
- (void)dealloc;
- (void)setConnection:(id)a3;
@end

@implementation SecEscrowRequest

- (SecEscrowRequest)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SecEscrowRequest;
  v6 = -[SecEscrowRequest init](&v9, sel_init);
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
  v4.super_class = (Class)&OBJC_CLASS___SecEscrowRequest;
  -[SecEscrowRequest dealloc](&v4, sel_dealloc);
}

- (BOOL)triggerEscrowUpdate:(id)a3 error:(id *)a4
{
  return -[SecEscrowRequest triggerEscrowUpdate:options:error:](self, "triggerEscrowUpdate:options:error:", a3, 0LL, a4);
}

- (BOOL)triggerEscrowUpdate:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__3101;
  v26 = __Block_byref_object_dispose__3102;
  id v27 = 0LL;
  v10 = -[SecEscrowRequest connection](self, "connection");
  uint64_t v11 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke;
  v21[3] = &unk_189672C48;
  v21[4] = &v22;
  [v10 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472LL;
  v18[2] = __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke_82;
  v18[3] = &unk_1896678E8;
  v20 = &v22;
  id v13 = v8;
  id v19 = v13;
  [v12 triggerEscrowUpdate:v13 options:v9 reply:v18];
  v14 = v23;
  if (a5)
  {
    v15 = (void *)v23[5];
    if (v15)
    {
      *a5 = v15;
      v14 = v23;
    }
  }

  BOOL v16 = v14[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (BOOL)cachePrerecord:(id)a3 serializedPrerecord:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v22 = 0LL;
  v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__3101;
  v26 = __Block_byref_object_dispose__3102;
  id v27 = 0LL;
  v10 = -[SecEscrowRequest connection](self, "connection");
  uint64_t v11 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke;
  v21[3] = &unk_189672C48;
  v21[4] = &v22;
  [v10 synchronousRemoteObjectProxyWithErrorHandler:v21];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472LL;
  v18[2] = __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke_83;
  v18[3] = &unk_1896678E8;
  v20 = &v22;
  id v13 = v8;
  id v19 = v13;
  [v12 cachePrerecord:v13 serializedPrerecord:v9 reply:v18];
  v14 = v23;
  if (a5)
  {
    v15 = (void *)v23[5];
    if (v15)
    {
      *a5 = v15;
      v14 = v23;
    }
  }

  BOOL v16 = v14[5] == 0;

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (id)fetchPrerecord:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy__3101;
  v29 = __Block_byref_object_dispose__3102;
  id v30 = 0LL;
  v7 = -[SecEscrowRequest connection](self, "connection");
  uint64_t v8 = MEMORY[0x1895F87A8];
  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __41__SecEscrowRequest_fetchPrerecord_error___block_invoke;
  v24[3] = &unk_189672C48;
  v24[4] = &v25;
  [v7 synchronousRemoteObjectProxyWithErrorHandler:v24];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__3101;
  uint64_t v22 = __Block_byref_object_dispose__3102;
  id v23 = 0LL;
  v14[0] = v8;
  v14[1] = 3221225472LL;
  v14[2] = __41__SecEscrowRequest_fetchPrerecord_error___block_invoke_84;
  v14[3] = &unk_189665928;
  BOOL v16 = &v18;
  v17 = &v25;
  id v10 = v6;
  id v15 = v10;
  [v9 fetchPrerecord:v10 reply:v14];
  if (a4)
  {
    uint64_t v11 = (void *)v26[5];
    if (v11) {
      *a4 = v11;
    }
  }

  id v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (id)fetchRequestWaitingOnPasscode:(id *)a3
{
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__3101;
  uint64_t v22 = __Block_byref_object_dispose__3102;
  id v23 = 0LL;
  -[SecEscrowRequest connection](self, "connection");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke;
  v17[3] = &unk_189672C48;
  v17[4] = &v18;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = __Block_byref_object_copy__3101;
  id v15 = __Block_byref_object_dispose__3102;
  id v16 = 0LL;
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke_86;
  v10[3] = &unk_189665950;
  v10[4] = &v11;
  v10[5] = &v18;
  [v6 fetchRequestWaitingOnPasscode:v10];
  if (a3)
  {
    v7 = (void *)v19[5];
    if (v7) {
      *a3 = v7;
    }
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

- (id)fetchStatuses:(id *)a3
{
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__3101;
  uint64_t v22 = __Block_byref_object_dispose__3102;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__3101;
  id v16 = __Block_byref_object_dispose__3102;
  id v17 = 0LL;
  -[SecEscrowRequest connection](self, "connection");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __34__SecEscrowRequest_fetchStatuses___block_invoke;
  v11[3] = &unk_189672C48;
  v11[4] = &v18;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v11];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __34__SecEscrowRequest_fetchStatuses___block_invoke_88;
  v10[3] = &unk_189667910;
  v10[4] = &v12;
  v10[5] = &v18;
  [v6 fetchRequestStatuses:v10];
  if (a3)
  {
    v7 = (void *)v19[5];
    if (v7) {
      *a3 = v7;
    }
  }

  id v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (BOOL)resetAllRequests:(id *)a3
{
  uint64_t v13 = 0LL;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__3101;
  id v17 = __Block_byref_object_dispose__3102;
  id v18 = 0LL;
  -[SecEscrowRequest connection](self, "connection");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __37__SecEscrowRequest_resetAllRequests___block_invoke;
  v12[3] = &unk_189672C48;
  v12[4] = &v13;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v12];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = v5;
  v11[1] = 3221225472LL;
  v11[2] = __37__SecEscrowRequest_resetAllRequests___block_invoke_90;
  v11[3] = &unk_189672C48;
  v11[4] = &v13;
  [v6 resetAllRequests:v11];
  v7 = v14;
  if (a3)
  {
    id v8 = (void *)v14[5];
    if (v8)
    {
      *a3 = v8;
      v7 = v14;
    }
  }

  BOOL v9 = v7[5] == 0;

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (unint64_t)storePrerecordsInEscrow:(id *)a3
{
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__3101;
  uint64_t v20 = __Block_byref_object_dispose__3102;
  id v21 = 0LL;
  -[SecEscrowRequest connection](self, "connection");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke;
  v15[3] = &unk_189672C48;
  v15[4] = &v16;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  uint64_t v14 = 0LL;
  v10[0] = v5;
  v10[1] = 3221225472LL;
  v10[2] = __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke_91;
  v10[3] = &unk_189665978;
  v10[4] = &v11;
  v10[5] = &v16;
  [v6 storePrerecordsInEscrow:v10];
  if (a3)
  {
    v7 = (void *)v17[5];
    if (v7) {
      *a3 = v7;
    }
  }

  unint64_t v8 = v12[3];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (BOOL)pendingEscrowUpload:(id *)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v20 = 0LL;
  -[SecEscrowRequest fetchStatuses:](self, "fetchStatuses:", &v20);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v20;
  if (v5)
  {
    secLogObjForScope("escrow");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_1804F4000, v6, OS_LOG_TYPE_DEFAULT, "failed to fetch escrow statuses: %@", buf, 0xCu);
    }

    if (a3)
    {
      char v7 = 0;
      *a3 = v5;
      goto LABEL_23;
    }

- (BOOL)escrowCompletedWithinLastSeconds:(double)a3
{
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 1;
  v10[0] = 0LL;
  v10[1] = v10;
  v10[2] = 0x3032000000LL;
  v10[3] = __Block_byref_object_copy__3101;
  v10[4] = __Block_byref_object_dispose__3102;
  id v11 = 0LL;
  -[SecEscrowRequest connection](self, "connection");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = MEMORY[0x1895F87A8];
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke;
  v9[3] = &unk_189672C48;
  v9[4] = v10;
  [v4 synchronousRemoteObjectProxyWithErrorHandler:v9];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = v5;
  v8[1] = 3221225472LL;
  v8[2] = __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke_93;
  v8[3] = &unk_189667960;
  v8[4] = &v12;
  v8[5] = v10;
  [v6 escrowCompletedWithinLastSeconds:v8 reply:a3];
  LOBYTE(v4) = *((_BYTE *)v13 + 24);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
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

void __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "resetAllRequests: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __53__SecEscrowRequest_escrowCompletedWithinLastSeconds___block_invoke_93( uint64_t a1,  char a2,  void *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  secLogObjForScope("escrow");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, "resetAllRequests: %@", (uint8_t *)&v8, 0xCu);
  }
}

void __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "fetchRequestWaitingOnPasscode: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __44__SecEscrowRequest_storePrerecordsInEscrow___block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  secLogObjForScope("escrow");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v6;
    _os_log_impl(&dword_1804F4000, v7, OS_LOG_TYPE_DEFAULT, "Stored %d records: %@", (uint8_t *)v8, 0x12u);
  }
}

void __37__SecEscrowRequest_resetAllRequests___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "resetAllRequests: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __37__SecEscrowRequest_resetAllRequests___block_invoke_90(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "resetAllRequests: %@", (uint8_t *)&v6, 0xCu);
  }
}

void __34__SecEscrowRequest_fetchStatuses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "requestStatuses: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __34__SecEscrowRequest_fetchStatuses___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  secLogObjForScope("escrow");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL);
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Received statuses: %@ %@", (uint8_t *)&v10, 0x16u);
  }
}

void __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "fetchRequestWaitingOnPasscode: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __50__SecEscrowRequest_fetchRequestWaitingOnPasscode___block_invoke_86(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a3);
  secLogObjForScope("escrow");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl( &dword_1804F4000,  v8,  OS_LOG_TYPE_DEFAULT,  "Received request waiting on passcode: %@ %@",  (uint8_t *)&v9,  0x16u);
  }
}

void __41__SecEscrowRequest_fetchPrerecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "fetchprerecord: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __41__SecEscrowRequest_fetchPrerecord_error___block_invoke_84(void *a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
  secLogObjForScope("escrow");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    int v10 = 138412546;
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    id v13 = v7;
    _os_log_impl(&dword_1804F4000, v8, OS_LOG_TYPE_DEFAULT, "Received prerecord for %@: %@", (uint8_t *)&v10, 0x16u);
  }
}

void __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "cachePrerecord: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __61__SecEscrowRequest_cachePrerecord_serializedPrerecord_error___block_invoke_83(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1804F4000, v5, OS_LOG_TYPE_DEFAULT, "Cached prerecord for %@: %@", (uint8_t *)&v7, 0x16u);
  }
}

void __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "triggerEscrowUpdate: Failed to get XPC connection: %@",  (uint8_t *)&v6,  0xCu);
  }
}

void __54__SecEscrowRequest_triggerEscrowUpdate_options_error___block_invoke_82(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  secLogObjForScope("escrow");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl( &dword_1804F4000,  v5,  OS_LOG_TYPE_DEFAULT,  "Triggered escrow update for '%@': %@",  (uint8_t *)&v7,  0x16u);
  }
}

+ (id)request:(id *)a3
{
  v10[1] = *MEMORY[0x1895F89C0];
  id v4 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.security.escrow-update" options:0];
  if (v4)
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C5412D0];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    SecEscrowRequestSetupControlProtocol(v5);
    objc_claimAutoreleasedReturnValue();

    [v4 setRemoteObjectInterface:v5];
    [v4 resume];
    a3 = -[SecEscrowRequest initWithConnection:](objc_alloc(&OBJC_CLASS___SecEscrowRequest), "initWithConnection:", v4);
  }

  else if (a3)
  {
    uint64_t v6 = (void *)MEMORY[0x189607870];
    uint64_t v9 = *MEMORY[0x1896075E0];
    v10[0] = @"Couldn't create connection (no reason given)";
    [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 errorWithDomain:@"securityd" code:-1 userInfo:v7];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    a3 = 0LL;
  }

  return a3;
}

@end