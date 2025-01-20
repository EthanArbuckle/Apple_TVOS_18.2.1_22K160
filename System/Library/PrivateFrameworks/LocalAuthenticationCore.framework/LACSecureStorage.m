@interface LACSecureStorage
+ (BOOL)checkKey:(int64_t)a3 supportsOperation:(int64_t)a4;
+ (BOOL)isKeyAvailable:(int64_t)a3;
+ (BOOL)isKeyAvailable:(int64_t)a3 operation:(int64_t)a4;
+ (BOOL)isKeyAvailableForDataExchange:(int64_t)a3;
+ (Class)classForKey:(int64_t)a3;
+ (id)additionalBoolEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5;
+ (id)maxDataLengthForKey:(int64_t)a3;
+ (id)minDataLengthForKey:(int64_t)a3;
+ (int64_t)policyForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5;
- (BOOL)_checkEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5 connection:(id)a6 failureHandler:(id)a7;
- (LACSecureStorage)initWithConfig:(id)a3;
- (LACSecureStorageConfiguration)config;
- (LACSecureStorageDelegate)delegate;
- (__ACMHandle)_acmContextForUUID:(id)a3 failureHandler:(id)a4;
- (id)_errorNotSupported;
- (id)_storageObjectForKey:(int64_t)a3 data:(id)a4 error:(id *)a5;
- (void)_acmSEPControlForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)_acmVariableForKey:(int64_t)a3 completionHandler:(id)a4;
- (void)_exchangeObject:(id)a3 request:(id)a4 connection:(id)a5 completionHandler:(id)a6;
- (void)_protectedDataWithBundleId:(id)a3 contextID:(id)a4 completionHandler:(id)a5;
- (void)_sepControl:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6;
- (void)_setProtectedData:(id)a3 acl:(id)a4 contextID:(id)a5 completionHandler:(id)a6;
- (void)_setSecureBootModeForACMVariable:(unsigned int)a3 completionHandler:(id)a4;
- (void)_setStandardSecureBootModeCompletionHandler:(id)a3;
- (void)_setVariable:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6;
- (void)_variable:(unsigned int)a3 withcontextID:(id)a4 completionHandler:(id)a5;
- (void)aclForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)objectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)removeObjectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forRequest:(id)a4 connection:(id)a5 completionHandler:(id)a6;
@end

@implementation LACSecureStorage

- (LACSecureStorage)initWithConfig:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACSecureStorage;
  v6 = -[LACSecureStorage init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v7;
}

- (void)objectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 key];
  LACLogStorage();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v34 = v11;
    __int16 v35 = 2114;
    v36 = self;
    __int16 v37 = 1024;
    int v38 = [v8 identifier];
    _os_log_impl(&dword_189219000, v12, OS_LOG_TYPE_DEFAULT, "objectForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_18A36A9E8;
  id v14 = v8;
  id v31 = v14;
  id v15 = v9;
  id v32 = v15;
  v16 = _Block_copy(aBlock);
  BOOL v17 = -[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:]( self,  "_checkEntitlementForKey:operation:value:connection:failureHandler:",  v11,  1LL,  0LL,  v10,  v16);

  if (v17)
  {
    if (v11 == 2)
    {
      v18 = -[LACSecureStorage delegate](self, "delegate");
      [v18 bundleIDForRequest:v14];
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v14 contextID];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACSecureStorage _protectedDataWithBundleId:contextID:completionHandler:]( self,  "_protectedDataWithBundleId:contextID:completionHandler:",  v19,  v20,  v16);
    }

    else if (v11 == 21)
    {
      v21 = +[LACPasscodeHelper sharedInstance](&OBJC_CLASS___LACPasscodeHelper, "sharedInstance");
      [v21 passcodeSuccessAge];
      double v23 = v22;

      if (v23 <= 0.0)
      {
        (*((void (**)(void *, void, void))v16 + 2))(v16, 0LL, 0LL);
      }

      else
      {
        [MEMORY[0x189607968] numberWithUnsignedInteger:(unint64_t)(v23 * 1000.0)];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void *, void *, void))v16 + 2))(v16, v24, 0LL);
      }
    }

    else
    {
      v25[0] = v13;
      v25[1] = 3221225472LL;
      v25[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2;
      v25[3] = &unk_18A36AA38;
      v25[4] = self;
      id v26 = v14;
      uint64_t v29 = v11;
      id v27 = v15;
      id v28 = v16;
      -[LACSecureStorage _acmVariableForKey:completionHandler:](self, "_acmVariableForKey:completionHandler:", v11, v25);
    }
  }
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogStorage();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    if (v6) {
      id v11 = v6;
    }
    else {
      id v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_189219000, v8, v9, "objectForKey rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) contextID];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2;
    v7[3] = &unk_18A36AA10;
    uint64_t v6 = *(void *)(a1 + 64);
    v7[4] = *(void *)(a1 + 32);
    uint64_t v9 = v6;
    id v8 = *(id *)(a1 + 48);
    [v4 _variable:a2 withcontextID:v5 completionHandler:v7];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

void __66__LACSecureStorage_objectForRequest_connection_completionHandler___block_invoke_2( void *a1,  uint64_t a2,  void *a3)
{
  id v5 = (void *)a1[4];
  uint64_t v6 = a1[6];
  id v11 = 0LL;
  id v7 = a3;
  [v5 _storageObjectForKey:v6 data:a2 error:&v11];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v11;
  if (v9) {
    id v10 = v9;
  }
  else {
    id v10 = v7;
  }
  (*(void (**)(void, void *, id))(a1[5] + 16LL))(a1[5], v8, v10);
}

- (void)removeObjectForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = [v8 key];
  LACLogStorage();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    int v28 = v11;
    __int16 v29 = 2114;
    v30 = self;
    __int16 v31 = 1024;
    int v32 = [v8 identifier];
    _os_log_impl(&dword_189219000, v12, OS_LOG_TYPE_DEFAULT, "removeObjectForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_18A36A9E8;
  id v14 = v8;
  id v25 = v14;
  id v15 = v9;
  id v26 = v15;
  v16 = _Block_copy(aBlock);
  BOOL v17 = -[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:]( self,  "_checkEntitlementForKey:operation:value:connection:failureHandler:",  v11,  3LL,  0LL,  v10,  v16);

  if (v17)
  {
    if ([(id)objc_opt_class() checkKey:v11 supportsOperation:3])
    {
      if (v11 == 2)
      {
        [v14 contextID];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACSecureStorage _setProtectedData:acl:contextID:completionHandler:]( self,  "_setProtectedData:acl:contextID:completionHandler:",  0LL,  0LL,  v18,  v16);
      }

      else
      {
        v21[0] = v13;
        v21[1] = 3221225472LL;
        v21[2] = __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke_10;
        v21[3] = &unk_18A36AA60;
        v21[4] = self;
        id v22 = v14;
        id v23 = v16;
        -[LACSecureStorage _acmVariableForKey:completionHandler:]( self,  "_acmVariableForKey:completionHandler:",  v11,  v21);
      }
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Operation not supported for key: %d.", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  3LL,  v19);
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0LL, v20);
    }
  }
}

void __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a2;
  LACLogStorage();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v5) {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    uint64_t v11 = @"success";
    if (v5) {
      uint64_t v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_189219000, v8, v9, "removeObjectForKey rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __72__LACSecureStorage_removeObjectForRequest_connection_completionHandler___block_invoke_10( uint64_t a1,  uint64_t a2)
{
  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    [*(id *)(a1 + 40) contextID];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 _setVariable:a2 value:0 contextID:v5 completionHandler:*(void *)(a1 + 48)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

- (void)setObject:(id)a3 forRequest:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = [v11 key];
  if ([(id)objc_opt_class() isKeyAvailableForDataExchange:v14])
  {
    -[LACSecureStorage _exchangeObject:request:connection:completionHandler:]( self,  "_exchangeObject:request:connection:completionHandler:",  v10,  v11,  v12,  v13);
  }

  else
  {
    LACLogStorage();
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v40 = v10;
      __int16 v41 = 1024;
      int v42 = v14;
      __int16 v43 = 2114;
      v44 = self;
      __int16 v45 = 1024;
      int v46 = [v11 identifier];
      _os_log_impl( &dword_189219000,  v15,  OS_LOG_TYPE_DEFAULT,  "setObject:%@ forKey:%d on %{public}@ rid:%u",  buf,  0x22u);
    }

    aBlock[0] = MEMORY[0x1895F87A8];
    aBlock[1] = 3221225472LL;
    aBlock[2] = __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke;
    aBlock[3] = &unk_18A36A9E8;
    id v16 = v11;
    id v37 = v16;
    id v17 = v13;
    id v38 = v17;
    v18 = _Block_copy(aBlock);
    if (-[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:]( self,  "_checkEntitlementForKey:operation:value:connection:failureHandler:",  v14,  2LL,  v10,  v12,  v18))
    {
      if ([(id)objc_opt_class() checkKey:v14 supportsOperation:2])
      {
        v19 = (void *)[(id)objc_opt_class() classForKey:v14];
        if ([v19 isEqual:objc_opt_class()] && objc_msgSend(v10, "length") != 1)
        {
          v20 = +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  1LL,  @"Expected BOOL in NSNumber.");
          (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v20);
        }

        else
        {
          [(id)objc_opt_class() maxDataLengthForKey:v14];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20 && (unint64_t v30 = [v10 length], v30 > objc_msgSend(v20, "unsignedIntegerValue")))
          {
            objc_msgSend( NSString,  "stringWithFormat:",  @"Expected max %u bytes.",  objc_msgSend(v20, "unsignedIntValue"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  1LL,  v21);
            id v22 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v22);
          }

          else
          {
            __int16 v31 = v20;
            [(id)objc_opt_class() minDataLengthForKey:v14];
            __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29 && (unint64_t v24 = [v10 length], v24 < objc_msgSend(v31, "unsignedIntegerValue")))
            {
              v21 = v29;
              objc_msgSend( NSString,  "stringWithFormat:",  @"Expected min %u bytes.",  objc_msgSend(v29, "unsignedIntValue"));
              id v25 = (void *)objc_claimAutoreleasedReturnValue();
              +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  1LL,  v25);
              id v26 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v26);

              v20 = v31;
            }

            else
            {
              if (v14 == 2)
              {
                [v16 acl];
                id v27 = (void *)objc_claimAutoreleasedReturnValue();
                [v16 contextID];
                int v28 = (void *)objc_claimAutoreleasedReturnValue();
                -[LACSecureStorage _setProtectedData:acl:contextID:completionHandler:]( self,  "_setProtectedData:acl:contextID:completionHandler:",  v10,  v27,  v28,  v18);
              }

              else
              {
                v32[0] = MEMORY[0x1895F87A8];
                v32[1] = 3221225472LL;
                v32[2] = __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke_17;
                v32[3] = &unk_18A36AA88;
                v32[4] = self;
                id v33 = v10;
                id v34 = v16;
                id v35 = v18;
                -[LACSecureStorage _acmVariableForKey:completionHandler:]( self,  "_acmVariableForKey:completionHandler:",  v14,  v32);
              }

              v21 = v29;
              v20 = v31;
            }
          }
        }
      }

      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Operation not supported for key: %d.", v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  3LL,  v20);
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void, void *))v17 + 2))(v17, 0LL, v23);
      }
    }
  }
}

void __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a2;
  LACLogStorage();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    id v11 = @"success";
    if (v5) {
      id v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    uint64_t v14 = v11;
    _os_log_impl(&dword_189219000, v8, v9, "setObject rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __70__LACSecureStorage_setObject_forRequest_connection_completionHandler___block_invoke_17( uint64_t a1,  uint64_t a2)
{
  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) contextID];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 _setVariable:a2 value:v5 contextID:v6 completionHandler:*(void *)(a1 + 56)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

- (void)aclForRequest:(id)a3 connection:(id)a4 completionHandler:(id)a5
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v8 key];
  LACLogStorage();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&uint8_t buf[4] = v11;
    LOWORD(v28) = 2114;
    *(void *)((char *)&v28 + 2) = self;
    WORD5(v28) = 1024;
    HIDWORD(v28) = [v8 identifier];
    _os_log_impl(&dword_189219000, v12, OS_LOG_TYPE_DEFAULT, "aclForKey:%d on %{public}@ rid:%u", buf, 0x18u);
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_18A36A9E8;
  id v14 = v8;
  id v25 = v14;
  id v15 = v10;
  id v26 = v15;
  id v16 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  [v14 contextID];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v17, v16);

  if (v18)
  {
    *(void *)buf = 0LL;
    *(void *)&__int128 v28 = buf;
    *((void *)&v28 + 1) = 0x3032000000LL;
    __int16 v29 = __Block_byref_object_copy__7;
    unint64_t v30 = __Block_byref_object_dispose__7;
    id v31 = 0LL;
    v23[0] = v13;
    v23[1] = 3221225472LL;
    v23[2] = __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke_18;
    v23[3] = &unk_18A369FD8;
    v23[4] = buf;
    uint64_t DataProperty = ACMContextGetDataProperty(v18, 7u, 2u, (uint64_t)v23);
    if ((_DWORD)DataProperty == -7) {
      goto LABEL_8;
    }
    if ((_DWORD)DataProperty)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to retrieve the ACL: %d", DataProperty);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v21);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      v16[2](v16, 0LL, v22);

      goto LABEL_10;
    }

    uint64_t v20 = *(void *)(v28 + 40);
    if (!v20) {
LABEL_8:
    }
      v16[2](v16, 0LL, 0LL);
    else {
      v16[2](v16, v20, 0LL);
    }
LABEL_10:
    _Block_object_dispose(buf, 8);
  }
}

void __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a3;
  id v6 = a2;
  LACLogStorage();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v6) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    int v11 = @"success";
    if (v5) {
      int v11 = v5;
    }
    v12[0] = 67109378;
    v12[1] = v10;
    __int16 v13 = 2114;
    id v14 = v11;
    _os_log_impl(&dword_189219000, v8, v9, "setObject rid:%u returned %{public}@", (uint8_t *)v12, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __63__LACSecureStorage_aclForRequest_connection_completionHandler___block_invoke_18( uint64_t a1,  void *a2,  uint64_t a3)
{
  v3 = a2;
  if (a2)
  {
    [MEMORY[0x189603F48] dataWithBytes:a2 length:a3];
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  if (v3) {
}
  }

+ (BOOL)isKeyAvailable:(int64_t)a3 operation:(int64_t)a4
{
  int v7 = objc_msgSend(a1, "isKeyAvailable:");
  if (v7) {
    LOBYTE(v7) = [a1 checkKey:a3 supportsOperation:a4];
  }
  return v7;
}

+ (BOOL)isKeyAvailable:(int64_t)a3
{
  if (a3 == 17) {
    return 1;
  }
  return a3 == 16;
}

+ (BOOL)isKeyAvailableForDataExchange:(int64_t)a3
{
  return 0;
}

+ (BOOL)checkKey:(int64_t)a3 supportsOperation:(int64_t)a4
{
  if (a3 == 21) {
    return a4 == 1;
  }
  else {
    return a4 != 4;
  }
}

+ (Class)classForKey:(int64_t)a3
{
  v3 = 0LL;
  if ((unint64_t)a3 <= 0x14 && (((1LL << a3) & 0x1E0002) != 0 || ((1LL << a3) & 0x10004) != 0))
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (Class)v3;
}

+ (id)maxDataLengthForKey:(int64_t)a3
{
  else {
    return 0LL;
  }
}

+ (id)minDataLengthForKey:(int64_t)a3
{
  if (a3 == 1) {
    return &unk_18A39F468;
  }
  else {
    return 0LL;
  }
}

+ (id)additionalBoolEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5
{
  else {
    return *off_18A36AAA8[a3 - 16];
  }
}

+ (int64_t)policyForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5
{
  id v7 = a5;
  if ((unint64_t)(a3 - 18) < 3)
  {
    if (a4 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        id v8 = &LACPolicyTouchIDEnrollment;
        goto LABEL_10;
      }
    }

- (void)_exchangeObject:(id)a3 request:(id)a4 connection:(id)a5 completionHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  uint64_t v14 = [v11 key];
  LACLogStorage();
  uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413058;
    id v31 = v10;
    __int16 v32 = 1024;
    int v33 = v14;
    __int16 v34 = 2114;
    id v35 = self;
    __int16 v36 = 1024;
    int v37 = [v11 identifier];
    _os_log_impl( &dword_189219000,  v15,  OS_LOG_TYPE_DEFAULT,  "exchangeObject:%@ forKey:%d on %{public}@ rid:%u",  buf,  0x22u);
  }

  uint64_t v16 = MEMORY[0x1895F87A8];
  aBlock[0] = MEMORY[0x1895F87A8];
  aBlock[1] = 3221225472LL;
  aBlock[2] = __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke;
  aBlock[3] = &unk_18A36A9E8;
  id v17 = v11;
  id v28 = v17;
  id v18 = v12;
  id v29 = v18;
  v19 = _Block_copy(aBlock);
  BOOL v20 = -[LACSecureStorage _checkEntitlementForKey:operation:value:connection:failureHandler:]( self,  "_checkEntitlementForKey:operation:value:connection:failureHandler:",  v14,  4LL,  v10,  v13,  v19);

  if (v20)
  {
    if ((unint64_t)[v10 length] < 0x101)
    {
      v23[0] = v16;
      v23[1] = 3221225472LL;
      v23[2] = __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke_25;
      v23[3] = &unk_18A36AA88;
      v23[4] = self;
      id v24 = v10;
      id v25 = v17;
      id v26 = v19;
      -[LACSecureStorage _acmSEPControlForKey:completionHandler:]( self,  "_acmSEPControlForKey:completionHandler:",  v14,  v23);
    }

    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"Expected max %u bytes.", 256);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  1LL,  v21);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v18 + 2))(v18, 0LL, v22);
    }
  }
}

void __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  LACLogStorage();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v5) {
    os_log_type_t v9 = OS_LOG_TYPE_INFO;
  }
  else {
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
  }
  if (os_log_type_enabled(v7, v9))
  {
    int v10 = [*(id *)(a1 + 32) identifier];
    id v11 = @"success";
    v12[0] = 67109634;
    v12[1] = v10;
    if (v6) {
      id v11 = v6;
    }
    __int16 v13 = 2112;
    id v14 = v5;
    __int16 v15 = 2114;
    uint64_t v16 = v11;
    _os_log_impl( &dword_189219000,  v8,  v9,  "exchangeObject rid:%u returned %@, error: %{public}@",  (uint8_t *)v12,  0x1Cu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40));
}

void __73__LACSecureStorage__exchangeObject_request_connection_completionHandler___block_invoke_25( uint64_t a1,  uint64_t a2)
{
  if ((_DWORD)a2)
  {
    v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) contextID];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 _sepControl:a2 value:v5 contextID:v6 completionHandler:*(void *)(a1 + 56)];
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

- (BOOL)_checkEntitlementForKey:(int64_t)a3 operation:(int64_t)a4 value:(id)a5 connection:(id)a6 failureHandler:(id)a7
{
  id v12 = a6;
  __int16 v13 = (void (**)(id, void, void *))a7;
  id v14 = a5;
  [(id)objc_opt_class() additionalBoolEntitlementForKey:a3 operation:a4 value:v14];
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15
    || -[LACSecureStorageConfiguration bypassEntitlementChecks](self->_config, "bypassEntitlementChecks")
    || ([v12 valueForEntitlement:v15],
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(),
        char v17 = [v16 BOOLValue],
        v16,
        (v17 & 1) != 0))
  {
    BOOL v18 = 1;
  }

  else
  {
    +[LACError missingEntitlementError:](&OBJC_CLASS___LACError, "missingEntitlementError:", v15);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0LL, v20);

    BOOL v18 = 0;
  }

  return v18;
}

- (void)_acmSEPControlForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = a4;
  +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  @"Unknown storage for data exchange");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v5, 0LL, v6);
}

- (void)_acmVariableForKey:(int64_t)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(void))a4;
  id v8 = v5;
  switch(a3)
  {
    case 16LL:
      id v6 = v5[2];
      goto LABEL_9;
    case 17LL:
      id v6 = v5[2];
      goto LABEL_9;
    case 18LL:
      id v6 = v5[2];
      goto LABEL_9;
    case 19LL:
      id v6 = v5[2];
      goto LABEL_9;
    case 20LL:
      id v6 = v5[2];
      goto LABEL_9;
    default:
      if (a3 == 1)
      {
        id v6 = v5[2];
LABEL_9:
        v6();
      }

      else
      {
        +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  @"Unknown storage");
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void), void, void *))v8[2])(v8, 0LL, v7);
      }

      return;
  }

- (void)_setStandardSecureBootModeCompletionHandler:(id)a3
{
  id v3 = a3;
  AMFIGetSecurityBootModeArmed();
  (*((void (**)(id, void, void))v3 + 2))(v3, MEMORY[0x189604A88], 0LL);
}

- (void)_setSecureBootModeForACMVariable:(unsigned int)a3 completionHandler:(id)a4
{
  os_log_type_t v9 = (void (**)(id, void, void *))a4;
  if (a3 == 54 || a3 == 60 || a3 == 55)
  {
    uint64_t v5 = AMFIArmSecurityBootMode();
    if ((_DWORD)v5)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"Unexpected AMFI error when setting boot mode, amfiErr: %u",  v5);
      id v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v6);
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0LL, v7);
    }

    else
    {
      v9[2](v9, MEMORY[0x189604A88], 0LL);
    }
  }

  else
  {
    +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  @"Unexpected ACM var when reboot is requested");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0LL, v8);
  }
}

- (void)_setVariable:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  __int128 v29 = 0uLL;
  if (!v11)
  {
    id v14 = 0LL;
LABEL_7:
    id v18 = v10;
    uint64_t v19 = ACMSetEnvironmentVariableWithAccessPolicy( v8,  v14,  &v29,  16,  (const void *)[v18 bytes],  objc_msgSend(v18, "length"));
    if ((_DWORD)v19 == -17) {
      goto LABEL_15;
    }
    if (!(_DWORD)v19)
    {
      if (v8 > 0x3C || ((1LL << v8) & 0x10C0000000000000LL) == 0)
      {
        (*((void (**)(id, void, void))v12 + 2))(v12, MEMORY[0x189604A88], 0LL);
        goto LABEL_17;
      }

      v27[0] = MEMORY[0x1895F87A8];
      v27[1] = 3221225472LL;
      v27[2] = __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke;
      v27[3] = &unk_18A369FB0;
      id v28 = v12;
      -[LACSecureStorage _setStandardSecureBootModeCompletionHandler:]( self,  "_setStandardSecureBootModeCompletionHandler:",  v27);
      BOOL v20 = v28;
      goto LABEL_12;
    }

    if (!v11 && (_DWORD)v19 == -3)
    {
LABEL_15:
      uint64_t v21 = +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  0LL,  @"Storage policy not satisfied.");
    }

    else
    {
      if ((_DWORD)v19 == -27)
      {
        v25[0] = MEMORY[0x1895F87A8];
        v25[1] = 3221225472LL;
        v25[2] = __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke_2;
        v25[3] = &unk_18A369FB0;
        id v26 = v12;
        -[LACSecureStorage _setSecureBootModeForACMVariable:completionHandler:]( self,  "_setSecureBootModeForACMVariable:completionHandler:",  v8,  v25);
        BOOL v20 = v26;
LABEL_12:

        goto LABEL_17;
      }

      if ((_DWORD)v19 != -14)
      {
        id v23 = "store";
        if (!v18) {
          id v23 = "remove";
        }
        objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to %s the value: %d", v23, v19);
        goto LABEL_5;
      }

      uint64_t v21 = -[LACSecureStorage _errorNotSupported](self, "_errorNotSupported");
    }

    id v22 = (void *)v21;
    (*((void (**)(id, void, uint64_t))v12 + 2))(v12, 0LL, v21);

    goto LABEL_17;
  }

  __int16 v13 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v11, v12);
  if (v13)
  {
    id v14 = v13;
    uint64_t bag_uuid = aks_get_bag_uuid(0, &v29);
    if ((_DWORD)bag_uuid)
    {
      objc_msgSend( NSString,  "stringWithFormat:",  @"AKS failed to get the keybag UUID: %x",  bag_uuid,  v24);
LABEL_5:
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v16);
      char v17 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void, void *))v12 + 2))(v12, 0LL, v17);

      goto LABEL_17;
    }

    goto LABEL_7;
  }

uint64_t __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __67__LACSecureStorage__setVariable_value_contextID_completionHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    (*(void (**)(void))(v3 + 16))(*(void *)(a1 + 32));
  }

  else
  {
    +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  5LL,  @"Storage requires reboot");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0LL, v4);
  }

- (void)_sepControl:(unsigned int)a3 value:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(id, void, void *))a6;
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  id v23 = __Block_byref_object_copy__7;
  uint64_t v24 = __Block_byref_object_dispose__7;
  [MEMORY[0x189603F48] data];
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  if (v10) {
    id v12 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v10, v11);
  }
  else {
    id v12 = 0LL;
  }
  id v13 = v9;
  id v14 = (const void *)[v13 bytes];
  size_t v15 = [v13 length];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __66__LACSecureStorage__sepControl_value_contextID_completionHandler___block_invoke;
  v19[3] = &unk_18A369FD8;
  v19[4] = &v20;
  uint64_t v16 = ACMSEPControlEx((uint64_t)v12, 0LL, 0, v14, v15, (uint64_t)v19);
  if ((_DWORD)v16 == -17) {
    goto LABEL_9;
  }
  if ((_DWORD)v16)
  {
    if (v10 || (_DWORD)v16 != -3)
    {
      if ((_DWORD)v16 == -14)
      {
        -[LACSecureStorage _errorNotSupported](self, "_errorNotSupported");
        char v17 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0LL, v17);
      }

      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"ACMSEPControl failed: %d", v16);
        char v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v17);
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        v11[2](v11, 0LL, v18);
      }

      goto LABEL_10;
    }

void __66__LACSecureStorage__sepControl_value_contextID_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    if (a3)
    {
      uint64_t v4 = [MEMORY[0x189603F48] dataWithBytes:a2 length:a3];
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
      id v6 = *(void **)(v5 + 40);
      *(void *)(v5 + 40) = v4;
    }
  }

- (void)_variable:(unsigned int)a3 withcontextID:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = __Block_byref_object_copy__7;
  uint64_t v19 = __Block_byref_object_dispose__7;
  id v20 = 0LL;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __62__LACSecureStorage__variable_withcontextID_completionHandler___block_invoke;
  v14[3] = &unk_18A369FD8;
  v14[4] = &v15;
  uint64_t v10 = ACMGetEnvironmentVariable(a3, (uint64_t)v14);
  if ((_DWORD)v10 == -14)
  {
    -[LACSecureStorage _errorNotSupported](self, "_errorNotSupported");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0LL, v12);
LABEL_9:

    goto LABEL_10;
  }

  if ((_DWORD)v10 == -7)
  {
LABEL_6:
    v9[2](v9, 0LL, 0LL);
    goto LABEL_10;
  }

  if ((_DWORD)v10)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to query the value: %d", v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v12);
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0LL, v13);

    goto LABEL_9;
  }

  uint64_t v11 = v16[5];
  if (!v11) {
    goto LABEL_6;
  }
  v9[2](v9, v11, 0LL);
LABEL_10:
  _Block_object_dispose(&v15, 8);
}

void __62__LACSecureStorage__variable_withcontextID_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x189603F48] dataWithBytes:a2 length:a3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)_setProtectedData:(id)a3 acl:(id)a4 contextID:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  id v13 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", a5, v12);
  if (v13)
  {
    id v14 = v13;
    LODWORD(v23[0]) = 11;
    id v15 = v11;
    v23[1] = [v15 bytes];
    int v24 = [v15 length];
    BOOL v16 = v15 == 0LL;
    unsigned int v17 = v15 != 0LL;
    if (v16) {
      id v18 = 0LL;
    }
    else {
      id v18 = v23;
    }
    id v19 = v10;
    uint64_t v20 = ACMContextSetDataEx(v14, 7, v18, v17, (const void *)[v19 bytes], objc_msgSend(v19, "length"));
    if ((_DWORD)v20)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to set protected data: %d", v20, v23[0]);
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v21);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0LL, v22);
    }

    else
    {
      v12[2](v12, MEMORY[0x189604A88], 0LL);
    }
  }
}

- (void)_protectedDataWithBundleId:(id)a3 contextID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v11 = -[LACSecureStorage _acmContextForUUID:failureHandler:](self, "_acmContextForUUID:failureHandler:", v9, v10);
  if (v11)
  {
    id v12 = v11;
    __int16 v30 = 4620;
    [MEMORY[0x189603FB8] dataWithBytes:&v30 length:2];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 dataUsingEncoding:4];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 appendData:v14];

    int v27 = 3;
    id v15 = v13;
    uint64_t v28 = [v15 bytes];
    int v29 = [v15 length];
    uint64_t v21 = 0LL;
    uint64_t v22 = &v21;
    uint64_t v23 = 0x3032000000LL;
    int v24 = __Block_byref_object_copy__7;
    id v25 = __Block_byref_object_dispose__7;
    id v26 = 0LL;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __75__LACSecureStorage__protectedDataWithBundleId_contextID_completionHandler___block_invoke;
    v20[3] = &unk_18A369FD8;
    v20[4] = &v21;
    uint64_t Data = ACMContextGetDataEx(v12, 7, &v27, 1u, (uint64_t)v20);
    if ((_DWORD)Data == -7) {
      goto LABEL_6;
    }
    if ((_DWORD)Data)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"ACM failed to retrieve protected data: %d", Data);
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  2LL,  v18);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      v10[2](v10, 0LL, v19);

      goto LABEL_8;
    }

    uint64_t v17 = v22[5];
    if (!v17) {
LABEL_6:
    }
      v10[2](v10, 0LL, 0LL);
    else {
      v10[2](v10, v17, 0LL);
    }
LABEL_8:
    _Block_object_dispose(&v21, 8);
  }
}

void __75__LACSecureStorage__protectedDataWithBundleId_contextID_completionHandler___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t v3 = a2;
  if (a2)
  {
    [MEMORY[0x189603F48] dataWithBytes:a2 length:a3];
    a2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
  if (v3) {
}
  }

- (id)_errorNotSupported
{
  return +[LACStorageError errorWithCode:debugDescription:]( &OBJC_CLASS___LACStorageError,  "errorWithCode:debugDescription:",  3LL,  @"Storage not supported on this device.");
}

- (__ACMHandle)_acmContextForUUID:(id)a3 failureHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, id))a4;
  -[LACSecureStorage delegate](self, "delegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[LACSecureStorage delegate](self, "delegate");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v16 = 0LL;
    [v9 acmContextForUUID:v6 error:&v16];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = v16;

    if (v11)
    {
      v7[2](v7, 0LL, v11);
      id v12 = 0LL;
    }

    else
    {
      id v14 = v10;
      id v12 = (__ACMHandle *)ACMContextCreateWithExternalForm( (_OWORD *)[v14 bytes],  objc_msgSend(v14, "length"));
    }
  }

  else
  {
    +[LACError errorWithCode:debugDescription:]( &OBJC_CLASS___LACError,  "errorWithCode:debugDescription:",  -1000LL,  @"Missing delegate");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v13);

    id v12 = 0LL;
  }

  return v12;
}

- (id)_storageObjectForKey:(int64_t)a3 data:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___LACStorageObjectEncoder);
  -[LACStorageObjectEncoder encodeValue:forKey:error:](v8, "encodeValue:forKey:error:", v7, a3, a5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (LACSecureStorageDelegate)delegate
{
  return (LACSecureStorageDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
}

- (LACSecureStorageConfiguration)config
{
  return self->_config;
}

- (void).cxx_destruct
{
}

@end