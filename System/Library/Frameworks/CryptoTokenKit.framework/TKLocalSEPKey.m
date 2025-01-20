@interface TKLocalSEPKey
+ (BOOL)hasSEP;
+ (BOOL)isDaytona;
+ (BOOL)isGibraltar;
+ (id)_testing_callerEntitlements;
+ (id)_testing_keybagHandle;
+ (id)protectionForKeyClass:(int)a3;
+ (int)keyClassForProtection:(id)a3;
+ (int)keybagHandleForceSystemSession:(BOOL)a3;
+ (void)setContextErrorHandler:(id)a3;
+ (void)set_testing_callerEntitlements:(id)a3;
+ (void)set_testing_keybagHandle:(id)a3;
+ (void)setupKeybagForTesting:(BOOL)a3;
- (BOOL)callerHasEntitlement:(id)a3 error:(id *)a4;
- (BOOL)error:(id *)a3 withAKSReturn:(int)a4 ACMHandle:(id)a5 AKSOperation:(id)a6 params:(id)a7 message:(id)a8;
- (BOOL)evaluateRequirementIgnoringAccessGroups:(__ACMRequirement *)a3;
- (BOOL)systemKey;
- (NSString)callerName;
- (NSXPCConnection)caller;
- (__SecAccessControl)accessControl;
- (id)_initWithAuthContext:(id)a3 caller:(id)a4;
- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10;
- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7;
- (id)authContextWithError:(id *)a3;
- (id)encodedAccessGroups;
- (id)parametersWithACMHandle:(id)a3;
- (id)sac;
- (id)valueForEntitlement:(id)a3;
- (void)processAccessGroupsOfACLDictionary:(id)a3 intoGroups:(id)a4 callerGroups:(id)a5;
- (void)setSac:(id)a3;
@end

@implementation TKLocalSEPKey

+ (BOOL)hasSEP
{
  return MGGetBoolAnswer();
}

+ (BOOL)isDaytona
{
  return 0;
}

+ (BOOL)isGibraltar
{
  return 0;
}

- (id)valueForEntitlement:(id)a3
{
  v4 = (__CFString *)a3;
  if (_testingCallerEntitlements)
  {
    [(id)_testingCallerEntitlements objectForKeyedSubscript:v4];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v6 = -[TKLocalSEPKey caller](self, "caller");
    if (v6)
    {
      v7 = -[TKLocalSEPKey caller](self, "caller");
      [v7 valueForEntitlement:v4];
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      if (valueForEntitlement__onceToken != -1) {
        dispatch_once(&valueForEntitlement__onceToken, &__block_literal_global_85);
      }
      CFErrorRef error = 0LL;
      v5 = (void *)SecTaskCopyValueForEntitlement((SecTaskRef)valueForEntitlement__selfTask, v4, &error);
    }
  }

  return v5;
}

SecTaskRef __37__TKLocalSEPKey_valueForEntitlement___block_invoke()
{
  SecTaskRef result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x189604DB0]);
  valueForEntitlement__selfTask = (uint64_t)result;
  return result;
}

- (void)processAccessGroupsOfACLDictionary:(id)a3 intoGroups:(id)a4 callerGroups:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __76__TKLocalSEPKey_processAccessGroupsOfACLDictionary_intoGroups_callerGroups___block_invoke;
  v12[3] = &unk_189F8AF78;
  id v13 = v9;
  id v14 = v8;
  v15 = self;
  id v10 = v8;
  id v11 = v9;
  [a3 enumerateKeysAndObjectsUsingBlock:v12];
}

void __76__TKLocalSEPKey_processAccessGroupsOfACLDictionary_intoGroups_callerGroups___block_invoke( id *a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if ([a2 isEqualToString:@"cag"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      id v6 = v5;
LABEL_17:

      goto LABEL_18;
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      __int128 v14 = 0u;
      __int128 v15 = 0u;
      __int128 v12 = 0u;
      __int128 v13 = 0u;
      id v6 = v5;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v13;
        do
        {
          for (uint64_t i = 0LL; i != v8; ++i)
          {
            if (*(void *)v13 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * i);
          }

          uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }

        while (v8);
      }

      goto LABEL_17;
    }
  }

  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      [a1[6] processAccessGroupsOfACLDictionary:v5 intoGroups:a1[5] callerGroups:a1[4]];
    }
  }

- (id)encodedAccessGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TKLocalSEPKey sac](self, "sac");
  if (v4)
  {
    -[TKLocalSEPKey valueForEntitlement:](self, "valueForEntitlement:", @"keychain-access-groups");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      id v6 = v5;
    }
    else {
      id v6 = (void *)MEMORY[0x189604A58];
    }
    uint64_t v7 = (void *)[v6 mutableCopy];
    -[TKLocalSEPKey valueForEntitlement:](self, "valueForEntitlement:", @"application-identifier");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0) {
      [v7 addObject:v8];
    }
    if ([v7 count])
    {
      -[TKLocalSEPKey accessControl](self, "accessControl");
      SecAccessControlGetConstraints();
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey processAccessGroupsOfACLDictionary:intoGroups:callerGroups:]( self,  "processAccessGroupsOfACLDictionary:intoGroups:callerGroups:",  v9,  v3,  v7);
    }
  }

  id v10 = -[TKBERTLVRecord initWithPropertyList:](objc_alloc(&OBJC_CLASS___TKBERTLVRecord), "initWithPropertyList:", v3);
  -[TKTLVRecord data](v10, "data");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)parametersWithACMHandle:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___TKAKSParameters);
  -[TKAKSParameters setData:forKey:](v5, "setData:forKey:", v4, 3LL);

  -[TKLocalSEPKey encodedAccessGroups](self, "encodedAccessGroups");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKAKSParameters setData:forKey:](v5, "setData:forKey:", v6, 1LL);

  return v5;
}

+ (void)setContextErrorHandler:(id)a3
{
  uint64_t v3 = MEMORY[0x18959C69C](a3, a2);
  id v4 = (void *)contextErrorHandler;
  contextErrorHandler = v3;
}

- (BOOL)evaluateRequirementIgnoringAccessGroups:(__ACMRequirement *)a3
{
  int Type = ACMRequirementGetType(a3, a2);
  if (Type == 8)
  {
    return ACMRequirementGetState(a3) == 1;
  }

  else
  {
    if (Type == 7)
    {
      uint64_t v16 = 0LL;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x2020000000LL;
      int v19 = 0;
      uint64_t v6 = MEMORY[0x1895F87A8];
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      v15[2] = __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke;
      v15[3] = &unk_189F8AFA0;
      v15[4] = self;
      v15[5] = &v16;
      ACMRequirementGetSubrequirements((int *)a3, (uint64_t)v15);
      uint64_t v11 = 0LL;
      __int128 v12 = &v11;
      uint64_t v13 = 0x2020000000LL;
      int v14 = 0;
      v10[0] = v6;
      v10[1] = 3221225472LL;
      v10[2] = __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke_2;
      v10[3] = &unk_189F8AFC8;
      v10[4] = &v11;
      ACMRequirementGetProperty((int *)a3, 700, (uint64_t)v10);
      BOOL v7 = *((_DWORD *)v17 + 6) >= *((_DWORD *)v12 + 6);
      _Block_object_dispose(&v11, 8);
      _Block_object_dispose(&v16, 8);
      return v7;
    }

    return ACMRequirementGetState(a3) == 2;
  }

uint64_t __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) evaluateRequirementIgnoringAccessGroups:a2];
  if ((_DWORD)result) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  }
  return result;
}

uint64_t __57__TKLocalSEPKey_evaluateRequirementIgnoringAccessGroups___block_invoke_2( uint64_t result,  _DWORD *a2,  uint64_t a3)
{
  if (a3 == 4) {
    *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = *a2;
  }
  return result;
}

- (BOOL)error:(id *)a3 withAKSReturn:(int)a4 ACMHandle:(id)a5 AKSOperation:(id)a6 params:(id)a7 message:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  v59[1] = *MEMORY[0x1895F89C0];
  id v13 = a5;
  id v14 = a6;
  id v46 = a7;
  id v15 = a8;
  if (!a3)
  {
LABEL_34:
    TK_LOG_sepkey_0();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v42 = -[TKLocalSEPKey callerName](self, "callerName");
      v43 = -[TKLocalSEPKey accessControl](self, "accessControl");
      *(_DWORD *)buf = 138544898;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v42;
      *(_WORD *)&buf[22] = 2114;
      id v52 = v15;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v11;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v11;
      *(_WORD *)v55 = 2114;
      *(void *)&v55[2] = v43;
      __int16 v56 = 2114;
      id v57 = v46;
      _os_log_error_impl( &dword_186E58000,  v38,  OS_LOG_TYPE_ERROR,  "%{public}@: (%{public}@) %{public}@: error %08x(%d) ACL=%{public}@ params=%{public}@",  buf,  0x40u);
    }

    goto LABEL_36;
  }

  v58 = @"AKSError";
  [MEMORY[0x189607968] numberWithInt:v11];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = v16;
  [MEMORY[0x189603F68] dictionaryWithObjects:v59 forKeys:&v58 count:1];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = (void *)[v17 mutableCopy];

  if (v15)
  {
    [NSString stringWithFormat:@"%@: %@", self, v15];
    int v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x189607490]];
  }

  if ((_DWORD)v11 == -536870174)
  {
    [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607670] code:-25308 userInfo:v18];
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_34;
  }

  if ((_DWORD)v11 == -536363000 && v14)
  {
    TK_LOG_sepkey_0();
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:].cold.2();
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    LOBYTE(v52) = 0;
    id v21 = v13;
    v22 = ACMContextCreateWithExternalForm((_OWORD *)[v21 bytes], objc_msgSend(v21, "length"));
    if (v22)
    {
      v23 = -[TKLocalSEPKey sac](self, "sac");
      SecAccessControlGetConstraint();
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = -[TKBERTLVRecord initWithPropertyList:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithPropertyList:",  v44);
      v25 = -[TKTLVRecord data](v24, "data");
      -[TKLocalSEPKey encodedAccessGroups](self, "encodedAccessGroups");
      id v26 = v48 = 3;
      uint64_t v49 = [v26 bytes];
      int v50 = [v26 length];
      id v27 = v25;
      v28 = (const void *)[v27 bytes];
      uint64_t v29 = [v27 length];
      v47[0] = MEMORY[0x1895F87A8];
      v47[1] = 3221225472LL;
      v47[2] = __75__TKLocalSEPKey_error_withAKSReturn_ACMHandle_AKSOperation_params_message___block_invoke;
      v47[3] = &unk_189F8AFF0;
      v47[4] = self;
      v47[5] = buf;
      ACMContextVerifyAclConstraint(v22, v28, v29, 1u, &v48, 1u, 0xFFFFFFFF, (uint64_t)v47);
      ACMContextDelete(v22, 0);
    }

    if (*(_BYTE *)(*(void *)&buf[8] + 24LL))
    {
      TK_LOG_sepkey_0();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[TKLocalSEPKey error:withAKSReturn:ACMHandle:AKSOperation:params:message:].cold.1();
      }

      _Block_object_dispose(buf, 8);
      uint64_t v31 = -5LL;
      goto LABEL_29;
    }

    _Block_object_dispose(buf, 8);
    BOOL v32 = 0;
  }

  else
  {
    if ((_DWORD)v11 == -536870170) {
      uint64_t v31 = -1LL;
    }
    else {
      uint64_t v31 = -3LL;
    }
    if ((_DWORD)v11 != -536363000 && (_DWORD)v11 != -536870194) {
      goto LABEL_29;
    }
    BOOL v32 = v11 == -536870194;
    if (!v14) {
      goto LABEL_25;
    }
  }

  [v18 setObject:v14 forKeyedSubscript:@"operation"];
LABEL_25:
  uint64_t v31 = -9LL;
  if (v13)
  {
    if (v32)
    {
      id v33 = v13;
      v34 = ACMContextCreateWithExternalForm((_OWORD *)[v33 bytes], objc_msgSend(v33, "length"));
      v35 = v34;
      if (v34)
      {
        ACMContextRemovePassphraseCredentialsByPurposeAndScope(v34, 0, 1);
        ACMContextDelete(v35, 0);
      }
    }
  }

uint64_t __75__TKLocalSEPKey_error_withAKSReturn_ACMHandle_AKSOperation_params_message___block_invoke( uint64_t result,  int a2,  char a3,  uint64_t a4)
{
  if (!a2 && (a3 & 1) == 0)
  {
    uint64_t v4 = result;
    uint64_t result = [*(id *)(result + 32) evaluateRequirementIgnoringAccessGroups:a4];
    if ((_DWORD)result) {
      *(_BYTE *)(*(void *)(*(void *)(v4 + 40) + 8LL) + 24LL) = 1;
    }
  }

  return result;
}

- (id)authContextWithError:(id *)a3
{
  v22[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[TKSEPKey authContext](self, "authContext");
  if (v4)
  {
    id v5 = (void *)v4;
    uint64_t v6 = 0LL;
LABEL_7:
    [v5 externalizedContext];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      uint64_t v9 = -[TKAuthContext initWithLAContext:ACMHandle:sharedResource:]( objc_alloc(&OBJC_CLASS___TKAuthContext),  "initWithLAContext:ACMHandle:sharedResource:",  v5,  v8,  v6);
    }

    else
    {
      TK_LOG_sepkey_0();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[TKLocalSEPKey authContextWithError:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
      }

      if (a3)
      {
        uint64_t v18 = (void *)MEMORY[0x189607870];
        uint64_t v21 = *MEMORY[0x1896075E0];
        v22[0] = @"LAContext.externalizedContext failed";
        [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        int v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:v19];
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      if (contextErrorHandler) {
        (*(void (**)(void))(contextErrorHandler + 16))();
      }
      uint64_t v9 = 0LL;
    }

    goto LABEL_17;
  }

  if (authContextWithError__onceToken != -1) {
    dispatch_once(&authContextWithError__onceToken, &__block_literal_global_103);
  }
  [(id)authContextWithError__sharedResourceSlot resourceWithError:a3];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 object];
  if (v7)
  {
    id v5 = (void *)v7;
    goto LABEL_7;
  }

  TK_LOG_sepkey_0();
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_FAULT)) {
    -[TKLocalSEPKey authContextWithError:].cold.1((uint64_t *)a3, (os_log_s *)v5);
  }
  uint64_t v9 = 0LL;
LABEL_17:

  return v9;
}

uint64_t __38__TKLocalSEPKey_authContextWithError___block_invoke()
{
  v0 = -[TKSharedResourceSlot initWithName:]( objc_alloc(&OBJC_CLASS___TKSharedResourceSlot),  "initWithName:",  @"LAContext/ACMHandle temporary default slot");
  v1 = (void *)authContextWithError__sharedResourceSlot;
  authContextWithError__sharedResourceSlot = (uint64_t)v0;

  [(id)authContextWithError__sharedResourceSlot setIdleTimeout:3.0];
  [(id)authContextWithError__sharedResourceSlot setCreateObjectBlock:&__block_literal_global_108];
  return [(id)authContextWithError__sharedResourceSlot setObjectDestroyedBlock:&__block_literal_global_112];
}

id __38__TKLocalSEPKey_authContextWithError___block_invoke_2()
{
  do
    uint64_t v0 = __ldaxr((unsigned int *)&TKAuthContextSerialNumber);
  while (__stlxr(v0 + 1, (unsigned int *)&TKAuthContextSerialNumber));
  TK_LOG_sepkey_0();
  v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __38__TKLocalSEPKey_authContextWithError___block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }

  return objc_alloc_init(MEMORY[0x189608728]);
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_110()
{
  uint64_t v0 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __38__TKLocalSEPKey_authContextWithError___block_invoke_110_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

+ (id)_testing_keybagHandle
{
  return (id)_testing_keybagHandle;
}

+ (void)set_testing_keybagHandle:(id)a3
{
}

+ (int)keybagHandleForceSystemSession:(BOOL)a3
{
  if (_enableTesting) {
    return _testingKeybagHandle;
  }
  if (_testing_keybagHandle) {
    return objc_msgSend((id)_testing_keybagHandle, "intValue", a3);
  }
  if (!a3) {
    return 0;
  }
  TK_LOG_sepkey_0();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[TKLocalSEPKey keybagHandleForceSystemSession:].cold.1();
  }

  return -6;
}

+ (void)setupKeybagForTesting:(BOOL)a3
{
  if (a3)
  {
    if (!_testingKeybagHandle)
    {
      if (aks_create_bag())
      {
        TK_LOG_sepkey_0();
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
          +[TKLocalSEPKey setupKeybagForTesting:].cold.3();
        }
      }

      if (aks_ref_key_enable_test_keys())
      {
        TK_LOG_sepkey_0();
        uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
          +[TKLocalSEPKey setupKeybagForTesting:].cold.2();
        }
      }

      aks_get_device_state();
      if ((v10 & 0x80) == 0)
      {
        TK_LOG_sepkey_0();
        uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
          +[TKLocalSEPKey setupKeybagForTesting:].cold.1();
        }
      }
    }
  }

  else if (_testingKeybagHandle)
  {
    if (aks_save_bag())
    {
      TK_LOG_sepkey_0();
      uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:].cold.6();
      }
    }

    if (aks_unload_bag())
    {
      TK_LOG_sepkey_0();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:].cold.5();
      }
    }

    if (aks_invalidate_bag())
    {
      TK_LOG_sepkey_0();
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        +[TKLocalSEPKey setupKeybagForTesting:].cold.4();
      }
    }
  }

  _enableTesting = a3;
}

+ (id)_testing_callerEntitlements
{
  return (id)_testingCallerEntitlements;
}

+ (void)set_testing_callerEntitlements:(id)a3
{
}

+ (id)protectionForKeyClass:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (protectionForKeyClass__once != -1) {
    dispatch_once(&protectionForKeyClass__once, &__block_literal_global_116);
  }
  uint64_t v4 = (void *)protectionForKeyClass__protections;
  [MEMORY[0x189607968] numberWithInt:v3];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v5];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = (void *)*MEMORY[0x18960B860];
  }
  id v8 = v7;

  return v8;
}

void __39__TKLocalSEPKey_protectionForKeyClass___block_invoke()
{
  v10[8] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x18960B860];
  v9[0] = &unk_189F984E0;
  v9[1] = &unk_189F984F8;
  uint64_t v1 = *MEMORY[0x18960B830];
  v10[0] = v0;
  v10[1] = v1;
  uint64_t v2 = *MEMORY[0x18960B840];
  v9[2] = &unk_189F98510;
  v9[3] = &unk_189F98528;
  uint64_t v3 = *MEMORY[0x18960B868];
  v10[2] = v2;
  v10[3] = v3;
  uint64_t v4 = *MEMORY[0x18960B838];
  v9[4] = &unk_189F98540;
  v9[5] = &unk_189F98558;
  uint64_t v5 = *MEMORY[0x18960B848];
  v10[4] = v4;
  void v10[5] = v5;
  v9[6] = &unk_189F98570;
  v9[7] = &unk_189F98588;
  uint64_t v6 = *MEMORY[0x18960B850];
  v10[6] = *MEMORY[0x18960B858];
  v10[7] = v6;
  uint64_t v7 = [MEMORY[0x189603F68] dictionaryWithObjects:v10 forKeys:v9 count:8];
  id v8 = (void *)protectionForKeyClass__protections;
  protectionForKeyClass__protections = v7;
}

+ (int)keyClassForProtection:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (keyClassForProtection__once == -1)
  {
    if (!v3)
    {
LABEL_6:
      int v7 = 6;
      goto LABEL_7;
    }
  }

  else
  {
    dispatch_once(&keyClassForProtection__once, &__block_literal_global_125);
    if (!v4) {
      goto LABEL_6;
    }
  }

  [(id)keyClassForProtection__protections objectForKeyedSubscript:v4];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  int v7 = [v5 integerValue];

LABEL_7:
  return v7;
}

void __39__TKLocalSEPKey_keyClassForProtection___block_invoke()
{
  v7[8] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x18960B830];
  v6[0] = *MEMORY[0x18960B860];
  v6[1] = v0;
  v7[0] = &unk_189F984E0;
  v7[1] = &unk_189F984F8;
  uint64_t v1 = *MEMORY[0x18960B868];
  v6[2] = *MEMORY[0x18960B840];
  v6[3] = v1;
  v7[2] = &unk_189F98510;
  v7[3] = &unk_189F98528;
  uint64_t v2 = *MEMORY[0x18960B848];
  v6[4] = *MEMORY[0x18960B838];
  v6[5] = v2;
  v7[4] = &unk_189F98540;
  v7[5] = &unk_189F98558;
  uint64_t v3 = *MEMORY[0x18960B850];
  v6[6] = *MEMORY[0x18960B858];
  v6[7] = v3;
  v7[6] = &unk_189F98570;
  v7[7] = &unk_189F98588;
  uint64_t v4 = [MEMORY[0x189603F68] dictionaryWithObjects:v7 forKeys:v6 count:8];
  uint64_t v5 = (void *)keyClassForProtection__protections;
  keyClassForProtection__protections = v4;
}

- (BOOL)systemKey
{
  return 0;
}

- (__SecAccessControl)accessControl
{
  return (__SecAccessControl *)self->_sac;
}

- (id)_initWithAuthContext:(id)a3 caller:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___TKLocalSEPKey;
  id v8 = -[TKSEPKey _initWithAuthContext:](&v11, sel__initWithAuthContext_, a3);
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong(v8 + 3, a4);
  }

  return v9;
}

- (id)_initWithObjectID:(id)a3 authContext:(id)a4 caller:(id)a5 forceSystemSession:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  char v17 = 0;
  id v15 = -[TKLocalSEPSystemKey _initWithObjectID:authContext:caller:isIDUnknown:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPSystemKey),  "_initWithObjectID:authContext:caller:isIDUnknown:error:",  v12,  v13,  v14,  &v17,  a7);

  if (!v15)
  {
    if (v17) {
      id v15 = -[TKLocalSEPRefKey _initWithObjectID:authContext:caller:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPRefKey),  "_initWithObjectID:authContext:caller:forceSystemSession:error:",  v12,  v13,  v14,  v8,  a7);
    }
    else {
      id v15 = 0LL;
    }
  }

  return v15;
}

- (id)_initWithKeyType:(id)a3 keySize:(int64_t)a4 accessControl:(__SecAccessControl *)a5 options:(id)a6 authContext:(id)a7 caller:(id)a8 forceSystemSession:(BOOL)a9 error:(id *)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a3;
  LOBYTE(v22) = a9;
  id v20 = -[TKLocalSEPRefKey _initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:]( objc_alloc(&OBJC_CLASS___TKLocalSEPRefKey),  "_initWithKeyType:keySize:accessControl:options:authContext:caller:forceSystemSession:error:",  v19,  a4,  a5,  v18,  v17,  v16,  v22,  a10);

  return v20;
}

- (BOOL)callerHasEntitlement:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[TKLocalSEPKey valueForEntitlement:](self, "valueForEntitlement:", v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v7 BOOLValue])
  {
    BOOL v8 = 1;
  }

  else
  {
    TK_LOG_sepkey_0();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[TKLocalSEPKey callerHasEntitlement:error:].cold.1(self, (uint64_t)v6, v9);
    }

    if (a4)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:0];
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (NSString)callerName
{
  if (!self->_callerName)
  {
    -[TKLocalSEPKey caller](self, "caller");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[TKLocalSEPKey caller](self, "caller");
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v5 = v4;
      if (v4) {
        [v4 auditToken];
      }
      else {
        memset(&audittoken, 0, sizeof(audittoken));
      }

      id v9 = [MEMORY[0x189603FB8] dataWithLength:4096];
      int v10 = proc_pidpath_audittoken(&audittoken, (void *)[v9 mutableBytes], objc_msgSend(v9, "length"));
      id v11 = objc_alloc(NSString);
      id v6 = v9;
      id v12 = (void *)objc_msgSend(v11, "initWithBytes:length:encoding:", objc_msgSend(v6, "bytes"), v10, 4);
      id v13 = (void *)NSString;
      [v12 lastPathComponent];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKLocalSEPKey caller](self, "caller");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 stringWithFormat:@"%@<%d>", v14, objc_msgSend(v15, "processIdentifier")];
      id v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      callerName = self->_callerName;
      self->_callerName = v16;
    }

    else
    {
      [MEMORY[0x1896079D8] processInfo];
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      [v6 processName];
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      BOOL v8 = self->_callerName;
      self->_callerName = v7;
    }
  }

  return self->_callerName;
}

- (NSXPCConnection)caller
{
  return self->_caller;
}

- (id)sac
{
  return self->_sac;
}

- (void)setSac:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)error:withAKSReturn:ACMHandle:AKSOperation:params:message:.cold.1()
{
}

- (void)error:withAKSReturn:ACMHandle:AKSOperation:params:message:.cold.2()
{
}

- (void)authContextWithError:(uint64_t *)a1 .cold.1(uint64_t *a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (a1) {
    uint64_t v2 = *a1;
  }
  else {
    uint64_t v2 = 0LL;
  }
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl( &dword_186E58000,  a2,  OS_LOG_TYPE_FAULT,  "failed to create shared resource: %{public}@",  (uint8_t *)&v3,  0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)authContextWithError:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_186E58000, a1, a3, "LAContext.externalizedContext(sn=%d) failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_2_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_10_1(&dword_186E58000, a2, a3, "creating temporary context(sn=%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __38__TKLocalSEPKey_authContextWithError___block_invoke_110_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  OUTLINED_FUNCTION_10_1(&dword_186E58000, a1, a3, "deleting temporary context(sn=%d)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

+ (void)keybagHandleForceSystemSession:.cold.1()
{
}

+ (void)setupKeybagForTesting:.cold.1()
{
}

+ (void)setupKeybagForTesting:.cold.2()
{
  OUTLINED_FUNCTION_2_0(&dword_186E58000, v0, v1, "Failed to enable test keys, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.3()
{
  OUTLINED_FUNCTION_2_0(&dword_186E58000, v0, v1, "Failed to create testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.4()
{
  OUTLINED_FUNCTION_2_0(&dword_186E58000, v0, v1, "Failed to invalidate testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.5()
{
  OUTLINED_FUNCTION_2_0(&dword_186E58000, v0, v1, "Failed to unload testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)setupKeybagForTesting:.cold.6()
{
  OUTLINED_FUNCTION_2_0(&dword_186E58000, v0, v1, "Failed to save testing keybag, err=%08x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)callerHasEntitlement:(os_log_s *)a3 error:.cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [a1 callerName];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_fault_impl( &dword_186E58000,  a3,  OS_LOG_TYPE_FAULT,  "Requested SEP key operation not allowed (%{public}@ is missing '%{public}@' entitlement)",  (uint8_t *)&v6,  0x16u);

  OUTLINED_FUNCTION_2();
}

@end