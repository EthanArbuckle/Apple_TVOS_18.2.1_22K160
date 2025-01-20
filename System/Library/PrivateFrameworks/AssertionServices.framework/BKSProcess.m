@interface BKSProcess
+ (double)backgroundTimeRemaining;
+ (id)busyExtensionInstances:(id)a3;
+ (id)currentProcess;
- (BKSProcess)init;
- (BKSProcess)initWithBundleIdentifier:(id)a3;
- (BKSProcess)initWithProcessIdentity:(id)a3;
- (BKSProcessExitContext)lastExitContext;
- (BOOL)_bootstrapWithError:(id *)a3;
- (BOOL)bootstrapWithProcessHandle:(id)a3 error:(id *)a4;
- (BOOL)nowPlayingWithAudio;
- (BOOL)recordingAudio;
- (BSProcessHandle)handle;
- (double)backgroundTimeRemaining;
- (id)description;
- (int64_t)terminationReason;
- (void)bootstrapCurrentProcess;
- (void)invalidate;
- (void)setNowPlayingWithAudio:(BOOL)a3;
- (void)setRecordingAudio:(BOOL)a3;
@end

@implementation BKSProcess

+ (id)currentProcess
{
  if (currentProcess_onceToken != -1) {
    dispatch_once(&currentProcess_onceToken, &__block_literal_global_0);
  }
  return (id)currentProcess___currentProcess;
}

uint64_t __28__BKSProcess_currentProcess__block_invoke()
{
  v0 = objc_alloc(&OBJC_CLASS___BKSProcess);
  [MEMORY[0x1896077F8] mainBundle];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 bundleIdentifier];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = -[BKSProcess initWithBundleIdentifier:](v0, "initWithBundleIdentifier:", v2);
  v4 = (void *)currentProcess___currentProcess;
  currentProcess___currentProcess = v3;

  return [(id)currentProcess___currentProcess bootstrapCurrentProcess];
}

- (void)bootstrapCurrentProcess
{
  uint64_t v3 = (BSProcessHandle *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  self->_handle = v3;

  [MEMORY[0x1896122D0] currentProcess];
  v5 = (RBSProcessHandle *)objc_claimAutoreleasedReturnValue();
  processHandle = self->_processHandle;
  self->_processHandle = v5;

  self->_bootstrapped = 1;
}

- (BKSProcess)init
{
  return -[BKSProcess initWithBundleIdentifier:](self, "initWithBundleIdentifier:", 0LL);
}

- (BKSProcess)initWithBundleIdentifier:(id)a3
{
  id v5 = a3;
  NSClassFromString(@"NSString");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"BKSProcess.m", 71, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"BKSProcess.m", 71, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:NSStringClass]" object file lineNumber description];
  }

  [MEMORY[0x1896077F8] mainBundle];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 bundleIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v5 isEqualToString:v7];

  if (v8) {
    [MEMORY[0x1896122E8] identityOfCurrentProcess];
  }
  else {
    [MEMORY[0x1896122E8] identityForEmbeddedApplicationIdentifier:v5 jobLabel:v5 auid:getuid() platform:6];
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[BKSProcess initWithProcessIdentity:](self, "initWithProcessIdentity:", v9);

  return v10;
}

- (BKSProcess)initWithProcessIdentity:(id)a3
{
  id v5 = a3;
  NSClassFromString(@"RBSProcessIdentity");
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a2, self, @"BKSProcess.m", 82, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
  }

  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"BKSProcess.m", 82, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:RBSProcessIdentityClass]" object file lineNumber description];
  }

  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___BKSProcess;
  v6 = -[BKSProcess init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t v8 = [v5 copy];
    identity = v7->_identity;
    v7->_identity = (RBSProcessIdentity *)v8;

    uint64_t v10 = [MEMORY[0x189612310] monitor];
    monitor = v7->_monitor;
    v7->_monitor = (RBSProcessMonitor *)v10;
  }

  return v7;
}

- (BOOL)bootstrapWithProcessHandle:(id)a3 error:(id *)a4
{
  id v8 = a3;
  if (self->_handle)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, self, @"BKSProcess.m", 96, @"Invalid parameter not satisfying: %@", @"_handle == nil" object file lineNumber description];
  }

  if (objc_opt_class())
  {
    id v9 = v8;
    NSClassFromString(@"BSProcessHandle");
    if (!v9)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 handleFailureInMethod:a2, self, @"BKSProcess.m", 100, @"Invalid condition not satisfying: %@", @"object != nil" object file lineNumber description];
    }

    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [MEMORY[0x1896077D8] currentHandler];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 handleFailureInMethod:a2, self, @"BKSProcess.m", 100, @"Invalid condition not satisfying: %@", @"[object isKindOfClass:BSProcessHandleClass]" object file lineNumber description];
    }

    objc_storeStrong((id *)&self->_handle, a3);
    BOOL v10 = -[BKSProcess _bootstrapWithError:](self, "_bootstrapWithError:", a4);
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)invalidate
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  rbs_shim_log();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    processHandle = self->_processHandle;
    int v10 = 134218242;
    v11 = self;
    __int16 v12 = 2114;
    v13 = processHandle;
    _os_log_impl( &dword_1862D9000,  v4,  OS_LOG_TYPE_DEFAULT,  "[BKSProcess:%p] Invalidating BKSProcess for %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  -[RBSAssertion invalidate](self->_assertion, "invalidate");
  assertion = self->_assertion;
  self->_assertion = 0LL;

  -[BKSProcessAssertion invalidate](self->_audioAssertion, "invalidate");
  audioAssertion = self->_audioAssertion;
  self->_audioAssertion = 0LL;

  -[BKSProcessAssertion invalidate](self->_mediaAssertion, "invalidate");
  mediaAssertion = self->_mediaAssertion;
  self->_mediaAssertion = 0LL;

  -[RBSProcessMonitor invalidate](self->_monitor, "invalidate");
  monitor = self->_monitor;
  self->_monitor = 0LL;

  os_unfair_lock_unlock(p_lock);
}

+ (double)backgroundTimeRemaining
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 backgroundTimeRemaining];
  double v4 = v3;

  double result = 1.79769313e308;
  if (v4 != *MEMORY[0x1896124A0]) {
    return v4;
  }
  return result;
}

- (double)backgroundTimeRemaining
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 runTime];
  double v4 = v3;

  double result = 1.79769313e308;
  if (v4 != *MEMORY[0x1896124A0]) {
    return v4;
  }
  return result;
}

- (BKSProcessExitContext)lastExitContext
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = self->_lastExitContext;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setNowPlayingWithAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_nowPlayingWithAudio != v3)
  {
    self->_nowPlayingWithAudio = v3;
    rbs_shim_log();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      processHandle = self->_processHandle;
      int v11 = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = processHandle;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl( &dword_1862D9000,  v6,  OS_LOG_TYPE_DEFAULT,  "[BKSProcess:%p] %{public}@ now playing with audio: %{BOOL}d",  (uint8_t *)&v11,  0x1Cu);
    }

    if (self->_nowPlayingWithAudio)
    {
      id v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:]( objc_alloc(&OBJC_CLASS___BKSProcessAssertion),  "initWithPID:flags:reason:name:",  -[RBSProcessHandle pid](self->_processHandle, "pid"),  13LL,  1LL,  @"-[BKSProcess setNowPlayingWithAudio:YES]");
      audioAssertion = self->_audioAssertion;
      self->_audioAssertion = v8;

      -[BKSProcessAssertion acquire](self->_audioAssertion, "acquire");
    }

    else
    {
      -[BKSProcessAssertion invalidate](self->_audioAssertion, "invalidate");
      int v10 = self->_audioAssertion;
      self->_audioAssertion = 0LL;
    }
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setRecordingAudio:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_recordingAudio != v3)
  {
    self->_recordingAudio = v3;
    rbs_shim_log();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      processHandle = self->_processHandle;
      int v11 = 134218498;
      __int16 v12 = self;
      __int16 v13 = 2114;
      uint64_t v14 = processHandle;
      __int16 v15 = 1024;
      BOOL v16 = v3;
      _os_log_impl( &dword_1862D9000,  v6,  OS_LOG_TYPE_DEFAULT,  "[BKSProcess:%p] %{public}@ now recording audio: %{BOOL}d",  (uint8_t *)&v11,  0x1Cu);
    }

    if (self->_recordingAudio)
    {
      id v8 = -[BKSProcessAssertion initWithPID:flags:reason:name:]( objc_alloc(&OBJC_CLASS___BKSProcessAssertion),  "initWithPID:flags:reason:name:",  -[RBSProcessHandle pid](self->_processHandle, "pid"),  13LL,  23LL,  @"-[BKSProcess setRecordingAudio:YES]");
      mediaAssertion = self->_mediaAssertion;
      self->_mediaAssertion = v8;

      -[BKSProcessAssertion acquire](self->_mediaAssertion, "acquire");
    }

    else
    {
      -[BKSProcessAssertion invalidate](self->_mediaAssertion, "invalidate");
      int v10 = self->_mediaAssertion;
      self->_mediaAssertion = 0LL;
    }
  }

  os_unfair_lock_unlock(p_lock);
}

+ (id)busyExtensionInstances:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FE0] set];
  double v4 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896121C0] sharedInstance];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = 0LL;
  [v5 busyExtensionInstancesFromSet:v3 error:&v20];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v20;

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * v12);
        v21 = @"ExtensionBundleID";
        uint64_t v22 = v13;
        objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, (void)v16);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 addObject:v14];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v23 count:16];
    }

    while (v10);
  }

  return v4;
}

- (BOOL)_bootstrapWithError:(id *)a3
{
  v72[5] = *MEMORY[0x1895F89C0];
  if (!self->_identity)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    [v50 handleFailureInMethod:a2 object:self file:@"BKSProcess.m" lineNumber:205 description:@"cannot bootstrap without an identity"];
  }

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_bootstrapped = 1;
  [MEMORY[0x189612288] grant];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v6;
  [MEMORY[0x1896121E8] invalidateAfterInterval:1.0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v7;
  [MEMORY[0x189612238] grantWithBackgroundPriority];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v8;
  [MEMORY[0x189612190] grant];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v9;
  [MEMORY[0x189612350] grantWithResistance:30];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v10;
  [MEMORY[0x189603F18] arrayWithObjects:v72 count:5];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  handle = self->_handle;
  if (handle)
  {
    uint64_t v13 = -[BSProcessHandle pid](handle, "pid");
    uint64_t v14 = (void *)MEMORY[0x1896122D0];
    [MEMORY[0x189607968] numberWithInt:v13];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v62 = 0LL;
    [v14 handleForIdentifier:v15 error:&v62];
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v62;

    if (v16)
    {
      id v18 = objc_alloc(MEMORY[0x189612158]);
      __int128 v19 = (void *)MEMORY[0x189612388];
      [MEMORY[0x189607968] numberWithInt:v13];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 targetWithProcessIdentifier:v20];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = (id)[v18 initWithExplanation:@"BKSProcessLaunch" target:v21 attributes:v11];

      [v22 acquireWithError:0];
LABEL_7:
      rbs_shim_log();
      v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
        *(_DWORD *)buf = 134218498;
        v67 = self;
        __int16 v68 = 2114;
        id v69 = v16;
        __int16 v70 = 2114;
        id v71 = v27;
        _os_log_impl( &dword_1862D9000,  v26,  OS_LOG_TYPE_DEFAULT,  "[BKSProcess:%p] %{public}@ bootstrapped successfully as %{public}@",  buf,  0x20u);
      }

      objc_storeStrong((id *)&self->_processHandle, v16);
      objc_storeStrong((id *)&self->_assertion, v22);
      if (!self->_handle)
      {
        [v16 legacyHandle];
        v28 = (BSProcessHandle *)objc_claimAutoreleasedReturnValue();
        v29 = self->_handle;
        self->_handle = v28;
      }

      if (self->_assertion)
      {
        dispatch_time_t v30 = dispatch_time(0LL, 1000000000LL);
        v31 = (dispatch_queue_s *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __34__BKSProcess__bootstrapWithError___block_invoke;
        block[3] = &unk_189E3B380;
        block[4] = self;
        dispatch_after(v30, v31, block);
      }

      BOOL v32 = 1;
      goto LABEL_31;
    }

    v53 = a3;
    id v22 = 0LL;
  }

  else
  {
    v53 = a3;
    id v23 = objc_alloc_init(MEMORY[0x189612240]);
    [v23 setIdentity:self->_identity];
    [v23 setExplanation:@"BKSProcessLaunch"];
    [v23 setAttributes:v11];
    uint64_t v24 = (void *)[objc_alloc(MEMORY[0x189612250]) initWithContext:v23];
    id v60 = 0LL;
    id v61 = 0LL;
    id v59 = 0LL;
    int v25 = [v24 execute:&v61 assertion:&v60 error:&v59];
    id v16 = v61;
    id v22 = v60;
    id v17 = v59;

    if (v25) {
      goto LABEL_7;
    }
  }

  id v51 = v22;
  v52 = v11;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  [v17 underlyingErrors];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v34 = [v33 countByEnumeratingWithState:&v54 objects:v65 count:16];
  if (!v34) {
    goto LABEL_26;
  }
  uint64_t v35 = v34;
  uint64_t v36 = *(void *)v55;
  uint64_t v37 = *MEMORY[0x189607688];
  do
  {
    for (uint64_t i = 0LL; i != v35; ++i)
    {
      if (*(void *)v55 != v36) {
        objc_enumerationMutation(v33);
      }
      v39 = *(void **)(*((void *)&v54 + 1) + 8 * i);
      [v39 domain];
      lastExitContext = (void *)objc_claimAutoreleasedReturnValue();
      if ([lastExitContext isEqual:v37])
      {
        uint64_t v41 = [v39 code];

        if (v41 != 80) {
          continue;
        }
        v42 = objc_alloc_init(&OBJC_CLASS___BKSProcessExitContext);
        -[BKSProcessExitContext setExitReason:]((uint64_t)v42, 16LL);
        lastExitContext = self->_lastExitContext;
        self->_lastExitContext = v42;
      }
    }

    uint64_t v35 = [v33 countByEnumeratingWithState:&v54 objects:v65 count:16];
  }

  while (v35);
LABEL_26:

  rbs_shim_log();
  v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    v48 = -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
    *(_DWORD *)buf = 134218498;
    v67 = self;
    __int16 v68 = 2114;
    id v69 = v48;
    __int16 v70 = 2114;
    id v71 = v17;
    _os_log_error_impl( &dword_1862D9000,  v43,  OS_LOG_TYPE_ERROR,  "[BKSProcess:%p] Bootstrap failed for %{public}@ with error: <%{public}@>",  buf,  0x20u);
  }

  uint64_t v11 = v52;
  p_lock = &self->_lock;
  if (v53)
  {
    v44 = (void *)MEMORY[0x189607870];
    uint64_t v45 = *MEMORY[0x189607798];
    v63[0] = *MEMORY[0x1896075F0];
    v63[1] = v45;
    v64[0] = @"Bootstrap failed";
    v64[1] = v17;
    [MEMORY[0x189603F68] dictionaryWithObjects:v64 forKeys:v63 count:2];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v44 errorWithDomain:@"BKSProcessErrorDomain" code:1 userInfo:v46];
    id *v53 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v32 = 0;
  id v22 = v51;
LABEL_31:
  os_unfair_lock_unlock(p_lock);

  return v32;
}

void __34__BKSProcess__bootstrapWithError___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0LL;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8LL));
}

- (id)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[RBSProcessIdentity shortDescription](self->_identity, "shortDescription");
  id v7 = (void *)[v4 initWithFormat:@"<%@| %@>", v5, v6];

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (int64_t)terminationReason
{
  return self->_terminationReason;
}

- (BSProcessHandle)handle
{
  return self->_handle;
}

- (BOOL)nowPlayingWithAudio
{
  return self->_nowPlayingWithAudio;
}

- (BOOL)recordingAudio
{
  return self->_recordingAudio;
}

- (void).cxx_destruct
{
}

@end