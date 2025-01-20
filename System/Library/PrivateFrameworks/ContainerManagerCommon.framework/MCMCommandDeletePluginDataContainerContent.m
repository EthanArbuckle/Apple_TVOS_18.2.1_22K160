@interface MCMCommandDeletePluginDataContainerContent
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeletePluginDataContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandDeletePluginDataContainerContent

- (MCMCommandDeletePluginDataContainerContent)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MCMCommandDeletePluginDataContainerContent;
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
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
  [v5 identifier];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v4 isAllowedToWipePlugInDataContainerWithIdentifier:v6];

  if (!v7) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result)
  {
    -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v9 = [v8 containerClass];
    if (v9 <= 0xE && ((1LL << v9) & 0x4ED4) != 0)
    {
      v10 = -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
      [v10 userIdentity];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      int v12 = [v11 isNoSpecificPersona];

      if (v12)
      {
        container_log_handle_for_category();
        v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
        {
          v15 = -[MCMCommand context](self, "context");
          [v15 clientIdentity];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 codeSignInfo];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v17 identifier];
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
          uint64_t v20 = [v19 containerClass];
          v21 = -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
          [v21 identifier];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          int v23 = 138543874;
          v24 = v18;
          __int16 v25 = 2048;
          uint64_t v26 = v20;
          __int16 v27 = 2114;
          v28 = v22;
          _os_log_fault_impl( &dword_188846000,  v13,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona",  (uint8_t *)&v23,  0x20u);
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
  uint64_t v15 = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  v4 = objc_alloc(&OBJC_CLASS___MCMCommandDeleteContainerContent);
  v5 = -[MCMCommandDeletePluginDataContainerContent containerIdentity](self, "containerIdentity");
  v6 = -[MCMCommand context](self, "context");
  -[MCMCommand resultPromise](self, "resultPromise");
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = -[MCMCommandDeleteContainerContent initWithContainerIdentity:context:resultPromise:]( v4,  "initWithContainerIdentity:context:resultPromise:",  v5,  v6,  v7);

  -[MCMCommandDeleteContainerContent execute](v8, "execute");
  container_log_handle_for_category();
  unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = -[MCMCommand resultPromise](self, "resultPromise");
    [v10 result];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 error];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = 138412290;
    v14 = v12;
    _os_log_impl( &dword_188846000,  v9,  OS_LOG_TYPE_DEFAULT,  "Wipe plugin data container; error = %@",
      (uint8_t *)&v13,
      0xCu);
  }

  objc_autoreleasePoolPop(v3);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 11LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end