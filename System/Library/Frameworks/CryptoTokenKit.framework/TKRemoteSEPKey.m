@interface TKRemoteSEPKey
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)processServerAtributes:(id)a3 error:(id *)a4;
- (BOOL)systemKey;
- (BOOL)systemSessionKey;
- (NSData)remoteKeyID;
- (__SecAccessControl)accessControl;
- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)computeSharedSecret:(id)a3 error:(id *)a4;
- (id)decapsulateKey:(id)a3 error:(id *)a4;
- (id)keyID;
- (id)keySize;
- (id)keyType;
- (id)publicKeyWithError:(id *)a3;
- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)signDigest:(id)a3 error:(id *)a4;
- (id)withError:(id *)a3 invoke:(id)a4;
@end

@implementation TKRemoteSEPKey

- (BOOL)processServerAtributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v25 = a4;
  [v6 objectForKeyedSubscript:@"keyType"];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id keyType = self->_keyType;
  self->_id keyType = v7;

  [v6 objectForKeyedSubscript:@"keySize"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  id keySize = self->_keySize;
  self->_id keySize = v9;

  [v6 objectForKeyedSubscript:@"systemKey"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_systemKey = [v11 BOOLValue];

  [v6 objectForKeyedSubscript:@"publicKey"];
  v12 = (NSData *)objc_claimAutoreleasedReturnValue();
  publicKey = self->_publicKey;
  self->_publicKey = v12;

  [v6 objectForKeyedSubscript:@"systemSessionKey"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  self->_forceSystemSession = [v14 BOOLValue];

  if (!self->_keyType
    || !self->_keySize
    || ([v6 objectForKeyedSubscript:@"systemKey"],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v16 = (void *)v15,
        [v6 objectForKeyedSubscript:@"systemSessionKey"],
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    TK_LOG_rsepkey();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[TKRemoteSEPKey processServerAtributes:error:].cold.1();
    }

    if (a4)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
      BOOL v21 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }

- (id)withError:(id *)a3 invoke:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  v5 = (void (**)(id, void *, id *))a4;
  if (withError_invoke__onceToken != -1) {
    dispatch_once(&withError_invoke__onceToken, &__block_literal_global_11);
  }
  int v6 = 0;
  uint64_t v23 = 0LL;
  v24[0] = &v23;
  v24[1] = 0x3032000000LL;
  v24[2] = __Block_byref_object_copy__4;
  v24[3] = __Block_byref_object_dispose__4;
  id v25 = 0LL;
  while (1)
  {
    [(id)withError_invoke__connectionSlot resourceWithError:a3];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7) {
      goto LABEL_16;
    }
    [v7 object];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __35__TKRemoteSEPKey_withError_invoke___block_invoke_88;
    v20[3] = &unk_189F8B3C8;
    v22 = &v23;
    id v10 = v8;
    id v21 = v10;
    [v9 synchronousRemoteObjectProxyWithErrorHandler:v20];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(void **)(v24[0] + 40LL);
    *(void *)(v24[0] + 40LL) = 0LL;

    v5[2](v5, v11, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!*(void *)(v24[0] + 40LL))
    {

LABEL_15:
      goto LABEL_17;
    }

    TK_LOG_rsepkey();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = v14;
    if (v6 == 4) {
      break;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(v24[0] + 40LL);
      *(_DWORD *)buf = 67109378;
      int v29 = v6;
      __int16 v30 = 2114;
      uint64_t v31 = v16;
      _os_log_debug_impl( &dword_186E58000,  v15,  OS_LOG_TYPE_DEBUG,  "failed to call remotesepkey, try %d, error %{public}@",  buf,  0x12u);
    }

    [MEMORY[0x189607A40] sleepForTimeInterval:(double)v6 * 0.1];
    ++v6;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[TKRemoteSEPKey withError:invoke:].cold.1((uint64_t)v24, v15);
  }

  if (a3)
  {
    v17 = (void *)MEMORY[0x189607870];
    uint64_t v18 = *(void *)(v24[0] + 40LL);
    uint64_t v26 = *MEMORY[0x189607798];
    uint64_t v27 = v18;
    [MEMORY[0x189603F68] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:v10];
    v13 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }

uint64_t __35__TKRemoteSEPKey_withError_invoke___block_invoke()
{
  uint64_t v0 = [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B7780];
  v1 = (void *)withError_invoke__SEPKeyInterface;
  withError_invoke__SEPKeyInterface = v0;

  v2 = -[TKSharedResourceSlot initWithName:]( objc_alloc(&OBJC_CLASS___TKSharedResourceSlot),  "initWithName:",  @"TKRemoteSEPKey-serverConnection");
  v3 = (void *)withError_invoke__connectionSlot;
  withError_invoke__connectionSlot = (uint64_t)v2;

  [(id)withError_invoke__connectionSlot setIdleTimeout:60.0];
  [(id)withError_invoke__connectionSlot setCreateObjectBlock:&__block_literal_global_79];
  return [(id)withError_invoke__connectionSlot setObjectDestroyedBlock:&__block_literal_global_87];
}

id __35__TKRemoteSEPKey_withError_invoke___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[TKSEPKey clientToken](&OBJC_CLASS___TKSEPKey, "clientToken");
    v4 = (TKClientToken *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = -[TKClientToken initWithTokenID:](objc_alloc(&OBJC_CLASS___TKClientToken), "initWithTokenID:", &stru_189F8C1A8);
  }

  v5 = v4;
  -[TKClientToken SEPKeyEndpoint](v4, "SEPKeyEndpoint");
  int v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v6];
    [v7 setRemoteObjectInterface:withError_invoke__SEPKeyInterface];
    [v7 resume];
    TK_LOG_rsepkey();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_2();
    }
  }

  else
  {
    if (a2)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }

    TK_LOG_rsepkey();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_1();
    }
    v7 = 0LL;
  }

  return v7;
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_85(uint64_t a1, void *a2)
{
  id v2 = a2;
  TK_LOG_rsepkey();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __35__TKRemoteSEPKey_withError_invoke___block_invoke_85_cold_1();
  }

  [v2 invalidate];
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_88(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
  if ([v6 code] == 4099)
  {
    [v6 domain];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = [v4 isEqualToString:*MEMORY[0x189607460]];

    if (v5) {
      [*(id *)(a1 + 32) invalidate];
    }
  }
}

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___TKRemoteSEPKey;
  v13 = -[TKSEPKey _initWithAuthContext:](&v28, sel__initWithAuthContext_, v12);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 8, a3);
    uint64_t v15 = objc_alloc(&OBJC_CLASS___TKBERTLVRecord);
    [v14 keyID];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TKBERTLVRecord initWithPropertyList:](v15, "initWithPropertyList:", v16);
    uint64_t v18 = -[TKTLVRecord data](v17, "data");
    id v19 = v14[9];
    v14[9] = (id)v18;

    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke;
    v24[3] = &unk_189F8B418;
    v20 = v14;
    id v25 = v20;
    id v26 = v12;
    BOOL v27 = a5;
    [v20 withError:a6 invoke:v24];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v21 || ![v20 processServerAtributes:v21 error:a6])
    {

      v22 = 0LL;
      goto LABEL_7;
    }
  }

  v22 = v14;
LABEL_7:

  return v22;
}

id __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = __Block_byref_object_copy__4;
  uint64_t v23 = __Block_byref_object_dispose__4;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  id v18 = 0LL;
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 72LL);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke_2;
  v12[3] = &unk_189F8B3F0;
  v12[4] = &v19;
  v12[5] = &v13;
  [v5 getAttributesOfKey:v7 authContext:v6 forceSystemSession:v8 reply:v12];
  v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    v9 = (void *)v20[5];
  }

  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __73__TKRemoteSEPKey__initWithObjectID_authContext_forceSystemSession_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  v44.receiver = self;
  v44.super_class = (Class)&OBJC_CLASS___TKRemoteSEPKey;
  id v17 = -[TKSEPKey _initWithAuthContext:](&v44, sel__initWithAuthContext_, v16);
  if (!v17) {
    goto LABEL_6;
  }
  id v18 = (void *)SecAccessControlCopyData();
  uint64_t v38 = 0LL;
  v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy__4;
  v42 = __Block_byref_object_dispose__4;
  id v43 = 0LL;
  uint64_t v26 = MEMORY[0x1895F87A8];
  uint64_t v27 = 3221225472LL;
  objc_super v28 = __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke;
  int v29 = &unk_189F8B468;
  id v30 = v14;
  int64_t v36 = a4;
  id v19 = v18;
  id v31 = v19;
  id v32 = v15;
  id v33 = v16;
  BOOL v37 = a8;
  v20 = v17;
  id v34 = v20;
  v35 = &v38;
  uint64_t v21 = [v20 withError:a9 invoke:&v26];
  v22 = (void *)v20[8];
  v20[8] = v21;

  int v23 = v20[8]
      ? objc_msgSend(v20, "processServerAtributes:error:", v39[5], a9, v26, v27, v28, v29, v30, v31, v32, v33)
      : 0;

  _Block_object_dispose(&v38, 8);
  if (!v23) {
    id v24 = 0LL;
  }
  else {
LABEL_6:
  }
    id v24 = v17;

  return v24;
}

id __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  uint64_t v28 = 0LL;
  int v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = __Block_byref_object_copy__4;
  id v32 = __Block_byref_object_dispose__4;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  int v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = __Block_byref_object_copy__4;
  uint64_t v26 = __Block_byref_object_dispose__4;
  id v27 = 0LL;
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(unsigned __int8 *)(a1 + 88);
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke_2;
  v17[3] = &unk_189F8B440;
  id v19 = &v28;
  v20 = &v22;
  id v12 = *(id *)(a1 + 64);
  uint64_t v13 = *(void *)(a1 + 72);
  id v18 = v12;
  uint64_t v21 = v13;
  [v5 generateKeyType:v7 keySize:v6 accessControl:v8 options:v9 authContext:v10 forceSystemSession:v11 reply:v17];
  id v14 = (void *)v29[5];
  if (a3 && !v14)
  {
    *a3 = (id) v23[5];
    id v14 = (void *)v29[5];
  }

  id v15 = v14;

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v15;
}

void __102__TKRemoteSEPKey__initWithKeyType_keySize_accessControl_options_authContext_forceSystemSession_error___block_invoke_2( void *a1,  void *a2,  void *a3,  void *a4)
{
  id v14 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1[5] + 8LL) + 40LL), a2);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a4);
  if (v14)
  {
    +[TKTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v14);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 propertyList];
    uint64_t v12 = *(void *)(a1[5] + 8LL);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    objc_storeStrong((id *)(a1[4] + 72LL), a2);
    objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), a3);
  }
}

- (id)keyType
{
  return self->_keyType;
}

- (id)keySize
{
  return self->_keySize;
}

- (BOOL)systemKey
{
  return self->_systemKey;
}

- (BOOL)systemSessionKey
{
  return self->_forceSystemSession;
}

- (id)publicKeyWithError:(id *)a3
{
  return self->_publicKey;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)self->_accessControl;
}

- (BOOL)deleteWithError:(id *)a3
{
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __34__TKRemoteSEPKey_deleteWithError___block_invoke;
  v6[3] = &unk_189F8B4B8;
  v6[4] = self;
  v3 = -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a3, v6);
  char v4 = [v3 BOOLValue];

  return v4;
}

id __34__TKRemoteSEPKey_deleteWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  uint64_t v22 = __Block_byref_object_copy__4;
  int v23 = __Block_byref_object_dispose__4;
  id v24 = 0LL;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = __Block_byref_object_copy__4;
  id v17 = __Block_byref_object_dispose__4;
  id v18 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) authContext];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __34__TKRemoteSEPKey_deleteWithError___block_invoke_2;
  v12[3] = &unk_189F8B490;
  v12[4] = &v19;
  v12[5] = &v13;
  [v5 deleteKey:v6 authContext:v7 forceSystemSession:v8 reply:v12];

  id v9 = (void *)v20[5];
  if (a3 && !v9)
  {
    *a3 = (id) v14[5];
    id v9 = (void *)v20[5];
  }

  id v10 = v9;
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&v19, 8);
  return v10;
}

void __34__TKRemoteSEPKey_deleteWithError___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    uint64_t v6 = (void *)MEMORY[0x189604A88];
  }
  else {
    uint64_t v6 = 0LL;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __35__TKRemoteSEPKey_signDigest_error___block_invoke;
  v10[3] = &unk_189F8B4E0;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __35__TKRemoteSEPKey_signDigest_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  int v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) authContext];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __35__TKRemoteSEPKey_signDigest_error___block_invoke_2;
  v13[3] = &unk_189F8B210;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 signWithKey:v6 digest:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  id v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    id v10 = (void *)v21[5];
  }

  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __35__TKRemoteSEPKey_signDigest_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke;
  v10[3] = &unk_189F8B4E0;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  int v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) authContext];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke_2;
  v13[3] = &unk_189F8B210;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 computeSharedSecretWithKey:v6 publicKey:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  id v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    id v10 = (void *)v21[5];
  }

  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __44__TKRemoteSEPKey_computeSharedSecret_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke;
  v14[3] = &unk_189F8B508;
  v14[4] = self;
  id v15 = v8;
  id v16 = v9;
  id v10 = v9;
  id v11 = v8;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a5, v14);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = __Block_byref_object_copy__4;
  id v25 = __Block_byref_object_dispose__4;
  id v26 = 0LL;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__4;
  id v19 = __Block_byref_object_dispose__4;
  id v20 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) authContext];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke_2;
  v14[3] = &unk_189F8B210;
  v14[4] = &v21;
  void v14[5] = &v15;
  [v5 recryptWithKey:v6 data:v8 attributes:v7 authContext:v9 forceSystemSession:v10 reply:v14];

  id v11 = (void *)v22[5];
  if (a3 && !v11)
  {
    *a3 = (id) v16[5];
    id v11 = (void *)v22[5];
  }

  id v12 = v11;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v12;
}

void __47__TKRemoteSEPKey_recryptData_attributes_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke;
  v10[3] = &unk_189F8B4E0;
  v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v10);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__4;
  id v24 = __Block_byref_object_dispose__4;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__4;
  id v18 = __Block_byref_object_dispose__4;
  id v19 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) authContext];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke_2;
  v13[3] = &unk_189F8B210;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 decapsulateWithKey:v6 encapsulatedKey:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  uint64_t v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    uint64_t v10 = (void *)v21[5];
  }

  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __39__TKRemoteSEPKey_decapsulateKey_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 handleFailureInMethod:a2 object:self file:@"TKRemoteSEPKey.m" lineNumber:274 description:@"attempt to perform attestation with mixed local/remote keys"];
  }

  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke;
  v17[3] = &unk_189F8B508;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v12 = v10;
  id v13 = v11;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a5, v17);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  id v25 = __Block_byref_object_copy__4;
  id v26 = __Block_byref_object_dispose__4;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = __Block_byref_object_copy__4;
  uint64_t v20 = __Block_byref_object_dispose__4;
  id v21 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) remoteKeyID];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) authContext];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  uint64_t v11 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 56LL);
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke_2;
  v15[3] = &unk_189F8B210;
  v15[4] = &v22;
  v15[5] = &v16;
  [v5 attestWithKey:v6 keyToAttest:v7 nonce:v8 authContext:v9 forceSystemSessionAttestingKey:v10 forceSystemSessionKeyToAttest:v11 reply:v15];

  id v12 = (void *)v23[5];
  if (a3 && !v12)
  {
    *a3 = (id) v17[5];
    id v12 = (void *)v23[5];
  }

  id v13 = v12;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __40__TKRemoteSEPKey_attestKey_nonce_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke;
  v7[3] = &unk_189F8B530;
  v7[4] = self;
  v7[5] = a3;
  -[TKRemoteSEPKey withError:invoke:](self, "withError:invoke:", a4, v7);
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  char v5 = [v4 BOOLValue];

  return v5;
}

id __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v20 = 0LL;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0LL;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = __Block_byref_object_copy__4;
  uint64_t v18 = __Block_byref_object_dispose__4;
  id v19 = 0LL;
  [*(id *)(a1 + 32) remoteKeyID];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) authContext];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 56LL);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke_2;
  v13[3] = &unk_189F8B490;
  v13[4] = &v20;
  v13[5] = &v14;
  [v5 lifetimeControlKey:v6 type:v7 authContext:v8 forceSystemSession:v9 reply:v13];

  uint64_t v10 = (void *)v21[5];
  if (a3 && !v10)
  {
    *a3 = (id) v15[5];
    uint64_t v10 = (void *)v21[5];
  }

  id v11 = v10;
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v11;
}

void __48__TKRemoteSEPKey_lifetimeControlWithType_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    id v6 = (void *)MEMORY[0x189604A88];
  }
  else {
    id v6 = 0LL;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), v6);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
}

- (id)keyID
{
  return self->_keyID;
}

- (NSData)remoteKeyID
{
  return self->_remoteKeyID;
}

- (void).cxx_destruct
{
}

- (void)processServerAtributes:error:.cold.1()
{
}

- (void)processServerAtributes:(void *)a1 error:(os_log_s *)a2 .cold.2(void **a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id v2 = *a1;
  if (*a1) {
    id v2 = (void *)*v2;
  }
  int v3 = 138543362;
  char v4 = v2;
  _os_log_fault_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_FAULT,  "unable to deserialize accessControl, error %{public}@",  (uint8_t *)&v3,  0xCu);
}

- (void)withError:(uint64_t)a1 invoke:(os_log_s *)a2 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)a1 + 40LL);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "failed to call remotesepkey repeatedly, giving up, error: %{public}@",  (uint8_t *)&v3,  0xCu);
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_1()
{
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_2_cold_2()
{
}

void __35__TKRemoteSEPKey_withError_invoke___block_invoke_85_cold_1()
{
}

@end