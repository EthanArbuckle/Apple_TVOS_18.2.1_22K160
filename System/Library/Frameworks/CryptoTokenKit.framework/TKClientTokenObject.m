@interface TKClientTokenObject
- (BOOL)bumpKeyWithError:(id *)a3;
- (BOOL)commitKeyWithError:(id *)a3;
- (BOOL)deleteWithError:(id *)a3;
- (NSData)accessControl;
- (NSData)objectID;
- (NSData)publicKey;
- (NSData)value;
- (NSDictionary)keychainAttributes;
- (TKClientTokenObject)initWithSession:(id)a3 objectID:(id)a4 attributes:(id)a5;
- (TKClientTokenSession)session;
- (__SecAccessControl)accessControlRef;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)attestKeyObject:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)decapsulate:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)decrypt:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)exchangeKey:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
- (id)operationResult:(id)a3 error:(id *)a4;
- (id)sign:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6;
- (void)accessControlRef;
@end

@implementation TKClientTokenObject

- (__SecAccessControl)accessControlRef
{
  if (!self->_accessControlRef)
  {
    v3 = -[TKClientTokenObject accessControl](self, "accessControl");
    if (v3)
    {
      id v9 = 0LL;
      v4 = -[TKClientTokenObject accessControl](self, "accessControl");
      v5 = (void *)SecAccessControlCreateFromData();
      id accessControlRef = self->_accessControlRef;
      self->_id accessControlRef = v5;

      if (!self->_accessControlRef)
      {
        TK_LOG_client_0();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          -[TKClientTokenObject accessControlRef].cold.1((uint64_t *)&v9, self, v7);
        }
      }
    }
  }

  return (__SecAccessControl *)self->_accessControlRef;
}

- (TKClientTokenObject)initWithSession:(id)a3 objectID:(id)a4 attributes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___TKClientTokenObject;
  v12 = -[TKClientTokenObject init](&v23, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_session, a3);
    objc_storeStrong((id *)&v13->_objectID, a4);
    uint64_t v14 = [v11 objectForKeyedSubscript:@"pubk"];
    publicKey = v13->_publicKey;
    v13->_publicKey = (NSData *)v14;

    uint64_t v16 = [v11 objectForKeyedSubscript:*MEMORY[0x18960B818]];
    accessControl = v13->_accessControl;
    v13->_accessControl = (NSData *)v16;

    uint64_t v18 = [v11 objectForKeyedSubscript:*MEMORY[0x18960BE78]];
    value = v13->_value;
    v13->_value = (NSData *)v18;

    v20 = (NSDictionary *)[v11 mutableCopy];
    -[NSDictionary removeObjectForKey:](v20, "removeObjectForKey:", @"pubk");
    keychainAttributes = v13->_keychainAttributes;
    v13->_keychainAttributes = v20;
  }

  return v13;
}

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  if (a7)
  {
    objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  @"CryptoTokenKit",  -1,  MEMORY[0x189604A60],  a6);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)operationResult:(id)a3 error:(id *)a4
{
  id v7 = a3;
  if ([v7 isEqual:MEMORY[0x189604A88]])
  {
    [MEMORY[0x189603F48] data];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    id v11 = v8;
    goto LABEL_11;
  }

  [MEMORY[0x189603FE8] null];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v7 isEqual:v9];

  if (!v10)
  {
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x1896077D8] currentHandler];
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 handleFailureInMethod:a2, self, @"TKClientToken.m", 275, @"Unexpected result: %@", v7 object file lineNumber description];
      }
    }

    id v8 = v7;
    goto LABEL_10;
  }

  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    id v11 = 0LL;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = 0LL;
  }

- (id)sign:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decrypt:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)exchangeKey:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)decapsulate:(id)a3 algorithms:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v8, a6);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  if (a4)
  {
    v15 = @"nonce";
    v16[0] = a4;
    id v9 = (void *)MEMORY[0x189603F68];
    id v10 = a4;
    [v9 dictionaryWithObjects:v16 forKeys:&v15 count:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v11 = (void *)MEMORY[0x189604A60];
  }
  v12 = -[TKClientTokenObject operation:data:algorithms:parameters:error:]( self,  "operation:data:algorithms:parameters:error:",  1000LL,  v8,  MEMORY[0x189604A58],  v11,  a5);
  v13 = -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v12, a5);
  return v13;
}

- (id)attestKeyObject:(id)a3 nonce:(id)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v21 = @"attesteeSystemSession";
  id v10 = (void *)MEMORY[0x189607968];
  [v8 session];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 parameters];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 objectForKeyedSubscript:@"forceSystemSession"];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithBool:", objc_msgSend(v13, "BOOLValue"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (void *)[v15 mutableCopy];

  if (v9) {
    [v16 setObject:v9 forKeyedSubscript:@"nonce"];
  }
  [v8 objectID];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKClientTokenObject operation:data:algorithms:parameters:error:]( self,  "operation:data:algorithms:parameters:error:",  1000LL,  v17,  MEMORY[0x189604A58],  v16,  a5);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v18, a5);
  return v19;
}

- (BOOL)bumpKeyWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKClientTokenObject operation:data:algorithms:parameters:error:]( self,  "operation:data:algorithms:parameters:error:",  1001LL,  v5,  MEMORY[0x189604A58],  MEMORY[0x189604A60],  a3);
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v6, a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v7 != 0LL;

  return (char)a3;
}

- (BOOL)commitKeyWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKClientTokenObject operation:data:algorithms:parameters:error:]( self,  "operation:data:algorithms:parameters:error:",  1002LL,  v5,  MEMORY[0x189604A58],  MEMORY[0x189604A60],  a3);
  -[TKClientTokenObject operationResult:error:](self, "operationResult:error:", v6, a3);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v7 != 0LL;

  return (char)a3;
}

- (BOOL)deleteWithError:(id *)a3
{
  if (a3)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:MEMORY[0x189604A60]];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (TKClientTokenSession)session
{
  return self->_session;
}

- (NSData)objectID
{
  return self->_objectID;
}

- (NSData)accessControl
{
  return self->_accessControl;
}

- (NSData)value
{
  return self->_value;
}

- (NSData)publicKey
{
  return self->_publicKey;
}

- (NSDictionary)keychainAttributes
{
  return self->_keychainAttributes;
}

- (void).cxx_destruct
{
}

- (void)accessControlRef
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a1;
  [a2 accessControl];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2114;
  id v9 = v5;
  _os_log_error_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_ERROR,  "Failed to create AC from data: %{public}@ (AC data: %{public}@)",  (uint8_t *)&v6,  0x16u);
}

@end