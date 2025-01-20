@interface _SFKeychainManager
+ (id)defaultManager;
+ (id)defaultOverCommitManager;
- (BOOL)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 error:(id *)a6;
- (OS_dispatch_queue)keychainManagerQueue;
- (OS_dispatch_queue)keychainReplyQueue;
- (__CFDictionary)_certificateAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4;
- (__CFDictionary)_commonKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (__CFDictionary)_privateKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (__CFDictionary)_publicKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (__SecKey)findPrivateKeyWithIdentifier:(id)a3 certificate:(id *)a4 result:(int *)a5;
- (id)_symmetricKeyAttributesForIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5;
- (id)foundPrivateKey:(__SecKey *)a3 certificate:(id)a4;
- (id)identityForIdentifier:(id)a3;
- (id)initManager;
- (id)initOverCommitManager;
- (id)publicKeyLookupWithIdentifier:(id)a3 certificate:(id)a4 result:(int)a5;
- (int)generateAttributesForIdentityAndAddToKeychain:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5;
- (void)identityForIdentifier:(id)a3 resultHandler:(id)a4;
- (void)keyForIdentifier:(id)a3 specifier:(id)a4 resultHandler:(id)a5;
- (void)removeItemWithIdentifier:(id)a3 resultHandler:(id)a4;
- (void)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6;
- (void)setKey:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6;
- (void)setKeychainManagerQueue:(id)a3;
- (void)setKeychainReplyQueue:(id)a3;
@end

@implementation _SFKeychainManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global);
  }
  return (id)defaultManager_defaultManager;
}

+ (id)defaultOverCommitManager
{
  if (defaultOverCommitManager_onceToken != -1) {
    dispatch_once(&defaultOverCommitManager_onceToken, &__block_literal_global_35);
  }
  return (id)defaultOverCommitManager_defaultOverCommitManager;
}

- (id)initManager
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____SFKeychainManager;
  v2 = -[_SFKeychainManager init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("SFKeychainManager Queue", 0LL);
    keychainManagerQueue = v2->_keychainManagerQueue;
    v2->_keychainManagerQueue = (OS_dispatch_queue *)v3;

    dispatch_get_global_queue(0LL, 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFKeychainManager setKeychainReplyQueue:](v2, "setKeychainReplyQueue:", v5);
  }

  return v2;
}

- (id)initOverCommitManager
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____SFKeychainManager;
  v2 = -[_SFKeychainManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_overcommit();
    dispatch_queue_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v4 = dispatch_queue_create("SFKeychainManager over commit Queue", v3);
    keychainManagerQueue = v2->_keychainManagerQueue;
    v2->_keychainManagerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = dispatch_get_global_queue(0LL, 2uLL);
    keychainReplyQueue = v2->_keychainReplyQueue;
    v2->_keychainReplyQueue = (OS_dispatch_queue *)v6;
  }

  return v2;
}

- (id)_symmetricKeyAttributesForIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  v17[3] = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = *MEMORY[0x18960B9F8];
  v16[0] = *MEMORY[0x18960BB38];
  v16[1] = v9;
  v17[0] = *MEMORY[0x18960BB60];
  v17[1] = a3;
  v16[2] = *MEMORY[0x18960BA08];
  v17[2] = *MEMORY[0x189604DE8];
  v10 = (void *)MEMORY[0x189603F68];
  id v11 = a3;
  [v10 dictionaryWithObjects:v17 forKeys:v16 count:3];
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)[v12 mutableCopy];
  if (v8)
  {
    [v8 keyData];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x18960BE78]];
  }

  if (v7) {
    objc_msgSend(v13, "addEntriesFromDictionary:", objc_msgSend(v7, "secAccessibilityAttributes"));
  }

  return v13;
}

- (void)setKey:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70___SFKeychainManager_setKey_forIdentifier_accessPolicy_resultHandler___block_invoke;
  block[3] = &unk_18A054278;
  block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v14, block);
}

- (__CFDictionary)_commonKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960BB38], (const void *)*MEMORY[0x18960BB60]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B9F8], v9);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B878], v9);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960BA08], (const void *)*MEMORY[0x189604DE8]);
  if (v7)
  {
    [v7 accessGroup];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      id v12 = (const void *)*MEMORY[0x18960B820];
      [v7 accessGroup];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryAddValue(Mutable, v12, v13);
    }

    -[__CFDictionary addEntriesFromDictionary:]( Mutable,  "addEntriesFromDictionary:",  [v7 secAccessibilityAttributes]);
  }

  if (v8) {
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960BE88], (const void *)[v8 _secKey]);
  }
  CFAutorelease(Mutable);

  return Mutable;
}

- (__CFDictionary)_privateKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  v5 = -[_SFKeychainManager _commonKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_commonKeyAttributesForIdentityIdentifier:accessPolicy:key:",  a3,  a4,  a5);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x18960B968], (const void *)*MEMORY[0x18960B970]);
  return v5;
}

- (__CFDictionary)_publicKeyAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4 key:(id)a5
{
  v5 = -[_SFKeychainManager _commonKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_commonKeyAttributesForIdentityIdentifier:accessPolicy:key:",  a3,  a4,  a5);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x18960B968], (const void *)*MEMORY[0x18960B980]);
  return v5;
}

- (__CFDictionary)_certificateAttributesForIdentityIdentifier:(id)a3 accessPolicy:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960BB38], (const void *)*MEMORY[0x18960BB40]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960B9F8], v6);

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x18960BA08], (const void *)*MEMORY[0x189604DE8]);
  if (v5) {
    -[__CFDictionary addEntriesFromDictionary:]( Mutable,  "addEntriesFromDictionary:",  [v5 secAccessibilityAttributes]);
  }
  CFAutorelease(Mutable);

  return Mutable;
}

- (int)generateAttributesForIdentityAndAddToKeychain:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v10 keyPair];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    [v10 keyPair];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    id v13 = -[_SFKeychainManager _privateKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_privateKeyAttributesForIdentityIdentifier:accessPolicy:key:",  v9,  v8,  v12);
  }

  else
  {
    [v10 publicKey];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    id v13 = -[_SFKeychainManager _publicKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_publicKeyAttributesForIdentityIdentifier:accessPolicy:key:",  v9,  v8,  v12);
  }

  v14 = v13;

  return SecItemAdd(v14, 0LL);
}

- (BOOL)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x2020000000LL;
  char v35 = 0;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  id v31 = 0LL;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __67___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_error___block_invoke;
  v20[3] = &unk_18A0542A0;
  v20[4] = self;
  id v14 = v10;
  id v21 = v14;
  id v15 = v11;
  id v22 = v15;
  id v16 = v12;
  id v23 = v16;
  v24 = &v32;
  v25 = &v26;
  dispatch_sync(v13, v20);

  if (a6)
  {
    id v17 = (void *)v27[5];
    if (v17) {
      *a6 = v17;
    }
  }

  char v18 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (void)setIdentity:(id)a3 forIdentifier:(id)a4 accessPolicy:(id)a5 resultHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __75___SFKeychainManager_setIdentity_forIdentifier_accessPolicy_resultHandler___block_invoke;
  block[3] = &unk_18A054278;
  block[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (void)keyForIdentifier:(id)a3 specifier:(id)a4 resultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __63___SFKeychainManager_keyForIdentifier_specifier_resultHandler___block_invoke;
  v15[3] = &unk_18A0542F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (id)foundPrivateKey:(__SecKey *)a3 certificate:(id)a4
{
  v16[1] = *MEMORY[0x1895F89C0];
  id v5 = a4;
  id v6 = SecKeyCopyAttributes(a3);
  CFDictionaryGetValue(v6, (const void *)*MEMORY[0x18960B998]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 isEqualToString:*MEMORY[0x18960B9A8]])
  {
    id v8 = off_18A053BF8;
  }

  else
  {
    if (([v7 isEqualToString:*MEMORY[0x18960B9D0]] & 1) == 0)
    {
      CFRelease(a3);
      CFRelease(v6);
      id v12 = (void *)MEMORY[0x189607870];
      id v15 = @"SFKeychainErrorKeyType";
      v16[0] = v7;
      [MEMORY[0x189603F68] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 errorWithDomain:@"SFKeychainErrorDomain" code:1 userInfo:v13];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[_SFKeychainFetchResult fetchResultWithError:]( &OBJC_CLASS____SFKeychainIdentityFetchResult,  "fetchResultWithError:",  v9);
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }

    id v8 = off_18A053B20;
  }

  id v9 = (void *)[objc_alloc(*v8) initWithSecKey:a3];
  CFRelease(a3);
  CFRelease(v6);
  id v10 = -[_SFIdentity initWithKeyPair:certificate:]( objc_alloc(&OBJC_CLASS____SFIdentity),  "initWithKeyPair:certificate:",  v9,  v5);
  +[_SFKeychainFetchResult fetchResultWithValue:]( &OBJC_CLASS____SFKeychainIdentityFetchResult,  "fetchResultWithValue:",  v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (__SecKey)findPrivateKeyWithIdentifier:(id)a3 certificate:(id *)a4 result:(int *)a5
{
  id v8 = a3;
  id v9 = -[_SFKeychainManager _certificateAttributesForIdentityIdentifier:accessPolicy:]( self,  "_certificateAttributesForIdentityIdentifier:accessPolicy:",  v8,  0LL);
  id v10 = (const void *)*MEMORY[0x18960BE30];
  id v11 = (const void *)*MEMORY[0x189604DE8];
  CFDictionaryAddValue(v9, (const void *)*MEMORY[0x18960BE30], (const void *)*MEMORY[0x189604DE8]);
  CFTypeRef result = 0LL;
  *a5 = SecItemCopyMatching(v9, &result);
  if (result)
  {
    id v12 = objc_alloc(&OBJC_CLASS____SFCertificate);
    *a4 = -[_SFCertificate initWithSecCertificate:](v12, "initWithSecCertificate:", result);
    CFRelease(result);
  }

  id v13 = -[_SFKeychainManager _privateKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_privateKeyAttributesForIdentityIdentifier:accessPolicy:key:",  v8,  0LL,  0LL,  0LL);
  CFDictionaryAddValue(v13, v10, v11);
  *a5 = SecItemCopyMatching(v13, (CFTypeRef *)&v16);
  id v14 = v16;

  return v14;
}

- (id)publicKeyLookupWithIdentifier:(id)a3 certificate:(id)a4 result:(int)a5
{
  v28[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  SecKeyRef key = 0LL;
  id v10 = -[_SFKeychainManager _publicKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_publicKeyAttributesForIdentityIdentifier:accessPolicy:key:",  v8,  0LL,  0LL);
  id v11 = (const void *)*MEMORY[0x18960BE30];
  id v12 = (const void *)*MEMORY[0x189604DE8];
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x18960BE30], (const void *)*MEMORY[0x189604DE8]);
  OSStatus v13 = SecItemCopyMatching(v10, (CFTypeRef *)&key);
  if (v13 != -25300) {
    a5 = v13;
  }
  if (key)
  {
    id v14 = -[_SFKeychainManager _publicKeyAttributesForIdentityIdentifier:accessPolicy:key:]( self,  "_publicKeyAttributesForIdentityIdentifier:accessPolicy:key:",  v8,  0LL,  0LL);
    CFDictionaryAddValue(v14, v11, v12);
    OSStatus v15 = SecItemCopyMatching(v14, (CFTypeRef *)&key);
    if (v15 != -25300) {
      a5 = v15;
    }
    if (key)
    {
      id v16 = SecKeyCopyAttributes(key);
      CFDictionaryGetValue(v16, (const void *)*MEMORY[0x18960B998]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v17 isEqualToString:*MEMORY[0x18960B9A8]])
      {
        id v18 = &OBJC_CLASS____SFECPublicKey;
      }

      else
      {
        if (![v17 isEqualToString:*MEMORY[0x18960B9D0]])
        {
          CFRelease(key);
          CFRelease(v16);
          id v23 = (void *)MEMORY[0x189607870];
          v27 = @"SFKeychainErrorKeyType";
          v28[0] = v17;
          [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:&v27 count:1];
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 errorWithDomain:@"SFKeychainErrorDomain" code:1 userInfo:v24];
          id v21 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = +[_SFKeychainFetchResult fetchResultWithError:]( &OBJC_CLASS____SFKeychainIdentityFetchResult,  "fetchResultWithError:",  v21);
          goto LABEL_14;
        }

        id v18 = &OBJC_CLASS___SFRSAPublicKey;
      }

      id v20 = objc_alloc(v18);
      id v21 = (void *)[v20 initWithSecKey:key];
      CFRelease(key);
      CFRelease(v16);
      id v22 = -[_SFIdentity initWithPublicKey:certificate:]( objc_alloc(&OBJC_CLASS____SFIdentity),  "initWithPublicKey:certificate:",  v21,  v9);
      v19 = +[_SFKeychainFetchResult fetchResultWithValue:]( &OBJC_CLASS____SFKeychainIdentityFetchResult,  "fetchResultWithValue:",  v22);
LABEL_14:
      goto LABEL_15;
    }
  }

  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:a5 userInfo:0];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = +[_SFKeychainFetchResult fetchResultWithError:]( &OBJC_CLASS____SFKeychainIdentityFetchResult,  "fetchResultWithError:",  v17);
LABEL_15:

  return v19;
}

- (id)identityForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0LL;
  OSStatus v13 = &v12;
  uint64_t v14 = 0x3032000000LL;
  OSStatus v15 = __Block_byref_object_copy_;
  id v16 = __Block_byref_object_dispose_;
  id v17 = 0LL;
  -[_SFKeychainManager keychainManagerQueue](self, "keychainManagerQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __44___SFKeychainManager_identityForIdentifier___block_invoke;
  block[3] = &unk_18A054318;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)identityForIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[_SFKeychainManager keychainManagerQueue](self, "keychainManagerQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58___SFKeychainManager_identityForIdentifier_resultHandler___block_invoke;
  block[3] = &unk_18A054368;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (void)removeItemWithIdentifier:(id)a3 resultHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[_SFKeychainManager keychainReplyQueue](self, "keychainReplyQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __61___SFKeychainManager_removeItemWithIdentifier_resultHandler___block_invoke;
  block[3] = &unk_18A0543B8;
  id v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (OS_dispatch_queue)keychainManagerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setKeychainManagerQueue:(id)a3
{
}

- (OS_dispatch_queue)keychainReplyQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setKeychainReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end