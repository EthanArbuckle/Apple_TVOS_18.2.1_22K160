@interface MCMCommandCreateOrLookupWithBundle
+ (Class)incomingMessageClass;
+ (unint64_t)command;
- (BOOL)createIfNecessary;
- (BOOL)issueSandboxExtension;
- (BOOL)preflightClientAllowed;
- (BOOL)transient;
- (MCMCodeSignInfo)info;
- (MCMCommandCreateOrLookupWithBundle)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5;
- (MCMContainerIdentity)containerIdentity;
- (MCMError)error;
- (MCMUserIdentity)userIdentity;
- (NSURL)bundleURL;
- (NSURL)executableURL;
- (const)sandboxToken;
- (unint64_t)containerClass;
- (void)_commonInit:(id)a3;
- (void)dealloc;
- (void)execute;
@end

@implementation MCMCommandCreateOrLookupWithBundle

- (MCMCommandCreateOrLookupWithBundle)initWithMessage:(id)a3 context:(id)a4 reply:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MCMCommandCreateOrLookupWithBundle;
  v10 = -[MCMCommand initWithMessage:context:reply:](&v18, sel_initWithMessage_context_reply_, v8, v9, a5);
  if (v10)
  {
    v10->_createIfNecessary = [v8 createIfNecessary];
    v10->_transient = [v8 transient];
    v10->_issueSandboxExtension = [v8 issueSandboxExtension];
    id v11 = v8;
    v12 = (char *)[v11 sandboxToken];
    if (v12) {
      v12 = strndup(v12, 0x800uLL);
    }
    v10->_sandboxToken = v12;
    uint64_t v13 = [v11 bundleURL];
    bundleURL = v10->_bundleURL;
    v10->_bundleURL = (NSURL *)v13;

    uint64_t v15 = [v11 executableURL];
    executableURL = v10->_executableURL;
    v10->_executableURL = (NSURL *)v15;

    -[MCMCommandCreateOrLookupWithBundle _commonInit:](v10, "_commonInit:", v9);
  }

  return v10;
}

- (void)_commonInit:(id)a3
{
  uint64_t v68 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v59 = 1LL;
  if (self->_sandboxToken)
  {
    uint64_t v5 = sandbox_extension_consume();
    if (v5 < 0)
    {
      v6 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 57LL);
      error = self->_error;
      self->_error = v6;

      id v8 = 0LL;
      goto LABEL_37;
    }
  }

  else
  {
    uint64_t v5 = -1LL;
  }

  self->_unint64_t containerClass = 2LL;
  -[NSURL path](self->_bundleURL, "path");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = [v9 hasSuffix:@".appex"];

  if (v10)
  {
    container_log_handle_for_category();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = -[NSURL path](self->_bundleURL, "path");
      *(_DWORD *)buf = 138543362;
      v61 = v12;
      _os_log_impl(&dword_188846000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] is a plugin", buf, 0xCu);
    }

    self->_unint64_t containerClass = 4LL;
  }

  -[MCMCommand context](self, "context");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 globalConfiguration];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 staticConfig];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 configForContainerClass:self->_containerClass];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[MCMCodeSignInfo initWithURL:error:]( objc_alloc(&OBJC_CLASS___MCMCodeSignInfo),  "initWithURL:error:",  self->_executableURL,  &v59);
  info = self->_info;
  self->_info = v16;

  objc_super v18 = self->_info;
  if (!v18) {
    goto LABEL_33;
  }
  unsigned int v19 = -[MCMCodeSignInfo platform](v18, "platform");
  v20 = -[MCMCodeSignInfo entitlements](self->_info, "entitlements");
  v21 = v20;
  if (v19 != 2)
  {
    [v20 objectForKeyedSubscript:@"com.apple.security.app-sandbox"];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    char v27 = [v26 BOOLValue];

    if ((v27 & 1) == 0) {
      goto LABEL_12;
    }
    goto LABEL_14;
  }

  [v20 objectForKeyedSubscript:@"com.apple.private.security.no-container"];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  int v23 = [v22 BOOLValue];

  if (!v23)
  {
LABEL_14:
    v28 = -[MCMCodeSignInfo identifier](self->_info, "identifier");
    [v4 clientIdentity];
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[MCMXPCMessageBase userIdentityForContainerIdentifier:clientIdentity:containerClass:error:]( &OBJC_CLASS___MCMXPCMessageBase,  "userIdentityForContainerIdentifier:clientIdentity:containerClass:error:",  v28,  v29,  self->_containerClass,  &v59);
    v30 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
    userIdentity = self->_userIdentity;
    self->_userIdentity = v30;

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
    }
    if (MCMRequirePersonaTelemetryOnly_result
      && v59 != 1
      && -[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
    {
      container_log_handle_for_category();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        [v4 clientIdentity];
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        [v57 codeSignInfo];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 identifier];
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t containerClass = self->_containerClass;
        v49 = -[MCMCodeSignInfo identifier](self->_info, "identifier");
        [v4 clientIdentity];
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v61 = v48;
        __int16 v62 = 2048;
        unint64_t v63 = containerClass;
        __int16 v64 = 2114;
        v65 = v49;
        __int16 v66 = 2114;
        v67 = v50;
        _os_log_fault_impl( &dword_188846000,  v32,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)",  buf,  0x2Au);
      }

      uint64_t v59 = 1LL;
      goto LABEL_32;
    }

    if (MCMRequirePersonaAndConvertSystemToPersonal_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaAndConvertSystemToPersonal_onceToken, &__block_literal_global_15);
    }
    uint64_t v33 = v59;
    if (MCMRequirePersonaAndConvertSystemToPersonal_result && v59 != 1)
    {
      if (-[MCMUserIdentity isNoSpecificPersona](self->_userIdentity, "isNoSpecificPersona"))
      {
        container_log_handle_for_category();
        v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        {
          [v4 clientIdentity];
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          [v58 codeSignInfo];
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          [v56 identifier];
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          unint64_t v52 = self->_containerClass;
          v53 = -[MCMCodeSignInfo identifier](self->_info, "identifier");
          *(_DWORD *)buf = 138543874;
          v61 = v51;
          __int16 v62 = 2048;
          unint64_t v63 = v52;
          __int16 v64 = 2114;
          v65 = v53;
          _os_log_fault_impl( &dword_188846000,  v34,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no pers ona - converting to Personal",  buf,  0x20u);
        }

        uint64_t v59 = 1LL;
        [v4 userIdentityCache];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[MCMUserIdentity posixUser](self->_userIdentity, "posixUser");
        [v35 userIdentityForPersonalPersonaWithPOSIXUser:v36];
        v37 = (MCMUserIdentity *)objc_claimAutoreleasedReturnValue();
        v38 = self->_userIdentity;
        self->_userIdentity = v37;
      }

      uint64_t v33 = v59;
    }

    if (v33 == 1)
    {
LABEL_32:
      v39 = self->_userIdentity;
      v40 = -[MCMCodeSignInfo identifier](self->_info, "identifier");
      uint64_t v41 = -[MCMCodeSignInfo platform](self->_info, "platform");
      v42 = -[MCMCommand context](self, "context");
      [v42 userIdentityCache];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      +[MCMContainerIdentity containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:]( &OBJC_CLASS___MCMContainerIdentity,  "containerIdentityWithUserIdentity:identifier:containerConfig:platform:userIdentityCache:error:",  v39,  v40,  v8,  v41,  v43,  &v59);
      v44 = (MCMContainerIdentity *)objc_claimAutoreleasedReturnValue();
      containerIdentity = self->_containerIdentity;
      self->_containerIdentity = v44;

      if (self->_containerIdentity) {
        goto LABEL_35;
      }
    }

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  p_sandboxToken = &self->_sandboxToken;
  sandboxToken = (char *)self->_sandboxToken;
  if (sandboxToken)
  {
    free(sandboxToken);
    memset_s(p_sandboxToken, 8uLL, 0, 8uLL);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMCommandCreateOrLookupWithBundle;
  -[MCMCommandCreateOrLookupWithBundle dealloc](&v5, sel_dealloc);
}

- (BOOL)preflightClientAllowed
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  v3 = -[MCMCommandCreateOrLookupWithBundle error](self, "error");
  if (v3) {
    return 1;
  }
  -[MCMCommand context](self, "context");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 clientIdentity];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
  int v8 = [v6 isAllowedToLookupContainerIdentity:v7];

  if (v8)
  {
    if (MCMRequirePersona_onceToken != -1) {
      dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_12);
    }
    if (!MCMRequirePersona_result) {
      return 1;
    }
    -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = [v9 containerClass];
    if (v10 > 0xE || ((1LL << v10) & 0x4ED4) == 0)
    {

      return 1;
    }

    -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 userIdentity];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v12 isNoSpecificPersona];

    if (!v13) {
      return 1;
    }
    container_log_handle_for_category();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v24 = -[MCMCommand context](self, "context");
      [v24 clientIdentity];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 codeSignInfo];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 identifier];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v18 containerClass];
      v20 = -[MCMCommandCreateOrLookupWithBundle containerIdentity](self, "containerIdentity");
      [v20 identifier];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MCMCommand context](self, "context");
      [v22 clientIdentity];
      int v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = v17;
      __int16 v27 = 2048;
      uint64_t v28 = v19;
      __int16 v29 = 2114;
      v30 = v21;
      __int16 v31 = 2114;
      v32 = v23;
      _os_log_fault_impl( &dword_188846000,  v14,  OS_LOG_TYPE_FAULT,  "Client %{public}@ trying to look up container %llu:%{public}@ while in one of the System personas or no persona (%{public}@)",  buf,  0x2Au);
    }

    if (MCMRequirePersonaTelemetryOnly_onceToken != -1) {
      dispatch_once(&MCMRequirePersonaTelemetryOnly_onceToken, &__block_literal_global_17);
    }
    if (MCMRequirePersonaTelemetryOnly_result) {
      return 1;
    }
  }

  return 0;
}

- (void)execute
{
  __s[1] = *MEMORY[0x1895F89C0];
  v3 = (void *)MEMORY[0x1895CE3A8](self, a2);
  __s[0] = 0LL;
  -[MCMCommandCreateOrLookupWithBundle error](self, "error");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MCMCommandCreateOrLookupWithBundle error](self, "error");
    objc_super v5 = (MCMError *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    uint64_t v6 = v5;
    v7 = 0LL;
    int v8 = 0LL;
LABEL_4:
    id v9 = -[MCMResultBase initWithError:](objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase), "initWithError:", v6);
    goto LABEL_5;
  }

  id v11 = self;
  if (-[MCMCommandCreateOrLookupWithBundle sandboxToken](v11, "sandboxToken"))
  {
    -[MCMCommandCreateOrLookupWithBundle sandboxToken](v11, "sandboxToken");
    uint64_t v12 = sandbox_extension_consume();
    if (v12 < 0)
    {
      objc_super v5 = -[MCMError initWithErrorType:](objc_alloc(&OBJC_CLASS___MCMError), "initWithErrorType:", 57LL);
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v12 = -1LL;
  }

  -[MCMCommand context](v11, "context");
  int v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 containerFactory];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCMCommandCreateOrLookupWithBundle containerIdentity](v11, "containerIdentity");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v29 = 0LL;
  objc_msgSend( v14,  "containerForContainerIdentity:createIfNecessary:error:",  v15,  -[MCMCommandCreateOrLookupWithBundle createIfNecessary](v11, "createIfNecessary"),  &v29);
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (MCMError *)v29;

  [v8 metadataMinimal];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7) {
    goto LABEL_21;
  }
  __int16 v27 = v3;
  if (-[MCMCommandCreateOrLookupWithBundle issueSandboxExtension](v11, "issueSandboxExtension")) {
    goto LABEL_13;
  }
  v16 = -[MCMCommand context](v11, "context");
  [v16 clientIdentity];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 userIdentity];
  objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
  int v19 = [v18 isDataSeparated];

  if (v19)
  {
LABEL_13:
    v26 = -[MCMCommand context](v11, "context");
    [v26 clientIdentity];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 containerIdentity];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 containerPath];
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = v6;
    int v23 = (void *)[v20 issueSandboxExtensionWithIdentity:v21 containerPath:v22 legacyExtensionPolicy:1 extensionsUseProxiedClient:1 ext ensionsPolicyUsesProxiedClient:1 error:&v28];
    uint64_t v24 = v12;
    uint64_t v25 = v28;

    __s[0] = v23;
    uint64_t v6 = v25;
    uint64_t v12 = v24;
  }

  else
  {
    int v23 = 0LL;
  }

  v3 = v27;
  if (v23 || !v6 || -[MCMError type](v6, "type") == 1 || -[MCMError type](v6, "type") == 72)
  {
    id v9 = -[MCMResultWithContainerBase initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:]( objc_alloc(&OBJC_CLASS___MCMResultWithContainerBase),  "initWithMetadata:sandboxToken:includePath:includeInfo:includeUserManagedAssetsRelPath:includeCreator:",  v7,  v23,  1LL,  0LL,  0LL,  0LL);
    if (v23)
    {
      free(v23);
      memset_s(__s, 8uLL, 0, 8uLL);
    }
  }

  else
  {
LABEL_21:
    id v9 = 0LL;
  }

  if ((v12 & 0x8000000000000000LL) == 0) {
    sandbox_extension_release();
  }
  if (!v9) {
    goto LABEL_4;
  }
LABEL_5:
  -[MCMCommand resultPromise](self, "resultPromise");
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 completeWithResult:v9];

  objc_autoreleasePoolPop(v3);
}

- (BOOL)createIfNecessary
{
  return self->_createIfNecessary;
}

- (BOOL)transient
{
  return self->_transient;
}

- (BOOL)issueSandboxExtension
{
  return self->_issueSandboxExtension;
}

- (const)sandboxToken
{
  return self->_sandboxToken;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (NSURL)executableURL
{
  return self->_executableURL;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (MCMCodeSignInfo)info
{
  return self->_info;
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

- (void).cxx_destruct
{
}

+ (unint64_t)command
{
  return 36LL;
}

+ (Class)incomingMessageClass
{
  return (Class)objc_opt_class();
}

@end