@interface MCMCommandDeleteWithUIDClassAndIdentifier
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeleteWithUIDClassAndIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMCommandOperationDelete)deleteCommand;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandDeleteWithUIDClassAndIdentifier

- (MCMCommandDeleteWithUIDClassAndIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MCMCommandDeleteWithUIDClassAndIdentifier;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v39, sel_initWithMessage_context_reply_, v8, v9, a5);
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
        v37 = -[MCMCommand context](v10, "context");
        [v37 clientIdentity];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        [v35 codeSignInfo];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 identifier];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        v17 = -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        [v9 clientIdentity];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v42 = v15;
        __int16 v43 = 2048;
        uint64_t v44 = v16;
        __int16 v45 = 2114;
        v46 = v17;
        __int16 v47 = 2114;
        v48 = v18;
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
        v38 = -[MCMCommand context](v10, "context");
        [v38 clientIdentity];
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 codeSignInfo];
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v30 identifier];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        v33 = -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        *(_DWORD *)buf = 138543874;
        v42 = v31;
        __int16 v43 = 2048;
        uint64_t v44 = v32;
        __int16 v45 = 2114;
        v46 = v33;
        _os_log_fault_impl( &dword_188846000,  v19,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no person a - converting to Personal",  buf,  0x20u);
      }

      [v9 userIdentityCache];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 posixUser];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v20 userIdentityForPersonalPersonaWithPOSIXUser:v21];

      uint64_t v23 = -[MCMContainerIdentity identityByChangingUserIdentity:]( v10->_containerIdentity,  "identityByChangingUserIdentity:",  v22);
      v14 = (os_log_s *)v10->_containerIdentity;
      v10->_containerIdentity = (MCMContainerIdentity *)v23;
      v13 = (void *)v22;
    }

LABEL_16:
    v40 = v10->_containerIdentity;
    [MEMORY[0x189603F18] arrayWithObjects:&v40 count:1];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[MCMCommand context](v10, "context");
    v26 = -[MCMCommand resultPromise](v10, "resultPromise");
    uint64_t v27 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:]( &OBJC_CLASS___MCMCommandOperationDelete,  "commandForOperationDeleteWithContainerIdentities:removeAllCodeSignInfo:context:resultPromise:",  v24,  0LL,  v25,  v26);
    deleteCommand = v10->_deleteCommand;
    v10->_deleteCommand = (MCMCommandOperationDelete *)v27;
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommandDeleteWithUIDClassAndIdentifier deleteCommand](self, "deleteCommand");
  int v4 = [v3 preflightClientAllowed];

  if (!v4) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result)
  {
    v5 = -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
    unint64_t v6 = [v5 containerClass];
    if (v6 <= 0xE && ((1LL << v6) & 0x4ED4) != 0)
    {
      v7 = -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
      [v7 userIdentity];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      int v9 = [v8 isNoSpecificPersona];

      if (v9)
      {
        container_log_handle_for_category();
        v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          -[MCMCommand context](self, "context");
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 clientIdentity];
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 codeSignInfo];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 identifier];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
          uint64_t v16 = [v15 containerClass];
          v17 = -[MCMCommandDeleteWithUIDClassAndIdentifier containerIdentity](self, "containerIdentity");
          [v17 identifier];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          int v20 = 138543874;
          v21 = v14;
          __int16 v22 = 2048;
          uint64_t v23 = v16;
          __int16 v24 = 2114;
          v25 = v18;
          _os_log_impl( &dword_188846000,  v10,  OS_LOG_TYPE_DEFAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona",  (uint8_t *)&v20,  0x20u);
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
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  -[MCMCommandDeleteWithUIDClassAndIdentifier deleteCommand](self, "deleteCommand");
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 execute];

  container_log_handle_for_category();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[MCMCommand resultPromise](self, "resultPromise");
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 result];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 error];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl( &dword_188846000,  v5,  OS_LOG_TYPE_DEFAULT,  "Delete with uid_t, container_class_t, and identifier result; error = %@",
      (uint8_t *)&v9,
      0xCu);
  }

  objc_autoreleasePoolPop(v3);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMCommandOperationDelete)deleteCommand
{
  return self->_deleteCommand;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 10LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end