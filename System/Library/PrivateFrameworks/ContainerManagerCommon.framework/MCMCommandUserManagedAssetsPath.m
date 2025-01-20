@interface MCMCommandUserManagedAssetsPath
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createIfNecessary;
- (BOOL)isRelative;
- (BOOL)preflightClientAllowed;
- (MCMCommandUserManagedAssetsPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (void)execute;
@end

@implementation MCMCommandUserManagedAssetsPath

- (MCMCommandUserManagedAssetsPath)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MCMCommandUserManagedAssetsPath;
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
    v10->_relative = [v8 isRelative];
    v10->_createIfNecessary = [v8 createIfNecessary];
  }

  return v10;
}

- (BOOL)preflightClientAllowed
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  [v3 identifier];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = -[MCMCommand context](self, "context");
  [(id)v5 clientIdentity];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 codeSignInfo];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v4 isEqualToString:v8];
  v10 = -[MCMCommand context](self, "context");
  [v10 clientIdentity];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = [v11 isAllowedToAccessUserAssets];

  if ((v5 & 1) == 0 && !v9) {
    return 0;
  }
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
  }
  if (MCMRequirePersona_result)
  {
    v13 = -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
    unint64_t v14 = [v13 containerClass];
    if (v14 <= 0xE && ((1LL << v14) & 0x4ED4) != 0)
    {
      v15 = -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
      [v15 userIdentity];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      int v17 = [v16 isNoSpecificPersona];

      if (v17)
      {
        container_log_handle_for_category();
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          v19 = -[MCMCommand context](self, "context");
          [v19 clientIdentity];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 codeSignInfo];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 identifier];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = [v23 containerClass];
          v25 = -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
          [v25 identifier];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          int v27 = 138543874;
          v28 = v22;
          __int16 v29 = 2048;
          uint64_t v30 = v24;
          __int16 v31 = 2114;
          v32 = v26;
          _os_log_fault_impl( &dword_188846000,  v18,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona",  (uint8_t *)&v27,  0x20u);
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
  uint64_t v88 = *MEMORY[0x1895F89C0];
  context = (void *)MEMORY[0x1895CE3A8](self, a2);
  v3 = -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  uint64_t v4 = [v3 userIdentity];

  -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 identifier];
  v7 = -[MCMCommand context](self, "context");
  [v7 containerCache];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandUserManagedAssetsPath containerIdentity](self, "containerIdentity");
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v79 = 0LL;
  [v8 entryForContainerIdentity:v9 error:&v79];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (MCMError *)v79;

  v70 = (void *)v6;
  v71 = (void *)v4;
  v69 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  v78 = v11;
  [v10 metadataWithError:&v78];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v78;

  if (!v12)
  {
    uint64_t v11 = v13;
LABEL_14:
    container_log_handle_for_category();
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = v6;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v11;
      _os_log_error_impl( &dword_188846000,  v43,  OS_LOG_TYPE_ERROR,  "Failed to create app data container for user managed assets path for %@: %@",  buf,  0x16u);
    }

    uint64_t v33 = 0LL;
    uint64_t v30 = 0LL;
    v25 = 0LL;
    v73 = 0LL;
    v12 = 0LL;
    goto LABEL_21;
  }

  [v12 containerPath];
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    uint64_t v11 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 11LL);

    container_log_handle_for_category();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      uint64_t v33 = 0LL;
      uint64_t v30 = 0LL;
      v25 = 0LL;
      v73 = 0LL;
LABEL_21:
      id v26 = 0LL;
LABEL_22:
      v48 = 0LL;
      uint64_t v41 = 0LL;
      goto LABEL_23;
    }

    *(_DWORD *)buf = 138412290;
    uint64_t v81 = (uint64_t)v12;
    v45 = "No URL in container metadata object: %@";
    v46 = (os_log_s *)v44;
    uint32_t v47 = 12;
LABEL_48:
    _os_log_error_impl(&dword_188846000, v46, OS_LOG_TYPE_ERROR, v45, buf, v47);
    goto LABEL_20;
  }

  [v12 containerPath];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 containerDataURL];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 URLByAppendingPathComponent:@"Library" isDirectory:1];
  int v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    uint64_t v11 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 13LL);

    container_log_handle_for_category();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v45 = "Could not get library URL";
    v46 = (os_log_s *)v44;
    uint32_t v47 = 2;
    goto LABEL_48;
  }

  v68 = v13;
  uint64_t v18 = [v12 userManagedAssetsDirName];
  v73 = v17;
  if (v18)
  {
    v19 = (void *)v18;
    v20 = +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
    [v12 userManagedAssetsDirName];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 URLByAppendingPathComponent:v21 isDirectory:1];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v23 = [v20 itemDoesNotExistAtURL:v22];

    if (!v23)
    {
      [v12 userManagedAssetsDirName];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = 1LL;
      [v17 URLByAppendingPathComponent:v55 isDirectory:1];
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v33 = 0LL;
      uint64_t v30 = 0LL;
      v42 = 0LL;
      v36 = v12;
      goto LABEL_33;
    }
  }

  if (!-[MCMCommandUserManagedAssetsPath createIfNecessary](self, "createIfNecessary"))
  {
    uint64_t v11 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 71LL);

    container_log_handle_for_category();
    v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = v4;
      __int16 v82 = 2112;
      uint64_t v83 = v6;
      _os_log_error_impl(&dword_188846000, v54, OS_LOG_TYPE_ERROR, "User managed path for %@:%@ Not Found", buf, 0x16u);
    }

    uint64_t v33 = 0LL;
    uint64_t v30 = 0LL;
    v25 = 0LL;
    goto LABEL_21;
  }

  +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v77 = 0LL;
  [v24 createTemporaryDirectoryInDirectoryURL:v17 withNamePrefix:@"com.apple.UserManagedAssets." error:&v77];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = v77;

  if (!v25)
  {
    uint64_t v11 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 6LL);

    container_log_handle_for_category();
    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v81 = (uint64_t)v73;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v26;
      _os_log_error_impl( &dword_188846000,  v58,  OS_LOG_TYPE_ERROR,  "Failed to create user managed assets dir at %@: %@",  buf,  0x16u);
    }

    uint64_t v33 = 0LL;
    uint64_t v30 = 0LL;
    v25 = 0LL;
    goto LABEL_22;
  }

  uint64_t v27 = [v12 containerClass];
  [v12 userIdentity];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 posixUser];
  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerClassPath posixOwnerForContainerClass:user:]( &OBJC_CLASS___MCMContainerClassPath,  "posixOwnerForContainerClass:user:",  v27,  v29);
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();

  __int16 v31 = objc_alloc(&OBJC_CLASS___MCMFileHandle);
  uint64_t v32 = [v25 path];
  LOBYTE(v66) = 1;
  uint64_t v33 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:]( v31,  "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:",  v32,  0LL,  9LL,  0LL,  0LL,  0LL,  v66);

  id v76 = v26;
  LOBYTE(v32) = -[MCMFileHandle setPermissions:andOwner:error:](v33, "setPermissions:andOwner:error:", 493LL, v30, &v76);
  id v34 = v76;

  if ((v32 & 1) == 0)
  {
    uint64_t v11 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v34,  v25,  6LL);

    container_log_handle_for_category();
    v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v81 = (uint64_t)v34;
      _os_log_error_impl( &dword_188846000,  v59,  OS_LOG_TYPE_ERROR,  "Failed to set permissions on user managed assets dir; error = %@",
        buf,
        0xCu);
    }

    v48 = 0LL;
    uint64_t v41 = 0LL;
    goto LABEL_43;
  }

  id v67 = v34;
  uint64_t v35 = [v25 lastPathComponent];
  [v12 metadataBySettingUserManagedAssetsDirName:v35];
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = v68;
  LOBYTE(v35) = [v36 writeMetadataToDiskWithError:&v75];
  uint64_t v11 = v75;

  if ((v35 & 1) != 0)
  {
    -[MCMCommand context](self, "context");
    __int16 v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 containerCache];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v11;
    [v38 addContainerMetadata:v36 error:&v74];
    __int16 v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v74;

    if (v39)
    {
      v68 = v40;
      uint64_t v41 = 0LL;
      v42 = v67;
LABEL_33:
      if (-[MCMCommandUserManagedAssetsPath isRelative](self, "isRelative"))
      {
        [v36 userManagedAssetsDirName];
        v56 = v42;
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        [@"Library" stringByAppendingPathComponent:v57];
        v48 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v36;
        id v26 = v56;
      }

      else
      {
        [v25 path];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v36;
        id v26 = v42;
      }

      uint64_t v11 = v68;
      goto LABEL_23;
    }

    uint64_t v11 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 45LL);

    container_log_handle_for_category();
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v34 = v67;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
    {
      [v36 containerPath];
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      int v65 = [v36 transient];
      *(_DWORD *)buf = 138412802;
      uint64_t v81 = (uint64_t)v36;
      __int16 v82 = 2112;
      uint64_t v83 = (uint64_t)v64;
      __int16 v84 = 1024;
      int v85 = v65;
      _os_log_error_impl( &dword_188846000,  v61,  OS_LOG_TYPE_ERROR,  "Failed to add to cache: %@, container path: %@, transient: %d",  buf,  0x1Cu);

      id v34 = v67;
    }

    v48 = 0LL;
    uint64_t v41 = 0LL;
    v12 = v36;
LABEL_43:
    id v26 = v34;
    goto LABEL_23;
  }

  container_log_handle_for_category();
  v60 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
  {
    [v36 containerPath];
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    int v63 = [v36 transient];
    *(_DWORD *)buf = 138413058;
    uint64_t v81 = (uint64_t)v36;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v62;
    __int16 v84 = 1024;
    int v85 = v63;
    __int16 v86 = 2112;
    v87 = v11;
    _os_log_error_impl( &dword_188846000,  v60,  OS_LOG_TYPE_ERROR,  "Failed to write metadata: %@, container path: %@, transient: %d; error = %@",
      buf,
      0x26u);
  }

  v48 = 0LL;
  uint64_t v41 = 0LL;
  v12 = v36;
  id v26 = v67;
LABEL_23:
  container_log_handle_for_category();
  v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v81 = (uint64_t)v48;
    __int16 v82 = 2112;
    uint64_t v83 = (uint64_t)v11;
    _os_log_impl( &dword_188846000,  v49,  OS_LOG_TYPE_DEFAULT,  "User managed assets path result: [%@], error = %@",  buf,  0x16u);
  }

  v50 = objc_alloc(&OBJC_CLASS___MCMResultWithURLBase);
  if (v48) {
    uint64_t v51 = -[MCMResultWithURLBase initWithPath:existed:sandboxToken:]( v50,  "initWithPath:existed:sandboxToken:",  v48,  v41,  0LL);
  }
  else {
    uint64_t v51 = -[MCMResultBase initWithError:](v50, "initWithError:", v11);
  }
  v52 = (void *)v51;
  v53 = -[MCMCommand resultPromise](self, "resultPromise");
  [v53 completeWithResult:v52];

  objc_autoreleasePoolPop(context);
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (BOOL)isRelative
{
  return self->_relative;
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 28LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end