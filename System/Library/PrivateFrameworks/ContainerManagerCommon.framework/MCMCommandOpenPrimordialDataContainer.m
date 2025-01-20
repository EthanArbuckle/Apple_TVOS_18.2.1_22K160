@interface MCMCommandOpenPrimordialDataContainer
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)extension;
- (BOOL)preflightClientAllowed;
- (BOOL)testMode;
- (MCMCommandOpenPrimordialDataContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (MCMError)error;
- (void)execute;
@end

@implementation MCMCommandOpenPrimordialDataContainer

- (MCMCommandOpenPrimordialDataContainer)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___MCMCommandOpenPrimordialDataContainer;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v56, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    id v11 = v8;
    char v12 = [v11 useCodeSignDatabase];
    [v9 clientIdentity];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 codeSignInfo];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v55 = 1LL;
    [v14 entitlements];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v15 containerRequiredIdentifier];

    if (v16)
    {
LABEL_3:
      v10->_testMode = [v13 isAllowedToTest] & v12;
      uint64_t v17 = [(id)gCodeSigningMapping dataContainerTypeForIdentifier:v16];
      if (!v17)
      {
        container_log_handle_for_category();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v58 = v16;
          _os_log_impl( &dword_188846000,  v18,  OS_LOG_TYPE_DEFAULT,  "Unknown data container type for identifier (%{public}@), assuming app",  buf,  0xCu);
        }

        uint64_t v17 = 2LL;
      }

      v53 = v14;
      v10->_extension = v17 == 4;
      v19 = -[MCMCommand context](v10, "context");
      [v19 globalConfiguration];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 staticConfig];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 configForContainerClass:v17];
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      [v13 userIdentity];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = (MCMError *)v16;
      if ([v23 isNoSpecificPersona])
      {
        [v9 userIdentityCache];
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 posixUser];
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v24 userIdentityForPersonalPersonaWithPOSIXUser:v25];
        id v26 = v9;
        uint64_t v28 = v27 = v13;

        v23 = (void *)v28;
        v13 = v27;
        id v9 = v26;
      }

      if (v23)
      {
        id v29 = v9;
        v30 = v13;
        uint64_t v31 = [v11 platform];
        v32 = -[MCMCommand context](v10, "context");
        [v32 userIdentityCache];
        id v52 = v8;
        id v33 = v11;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = v31;
        v13 = v30;
        id v9 = v29;
        uint64_t v36 = +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:transient:userIdentityCache:error:",  v23,  v54,  v22,  v35,  0LL,  v34,  &v55);
        containerIdentity = v10->_containerIdentity;
        v10->_containerIdentity = (MCMContainerIdentity *)v36;

        id v11 = v33;
        id v8 = v52;

        if (v55 != 1)
        {
          v38 = objc_alloc(&OBJC_CLASS___MCMError);
          uint64_t v39 = -[MCMError initWithErrorType:](v38, "initWithErrorType:", v55);
          error = v10->_error;
          v10->_error = (MCMError *)v39;
        }
      }

      v14 = v53;
      v41 = v54;
      goto LABEL_22;
    }

    [v14 entitlements];
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    int v43 = [v42 requestsNoContainer];

    if (v43)
    {
      container_log_handle_for_category();
      v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        int v45 = [v13 posixPID];
        *(_DWORD *)buf = 138543618;
        uint64_t v58 = (uint64_t)v14;
        __int16 v59 = 1024;
        int v60 = v45;
        _os_log_impl( &dword_188846000,  v44,  OS_LOG_TYPE_DEFAULT,  "Client (%{public}@, %d) requests no container with no-container entitlement",  buf,  0x12u);
      }

      v46 = objc_alloc(&OBJC_CLASS___MCMError);
      uint64_t v47 = 96LL;
    }

    else
    {
      uint64_t v16 = [v14 identifier];
      if (v16) {
        goto LABEL_3;
      }
      container_log_handle_for_category();
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        int v49 = [v13 posixPID];
        *(_DWORD *)buf = 67109120;
        LODWORD(v58) = v49;
        _os_log_impl( &dword_188846000,  v48,  OS_LOG_TYPE_DEFAULT,  "No container-required or codesign identifier -- no container possible for client %d",  buf,  8u);
      }

      v46 = objc_alloc(&OBJC_CLASS___MCMError);
      uint64_t v47 = 18LL;
    }

    uint64_t v50 = -[MCMError initWithErrorType:](v46, "initWithErrorType:", v47);
    v41 = v10->_error;
    v10->_error = (MCMError *)v50;
LABEL_22:
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  return 1;
}

- (void)execute
{
  v2 = self;
  uint64_t v61 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  container_log_handle_for_category();
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[MCMCommand context](v2, "context");
    [v4 clientIdentity];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 codeSignInfo];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 identifier];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 containerClass];
    v10 = -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    [v10 identifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = -[MCMCommandOpenPrimordialDataContainer extension](v2, "extension");
    v13 = "app";
    *(_DWORD *)buf = 138544130;
    *(void *)uint64_t v55 = v7;
    *(_WORD *)&v55[8] = 2048;
    if (v12) {
      v13 = "extension";
    }
    uint64_t v56 = v9;
    __int16 v57 = 2114;
    uint64_t v58 = v11;
    __int16 v59 = 2082;
    int v60 = v13;
    _os_log_impl( &dword_188846000,  v3,  OS_LOG_TYPE_DEFAULT,  "Fetching primordial container for '%{public}@' with identifier '%llu:%{public}@' (%{public}s)",  buf,  0x2Au);
  }
  v14 = -[MCMCommandOpenPrimordialDataContainer error](v2, "error");
  if (v14)
  {
    -[MCMCommandOpenPrimordialDataContainer error](v2, "error");
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
LABEL_7:
    id v18 = 0LL;
    goto LABEL_8;
  }

  -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v32 = -[MCMCommand context](v2, "context");
    [v32 containerFactory];
    id v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[MCMCommandOpenPrimordialDataContainer containerIdentity](v2, "containerIdentity");
    id v51 = 0LL;
    [v33 containerForContainerIdentity:v34 createIfNecessary:1 error:&v51];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v51;

    if (!v17)
    {
      uint64_t v16 = 0LL;
      goto LABEL_7;
    }

    [v17 metadataMinimal];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v35 existed];
    [v35 containerPath];
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 containerDataURL];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v37 = -[MCMCommand context](v2, "context");
      [v37 clientIdentity];
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      [v38 proximateClient];
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39)
      {
        [v39 auditToken];
      }

      else
      {
        __int128 v52 = 0u;
        __int128 v53 = 0u;
      }

      id v18 = v18;
      [v18 fileSystemRepresentation];
      int v43 = sandbox_set_container_path_for_audit_token();

      if (v43)
      {
        if (!-[MCMCommandOpenPrimordialDataContainer testMode](v2, "testMode")
          && ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) == 0 && *__error() != 45))
        {
          container_log_handle_for_category();
          v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
          {
            int v46 = *__error();
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v55 = v43;
            *(_WORD *)&v55[4] = 1024;
            *(_DWORD *)&v55[6] = v46;
            _os_log_fault_impl( &dword_188846000,  v44,  OS_LOG_TYPE_FAULT,  "sandbox_set_container_path_for_audit_token() failed with error %d / %d.",  buf,  0xEu);
          }

          int v45 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 65LL);
          id v18 = 0LL;
          id v15 = v45;
        }
      }
    }
  }

  else
  {
    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    id v18 = 0LL;
    id v15 = 0LL;
  }

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMError)error
{
  return self->_error;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (BOOL)extension
{
  return self->_extension;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 45LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end