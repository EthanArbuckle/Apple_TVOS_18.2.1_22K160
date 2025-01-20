@interface SFKeychainManager
@end

@implementation SFKeychainManager

void __36___SFKeychainManager_defaultManager__block_invoke()
{
  id v0 = -[_SFKeychainManager initManager](objc_alloc(&OBJC_CLASS____SFKeychainManager), "initManager");
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;
}

void __46___SFKeychainManager_defaultOverCommitManager__block_invoke()
{
  id v0 = -[_SFKeychainManager initOverCommitManager]( objc_alloc(&OBJC_CLASS____SFKeychainManager),  "initOverCommitManager");
  v1 = (void *)defaultOverCommitManager_defaultOverCommitManager;
  defaultOverCommitManager_defaultOverCommitManager = (uint64_t)v0;
}

void __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke(uint64_t a1)
{
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  OSStatus v3 = SecItemAdd(v2, 0LL);
  if (*(void *)(a1 + 64))
  {
    OSStatus v4 = v3;
    [*(id *)(a1 + 32) keychainReplyQueue];
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke_2;
    v6[3] = &unk_18A054250;
    OSStatus v8 = v4;
    id v7 = *(id *)(a1 + 64);
    dispatch_async(v5, v6);
  }
}

void __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if ((_DWORD)v1)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v1 userInfo:0];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0LL, v3);
  }

  else
  {
    (*(void (**)(void, uint64_t, void))(v2 + 16))(*(void *)(a1 + 32), 1LL, 0LL);
  }

void __67___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_error___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) generateAttributesForIdentityAndAddToKeychain:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 48) accessPolicy:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  if (v2)
  {
    *(_BYTE *)(v3 + 24) = 0;
    uint64_t v4 = [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v2 userInfo:0];
    uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 8LL);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  else
  {
    *(_BYTE *)(v3 + 24) = 1;
  }

void __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke( uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) generateAttributesForIdentityAndAddToKeychain:*(void *)(a1 + 40) forIdentifier:*(void *)(a1 + 48) accessPolicy:*(void *)(a1 + 56)];
  if (*(void *)(a1 + 64))
  {
    int v3 = v2;
    [*(id *)(a1 + 32) keychainReplyQueue];
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke_2;
    v5[3] = &unk_18A054250;
    int v7 = v3;
    id v6 = *(id *)(a1 + 64);
    dispatch_async(v4, v5);
  }

void __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke_2( uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 32);
  if ((_DWORD)v1)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v1 userInfo:0];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0LL, v3);
  }

  else
  {
    (*(void (**)(void, uint64_t, void))(v2 + 16))(*(void *)(a1 + 32), 1LL, 0LL);
  }

void __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960BE20]];
  CFTypeRef result = 0LL;
  OSStatus v3 = SecItemCopyMatching((CFDictionaryRef)v2, &result);
  uint64_t v4 = (void *)result;
  [*(id *)(a1 + 32) keychainReplyQueue];
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke_2;
  block[3] = &unk_18A0542C8;
  id v8 = v4;
  OSStatus v11 = v3;
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v6 = v4;
  dispatch_async(v5, block);
}

void __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke_2(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  if (*(void *)(a1 + 32)) {
    BOOL v3 = v2 == 0;
  }
  else {
    BOOL v3 = 0;
  }
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:v2 userInfo:0];
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    +[_SFKeychainFetchResult fetchResultWithError:]( &OBJC_CLASS____SFKeychainKeyFetchResult,  "fetchResultWithError:",  v22);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

    return;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_alloc(&OBJC_CLASS____SFAESKey);
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v23 = 0LL;
      id v9 = -[_SFSymmetricKey initWithData:specifier:error:](v13, "initWithData:specifier:error:", v14, v15, &v23);
      id v16 = v23;
      if (v16)
      {
        id v10 = v16;
        uint64_t v11 = *(void *)(a1 + 48);
        goto LABEL_12;
      }

      if (v9)
      {
        uint64_t v20 = *(void *)(a1 + 48);
        v12 = +[_SFKeychainFetchResult fetchResultWithValue:]( &OBJC_CLASS____SFKeychainKeyFetchResult,  "fetchResultWithValue:",  v9);
        (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v12);
        goto LABEL_16;
      }
    }

    else
    {
      id v9 = 0LL;
    }

void __44___SFKeychainManager_identityForIdentifier___block_invoke(void *a1)
{
  unsigned int v11 = 0;
  int v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v10 = 0LL;
  uint64_t v4 = [v2 findPrivateKeyWithIdentifier:v3 certificate:&v10 result:&v11];
  id v5 = v10;
  id v6 = (void *)a1[4];
  if (v4) {
    [v6 foundPrivateKey:v4 certificate:v5];
  }
  else {
  uint64_t v7 = [v6 publicKeyLookupWithIdentifier:a1[5] certificate:v5 result:v11];
  }
  uint64_t v8 = *(void *)(a1[6] + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke(uint64_t a1)
{
  unsigned int v23 = 0;
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v22 = 0LL;
  uint64_t v4 = [v2 findPrivateKeyWithIdentifier:v3 certificate:&v22 result:&v23];
  id v5 = v22;
  id v6 = *(void **)(a1 + 32);
  if (v4)
  {
    [v6 foundPrivateKey:v4 certificate:v5];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) keychainReplyQueue];
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_2;
    v19[3] = &unk_18A054340;
    id v9 = &v21;
    id v10 = *(id *)(a1 + 48);
    unsigned int v11 = &v20;
    uint64_t v20 = v7;
    id v21 = v10;
    id v12 = v7;
    v13 = v19;
  }

  else
  {
    [v6 publicKeyLookupWithIdentifier:*(void *)(a1 + 40) certificate:v5 result:v23];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) keychainReplyQueue];
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_3;
    v16[3] = &unk_18A054340;
    id v9 = &v18;
    id v15 = *(id *)(a1 + 48);
    unsigned int v11 = &v17;
    v17 = v14;
    id v18 = v15;
    id v12 = v14;
    v13 = v16;
  }

  dispatch_async(v8, v13);
}

uint64_t __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

uint64_t __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke(uint64_t a1)
{
  v28[4] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *MEMORY[0x18960BB40];
  v28[0] = *MEMORY[0x18960BB60];
  v28[1] = v2;
  uint64_t v3 = *MEMORY[0x18960BB58];
  v28[2] = *MEMORY[0x18960BB48];
  v28[3] = v3;
  [MEMORY[0x189603F18] arrayWithObjects:v28 count:4];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v22;
    uint64_t v8 = *MEMORY[0x18960B9F8];
    uint64_t v9 = *MEMORY[0x18960BB38];
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v12 = *(void *)(a1 + 32);
        v25[0] = v8;
        v25[1] = v9;
        v26[0] = v12;
        v26[1] = v11;
        [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:v25 count:2];
        v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        OSStatus v14 = SecItemDelete(v13);
        v6 |= v14 == 0;
      }

      uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }

    while (v5);
  }

  else
  {
    OSStatus v14 = 0;
    char v6 = 0;
  }

  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 40) keychainReplyQueue];
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke_2;
    block[3] = &unk_18A054390;
    char v20 = v6 & 1;
    id v18 = *(id *)(a1 + 48);
    OSStatus v19 = v14;
    dispatch_async(v15, block);
  }
}

void __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke_2(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 44))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

  else
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:*(int *)(a1 + 40) userInfo:0];
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  }

@end