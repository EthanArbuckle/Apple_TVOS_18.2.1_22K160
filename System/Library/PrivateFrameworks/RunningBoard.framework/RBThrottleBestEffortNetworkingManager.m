@interface RBThrottleBestEffortNetworkingManager
- (BOOL)isThrottleBestEffortNetworkingEnabled;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBThrottleBestEffortNetworkingManager)init;
- (void)_updateThrottleBestEffortNetworking;
- (void)addProcess:(id)a3;
- (void)didUpdateProcessStates:(id)a3;
- (void)removeProcess:(id)a3;
@end

@implementation RBThrottleBestEffortNetworkingManager

- (RBThrottleBestEffortNetworkingManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___RBThrottleBestEffortNetworkingManager;
  v2 = -[RBThrottleBestEffortNetworkingManager init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    stateMap = v3->_stateMap;
    v3->_stateMap = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___RBProcessIndex);
    processIndex = v3->_processIndex;
    v3->_processIndex = v6;

    v3->_throttleBestEffortNetworking = 0;
    uint64_t v8 = [MEMORY[0x1896123B0] createBackgroundQueue:@"RBThrottleBestEffortNetworkingManager"];
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v8;
  }

  return v3;
}

- (void)didUpdateProcessStates:(id)a3
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        [v9 updatedState];
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 originalState];
        objc_super v11 = (void *)objc_claimAutoreleasedReturnValue();
        int v12 = [v11 throttleBestEffortNetworking];
        int v13 = [v10 throttleBestEffortNetworking];

        if (v12 != v13)
        {
          [v9 identity];
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          int v15 = [v10 throttleBestEffortNetworking];
          stateMap = self->_stateMap;
          if (v15)
          {
            v17 = (void *)[v10 copy];
            id v18 = -[RBProcessMap setValue:forIdentity:](stateMap, "setValue:forIdentity:", v17, v14);
          }

          else
          {
            -[RBProcessMap removeIdentity:](self->_stateMap, "removeIdentity:", v14);
          }

          char v6 = 1;
        }
      }

      uint64_t v5 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v5);
    if ((v6 & 1) != 0) {
      -[RBThrottleBestEffortNetworkingManager _updateThrottleBestEffortNetworking]((uint64_t)self);
    }
  }
}

- (void)_updateThrottleBestEffortNetworking
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 36);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 36));
    uint64_t v12 = 0LL;
    int v13 = &v12;
    uint64_t v14 = 0x2020000000LL;
    char v15 = 0;
    id v3 = *(void **)(a1 + 24);
    uint64_t v4 = MEMORY[0x1895F87A8];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke;
    v11[3] = &unk_18A2560A0;
    v11[4] = a1;
    v11[5] = &v12;
    [v3 enumerateWithBlock:v11];
    if (*((unsigned __int8 *)v13 + 24) != *(unsigned __int8 *)(a1 + 32))
    {
      rbs_best_effort_networking_log();
      uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        if (*((_BYTE *)v13 + 24)) {
          char v6 = "enabled";
        }
        else {
          char v6 = "disabled";
        }
        *(_DWORD *)buf = 136315138;
        v17 = v6;
        _os_log_impl(&dword_188634000, v5, OS_LOG_TYPE_DEFAULT, "Throttle best effort networking set to %s", buf, 0xCu);
      }

      uint64_t v7 = v13;
      *(_BYTE *)(a1 + 32) = *((_BYTE *)v13 + 24);
      LODWORD(v7) = *((unsigned __int8 *)v7 + 24);
      uint64_t v8 = *(dispatch_queue_s **)(a1 + 8);
      block[0] = v4;
      block[1] = 3221225472LL;
      block[2] = __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9;
      block[3] = &__block_descriptor_36_e5_v8__0l;
      int v10 = (int)v7;
      dispatch_async(v8, block);
    }

    os_unfair_lock_unlock(v2);
    _Block_object_dispose(&v12, 8);
  }

- (void)addProcess:(id)a3
{
}

- (void)removeProcess:(id)a3
{
}

- (BOOL)isThrottleBestEffortNetworkingEnabled
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_throttleBestEffortNetworking;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessMap dictionary](self->_stateMap, "dictionary");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 entriesToStringWithIndent:1 debug:1];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = (void *)[v3 initWithFormat:@"<%@| process states:{\n\t%@\n\t}>", v4, v6];

  return (NSString *)v7;
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

uint64_t __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) containsIdentity:a2];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

void __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9( uint64_t a1)
{
  if (sysctlbyname("kern.ipc.throttle_best_effort", 0LL, 0LL, (void *)(a1 + 32), 4uLL) && *__error() != 2)
  {
    rbs_best_effort_networking_log();
    v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9_cold_1(v1);
    }
  }

- (void).cxx_destruct
{
}

void __76__RBThrottleBestEffortNetworkingManager__updateThrottleBestEffortNetworking__block_invoke_9_cold_1( os_log_s *a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v2 = *__error();
  id v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  uint64_t v7 = v4;
  _os_log_error_impl( &dword_188634000,  a1,  OS_LOG_TYPE_ERROR,  "Error applying throttle best effort with error %d: %s",  (uint8_t *)v5,  0x12u);
}

@end