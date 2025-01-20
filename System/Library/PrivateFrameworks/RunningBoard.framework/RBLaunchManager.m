@interface RBLaunchManager
- (BOOL)_checkLaunchForBackoff:(id)a3 error:(id *)a4;
- (RBLaunchManager)init;
- (RBLaunchManager)initWithJobManager:(id)a3 timeProvider:(id)a4 delegate:(id)a5;
- (id)_resolveNewProcessForInstance:(id)a3 requestIdentity:(id)a4 context:(id)a5 withError:(id *)a6;
- (id)executeLaunchRequest:(id)a3 existingProcess:(id)a4 requestIdentity:(id)a5 withError:(id *)a6;
- (void)_validateBundleIDForProcess:(id)a3 launchedWithContext:(id)a4;
@end

@implementation RBLaunchManager

- (RBLaunchManager)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBLaunchManager.m" lineNumber:114 description:@"-init is not allowed on RBProcessManager"];

  return 0LL;
}

- (RBLaunchManager)initWithJobManager:(id)a3 timeProvider:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___RBLaunchManager;
  v12 = -[RBLaunchManager init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_jobManager, a3);
    objc_storeWeak((id *)&v13->_delegate, v11);
    v14 = -[RBLaunchTracker initWithTimeProvider:]( objc_alloc(&OBJC_CLASS___RBLaunchTracker),  "initWithTimeProvider:",  v10);
    launchTracker = v13->_launchTracker;
    v13->_launchTracker = v14;

    v16 = v13;
  }

  return v13;
}

- (void)_validateBundleIDForProcess:(id)a3 launchedWithContext:(id)a4
{
  id v5 = a3;
  [a4 bundleIdentifier];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 bundleProperties];
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 bundleIdentifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8 && ([v8 isEqualToString:v6] & 1) == 0)
  {
    rbs_process_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchManager _validateBundleIDForProcess:launchedWithContext:].cold.1();
    }
  }
}

- (BOOL)_checkLaunchForBackoff:(id)a3 error:(id *)a4
{
  id v6 = a3;
  -[RBLaunchTracker nextAllowedLaunchOfIdentity:](self->_launchTracker, "nextAllowedLaunchOfIdentity:", v6);
  double v8 = v7;
  if (v7 != 0.0)
  {
    rbs_general_log();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchManager _checkLaunchForBackoff:error:].cold.1((uint64_t)v6, v9, v8);
    }

    if (a4)
    {
      uint64_t v10 = *MEMORY[0x1896124B0];
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke;
      v14[3] = &__block_descriptor_40_e29_v16__0__NSMutableDictionary_8l;
      *(double *)&v14[4] = v8;
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 setObject:@"Launch Request throttled." forKey:*MEMORY[0x1896075F0]];
      __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke((uint64_t)v14, v11);
      [MEMORY[0x189607870] errorWithDomain:v10 code:6 userInfo:v11];
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      *a4 = v12;
    }
  }

  return v8 == 0.0;
}

void __48__RBLaunchManager__checkLaunchForBackoff_error___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x189607968];
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v2 numberWithDouble:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKey:*MEMORY[0x1896124D0]];
}

- (id)_resolveNewProcessForInstance:(id)a3 requestIdentity:(id)a4 context:(id)a5 withError:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  [v10 identifier];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = +[RBLaunchdProperties propertiesForPid:]( RBLaunchdProperties,  "propertiesForPid:",  [v13 pid]);
  if (!v14)
  {
    rbs_general_log();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:].cold.2();
    }
  }

  if ([v14 hasBackoff])
  {
    launchTracker = self->_launchTracker;
    [v10 identity];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBLaunchTracker trackLaunchOfIdentity:](launchTracker, "trackLaunchOfIdentity:", v17);
  }

  if ([v11 osServiceType] == 3 && v14 && (objc_msgSend(v14, "isAngel") & 1) == 0)
  {
    rbs_general_log();
    v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[RBLaunchManager _resolveNewProcessForInstance:requestIdentity:context:withError:].cold.1();
    }

    -[RBLaunchdJobManager removeJobWithInstance:error:](self->_jobManager, "removeJobWithInstance:error:", v10, 0LL);
    if (a6)
    {
      uint64_t v27 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 setObject:@"Unsupported Angel launch request." forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v27 code:5 userInfo:v28];
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0LL;
      *a6 = v29;
    }

    else
    {
      v19 = 0LL;
    }
  }

  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "_lifecycleQueue_addProcessWithInstance:properties:", v10, v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[RBLaunchManager _validateBundleIDForProcess:launchedWithContext:]( self,  "_validateBundleIDForProcess:launchedWithContext:",  v19,  v12);
      id v20 = v19;
    }

    else
    {
      rbs_general_log();
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v30 = 138543362;
        id v31 = v10;
        _os_log_impl( &dword_188634000,  v21,  OS_LOG_TYPE_DEFAULT,  "Failed to create process object for %{public}@",  (uint8_t *)&v30,  0xCu);
      }

      -[RBLaunchdJobManager removeJobWithInstance:error:](self->_jobManager, "removeJobWithInstance:error:", v10, 0LL);
      if (a6)
      {
        uint64_t v22 = *MEMORY[0x1896124B0];
        [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 setObject:@"Launched process exited during launch." forKey:*MEMORY[0x1896075F0]];
        [MEMORY[0x189607870] errorWithDomain:v22 code:5 userInfo:v23];
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        *a6 = v24;
      }
    }
  }

  return v19;
}

- (id)executeLaunchRequest:(id)a3 existingProcess:(id)a4 requestIdentity:(id)a5 withError:(id *)a6
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = [v12 isExtension];
  if (v11 && (v13 & 1) == 0)
  {
    rbs_process_log();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      id v48 = v12;
      __int16 v49 = 2114;
      id v50 = v11;
      _os_log_impl(&dword_188634000, v14, OS_LOG_TYPE_INFO, "%{public}@ is already running as %{public}@", buf, 0x16u);
    }

    if (a6)
    {
      uint64_t v15 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 setObject:@"The process was already running." forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v15 code:2 userInfo:v16];
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      *a6 = v17;
    }

    id v18 = v11;
    goto LABEL_38;
  }

  id v19 = v12;
  if (([v19 isEmbeddedApplication] & 1) != 0
    || ([v19 hasConsistentLaunchdJob] & 1) != 0
    || [v19 isExtension])
  {
  }

  else
  {
    char v37 = [v19 isDext];

    if ((v37 & 1) == 0)
    {
      rbs_process_log();
      v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v19;
        _os_log_impl(&dword_188634000, v38, OS_LOG_TYPE_INFO, "%{public}@ could not be launched", buf, 0xCu);
      }

      if (a6)
      {
        uint64_t v39 = *MEMORY[0x1896124B0];
        [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend( v40,  "setObject:forKey:",  @"Launch prevented due to invalid parameters; only apps, extensions or daemons can be launched by RunningBoard",
          *MEMORY[0x1896075F0]);
        [MEMORY[0x189607870] errorWithDomain:v39 code:1 userInfo:v40];
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        id v18 = 0LL;
        *a6 = v41;
        goto LABEL_38;
      }

- (void).cxx_destruct
{
}

- (void)_validateBundleIDForProcess:launchedWithContext:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_fault_impl( &dword_188634000,  v1,  OS_LOG_TYPE_FAULT,  "RunningBoard launch requested for identifier %{public}@ launched process with different identifier %{public}@",  v2,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_checkLaunchForBackoff:(double)a3 error:.cold.1(uint64_t a1, os_log_s *a2, double a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl( &dword_188634000,  a2,  OS_LOG_TYPE_ERROR,  "Launch throttled for %{public}@ until %lf",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_resolveNewProcessForInstance:requestIdentity:context:withError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl( &dword_188634000,  v0,  OS_LOG_TYPE_FAULT,  "Angel launch attempted for non-angel %{public}@",  v1,  0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)_resolveNewProcessForInstance:requestIdentity:context:withError:.cold.2()
{
}

- (void)executeLaunchRequest:existingProcess:requestIdentity:withError:.cold.1()
{
}

@end