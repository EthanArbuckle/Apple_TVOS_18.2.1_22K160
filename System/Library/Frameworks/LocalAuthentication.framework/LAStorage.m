@interface LAStorage
+ (id)objectDescription:(id)a3;
+ (id)secureDomainStorage;
+ (unsigned)newInstanceId;
- (BOOL)BOOLForKey:(int64_t)a3;
- (BOOL)BOOLForKey:(int64_t)a3 error:(id *)a4;
- (BOOL)setBool:(BOOL)a3 forKey:(int64_t)a4 error:(id *)a5;
- (BOOL)setData:(id)a3 forKey:(int64_t)a4 error:(id *)a5;
- (LAContext)authenticationContext;
- (LASecureStorageService)remoteObjectProxy;
- (LAStorage)initWithDomain:(int64_t)a3 authenticationContext:(id)a4;
- (NSXPCConnection)connection;
- (__SecAccessControl)accessControl;
- (__SecAccessControl)accessControlForKey:(int64_t)a3 error:(id *)a4;
- (id)dataForKey:(int64_t)a3;
- (id)dataForKey:(int64_t)a3 error:(id *)a4;
- (id)description;
- (id)exchangeData:(id)a3 forKey:(int64_t)a4 error:(id *)a5;
- (id)numberForKey:(int64_t)a3;
- (id)numberForKey:(int64_t)a3 error:(id *)a4;
- (int64_t)domain;
- (unsigned)instanceId;
- (void)BOOLForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)_bootstrapServiceType:(id)a3 completionHandler:(id)a4;
- (void)_bootstrapServiceWithAuthenticationPolicy:(int64_t)a3 proxyBlock:(id)a4 completionHandler:(id)a5;
- (void)_callProxyBlock:(id)a3 authenticationPolicy:(int64_t)a4 completionHandler:(id)a5;
- (void)_class:(Class)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
- (void)_connectToEndpoint:(id)a3;
- (void)_resetConnection;
- (void)dataForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)exchangeData:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
- (void)numberForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)objectForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)removeObjectForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)setAccessControl:(__SecAccessControl *)a3;
- (void)setBool:(BOOL)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
- (void)setObject:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5;
@end

@implementation LAStorage

+ (id)secureDomainStorage
{
  return  -[LAStorage initWithDomain:authenticationContext:]( objc_alloc(&OBJC_CLASS___LAStorage),  "initWithDomain:authenticationContext:",  0LL,  0LL);
}

- (LAStorage)initWithDomain:(int64_t)a3 authenticationContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LAStorage;
  v8 = -[LAStorage init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_domain = a3;
    objc_storeStrong((id *)&v8->_authenticationContext, a4);
    v9->_instanceId = +[LAStorage newInstanceId](&OBJC_CLASS___LAStorage, "newInstanceId");
    LA_LOG();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_186EAF000, v10, OS_LOG_TYPE_DEFAULT, "Created %@", buf, 0xCu);
    }
  }

  return v9;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___LAStorage;
  -[LAStorage dealloc](&v4, sel_dealloc);
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_super v4 = (void *)NSString;
  uint64_t v5 = -[LAStorage instanceId](self, "instanceId");
  uint64_t v6 = v5;
  if (v3)
  {
    -[LAStorage authenticationContext](self, "authenticationContext");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"LAStorage[%u] bound with %@", v6, v7];
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    objc_msgSend(v4, "stringWithFormat:", @"LAStorage[%u]", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (unsigned)newInstanceId
{
  return ++_instanceCounter;
}

+ (id)objectDescription:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v4 = [v3 description];
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0) {
        objc_msgSend(NSString, "stringWithFormat:", @"data[%d]", objc_msgSend(v3, "length"));
      }
      else {
      uint64_t v4 = [NSString stringWithFormat:@"unsupported object: %@", v3];
      }
    }

    uint64_t v5 = (void *)v4;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)setObject:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  v10 = +[LAStorage objectDescription:](&OBJC_CLASS___LAStorage, "objectDescription:", v8);
  v11 = -[LAStorage description](self, "description");
  LA_LOG();
  objc_super v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    int v37 = a4;
    __int16 v38 = 2114;
    v39 = v10;
    __int16 v40 = 2114;
    v41 = v11;
    _os_log_impl(&dword_186EAF000, v12, OS_LOG_TYPE_INFO, "Setting key %d with %{public}@ on %{public}@", buf, 0x1Cu);
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  v31[0] = MEMORY[0x1895F87A8];
  v31[1] = 3221225472LL;
  v31[2] = __48__LAStorage_setObject_forKey_completionHandler___block_invoke;
  v31[3] = &unk_189F997A0;
  int64_t v35 = a4;
  id v14 = v10;
  id v32 = v14;
  id v15 = v11;
  id v33 = v15;
  id v16 = v9;
  id v34 = v16;
  v17 = (void (**)(void, void, void))MEMORY[0x18959CD0C](v31);
  v18 = (objc_class *)[MEMORY[0x1896107F8] classForKey:a4];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v19 = v8;
    }

    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x189608798] storageErrorWithCode:1 message:@"Expected NSData or NSNumber."];
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        ((void (**)(void, void, id))v17)[2](v17, 0LL, v22);
        goto LABEL_11;
      }

      buf[0] = [v8 BOOLValue];
      [MEMORY[0x189603F48] dataWithBytes:buf length:1];
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }

    v25 = v19;
    uint64_t v26 = [MEMORY[0x1896107F8] policyForKey:a4 operation:2 value:v8];
    v27[0] = v13;
    v27[1] = 3221225472LL;
    v27[2] = __48__LAStorage_setObject_forKey_completionHandler___block_invoke_19;
    v27[3] = &unk_189F997C8;
    id v28 = v25;
    v29 = self;
    int64_t v30 = a4;
    id v22 = v25;
    -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:]( self,  "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:",  v26,  v27,  v17);
  }

  else
  {
    v20 = (void *)MEMORY[0x189608798];
    v21 = (void *)NSString;
    NSStringFromClass(v18);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [v21 stringWithFormat:@"%@ value expected", v22];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 storageErrorWithCode:1 message:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v17)[2](v17, 0LL, v24);
  }

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  LA_LOG();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[7];
      uint64_t v9 = a1[4];
      uint64_t v10 = a1[5];
      v11[0] = 67109634;
      v11[1] = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      uint64_t v15 = v10;
      _os_log_impl( &dword_186EAF000,  v7,  OS_LOG_TYPE_DEFAULT,  "Key %d set successfully with %{public}@ on %{public}@",  (uint8_t *)v11,  0x1Cu);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__LAStorage_setObject_forKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [v6 accessControl];
  if (v9)
  {
    [*(id *)(a1 + 40) accessControl];
    id v13 = (id)SecAccessControlCopyData();
  }

  else
  {
    id v13 = 0LL;
  }

  uint64_t v10 = *(void *)(a1 + 48);
  [*(id *)(a1 + 40) authenticationContext];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 uuid];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setObject:v5 acl:v13 forKey:v10 contextUUID:v12 completionHandler:v7];

  if (v9) {
}
  }

- (void)objectForKey:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[LAStorage description](self, "description");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = a3;
    __int16 v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_186EAF000, v8, OS_LOG_TYPE_INFO, "Querying key %d on %{public}@", buf, 0x12u);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __44__LAStorage_objectForKey_completionHandler___block_invoke;
  v14[3] = &unk_189F997F0;
  id v16 = v6;
  int64_t v17 = a3;
  id v15 = v7;
  id v10 = v6;
  id v11 = v7;
  __int16 v12 = (void *)MEMORY[0x18959CD0C](v14);
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __44__LAStorage_objectForKey_completionHandler___block_invoke_21;
  v13[3] = &unk_189F99818;
  v13[4] = self;
  v13[5] = a3;
  -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:]( self,  "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:",  [MEMORY[0x1896107F8] policyForKey:a3 operation:1 value:0],  v13,  v12);
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LA_LOG();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v5 || !a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[6];
      +[LAStorage objectDescription:](&OBJC_CLASS___LAStorage, "objectDescription:", v5);
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = a1[4];
      v12[0] = 67109634;
      v12[1] = v9;
      __int16 v13 = 2114;
      __int16 v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl( &dword_186EAF000,  v8,  OS_LOG_TYPE_DEFAULT,  "Query of key %d returned %{public}@ on %{public}@",  (uint8_t *)v12,  0x1Cu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __44__LAStorage_objectForKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[5] + 16LL))();
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  [v5 authenticationContext];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 uuid];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKey:v4 contextUUID:v8 completionHandler:v6];
}

- (void)removeObjectForKey:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  -[LAStorage description](self, "description");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    int v19 = a3;
    __int16 v20 = 2114;
    v21 = v7;
    _os_log_impl(&dword_186EAF000, v8, OS_LOG_TYPE_INFO, "Removing key %d on %{public}@", buf, 0x12u);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __50__LAStorage_removeObjectForKey_completionHandler___block_invoke;
  v14[3] = &unk_189F997F0;
  id v16 = v6;
  int64_t v17 = a3;
  id v15 = v7;
  id v10 = v6;
  id v11 = v7;
  __int16 v12 = (void *)MEMORY[0x18959CD0C](v14);
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_22;
  v13[3] = &unk_189F99818;
  v13[4] = self;
  v13[5] = a3;
  -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:]( self,  "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:",  [MEMORY[0x1896107F8] policyForKey:a3 operation:3 value:0],  v13,  v12);
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke(void *a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  LA_LOG();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[6];
      uint64_t v9 = a1[4];
      v10[0] = 67109378;
      v10[1] = v8;
      __int16 v11 = 2114;
      uint64_t v12 = v9;
      _os_log_impl(&dword_186EAF000, v7, OS_LOG_TYPE_DEFAULT, "Removed key %d on %{public}@", (uint8_t *)v10, 0x12u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[5] + 16LL))();
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_22(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  [v5 authenticationContext];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 uuid];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 removeObjectForKey:v4 contextUUID:v8 completionHandler:v6];
}

- (void)exchangeData:(id)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  +[LAStorage objectDescription:](&OBJC_CLASS___LAStorage, "objectDescription:", v8);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAStorage description](self, "description");
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  LA_LOG();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109634;
    HIDWORD(buf) = a4;
    __int16 v29 = 2114;
    int64_t v30 = v10;
    __int16 v31 = 2114;
    id v32 = v11;
    _os_log_impl( &dword_186EAF000,  v12,  OS_LOG_TYPE_INFO,  "Exchanging data with key %d with %{public}@ on %{public}@",  (uint8_t *)&buf,  0x1Cu);
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke;
  v23[3] = &unk_189F997A0;
  int64_t v27 = a4;
  id v14 = v10;
  id v24 = v14;
  id v15 = v11;
  id v25 = v15;
  id v16 = v9;
  id v26 = v16;
  int64_t v17 = (void (**)(void, void, void))MEMORY[0x18959CD0C](v23);
  if ([MEMORY[0x1896107F8] isKeyAvailableForDataExchange:a4])
  {
    uint64_t v18 = [MEMORY[0x1896107F8] policyForKey:a4 operation:4 value:v8];
    objc_initWeak(&buf, self);
    v20[0] = v13;
    v20[1] = 3221225472LL;
    v20[2] = __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_25;
    v20[3] = &unk_189F99840;
    objc_copyWeak(v22, &buf);
    id v21 = v8;
    v22[1] = (id)a4;
    -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:]( self,  "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:",  v18,  v20,  v17);

    objc_destroyWeak(v22);
    objc_destroyWeak(&buf);
  }

  else
  {
    [MEMORY[0x189608798] storageErrorWithCode:4 message:@"key does not support data exchange"];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(void, void, void *))v17)[2](v17, 0LL, v19);
  }
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a2;
  LA_LOG();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = a1[7];
      uint64_t v10 = a1[4];
      uint64_t v11 = a1[5];
      v12[0] = 67109634;
      v12[1] = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      __int16 v15 = 2114;
      uint64_t v16 = v11;
      _os_log_impl( &dword_186EAF000,  v8,  OS_LOG_TYPE_DEFAULT,  "Key %d data exchanged successfully with %{public}@ on %{public}@",  (uint8_t *)v12,  0x1Cu);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[6] + 16LL))();
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = [WeakRetained accessControl];
    if (v9)
    {
      [v7 accessControl];
      uint64_t v10 = (void *)SecAccessControlCopyData();
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    uint64_t v11 = *(void *)(a1 + 48);
    [v7 authenticationContext];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 uuid];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setObject:v8 acl:v10 forKey:v11 contextUUID:v13 completionHandler:v5];

    if (v9) {
  }
    }
}

- (__SecAccessControl)accessControlForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  int v19 = __Block_byref_object_copy__1;
  __int16 v20 = __Block_byref_object_dispose__1;
  id v21 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  __int16 v13 = __Block_byref_object_copy__1;
  id v14 = __Block_byref_object_dispose__1;
  id v15 = 0LL;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __39__LAStorage_accessControlForKey_error___block_invoke;
  v9[3] = &unk_189F99818;
  v9[4] = self;
  v9[5] = a3;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __39__LAStorage_accessControlForKey_error___block_invoke_2;
  v8[3] = &unk_189F99658;
  v8[4] = &v16;
  v8[5] = &v10;
  -[LAStorage _bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:]( self,  "_bootstrapServiceWithAuthenticationPolicy:proxyBlock:completionHandler:",  0LL,  v9,  v8);
  if (!v17[5])
  {
    id v5 = 0LL;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v5 = (__SecAccessControl *)SecAccessControlCreateFromData();
  if (v5)
  {
    id v6 = (void *)v11[5];
    v11[5] = 0LL;
  }

  if (a4) {
LABEL_5:
  }
    *a4 = (id) v11[5];
LABEL_6:
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v5;
}

void __39__LAStorage_accessControlForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  [v5 authenticationContext];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 uuid];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 aclForKey:v4 contextUUID:v8 completionHandler:v6];
}

void __39__LAStorage_accessControlForKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)setBool:(BOOL)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = (void *)MEMORY[0x189607968];
  id v9 = a5;
  [v8 numberWithBool:v6];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[LAStorage setObject:forKey:completionHandler:](self, "setObject:forKey:completionHandler:", v10, a4, v9);
}

- (void)BOOLForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __42__LAStorage_BOOLForKey_completionHandler___block_invoke;
  v9[3] = &unk_189F99868;
  id v10 = v6;
  id v8 = v6;
  -[LAStorage _class:forKey:completionHandler:](self, "_class:forKey:completionHandler:", v7, a3, v9);
}

void __42__LAStorage_BOOLForKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, [a2 BOOLValue], v5);
}

- (void)dataForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  -[LAStorage _class:forKey:completionHandler:](self, "_class:forKey:completionHandler:", objc_opt_class(), a3, v6);
}

- (void)_class:(Class)a3 forKey:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  _DWORD v10[2] = __45__LAStorage__class_forKey_completionHandler___block_invoke;
  v10[3] = &unk_189F99890;
  id v11 = v8;
  Class v12 = a3;
  id v9 = v8;
  -[LAStorage objectForKey:completionHandler:](self, "objectForKey:completionHandler:", a4, v10);
}

void __45__LAStorage__class_forKey_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v7 = *(void *)(a1 + 32);
    if ((isKindOfClass & 1) != 0)
    {
      (*(void (**)(uint64_t, id, void))(v7 + 16))(v7, v9, 0LL);
    }

    else
    {
      [MEMORY[0x189608798] storageErrorWithCode:2 message:@"Internal error - unexpected data type" suberror:0];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0LL, v8);
    }
  }

  else
  {
    (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16LL))(*(void *)(a1 + 32), 0LL, v5);
  }
}

- (BOOL)setBool:(BOOL)a3 forKey:(int64_t)a4 error:(id *)a5
{
  uint64_t v9 = 0LL;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  Class v12 = __Block_byref_object_copy__1;
  __int16 v13 = __Block_byref_object_dispose__1;
  id v14 = 0LL;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __34__LAStorage_setBool_forKey_error___block_invoke;
  v8[3] = &unk_189F998B8;
  v8[4] = &v9;
  -[LAStorage setBool:forKey:completionHandler:](self, "setBool:forKey:completionHandler:", a3, a4, v8);
  if (a5) {
    *a5 = (id) v10[5];
  }
  BOOL v6 = v10[5] == 0;
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __34__LAStorage_setBool_forKey_error___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)setData:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v12 = 0LL;
  __int16 v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  _DWORD v11[2] = __34__LAStorage_setData_forKey_error___block_invoke;
  v11[3] = &unk_189F998B8;
  v11[4] = &v12;
  -[LAStorage setData:forKey:completionHandler:](self, "setData:forKey:completionHandler:", v8, a4, v11);
  if (a5) {
    *a5 = (id) v13[5];
  }
  BOOL v9 = v13[5] == 0;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __34__LAStorage_setData_forKey_error___block_invoke(uint64_t a1, void *a2)
{
}

- (BOOL)BOOLForKey:(int64_t)a3
{
  return -[LAStorage BOOLForKey:error:](self, "BOOLForKey:error:", a3, 0LL);
}

- (BOOL)BOOLForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __30__LAStorage_BOOLForKey_error___block_invoke;
  v7[3] = &unk_189F99680;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAStorage BOOLForKey:completionHandler:](self, "BOOLForKey:completionHandler:", a3, v7);
  if (a4) {
    *a4 = (id) v9[5];
  }
  char v5 = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __30__LAStorage_BOOLForKey_error___block_invoke(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), obj);
}

- (id)dataForKey:(int64_t)a3
{
  return -[LAStorage dataForKey:error:](self, "dataForKey:error:", a3, 0LL);
}

- (id)dataForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  char v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  BOOL v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __30__LAStorage_dataForKey_error___block_invoke;
  v7[3] = &unk_189F996A8;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAStorage dataForKey:completionHandler:](self, "dataForKey:completionHandler:", a3, v7);
  if (a4) {
    *a4 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __30__LAStorage_dataForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)numberForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  -[LAStorage _class:forKey:completionHandler:](self, "_class:forKey:completionHandler:", objc_opt_class(), a3, v6);
}

- (id)numberForKey:(int64_t)a3
{
  return -[LAStorage numberForKey:error:](self, "numberForKey:error:", a3, 0LL);
}

- (id)numberForKey:(int64_t)a3 error:(id *)a4
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  char v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  id v11 = __Block_byref_object_copy__1;
  uint64_t v12 = __Block_byref_object_dispose__1;
  id v13 = 0LL;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __32__LAStorage_numberForKey_error___block_invoke;
  v7[3] = &unk_189F998E0;
  v7[4] = &v14;
  v7[5] = &v8;
  -[LAStorage numberForKey:completionHandler:](self, "numberForKey:completionHandler:", a3, v7);
  if (a4) {
    *a4 = (id) v9[5];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __32__LAStorage_numberForKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (id)exchangeData:(id)a3 forKey:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__1;
  uint64_t v22 = __Block_byref_object_dispose__1;
  id v23 = 0LL;
  uint64_t v12 = 0LL;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  id v15 = __Block_byref_object_copy__1;
  uint64_t v16 = __Block_byref_object_dispose__1;
  id v17 = 0LL;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  _DWORD v11[2] = __39__LAStorage_exchangeData_forKey_error___block_invoke;
  v11[3] = &unk_189F996A8;
  v11[4] = &v18;
  void v11[5] = &v12;
  -[LAStorage exchangeData:forKey:completionHandler:](self, "exchangeData:forKey:completionHandler:", v8, a4, v11);
  if (a5) {
    *a5 = (id) v13[5];
  }
  id v9 = (id)v19[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __39__LAStorage_exchangeData_forKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)_bootstrapServiceWithAuthenticationPolicy:(int64_t)a3 proxyBlock:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  -[LAStorage remoteObjectProxy](self, "remoteObjectProxy");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[LAStorage _callProxyBlock:authenticationPolicy:completionHandler:]( self,  "_callProxyBlock:authenticationPolicy:completionHandler:",  v8,  a3,  v9);
  }

  else
  {
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    _DWORD v11[2] = __84__LAStorage__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler___block_invoke;
    v11[3] = &unk_189F99908;
    v11[4] = self;
    id v12 = v8;
    int64_t v14 = a3;
    id v13 = v9;
    -[LAStorage _bootstrapServiceType:completionHandler:]( self,  "_bootstrapServiceType:completionHandler:",  @"kLAServiceTypeSecureStorage",  v11);
  }
}

uint64_t __84__LAStorage__bootstrapServiceWithAuthenticationPolicy_proxyBlock_completionHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
  [*(id *)(a1 + 32) _connectToEndpoint:a2];
  return [*(id *)(a1 + 32) _callProxyBlock:*(void *)(a1 + 40) authenticationPolicy:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
}

- (void)_connectToEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v4];
  connection = self->_connection;
  self->_connection = v5;

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B41C0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[LAStorage connection](self, "connection");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 setRemoteObjectInterface:v7];

  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __32__LAStorage__connectToEndpoint___block_invoke;
  v20[3] = &unk_189F991F8;
  objc_copyWeak(&v21, &location);
  -[LAStorage connection](self, "connection");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setInterruptionHandler:v20];

  v18[0] = v9;
  v18[1] = 3221225472LL;
  v18[2] = __32__LAStorage__connectToEndpoint___block_invoke_2;
  v18[3] = &unk_189F991F8;
  objc_copyWeak(&v19, &location);
  -[LAStorage connection](self, "connection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setInvalidationHandler:v18];

  -[LAStorage connection](self, "connection");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 resume];

  -[LAStorage connection](self, "connection");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v9;
  v16[1] = 3221225472LL;
  v16[2] = __32__LAStorage__connectToEndpoint___block_invoke_3;
  v16[3] = &unk_189F99930;
  objc_copyWeak(&v17, &location);
  [v13 synchronousRemoteObjectProxyWithErrorHandler:v16];
  int64_t v14 = (LASecureStorageService *)objc_claimAutoreleasedReturnValue();
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __32__LAStorage__connectToEndpoint___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

void __32__LAStorage__connectToEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

void __32__LAStorage__connectToEndpoint___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  LA_LOG();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __32__LAStorage__connectToEndpoint___block_invoke_3_cold_1(a1, (uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetConnection];
}

- (void)_resetConnection
{
  remoteObjectProxy = self->_remoteObjectProxy;
  self->_remoteObjectProxy = 0LL;
}

- (void)_bootstrapServiceType:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[LAStorage authenticationContext](self, "authenticationContext");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = (void *)objc_opt_new();
  }

  uint64_t v10 = -[LAStorage authenticationContext](self, "authenticationContext");
  id v11 = (void *)v10;
  if (v10) {
    id v12 = (void *)v10;
  }
  else {
    id v12 = v9;
  }
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __53__LAStorage__bootstrapServiceType_completionHandler___block_invoke;
  v15[3] = &unk_189F99958;
  id v16 = v9;
  id v17 = v6;
  id v13 = v9;
  id v14 = v6;
  [v12 bootstrapServiceType:v7 completionHandler:v15];
}

uint64_t __53__LAStorage__bootstrapServiceType_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_callProxyBlock:(id)a3 authenticationPolicy:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  -[LAStorage remoteObjectProxy](self, "remoteObjectProxy");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke;
  v14[3] = &unk_189F999A8;
  void v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  int64_t v17 = a4;
  id v11 = (void (*)(void *, void *, void *))v8[2];
  id v12 = v8;
  id v13 = v9;
  v11(v12, v10, v14);
}

void __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (!v5
    && [MEMORY[0x189608798] storageError:v6 hasCode:0]
    && ([*(id *)(a1 + 32) authenticationContext],
        (id v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
    && (uint64_t v8 = *(void *)(a1 + 56), v7, v8))
  {
    [*(id *)(a1 + 32) authenticationContext];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 uiDelegate];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (LA_LOG_INTERACTIVE_once != -1) {
        dispatch_once(&LA_LOG_INTERACTIVE_once, &__block_literal_global_193);
      }
      id v11 = (os_log_s *)LA_LOG_INTERACTIVE_log;
      if (os_log_type_enabled((os_log_t)LA_LOG_INTERACTIVE_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        uint64_t v13 = *(void *)(a1 + 56);
        *(_DWORD *)id buf = 138543618;
        uint64_t v22 = v12;
        __int16 v23 = 1024;
        int v24 = v13;
        _os_log_impl( &dword_186EAF000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will invoke authentication using policy %d",  buf,  0x12u);
      }

      [*(id *)(a1 + 32) authenticationContext];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke_101;
      v18[3] = &unk_189F99980;
      void v18[4] = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 56);
      id v19 = *(id *)(a1 + 48);
      id v20 = *(id *)(a1 + 40);
      [v14 evaluatePolicy:v15 options:0 reply:v18];
    }

    else
    {
      uint64_t v16 = *(void *)(a1 + 40);
      [MEMORY[0x189608798] storageErrorWithCode:0 message:@"Policy can't be satisfied without UI delegate."];
      int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0LL, v17);
    }
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

uint64_t __68__LAStorage__callProxyBlock_authenticationPolicy_completionHandler___block_invoke_101( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _callProxyBlock:*(void *)(a1 + 40) authenticationPolicy:0 completionHandler:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

- (int64_t)domain
{
  return self->_domain;
}

- (__SecAccessControl)accessControl
{
  return self->_accessControl;
}

- (void)setAccessControl:(__SecAccessControl *)a3
{
  self->_accessControl = a3;
}

- (LAContext)authenticationContext
{
  return self->_authenticationContext;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (LASecureStorageService)remoteObjectProxy
{
  return self->_remoteObjectProxy;
}

- (unsigned)instanceId
{
  return self->_instanceId;
}

- (void).cxx_destruct
{
}

void __48__LAStorage_setObject_forKey_completionHandler___block_invoke_cold_1()
{
}

void __44__LAStorage_objectForKey_completionHandler___block_invoke_cold_1()
{
}

void __50__LAStorage_removeObjectForKey_completionHandler___block_invoke_cold_1()
{
}

void __51__LAStorage_exchangeData_forKey_completionHandler___block_invoke_cold_1()
{
}

void __32__LAStorage__connectToEndpoint___block_invoke_3_cold_1(uint64_t a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = 138543618;
  id v7 = WeakRetained;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl( &dword_186EAF000,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ has encountered XPC error on remote proxy: %{public}@",  (uint8_t *)&v6,  0x16u);
}

@end