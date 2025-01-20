@interface RBLaunchdJobManager
+ (id)lastExitStatusForLabel:(id)a3 error:(id *)a4;
- (BOOL)_addAppPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5 actualIdentity:(id *)a6 error:(id *)a7;
- (BOOL)_addContainerPropertiesFromExtensionContext:(id)a3 toServiceDict:(id)a4;
- (BOOL)_addPersonaFromExtensionContext:(id)a3 toServiceDict:(id)a4;
- (BOOL)_isRunningBoardLaunched:(id)a3;
- (BOOL)_removeJobWithInstance:(id)a3 orJob:(id)a4 error:(id *)a5;
- (BOOL)removeJobWithInstance:(id)a3 error:(id *)a4;
- (RBLaunchdJobManager)initWithLaunchdInterface:(id)a3 personaManager:(id)a4 containerManager:(id)a5 bundlePropertiesManager:(id)a6;
- (id)_containerURLForExtensionContext:(id)a3;
- (id)_createAndSubmitExtensionJob:(id)a3 UUID:(id)a4 error:(id *)a5;
- (id)_createLaunchdJobWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6;
- (id)_generateDataWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6;
- (id)createAndLaunchWithIdentity:(id)a3 context:(id)a4 error:(id *)a5;
- (id)synchronizeJobs;
- (unint64_t)test_trackedJobCount;
- (void)_addDextPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5;
- (void)_addExtensionContainerURL:(id)a3 toServiceDict:(id)a4;
- (void)_addExtensionEnvironmentFromContainerURL:(id)a3 toServiceDict:(id)a4;
- (void)_addSharedPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5;
- (void)_addStandardAppPropertiesToData:(id)a3;
- (void)invokeOnProcessDeath:(id)a3 handler:(id)a4 onQueue:(id)a5;
- (void)synchronizeJobs;
@end

@implementation RBLaunchdJobManager

+ (id)lastExitStatusForLabel:(id)a3 error:(id *)a4
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v6 = v5;
  if (!v5)
  {
LABEL_10:
    v10 = 0LL;
    goto LABEL_11;
  }

  id v7 = v5;
  [v7 UTF8String];
  int last_exit_reason_4SB = _launch_get_last_exit_reason_4SB();
  if (!last_exit_reason_4SB)
  {
    rbs_job_log();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v24 = v7;
      _os_log_impl( &dword_188634000,  v19,  OS_LOG_TYPE_DEFAULT,  "Launchd says label %{public}@ has never exited",  buf,  0xCu);
    }

    goto LABEL_10;
  }

  int v9 = last_exit_reason_4SB;
  [MEMORY[0x1896122C8] statusWithDomain:0 code:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = xpc_strerror();
  rbs_job_log();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = v7;
    __int16 v25 = 2080;
    uint64_t v26 = v11;
    __int16 v27 = 1024;
    int v28 = v9;
    _os_log_error_impl( &dword_188634000,  v12,  OS_LOG_TYPE_ERROR,  "failed to get process exit details for %{public}@ : %s (%d)",  buf,  0x1Cu);
  }

  if (a4)
  {
    [NSString stringWithFormat:@"Unable to get process exit details for label %@", v7];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithUTF8String:v11];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x189607870];
    uint64_t v16 = *MEMORY[0x189607688];
    uint64_t v17 = *MEMORY[0x1896075F0];
    v21[0] = *MEMORY[0x1896075E0];
    v21[1] = v17;
    v22[0] = v13;
    v22[1] = v14;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 errorWithDomain:v16 code:v9 userInfo:v18];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

- (RBLaunchdJobManager)initWithLaunchdInterface:(id)a3 personaManager:(id)a4 containerManager:(id)a5 bundlePropertiesManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___RBLaunchdJobManager;
  v15 = -[RBLaunchdJobManager init](&v25, sel_init);
  if (v15)
  {
    uint64_t v16 = [MEMORY[0x189603FC8] dictionary];
    lock_jobsByIdentifier = v15->_lock_jobsByIdentifier;
    v15->_lock_jobsByIdentifier = (NSMutableDictionary *)v16;

    uint64_t v18 = [MEMORY[0x189603FC8] dictionary];
    lock_monitoredJobsByIdentifier = v15->_lock_monitoredJobsByIdentifier;
    v15->_lock_monitoredJobsByIdentifier = (NSMutableDictionary *)v18;

    v15->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v15->_launchdInterface, a3);
    objc_storeStrong((id *)&v15->_personaManager, a4);
    objc_storeStrong((id *)&v15->_containerManager, a5);
    objc_storeStrong((id *)&v15->_bundlePropertiesManager, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.runningboard.launchdLogging", v20);
    logQueue = v15->_logQueue;
    v15->_logQueue = (OS_dispatch_queue *)v21;

    v23 = v15;
  }

  return v15;
}

- (void)_addSharedPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  id v43 = a5;
  char v9 = [v43 executionOptions];
  xpc_dictionary_set_string(v7, "_ManagedBy", "com.apple.runningboard");
  [v8 applicationJobLabel];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [v8 applicationJobLabel];
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  id v12 = v8;
  if ([v12 isEmbeddedApplication])
  {
    id v13 = (void *)NSString;
    [v12 embeddedApplicationIdentifier];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 stringWithFormat:@"UIKitApplication:%@[%04x][rb-legacy]", v14, arc4random() % 0xFFFF];
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if ([v12 hasConsistentLaunchdJob])
    {
      uint64_t v15 = [v12 consistentLaunchdJobLabel];
    }

    else if ([v12 isApplication])
    {
      uint64_t v15 = [v12 applicationJobLabel];
    }

    else
    {
      if (![v12 isDext])
      {
        id v11 = &stru_18A257E48;
        goto LABEL_12;
      }

      uint64_t v15 = [v12 dextLabel];
    }

    id v11 = (__CFString *)v15;
  }

- (void)_addDextPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5
{
  xpc_object_t xdict = a3;
  id v7 = a4;
  id v8 = a5;
  char v9 = [v8 executionOptions];
  xpc_dictionary_set_string(xdict, "ProcessType", "Driver");
  xpc_dictionary_set_BOOL(xdict, "RunAtLoad", 1);
  xpc_dictionary_set_BOOL(xdict, "LaunchOnlyOnce", 1);
  xpc_dictionary_set_string(xdict, "UserName", "_driverkit");
  xpc_dictionary_set_string(xdict, "SandboxProfile", "com.apple.dext");
  xpc_dictionary_set_BOOL(xdict, "_NullBootstrapPort", 1);
  if ((v9 & 0x40) != 0)
  {
    xpc_object_t v10 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_uint64(v10, "Core", 0x7FFFFFFFFFFFFFFFuLL);
    xpc_dictionary_set_value(xdict, "HardResourceLimits", v10);
    xpc_dictionary_set_value(xdict, "SoftResourceLimits", v10);
  }

  [v7 dextServerName];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    id v12 = [v7 dextServerName];
    xpc_dictionary_set_string(xdict, "_JetsamPropertiesIdentifier", (const char *)[v12 UTF8String]);
  }

  if ((v9 & 0x20) != 0) {
    xpc_dictionary_set_BOOL(xdict, "ReslideSharedCache", 1);
  }
  [v8 dextCheckInPort];
  xpc_dictionary_set_mach_send();
}

- (void)_addStandardAppPropertiesToData:(id)a3
{
  xpc_object_t xdict = a3;
  xpc_dictionary_set_string(xdict, "UserName", "mobile");
  xpc_dictionary_set_BOOL(xdict, "MaterializeDatalessFiles", 1);
  xpc_dictionary_set_BOOL(xdict, "EnablePressuredExit", 0);
  xpc_dictionary_set_BOOL(xdict, "EnableTransactions", 0);
  xpc_dictionary_set_int64(xdict, "ThrottleInterval", 0x7FFFFFFFLL);
  xpc_dictionary_set_int64(xdict, "ExitTimeOut", 1LL);
}

- (BOOL)_addAppPropertiesToData:(id)a3 forIdentity:(id)a4 context:(id)a5 actualIdentity:(id *)a6 error:(id *)a7
{
  uint64_t v100 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  char v14 = [v13 executionOptions];
  v78 = a6;
  *a6 = 0LL;
  -[RBLaunchdJobManager _addStandardAppPropertiesToData:](self, "_addStandardAppPropertiesToData:", v11);
  if (([v13 lsSpawnFlags] & 4) == 0)
  {
    int v15 = [v13 spawnType];
    if (v15)
    {
      int v16 = v15;
      if (v15 == 1)
      {
        xpc_object_t v17 = "SystemApp";
      }

      else
      {
        rbs_general_log();
        id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
          -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:].cold.2(v16, v18);
        }

        xpc_object_t v17 = 0LL;
      }
    }

    else
    {
      xpc_object_t v17 = "App";
    }

    xpc_dictionary_set_string(v11, "ProcessType", v17);
    xpc_dictionary_set_int64(v11, "_LaunchType", 3LL);
  }

  id v19 = [v12 description];
  xpc_dictionary_set_string(v11, "_ResourceCoalition", (const char *)[v19 UTF8String]);

  [v13 bundleIdentifier];
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    id v21 = [v13 bundleIdentifier];
    xpc_dictionary_set_string(v11, "CFBundleIdentifier", (const char *)[v21 UTF8String]);
  }

  [v13 _additionalMachServices];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v14 & 0x10) != 0) {
    xpc_dictionary_set_BOOL(v11, "NSBuiltWithThreadSanitizer", 1);
  }
  v81 = v13;
  char v79 = v14;
  xpc_object_t v80 = v11;
  id v23 = v12;
  if ((v14 & 4) != 0)
  {

    uint64_t v22 = 0LL;
  }

  xpc_object_t xdict = xpc_dictionary_create(0LL, 0LL, 0LL);
  __int128 v90 = 0u;
  __int128 v91 = 0u;
  __int128 v92 = 0u;
  __int128 v93 = 0u;
  obuint64_t j = v22;
  uint64_t v24 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v91;
    do
    {
      for (uint64_t i = 0LL; i != v25; ++i)
      {
        if (*(void *)v91 != v26) {
          objc_enumerationMutation(obj);
        }
        int v28 = *(void **)(*((void *)&v90 + 1) + 8 * i);
        rbs_general_log();
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v96 = v28;
          __int16 v97 = 2114;
          v98 = v23;
          _os_log_impl( &dword_188634000,  v29,  OS_LOG_TYPE_DEFAULT,  "Inserting mach service %{public}@ into job for %{public}@",  buf,  0x16u);
        }

        xpc_object_t v30 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_BOOL(v30, "ResetAtClose", 1);
        xpc_dictionary_set_value(xdict, (const char *)[v28 UTF8String], v30);
      }

      uint64_t v25 = [obj countByEnumeratingWithState:&v90 objects:v99 count:16];
    }

    while (v25);
  }

  xpc_dictionary_set_value(v80, "MachServices", xdict);
  [v81 standardOutputPath];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    id v32 = [v81 standardOutputPath];
    xpc_dictionary_set_string(v80, "StandardOutPath", (const char *)[v32 UTF8String]);
  }

  [v81 standardErrorPath];
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = self;
  if (v33)
  {
    id v35 = [v81 standardErrorPath];
    xpc_dictionary_set_string(v80, "StandardErrorPath", (const char *)[v35 UTF8String]);
  }

  [v81 standardInPath];
  id v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    id v37 = [v81 standardInPath];
    xpc_dictionary_set_string(v80, "StandardInPath", (const char *)[v37 UTF8String]);
  }

  id v38 = v23;
  if ((v79 & 5) == 1LL) {
    xpc_dictionary_set_BOOL(v80, "WaitForDebugger", 1);
  }
  if ((v79 & 6) == 2LL) {
    xpc_dictionary_set_BOOL(v80, "DisableASLR", 1);
  }
  if ([v81 lsSpawnFlags]) {
    xpc_dictionary_set_BOOL(v80, "WaitForDebugger", 1);
  }
  if ([v81 initialRole])
  {
    [v81 initialRole];
    int v39 = RBSDarwinRoleFromRBSRole();
    xpc_dictionary_set_int64(v80, "InitialTaskRole", v39);
  }

  uint64_t v40 = [v81 lsBinpref];
  if (v40
    && (v41 = (void *)v40,
        [v81 lsBinprefSubtype],
        v42 = (void *)objc_claimAutoreleasedReturnValue(),
        v42,
        v41,
        v42))
  {
    xpc_object_t v43 = xpc_array_create(0LL, 0LL);
    [v81 lsBinpref];
    __int128 v44 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v45 = [v44 count];

    if (v45)
    {
      unint64_t v46 = 0LL;
      do
      {
        [v81 lsBinpref];
        __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
        [v47 objectAtIndex:v46];
        __int128 v48 = (void *)objc_claimAutoreleasedReturnValue();

        xpc_object_t v49 = xpc_dictionary_create(0LL, 0LL, 0LL);
        xpc_dictionary_set_int64(v49, "CPUType", [v48 integerValue]);
        [v81 lsBinprefSubtype];
        __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v51 = [v50 count];

        if (v51 <= v46)
        {
          int64_t v54 = -1LL;
        }

        else
        {
          [v81 lsBinprefSubtype];
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          [v52 objectAtIndex:v46];
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          int64_t v54 = [v53 integerValue];
        }

        xpc_dictionary_set_int64(v49, "CPUSubtype", v54);
        xpc_array_set_value(v43, 0xFFFFFFFFFFFFFFFFLL, v49);

        ++v46;
        [v81 lsBinpref];
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v56 = [v55 count];
      }

      while (v56 > v46);
      id v38 = v23;
      v34 = self;
    }
  }

  else
  {
    [v81 lsBinpref];
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v57) {
      goto LABEL_58;
    }
    xpc_object_t v43 = xpc_array_create(0LL, 0LL);
    *(_OWORD *)&value[1] = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    __int128 v89 = 0u;
    [v81 lsBinpref];
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = [v58 countByEnumeratingWithState:&value[1] objects:v94 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v87;
      do
      {
        for (uint64_t j = 0LL; j != v60; ++j)
        {
          if (*(void *)v87 != v61) {
            objc_enumerationMutation(v58);
          }
          xpc_array_set_int64( v43,  0xFFFFFFFFFFFFFFFFLL,  [*(id *)(*(void *)&value[3] + 8 * j) unsignedIntegerValue]);
        }

        uint64_t v60 = [v58 countByEnumeratingWithState:&value[1] objects:v94 count:16];
      }

      while (v60);
    }
  }

  xpc_dictionary_set_value(v80, "BinaryOrderPreference", v43);

LABEL_58:
  value[0] = 0;
  personaManager = v34->_personaManager;
  id v85 = 0LL;
  BOOL v64 = -[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:]( personaManager,  "personaForIdentity:context:personaUID:personaUniqueString:",  v38,  v81,  value,  &v85);
  id v65 = v85;
  if (v64)
  {
    xpc_dictionary_set_int64(v80, "PersonaEnterprise", value[0]);
    v66 = (void *)[v38 copyWithPersonaString:v65];

    id v38 = v66;
    id *v78 = v38;
    id v67 = [v38 description];
    xpc_dictionary_set_string(v80, "_ResourceCoalition", (const char *)[v67 UTF8String]);

    _addRBProperties(v80, v38, v81);
  }

  [v81 preventContainerization];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  char v69 = [v68 BOOLValue];

  if ((v69 & 1) == 0)
  {
    containerManager = v34->_containerManager;
    id v84 = 0LL;
    v72 = -[RBContainerManager containerPathForIdentity:context:persona:error:]( containerManager,  "containerPathForIdentity:context:persona:error:",  v38,  v81,  v65,  &v84);
    v73 = (os_log_s *)v84;
    v70 = v73;
    if (v72)
    {
      v74 = (const char *)[v72 fileSystemRepresentation];
      xpc_dictionary_set_string(v80, "SandboxContainer", v74);
      xpc_dictionary_get_value(v80, "EnvironmentVariables");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v75;
      if (v75)
      {
        xpc_dictionary_set_value(v75, "HOME", 0LL);
        xpc_dictionary_set_value(v76, "CFFIXED_USER_HOME", 0LL);
        xpc_dictionary_set_value(v76, "TMPDIR", 0LL);
        xpc_dictionary_set_value(v76, "_DYLD_CLOSURE_HOME", 0LL);
        xpc_dictionary_set_string(v76, "HOME", v74);
      }
    }

    else
    {
      if (!v73)
      {
LABEL_74:

        goto LABEL_75;
      }

      rbs_job_log();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v76, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:].cold.1();
      }
    }

    goto LABEL_74;
  }

  rbs_job_log();
  v70 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v96 = v38;
    __int16 v97 = 2114;
    v98 = v81;
    _os_log_impl( &dword_188634000,  v70,  OS_LOG_TYPE_DEFAULT,  "'%{public}@' Skipping container path lookup because containerization was prevented (%{public}@)",  buf,  0x16u);
  }

- (id)_generateDataWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  id v13 = (void *)MEMORY[0x1895C9F58]();
  _addRBProperties(v12, v10, v11);
  -[RBLaunchdJobManager _addSharedPropertiesToData:forIdentity:context:]( self,  "_addSharedPropertiesToData:forIdentity:context:",  v12,  v10,  v11);
  if ([v10 isDext])
  {
    -[RBLaunchdJobManager _addDextPropertiesToData:forIdentity:context:]( self,  "_addDextPropertiesToData:forIdentity:context:",  v12,  v10,  v11);
    objc_autoreleasePoolPop(v13);
    id v14 = 0LL;
LABEL_3:
    id v15 = 0LL;
LABEL_7:
    id v19 = v12;
    id v17 = v15;
    goto LABEL_8;
  }

  id v21 = 0LL;
  id v22 = 0LL;
  BOOL v16 = -[RBLaunchdJobManager _addAppPropertiesToData:forIdentity:context:actualIdentity:error:]( self,  "_addAppPropertiesToData:forIdentity:context:actualIdentity:error:",  v12,  v10,  v11,  &v22,  &v21);
  id v17 = v22;
  id v14 = v21;
  objc_autoreleasePoolPop(v13);
  if (v17)
  {
    id v18 = v17;
    *a5 = v18;
    if (v16)
    {
      id v15 = v18;
      goto LABEL_7;
    }
  }

  else if (v16)
  {
    goto LABEL_3;
  }

  if (a6)
  {
    id v14 = v14;
    id v19 = 0LL;
    *a6 = v14;
  }

  else
  {
    id v19 = 0LL;
  }

- (id)_createLaunchdJobWithIdentity:(id)a3 context:(id)a4 actualIdentity:(id *)a5 error:(id *)a6
{
  v125[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  int v11 = [v9 isApplication];
  if (!v10 && v11)
  {
    [MEMORY[0x189612240] contextWithIdentity:v9];
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  if (![v9 isApplication])
  {
    id v19 = 0LL;
    goto LABEL_52;
  }

  if (!v10) {
    -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:].cold.1();
  }
  id v12 = v10;
  uint64_t v13 = [v12 bundleIdentifier];
  rbs_general_log();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  v110 = (void *)v13;
  if (!v13)
  {
    if (v15)
    {
      [v12 identity];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl( &dword_188634000,  v14,  OS_LOG_TYPE_DEFAULT,  "Bailing out of _mutateContextIfNeeded for %{public}@",  buf,  0xCu);
    }

    id v21 = 0LL;
    char v22 = 1;
    goto LABEL_50;
  }

  if (v15)
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl(&dword_188634000, v14, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded called for %{public}@", buf, 0xCu);
  }

  v107 = self;

  [v12 _additionalEnvironment];
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue();

  id v17 = (void *)MEMORY[0x189603FC8];
  v106 = a5;
  if (v16)
  {
    [v12 _additionalEnvironment];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 dictionaryWithDictionary:v18];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  [v12 _overrideExecutablePath];
  id v23 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    int v24 = 0;
  }
  [v12 _additionalMachServices];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v26 = (void *)MEMORY[0x189603FA8];
  if (v25)
  {
    [v12 _additionalMachServices];
    xpc_object_t v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v26 arrayWithArray:v27];
  }

  else
  {
    uint64_t v28 = [MEMORY[0x189603FA8] array];
  }

  [v12 _setAdditionalMachServices:v28];
  int v29 = _os_feature_enabled_impl();
  if (v29) {
    int v29 = _os_feature_enabled_impl();
  }
  v108 = (void *)v28;
  if (((v29 | v24) & 1) == 0) {
    [v12 setPreventContainerization:MEMORY[0x189604A88]];
  }
  if (v23)
  {
    [v12 preventContainerization];
    xpc_object_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = [v30 BOOLValue];

    if (((v31 | v24) & 1) == 0)
    {
      rbs_job_log();
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        [v12 bundleIdentifier];
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v33;
        __int16 v117 = 2114;
        v118 = v23;
        _os_log_impl( &dword_188634000,  v32,  OS_LOG_TYPE_DEFAULT,  "Not pre-containerizing %{public}@ because executable file specified (%{public}@)",  buf,  0x16u);
      }

      [v12 setPreventContainerization:MEMORY[0x189604A88]];
    }
  }

  [v12 requiredCacheUUID];
  v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v35 = [v12 requiredSequenceNumber];
  rbs_general_log();
  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
  v109 = (void *)v35;
  if (v23 && !v34 && !v35)
  {
    if (v37)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188634000, v36, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded No proxy needed", buf, 2u);
    }

    id v21 = 0LL;
    char v22 = 1;
    goto LABEL_49;
  }

  v105 = v14;
  if (v37)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188634000, v36, OS_LOG_TYPE_DEFAULT, "_mutateContextIfNeeded using proxy", buf, 2u);
  }

  [MEMORY[0x189605730] applicationProxyForIdentifier:v13];
  id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v104 = -[os_log_s appState](v36, "appState");
  if (([v104 isInstalled] & 1) == 0)
  {
    __int128 v47 = v34;
    __int128 v48 = (void *)MEMORY[0x189607870];
    uint64_t v49 = *MEMORY[0x189607688];
    v125[0] = *MEMORY[0x1896075E0];
    *(void *)buf = @"Unable to load a valid LSApplicationProxy.";
    [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v125 count:1];
    __int128 v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 errorWithDomain:v49 code:22 userInfo:v50];
    unint64_t v51 = (void *)objc_claimAutoreleasedReturnValue();

    id v21 = v51;
    rbs_general_log();
    __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_188634000,  v44,  OS_LOG_TYPE_DEFAULT,  "_mutateContextIfNeeded unable to load a valid LSApplicationProxy.",  buf,  2u);
    }

    char v22 = 0;
    v34 = v47;
    goto LABEL_47;
  }

  -[os_log_s correspondingApplicationRecord](v36, "correspondingApplicationRecord");
  id v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v38 jobLabel];
  int v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    v68 = -[os_log_s environmentVariables](v36, "environmentVariables");
    -[os_log_s addEntriesFromDictionary:](v14, "addEntriesFromDictionary:", v68);

    [v12 _setAdditionalEnvironment:v14];
    uint64_t v69 = -[os_log_s canonicalExecutablePath](v36, "canonicalExecutablePath");

    if (!v69)
    {
      _posixErrorWithCodeAndDescription(22LL, @"Unable to find executable path");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      rbs_general_log();
      __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188634000,  v44,  OS_LOG_TYPE_DEFAULT,  "_mutateContextIfNeeded unable to find xecutable path.",  buf,  2u);
      }

      id v23 = 0LL;
      char v22 = 0;
      goto LABEL_48;
    }

    id v23 = (void *)v69;
    [v12 _setOverrideExecutablePath:v69];
    if (v34)
    {
      -[os_log_s cacheGUID](v36, "cacheGUID");
      __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      __int128 v44 = 0LL;
    }

    if (v109)
    {
      uint64_t v70 = objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInteger:", -[os_log_s sequenceNumber](v36, "sequenceNumber"));
    }

    else
    {
      uint64_t v70 = 0LL;
    }

    v101 = (void *)v70;
    if (v34 != v44 && (!v34 || !v44 || !-[os_log_s isEqual:](v34, "isEqual:", v44))
      || v109 != (void *)v70 && (!v109 || !v70 || ([v109 isEqual:v70] & 1) == 0))
    {
      rbs_job_log();
      __int128 v92 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
      {
        [v12 bundleIdentifier];
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        -[os_log_s UUIDString](v34, "UUIDString");
        id v96 = v34;
        __int16 v97 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(void *)&uint8_t buf[4] = v95;
        __int16 v117 = 2114;
        v118 = v97;
        __int16 v119 = 2114;
        v120 = v109;
        __int16 v121 = 2114;
        v122 = v44;
        __int16 v123 = 2114;
        v124 = v101;
        _os_log_error_impl( &dword_188634000,  v92,  OS_LOG_TYPE_ERROR,  "LaunchServices database mismatch: Failed to lookup executable path for app %{public}@ with {UUID: %{public}@, Sequence: %{public}@} vs {UUID: %{public}@, Sequence: %{public}@",  buf,  0x34u);

        v34 = v96;
        id v14 = v105;
      }

      _posixErrorWithCodeAndDescription(22LL, @"Failed to lookup executable path.");
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      char v22 = 0;
      goto LABEL_117;
    }

    v71 = v44;
    v103 = v34;
    v72 = -[os_log_s applicationType](v36, "applicationType");
    rbs_general_log();
    v73 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v100 = v72;
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v74 = objc_opt_class();
      v75 = -[os_log_s objectForInfoDictionaryKey:ofClass:valuesOfClass:]( v36,  "objectForInfoDictionaryKey:ofClass:valuesOfClass:",  @"SBMachServices",  v74,  objc_opt_class());
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v100;
      __int16 v117 = 2114;
      v118 = v75;
      _os_log_impl( &dword_188634000,  v73,  OS_LOG_TYPE_DEFAULT,  "_mutateContextIfNeeded bundleType %{public}@ SBMachServices %{public}@",  buf,  0x16u);

      v72 = v100;
    }

    if (([v72 isEqualToString:*MEMORY[0x189605710]] & 1) != 0
      || ([v72 isEqualToString:*MEMORY[0x189605700]] & 1) != 0
      || [v72 isEqualToString:*MEMORY[0x189605708]])
    {
      [v12 setSpawnType:1];
      uint64_t v76 = objc_opt_class();
      v77 = -[os_log_s objectForInfoDictionaryKey:ofClass:valuesOfClass:]( v36,  "objectForInfoDictionaryKey:ofClass:valuesOfClass:",  @"SBMachServices",  v76,  objc_opt_class());
      if ([v77 count]) {
        [v108 addObjectsFromArray:v77];
      }
    }
    v78 = -[os_log_s correspondingApplicationRecord](v36, "correspondingApplicationRecord");
    int v79 = [v78 wasBuiltWithThreadSanitizer];

    if (v79) {
      objc_msgSend(v12, "setExecutionOptions:", objc_msgSend(v12, "executionOptions") | 0x10);
    }
    [v12 _setAdditionalMachServices:v108];
    [v12 preventContainerization];
    xpc_object_t v80 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v80)
    {
      int v81 = -[os_log_s isContainerized](v36, "isContainerized");
      [MEMORY[0x189607968] numberWithBool:v81 ^ 1u];
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 setPreventContainerization:v82];
    }

    [v12 preventContainerization];
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v83 BOOLValue] & 1) == 0)
    {
      [v12 containerIdentifier];
      id v84 = (void *)objc_claimAutoreleasedReturnValue();

      if (v84) {
        goto LABEL_102;
      }
      objc_opt_self();
      id v85 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[os_log_s entitlementValueForKey:ofClass:]( v36,  "entitlementValueForKey:ofClass:",  @"com.apple.private.security.container-required",  v85);
      [v12 setContainerIdentifier:v83];
      [v12 setCalculatedContainerIdentifier:1];
    }

LABEL_102:
    v86 = -[os_log_s managedPersonas](v36, "managedPersonas");
    uint64_t v87 = [v86 count];
    v99 = v86;
    if (v87)
    {
      uint64_t v88 = v87;
      [v86 objectAtIndexedSubscript:0];
      __int128 v89 = (void *)objc_claimAutoreleasedReturnValue();
      rbs_job_log();
      __int128 v90 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v34 = v103;
      if (v88 != 1)
      {
        v98 = v90;
        __int128 v44 = v71;
        if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          id v14 = v105;
          v94 = v100;
          __int128 v93 = v98;
          goto LABEL_116;
        }

        -[RBLaunchdJobManager _createLaunchdJobWithIdentity:context:actualIdentity:error:].cold.2();
        __int128 v93 = v98;
        id v14 = v105;
LABEL_113:
        v94 = v100;
LABEL_116:

        [v12 setManagedPersona:v89];
        id v21 = 0LL;
        char v22 = 1;
LABEL_117:

        goto LABEL_48;
      }

      __int128 v91 = v90;
      __int128 v44 = v71;
      if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v89;
        _os_log_impl( &dword_188634000,  v91,  OS_LOG_TYPE_INFO,  "Persona chosen for bundle identifier: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      rbs_job_log();
      __int128 v91 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v34 = v103;
      if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v110;
        _os_log_impl( &dword_188634000,  v91,  OS_LOG_TYPE_INFO,  "No personas found for bundle identifier: %{public}@",  buf,  0xCu);
      }

      __int128 v89 = 0LL;
    }

    id v14 = v105;
    __int128 v93 = v91;
    goto LABEL_113;
  }

  v102 = v34;
  uint64_t v40 = (void *)MEMORY[0x189607870];
  uint64_t v41 = *MEMORY[0x189607688];
  v125[0] = *MEMORY[0x1896075E0];
  *(void *)buf = @"Trying to launch a daemon, agent, or angel as an app.";
  [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v125 count:1];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 errorWithDomain:v41 code:22 userInfo:v42];
  xpc_object_t v43 = (void *)objc_claimAutoreleasedReturnValue();

  id v21 = v43;
  rbs_general_log();
  __int128 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    -[os_log_s correspondingApplicationRecord](v36, "correspondingApplicationRecord");
    uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 jobLabel];
    unint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v46;
    _os_log_impl( &dword_188634000,  v44,  OS_LOG_TYPE_DEFAULT,  "_mutateContextIfNeeded Trying to launch %{public}@ as an app",  buf,  0xCu);
  }

  char v22 = 0;
  v34 = v102;
LABEL_47:
  id v14 = v105;
LABEL_48:

LABEL_49:
  a5 = v106;
  self = v107;
LABEL_50:

  id v52 = v21;
  id v53 = v52;
  if ((v22 & 1) == 0)
  {
    if (a6)
    {
      id v53 = v52;
      uint64_t v61 = 0LL;
      *a6 = v53;
    }

    else
    {
      uint64_t v61 = 0LL;
    }

    goto LABEL_67;
  }

  id v19 = v52;
LABEL_52:
  objc_msgSend(v10, "_overrideExecutablePath", v98);
  int64_t v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
  {
    id v115 = v19;
    v55 = -[RBLaunchdJobManager _generateDataWithIdentity:context:actualIdentity:error:]( self,  "_generateDataWithIdentity:context:actualIdentity:error:",  v9,  v10,  a5,  &v115);
    id v53 = v115;

    if (v55)
    {
      id v56 = *a5;
      if (!*a5) {
        id v56 = v9;
      }
      id v57 = v56;
      logQueue = self->_logQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __82__RBLaunchdJobManager__createLaunchdJobWithIdentity_context_actualIdentity_error___block_invoke;
      block[3] = &unk_18A255B00;
      id v113 = v57;
      id v59 = v55;
      id v114 = v59;
      id v60 = v57;
      dispatch_async((dispatch_queue_t)logQueue, block);
      -[RBLaunchdInterfacing jobWithPlist:](self->_launchdInterface, "jobWithPlist:", v59);
      uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v61 = 0LL;
      if (a6) {
        *a6 = v53;
      }
    }
  }

  else
  {
    if (a6)
    {
      v62 = (void *)MEMORY[0x189607870];
      uint64_t v63 = *MEMORY[0x189607688];
      v125[0] = *MEMORY[0x1896075E0];
      *(void *)buf = @"Unable to determine executable path.";
      [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v125 count:1];
      BOOL v64 = (void *)objc_claimAutoreleasedReturnValue();
      [v62 errorWithDomain:v63 code:22 userInfo:v64];
      id v65 = (void *)objc_claimAutoreleasedReturnValue();

      id v66 = v65;
      uint64_t v61 = 0LL;
      *a6 = v66;
    }

    else
    {
      uint64_t v61 = 0LL;
    }

    id v53 = v19;
  }

void __82__RBLaunchdJobManager__createLaunchdJobWithIdentity_context_actualIdentity_error___block_invoke( uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  rbs_job_oversize_log();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    _describeXPCObject();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    id v8 = v4;
    _os_log_impl( &dword_188634000,  v2,  OS_LOG_TYPE_DEFAULT,  "'%{public}@' Constructed job description:\n%{public}@",  (uint8_t *)&v5,  0x16u);
  }
}

- (BOOL)_addPersonaFromExtensionContext:(id)a3 toServiceDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!-[RBPersonaManager personaRequiredForExtensionContext:serviceDict:]( self->_personaManager,  "personaRequiredForExtensionContext:serviceDict:",  v6,  v7)) {
    goto LABEL_4;
  }
  LODWORD(value) = -1;
  personaManager = self->_personaManager;
  [v6 identity];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v10 = -[RBPersonaManager personaForIdentity:context:personaUID:personaUniqueString:]( personaManager,  "personaForIdentity:context:personaUID:personaUniqueString:",  v9,  v6,  &value,  0LL);

  if (v10)
  {
    xpc_dictionary_set_int64(v7, "PersonaEnterprise", value);
LABEL_4:
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (void)_addExtensionEnvironmentFromContainerURL:(id)a3 toServiceDict:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = v5;
  id v7 = (const char *)[v10 fileSystemRepresentation];
  xpc_dictionary_get_dictionary(v6, "EnvironmentVariables");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    id v8 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_value(v6, "EnvironmentVariables", v8);
  }

  if (!xpc_dictionary_get_string(v8, "HOME"))
  {
    xpc_dictionary_set_string(v8, "HOME", v7);
    xpc_dictionary_set_string(v8, "CFFIXED_USER_HOME", v7);
    id v9 = [v10 URLByAppendingPathComponent:@"tmp"];
    xpc_dictionary_set_string(v8, "TMPDIR", (const char *)[v9 fileSystemRepresentation]);
  }
}

- (void)_addExtensionContainerURL:(id)a3 toServiceDict:(id)a4
{
  id v5 = a3;
  xpc_object_t xdict = a4;
  xpc_dictionary_set_string(xdict, "_SandboxContainer", (const char *)[v5 fileSystemRepresentation]);
}

- (id)_containerURLForExtensionContext:(id)a3
{
  id v4 = a3;
  bundlePropertiesManager = self->_bundlePropertiesManager;
  [v4 identity];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBBundlePropertiesManaging propertiesForIdentity:identifier:]( bundlePropertiesManager,  "propertiesForIdentity:identifier:",  v6,  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v8 = [v7 containerOverrideIdentifier];
  [v4 identity];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 personaString];
  uint64_t v11 = v10 | v8;

  if (v11) {
    -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:]( self->_containerManager,  "sandboxContainerURLForExtensionContext:containerOverrideIdentifier:",  v4,  v8);
  }
  else {
    [v7 dataContainerURL];
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)_addContainerPropertiesFromExtensionContext:(id)a3 toServiceDict:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[RBContainerManager containerRequiredForServiceDict:]( self->_containerManager,  "containerRequiredForServiceDict:",  v7))
  {
    uint64_t v8 = -[RBContainerManager sandboxContainerURLForExtensionContext:containerOverrideIdentifier:]( self->_containerManager,  "sandboxContainerURLForExtensionContext:containerOverrideIdentifier:",  v6,  0LL);
    if (!v8)
    {
      BOOL v10 = 0;
      goto LABEL_6;
    }

    id v9 = (void *)v8;
    -[RBLaunchdJobManager _addExtensionContainerURL:toServiceDict:]( self,  "_addExtensionContainerURL:toServiceDict:",  v8,  v7);
    -[RBLaunchdJobManager _addExtensionEnvironmentFromContainerURL:toServiceDict:]( self,  "_addExtensionEnvironmentFromContainerURL:toServiceDict:",  v9,  v7);
  }

  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (id)_createAndSubmitExtensionJob:(id)a3 UUID:(id)a4 error:(id *)a5
{
  v62[2] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  [v8 extensionOverlay];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v11 = _CFXPCCreateXPCObjectFromCFObject();
    id v12 = (void *)v11;
    if (!v11 || (uint64_t v13 = MEMORY[0x1895CA750](v11), v14 = MEMORY[0x1895F9250], v13 != MEMORY[0x1895F9250]))
    {
      if (a5)
      {
        BOOL v15 = (void *)MEMORY[0x189607870];
        uint64_t v16 = *MEMORY[0x189607688];
        *(void *)buf = *MEMORY[0x1896075E0];
        v62[0] = @"Unable to launch extension using invalid overlay (not a dictionary)";
        [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:buf count:1];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 errorWithDomain:v16 code:22 userInfo:v17];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();

        id v19 = 0LL;
        *a5 = v18;
      }

      else
      {
        id v19 = 0LL;
      }

      goto LABEL_44;
    }

    uint64_t v24 = xpc_dictionary_get_dictionary(v12, "XPCService");
    uint64_t v25 = (void *)v24;
    if (!v24 || MEMORY[0x1895CA750](v24) != v14)
    {
      if (a5)
      {
        uint64_t v26 = (void *)MEMORY[0x189607870];
        uint64_t v27 = *MEMORY[0x189607688];
        *(void *)buf = *MEMORY[0x1896075E0];
        v62[0] = @"Unable to launch extension using invalid overlay (missing XPCService dict)";
        [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:buf count:1];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v29 = [v26 errorWithDomain:v27 code:22 userInfo:v28];

        xpc_object_t v30 = (void *)v29;
LABEL_13:
        id v19 = 0LL;
        *a5 = v30;
LABEL_43:

LABEL_44:
        goto LABEL_45;
      }

void __63__RBLaunchdJobManager__createAndSubmitExtensionJob_UUID_error___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  rbs_job_oversize_log();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = [*(id *)(a1 + 40) hostPid];
    uint64_t v5 = *(void *)(a1 + 48);
    _describeXPCObject();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138544130;
    uint64_t v8 = v3;
    __int16 v9 = 1024;
    int v10 = v4;
    __int16 v11 = 2114;
    uint64_t v12 = v5;
    __int16 v13 = 2114;
    uint64_t v14 = v6;
    _os_log_impl( &dword_188634000,  v2,  OS_LOG_TYPE_DEFAULT,  "'%{public}@' Submitting extension overlay (host PID %d, path %{public}@):\n%{public}@",  (uint8_t *)&v7,  0x26u);
  }
}

- (id)createAndLaunchWithIdentity:(id)a3 context:(id)a4 error:(id *)a5
{
  v115[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  rbs_job_log();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl(&dword_188634000, v10, OS_LOG_TYPE_DEFAULT, "Creating and launching job for: %{public}@", buf, 0xCu);
  }

  int v11 = [v8 hasConsistentLaunchdJob];
  if (v11)
  {
    [v8 consistentLaunchdJobLabel];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      launchdInterface = self->_launchdInterface;
      [MEMORY[0x18960CE88] currentDomain];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = (os_log_s *)-[RBLaunchdInterfacing copyJobWithLabel:domain:]( launchdInterface,  "copyJobWithLabel:domain:",  v12,  v14);

      if (v15)
      {
        uint64_t v16 = self->_launchdInterface;
        id v93 = 0LL;
        -[RBLaunchdInterfacing propertiesForJob:error:](v16, "propertiesForJob:error:", v15, &v93);
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v93;
        if (!v17)
        {
          rbs_process_log();
          id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.7();
          }
          goto LABEL_30;
        }

        if ([v8 osServiceType] == 3 && objc_msgSend(v17, "serviceType") != 3)
        {
          rbs_process_log();
          uint64_t v76 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.9();
          }

          v82 = (void *)MEMORY[0x189607870];
          uint64_t v80 = *MEMORY[0x1896124C0];
          uint64_t v111 = *MEMORY[0x1896075E0];
          [NSString stringWithFormat:@"Launchd could not find angel job"];
          id v85 = (void *)objc_claimAutoreleasedReturnValue();
          v112 = v85;
          v20 = (void *)MEMORY[0x189603F68];
          uint64_t v21 = &v112;
          char v22 = &v111;
        }

        else
        {
          rbs_process_log();
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.8();
          }

          v82 = (void *)MEMORY[0x189607870];
          uint64_t v80 = *MEMORY[0x1896124C0];
          uint64_t v109 = *MEMORY[0x1896075E0];
          [NSString stringWithFormat:@"Launchd found an angel job for requested daemon launch"];
          id v85 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = v85;
          v20 = (void *)MEMORY[0x189603F68];
          uint64_t v21 = &v110;
          char v22 = &v109;
        }

        [v20 dictionaryWithObjects:v21 forKeys:v22 count:1];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v84 = [v82 errorWithDomain:v80 code:4 userInfo:v77];

        id v32 = v15;
        id v18 = (id)v84;
LABEL_29:
        uint64_t v15 = 0LL;
LABEL_30:

        goto LABEL_31;
      }

      id v36 = (void *)MEMORY[0x189607870];
      uint64_t v37 = *MEMORY[0x1896124C0];
      uint64_t v113 = *MEMORY[0x1896075E0];
      [NSString stringWithFormat:@"Launchd could not find job"];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      id v114 = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v33 = v36;
      uint64_t v34 = v37;
      uint64_t v35 = 4LL;
    }

    else
    {
      xpc_object_t v30 = (void *)MEMORY[0x189607870];
      uint64_t v31 = *MEMORY[0x1896124C0];
      uint64_t v107 = *MEMORY[0x1896075E0];
      [NSString stringWithFormat:@"Identity doesn't have required label"];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v33 = v30;
      uint64_t v34 = v31;
      uint64_t v35 = 3LL;
    }

    [v33 errorWithDomain:v34 code:v35 userInfo:v32];
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_29;
  }

  if ([v8 isExtension])
  {
    [v8 uuid];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    id v92 = 0LL;
    -[RBLaunchdJobManager _createAndSubmitExtensionJob:UUID:error:]( self,  "_createAndSubmitExtensionJob:UUID:error:",  v9,  v23,  &v92);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v18 = v92;

    rbs_general_log();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO)) {
      goto LABEL_32;
    }
    -[os_log_s handle](v15, "handle");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v17;
    _os_log_impl(&dword_188634000, v12, OS_LOG_TYPE_INFO, "submitted extension job %{public}@", buf, 0xCu);
LABEL_31:

LABEL_32:
    if (v15)
    {
      id v86 = v9;
      int v29 = v11 ^ 1;
      id v88 = v18;
      uint64_t v27 = &v88;
      -[os_log_s start:](v15, "start:", &v88);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_34:
      id v38 = *v27;

      if (v28)
      {
        if ([v28 state] == 2)
        {
          v83 = self;
          int v39 = a5;
          int v40 = v29;
          rbs_general_log();
          id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.5(v28);
          }

          id v42 = (void *)MEMORY[0x189607870];
          uint64_t v43 = *MEMORY[0x1896124C0];
          uint64_t v94 = *MEMORY[0x1896075E0];
          uint64_t v44 = [NSString stringWithFormat:@"Launchd job spawn failed for unknown reason"];
          uint64_t v95 = v44;
          uint64_t v45 = (void *)MEMORY[0x189603F68];
          id v46 = &v95;
          __int128 v47 = &v94;
        }

        else
        {
          v83 = self;
          int v39 = a5;
          int v40 = v29;
          switch([v28 state])
          {
            case 1LL:
              goto LABEL_58;
            case 2LL:
              abort();
            case 3LL:
              uint64_t v55 = (int)[v28 lastSpawnError];
              id v56 = (void *)MEMORY[0x189607870];
              uint64_t v57 = *MEMORY[0x189607688];
              v115[0] = *MEMORY[0x1896075E0];
              *(void *)buf = @"Launchd job spawn failed";
              [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v115 count:1];
              id v58 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v54 = [v56 errorWithDomain:v57 code:v55 userInfo:v58];

              goto LABEL_61;
            case 4LL:
              int v79 = (void *)MEMORY[0x189607870];
              uint64_t v78 = *MEMORY[0x1896124C0];
              uint64_t v98 = *MEMORY[0x1896075E0];
              id v65 = (void *)NSString;
              [v28 lastExitStatus];
              int v81 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v66 = objc_msgSend(v81, "os_reason_namespace");
              [v28 lastExitStatus];
              id v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend( v65,  "stringWithFormat:",  @"Launchd job spawn immediately exited with namespace %d code %lld",  v66,  objc_msgSend(v67, "os_reason_code"));
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v68;
              [MEMORY[0x189603F68] dictionaryWithObjects:&v99 forKeys:&v98 count:1];
              uint64_t v69 = (void *)objc_claimAutoreleasedReturnValue();
              uint64_t v54 = [v79 errorWithDomain:v78 code:0 userInfo:v69];

              id v38 = v81;
              goto LABEL_61;
            default:
              rbs_general_log();
              uint64_t v63 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
                -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.6(v28);
              }
              int v40 = v29;

LABEL_58:
              id v42 = (void *)MEMORY[0x189607870];
              uint64_t v43 = *MEMORY[0x1896124C0];
              uint64_t v96 = *MEMORY[0x1896075E0];
              uint64_t v44 = [NSString stringWithFormat:@"Launchd job spawn failed for unknown reason"];
              uint64_t v97 = v44;
              uint64_t v45 = (void *)MEMORY[0x189603F68];
              id v46 = &v97;
              __int128 v47 = &v96;
              break;
          }
        }

        [v45 dictionaryWithObjects:v46 forKeys:v47 count:1];
        BOOL v64 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v54 = [v42 errorWithDomain:v43 code:0 userInfo:v64];

        id v38 = (id)v44;
      }

      else
      {
        if (v38) {
          goto LABEL_63;
        }
        v83 = self;
        int v39 = a5;
        int v40 = v29;
        rbs_general_log();
        __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          -[RBLaunchdJobManager createAndLaunchWithIdentity:context:error:].cold.4(v50);
        }

        id v51 = (void *)MEMORY[0x189607870];
        uint64_t v52 = *MEMORY[0x1896124C0];
        uint64_t v100 = *MEMORY[0x1896075E0];
        [NSString stringWithFormat:@"Launchd job spawn failed for unknown reason"];
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        id v101 = v38;
        [MEMORY[0x189603F68] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
        id v53 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v54 = [v51 errorWithDomain:v52 code:0 userInfo:v53];
      }

- (BOOL)_isRunningBoardLaunched:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  launchdInterface = self->_launchdInterface;
  id v15 = 0LL;
  -[RBLaunchdInterfacing propertiesForJob:error:](launchdInterface, "propertiesForJob:error:", a3, &v15);
  int v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = v15;
  if (v4)
  {
    uint64_t v6 = [v4 additionalProperties];
    int v7 = (void *)v6;
    if (v6 && (v8 = MEMORY[0x1895CA750](v6), uint64_t v9 = MEMORY[0x1895F9250], v8 == MEMORY[0x1895F9250]))
    {
      uint64_t v12 = xpc_dictionary_get_value(v7, "RunningBoard");
      int v10 = (void *)v12;
      if (v12 && MEMORY[0x1895CA750](v12) == v9)
      {
        BOOL v11 = xpc_dictionary_get_BOOL(v10, "RunningBoardLaunched");
        goto LABEL_15;
      }

      rbs_general_log();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_188634000, v13, OS_LOG_TYPE_INFO, "_isRunningBoardLaunched has no RBProperties", buf, 2u);
      }
    }

    else
    {
      rbs_general_log();
      int v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_188634000,  (os_log_t)v10,  OS_LOG_TYPE_INFO,  "_isRunningBoardLaunched has no additionalProperties",  buf,  2u);
      }
    }

    BOOL v11 = 0;
LABEL_15:

    goto LABEL_16;
  }

  rbs_general_log();
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v5;
    _os_log_impl( &dword_188634000,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "propertiesForJob failed for _isRunningBoardLaunched %{public}@",  buf,  0xCu);
  }

  BOOL v11 = 1;
LABEL_16:

  return v11;
}

- (BOOL)_removeJobWithInstance:(id)a3 orJob:(id)a4 error:(id *)a5
{
  v45[1] = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v42 = (void *)objc_claimAutoreleasedReturnValue();
    [v42 handleFailureInMethod:a2, self, @"RBLaunchdJobManager.m", 1166, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];
  }

  rbs_job_log();
  BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_188634000, v11, OS_LOG_TYPE_INFO, "Cleaning out %{public}@ from job manager", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (v10)
  {
LABEL_9:
    os_unfair_lock_unlock(&self->_lock);
    [v9 identity];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v20 isApplication] & 1) == 0 && !objc_msgSend(v20, "isDext"))
    {
      BOOL v26 = 1;
LABEL_32:

      goto LABEL_33;
    }

    if (([v20 isXPCService] & 1) != 0
      || -[RBLaunchdJobManager _isRunningBoardLaunched:](self, "_isRunningBoardLaunched:", v10))
    {
      rbs_job_log();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v9;
        _os_log_impl(&dword_188634000, v21, OS_LOG_TYPE_DEFAULT, "Removing launch job for: %{public}@", buf, 0xCu);
      }

      id v43 = 0LL;
      char v22 = [v10 remove:&v43];
      id v23 = v43;
      id v24 = v23;
      if ((v22 & 1) != 0 || [v23 code] == 36)
      {
        rbs_job_log();
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v9;
          _os_log_impl(&dword_188634000, v25, OS_LOG_TYPE_DEFAULT, "Removed job for %{public}@", buf, 0xCu);
        }

        BOOL v26 = 1;
        goto LABEL_30;
      }

      rbs_general_log();
      v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:].cold.1();
      }

      if (a5)
      {
        [NSString stringWithFormat:@"Unable to delete job with label %@", v9];
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = [v24 code];
        id v36 = (void *)MEMORY[0x189607870];
        uint64_t v37 = *MEMORY[0x189607688];
        v45[0] = *MEMORY[0x1896075E0];
        *(void *)buf = v34;
        id v38 = (void *)MEMORY[0x189603F68];
        uint64_t v25 = v34;
        [v38 dictionaryWithObjects:buf forKeys:v45 count:1];
        int v39 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 errorWithDomain:v37 code:v35 userInfo:v39];
        int v40 = (void *)objc_claimAutoreleasedReturnValue();

        id v32 = v40;
        goto LABEL_29;
      }
    }

    else
    {
      rbs_general_log();
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:].cold.2();
      }

      if (a5)
      {
        [NSString stringWithFormat:@"Unable to delete job not submitted by RunningBoard"];
        uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = (void *)MEMORY[0x189607870];
        uint64_t v29 = *MEMORY[0x189607688];
        v45[0] = *MEMORY[0x1896075E0];
        *(void *)buf = v25;
        [MEMORY[0x189603F68] dictionaryWithObjects:buf forKeys:v45 count:1];
        xpc_object_t v30 = (void *)objc_claimAutoreleasedReturnValue();
        [v28 errorWithDomain:v29 code:-1 userInfo:v30];
        uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

        id v32 = v31;
        id v24 = 0LL;
LABEL_29:
        BOOL v26 = 0;
        *a5 = v32;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }

      id v24 = 0LL;
    }

    BOOL v26 = 0;
    goto LABEL_31;
  }

  lock_monitoredJobsByIdentifier = self->_lock_monitoredJobsByIdentifier;
  [v9 identifier];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](lock_monitoredJobsByIdentifier, "objectForKey:", v13);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10
    || (uint64_t v14 = self->_lock_jobsByIdentifier,
        [v9 identifier],
        id v15 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKey:](v14, "objectForKey:", v15),
        id v10 = (id)objc_claimAutoreleasedReturnValue(),
        v15,
        v10))
  {
    lock_jobsByIdentifier = self->_lock_jobsByIdentifier;
    [v9 identifier];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](lock_jobsByIdentifier, "removeObjectForKey:", v17);

    uint64_t v18 = self->_lock_monitoredJobsByIdentifier;
    [v9 identifier];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v18, "removeObjectForKey:", v19);

    goto LABEL_9;
  }

  os_unfair_lock_unlock(&self->_lock);
  rbs_general_log();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl( &dword_188634000,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "removeJobWithInstance called for identity without existing job %{public}@",  buf,  0xCu);
  }

  BOOL v26 = 1;
LABEL_33:

  return v26;
}

- (BOOL)removeJobWithInstance:(id)a3 error:(id *)a4
{
  return -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:]( self,  "_removeJobWithInstance:orJob:error:",  a3,  0LL,  a4);
}

- (id)synchronizeJobs
{
  uint64_t v60 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603FA8] array];
  id v29 = (id)objc_claimAutoreleasedReturnValue();
  launchdInterface = self->_launchdInterface;
  id v52 = 0LL;
  uint64_t v27 = (void *)-[RBLaunchdInterfacing copyJobsManagedBy:error:]( launchdInterface,  "copyJobsManagedBy:error:",  @"com.apple.runningboard",  &v52);
  id v3 = v52;
  if (v27)
  {
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    obuint64_t j = v27;
    uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v4)
    {
      os_unfair_lock_t lock = &self->_lock;
      uint64_t v34 = *(void *)v49;
      do
      {
        uint64_t v5 = 0LL;
        uint64_t v6 = v3;
        do
        {
          if (*(void *)v49 != v34) {
            objc_enumerationMutation(obj);
          }
          int v7 = *(void **)(*((void *)&v48 + 1) + 8 * v5);
          uint64_t v44 = 0LL;
          uint64_t v45 = &v44;
          uint64_t v46 = 0x2020000000LL;
          int v47 = 0;
          if (_synchronizeJobsQueue_onceToken != -1) {
            dispatch_once(&_synchronizeJobsQueue_onceToken, &__block_literal_global_6);
          }
          id v8 = (id)_synchronizeJobsQueue_queue;
          v43[0] = MEMORY[0x1895F87A8];
          v43[1] = 3221225472LL;
          v43[2] = __38__RBLaunchdJobManager_synchronizeJobs__block_invoke;
          v43[3] = &unk_18A256200;
          v43[4] = v7;
          v43[5] = &v44;
          [v7 monitorOnQueue:v8 withHandler:v43];

          [v7 cancelMonitor];
          id v9 = self->_launchdInterface;
          id v42 = 0LL;
          -[RBLaunchdInterfacing propertiesForJob:error:](v9, "propertiesForJob:error:", v7, &v42);
          id v10 = (void *)objc_claimAutoreleasedReturnValue();
          id v3 = v42;

          if (v10)
          {
            uint64_t v11 = [v10 additionalProperties];
            uint64_t v12 = (void *)v11;
            if (v11 && MEMORY[0x1895CA750](v11) == MEMORY[0x1895F9250])
            {
              uint64_t v14 = xpc_dictionary_get_value(v12, "RunningBoard");
              __int16 v13 = (void *)v14;
              if (v14 && MEMORY[0x1895CA750](v14) == MEMORY[0x1895F9250])
              {
                xpc_dictionary_get_value(v13, "RunningBoardLaunchedIdentity");
                id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (v15)
                {
                  id v16 = objc_alloc(MEMORY[0x1896122E0]);
                  uint64_t v17 = *((unsigned int *)v45 + 6);
                  if (!(_DWORD)v17) {
                    uint64_t v17 = getpid();
                  }
                  uint64_t v31 = [v16 initWithPid:v17];
                  uint64_t v18 = (void *)MEMORY[0x1896122E8];
                  [v10 instance];
                  id v19 = (void *)objc_claimAutoreleasedReturnValue();
                  [v18 decodeFromJob:v15 uuid:v19];
                  id v32 = (void *)objc_claimAutoreleasedReturnValue();

                  v20 = (os_log_s *)v31;
                  if (v32)
                  {
                    objc_msgSend(MEMORY[0x189612300], "instanceWithIdentifier:identity:", v31);
                    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (*((_DWORD *)v45 + 6))
                    {
                      [v29 addObject:v21];
                      os_unfair_lock_lock(lock);
                      -[NSMutableDictionary setObject:forKey:]( self->_lock_jobsByIdentifier,  "setObject:forKey:",  v7,  v31);
                      os_unfair_lock_unlock(lock);
                    }

                    else
                    {
                      rbs_general_log();
                      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                      {
                        [v7 handle];
                        id v23 = (void *)objc_claimAutoreleasedReturnValue();
                        -[RBLaunchdJobManager synchronizeJobs].cold.6(v23, v53, &v54, v28);
                      }

                      -[RBLaunchdJobManager _removeJobWithInstance:orJob:error:]( self,  "_removeJobWithInstance:orJob:error:",  v21,  v7,  0LL);
                    }
                  }

                  else
                  {
                    rbs_general_log();
                    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      [v7 handle];
                      char v22 = (void *)objc_claimAutoreleasedReturnValue();
                      -[RBLaunchdJobManager synchronizeJobs].cold.5(v22, v55, &v56, v21);
                    }
                  }
                }

                else
                {
                  rbs_general_log();
                  v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
                    -[RBLaunchdJobManager synchronizeJobs].cold.4(&v36, v37);
                  }
                }
              }

              else
              {
                rbs_general_log();
                id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
                  -[RBLaunchdJobManager synchronizeJobs].cold.3(&v38, v39);
                }
              }
            }

            else
            {
              rbs_general_log();
              __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_FAULT)) {
                -[RBLaunchdJobManager synchronizeJobs].cold.2(&v40, v41);
              }
            }
          }

          else
          {
            rbs_general_log();
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138543362;
              id v58 = v3;
              _os_log_fault_impl( &dword_188634000,  (os_log_t)v12,  OS_LOG_TYPE_FAULT,  "propertiesForPid failed for job %{public}@",  buf,  0xCu);
            }
          }

          _Block_object_dispose(&v44, 8);
          ++v5;
          uint64_t v6 = v3;
        }

        while (v4 != v5);
        uint64_t v4 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }

      while (v4);
    }

    id v24 = (os_log_s *)obj;
  }

  else
  {
    rbs_general_log();
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v24 = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      -[RBLaunchdJobManager synchronizeJobs].cold.1();
      id v24 = v25;
    }
  }

  return v29;
}

void __38__RBLaunchdJobManager_synchronizeJobs__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [a2 pid];
  }

  else
  {
    rbs_general_log();
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __38__RBLaunchdJobManager_synchronizeJobs__block_invoke_cold_1(a1);
    }
  }

- (void)invokeOnProcessDeath:(id)a3 handler:(id)a4 onQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_lock(&self->_lock);
  [v8 identifier];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_lock_monitoredJobsByIdentifier, "objectForKey:", v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    rbs_process_log();
    __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchdJobManager invokeOnProcessDeath:handler:onQueue:].cold.1(v8, v13);
    }
  }

  uint64_t v14 = -[NSMutableDictionary objectForKey:](self->_lock_jobsByIdentifier, "objectForKey:", v11);
  if (!v14)
  {
    if ((int)[v11 pid] <= 0)
    {
      os_unfair_lock_unlock(&self->_lock);
    }

    else
    {
      id v15 = (void *)-[RBLaunchdInterfacing copyJobWithPid:]( self->_launchdInterface,  "copyJobWithPid:",  [v11 pid]);
      os_unfair_lock_unlock(&self->_lock);
      if (v15) {
        goto LABEL_7;
      }
    }

    [v8 invokeHandlerOnProcessDeath:v9 onQueue:v10];
    goto LABEL_13;
  }

  id v15 = (void *)v14;
  -[NSMutableDictionary setObject:forKey:](self->_lock_monitoredJobsByIdentifier, "setObject:forKey:", v14, v11);
  -[NSMutableDictionary removeObjectForKey:](self->_lock_jobsByIdentifier, "removeObjectForKey:", v11);
  os_unfair_lock_unlock(&self->_lock);
LABEL_7:
  uint64_t v16 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke;
  v25[3] = &unk_18A256228;
  id v26 = v8;
  id v29 = v9;
  id v17 = v15;
  id v27 = v17;
  uint64_t v28 = self;
  uint64_t v18 = (void *)MEMORY[0x1895CA0E4](v25);
  block[0] = v16;
  block[1] = 3221225472LL;
  block[2] = __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_119;
  block[3] = &unk_18A255F90;
  id v22 = v17;
  id v23 = (dispatch_queue_s *)v10;
  id v24 = v18;
  id v19 = v18;
  id v20 = v17;
  dispatch_async(v23, block);

LABEL_13:
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke( uint64_t a1,  void *a2,  int a3)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  uint64_t v6 = v5;
  if (v5)
  {
    if ([v5 pid])
    {
      int v7 = [v6 pid];
      id v8 = (id *)(a1 + 32);
      if (v7 != objc_msgSend(*(id *)(a1 + 32), "rbs_pid"))
      {
        [*v8 identity];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        int v10 = [v9 isApplication];

        rbs_general_log();
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
            __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_4( (uint64_t *)(a1 + 32),  v6,  v12);
          }
        }

        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = *v8;
          int v35 = 138543618;
          id v36 = v22;
          __int16 v37 = 1024;
          int v38 = [v6 pid];
          _os_log_impl( &dword_188634000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ reported with incorrect pid %d",  (uint8_t *)&v35,  0x12u);
        }
      }
    }

    uint64_t v14 = 0LL;
    switch([v6 state])
    {
      case 1LL:
        rbs_general_log();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = *(void **)(a1 + 32);
          int v35 = 138543362;
          id v36 = v23;
          id v24 = "%{public}@ reported to RB as never ran";
          goto LABEL_21;
        }

        break;
      case 2LL:
        rbs_general_log();
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = *(void **)(a1 + 32);
          int v35 = 138543362;
          id v36 = v25;
          id v24 = "%{public}@ reported to RB as running";
LABEL_21:
          _os_log_impl(&dword_188634000, v14, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v35, 0xCu);
        }

        break;
      case 3LL:
        goto LABEL_26;
      case 4LL:
        [v6 lastExitStatus];
        uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          rbs_general_log();
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_3( a1,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
          }

          uint64_t v14 = 0LL;
        }

uint64_t __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_119(uint64_t a1)
{
  return [*(id *)(a1 + 32) monitorOnQueue:*(void *)(a1 + 40) withHandler:*(void *)(a1 + 48)];
}

- (unint64_t)test_trackedJobCount
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = -[NSMutableDictionary count](self->_lock_monitoredJobsByIdentifier, "count");
  unint64_t v5 = -[NSMutableDictionary count](self->_lock_jobsByIdentifier, "count") + v4;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (void).cxx_destruct
{
}

+ (void)lastExitStatusForLabel:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl( &dword_188634000,  v1,  OS_LOG_TYPE_ERROR,  "Unexpected exit reason from launchd %{public}@: %llu",  v2,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addSharedPropertiesToData:(void *)a1 forIdentity:(os_log_s *)a2 context:.cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 identity];
  __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_188634000, a2, v4, "During job creation, executable path NULL for %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_addAppPropertiesToData:forIdentity:context:actualIdentity:error:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_13(&dword_188634000, v1, (uint64_t)v1, "'%{public}@' container path lookup failed: %{public}@", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addAppPropertiesToData:(int)a1 forIdentity:(os_log_s *)a2 context:actualIdentity:error:.cold.2( int a1,  os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_188634000, a2, OS_LOG_TYPE_FAULT, "Unrecognized RBSLaunchSpawnType %d", (uint8_t *)v2, 8u);
}

- (void)_createLaunchdJobWithIdentity:context:actualIdentity:error:.cold.1()
{
}

- (void)_createLaunchdJobWithIdentity:context:actualIdentity:error:.cold.2()
{
}

- (void)createAndLaunchWithIdentity:context:error:.cold.1()
{
}

- (void)createAndLaunchWithIdentity:context:error:.cold.2()
{
}

- (void)createAndLaunchWithIdentity:context:error:.cold.3()
{
}

- (void)createAndLaunchWithIdentity:(os_log_t)log context:error:.cold.4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Process start failed to return either error or jobInfo",  v1,  2u);
}

- (void)createAndLaunchWithIdentity:(void *)a1 context:error:.cold.5(void *a1)
{
}

- (void)createAndLaunchWithIdentity:(void *)a1 context:error:.cold.6(void *a1)
{
}

- (void)createAndLaunchWithIdentity:context:error:.cold.7()
{
}

- (void)createAndLaunchWithIdentity:context:error:.cold.8()
{
}

- (void)createAndLaunchWithIdentity:context:error:.cold.9()
{
}

- (void)_removeJobWithInstance:orJob:error:.cold.1()
{
}

- (void)_removeJobWithInstance:orJob:error:.cold.2()
{
}

- (void)synchronizeJobs
{
  *(_DWORD *)a2 = 138543362;
  *a3 = a1;
  OUTLINED_FUNCTION_0_3( &dword_188634000,  a4,  (uint64_t)a3,  "Skipping recovery for already exited process %{public}@",  a2);
}

void __38__RBLaunchdJobManager_synchronizeJobs__block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);

  OUTLINED_FUNCTION_8();
}

- (void)invokeOnProcessDeath:(void *)a1 handler:(os_log_s *)a2 onQueue:.cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 description];
  os_log_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_0(&dword_188634000, a2, v4, "%{public}@ had monitoring configured twice", v5);

  OUTLINED_FUNCTION_1();
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_2( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void *)(a1 + 32);
  int v6 = 138543618;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = [a2 state];
  OUTLINED_FUNCTION_13(&dword_188634000, a3, v5, "%{public}@ reported to RB in an invalid state %ld", (uint8_t *)&v6);
  OUTLINED_FUNCTION_1();
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_3( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __60__RBLaunchdJobManager_invokeOnProcessDeath_handler_onQueue___block_invoke_cold_4( uint64_t *a1,  void *a2,  os_log_s *a3)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *a1;
  int v5 = 138543618;
  uint64_t v6 = v4;
  __int16 v7 = 1024;
  int v8 = [a2 pid];
  _os_log_fault_impl( &dword_188634000,  a3,  OS_LOG_TYPE_FAULT,  "%{public}@ reported with incorrect pid %d",  (uint8_t *)&v5,  0x12u);
  OUTLINED_FUNCTION_1();
}

@end