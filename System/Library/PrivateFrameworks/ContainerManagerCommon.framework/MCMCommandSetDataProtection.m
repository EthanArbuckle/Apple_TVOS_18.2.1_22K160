@interface MCMCommandSetDataProtection
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)_updateMetadataForContainerIdentity:(id)a3 dataProtectionClass:(int)a4 error:(id *)a5;
- (BOOL)isThirdParty;
- (BOOL)preflightClientAllowed;
- (BOOL)retryIfLocked;
- (BOOL)skipIfUnchanged;
- (MCMCommandSetDataProtection)initWithContainerIdentity:(id)a3 thirdParty:(BOOL)a4 dataProtectionClass:(int)a5 retryIfLocked:(BOOL)a6 skipIfUnchanged:(BOOL)a7 context:(id)a8 resultPromise:(id)a9;
- (MCMCommandSetDataProtection)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (int)dataProtectionClass;
- (void)execute;
@end

@implementation MCMCommandSetDataProtection

- (MCMCommandSetDataProtection)initWithContainerIdentity:(id)a3 thirdParty:(BOOL)a4 dataProtectionClass:(int)a5 retryIfLocked:(BOOL)a6 skipIfUnchanged:(BOOL)a7 context:(id)a8 resultPromise:(id)a9
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MCMCommandSetDataProtection;
  v17 = -[MCMCommand initWithContext:resultPromise:](&v20, sel_initWithContext_resultPromise_, a8, a9);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_containerIdentity, a3);
    v18->_thirdParty = a4;
    v18->_dataProtectionClass = a5;
    v18->_retryIfLocked = a6;
    v18->_skipIfUnchanged = a7;
  }

  return v18;
}

- (MCMCommandSetDataProtection)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MCMCommandSetDataProtection;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v34, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    uint64_t v11 = [v8 containerIdentity];
    containerIdentity = v10->_containerIdentity;
    v10->_containerIdentity = (MCMContainerIdentity *)v11;
    v13 = -[MCMContainerIdentityMinimal userIdentity](v10->_containerIdentity, "userIdentity");
    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
    }
    if (MCMRequirePersonaTelemetryOnly_result && [v13 isNoSpecificPersona])
    {
      container_log_handle_for_category();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v32 = -[MCMCommand context](v10, "context");
        [v32 clientIdentity];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 codeSignInfo];
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 identifier];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        v17 = -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        [v9 clientIdentity];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v36 = v15;
        __int16 v37 = 2048;
        uint64_t v38 = v16;
        __int16 v39 = 2114;
        v40 = v17;
        __int16 v41 = 2114;
        v42 = v18;
        _os_log_fault_impl( &dword_188846000,  v14,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)",  buf,  0x2Au);
      }
    }

    else
    {
      if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
        dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_15);
      }
      if (!MCMRequirePersonaAndConvertSystemToPersonal_result
        || ![v13 isNoSpecificPersona])
      {
        goto LABEL_16;
      }

      container_log_handle_for_category();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v33 = -[MCMCommand context](v10, "context");
        [v33 clientIdentity];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 codeSignInfo];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 identifier];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        v28 = -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        *(_DWORD *)buf = 138543874;
        v36 = v26;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        __int16 v39 = 2114;
        v40 = v28;
        _os_log_fault_impl( &dword_188846000,  v19,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no person a - converting to Personal",  buf,  0x20u);
      }

      [v9 userIdentityCache];
      objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 posixUser];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = -[MCMContainerIdentity identityByChangingUserIdentity:]( v10->_containerIdentity,  "identityByChangingUserIdentity:",  v22);
      v14 = (os_log_s *)v10->_containerIdentity;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      v13 = (void *)v22;
    }

LABEL_16:
    v10->_thirdParty = [v8 isThirdParty];
    v10->_dataProtectionClass = [v8 dataProtectionClass];
    v10->_retryIfLocked = [v8 retryIfLocked];
    v10->_skipIfUnchanged = 0;
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isAllowedToSetDataProtection];

  if (!v5) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result)
  {
    v6 = -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
    unint64_t v7 = [v6 containerClass];
    if (v7 <= 0xE && ((1LL << v7) & 0x4ED4) != 0)
    {
      -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 userIdentity];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      int v10 = [v9 isNoSpecificPersona];

      if (v10)
      {
        container_log_handle_for_category();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          v13 = -[MCMCommand context](self, "context");
          [v13 clientIdentity];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 codeSignInfo];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 identifier];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
          uint64_t v18 = [v17 containerClass];
          v19 = -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
          [v19 identifier];
          objc_super v20 = (void *)objc_claimAutoreleasedReturnValue();
          int v21 = 138543874;
          uint64_t v22 = v16;
          __int16 v23 = 2048;
          uint64_t v24 = v18;
          __int16 v25 = 2114;
          v26 = v20;
          _os_log_fault_impl( &dword_188846000,  v11,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona",  (uint8_t *)&v21,  0x20u);
        }

        if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
          dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
        }
        if (!MCMRequirePersonaTelemetryOnly_result) {
          return 0;
        }
      }
    }

    else
    {
    }
  }

  return 1;
}

- (void)execute
{
  uint64_t v52 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v4 = -[MCMCommandSetDataProtection containerIdentity](self, "containerIdentity");
  -[MCMCommand resultPromise](self, "resultPromise");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v43[0] = MEMORY[0x1895F87A8];
  v43[1] = 3221225472LL;
  v43[2] = __38__MCMCommandSetDataProtection_execute__block_invoke;
  v43[3] = &unk_18A29DFC0;
  v43[4] = self;
  id v7 = v4;
  id v44 = v7;
  id v8 = v5;
  id v45 = v8;
  objc_super v34 = (void *)MEMORY[0x1895CE54C](v43);
  unint64_t v9 = [v7 containerClass];
  if (v9 > 0xB || ((1 << v9) & 0xED4) == 0 || (uint64_t v10 = [v7 containerClass], v10 == 13) || v10 == 7)
  {
    uint64_t v11 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  11LL,  3LL);
    v12 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v11);
    v13 = 0LL;
LABEL_6:
    id v14 = 0LL;
    id v15 = 0LL;
    goto LABEL_7;
  }

  -[MCMCommand context](self, "context");
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 containerCache];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v42 = 0LL;
  [v19 entryForContainerIdentity:v7 error:&v42];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (MCMError *)v42;

  if (!v13)
  {
    v12 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v11);
    goto LABEL_6;
  }

  __int16 v41 = v11;
  [v13 metadataWithError:&v41];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v20 = v41;

  if (!v15)
  {
    v12 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v20);
    id v14 = 0LL;
    goto LABEL_19;
  }

  objc_msgSend( MEMORY[0x189607968],  "numberWithInt:",  -[MCMCommandSetDataProtection dataProtectionClass](self, "dataProtectionClass"));
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 metadataBySettingInfoValue:v21 forKey:@"com.apple.MobileInstallation.ContentProtectionClass"];
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  if (-[MCMCommandSetDataProtection skipIfUnchanged](self, "skipIfUnchanged") && v14 == v15)
  {
    v12 = 0LL;
    id v14 = v15;
LABEL_19:
    uint64_t v11 = v20;
    goto LABEL_7;
  }

  v40 = v20;
  char v32 = [v14 writeMetadataToDiskWithError:&v40];
  uint64_t v11 = v40;

  if ((v32 & 1) != 0)
  {
    v30 = -[MCMCommand context](self, "context");
    [v30 containerCache];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    __int16 v39 = v11;
    uint64_t v29 = [v22 addContainerMetadata:v14 error:&v39];
    v33 = v39;

    if (!v29)
    {
      container_log_handle_for_category();
      __int16 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        [v14 identifier];
        v31 = (MCMError *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v14 containerClass];
        *(_DWORD *)buf = 138412802;
        v47 = v31;
        __int16 v48 = 2048;
        uint64_t v49 = v28;
        __int16 v50 = 2112;
        v51 = v33;
        _os_log_error_impl( &dword_188846000,  v23,  OS_LOG_TYPE_ERROR,  "Could not update metadata in cache when asked to change data protection on [%@(%llu)]: %@",  buf,  0x20u);
      }
    }

    uint64_t v24 = (dispatch_queue_s *)MCMDataProtectionQueue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __38__MCMCommandSetDataProtection_execute__block_invoke_8;
    block[3] = &unk_18A29DFE8;
    id v14 = v14;
    id v36 = v14;
    __int16 v37 = self;
    id v38 = v34;
    dispatch_async(v24, block);

    v12 = 0LL;
    v13 = (void *)v29;
    uint64_t v11 = v33;
  }

  else
  {
    container_log_handle_for_category();
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      [v14 identifier];
      v26 = (MCMError *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v14 containerClass];
      *(_DWORD *)buf = 138412802;
      v47 = v26;
      __int16 v48 = 2048;
      uint64_t v49 = v27;
      __int16 v50 = 2112;
      v51 = v11;
      _os_log_error_impl( &dword_188846000,  v25,  OS_LOG_TYPE_ERROR,  "Could not save metadata when asked to change data protection on [%@(%llu)]: %@",  buf,  0x20u);
    }

    v12 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultBase), "initWithError:", v11);
  }

- (BOOL)_updateMetadataForContainerIdentity:(id)a3 dataProtectionClass:(int)a4 error:(id *)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v40 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  -[MCMCommand context](self, "context");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerCache];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v33 = 0LL;
  [v9 entryForContainerIdentity:v7 error:&v33];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = v33;
  if (!v10)
  {
    id v14 = 0LL;
    v12 = 0LL;
    BOOL v20 = 0;
    goto LABEL_17;
  }

  id v32 = v11;
  [v10 metadataWithError:&v32];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = v32;

  if (!v12)
  {
    container_log_handle_for_category();
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [v10 identifier];
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 containerPath];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v25 = [v24 containerClass];
      *(_DWORD *)buf = 138412802;
      v35 = v23;
      __int16 v36 = 2048;
      uint64_t v37 = v25;
      __int16 v38 = 2112;
      id v39 = v13;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Could not fetch metadata after data protection change on [%@(%llu)]: %@",  buf,  0x20u);
    }

    id v14 = 0LL;
    v12 = 0LL;
    goto LABEL_16;
  }

  [v12 metadataByChangingDataProtectionClass:v5];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v31 = v13;
  char v15 = [v14 writeMetadataToDiskWithError:&v31];
  id v16 = v31;

  if ((v15 & 1) == 0)
  {
    container_log_handle_for_category();
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [v12 identifier];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = [v12 containerClass];
      *(_DWORD *)buf = 138412802;
      v35 = v26;
      __int16 v36 = 2048;
      uint64_t v37 = v27;
      __int16 v38 = 2112;
      id v39 = v16;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Could not save metadata after data protection change on [%@(%llu)]: %@",  buf,  0x20u);
    }

    id v13 = v16;
    goto LABEL_16;
  }
  v17 = -[MCMCommand context](self, "context");
  [v17 containerCache];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  id v30 = v16;
  uint64_t v19 = [v18 addContainerMetadata:v14 error:&v30];
  id v11 = v30;

  if (!v19)
  {
    container_log_handle_for_category();
    int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [v14 identifier];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = [v14 containerClass];
      *(_DWORD *)buf = 138412802;
      v35 = v28;
      __int16 v36 = 2048;
      uint64_t v37 = v29;
      __int16 v38 = 2112;
      id v39 = v11;
      _os_log_error_impl( &dword_188846000,  v21,  OS_LOG_TYPE_ERROR,  "Could not update metadata in cache after data protection change on [%@(%llu)]: %@",  buf,  0x20u);
    }

    uint64_t v10 = 0LL;
    id v13 = v11;
LABEL_16:

    BOOL v20 = 0;
    id v11 = v13;
    goto LABEL_17;
  }

  BOOL v20 = 1;
  uint64_t v10 = (void *)v19;
LABEL_17:

  return v20;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)isThirdParty
{
  return self->_thirdParty;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (BOOL)retryIfLocked
{
  return self->_retryIfLocked;
}

- (BOOL)skipIfUnchanged
{
  return self->_skipIfUnchanged;
}

- (void).cxx_destruct
{
}

void __38__MCMCommandSetDataProtection_execute__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  id v14 = __Block_byref_object_copy__10901;
  char v15 = __Block_byref_object_dispose__10902;
  id v16 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", a2);
  if (!v12[5])
  {
    v3 = (dispatch_queue_s *)MCMSharedFastWorkloop();
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __38__MCMCommandSetDataProtection_execute__block_invoke_4;
    v8[3] = &unk_18A29E328;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v4;
    uint64_t v10 = &v11;
    dispatch_async_and_wait(v3, v8);
  }

  uint64_t v5 = objc_alloc(&OBJC_CLASS___MCMResultBase);
  uint64_t v6 = -[MCMResultBase initWithError:](v5, "initWithError:", v12[5]);
  [*(id *)(a1 + 48) completeWithResult:v6];
  [*(id *)(a1 + 32) reply];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 send];

  _Block_object_dispose(&v11, 8);
}

void __38__MCMCommandSetDataProtection_execute__block_invoke_8(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v2,  "setDataProtectionOnDataContainerForMetadata:isSecondOrThirdPartyApp:retryIfLocked:deferUntilNextLaunch:withCompletion:",  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 40), "isThirdParty"),  objc_msgSend(*(id *)(a1 + 40), "retryIfLocked"),  0,  *(void *)(a1 + 48));
}

void __38__MCMCommandSetDataProtection_execute__block_invoke_4(void *a1)
{
  obj[1] = *(id *)MEMORY[0x1895F89C0];
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = [v2 dataProtectionClass];
  uint64_t v5 = *(void *)(a1[6] + 8LL);
  obj[0] = *(id *)(v5 + 40);
  [v2 _updateMetadataForContainerIdentity:v3 dataProtectionClass:v4 error:obj];
  objc_storeStrong((id *)(v5 + 40), obj[0]);
}

+ (unint64_t)command
{
  return 21LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end