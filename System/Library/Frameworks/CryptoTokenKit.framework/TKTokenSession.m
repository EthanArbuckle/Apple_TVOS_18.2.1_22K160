@interface TKTokenSession
+ (id)_localizedString:(id)a3 value:(id)a4;
- ($115C4C562B26FF47E01F9F4EA65B5887)creatorAuditToken;
- (BOOL)checkOperation:(int64_t)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6;
- (LAContext)LAContext;
- (NSDictionary)parameters;
- (NSNumber)callerPID;
- (NSString)name;
- (NSXPCConnection)caller;
- (OS_dispatch_queue)queue;
- (TKToken)token;
- (TKTokenSession)initWithToken:(TKToken *)token;
- (id)delegate;
- (id)errorWithResult:(id)a3 operation:(id)a4 forError:(id)a5;
- (id)keepAlive;
- (void)attestKey:(id)a3 usingKey:(id)a4 nonce:(id)a5 reply:(id)a6;
- (void)beginAuthForOperation:(int64_t)a3 constraint:(id)a4 reply:(id)a5;
- (void)bumpKey:(id)a3 reply:(id)a4;
- (void)commitKey:(id)a3 reply:(id)a4;
- (void)createObjectWithAttributes:(id)a3 reply:(id)a4;
- (void)decapsulateSharedKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6;
- (void)decryptData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7;
- (void)deleteObject:(id)a3 reply:(id)a4;
- (void)evaluateAccessControl:(id)a3 forOperation:(id)a4 reply:(id)a5;
- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 reply:(id)a5;
- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 retry:(BOOL)a5 reply:(id)a6;
- (void)finalizeAuthOperation:(id)a3 evaluatedAuthOperation:(id)a4 reply:(id)a5;
- (void)getAdvertisedItemsWithReply:(id)a3;
- (void)getAttributesOfObject:(id)a3 isCertificate:(BOOL)a4 reply:(id)a5;
- (void)objectID:(id)a3 operation:(int64_t)a4 inputData:(id)a5 algorithms:(id)a6 parameters:(id)a7 reply:(id)a8;
- (void)performKeyExchangeWithPublicKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7;
- (void)setCaller:(id)a3;
- (void)setCallerPID:(id)a3;
- (void)setCreatorAuditToken:(id *)a3;
- (void)setDelegate:(id)delegate;
- (void)setKeepAlive:(id)a3;
- (void)setLAContext:(id)a3;
- (void)setParameters:(id)a3;
- (void)signData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6;
- (void)terminate;
@end

@implementation TKTokenSession

- (TKTokenSession)initWithToken:(TKToken *)token
{
  v5 = token;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TKTokenSession;
  v6 = -[TKTokenSession init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_token, token);
    v8 = (void *)NSString;
    v9 = -[TKToken tokenID](v5, "tokenID");
    id v10 = [v8 stringWithFormat:@"session:%@", v9];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;
  }

  return v7;
}

+ (id)_localizedString:(id)a3 value:(id)a4
{
  v5 = (void *)MEMORY[0x1896077F8];
  id v6 = a4;
  id v7 = a3;
  [v5 bundleWithIdentifier:@"com.apple.CryptoTokenKit"];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 localizedStringForKey:v7 value:v6 table:0];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)setLAContext:(id)a3
{
}

- (void)setCaller:(id)a3
{
}

- (void)getAttributesOfObject:(id)a3 isCertificate:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = -[TKTokenSession privateDelegate](self, "privateDelegate");
    id v51 = 0LL;
    [v12 tokenSession:self attributesOfObject:v8 error:&v51];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v51;
    v15 = (void *)[v13 mutableCopy];

    if (v15)
    {
      if (v6) {
        +[TKTokenID encodedCertificateID:](&OBJC_CLASS___TKTokenID, "encodedCertificateID:", v8);
      }
      else {
        +[TKTokenID encodedKeyID:](&OBJC_CLASS___TKTokenID, "encodedKeyID:", v8);
      }
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setObject:v36 forKeyedSubscript:*MEMORY[0x18960BAD8]];

      uint64_t v37 = *MEMORY[0x18960B818];
      [v15 objectForKeyedSubscript:*MEMORY[0x18960B818]];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (v38)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v39 = SecAccessControlCopyData();

          [v15 setObject:v39 forKeyedSubscript:v37];
          v38 = (void *)v39;
        }
      }
    }

    v9[2](v9, v15, v14);
  }

  else
  {
    v41 = self;
    v42 = v9;
    id v16 = v8;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    v17 = -[TKTokenSession token](self, "token");
    [v17 configuration];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 keychainItems];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v19 = [v14 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v48;
      while (2)
      {
        for (uint64_t i = 0LL; i != v20; ++i)
        {
          if (*(void *)v48 != v21) {
            objc_enumerationMutation(v14);
          }
          v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || v6)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v6) {
              continue;
            }
          }

          [v23 objectID];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          int v25 = [v24 isEqual:v16];

          if (v25)
          {
            [v23 keychainAttributes];
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = v42;
            v42[2](v42, v35, 0LL);

            id v8 = v16;
            goto LABEL_36;
          }
        }

        uint64_t v20 = [v14 countByEnumeratingWithState:&v47 objects:v53 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    id v8 = v16;
    if (!v6)
    {
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      v26 = -[TKTokenSession token](v41, "token");
      [v26 configuration];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 keychainItems];
      id v14 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v28 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v44;
        while (2)
        {
          for (uint64_t j = 0LL; j != v29; ++j)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v14);
            }
            v32 = *(void **)(*((void *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              [v32 objectID];
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              int v34 = [v33 isEqual:v8];

              if (v34)
              {
                [v32 keychainAttributes];
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = v42;
                v42[2](v42, v40, 0LL);

                goto LABEL_36;
              }
            }
          }

          uint64_t v29 = [v14 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v29) {
            continue;
          }
          break;
        }
      }
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:0];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v42;
    v42[2](v42, 0LL, v14);
  }

- (void)beginAuthForOperation:(int64_t)a3 constraint:(id)a4 reply:(id)a5
{
  id v8 = a4;
  v9 = (void (**)(id, void *, id))a5;
  -[TKTokenSession delegate](self, "delegate");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v12 = -[TKTokenSession delegate](self, "delegate");
    id v16 = 0LL;
    [v12 tokenSession:self beginAuthForOperation:a3 constraint:v8 error:&v16];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = v16;

    v9[2](v9, v13, v14);
  }

  else
  {
    TK_LOG_token_4();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[TKTokenSession beginAuthForOperation:constraint:reply:].cold.1(self, (uint64_t)v8, v15);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:0];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0LL, v13);
  }
}

- (BOOL)checkOperation:(int64_t)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = -[TKTokenSession privateDelegate](self, "privateDelegate");
  char v14 = objc_opt_respondsToSelector();

  if ((v14 & 1) != 0)
  {
    v15 = -[TKTokenSession privateDelegate](self, "privateDelegate");
    char v16 = [v15 tokenSession:self supportsOperation:a3 usingKey:v10 algorithm:v11 parameters:v12];
  }

  else
  {
    v17 = -[TKTokenSession delegate](self, "delegate");
    char v18 = objc_opt_respondsToSelector();

    if ((v18 & 1) == 0)
    {
      BOOL v19 = 0;
      goto LABEL_7;
    }
    v15 = -[TKTokenSession delegate](self, "delegate");
    char v16 = [v15 tokenSession:self supportsOperation:a3 usingKey:v10 algorithm:v11];
  }

  BOOL v19 = v16;

LABEL_7:
  return v19;
}

- (void)signData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void *, id))a6;
  -[TKTokenSession delegate](self, "delegate");
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = 0LL;
    [v16 tokenSession:self signData:v10 usingKey:v11 algorithm:v12 error:&v22];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v22;

    v13[2](v13, v17, v18);
  }

  else
  {
    TK_LOG_token_4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 tokenID];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v24 = v21;
      _os_log_impl(&dword_186E58000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement sign", buf, 0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0LL, v17);
  }
}

- (void)decryptData:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = (void (**)(id, void *, id))a7;
  v17 = -[TKTokenSession privateDelegate](self, "privateDelegate");
  char v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v29 = 0LL;
    [v19 tokenSession:self decryptData:v12 usingKey:v13 algorithm:v14 parameters:v15 error:&v29];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v29;
LABEL_5:
    id v24 = v21;

    v16[2](v16, v20, v24);
    goto LABEL_9;
  }

  -[TKTokenSession delegate](self, "delegate");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  char v23 = objc_opt_respondsToSelector();

  if ((v23 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = 0LL;
    [v19 tokenSession:self decryptData:v12 usingKey:v13 algorithm:v14 error:&v28];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = v28;
    goto LABEL_5;
  }

  TK_LOG_token_4();
  uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = -[TKTokenSession token](self, "token");
    [v26 tokenID];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v31 = v27;
    _os_log_impl(&dword_186E58000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement decrypt", buf, 0xCu);
  }

  [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, 0LL, v20);
LABEL_9:
}

- (void)performKeyExchangeWithPublicKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 parameters:(id)a6 reply:(id)a7
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  char v16 = (void (**)(id, void *, id))a7;
  v17 = -[TKTokenSession delegate](self, "delegate");
  char v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[TKTokenSession delegate](self, "delegate");
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = 0LL;
    [v19 tokenSession:self performKeyExchangeWithPublicKey:v12 usingKey:v13 algorithm:v14 parameters:v15 error:&v25];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    id v21 = v25;

    v16[2](v16, v20, v21);
  }

  else
  {
    TK_LOG_token_4();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      char v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 tokenID];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v24;
      _os_log_impl(&dword_186E58000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key exchange", buf, 0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0LL, v20);
  }
}

- (void)decapsulateSharedKey:(id)a3 usingKey:(id)a4 algorithm:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, id))a6;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = 0LL;
    [v16 tokenSession:self decapsulateSharedKey:v10 usingKey:v11 algorithm:v12 error:&v22];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v22;

    v13[2](v13, v17, v18);
  }

  else
  {
    TK_LOG_token_4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 tokenID];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v24 = v21;
      _os_log_impl(&dword_186E58000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement decapsulate", buf, 0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0LL, v17);
  }
}

- (void)attestKey:(id)a3 usingKey:(id)a4 nonce:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *, id))a6;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  char v15 = objc_opt_respondsToSelector();

  if ((v15 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    char v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = 0LL;
    [v16 tokenSession:self attestKey:v10 usingKey:v11 nonce:v12 error:&v22];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v22;

    v13[2](v13, v17, v18);
  }

  else
  {
    TK_LOG_token_4();
    BOOL v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 tokenID];
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v24 = v21;
      _os_log_impl(&dword_186E58000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement attestation", buf, 0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0LL, v17);
  }
}

- (void)bumpKey:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    uint64_t v11 = [v10 tokenSession:self bumpKey:v6 error:&v17];
    id v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }

  else
  {
    TK_LOG_token_4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 tokenID];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      BOOL v19 = v15;
      _os_log_impl(&dword_186E58000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: does not implement key bumping", buf, 0xCu);
    }

    uint64_t v16 = [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0LL, (id)v16);
    id v12 = v7;
    id v7 = (void (**)(id, uint64_t, id))v16;
  }
}

- (void)commitKey:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    uint64_t v11 = [v10 tokenSession:self commitKey:v6 error:&v17];
    id v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }

  else
  {
    TK_LOG_token_4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[TKTokenSession token](self, "token");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 tokenID];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      BOOL v19 = v15;
      _os_log_impl( &dword_186E58000,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@: does not implement key committing",  buf,  0xCu);
    }

    uint64_t v16 = [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0LL, (id)v16);
    id v12 = v7;
    id v7 = (void (**)(id, uint64_t, id))v16;
  }
}

- (void)createObjectWithAttributes:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    [v10 tokenSession:self createObjectWithAttributes:v6 error:&v16];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v16;

    v7[2](v7, v11, v12);
  }

  else
  {
    TK_LOG_token_4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[TKTokenSession token](self, "token");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 tokenID];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v18 = v15;
      _os_log_impl(&dword_186E58000, v13, OS_LOG_TYPE_INFO, "%{public}@: is read-only token", buf, 0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v11);
  }
}

- (void)deleteObject:(id)a3 reply:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, id))a4;
  -[TKTokenSession privateDelegate](self, "privateDelegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[TKTokenSession privateDelegate](self, "privateDelegate");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    uint64_t v11 = [v10 tokenSession:self deleteObject:v6 error:&v17];
    id v12 = (void (**)(id, uint64_t, id))v17;

    v7[2](v7, v11, v12);
  }

  else
  {
    TK_LOG_token_4();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      -[TKTokenSession token](self, "token");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 tokenID];
      char v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v15;
      _os_log_impl(&dword_186E58000, v13, OS_LOG_TYPE_INFO, "%{public}@: is read-only token", buf, 0xCu);
    }

    uint64_t v16 = [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    v7[2](v7, 0LL, (id)v16);
    id v12 = v7;
    id v7 = (void (**)(id, uint64_t, id))v16;
  }
}

- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 reply:(id)a5
{
  v20[1] = *MEMORY[0x1895F89C0];
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)[v9 baseClassForUI]);
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 importOperation:v9];

    uint64_t v19 = &unk_189F98678;
    v20[0] = v11;
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = (id)[v12 mutableCopy];

    -[TKTokenSession callerPID](self, "callerPID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[TKTokenSession callerPID](self, "callerPID");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:v14 forKeyedSubscript:&unk_189F98690];
    }

    -[TKTokenSession LAContext](self, "LAContext");
    char v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __61__TKTokenSession_evaluateAuthOperation_tokenOperation_reply___block_invoke;
    v16[3] = &unk_189F8B7F0;
    id v17 = v8;
    SEL v18 = a2;
    v16[4] = self;
    [v15 evaluatePolicy:1009 options:v9 reply:v16];
  }

  else
  {
    (*((void (**)(id, id, void))v8 + 2))(v8, v9, 0LL);
  }
}

void __61__TKTokenSession_evaluateAuthOperation_tokenOperation_reply___block_invoke(void *a1, void *a2)
{
  if (a2)
  {
    [a2 objectForKeyedSubscript:&unk_189F986A8];
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      [v3 handleFailureInMethod:a1[6] object:a1[4] file:@"TKTokenSession.m" lineNumber:366 description:@"LAPolicyTokenAuthentication did not fill in LAResultTKAuthOperation"];
    }

    (*(void (**)(void))(a1[5] + 16LL))();
  }

  else
  {
    (*(void (**)(void))(a1[5] + 16LL))();
  }

- (void)finalizeAuthOperation:(id)a3 evaluatedAuthOperation:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, uint64_t, void))a5;
  [v8 importOperation:a4];
  id v24 = 0LL;
  uint64_t v10 = [v8 finishWithError:&v24];
  id v11 = v24;
  -[TKTokenSession caller](self, "caller");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v12;
  if (v12)
  {
    [v12 auditToken];
  }

  else
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
  }

  -[TKTokenSession auditAuthOperation:auditToken:success:]( self,  "auditAuthOperation:auditToken:success:",  v8,  &v22,  v10);

  if ((v10 & 1) != 0)
  {
    v9[2](v9, 1LL, 0LL);
  }

  else
  {
    if (!v11)
    {
      TK_LOG_token_4();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[TKTokenSession finalizeAuthOperation:evaluatedAuthOperation:reply:].cold.1( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
      }

      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
      id v11 = (id)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(v8, "setAuthenticationError:", v11, v22, v23);
    ((void (**)(id, uint64_t, id))v9)[2](v9, 0LL, v11);
  }
}

- (void)evaluateAuthOperation:(id)a3 tokenOperation:(int64_t)a4 retry:(BOOL)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke;
  v14[3] = &unk_189F8B840;
  v14[4] = self;
  id v15 = v10;
  BOOL v18 = a5;
  id v16 = v11;
  int64_t v17 = a4;
  id v12 = v10;
  id v13 = v11;
  -[TKTokenSession evaluateAuthOperation:tokenOperation:reply:]( self,  "evaluateAuthOperation:tokenOperation:reply:",  v12,  a4,  v14);
}

void __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (a2)
  {
    id v7 = *(void **)(a1 + 40);
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke_2;
    v12[3] = &unk_189F8B818;
    char v16 = *(_BYTE *)(a1 + 64);
    v12[4] = v6;
    id v8 = v7;
    id v10 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    id v13 = v8;
    uint64_t v15 = v9;
    id v14 = v10;
    [v6 finalizeAuthOperation:v8 evaluatedAuthOperation:a2 reply:v12];
  }

  else
  {
    [*(id *)(a1 + 32) queue];
    id v11 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_resume(v11);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }
}

void __67__TKTokenSession_evaluateAuthOperation_tokenOperation_retry_reply___block_invoke_2( uint64_t a1,  char a2,  void *a3)
{
  id v5 = a3;
  id v12 = v5;
  if (!*(_BYTE *)(a1 + 64) || (a2 & 1) != 0) {
    goto LABEL_9;
  }
  [v5 domain];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEqual:@"CryptoTokenKit"])
  {
    uint64_t v7 = [v12 code];

    if (v7 == -5)
    {
      [v12 userInfo];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 objectForKeyedSubscript:@"userSecretTriesLeft"];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        uint64_t v10 = [v9 integerValue];

        if (v10 < 1) {
          goto LABEL_9;
        }
      }

      else
      {
      }

      [*(id *)(a1 + 32) evaluateAuthOperation:*(void *)(a1 + 40) tokenOperation:*(void *)(a1 + 56) retry:*(unsigned __int8 *)(a1 + 64) reply:*(void *)(a1 + 48)];
      goto LABEL_10;
    }
  }

  else
  {
  }

- (void)evaluateAccessControl:(id)a3 forOperation:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(id, uint64_t, void))a5;
  id v30 = 0LL;
  id v9 = a4;
  id v10 = a3;
  +[TKTokenKeychainItem operationMap](&OBJC_CLASS___TKTokenKeychainItem, "operationMap");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKey:v9];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [v12 integerValue];

  id v14 = (void *)SecAccessControlCreateFromData();
  SecAccessControlGetConstraint();
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15 && ![v15 isEqual:MEMORY[0x189604A80]])
  {
    if ([v15 isEqual:MEMORY[0x189604A88]])
    {
      v8[2](v8, 1LL, 0LL);
      goto LABEL_4;
    }

    -[TKTokenSession LAContext](self, "LAContext");
    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[TKTokenSession queue](self, "queue");
      BOOL v18 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
      dispatch_suspend(v18);

      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = __59__TKTokenSession_evaluateAccessControl_forOperation_reply___block_invoke;
      v27[3] = &unk_189F8B868;
      v27[4] = self;
      uint64_t v28 = v8;
      uint64_t v29 = v13;
      -[TKTokenSession beginAuthForOperation:constraint:reply:]( self,  "beginAuthForOperation:constraint:reply:",  v13,  v15,  v27);

      goto LABEL_4;
    }

    TK_LOG_token_4();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[TKTokenSession evaluateAccessControl:forOperation:reply:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:0];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, uint64_t, void *))v8)[2](v8, 0LL, v16);

LABEL_4:
}

void __59__TKTokenSession_evaluateAccessControl_forOperation_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (v9)
  {
    [*(id *)(a1 + 32) LAContext];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 isCredentialSet:-3] ^ 1;

    [*(id *)(a1 + 32) evaluateAuthOperation:v9 tokenOperation:*(void *)(a1 + 48) retry:v7 reply:*(void *)(a1 + 40)];
  }

  else
  {
    if (!v5)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:0];
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }

    [*(id *)(a1 + 32) queue];
    id v8 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
    dispatch_resume(v8);

    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

- (id)errorWithResult:(id)a3 operation:(id)a4 forError:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (!a3)
  {
    [v8 domain];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 userInfo];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKeyedSubscript:@"operation"];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      [v9 userInfo];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v10 = (void *)[v13 mutableCopy];

      [v10 setObject:v7 forKeyedSubscript:@"operation"];
      id v14 = (void *)MEMORY[0x189607870];
      uint64_t v15 = (void *)[v10 copy];
      uint64_t v16 = [v14 errorWithDomain:@"CryptoTokenKit" code:-9 userInfo:v15];

      id v9 = (void *)v16;
LABEL_6:
    }
  }

  return v9;
}

- (void)objectID:(id)a3 operation:(int64_t)a4 inputData:(id)a5 algorithms:(id)a6 parameters:(id)a7 reply:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a7;
  BOOL v18 = (void (**)(id, void *, void))a8;
  id v19 = a6;
  uint64_t v20 = -[TKTokenKeyAlgorithm initWithAlgorithmsArray:]( objc_alloc(&OBJC_CLASS___TKTokenKeyAlgorithm),  "initWithAlgorithmsArray:",  v19);

  if (!-[TKTokenSession checkOperation:usingKey:algorithm:parameters:]( self,  "checkOperation:usingKey:algorithm:parameters:",  a4,  v15,  v20,  v17))
  {
    [MEMORY[0x189603FE8] null];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2](v18, v26, 0LL);

    goto LABEL_23;
  }

  if (!v16)
  {
    v18[2](v18, (void *)MEMORY[0x189604A88], 0LL);
    goto LABEL_23;
  }

  if (a4 > 999)
  {
    switch(a4)
    {
      case 1000LL:
        -[TKTokenSession token](self, "token");
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 tokenID];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        id v39 = 0LL;
        [v22 decodedKeyID:v16 error:&v39];
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        id v24 = v39;

        if (v23)
        {
          [v17 objectForKeyedSubscript:@"nonce"];
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1895F87A8];
          v37[1] = 3221225472LL;
          v37[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_5;
          v37[3] = &unk_189F8B890;
          v37[4] = self;
          v38 = v18;
          -[TKTokenSession attestKey:usingKey:nonce:reply:](self, "attestKey:usingKey:nonce:reply:", v23, v15, v25, v37);
        }

        else
        {
          ((void (**)(id, void *, id))v18)[2](v18, 0LL, v24);
        }

        goto LABEL_22;
      case 1001LL:
        v35[0] = MEMORY[0x1895F87A8];
        v35[1] = 3221225472LL;
        v35[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_6;
        v35[3] = &unk_189F8B8B8;
        v35[4] = self;
        v36 = v18;
        -[TKTokenSession bumpKey:reply:](self, "bumpKey:reply:", v15, v35);
        uint64_t v28 = v36;
        goto LABEL_18;
      case 1002LL:
        v33[0] = MEMORY[0x1895F87A8];
        v33[1] = 3221225472LL;
        v33[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_7;
        v33[3] = &unk_189F8B8B8;
        v33[4] = self;
        int v34 = v18;
        -[TKTokenSession commitKey:reply:](self, "commitKey:reply:", v15, v33);
        uint64_t v28 = v34;
        goto LABEL_18;
      case 1003LL:
        v40[0] = MEMORY[0x1895F87A8];
        v40[1] = 3221225472LL;
        v40[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_4;
        v40[3] = &unk_189F8B890;
        v40[4] = self;
        v41 = v18;
        -[TKTokenSession decapsulateSharedKey:usingKey:algorithm:reply:]( self,  "decapsulateSharedKey:usingKey:algorithm:reply:",  v16,  v15,  v20,  v40);
        uint64_t v28 = v41;
        goto LABEL_18;
      default:
        goto LABEL_19;
    }
  }

  switch(a4)
  {
    case 2LL:
      v46[0] = MEMORY[0x1895F87A8];
      v46[1] = 3221225472LL;
      v46[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke;
      v46[3] = &unk_189F8B890;
      v46[4] = self;
      __int128 v47 = v18;
      -[TKTokenSession signData:usingKey:algorithm:reply:]( self,  "signData:usingKey:algorithm:reply:",  v16,  v15,  v20,  v46);
      uint64_t v28 = v47;
LABEL_18:

      break;
    case 3LL:
      v44[0] = MEMORY[0x1895F87A8];
      v44[1] = 3221225472LL;
      v44[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_2;
      v44[3] = &unk_189F8B890;
      v44[4] = self;
      __int128 v45 = v18;
      -[TKTokenSession decryptData:usingKey:algorithm:parameters:reply:]( self,  "decryptData:usingKey:algorithm:parameters:reply:",  v16,  v15,  v20,  v17,  v44);
      uint64_t v28 = v45;
      goto LABEL_18;
    case 4LL:
      v27 = -[TKTokenKeyExchangeParameters initWithParameters:]( objc_alloc(&OBJC_CLASS___TKTokenKeyExchangeParameters),  "initWithParameters:",  v17);
      v42[0] = MEMORY[0x1895F87A8];
      v42[1] = 3221225472LL;
      v42[2] = __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_3;
      v42[3] = &unk_189F8B890;
      v42[4] = self;
      __int128 v43 = v18;
      -[TKTokenSession performKeyExchangeWithPublicKey:usingKey:algorithm:parameters:reply:]( self,  "performKeyExchangeWithPublicKey:usingKey:algorithm:parameters:reply:",  v16,  v15,  v20,  v27,  v42);

      break;
    default:
LABEL_19:
      [MEMORY[0x1896077D8] currentHandler];
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKTokenSession token](self, "token");
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 tokenID];
      id v30 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v31 = a4;
      id v24 = v32;
      [v32 handleFailureInMethod:a2, self, @"TKTokenSession.m", 534, @"invalid objectOperation %d on token %@", v31, v30 object file lineNumber description];

LABEL_22:
      break;
  }

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v5 errorWithResult:v6 operation:@"osgn" forError:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v5 errorWithResult:v6 operation:@"od" forError:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_3( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v5 errorWithResult:v6 operation:@"ock" forError:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_4( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v5 errorWithResult:v6 operation:@"okd" forError:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_5( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a2;
  [v5 errorWithResult:v6 operation:@"oa" forError:a3];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_6( uint64_t a1,  int a2,  void *a3)
{
  id v8 = a3;
  if (a2)
  {
    [MEMORY[0x189603F48] data];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) errorWithResult:v5 operation:@"oko" forError:v8];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);
}

void __75__TKTokenSession_objectID_operation_inputData_algorithms_parameters_reply___block_invoke_7( uint64_t a1,  int a2,  void *a3)
{
  id v8 = a3;
  if (a2)
  {
    [MEMORY[0x189603F48] data];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v5 = 0LL;
  }

  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) errorWithResult:v5 operation:@"oko" forError:v8];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v5, v7);
}

- (void)getAdvertisedItemsWithReply:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, void *))a3;
  [MEMORY[0x189603FA8] array];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[TKTokenSession token](self, "token", 0LL);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 configuration];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 keychainItems];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v12) keychainAttributes];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v5 addObject:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v10);
  }

  v4[2](v4, v5);
}

- (void)terminate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 delegate];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TKTokenSession token](self, "token");
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    [v8 delegate];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKTokenSession token](self, "token");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 token:v7 terminateSession:self];
  }

- (NSString)name
{
  return 0LL;
}

- (TKToken)token
{
  return (TKToken *)objc_getProperty(self, a2, 8LL, 1);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)keepAlive
{
  return self->_keepAlive;
}

- (void)setKeepAlive:(id)a3
{
}

- (LAContext)LAContext
{
  return self->_LAContext;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- ($115C4C562B26FF47E01F9F4EA65B5887)creatorAuditToken
{
  __int128 v3 = *(_OWORD *)&self[2].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[2].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setCreatorAuditToken:(id *)a3
{
  __int128 v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_creatorAuditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_creatorAuditToken.val = v3;
}

- (NSXPCConnection)caller
{
  return self->_caller;
}

- (NSNumber)callerPID
{
  return self->_callerPID;
}

- (void)setCallerPID:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)beginAuthForOperation:(void *)a1 constraint:(uint64_t)a2 reply:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [a1 token];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 tokenID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138543618;
  id v8 = v6;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@: does not support auth, failing constraint '%{public}@'",  (uint8_t *)&v7,  0x16u);
}

- (void)finalizeAuthOperation:(uint64_t)a3 evaluatedAuthOperation:(uint64_t)a4 reply:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)evaluateAccessControl:(uint64_t)a3 forOperation:(uint64_t)a4 reply:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end