@interface MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier
+ (BOOL)secureRestrictedContainerIfNeededWithMetadata:(id)a3 entitlements:(id)a4 error:(id *)a5;
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)alwaysReturnPath;
- (BOOL)clientIsAllowed;
- (BOOL)preflightClientAllowed;
- (MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerConfiguration)containerConfig;
- (MCMContainerIdentity)containerIdentity;
- (MCMError)error;
- (MCMUserIdentity)userIdentity;
- (NSString)appGroupIdentifier;
- (unsigned)expectedPersonaKernelID;
- (void)_commonInit:(id)a3;
- (void)execute;
@end

@implementation MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier

- (MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v14, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    uint64_t v11 = [v8 appGroupIdentifier];
    appGroupIdentifier = v10->_appGroupIdentifier;
    v10->_appGroupIdentifier = (NSString *)v11;

    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier _commonInit:](v10, "_commonInit:", v9);
  }

  return v10;
}

- (void)_commonInit:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v5 = self->_appGroupIdentifier;
  uint64_t v38 = 1LL;
  v6 = -[MCMCommand context](self, "context");
  [v6 globalConfiguration];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 staticConfig];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 configForContainerClass:7];
  id v9 = (MCMContainerConfiguration *)objc_claimAutoreleasedReturnValue();
  containerConfig = self->_containerConfig;
  self->_containerConfig = v9;

  self->_clientIsAllowed = 0;
  [v4 clientIdentity];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:]( &OBJC_CLASS___MCMXPCMessageBase,  "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:",  v5,  v11,  7LL,  &v38);
  v12 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
  userIdentity = self->_userIdentity;
  self->_userIdentity = v12;

  if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
    dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
  }
  if (MCMRequirePersonaTelemetryOnly_result
    && v38 != 1
    && -[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
  {
    container_log_handle_for_category();
    objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      [v4 clientIdentity];
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      [v37 codeSignInfo];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 identifier];
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 clientIdentity];
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v40 = v32;
      __int16 v41 = 2048;
      uint64_t v42 = 7LL;
      __int16 v43 = 2114;
      v44 = v5;
      __int16 v45 = 2114;
      v46 = v33;
      _os_log_fault_impl( &dword_188846000,  v14,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)",  buf,  0x2Au);
    }

    uint64_t v38 = 1LL;
  }

  else
  {
    if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_15);
    }
    uint64_t v15 = v38;
    if (MCMRequirePersonaAndConvertSystemToPersonal_result && v38 != 1)
    {
      if (-[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
      {
        container_log_handle_for_category();
        v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          [v4 clientIdentity];
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 codeSignInfo];
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          [v35 identifier];
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v36;
          __int16 v41 = 2048;
          uint64_t v42 = 7LL;
          __int16 v43 = 2114;
          v44 = v5;
          _os_log_fault_impl( &dword_188846000,  v16,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no pers ona - converting to Personal",  buf,  0x20u);
        }

        uint64_t v38 = 1LL;
        [v4 userIdentityCache];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MCMUserIdentity posixUser](self->_userIdentity, "posixUser");
        [v17 userIdentityForPersonalPersonaWithPOSIXUser:v18];
        v19 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
        v20 = self->_userIdentity;
        self->_userIdentity = v19;
      }

      uint64_t v15 = v38;
    }

    if (v15 != 1) {
      goto LABEL_22;
    }
  }

  self->_alwaysReturnPath = 0;
  v21 = self->_userIdentity;
  v22 = self->_containerConfig;
  [v4 clientIdentity];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 platform];
  [v4 userIdentityCache];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v21,  v5,  v22,  v24,  v25,  &v38);
  v26 = (MCMContainerIdentity *)objc_claimAutoreleasedReturnValue();
  containerIdentity = self->_containerIdentity;
  self->_containerIdentity = v26;

  if (!self->_containerIdentity && !self->_alwaysReturnPath)
  {
LABEL_22:
    v29 = objc_alloc(&OBJC_CLASS___MCMError);
    v30 = -[MCMError initWithErrorType:](v29, "initWithErrorType:", v38);
    error = self->_error;
    self->_error = v30;
    goto LABEL_23;
  }

  [v4 clientIdentity];
  error = (void *)objc_claimAutoreleasedReturnValue();
  self->_clientIsAllowed = [error isAllowedToLookupContainerIdentity:self->_containerIdentity];
LABEL_23:
}

- (BOOL)preflightClientAllowed
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier error](self, "error");
  if (v3) {
    goto LABEL_2;
  }
  if (-[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier alwaysReturnPath](self, "alwaysReturnPath")
    || (BOOL v4 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier clientIsAllowed](self, "clientIsAllowed")))
  {
    if (MCMRequirePersona_onceToken != -1) {
      dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
    }
    if (!MCMRequirePersona_result) {
      goto LABEL_2;
    }
    v5 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
    unint64_t v6 = [v5 containerClass];
    if (v6 > 0xE || ((1LL << v6) & 0x4ED4) == 0)
    {

LABEL_2:
      LOBYTE(v4) = 1;
      return v4;
    }
    v7 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
    [v7 userIdentity];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = [v8 isNoSpecificPersona];

    if (!v9) {
      goto LABEL_2;
    }
    container_log_handle_for_category();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      v21 = -[MCMCommand context](self, "context");
      [v21 clientIdentity];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 codeSignInfo];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 identifier];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
      objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 containerClass];
      v16 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
      [v16 identifier];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[MCMCommand context](self, "context");
      [v18 clientIdentity];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = v15;
      __int16 v26 = 2114;
      v27 = v17;
      __int16 v28 = 2114;
      v29 = v19;
      _os_log_fault_impl( &dword_188846000,  v10,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)",  buf,  0x2Au);
    }

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
    }
    if (MCMRequirePersonaTelemetryOnly_result) {
      goto LABEL_2;
    }
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)execute
{
  uint64_t v85 = *MEMORY[0x1895F89C0];
  uint64_t v77 = MEMORY[0x1895CE3A8](self, a2);
  __s = 0LL;
  uint64_t v82 = 1LL;
  v3 = -[MCMCommand context](self, "context");
  [v3 clientIdentity];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v4 codeSignInfo];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 entitlements];
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
  [v7 identifier];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  int v9 = [v6 negatesReferenceToAppGroupIdentifier:v8];
  v10 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier error](self, "error");
  if (v10)
  {
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier error](self, "error");
    uint64_t v11 = (MCMError *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v12 = 0LL;
    v13 = 0LL;
    objc_super v14 = 0LL;
    uint64_t v15 = 0LL;
LABEL_4:
    v16 = (void *)v77;
LABEL_5:
    v17 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase), "initWithError:", v11);
    goto LABEL_6;
  }

  if (!-[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier clientIsAllowed](self, "clientIsAllowed"))
  {
    if (!-[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier alwaysReturnPath](self, "alwaysReturnPath"))
    {
      uint64_t v11 = 0LL;
      goto LABEL_3;
    }

    int v76 = v9;
    [v4 userIdentity];
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 posixUser];
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 userIdentityWithPOSIXUser:v35];
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      v17 = 0LL;
      v12 = 0LL;
      uint64_t v11 = 0LL;
      v16 = (void *)v77;
LABEL_34:

      uint64_t v15 = 0LL;
      if (v11 || v82 == 1)
      {
        objc_super v14 = 0LL;
        v13 = 0LL;
      }

      else
      {
        v54 = objc_alloc(&OBJC_CLASS___MCMError);
        uint64_t v11 = -[MCMError initWithErrorType:](v54, "initWithErrorType:", v82);
        uint64_t v15 = 0LL;
        objc_super v14 = 0LL;
        v13 = 0LL;
      }

      goto LABEL_38;
    }

    uint64_t v37 = [MEMORY[0x189607AB8] UUID];
    -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier appGroupIdentifier](self, "appGroupIdentifier");
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
    [v39 containerConfig];
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v41 = [v4 platform];
    -[MCMCommand context](self, "context");
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 userIdentityCache];
    __int16 v43 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v37;
    v75 = v36;
    v44 = +[MCMConcreteContainerIdentity containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMConcreteContainerIdentity,  "containerIdentityWithUUID:userIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v37,  v36,  v38,  v40,  v41,  v43,  &v82);
    if (v44)
    {
      +[MCMFileManager defaultManager](&OBJC_CLASS___MCMFileManager, "defaultManager");
      __int16 v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier appGroupIdentifier](self, "appGroupIdentifier");
      [v45 fsSanitizedStringFromString:v46 allowSpaces:1];
      uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        v12 = +[MCMContainerPath containerPathForContainerIdentity:containerPathIdentifier:]( &OBJC_CLASS___MCMContainerPath,  "containerPathForContainerIdentity:containerPathIdentifier:",  v44,  v47);
        v65 = objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase);
        [v12 containerPathIdentifier];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 identifier];
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v61 = [v44 containerClass];
        [v44 userIdentity];
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        [v69 posixUser];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        [v44 userIdentity];
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        [v49 personaUniqueString];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 containerDataURL];
        v67 = v44;
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v57) = 0;
        LOBYTE(v56) = 1;
        v17 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:]( v65,  "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToke n:existed:url:info:transient:userManagedAssetsRelPath:creator:",  v72,  v63,  v59,  v61,  v48,  v50,  0LL,  v56,  v51,  0LL,  v57,  0LL,  0LL);

        v44 = v67;
        v52 = v72;

        uint64_t v11 = 0LL;
LABEL_33:

        v16 = (void *)v77;
        v36 = v75;
        goto LABEL_34;
      }

      container_log_handle_for_category();
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v55 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier appGroupIdentifier](self, "appGroupIdentifier");
        *(_DWORD *)buf = 138543362;
        v84 = v55;
        _os_log_error_impl( &dword_188846000,  v53,  OS_LOG_TYPE_ERROR,  "Invalid app group identifier [%{public}@]",  buf,  0xCu);
      }

      uint64_t v11 = -[MCMError initWithErrorType:category:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithErrorType:category:",  138LL,  3LL);
      v17 = 0LL;
      v12 = 0LL;
    }

    else
    {
      v17 = 0LL;
      v12 = 0LL;
      uint64_t v11 = 0LL;
    }

    v52 = v72;
    goto LABEL_33;
  }
  v19 = -[MCMCommand context](self, "context");
  [v19 containerFactory];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerIdentity](self, "containerIdentity");
  id v80 = 0LL;
  [v20 containerForContainerIdentity:v21 createIfNecessary:v9 ^ 1u error:&v80];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (MCMError *)v80;

  [v15 metadataMinimal];
  objc_super v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14) {
    goto LABEL_25;
  }
  v22 = -[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier containerConfig](self, "containerConfig");
  int v23 = [v22 supportsProtectedContainerWithRestrictedEntitlement];

  int v76 = v9;
  if (v23)
  {
    -[MCMCommand context](self, "context");
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 clientIdentity];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 codeSignInfo];
    __int16 v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 entitlements];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v11;
    BOOL v73 = +[MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier secureRestrictedContainerIfNeededWithMetadata:entitlements:error:]( &OBJC_CLASS___MCMCommandCreateOrLookupAppGroupByAppGroupIdentifier,  "secureRestrictedContainerIfNeededWithMetadata:entitlements:error:",  v14,  v27,  &v79);
    __int16 v28 = v79;

    if (!v73)
    {
      v12 = 0LL;
      v13 = 0LL;
      uint64_t v11 = v28;
      goto LABEL_4;
    }

    uint64_t v11 = v28;
  }

  v29 = v11;
  [v14 containerIdentity];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 containerPath];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v11;
  v32 = (void *)[v4 issueSandboxExtensionWithIdentity:v30 containerPath:v31 legacyExtensionPolicy:1 extensionsUseProxiedClient:1 exten sionsPolicyUsesProxiedClient:1 error:&v78];
  uint64_t v11 = v78;

  __s = v32;
  if (!v32 && v11 && -[MCMError type](v11, "type") != 1 && -[MCMError type](v11, "type") != 72)
  {
LABEL_25:
    v12 = 0LL;
    v13 = 0LL;
    goto LABEL_4;
  }

  [v14 containerPath];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 containerDataURL];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase);
  [v14 uuid];
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 containerPath];
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  [v70 containerPathIdentifier];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 identifier];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v62 = [v14 containerClass];
  [v14 userIdentity];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  [v68 posixUser];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 userIdentity];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  [v60 personaUniqueString];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v57) = 0;
  LOBYTE(v56) = [v14 existed];
  v17 = -[MCMResultWithContainerBase initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:existed:url:info:transient:userManagedAssetsRelPath:creator:]( v71,  "initWithUUID:containerPathIdentifier:identifier:containerClass:POSIXUser:personaUniqueString:sandboxToken:exis ted:url:info:transient:userManagedAssetsRelPath:creator:",  v74,  v66,  v64,  v62,  v58,  v33,  v32,  v56,  v13,  0LL,  v57,  0LL,  0LL);

  v16 = (void *)v77;
LABEL_38:
  if (!v17) {
    goto LABEL_5;
  }
  if (v76) {
    -[MCMResultBase setCacheable:](v17, "setCacheable:", 0LL);
  }
LABEL_6:
  if (__s)
  {
    free(__s);
    memset_s(&__s, 8uLL, 0, 8uLL);
  }
  v18 = -[MCMCommand resultPromise](self, "resultPromise");
  [v18 completeWithResult:v17];

  objc_autoreleasePoolPop(v16);
}

- (NSString)appGroupIdentifier
{
  return self->_appGroupIdentifier;
}

- (unsigned)expectedPersonaKernelID
{
  return self->_expectedPersonaKernelID;
}

- (BOOL)alwaysReturnPath
{
  return self->_alwaysReturnPath;
}

- (BOOL)clientIsAllowed
{
  return self->_clientIsAllowed;
}

- (MCMUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (MCMContainerIdentity)containerIdentity
{
  return self->_containerIdentity;
}

- (MCMError)error
{
  return self->_error;
}

- (MCMContainerConfiguration)containerConfig
{
  return self->_containerConfig;
}

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 38LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)secureRestrictedContainerIfNeededWithMetadata:(id)a3 entitlements:(id)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a3;
  [v8 identifier];
  int v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 containerPath];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 containerRootURL];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(&OBJC_CLASS___MCMFileHandle);
  [v11 path];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = 0;
  objc_super v14 = -[MCMFileHandle initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:]( v12,  "initWithPath:relativeToFileHandle:direction:symlinks:createMode:createDPClass:openLazily:",  v13,  0LL,  10LL,  1LL,  0LL,  0LL,  v30);

  int v15 = [v7 isOwnerOfProtectedAppGroupContainerWithIdentifier:v9];
  id v16 = 0LL;
  if (!v15)
  {
LABEL_7:
    -[MCMFileHandle close](v14, "close");
    __int16 v24 = 0LL;
    BOOL v25 = 1;
    v19 = v16;
    goto LABEL_17;
  }

  id v32 = 0LL;
  BOOL v17 = -[MCMFileHandle openWithError:](v14, "openWithError:", &v32);
  id v18 = v32;
  v19 = v18;
  if (v17)
  {
    id v31 = v18;
    BOOL v20 = -[MCMFileHandle registerAppContainerForProtectionWithError:]( v14,  "registerAppContainerForProtectionWithError:",  &v31);
    id v16 = v31;

    container_log_handle_for_category();
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        [v11 path];
        int v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = v9;
        __int16 v35 = 2112;
        v36 = v23;
        _os_log_impl( &dword_188846000,  v22,  OS_LOG_TYPE_DEFAULT,  "[%@] Registered app group container at [%@] for protection",  buf,  0x16u);
      }

      goto LABEL_7;
    }

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      [v11 path];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = v29;
      __int16 v37 = 2112;
      id v38 = v16;
      _os_log_error_impl( &dword_188846000,  v22,  OS_LOG_TYPE_ERROR,  "[%@] Failed to register app group container at [%@] for protection; error = %@",
        buf,
        0x20u);
    }

    __int16 v24 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v16,  v11,  145LL);
    v19 = v16;
  }

  else
  {
    container_log_handle_for_category();
    __int16 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      [v11 path];
      __int16 v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      __int16 v35 = 2112;
      v36 = v28;
      __int16 v37 = 2112;
      id v38 = v19;
      _os_log_error_impl( &dword_188846000,  v26,  OS_LOG_TYPE_ERROR,  "[%@] Failed to open %@ during app group protection check; error = %@",
        buf,
        0x20u);
    }

    __int16 v24 = -[MCMError initWithNSError:url:defaultErrorType:]( objc_alloc(&OBJC_CLASS___MCMError),  "initWithNSError:url:defaultErrorType:",  v19,  v11,  144LL);
  }

  -[MCMFileHandle close](v14, "close");
  if (a5)
  {
    __int16 v24 = v24;
    BOOL v25 = 0;
    *a5 = v24;
  }

  else
  {
    BOOL v25 = 0;
  }

@end