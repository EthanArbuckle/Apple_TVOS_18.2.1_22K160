@interface TKSEPKey
+ (BOOL)canUseSEPLocally;
+ (BOOL)hasSEP;
+ (BOOL)isDaytona;
+ (BOOL)isGibraltar;
+ (NSDictionary)_testing_callerEntitlements;
+ (NSNumber)_testing_keybagHandle;
+ (TKClientToken)clientToken;
+ (void)setClientToken:(id)a3;
+ (void)setContextErrorHandler:(id)a3;
+ (void)set_testing_callerEntitlements:(id)a3;
+ (void)set_testing_keybagHandle:(id)a3;
+ (void)setupKeybagForTesting:(BOOL)a3;
- (BOOL)deleteWithError:(id *)a3;
- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4;
- (BOOL)systemKey;
- (BOOL)systemSessionKey;
- (LAContext)authContext;
- (NSDictionary)attributes;
- (TKSEPKey)initWithAttributes:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (TKSEPKey)initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9;
- (TKSEPKey)initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6;
- (__SecAccessControl)accessControl;
- (id)_initWithAuthContext:(id)a3;
- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5;
- (id)computeSharedSecret:(id)a3 error:(id *)a4;
- (id)decapsulateKey:(id)a3 error:(id *)a4;
- (id)initLocalWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10;
- (id)initLocalWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7;
- (id)keySize;
- (id)keyType;
- (id)objectID;
- (id)publicKeyWithError:(id *)a3;
- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5;
- (id)signDigest:(id)a3 error:(id *)a4;
- (void)setAuthContext:(id)a3;
@end

@implementation TKSEPKey

+ (BOOL)hasSEP
{
  return +[TKLocalSEPKey hasSEP](&OBJC_CLASS___TKLocalSEPKey, "hasSEP");
}

+ (BOOL)isDaytona
{
  return +[TKLocalSEPKey isDaytona](&OBJC_CLASS___TKLocalSEPKey, "isDaytona");
}

+ (BOOL)isGibraltar
{
  return +[TKLocalSEPKey isGibraltar](&OBJC_CLASS___TKLocalSEPKey, "isGibraltar");
}

+ (TKClientToken)clientToken
{
  return (TKClientToken *)(id)_clientToken;
}

+ (void)setClientToken:(id)a3
{
}

+ (void)setupKeybagForTesting:(BOOL)a3
{
}

+ (NSDictionary)_testing_callerEntitlements
{
  return (NSDictionary *)+[TKLocalSEPKey _testing_callerEntitlements]( &OBJC_CLASS___TKLocalSEPKey,  "_testing_callerEntitlements");
}

+ (void)set_testing_callerEntitlements:(id)a3
{
}

+ (NSNumber)_testing_keybagHandle
{
  return (NSNumber *)+[TKLocalSEPKey _testing_keybagHandle](&OBJC_CLASS___TKLocalSEPKey, "_testing_keybagHandle");
}

+ (void)set_testing_keybagHandle:(id)a3
{
}

+ (void)setContextErrorHandler:(id)a3
{
}

+ (BOOL)canUseSEPLocally
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2) {
    return 0;
  }
  if (canUseSEPLocally_onceToken != -1) {
    dispatch_once(&canUseSEPLocally_onceToken, &__block_literal_global_3);
  }
  return canUseSEPLocally_hasEntitlement;
}

void __28__TKSEPKey_canUseSEPLocally__block_invoke()
{
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x189604DB0]);
  v1 = (void *)SecTaskCopyValueForEntitlement(v0, @"com.apple.keystore.access-keychain-keys", 0LL);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v1 integerValue])
  {
    TK_LOG_sepkey();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( &dword_186E58000,  v2,  OS_LOG_TYPE_INFO,  "Detected com.apple.keystore.access-keychain-keys entitlement, using in-process SEP SecKey implementation",  v5,  2u);
    }

    canUseSEPLocally_hasEntitlement = 1;
    v3 = (void *)SecTaskCopyValueForEntitlement(v0, @"com.apple.keystore.sik.access", 0LL);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v3 integerValue])
    {
      TK_LOG_sepkey();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        __28__TKSEPKey_canUseSEPLocally__block_invoke_cold_1(v4);
      }
    }
  }

  else
  {
    v3 = v1;
  }
}

- (id)_initWithAuthContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TKSEPKey;
  v6 = -[TKSEPKey init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_authContext, a3);
  }

  return v7;
}

- (TKSEPKey)initWithObjectID:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  v20[1] = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[TKBERTLVRecord initWithPropertyList:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithPropertyList:",  v10);
    uint64_t v13 = -[TKTLVRecord data](v12, "data");

    id v10 = (id)v13;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_16:
    if ([(id)objc_opt_class() canUseSEPLocally]) {
      v14 = -[TKLocalSEPKey _initWithObjectID:authContext:caller:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPKey),  "_initWithObjectID:authContext:caller:forceSystemSession:error:",  v10,  v11,  0LL,  v7,  a6);
    }
    else {
      v14 = -[TKRemoteSEPKey _initWithObjectID:authContext:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKRemoteSEPKey),  "_initWithObjectID:authContext:forceSystemSession:error:",  v10,  v11,  v7,  a6);
    }
    a6 = v14;
  }

  else if (a6)
  {
    TK_LOG_sepkey();
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:].cold.1((uint64_t)v10, v16);
    }

    v17 = (void *)MEMORY[0x189607870];
    uint64_t v19 = *MEMORY[0x189607490];
    v20[0] = @"objectID of unexpected type";
    [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:v18];
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0LL;
  }

  return (TKSEPKey *)a6;
}

- (TKSEPKey)initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 forceSystemSession:(BOOL)a8 error:(id *)a9
{
  BOOL v9 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  if ([(id)objc_opt_class() canUseSEPLocally])
  {
    LOBYTE(v21) = v9;
    v18 = -[TKLocalSEPKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPKey),  "_initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:",  v17,  a4,  a5,  v16,  v15,  0LL,  v21,  a9);
  }

  else
  {
    v18 = -[TKRemoteSEPKey _initWithKeyType:keySize:accessControl:options:authContext:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKRemoteSEPKey),  "_initWithKeyType:keySize:accessControl:options:authContext:forceSystemSession:error:",  v17,  a4,  a5,  v16,  v15,  v9,  a9);
  }

  uint64_t v19 = v18;

  return v19;
}

- (id)initLocalWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = -[TKLocalSEPKey _initWithObjectID:authContext:caller:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPKey),  "_initWithObjectID:authContext:caller:forceSystemSession:error:",  v14,  v13,  v12,  v8,  a7);

  return v15;
}

- (id)initLocalWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  LOBYTE(v22) = a9;
  id v20 = -[TKLocalSEPKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPKey),  "_initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:",  v19,  a4,  a5,  v18,  v17,  v16,  v22,  a10);

  return v20;
}

- (id)objectID
{
  return 0LL;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)*MEMORY[0x189605018];
}

- (id)keyType
{
  return (id)*MEMORY[0x18960B998];
}

- (id)keySize
{
  return 0LL;
}

- (BOOL)systemKey
{
  return 0;
}

- (BOOL)systemSessionKey
{
  return 0;
}

- (BOOL)deleteWithError:(id *)a3
{
  if (a3)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (id)publicKeyWithError:(id *)a3
{
  if (a3)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)signDigest:(id)a3 error:(id *)a4
{
  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)computeSharedSecret:(id)a3 error:(id *)a4
{
  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)recryptData:(id)a3 attributes:(id)a4 error:(id *)a5
{
  if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)decapsulateKey:(id)a3 error:(id *)a4
{
  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (id)attestKey:(id)a3 nonce:(id)a4 error:(id *)a5
{
  if (a5)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0LL;
}

- (BOOL)lifetimeControlWithType:(int64_t)a3 error:(id *)a4
{
  if (a4)
  {
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-1 userInfo:0];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return 0;
}

- (NSDictionary)attributes
{
  v28[17] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *MEMORY[0x18960BB38];
  v28[0] = *MEMORY[0x18960BB60];
  uint64_t v4 = *MEMORY[0x18960B998];
  v27[0] = v3;
  v27[1] = v4;
  -[TKSEPKey keyType](self, "keyType");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v5;
  v27[2] = *MEMORY[0x18960B988];
  v6 = -[TKSEPKey keySize](self, "keySize");
  v28[2] = v6;
  v27[3] = *MEMORY[0x18960B920];
  -[TKSEPKey keySize](self, "keySize");
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x18960B968];
  uint64_t v9 = *MEMORY[0x18960B970];
  v28[3] = v7;
  v28[4] = v9;
  uint64_t v10 = *MEMORY[0x18960B950];
  v27[4] = v8;
  v27[5] = v10;
  uint64_t v11 = *MEMORY[0x18960B940];
  v28[5] = MEMORY[0x189604A88];
  v28[6] = MEMORY[0x189604A80];
  uint64_t v12 = *MEMORY[0x18960B930];
  v27[6] = v11;
  v27[7] = v12;
  uint64_t v13 = *MEMORY[0x18960BAE8];
  v28[7] = MEMORY[0x189604A80];
  v28[8] = MEMORY[0x189604A88];
  uint64_t v14 = *MEMORY[0x18960B8C8];
  v27[8] = v13;
  v27[9] = v14;
  uint64_t v15 = *MEMORY[0x18960B8B8];
  v28[9] = MEMORY[0x189604A80];
  v28[10] = MEMORY[0x189604A80];
  uint64_t v16 = *MEMORY[0x18960B8C0];
  v27[10] = v15;
  v27[11] = v16;
  uint64_t v17 = *MEMORY[0x18960B8D0];
  v28[11] = MEMORY[0x189604A88];
  v28[12] = MEMORY[0x189604A88];
  uint64_t v18 = *MEMORY[0x18960B8E0];
  v27[12] = v17;
  v27[13] = v18;
  uint64_t v19 = *MEMORY[0x18960B8E8];
  v28[13] = MEMORY[0x189604A80];
  v28[14] = MEMORY[0x189604A80];
  uint64_t v20 = *MEMORY[0x18960B818];
  v27[14] = v19;
  v27[15] = v20;
  -[TKSEPKey accessControl](self, "accessControl");
  uint64_t v21 = (void *)SecAccessControlCopyData();
  v28[15] = v21;
  v27[16] = *MEMORY[0x18960BAD8];
  -[TKSEPKey objectID](self, "objectID");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[16] = v22;
  [MEMORY[0x189603F68] dictionaryWithObjects:v28 forKeys:v27 count:17];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)[v23 mutableCopy];

  -[TKSEPKey systemSessionKey](self, "systemSessionKey");
  v25 = (void *)[v24 copy];

  return (NSDictionary *)v25;
}

- (TKSEPKey)initWithAttributes:(id)a3 authContext:(id)a4 forceSystemSession:(BOOL)a5 error:(id *)a6
{
  BOOL v65 = a5;
  v137[17] = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v68 = a4;
  uint64_t v107 = 0LL;
  v108 = &v107;
  uint64_t v109 = 0x3032000000LL;
  v110 = __Block_byref_object_copy__1;
  v111 = __Block_byref_object_dispose__1;
  [MEMORY[0x189603FE8] null];
  id v112 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v101 = 0LL;
  v102 = (id *)&v101;
  uint64_t v103 = 0x3032000000LL;
  v104 = __Block_byref_object_copy__1;
  v105 = __Block_byref_object_dispose__1;
  [MEMORY[0x189603FE8] null];
  id v106 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v97 = 0LL;
  v98 = &v97;
  uint64_t v99 = 0x2020000000LL;
  uint64_t v100 = 0LL;
  uint64_t v8 = *MEMORY[0x18960BB60];
  v136[0] = *MEMORY[0x18960BB38];
  v136[1] = v8;
  [MEMORY[0x189603F18] arrayWithObjects:v136 count:2];
  id obja = (id)objc_claimAutoreleasedReturnValue();
  v137[0] = obja;
  uint64_t v9 = *MEMORY[0x18960B970];
  v135[0] = *MEMORY[0x18960B968];
  v135[1] = v9;
  [MEMORY[0x189603F18] arrayWithObjects:v135 count:2];
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v84;
  uint64_t v66 = *MEMORY[0x18960B998];
  v134[0] = *MEMORY[0x18960B998];
  [MEMORY[0x189603FE8] null];
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v82;
  uint64_t v10 = MEMORY[0x1895F87A8];
  v96[0] = MEMORY[0x1895F87A8];
  v96[1] = 3221225472LL;
  v96[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke;
  v96[3] = &unk_189F8A918;
  v96[4] = &v101;
  v80 = (void *)MEMORY[0x18959C69C](v96);
  v134[2] = v80;
  [MEMORY[0x189603F18] arrayWithObjects:v134 count:3];
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v79;
  v133[0] = *MEMORY[0x18960B988];
  v133[1] = &unk_189F984C8;
  v95[0] = v10;
  v95[1] = 3221225472LL;
  v95[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_20;
  v95[3] = &unk_189F8A940;
  v95[4] = &v97;
  v95[5] = &v101;
  v78 = (void *)MEMORY[0x18959C69C](v95);
  v133[2] = v78;
  [MEMORY[0x189603F18] arrayWithObjects:v133 count:3];
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v137[3] = v77;
  v132[0] = *MEMORY[0x18960B920];
  v132[1] = &unk_189F984C8;
  v94[0] = v10;
  v94[1] = 3221225472LL;
  v94[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2_21;
  v94[3] = &unk_189F8A918;
  v94[4] = &v97;
  v76 = (void *)MEMORY[0x18959C69C](v94);
  v132[2] = v76;
  [MEMORY[0x189603F18] arrayWithObjects:v132 count:3];
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v137[4] = v75;
  uint64_t v131 = *MEMORY[0x18960BE78];
  [MEMORY[0x189603F18] arrayWithObjects:&v131 count:1];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v137[5] = v74;
  uint64_t v11 = v108[5];
  uint64_t v64 = *MEMORY[0x18960B818];
  v130[0] = *MEMORY[0x18960B818];
  v130[1] = v11;
  v93[0] = v10;
  v93[1] = 3221225472LL;
  v93[2] = __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_3;
  v93[3] = &unk_189F8A918;
  v93[4] = &v107;
  v73 = (void *)MEMORY[0x18959C69C](v93);
  v130[2] = v73;
  [MEMORY[0x189603F18] arrayWithObjects:v130 count:3];
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v137[6] = v72;
  uint64_t v12 = MEMORY[0x189604A88];
  v129[0] = *MEMORY[0x18960B950];
  v129[1] = MEMORY[0x189604A88];
  [MEMORY[0x189603F18] arrayWithObjects:v129 count:2];
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v137[7] = v71;
  uint64_t v13 = MEMORY[0x189604A80];
  v128[0] = *MEMORY[0x18960B940];
  v128[1] = MEMORY[0x189604A80];
  [MEMORY[0x189603F18] arrayWithObjects:v128 count:2];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v137[8] = v70;
  v127[0] = *MEMORY[0x18960B930];
  v127[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v127 count:2];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  v137[9] = v14;
  v126[0] = *MEMORY[0x18960BAE8];
  v126[1] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v126 count:2];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v137[10] = v15;
  v125[0] = *MEMORY[0x18960B8C8];
  v125[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v125 count:2];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v137[11] = v16;
  v124[0] = *MEMORY[0x18960B8B8];
  v124[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v124 count:2];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  v137[12] = v17;
  v123[0] = *MEMORY[0x18960B8C0];
  v123[1] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v123 count:2];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  v137[13] = v18;
  v122[0] = *MEMORY[0x18960B8D0];
  v122[1] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v122 count:2];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v137[14] = v19;
  v121[0] = *MEMORY[0x18960B8E0];
  v121[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v121 count:2];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  v137[15] = v20;
  v120[0] = *MEMORY[0x18960B8E8];
  v120[1] = v13;
  [MEMORY[0x189603F18] arrayWithObjects:v120 count:2];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  v137[16] = v21;
  [MEMORY[0x189603F18] arrayWithObjects:v137 count:17];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v89 = 0u;
  __int128 v90 = 0u;
  id obj = v22;
  uint64_t v23 = [obj countByEnumeratingWithState:&v89 objects:v119 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v90;
    uint64_t v85 = *MEMORY[0x189607490];
LABEL_3:
    uint64_t v25 = 0LL;
    while (1)
    {
      if (*(void *)v90 != v24) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v89 + 1) + 8 * v25);
      [v26 objectAtIndexedSubscript:0];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)[v26 count] < 2)
      {
        v28 = 0LL;
      }

      else
      {
        [v26 objectAtIndexedSubscript:1];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
      }

      [v7 objectForKeyedSubscript:v27];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)[v26 count] < 3)
      {
        v31 = 0LL;
        if (v29)
        {
LABEL_11:
          if (v31)
          {
            ((void (**)(void, void *))v31)[2](v31, v29);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            if (!v32) {
              goto LABEL_35;
            }
          }

          else
          {
            else {
              v36 = 0LL;
            }
            id v32 = v36;
            if (!v32)
            {
LABEL_35:
              if (a6)
              {
                v45 = (void *)MEMORY[0x189607870];
                uint64_t v117 = v85;
                [NSString stringWithFormat:@"sepkey: %@ requires '%@' value when present", v27, v28];
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                v118 = v46;
                [MEMORY[0x189603F68] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                [v45 errorWithDomain:@"CryptoTokenKit" code:-8 userInfo:v47];
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }

              v48 = 0LL;
              v43 = obj;
              goto LABEL_44;
            }
          }

          goto LABEL_25;
        }
      }

      else
      {
        [v26 objectAtIndex:2];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void (**)(void, void))MEMORY[0x18959C69C]();

        if (v29) {
          goto LABEL_11;
        }
      }

      if (v28)
      {
        [MEMORY[0x189603FE8] null];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        char v34 = [v28 isEqual:v33];

        if ((v34 & 1) == 0)
        {
          if (v31)
          {
            uint64_t v35 = ((void (**)(void, void *))v31)[2](v31, v28);

            v28 = (void *)v35;
          }

          [v7 setObject:v28 forKeyedSubscript:v27];
        }
      }

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke( uint64_t a1,  void *a2)
{
  id v4 = a2;
  if (_block_invoke_once != -1) {
    dispatch_once(&_block_invoke_once, &__block_literal_global_17);
  }
  if ([(id)_block_invoke_supportedTypes containsObject:v4])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    id v5 = v4;
  }

  else
  {
    id v5 = 0LL;
  }

  return v5;
}

void __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2()
{
  v5[7] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x18960B9B8];
  v5[0] = *MEMORY[0x18960B9B0];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x18960B9E0];
  v5[2] = *MEMORY[0x18960B9E8];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x18960B9F0];
  v5[4] = *MEMORY[0x18960B9C0];
  v5[5] = v2;
  v5[6] = *MEMORY[0x18960B9C8];
  uint64_t v3 = [MEMORY[0x189603F18] arrayWithObjects:v5 count:7];
  id v4 = (void *)_block_invoke_supportedTypes;
  _block_invoke_supportedTypes = v3;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_20( uint64_t a1,  void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 integerValue];
  int v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isEqual:*MEMORY[0x18960B9C8]];
  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (!v4)
  {
    if ((v5 | 0x80) != 0x180) {
      goto LABEL_4;
    }
    goto LABEL_6;
  }

  v6 = v3;
  if (v5 != 1024)
  {
    if (v5 != 768)
    {
LABEL_4:
      v6 = 0LL;
      goto LABEL_7;
    }

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_2_21( uint64_t a1,  void *a2)
{
  uint64_t v3 = [a2 integerValue];
  if (v3 == *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    [MEMORY[0x189607968] numberWithInteger:v3];
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    int v4 = 0LL;
  }

  return v4;
}

id __68__TKSEPKey_initWithAttributes_authContext_forceSystemSession_error___block_invoke_3( uint64_t a1,  void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  return v4;
}

- (LAContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (void).cxx_destruct
{
}

void __28__TKSEPKey_canUseSEPLocally__block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_186E58000,  log,  OS_LOG_TYPE_ERROR,  "Process has com.apple.keystore.access-keychain-keys entitlement but is missing com.apple.keystore.sik.access entitle ment, any attestation attempt will fail",  v1,  2u);
}

- (void)initWithObjectID:(uint64_t)a1 authContext:(os_log_s *)a2 forceSystemSession:error:.cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_ERROR,  "invalid objectID used for SEPKey: %@",  (uint8_t *)&v2,  0xCu);
}

@end