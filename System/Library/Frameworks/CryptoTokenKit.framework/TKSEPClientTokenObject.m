@interface TKSEPClientTokenObject
- (BOOL)deleteWithError:(id *)a3;
- (TKSEPClientTokenObject)initWithSession:(id)a3 key:(id)a4 error:(id *)a5;
- (TKSEPKey)key;
- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7;
- (id)withError:(id *)a3 invoke:(id)a4;
@end

@implementation TKSEPClientTokenObject

- (TKSEPClientTokenObject)initWithSession:(id)a3 key:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  [v9 publicKeyWithError:a5];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    [v9 attributes];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)[v11 mutableCopy];

    [v12 setObject:v10 forKeyedSubscript:@"pubk"];
    [v9 objectID];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[TKTokenID encodedKeyID:](&OBJC_CLASS___TKTokenID, "encodedKeyID:", v13);
    v15 = (void *)[v12 copy];
    v19.receiver = self;
    v19.super_class = (Class)&OBJC_CLASS___TKSEPClientTokenObject;
    v16 = -[TKClientTokenObject initWithSession:objectID:attributes:]( &v19,  sel_initWithSession_objectID_attributes_,  v8,  v14,  v15);

    if (v16) {
      objc_storeStrong((id *)&v16->_key, a4);
    }
    self = v16;

    v17 = self;
  }

  else
  {
    v17 = 0LL;
  }

  return v17;
}

- (id)withError:(id *)a3 invoke:(id)a4
{
  v6 = (void (**)(id, id *))a4;
  id v33 = 0LL;
  v6[2](v6, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v33;
  if (v7)
  {
    id v9 = 0LL;
  }

  else
  {
    char v32 = 0;
    id v9 = 0LL;
    int v10 = 17;
    while (1)
    {
      [v8 domain];
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (![v11 isEqualToString:@"CryptoTokenKit"]
        || [v8 code] != -9)
      {

LABEL_17:
        if (a3)
        {
          id v28 = v8;
          *a3 = v28;

          goto LABEL_23;
        }

- (BOOL)deleteWithError:(id *)a3
{
  v5 = _os_activity_create( &dword_186E58000,  "SEPClientObject: deleteKey",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __42__TKSEPClientTokenObject_deleteWithError___block_invoke;
  v8[3] = &unk_189F8AEC8;
  v8[4] = self;
  v6 = -[TKSEPClientTokenObject withError:invoke:](self, "withError:invoke:", a3, v8);
  LOBYTE(a3) = [v6 BOOLValue];

  os_activity_scope_leave(&state);
  return (char)a3;
}

id __42__TKSEPClientTokenObject_deleteWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    v4 = 0LL;
  }
  id v5 = v4;

  return v5;
}

- (id)operation:(int64_t)a3 data:(id)a4 algorithms:(id)a5 parameters:(id)a6 error:(id *)a7
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = _os_activity_create( &dword_186E58000,  "SEPClientObject: operation",  MEMORY[0x1895F8D48],  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v15, &state);
  TK_LOG_client();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    [v13 lastObject];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSEPClientTokenObject operation:data:algorithms:parameters:error:].cold.2(a3, v17, (uint64_t)v30, v16);
  }

  v24[0] = MEMORY[0x1895F87A8];
  v24[1] = 3221225472LL;
  v24[2] = __69__TKSEPClientTokenObject_operation_data_algorithms_parameters_error___block_invoke;
  v24[3] = &unk_189F8AEF0;
  v24[4] = self;
  int64_t v28 = a3;
  id v18 = v13;
  id v25 = v18;
  id v19 = v12;
  id v26 = v19;
  id v20 = v14;
  id v27 = v20;
  v21 = -[TKSEPClientTokenObject withError:invoke:](self, "withError:invoke:", a7, v24);
  if (!v21)
  {
    TK_LOG_client();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[TKSEPClientTokenObject operation:data:algorithms:parameters:error:].cold.1(a3, (const __CFString **)a7, v22);
    }
  }

  os_activity_scope_leave(&state);
  return v21;
}

id __69__TKSEPClientTokenObject_operation_data_algorithms_parameters_error___block_invoke( uint64_t a1,  void *a2)
{
  v53[1] = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) session];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)objc_msgSend(v4, "_testing_ForceAuthenticationNeeded");

  if ((_DWORD)v5)
  {
    [*(id *)(a1 + 32) session];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "set_testing_ForceAuthenticationNeeded:", 0);

    if (!a2) {
      return 0LL;
    }
    v7 = 0LL;
    uint64_t v8 = *(void *)(a1 + 64);
    if (v8 <= 3)
    {
      if (v8 == 2)
      {
        v52 = @"operation";
        v53[0] = @"osgn";
        id v9 = (void *)MEMORY[0x189603F68];
        int v10 = (const __CFString **)v53;
        v11 = &v52;
        goto LABEL_49;
      }

      if (v8 == 3)
      {
        v48 = @"operation";
        v49 = @"oecd";
        id v9 = (void *)MEMORY[0x189603F68];
        int v10 = &v49;
        v11 = &v48;
        goto LABEL_49;
      }
    }

    else
    {
      switch(v8)
      {
        case 4LL:
          v50 = @"operation";
          v51 = @"ock";
          id v9 = (void *)MEMORY[0x189603F68];
          int v10 = &v51;
          v11 = &v50;
          goto LABEL_49;
        case 1000LL:
          v44 = @"operation";
          v45 = @"oa";
          id v9 = (void *)MEMORY[0x189603F68];
          int v10 = &v45;
          v11 = &v44;
          goto LABEL_49;
        case 1003LL:
          v46 = @"operation";
          v47 = @"okd";
          id v9 = (void *)MEMORY[0x189603F68];
          int v10 = &v47;
          v11 = &v46;
LABEL_49:
          [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          break;
      }
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-9 userInfo:v7];
    *a2 = (id)objc_claimAutoreleasedReturnValue();

    return 0LL;
  }

  uint64_t v12 = *(void *)(a1 + 64);
  if (v12 > 999)
  {
    switch(v12)
    {
      case 1000LL:
        if (!*(void *)(a1 + 48)) {
          return MEMORY[0x189604A88];
        }
        [*(id *)(a1 + 32) session];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 tokenID];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 decodedKeyID:*(void *)(a1 + 48) error:a2];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v16 = objc_alloc(&OBJC_CLASS___TKSEPKey);
          [*(id *)(a1 + 32) session];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 LAContext];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 56) objectForKeyedSubscript:@"attesteeSystemSession"];
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          id v20 = -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:]( v16,  "initWithObjectID:authContext:forceSystemSession:error:",  v15,  v18,  [v19 BOOLValue],  a2);

          if (v20)
          {
            [*(id *)(a1 + 32) key];
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            [*(id *)(a1 + 56) objectForKeyedSubscript:@"nonce"];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 attestKey:v20 nonce:v22 error:a2];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }

          else
          {
            v23 = 0LL;
          }
        }

        else
        {
          v23 = 0LL;
        }

        goto LABEL_56;
      case 1001LL:
        v23 = (void *)MEMORY[0x189604A88];
        if (!*(void *)(a1 + 48)) {
          return v23;
        }
        [*(id *)(a1 + 32) key];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        id v26 = v25;
        uint64_t v27 = 0LL;
        goto LABEL_35;
      case 1002LL:
        v23 = (void *)MEMORY[0x189604A88];
        if (!*(void *)(a1 + 48)) {
          return v23;
        }
        [*(id *)(a1 + 32) key];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        id v26 = v25;
        uint64_t v27 = 1LL;
LABEL_35:
        else {
          id v33 = 0LL;
        }
        id v34 = v33;

        return v34;
      case 1003LL:
        [*(id *)(a1 + 40) lastObject];
        int64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        int v29 = [v28 isEqualToString:*MEMORY[0x18960BCB8]];

        if (!v29) {
          goto LABEL_61;
        }
        if (!*(void *)(a1 + 48)) {
          return MEMORY[0x189604A88];
        }
        [*(id *)(a1 + 32) key];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v30 = [v15 decapsulateKey:*(void *)(a1 + 48) error:a2];
        break;
      default:
        goto LABEL_61;
    }

    goto LABEL_55;
  }

  switch(v12)
  {
    case 2LL:
      [*(id *)(a1 + 40) lastObject];
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v31 isEqualToString:*MEMORY[0x18960BC28]] & 1) == 0)
      {
        [*(id *)(a1 + 40) lastObject];
        char v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (![v32 isEqualToString:*MEMORY[0x18960BCA8]])
        {
          [*(id *)(a1 + 40) lastObject];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          char v43 = [v42 isEqualToString:*MEMORY[0x18960BCB0]];

          if ((v43 & 1) == 0) {
            break;
          }
LABEL_31:
          if (*(void *)(a1 + 48))
          {
            [*(id *)(a1 + 32) key];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v30 = [v15 signDigest:*(void *)(a1 + 48) error:a2];
            goto LABEL_55;
          }

          return MEMORY[0x189604A88];
        }
      }

      goto LABEL_31;
    case 3LL:
      [*(id *)(a1 + 40) lastObject];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      char v37 = [v36 isEqualToString:*MEMORY[0x18960BCA0]];
      if ((v37 & 1) != 0
        || ([*(id *)(a1 + 40) lastObject],
            id v5 = (void *)objc_claimAutoreleasedReturnValue(),
            ([v5 isEqualToString:*MEMORY[0x18960BC98]] & 1) != 0))
      {
        [*(id *)(a1 + 56) objectForKey:*MEMORY[0x18960BD58]];
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((v37 & 1) == 0) {
        if ((isKindOfClass & 1) != 0)
        }
        {
          if (*(void *)(a1 + 48))
          {
            [*(id *)(a1 + 32) key];
            uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v30 = [v15 recryptData:*(void *)(a1 + 48) attributes:*(void *)(a1 + 56) error:a2];
            goto LABEL_55;
          }

          return MEMORY[0x189604A88];
        }
      }

      else
      {
      }

      break;
    case 4LL:
      [*(id *)(a1 + 40) lastObject];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v24 isEqualToString:*MEMORY[0x18960BC10]])
      {

        goto LABEL_53;
      }

      [*(id *)(a1 + 40) lastObject];
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      int v41 = [v40 isEqualToString:*MEMORY[0x18960BC08]];

      if (v41)
      {
LABEL_53:
        if (*(void *)(a1 + 48))
        {
          [*(id *)(a1 + 32) key];
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v30 = [v15 computeSharedSecret:*(void *)(a1 + 48) error:a2];
LABEL_55:
          v23 = (void *)v30;
LABEL_56:

          return v23;
        }

        return MEMORY[0x189604A88];
      }

      break;
  }

- (TKSEPKey)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

- (void)withError:(os_log_s *)a3 invoke:.cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [a1 session];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 token];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 tokenID];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 accessControl];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = 138543874;
  v11 = v8;
  __int16 v12 = 2114;
  id v13 = v9;
  __int16 v14 = 2114;
  uint64_t v15 = a2;
  _os_log_fault_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_FAULT,  "authentication failed repeatedly: tkid=%{public}@, ac=%{public}@, op=%{public}@",  (uint8_t *)&v10,  0x20u);
}

- (void)withError:(uint64_t)a1 invoke:(os_log_s *)a2 .cold.2(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_FAULT,  "TKErrorCodeAuthenticationNeeded does not have operation set: %{public}@",  (uint8_t *)&v2,  0xCu);
}

- (void)operation:(os_log_s *)a3 data:algorithms:parameters:error:.cold.1( int a1,  const __CFString **a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if (a2) {
    uint64_t v3 = *a2;
  }
  else {
    uint64_t v3 = &stru_189F8C1A8;
  }
  v4[0] = 67109378;
  v4[1] = a1;
  __int16 v5 = 2114;
  v6 = v3;
  OUTLINED_FUNCTION_0_0(&dword_186E58000, a3, (uint64_t)a3, "operation:%d failed, error: %{public}@", (uint8_t *)v4);
}

- (void)operation:(uint64_t)a3 data:(os_log_s *)a4 algorithms:parameters:error:.cold.2( int a1,  void *a2,  uint64_t a3,  os_log_s *a4)
{
  *(_DWORD *)a3 = 67109378;
  *(_DWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 8) = 2114;
  *(void *)(a3 + 10) = a2;
  OUTLINED_FUNCTION_0_0(&dword_186E58000, a4, a3, "operation:%d algo:%{public}@", (uint8_t *)a3);
}

@end