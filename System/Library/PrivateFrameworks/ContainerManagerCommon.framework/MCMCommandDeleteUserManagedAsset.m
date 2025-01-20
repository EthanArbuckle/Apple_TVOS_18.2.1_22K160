@interface MCMCommandDeleteUserManagedAsset
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)preflightClientAllowed;
- (MCMCommandDeleteUserManagedAsset)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (NSString)sourceRelativePath;
- (void)execute;
@end

@implementation MCMCommandDeleteUserManagedAsset

- (MCMCommandDeleteUserManagedAsset)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___MCMCommandDeleteUserManagedAsset;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v36, sel_initWithMessage_context_reply_, v8, v9, a5);
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
        v34 = -[MCMCommand context](v10, "context");
        [v34 clientIdentity];
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 codeSignInfo];
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 identifier];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        v17 = -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        [v9 clientIdentity];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v38 = v15;
        __int16 v39 = 2048;
        uint64_t v40 = v16;
        __int16 v41 = 2114;
        v42 = v17;
        __int16 v43 = 2114;
        v44 = v18;
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
        v35 = -[MCMCommand context](v10, "context");
        [v35 clientIdentity];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 codeSignInfo];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 identifier];
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = -[MCMContainerIdentityMinimal containerClass](v10->_containerIdentity, "containerClass");
        v30 = -[MCMContainerIdentityMinimal identifier](v10->_containerIdentity, "identifier");
        *(_DWORD *)buf = 138543874;
        v38 = v28;
        __int16 v39 = 2048;
        uint64_t v40 = v29;
        __int16 v41 = 2114;
        v42 = v30;
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
    uint64_t v24 = [v8 sourceRelativePath];
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v24;
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  int v5 = [v4 isAllowedToAccessUserAssets];

  if (!v5) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result)
  {
    v6 = -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
    unint64_t v7 = [v6 containerClass];
    if (v7 <= 0xE && ((1LL << v7) & 0x4ED4) != 0)
    {
      -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
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
          v17 = -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
          uint64_t v18 = [v17 containerClass];
          v19 = -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
          [v19 identifier];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
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
  uint64_t v67 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  v3 = -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
  uint64_t v4 = [v3 identifier];

  -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
  int v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 userIdentity];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MCMCommand context](self, "context");
  [v6 containerCache];
  unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandDeleteUserManagedAsset containerIdentity](self, "containerIdentity");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v62 = 0LL;
  [v7 entryForContainerIdentity:v8 error:&v62];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v62;

  id v61 = v10;
  v53 = v9;
  [v9 metadataWithError:&v61];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (MCMError *)v61;

  v54 = (void *)v4;
  if (!v11)
  {
    container_log_handle_for_category();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = v4;
      __int16 v65 = 2112;
      v66 = v12;
      _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Failed to create app data container for user managed assets path for %@: %@",  buf,  0x16u);
    }

    uint64_t v29 = 0LL;
    __int16 v25 = 0LL;
    v20 = 0LL;
    v52 = 0LL;
    v56 = 0LL;
    v26 = 0LL;
    goto LABEL_28;
  }

  uint64_t v13 = [v11 containerPath];
  if (!v13
    || (v14 = (void *)v13,
        [v11 userManagedAssetsDirName],
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v15,
        v14,
        !v15))
  {
    v34 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 11LL);

    container_log_handle_for_category();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v11;
      _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "No userManagedAssetsDirName or URL in container metadata object: %@",  buf,  0xCu);
    }

    uint64_t v29 = 0LL;
    __int16 v25 = 0LL;
    v20 = 0LL;
    v52 = 0LL;
    v56 = 0LL;
    v26 = 0LL;
    goto LABEL_27;
  }

  [v11 containerPath];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 containerDataURL];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 URLByAppendingPathComponent:@"Library" isDirectory:1];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  [v11 userManagedAssetsDirName];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v18;
  [v18 URLByAppendingPathComponent:v19 isDirectory:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[MCMCommandDeleteUserManagedAsset sourceRelativePath](self, "sourceRelativePath");
  int v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 URLByAppendingPathComponent:v21 isDirectory:0];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 absoluteURL];
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v60 = 0LL;
  [v24 realPathForURL:v23 isDirectory:0 error:&v60];
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (MCMError *)v60;

  v56 = v23;
  if (!v25)
  {
    v34 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

    container_log_handle_for_category();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      [v23 path];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v49;
      __int16 v65 = 2112;
      v66 = v26;
      _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Unable to get realpath for resource %@; error = %@",
        buf,
        0x16u);
    }

    uint64_t v29 = 0LL;
    __int16 v25 = 0LL;
    goto LABEL_27;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 absoluteURL];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v26;
  [v27 realPathForURL:v28 isDirectory:1 error:&v59];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v59;

  if (!v29)
  {
    v34 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

    container_log_handle_for_category();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      [v56 path];
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v50;
      __int16 v65 = 2112;
      v66 = v30;
      _os_log_error_impl( &dword_188846000,  v35,  OS_LOG_TYPE_ERROR,  "Unable to get realpath for resource %@; error = %@",
        buf,
        0x16u);
    }

    uint64_t v29 = 0LL;
    goto LABEL_26;
  }

  [v29 path];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 path];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  int v33 = [v31 isEqualToString:v32];

  if (v33)
  {
    v34 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

    container_log_handle_for_category();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      [v29 path];
      objc_super v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v36;
      v37 = "Illegal attempt to delete user managed assets directory at %@";
LABEL_33:
      __int16 v43 = v35;
      uint32_t v44 = 12;
LABEL_34:
      _os_log_error_impl(&dword_188846000, v43, OS_LOG_TYPE_ERROR, v37, buf, v44);
    }
  }

  else
  {
    [v25 path];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 path];
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();
    int v40 = [v38 hasPrefix:v39];

    if ((v40 & 1) != 0)
    {
      -[MCMCommand context](self, "context");
      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue();
      [v41 containerFactory];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v12;
      char v51 = [v42 deleteURL:v25 forUserIdentity:v57 error:&v58];
      v34 = v58;

      if ((v51 & 1) != 0) {
        goto LABEL_29;
      }
      container_log_handle_for_category();
      v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_26;
      }
      [v25 path];
      objc_super v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      uint64_t v64 = (uint64_t)v36;
      __int16 v65 = 2112;
      v66 = v34;
      v37 = "Failed to remove asset at %@; error = %@";
      __int16 v43 = v35;
      uint32_t v44 = 22;
      goto LABEL_34;
    }

    v34 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 10LL);

    container_log_handle_for_category();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      [v25 path];
      objc_super v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      uint64_t v64 = (uint64_t)v36;
      v37 = "Illegal attempt to delete asset not residing in user managed assets directory %@";
      goto LABEL_33;
    }
  }

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 29LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end