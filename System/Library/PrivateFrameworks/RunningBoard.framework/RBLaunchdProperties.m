@interface RBLaunchdProperties
+ (id)_instanceWithProperties:(id)a3;
+ (id)processIdentityForEndpoint:(id)a3;
+ (id)propertiesForJob:(id)a3;
+ (id)propertiesForLabel:(id)a3 error:(id *)a4;
+ (id)propertiesForPid:(int)a3;
- (BOOL)doesOverrideManagement;
- (BOOL)hasBackoff;
- (BOOL)hasVariableEUID;
- (BOOL)isAngel;
- (BOOL)isDaemon;
- (BOOL)isMultiInstance;
- (BOOL)isXPCService;
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (NSString)beforeTranslocationBundlePath;
- (NSString)executablePath;
- (NSString)homeDirectory;
- (NSString)jobLabel;
- (NSString)tmpDirectory;
- (NSString)underlyingAssertion;
- (NSUUID)uuid;
- (RBSProcessIdentity)specifiedIdentity;
- (id)_configureAppWithProperties:(id)a3;
- (id)_configureDaemonOrAngelWithProperties:(id)a3 path:(id)a4 isAngel:(BOOL)a5;
- (id)_configureXPCServiceWithProperties:(id)a3;
- (id)_initWithProperties:(id)a3;
- (id)resolvedIdentity;
- (id)resolvedIdentityWithPid:(int)a3 auid:(unsigned int)a4;
- (int)hostPid;
- (unsigned)overrideManageFlags;
- (void)_parseAdditionalProperties:(id)a3;
- (void)_parseEndpoints:(id)a3 withAdditionalProperties:(id)a4;
- (void)_parseLASSProperties:(id)a3;
@end

@implementation RBLaunchdProperties

+ (id)_instanceWithProperties:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = -[RBLaunchdProperties _initWithProperties:]( objc_alloc(&OBJC_CLASS___RBLaunchdProperties),  "_initWithProperties:",  v3);
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_initWithProperties:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (!v4) {
    -[RBLaunchdProperties _initWithProperties:].cold.1(&v29, buf);
  }
  v5 = v4;
  v28.receiver = self;
  v28.super_class = (Class)&OBJC_CLASS___RBLaunchdProperties;
  v6 = -[RBLaunchdProperties init](&v28, sel_init);
  if (v6)
  {
    [v5 path];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    char v8 = [v5 xpcBundle];
    if ((v8 & 1) != 0)
    {
      char v9 = 0;
      char v10 = 0;
    }

    else
    {
      [v7 pathExtension];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v9 = [v12 isEqualToString:@"plist"];

      char v10 = v9 ^ 1;
    }

    uint64_t v13 = [v5 label];
    p_jobLabel = (uint64_t *)&v6->_jobLabel;
    jobLabel = v6->_jobLabel;
    v6->_jobLabel = (NSString *)v13;

    -[RBLaunchdProperties _parseLASSProperties:](v6, "_parseLASSProperties:", v5);
    switch([v5 serviceType])
    {
      case 1LL:
      case 2LL:
        if ((v9 & 1) == 0)
        {
          rbs_process_log();
          v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _initWithProperties:].cold.5();
          }
        }

        v16 = v6;
        v17 = v5;
        v18 = v7;
        uint64_t v19 = 0LL;
        goto LABEL_28;
      case 3LL:
        if ((v9 & 1) == 0)
        {
          rbs_process_log();
          v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _initWithProperties:].cold.4();
          }
        }

        if (!v6->_doesOverrideHasBackoff) {
          v6->_hasBackoff = 1;
        }
        v16 = v6;
        v17 = v5;
        v18 = v7;
        uint64_t v19 = 1LL;
LABEL_28:
        uint64_t v21 = -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:]( v16,  "_configureDaemonOrAngelWithProperties:path:isAngel:",  v17,  v18,  v19);
        goto LABEL_29;
      case 4LL:
        if (v6->_specifiedIdentity)
        {
          if ((v10 & 1) == 0)
          {
            rbs_process_log();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
              -[RBLaunchdProperties _initWithProperties:].cold.3();
            }
          }

          uint64_t v21 = -[RBLaunchdProperties _configureAppWithProperties:](v6, "_configureAppWithProperties:", v5);
LABEL_29:
          p_jobLabel = (uint64_t *)v21;
        }

        else
        {
          rbs_process_log();
          v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *p_jobLabel;
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v27;
            _os_log_impl( &dword_188634000,  v26,  OS_LOG_TYPE_DEFAULT,  "%{public}@: RunningBoard doesn't recognize submitted process - treating as a anonymous process",  buf,  0xCu);
          }

          p_jobLabel = 0LL;
        }

+ (id)propertiesForPid:(int)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v10 = 0LL;
  [MEMORY[0x18960CE80] propertiesForPid:*(void *)&a3 error:&v10];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  if (v6)
  {
    rbs_general_log();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      int v12 = a3;
      __int16 v13 = 2114;
      id v14 = v6;
      _os_log_impl( &dword_188634000,  v7,  OS_LOG_TYPE_DEFAULT,  "Launchd didn't have information for pid %d, reason: %{public}@",  buf,  0x12u);
    }

    char v8 = 0LL;
  }

  else
  {
    [a1 _instanceWithProperties:v5];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)propertiesForJob:(id)a3
{
  id v4 = a3;
  id v10 = 0LL;
  [MEMORY[0x18960CE80] propertiesForJob:v4 error:&v10];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  if (v5)
  {
    [a1 _instanceWithProperties:v5];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    rbs_general_log();
    char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[RBLaunchdProperties propertiesForJob:].cold.1();
    }

    v7 = 0LL;
  }

  return v7;
}

+ (id)propertiesForLabel:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1895F89C0];
  v5 = (void *)MEMORY[0x18960CE90];
  id v6 = (void *)MEMORY[0x18960CE88];
  id v7 = a3;
  [v6 currentDomain];
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = (void *)[v5 copyJobWithLabel:v7 domain:v8];

  if (!v9)
  {
    if (!a4)
    {
      v11 = 0LL;
      goto LABEL_9;
    }

    v16 = (void *)MEMORY[0x189607870];
    uint64_t v17 = *MEMORY[0x1896124C0];
    uint64_t v21 = *MEMORY[0x1896075F0];
    v22[0] = @"Could not find launchd job for label";
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 errorWithDomain:v17 code:4 userInfo:v14];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0LL;
    goto LABEL_7;
  }

  uint64_t v10 = +[RBLaunchdProperties propertiesForJob:](&OBJC_CLASS___RBLaunchdProperties, "propertiesForJob:", v9);
  v11 = (void *)v10;
  if (a4 && !v10)
  {
    int v12 = (void *)MEMORY[0x189607870];
    uint64_t v13 = *MEMORY[0x1896124C0];
    uint64_t v19 = *MEMORY[0x1896075F0];
    v20 = @"Launchd did not have information on this label";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 errorWithDomain:v13 code:4 userInfo:v14];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    *a4 = v15;
  }

+ (id)processIdentityForEndpoint:(id)a3
{
  v14[2] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v14[0] = 0LL;
  v14[1] = 0LL;
  if ((xpc_endpoint_get_bs_job_handle() & 1) != 0)
  {
    v5 = (os_log_s *)[objc_alloc(MEMORY[0x189607AB8]) initWithUUIDBytes:v14];
    id v6 = (void *)[MEMORY[0x18960CE90] copyJobWithHandle:v5];
    if (v6)
    {
      [a1 propertiesForJob:v6];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      char v8 = v7;
      if (v7)
      {
        [v7 specifiedIdentity];
        char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v10 = v9;
        if (v9)
        {
          v11 = v9;
          uint64_t v10 = v11;
        }

        else
        {
          [v8 resolvedIdentity];
          v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        }

        int v12 = v11;
      }

      else
      {
        rbs_general_log();
        uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          +[RBLaunchdProperties processIdentityForEndpoint:].cold.2();
        }
        int v12 = 0LL;
      }
    }

    else
    {
      rbs_general_log();
      char v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
        +[RBLaunchdProperties processIdentityForEndpoint:].cold.1();
      }
      int v12 = 0LL;
    }
  }

  else
  {
    rbs_general_log();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      +[RBLaunchdProperties processIdentityForEndpoint:].cold.3();
    }
    int v12 = 0LL;
  }

  return v12;
}

- (BOOL)isXPCService
{
  return self->_type == 3;
}

- (BOOL)isDaemon
{
  return self->_type == 2;
}

- (BOOL)isAngel
{
  return self->_type == 4;
}

- (id)resolvedIdentity
{
  return -[RBLaunchdProperties resolvedIdentityWithPid:auid:](self, "resolvedIdentityWithPid:auid:", 0LL, 0LL);
}

- (id)resolvedIdentityWithPid:(int)a3 auid:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  if (!-[RBLaunchdProperties isDaemon](self, "isDaemon"))
  {
    if (-[RBLaunchdProperties isAngel](self, "isAngel"))
    {
      -[RBLaunchdProperties jobLabel](self, "jobLabel");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = (void *)MEMORY[0x1896122E8];
        -[RBLaunchdProperties jobLabel](self, "jobLabel");
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 identityForAngelJobLabel:v12];
        char v9 = (void *)objc_claimAutoreleasedReturnValue();

        return v9;
      }

      rbs_general_log();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[RBLaunchdProperties resolvedIdentityWithPid:auid:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
      }
    }

    char v9 = 0LL;
    return v9;
  }

  id v7 = (void *)MEMORY[0x1896122E8];
  -[RBLaunchdProperties jobLabel](self, "jobLabel");
  char v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v7,  "identityForLaunchdJobLabel:isMultiInstance:pid:auid:",  v8,  -[RBLaunchdProperties isMultiInstance](self, "isMultiInstance"),  v5,  v4);
  char v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_configureXPCServiceWithProperties:(id)a3
{
  self->_hostPid = [a3 hostPID];
  self->_type = 3LL;
  return self;
}

- (id)_configureAppWithProperties:(id)a3
{
  *((void *)self + 1) = 1LL;
  return self;
}

- (void)_parseLASSProperties:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 instance];
  uint64_t v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  uuid = self->_uuid;
  self->_uuid = v5;

  self->_BOOL multiInstance = self->_uuid != 0LL;
  rbs_general_log();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    BOOL multiInstance = self->_multiInstance;
    int v19 = 67109120;
    LODWORD(v20) = multiInstance;
    _os_log_impl(&dword_188634000, v7, OS_LOG_TYPE_INFO, "_BOOL multiInstance = %d", (uint8_t *)&v19, 8u);
  }

  [v4 program];
  char v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  executablePath = self->_executablePath;
  self->_executablePath = v9;

  rbs_general_log();
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = self->_executablePath;
    int v19 = 138543362;
    uint64_t v20 = v12;
    _os_log_impl(&dword_188634000, v11, OS_LOG_TYPE_INFO, "_executablePath = %{public}@", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v13 = [v4 additionalProperties];
  uint64_t v14 = (void *)v13;
  if (v13 && MEMORY[0x1895CA750](v13) == MEMORY[0x1895F9250])
  {
    rbs_general_log();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[RBLaunchdProperties _parseLASSProperties:].cold.1((uint64_t)self, v14, v17);
    }

    -[RBLaunchdProperties _parseAdditionalProperties:](self, "_parseAdditionalProperties:", v14);
    uint64_t v18 = [v4 endpoints];
    uint64_t v15 = (void *)v18;
    if (v18 && MEMORY[0x1895CA750](v18) == MEMORY[0x1895F9220] && xpc_array_get_count(v15)) {
      -[RBLaunchdProperties _parseEndpoints:withAdditionalProperties:]( self,  "_parseEndpoints:withAdditionalProperties:",  v15,  v14);
    }
  }

  else
  {
    rbs_general_log();
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_INFO))
    {
      jobLabel = self->_jobLabel;
      int v19 = 138412290;
      uint64_t v20 = jobLabel;
      _os_log_impl( &dword_188634000,  (os_log_t)v15,  OS_LOG_TYPE_INFO,  "no additional launch properties found for %@",  (uint8_t *)&v19,  0xCu);
    }
  }
}

- (void)_parseAdditionalProperties:(id)a3
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  uint64_t v4 = xpc_dictionary_get_value(a3, "RunningBoard");
  uint64_t v5 = (void *)v4;
  if (v4 && MEMORY[0x1895CA750](v4) == MEMORY[0x1895F9250])
  {
    uint64_t v7 = xpc_dictionary_get_value(v5, "Managed");
    id v6 = (void *)v7;
    uint64_t v8 = MEMORY[0x1895F9228];
    if (v7)
    {
      if (MEMORY[0x1895CA750](v7) == v8)
      {
        self->_BOOL doesOverrideManagement = 1;
        if (xpc_BOOL_get_value(v6)) {
          self->_int overrideManageFlags = -1;
        }
      }
    }

    uint64_t v9 = xpc_dictionary_get_value(v5, "Reported");
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      if (MEMORY[0x1895CA750](v9) == v8)
      {
        self->_BOOL doesOverrideManagement = 1;
        if (xpc_BOOL_get_value(v10)) {
          self->_overrideManageFlags |= 2u;
        }
      }
    }

    v48 = v10;
    uint64_t v11 = xpc_dictionary_get_value(v5, "ExplicitAng");
    int v12 = (void *)v11;
    if (v11 && MEMORY[0x1895CA750](v11) == v8) {
      self->_explicitAngelFlag = xpc_BOOL_get_value(v12);
    }
    v47 = v12;
    uint64_t v13 = xpc_dictionary_get_value(v5, "UnderlyingAssertion");
    uint64_t v14 = (void *)v13;
    uint64_t v15 = MEMORY[0x1895F92E8];
    if (v13 && MEMORY[0x1895CA750](v13) == v15)
    {
      [NSString stringWithUTF8String:xpc_string_get_string_ptr(v14)];
      uint64_t v16 = (NSString *)objc_claimAutoreleasedReturnValue();
      underlyingAssertion = self->_underlyingAssertion;
      self->_underlyingAssertion = v16;
    }

    v46 = v14;
    uint64_t v18 = xpc_dictionary_get_value(v5, "VariableEUID");
    int v19 = (void *)v18;
    if (v18 && MEMORY[0x1895CA750](v18) == v8) {
      self->_BOOL variableEUID = xpc_BOOL_get_value(v19);
    }
    uint64_t v20 = xpc_dictionary_get_value(v5, "Backoff");
    uint64_t v21 = (void *)v20;
    if (v20 && MEMORY[0x1895CA750](v20) == v8)
    {
      self->_doesOverrideHasBackoff = 1;
      self->_hasBackoff = xpc_BOOL_get_value(v21);
    }

    xpc_dictionary_get_value(v5, "RunningBoardLaunchedIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)MEMORY[0x1896122E8];
      v24 = -[RBLaunchdProperties uuid](self, "uuid");
      [v23 decodeFromJob:v22 uuid:v24];
      v25 = (RBSProcessIdentity *)objc_claimAutoreleasedReturnValue();
      specifiedIdentity = self->_specifiedIdentity;
      self->_specifiedIdentity = v25;
    }

    uint64_t v27 = xpc_dictionary_get_value(v5, "BeforeTranslocationBundlePath");
    objc_super v28 = (void *)v27;
    if (v27 && MEMORY[0x1895CA750](v27) == v15)
    {
      [NSString stringWithUTF8String:xpc_string_get_string_ptr(v28)];
      uint64_t v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      beforeTranslocationBundlePath = self->_beforeTranslocationBundlePath;
      self->_beforeTranslocationBundlePath = v29;
    }

    uint64_t v31 = xpc_dictionary_get_value(v5, "HOME");
    v32 = (void *)v31;
    if (v31 && MEMORY[0x1895CA750](v31) == v15)
    {
      [NSString stringWithUTF8String:xpc_string_get_string_ptr(v32)];
      v33 = (NSString *)objc_claimAutoreleasedReturnValue();
      homeDirectory = self->_homeDirectory;
      self->_homeDirectory = v33;
    }

    uint64_t v35 = xpc_dictionary_get_value(v5, "TMPDIR");
    v36 = (void *)v35;
    if (v35 && MEMORY[0x1895CA750](v35) == v15)
    {
      [NSString stringWithUTF8String:xpc_string_get_string_ptr(v36)];
      v37 = (NSString *)objc_claimAutoreleasedReturnValue();
      tmpDirectory = self->_tmpDirectory;
      self->_tmpDirectory = v37;
    }

    rbs_general_log();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      BOOL doesOverrideManagement = self->_doesOverrideManagement;
      int overrideManageFlags = self->_overrideManageFlags;
      BOOL variableEUID = self->_variableEUID;
      v43 = self->_underlyingAssertion;
      v44 = self->_specifiedIdentity;
      v45 = self->_beforeTranslocationBundlePath;
      *(_DWORD *)buf = 67110402;
      BOOL v50 = doesOverrideManagement;
      __int16 v51 = 1024;
      int v52 = overrideManageFlags;
      __int16 v53 = 2114;
      v54 = v43;
      __int16 v55 = 1024;
      BOOL v56 = variableEUID;
      __int16 v57 = 2114;
      v58 = v44;
      __int16 v59 = 2114;
      v60 = v45;
      _os_log_impl( &dword_188634000,  v39,  OS_LOG_TYPE_INFO,  "_BOOL doesOverrideManagement = %d, _overrideManageFlags = %d, _underlyingAssertion = %{public}@, _variableEUID = %d, _specifiedIdenity = %{public}@ _beforeTranslocationBundlePath = %{public}@",  buf,  0x32u);
    }
  }

  else
  {
    rbs_general_log();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188634000,  (os_log_t)v6,  OS_LOG_TYPE_INFO,  "_parseAdditionalProperties no RBProperties",  buf,  2u);
    }
  }
}

- (void)_parseEndpoints:(id)a3 withAdditionalProperties:(id)a4
{
  xpc_object_t xarray = a3;
  id v5 = a4;
  if (xpc_array_get_count(xarray))
  {
    xpc_object_t xdict = v5;
    size_t v6 = 0LL;
    uint64_t v7 = 0LL;
    uint64_t v8 = xarray;
    do
    {
      xpc_array_get_dictionary(v8, v6);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      string = xpc_dictionary_get_string(v9, "XPCServiceEndpointName");
      BOOL v11 = xpc_dictionary_get_BOOL(v9, "XPCServiceEndpointNonLaunching");
      uint64_t v12 = xpc_dictionary_get_value(v9, "XPCServiceEndpointPort");
      uint64_t v13 = (void *)v12;
      if (string && v12)
      {
        id v14 = objc_alloc(MEMORY[0x189612260]);
        [NSString stringWithUTF8String:string];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v16 = (void *)[v14 _initWithName:v15 nonLaunching:v11 port:v13];

        if (v7)
        {
          [v16 name];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v7 setObject:v16 forKey:v17];
        }

        else
        {
          uint64_t v18 = (void *)MEMORY[0x189603FC8];
          [v16 name];
          uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
          [v18 dictionaryWithObject:v16 forKey:v17];
          uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

      BOOL v19 = xpc_array_get_count(xarray) > ++v6;
      uint64_t v8 = xarray;
    }

    while (v19);
    id v5 = xdict;
    if (v7)
    {
      uint64_t v20 = xpc_dictionary_get_dictionary(xdict, "RunningBoard");
      uint64_t v21 = (void *)v20;
      if (v20)
      {
        uint64_t v22 = MEMORY[0x1895CA750](v20);
        uint64_t v23 = MEMORY[0x1895F9250];
        if (v22 == MEMORY[0x1895F9250])
        {
          uint64_t v24 = xpc_dictionary_get_dictionary(v21, "LaunchRequestEndpointIdentifiers");
          v25 = (void *)v24;
          if (v24 && MEMORY[0x1895CA750](v24) == v23)
          {
            [MEMORY[0x189603FC8] dictionaryWithCapacity:xpc_dictionary_get_count(v25)];
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            applier[0] = MEMORY[0x1895F87A8];
            applier[1] = 3221225472LL;
            applier[2] = __64__RBLaunchdProperties__parseEndpoints_withAdditionalProperties___block_invoke;
            applier[3] = &unk_18A256C80;
            id v34 = v7;
            uint64_t v35 = self;
            id v27 = v26;
            id v36 = v27;
            if (xpc_dictionary_apply(v25, applier) && [v27 count])
            {
              objc_super v28 = (NSDictionary *)[v27 copy];
              managedEndpointByLaunchIdentifier = self->_managedEndpointByLaunchIdentifier;
              self->_managedEndpointByLaunchIdentifier = v28;
            }
          }
        }
      }
    }
  }
}

uint64_t __64__RBLaunchdProperties__parseEndpoints_withAdditionalProperties___block_invoke( void *a1,  uint64_t a2,  void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  if (MEMORY[0x1895CA750]() != MEMORY[0x1895F9228])
  {
    if (MEMORY[0x1895CA750](v5) != MEMORY[0x1895F92E8])
    {
      rbs_process_log();
      size_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        goto LABEL_19;
      }
      goto LABEL_12;
    }

    [NSString stringWithUTF8String:a2];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v11 = (void *)a1[4];
    [NSString stringWithUTF8String:xpc_string_get_string_ptr(v5)];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 objectForKey:v12];
    size_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      uint64_t v9 = (void *)a1[6];
      if (v10)
      {
        [v9 setObject:v6 forKey:v10];
LABEL_14:
        uint64_t v13 = 1LL;
        goto LABEL_15;
      }

- (id)_configureDaemonOrAngelWithProperties:(id)a3 path:(id)a4 isAngel:(BOOL)a5
{
  BOOL v6 = a5;
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    [v9 label];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 length];

    if (v12)
    {
      objc_storeStrong((id *)&self->_path, a4);
      BOOL explicitAngelFlag = self->_explicitAngelFlag;
      if (self->_explicitAngelFlag || v6)
      {
        self->_type = 4LL;
        if (self->_overrideManageFlags != 255)
        {
          rbs_general_log();
          uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.9();
          }

          self->_int overrideManageFlags = -1;
          BOOL explicitAngelFlag = self->_explicitAngelFlag;
        }

        if (explicitAngelFlag)
        {
          rbs_general_log();
          v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.8();
          }
        }

        if ([v9 processType] != 256)
        {
          rbs_general_log();
          v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.7((uint64_t)self, v9, v33);
          }
        }

        if ([v9 keepAlive])
        {
          rbs_general_log();
          id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.6();
          }
        }

        if ([v9 runAtLoad])
        {
          rbs_general_log();
          uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.5();
          }
        }

        if ([v9 enableTransactions])
        {
          rbs_general_log();
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.4();
          }
        }

        if ([v9 enablePressuredExit])
        {
          rbs_general_log();
          v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.3();
          }
        }

        [v9 endpoints];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!xpc_array_get_count(v14) || !xpc_array_get_count(v14)) {
          goto LABEL_68;
        }
        id v49 = v10;
        id v50 = v9;
        size_t v38 = 0LL;
        do
        {
          xpc_array_get_value(v14, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          string = xpc_dictionary_get_string(v39, "XPCServiceEndpointName");
          rbs_general_log();
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            jobLabel = self->_jobLabel;
            if (string)
            {
              [NSString stringWithUTF8String:string];
              id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v43 = v5;
            }

            else
            {
              v43 = @"<NO-NAME>";
            }

            *(_DWORD *)buf = 138543618;
            int v52 = jobLabel;
            __int16 v53 = 2114;
            v54 = v43;
            _os_log_impl( &dword_188634000,  v41,  OS_LOG_TYPE_INFO,  "Checking angel %{public}@ for mach service with name %{public}@",  buf,  0x16u);
            if (string) {
          }
            }

          if (!xpc_dictionary_get_BOOL(v39, "XPCServiceEndpointNonLaunching"))
          {
            rbs_general_log();
            v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
            {
              v45 = self->_jobLabel;
              v46 = @"<NO-NAME>";
              if (string)
              {
                [NSString stringWithUTF8String:string];
                v48 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v46 = v48;
              }

              *(_DWORD *)buf = 138543618;
              int v52 = v45;
              __int16 v53 = 2114;
              v54 = v46;
              _os_log_fault_impl( &dword_188634000,  v44,  OS_LOG_TYPE_FAULT,  "Angel %{public}@ has the unsupported launching mach service with name %{public}@",  buf,  0x16u);
              if (string) {
            }
              }
          }

          ++v38;
        }

        while (xpc_array_get_count(v14) > v38);
      }

      else
      {
        self->_type = 2LL;
        [v9 endpoints];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!xpc_array_get_count(v14) || !xpc_array_get_count(v14)) {
          goto LABEL_68;
        }
        id v49 = v10;
        id v50 = v9;
        size_t v15 = 0LL;
        do
        {
          xpc_array_get_value(v14, v15);
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = xpc_dictionary_get_string(v16, "XPCServiceEndpointName");
          if (v17)
          {
            int v18 = v17;
            if (!strcmp(v17, "com.apple.frontboard.workspace")
              || !strcmp(v18, "com.apple.frontboard.systemappservices"))
            {
              rbs_general_log();
              uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                __int16 v20 = self->_jobLabel;
                [NSString stringWithUTF8String:v18];
                uint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                int v52 = v20;
                __int16 v53 = 2114;
                v54 = v21;
                _os_log_impl( &dword_188634000,  v19,  OS_LOG_TYPE_DEFAULT,  "Found FrontBoard mach service for daemon %{public}@ with name %{public}@",  buf,  0x16u);
              }

              if (!self->_doesOverrideManagement)
              {
                self->_BOOL doesOverrideManagement = 1;
                self->_int overrideManageFlags = 2;
              }
            }
          }

          ++v15;
        }

        while (xpc_array_get_count(v14) > v15);
      }

      id v10 = v49;
      id v9 = v50;
LABEL_68:

      v30 = self;
      goto LABEL_69;
    }

    rbs_general_log();
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.2();
    }
  }

  else
  {
    rbs_general_log();
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchdProperties _configureDaemonOrAngelWithProperties:path:isAngel:].cold.1( v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29);
    }
  }

  v30 = 0LL;
LABEL_69:

  return v30;
}

- (int)hostPid
{
  return self->_hostPid;
}

- (BOOL)isMultiInstance
{
  return self->_multiInstance;
}

- (BOOL)hasVariableEUID
{
  return self->_variableEUID;
}

- (unsigned)overrideManageFlags
{
  return self->_overrideManageFlags;
}

- (NSString)jobLabel
{
  return self->_jobLabel;
}

- (NSString)executablePath
{
  return self->_executablePath;
}

- (BOOL)doesOverrideManagement
{
  return self->_doesOverrideManagement;
}

- (NSString)underlyingAssertion
{
  return self->_underlyingAssertion;
}

- (RBSProcessIdentity)specifiedIdentity
{
  return self->_specifiedIdentity;
}

- (NSString)beforeTranslocationBundlePath
{
  return self->_beforeTranslocationBundlePath;
}

- (NSString)homeDirectory
{
  return self->_homeDirectory;
}

- (NSString)tmpDirectory
{
  return self->_tmpDirectory;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (BOOL)hasBackoff
{
  return self->_hasBackoff;
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (void).cxx_destruct
{
}

- (void)_initWithProperties:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

- (void)_initWithProperties:(os_log_s *)a3 .cold.2(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a2 serviceType];
  OUTLINED_FUNCTION_12_1();
  int v7 = v4;
  OUTLINED_FUNCTION_4_2(&dword_188634000, a3, v5, "%{public}@: Unrecognized launchd process type %d", v6);
  OUTLINED_FUNCTION_1();
}

- (void)_initWithProperties:.cold.3()
{
}

- (void)_initWithProperties:.cold.4()
{
}

- (void)_initWithProperties:.cold.5()
{
}

- (void)_initWithProperties:.cold.6()
{
}

+ (void)propertiesForJob:.cold.1()
{
}

+ (void)processIdentityForEndpoint:.cold.1()
{
  OUTLINED_FUNCTION_19(&dword_188634000, v0, v1, "no job for endpoint %@ from looked up handle=%@");
  OUTLINED_FUNCTION_1_1();
}

+ (void)processIdentityForEndpoint:.cold.2()
{
}

+ (void)processIdentityForEndpoint:.cold.3()
{
}

- (void)resolvedIdentityWithPid:(uint64_t)a3 auid:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_parseLASSProperties:(os_log_s *)a3 .cold.1(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  [a2 NSRepresentation];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl( &dword_188634000,  a3,  OS_LOG_TYPE_DEBUG,  "additional launch properties for %@: %@",  (uint8_t *)&v6,  0x16u);
}

- (void)_configureDaemonOrAngelWithProperties:(uint64_t)a3 path:(uint64_t)a4 isAngel:(uint64_t)a5 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.2()
{
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.3()
{
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.4()
{
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.5()
{
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.6()
{
}

- (void)_configureDaemonOrAngelWithProperties:(uint64_t)a1 path:(void *)a2 isAngel:(os_log_s *)a3 .cold.7( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [a2 processType];
  OUTLINED_FUNCTION_12_1();
  int v7 = v4;
  OUTLINED_FUNCTION_4_2(&dword_188634000, a3, v5, "Angel %{public}@ is using a ProcessType other than app: %d", v6);
  OUTLINED_FUNCTION_1();
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.8()
{
}

- (void)_configureDaemonOrAngelWithProperties:path:isAngel:.cold.9()
{
}

@end