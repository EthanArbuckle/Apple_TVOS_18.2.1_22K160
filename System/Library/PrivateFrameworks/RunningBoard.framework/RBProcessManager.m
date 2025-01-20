@interface RBProcessManager
+ (id)stateApplicationQueue;
- (BOOL)_canTerminateProcess:(id)a3 withContext:(id)a4 error:(id *)a5;
- (BOOL)isActiveProcess:(id)a3;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBProcessManager)init;
- (RBProcessManager)initWithBundlePropertiesManager:(id)a3 entitlementManager:(id)a4 jetsamPropertytManager:(id)a5 timeProvider:(id)a6 historialStatistics:(id)a7 delegate:(id)a8;
- (id)_executeLaunchRequest:(id)a3 withError:(id *)a4;
- (id)_getLifecycleQueueForIdentity:(id)a3;
- (id)_lifecycleQueue_addProcessWithInstance:(id)a3 properties:(id)a4;
- (id)_processForIdentifier:(id)a3;
- (id)_processForIdentifier:(id)a3 withAuditToken:(id)a4 forceStartTracking:(BOOL)a5;
- (id)_processForInstance:(id)a3;
- (id)_resolveProcessWithIdentifier:(id)a3 auditToken:(id)a4 properties:(id *)a5;
- (id)busyExtensionInstancesFromSet:(id)a3;
- (id)processForAuditToken:(id)a3;
- (id)processForIdentifier:(id)a3;
- (id)processForIdentifierWithoutStartingTracking:(id)a3;
- (id)processForIdentity:(id)a3;
- (id)processForInstance:(id)a3;
- (id)processesMatchingPredicate:(id)a3;
- (void)_enqueueGuaranteedRunningLaunchForIdentity:(id)a3 atTime:(double)a4;
- (void)_executeLifecycleEventForIdentity:(id)a3 sync:(BOOL)a4 withBlock:(id)a5;
- (void)_releaseLifecycleQueueForIdentity:(id)a3;
- (void)_removeProcess:(id)a3;
- (void)applySystemState:(id)a3;
- (void)didUpdateProcessStates:(id)a3 completion:(id)a4;
- (void)executeLaunchRequest:(id)a3 withCompletion:(id)a4;
- (void)executeTerminateRequest:(id)a3 completion:(id)a4;
- (void)removeStateForProcessIdentity:(id)a3;
- (void)start;
- (void)systemPreventIdleSleepStateDidChange:(BOOL)a3;
@end

@implementation RBProcessManager

+ (id)stateApplicationQueue
{
  if (stateApplicationQueue_onceToken != -1) {
    dispatch_once(&stateApplicationQueue_onceToken, &__block_literal_global_17);
  }
  return (id)stateApplicationQueue_queue;
}

void __41__RBProcessManager_stateApplicationQueue__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1896123B0] createSyncingQueue:@"RBProcessManagerStateApplicator"];
  v1 = (void *)stateApplicationQueue_queue;
  stateApplicationQueue_queue = v0;
}

- (RBProcessManager)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBProcessManager.m" lineNumber:356 description:@"-init is not allowed on RBProcessManager"];

  return 0LL;
}

- (RBProcessManager)initWithBundlePropertiesManager:(id)a3 entitlementManager:(id)a4 jetsamPropertytManager:(id)a5 timeProvider:(id)a6 historialStatistics:(id)a7 delegate:(id)a8
{
  id v15 = a3;
  id v45 = a4;
  id v44 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___RBProcessManager;
  v19 = -[RBProcessManager init](&v46, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_bundlePropertiesManager, a3);
    objc_storeStrong((id *)&v20->_entitlementManager, a4);
    objc_storeStrong((id *)&v20->_delegate, a8);
    v20->_pendingExitBlockLock._os_unfair_lock_opaque = 0;
    v20->_lock._os_unfair_lock_opaque = 0;
    v21 = objc_alloc_init(&OBJC_CLASS___RBPersonaManager);
    v22 = -[RBContainerManager initWithPersonaManager:]( objc_alloc(&OBJC_CLASS___RBContainerManager),  "initWithPersonaManager:",  v21,  v44,  v45);
    objc_storeStrong((id *)&v20->_jetsamPropertytManager, a5);
    objc_storeStrong((id *)&v20->_historicalStatistics, a7);
    v23 = -[RBPrewarmManager initWithDelegate:timeProvider:]( objc_alloc(&OBJC_CLASS___RBPrewarmManager),  "initWithDelegate:timeProvider:",  v20,  v16);
    prewarmManager = v20->_prewarmManager;
    v20->_prewarmManager = v23;

    v25 = objc_alloc(&OBJC_CLASS___RBLaunchdJobManager);
    v26 = +[RBLaunchdInterface interface](&OBJC_CLASS___RBLaunchdInterface, "interface");
    uint64_t v27 = -[RBLaunchdJobManager initWithLaunchdInterface:personaManager:containerManager:bundlePropertiesManager:]( v25,  "initWithLaunchdInterface:personaManager:containerManager:bundlePropertiesManager:",  v26,  v21,  v22,  v15);
    jobManager = v20->_jobManager;
    v20->_jobManager = (RBLaunchdJobManager *)v27;

    v29 = -[RBLaunchManager initWithJobManager:timeProvider:delegate:]( objc_alloc(&OBJC_CLASS___RBLaunchManager),  "initWithJobManager:timeProvider:delegate:",  v20->_jobManager,  v16,  v20);
    launchManager = v20->_launchManager;
    v20->_launchManager = v29;

    uint64_t v31 = +[RBProcessIndex index](&OBJC_CLASS___RBProcessIndex, "index");
    processIndex = v20->_processIndex;
    v20->_processIndex = (RBProcessIndex *)v31;

    uint64_t v33 = +[RBProcessIndex indexWithCapacity:](&OBJC_CLASS___RBProcessIndex, "indexWithCapacity:", 32LL);
    processGraveyard = v20->_processGraveyard;
    v20->_processGraveyard = (RBProcessIndex *)v33;

    v35 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
    processState = v20->_processState;
    v20->_processState = v35;

    uint64_t v37 = [MEMORY[0x189603FC8] dictionary];
    identityToPendingExitBlock = v20->_identityToPendingExitBlock;
    v20->_identityToPendingExitBlock = (NSMutableDictionary *)v37;

    os_unfair_lock_lock(&v20->_lock);
    uint64_t v39 = [MEMORY[0x189603FC8] dictionary];
    identityToProcessLifecycleQueue = v20->_identityToProcessLifecycleQueue;
    v20->_identityToProcessLifecycleQueue = (NSMutableDictionary *)v39;

    uint64_t v41 = [MEMORY[0x189607838] set];
    lifecycleQueuesInUse = v20->_lifecycleQueuesInUse;
    v20->_lifecycleQueuesInUse = (NSCountedSet *)v41;

    os_unfair_lock_unlock(&v20->_lock);
  }

  return v20;
}

- (NSString)debugDescription
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_systemState;
  os_unfair_lock_unlock(p_lock);
  id v5 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[RBProcessMap dictionary](self->_processState, "dictionary");
  [v7 entriesToStringWithIndent:1 debug:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
  [v9 componentsJoinedByString:@",\n\t"];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)[v5 initWithFormat:@"<%@| system state:%@ process states:{\n%@\t} processes:[%@\n\t]>", v6, v4, v8, v10];

  return (NSString *)v11;
}

- (void)start
{
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 3221225472LL;
  activity_block[2] = __25__RBProcessManager_start__block_invoke;
  activity_block[3] = &unk_18A255C70;
  activity_block[4] = self;
  _os_activity_initiate(&dword_188634000, "state recovery", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __25__RBProcessManager_start__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  [*(id *)(*(void *)(a1 + 32) + 8) synchronizeJobs];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        rbs_process_log();
        v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v7;
          _os_log_impl(&dword_188634000, v8, OS_LOG_TYPE_DEFAULT, "Reestablishing with %{public}@...", buf, 0xCu);
        }

        [v7 identifier];
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = +[RBLaunchdProperties propertiesForPid:]( RBLaunchdProperties,  "propertiesForPid:",  [v9 pid]);
        objc_msgSend(*(id *)(a1 + 32), "_lifecycleQueue_addProcessWithInstance:properties:", v7, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11) {
          [*(id *)(*(void *)(a1 + 32) + 8) removeJobWithInstance:v7 error:0];
        }
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v4);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  v14 = (void *)MEMORY[0x189604010];
  [*(id *)(v12 + 88) allProcesses];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setWithArray:v15];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 processManager:v12 didReconnectProcesses:v16];
}

- (id)processForAuditToken:(id)a3
{
  id v4 = a3;
  objc_msgSend(MEMORY[0x1896122E0], "identifierWithPid:", objc_msgSend(v4, "pid"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:]( self,  "_processForIdentifier:withAuditToken:forceStartTracking:",  v5,  v4,  1LL);
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)processForIdentifier:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:]( self,  "_processForIdentifier:withAuditToken:forceStartTracking:",  v4,  0LL,  1LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)processForIdentifierWithoutStartingTracking:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:]( self,  "_processForIdentifier:withAuditToken:forceStartTracking:",  v4,  0LL,  0LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)_processForIdentifier:(id)a3 withAuditToken:(id)a4 forceStartTracking:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v64 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  uint64_t v53 = 0LL;
  v54 = &v53;
  uint64_t v55 = 0x3032000000LL;
  v56 = __Block_byref_object_copy__5;
  v57 = __Block_byref_object_dispose__5;
  -[RBProcessManager _processForIdentifier:](self, "_processForIdentifier:", v8);
  id v58 = (id)objc_claimAutoreleasedReturnValue();
  v10 = (void *)v54[5];
  if (!v10)
  {
    id v48 = 0LL;
    -[RBProcessManager _resolveProcessWithIdentifier:auditToken:properties:]( self,  "_resolveProcessWithIdentifier:auditToken:properties:",  v8,  v9,  &v48);
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    id v18 = v48;
    [v17 identity];
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if (v5)
      {
        v43[0] = MEMORY[0x1895F87A8];
        v43[1] = 3221225472LL;
        v43[2] = __76__RBProcessManager__processForIdentifier_withAuditToken_forceStartTracking___block_invoke;
        v43[3] = &unk_18A256D90;
        v47 = &v53;
        v43[4] = self;
        id v44 = v8;
        id v45 = v17;
        id v46 = v18;
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:]( self,  "_executeLifecycleEventForIdentity:sync:withBlock:",  v19,  1LL,  v43);

LABEL_15:
        id v30 = (id)v54[5];
LABEL_34:

        goto LABEL_35;
      }

      objc_msgSend(MEMORY[0x189612268], "taskNameForPID:", objc_msgSend(v17, "rbs_pid"));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v21 = [v20 auditToken];
      v22 = (void *)v21;
      if (v20 && v21)
      {
        objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v18, "hostPid"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = -[RBProcessManager processForIdentifierWithoutStartingTracking:]( self,  "processForIdentifierWithoutStartingTracking:",  v23);
        -[RBBundlePropertiesManaging propertiesForIdentity:identifier:]( self->_bundlePropertiesManager,  "propertiesForIdentity:identifier:",  v19,  v8);
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
        jetsamPropertytManager = self->_jetsamPropertytManager;
        uint64_t v26 = objc_msgSend(v8, "rbs_pid");
        [v22 realToken];
        -[RBJetsamPropertyManaging jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:]( jetsamPropertytManager,  "jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:",  v26,  v19,  v24,  RBSAuditTokenRepresentsPlatformBinary());
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        id v28 = -[RBProcess _initThinWithInstance:auditToken:bundleProperties:jetsamProperties:hostProcess:properties:]( objc_alloc(&OBJC_CLASS___RBProcess),  "_initThinWithInstance:auditToken:bundleProperties:jetsamProperties:hostProcess:properties:",  v17,  v22,  v24,  v27,  v42,  v18);
        v29 = (void *)v54[5];
        v54[5] = (uint64_t)v28;

        goto LABEL_15;
      }

      rbs_process_log();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:].cold.1();
      }
    }

    id v30 = 0LL;
    goto LABEL_34;
  }

  if (v9)
  {
    uint64_t v11 = [v10 auditToken];
    uint64_t v12 = (void *)v11;
    if ((id)v11 == v9)
    {
    }

    else if (!v11 || (char v13 = [v9 isEqual:v11], v12, (v13 & 1) == 0))
    {
      [v9 realToken];
      uid_t v14 = audit_token_to_auid(&atoken);
      [(id)v54[5] auditToken];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v15;
      if (v15) {
        [v15 realToken];
      }
      else {
        memset(&v51, 0, sizeof(v51));
      }
      BOOL v31 = v14 == audit_token_to_auid(&v51);

      if (!v31)
      {
        rbs_process_log();
        v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
        {
          [(id)v54[5] auditToken];
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBProcessManager _processForIdentifier:withAuditToken:forceStartTracking:].cold.2( v33,  (uint64_t)v9,  (uint64_t)v63,  v32);
        }
      }

      [v9 realToken];
      uid_t v34 = audit_token_to_euid(&v50);
      [(id)v54[5] auditToken];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v35) {
        [v35 realToken];
      }
      else {
        memset(&v49, 0, sizeof(v49));
      }
      BOOL v37 = v34 == audit_token_to_euid(&v49);

      if (!v37)
      {
        rbs_process_log();
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          [(id)v54[5] auditToken];
          uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v60 = v39;
          __int16 v61 = 2114;
          id v62 = v9;
          _os_log_impl( &dword_188634000,  v38,  OS_LOG_TYPE_DEFAULT,  "EUID of process has changed from %{public}@ to %{public}@",  buf,  0x16u);
        }
      }

      [(id)v54[5] setAuditToken:v9];
      -[RBEntitlementManaging purgeEntitlementsForProcess:]( self->_entitlementManager,  "purgeEntitlementsForProcess:",  v54[5]);
    }
  }

  id v30 = (id)v54[5];
LABEL_35:
  _Block_object_dispose(&v53, 8);

  return v30;
}

void __76__RBProcessManager__processForIdentifier_withAuditToken_forceStartTracking___block_invoke( uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _processForIdentifier:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL))
  {
    uint64_t v5 = objc_msgSend( *(id *)(a1 + 32),  "_lifecycleQueue_addProcessWithInstance:properties:",  *(void *)(a1 + 48),  *(void *)(a1 + 56));
    uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8LL);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

- (id)processForIdentity:(id)a3
{
  return -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", a3);
}

- (id)processForInstance:(id)a3
{
  id v4 = a3;
  [v4 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessManager processForIdentifier:](self, "processForIdentifier:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 instance];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isEqual:v4];

  if ((v8 & 1) == 0)
  {

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)processesMatchingPredicate:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 processIdentifiers];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    [MEMORY[0x189603FE0] set];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      id v30 = v5;
      uint64_t v10 = *(void *)v36;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v36 != v10) {
            objc_enumerationMutation(v7);
          }
          -[RBProcessManager processForIdentifierWithoutStartingTracking:]( self,  "processForIdentifierWithoutStartingTracking:",  *(void *)(*((void *)&v35 + 1) + 8 * i));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          char v13 = v12;
          if (v12)
          {
            [v12 handle];
            uid_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            int v15 = [v4 matchesProcess:v14];

            if (v15) {
              [v6 addObject:v13];
            }
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }

      while (v9);
LABEL_29:
      uint64_t v5 = v30;
    }
  }

  else
  {
    [v4 processIdentity];
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      id v30 = 0LL;
      [MEMORY[0x189603FE0] set];
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
      __int128 v31 = 0u;
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (uint64_t j = 0LL; j != v23; ++j)
          {
            if (*(void *)v32 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
            [v26 handle];
            uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
            int v28 = [v4 matchesProcess:v27];

            if (v28) {
              [v6 addObject:v26];
            }
          }

          uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
        }

        while (v23);
      }

      goto LABEL_29;
    }

    -[RBProcessManager processForIdentity:](self, "processForIdentity:", v7);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v17 = v16;
    if (v16
      && ([v16 handle],
          id v18 = (void *)objc_claimAutoreleasedReturnValue(),
          int v19 = [v4 matchesProcess:v18],
          v18,
          v19))
    {
      uint64_t v20 = [MEMORY[0x189604010] setWithObject:v17];
    }

    else
    {
      uint64_t v20 = [MEMORY[0x189604010] set];
    }

    uint64_t v6 = (void *)v20;
  }

  return v6;
}

- (BOOL)isActiveProcess:(id)a3
{
  return -[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", a3);
}

- (void)systemPreventIdleSleepStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v20 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_systemPreventsIdleSleep = v3;
  os_unfair_lock_unlock(p_lock);
  if (!v3)
  {
    rbs_process_log();
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188634000, v6, OS_LOG_TYPE_DEFAULT, "Shutdown sockets for all suspended processes", buf, 2u);
    }
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v7 = self->_processIndex;
  uint64_t v8 = -[RBProcessIndex countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "identity", (void)v14);
        char v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:]( self,  "_executeLifecycleEventForIdentity:sync:withBlock:",  v13,  1LL,  &__block_literal_global_37);

        [v12 _systemPreventIdleSleepStateDidChange:v3];
      }

      uint64_t v9 = -[RBProcessIndex countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v14,  v19,  16LL);
    }

    while (v9);
  }
}

- (void)executeLaunchRequest:(id)a3 withCompletion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 handleFailureInMethod:a2, self, @"RBProcessManager.m", 582, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }

  id v32 = 0LL;
  -[RBProcessManager _executeLaunchRequest:withError:](self, "_executeLaunchRequest:withError:", v7, &v32);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v32;
  uint64_t v11 = v10;
  if (v9)
  {
    id v25 = v10;
    id v26 = v8;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v27 = v7;
    [v7 context];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 managedEndpointLaunchIdentifiers];
    char v13 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      __int128 v16 = 0LL;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v15; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          [v9 managedEndpointByLaunchIdentifier];
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v20 objectForKey:v19];
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21)
          {
            if (v16)
            {
              [v16 setObject:v21 forKey:v19];
            }

            else
            {
              [MEMORY[0x189603FC8] dictionaryWithObject:v21 forKey:v19];
              __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }
        }

        uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }

      while (v15);
    }

    else
    {
      __int128 v16 = 0LL;
    }

    [v9 handle];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = (void *)[v16 copy];
    uint64_t v11 = v25;
    id v8 = v26;
    (*((void (**)(id, void *, void *, id))v26 + 2))(v26, v22, v23, v25);

    id v7 = v27;
  }

  else
  {
    (*((void (**)(id, void, void, id))v8 + 2))(v8, 0LL, 0LL, v10);
  }
}

- (id)_executeLaunchRequest:(id)a3 withError:(id *)a4
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v30 handleFailureInMethod:a2, self, @"RBProcessManager.m", 606, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }

  [v7 context];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 identity];
  id v10 = (void *)v9;
  if (v8 && v9)
  {
    rbs_process_log();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v10 shortDescription];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 explanation];
      char v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v13;
      _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_DEFAULT,  "Executing launch request for %{public}@ (%{public}@)",  buf,  0x16u);
    }

    [v8 requiredExistingProcess];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14) {
      goto LABEL_8;
    }
    os_unfair_lock_lock(&self->_lock);
    uint64_t v15 = self->_systemState;
    os_unfair_lock_unlock(&self->_lock);
    id v44 = 0LL;
    int v24 = [v8 _launchAllowedBySystemState:v15 error:&v44];
    id v25 = v44;
    id v26 = v25;
    if (v24)
    {
      id v43 = v25;
      char v27 = [v8 _passesRegulatoryChecksWithError:&v43];
      id v28 = v43;

      if ((v27 & 1) != 0)
      {

LABEL_8:
        -[RBProcessMap valueForIdentity:](self->_processState, "valueForIdentity:", v10);
        uint64_t v15 = (RBSystemState *)objc_claimAutoreleasedReturnValue();
        unsigned int v16 = [v8 initialRole];
        uint64_t v17 = [v8 hostPid];
        if ((int)v17 >= 1)
        {
          [MEMORY[0x189607968] numberWithInt:v17];
          id v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBProcessManager processForIdentifier:](self, "processForIdentifier:", v18);
          uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

          [v8 setHostProcess:v19];
        }

        *(void *)buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        id v46 = __Block_byref_object_copy__5;
        v47 = __Block_byref_object_dispose__5;
        id v48 = 0LL;
        uint64_t v37 = 0LL;
        __int128 v38 = &v37;
        uint64_t v39 = 0x3032000000LL;
        v40 = __Block_byref_object_copy__5;
        uint64_t v41 = __Block_byref_object_dispose__5;
        id v42 = 0LL;
        v31[0] = MEMORY[0x1895F87A8];
        v31[1] = 3221225472LL;
        v31[2] = __52__RBProcessManager__executeLaunchRequest_withError___block_invoke;
        v31[3] = &unk_18A256DD8;
        v31[4] = self;
        id v32 = v10;
        id v33 = v14;
        __int128 v35 = buf;
        __int128 v36 = &v37;
        id v34 = v8;
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:]( self,  "_executeLifecycleEventForIdentity:sync:withBlock:",  v32,  1LL,  v31);
        if (a4) {
          *a4 = *(id *)(*(void *)&buf[8] + 40LL);
        }
        id v20 = (id)v38[5];

        _Block_object_dispose(&v37, 8);
        _Block_object_dispose(buf, 8);

LABEL_25:
        goto LABEL_26;
      }

      id v26 = v28;
    }

    if (a4) {
      *a4 = v26;
    }

    id v20 = 0LL;
    goto LABEL_25;
  }

  if (a4)
  {
    [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = *MEMORY[0x1896124B0];
    [v21 setObject:@"Launch prevented due to invalid parameters" forKey:*MEMORY[0x1896075F0]];
    [MEMORY[0x189607870] errorWithDomain:v22 code:1 userInfo:v21];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    id v20 = 0LL;
    *a4 = v23;
  }

  else
  {
    id v20 = 0LL;
  }

void __52__RBProcessManager__executeLaunchRequest_withError___block_invoke(void *a1)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  [*(id *)(a1[4] + 88) processForIdentity:a1[5]];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2;
  if (a1[6])
  {
    if (v2
      && ([v2 identifier],
          id v4 = (void *)objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 isEqual:a1[6]],
          v4,
          v5))
    {
      rbs_process_log();
      uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = a1[5];
        *(_DWORD *)buf = 138543618;
        uint64_t v33 = v7;
        __int16 v34 = 2114;
        __int128 v35 = v3;
        _os_log_impl( &dword_188634000,  v6,  OS_LOG_TYPE_INFO,  "%{public}@ is already running as %{public}@ which matches the requiredExistingProcess",  buf,  0x16u);
      }

      uint64_t v8 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v9 setObject:@"The process was already running as expected." forKey:*MEMORY[0x1896075F0]];
      uint64_t v10 = [MEMORY[0x189607870] errorWithDomain:v8 code:2 userInfo:v9];

      uint64_t v11 = *(void *)(a1[8] + 8LL);
      uint64_t v12 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v10;

      uint64_t v13 = *(void *)(a1[9] + 8LL);
      id v14 = v3;
      uint64_t v15 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v14;
    }

    else
    {
      rbs_process_log();
      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = a1[5];
        uint64_t v18 = a1[6];
        *(_DWORD *)buf = 138543874;
        uint64_t v33 = v17;
        __int16 v34 = 2114;
        __int128 v35 = v3;
        __int16 v36 = 2112;
        uint64_t v37 = v18;
        _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_INFO,  "%{public}@ is already running as %{public}@ which doesn't match requiredExistingProcess of %@",  buf,  0x20u);
      }

      uint64_t v19 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v20 setObject:@"The running process did not match the expected." forKey:*MEMORY[0x1896075F0]];
      uint64_t v21 = [MEMORY[0x189607870] errorWithDomain:v19 code:3 userInfo:v20];

      uint64_t v22 = *(void *)(a1[8] + 8LL);
      uint64_t v15 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }

  else
  {
    uint64_t v23 = a1[5];
    int v24 = *(void **)(a1[4] + 56LL);
    uint64_t v25 = a1[7];
    id v31 = 0LL;
    uint64_t v26 = [v24 executeLaunchRequest:v25 existingProcess:v3 requestIdentity:v23 withError:&v31];
    id v27 = v31;
    uint64_t v28 = *(void *)(a1[9] + 8LL);
    __int128 v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = v26;

    uint64_t v30 = *(void *)(a1[8] + 8LL);
    uint64_t v15 = *(void **)(v30 + 40);
    *(void *)(v30 + 40) = v27;
  }
}

- (BOOL)_canTerminateProcess:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  [v8 identity];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessMap valueForIdentity:](self->_processState, "valueForIdentity:", v10);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  unsigned int v12 = [v9 maximumTerminationResistance];
  if (v12 && [v11 terminationResistance] > v12)
  {
    if (a5)
    {
      uint64_t v13 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setObject:@"Target process has a higher termination resistance than the termination context" forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v13 code:4 userInfo:v14];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

      *a5 = v15;
    }

    rbs_process_log();
    unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    int v23 = 138543362;
    id v24 = v8;
    uint64_t v17 = "Termination request for %{public}@ failed due to termination resistance";
    goto LABEL_14;
  }

  if (![v9 preventIfBeingDebugged]
    || ([v8 isBeingPtraced] & 1) == 0 && !objc_msgSend(v11, "isBeingDebugged"))
  {
    BOOL v21 = 1;
    goto LABEL_17;
  }

  if (a5)
  {
    uint64_t v18 = *MEMORY[0x1896124B0];
    [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setObject:@"Target process is being debugged and termination context forbids request" forKey:*MEMORY[0x1896075F0]];
    [MEMORY[0x189607870] errorWithDomain:v18 code:4 userInfo:v19];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();

    *a5 = v20;
  }

  rbs_process_log();
  unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138543362;
    id v24 = v8;
    uint64_t v17 = "Termination request for %{public}@ failed due to target being debugged";
LABEL_14:
    _os_log_impl(&dword_188634000, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v23, 0xCu);
  }

- (void)executeTerminateRequest:(id)a3 completion:(id)a4
{
  uint64_t v98 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void, void *))a4;
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 handleFailureInMethod:a2, self, @"RBProcessManager.m", 703, @"Invalid parameter not satisfying: %@", @"request" object file lineNumber description];
  }

  [v6 context];
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 targetsAllManagedProcesses];
  [v6 predicate];
  id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  rbs_process_log();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = @"all-managed";
    if (!v8) {
      uint64_t v11 = v9;
    }
    *(_DWORD *)buf = 138543362;
    uint64_t v92 = (uint64_t)v11;
    _os_log_impl(&dword_188634000, v10, OS_LOG_TYPE_DEFAULT, "Executing termination request for: %{public}@", buf, 0xCu);
  }

  if (v9) {
    char v12 = 1;
  }
  else {
    char v12 = v8;
  }
  if (!v69 || (v12 & 1) == 0)
  {
    rbs_process_log();
    BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[RBProcessManager executeTerminateRequest:completion:].cold.3();
    }

    if (v7)
    {
      uint64_t v22 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      int v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 setObject:@"Invalid termination context" forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v22 code:1 userInfo:v23];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0LL, v13);
      goto LABEL_82;
    }

    goto LABEL_83;
  }

  [MEMORY[0x189603FE0] set];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v13;
  if (v8)
  {
    __int128 v89 = 0uLL;
    __int128 v90 = 0uLL;
    __int128 v87 = 0uLL;
    __int128 v88 = 0uLL;
    -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = [v14 countByEnumeratingWithState:&v87 objects:v97 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      int v67 = v8;
      uint64_t v17 = v9;
      uint64_t v18 = *(void *)v88;
      do
      {
        for (uint64_t i = 0LL; i != v16; ++i)
        {
          if (*(void *)v88 != v18) {
            objc_enumerationMutation(v14);
          }
          id v20 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        }

        uint64_t v16 = [v14 countByEnumeratingWithState:&v87 objects:v97 count:16];
      }

      while (v16);
LABEL_37:
      id v9 = v17;
      int v8 = v67;
    }
  }

  else
  {
    __int128 v85 = 0uLL;
    __int128 v86 = 0uLL;
    __int128 v83 = 0uLL;
    __int128 v84 = 0uLL;
    -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v14 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      int v67 = 0;
      uint64_t v17 = v9;
      v63 = v7;
      uint64_t v26 = *(void *)v84;
      do
      {
        for (uint64_t j = 0LL; j != v25; ++j)
        {
          if (*(void *)v84 != v26) {
            objc_enumerationMutation(v14);
          }
          uint64_t v28 = *(void **)(*((void *)&v83 + 1) + 8 * j);
          [v28 handle];
          __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
          int v30 = -[__CFString matchesProcess:](v17, "matchesProcess:", v29);

          uint64_t v13 = v72;
          if (v30) {
            [v72 addObject:v28];
          }
        }

        uint64_t v25 = [v14 countByEnumeratingWithState:&v83 objects:v96 count:16];
      }

      while (v25);
      uint64_t v7 = v63;
      goto LABEL_37;
    }
  }

  rbs_process_log();
  id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v32 = [v13 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v92 = v32;
    _os_log_impl(&dword_188634000, v31, OS_LOG_TYPE_DEFAULT, "Found %lu processes to terminate", buf, 0xCu);
  }

  if (![v13 count])
  {
    rbs_process_log();
    id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
      -[RBProcessManager executeTerminateRequest:completion:].cold.1();
    }

    if (v7)
    {
      uint64_t v43 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      id v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v44 setObject:@"No such process found" forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v43 code:3 userInfo:v44];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, 0LL, v33);
      goto LABEL_81;
    }

    goto LABEL_82;
  }

  if ([v69 reportType] == 2 || objc_msgSend(v69, "reportType") == 3)
  {
    if ([v13 count] == 1)
    {
      [v13 anyObject];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      id v82 = 0LL;
      BOOL v34 = -[RBProcessManager _canTerminateProcess:withContext:error:]( self,  "_canTerminateProcess:withContext:error:",  v33,  v69,  &v82);
      id v35 = v82;
      if (v34)
      {
        uint64_t v36 = [v69 reportType];
        [v69 explanation];
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
        unsigned int v71 = [v69 exceptionDomain];
        uint64_t v38 = [v69 exceptionCode];
        [v69 additionalPayload];
        uint64_t v39 = v7;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v78[0] = MEMORY[0x1895F87A8];
        v78[1] = 3221225472LL;
        v78[2] = __55__RBProcessManager_executeTerminateRequest_completion___block_invoke;
        v78[3] = &unk_18A256E00;
        id v79 = v69;
        id v80 = v33;
        id v81 = v39;
        uint64_t v41 = v38;
        uint64_t v13 = v72;
        [v80 collectDiagnostic:v36 description:v37 domain:v71 code:v41 additionalPayload:v40 completion:v78];

        uint64_t v7 = (void (**)(id, void, void *))v39;
      }

      else if (v7)
      {
        v7[2](v7, 0LL, v35);
      }

      goto LABEL_81;
    }

    rbs_process_log();
    id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      -[RBProcessManager executeTerminateRequest:completion:].cold.2();
    }

    [v69 setReportType:1];
  }

  id v62 = v9;
  uint64_t v64 = v7;
  id v61 = v6;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  id v46 = v13;
  uint64_t v47 = [v46 countByEnumeratingWithState:&v74 objects:v95 count:16];
  if (!v47)
  {
    uint64_t v33 = 0LL;
    char v68 = 1;
    goto LABEL_75;
  }

  uint64_t v48 = v47;
  int v49 = v8;
  uint64_t v33 = 0LL;
  uint64_t v50 = *(void *)v75;
  uint64_t v65 = *MEMORY[0x1896075F0];
  uint64_t v66 = *MEMORY[0x1896124B0];
  char v68 = 1;
  audit_token_t v51 = v69;
  do
  {
    for (uint64_t k = 0LL; k != v48; ++k)
    {
      if (*(void *)v75 != v50) {
        objc_enumerationMutation(v46);
      }
      uint64_t v53 = *(void **)(*((void *)&v74 + 1) + 8 * k);
      id v73 = 0LL;
      BOOL v54 = -[RBProcessManager _canTerminateProcess:withContext:error:]( self,  "_canTerminateProcess:withContext:error:",  v53,  v51,  &v73);
      id v55 = v73;

      if (v54)
      {
        if ([v53 terminateWithContext:v51]) {
          goto LABEL_63;
        }
        rbs_process_log();
        v56 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v92 = (uint64_t)v53;
          _os_log_error_impl(&dword_188634000, v56, OS_LOG_TYPE_ERROR, "failed to terminate %{public}@", buf, 0xCu);
        }

        if ((v49 & 1) != 0)
        {
LABEL_63:
          uint64_t v33 = v55;
          continue;
        }

        [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        [v59 setObject:@"Termination failed" forKey:v65];
        [MEMORY[0x189607870] errorWithDomain:v66 code:5 userInfo:v59];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

        char v68 = 0;
      }

      else
      {
        rbs_process_log();
        v57 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          [v55 localizedFailureReason];
          id v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          uint64_t v92 = (uint64_t)v53;
          __int16 v93 = 2114;
          v94 = v58;
          _os_log_impl( &dword_188634000,  v57,  OS_LOG_TYPE_INFO,  "skipping %{public}@ for reason : %{public}@",  buf,  0x16u);
        }

        if (!v49)
        {
          char v68 = 0;
          uint64_t v33 = v55;
          audit_token_t v51 = v69;
          continue;
        }

        uint64_t v33 = 0LL;
        audit_token_t v51 = v69;
      }
    }

    uint64_t v48 = [v46 countByEnumeratingWithState:&v74 objects:v95 count:16];
  }

  while (v48);
LABEL_75:

  uint64_t v7 = v64;
  if (v64) {
    v64[2](v64, v68 & 1, v33);
  }
  id v6 = v61;
  id v9 = v62;
  uint64_t v13 = v72;
LABEL_81:

LABEL_82:
LABEL_83:
}

void __55__RBProcessManager_executeTerminateRequest_completion___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = *MEMORY[0x1896124B0];
    [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setObject:@"Diagnostic collection failed" forKey:*MEMORY[0x1896075F0]];
    uint64_t v8 = [MEMORY[0x189607870] errorWithDomain:v6 code:5 userInfo:v7];

    [*(id *)(a1 + 32) setReportType:1];
    id v5 = (id)v8;
  }

  if ([*(id *)(a1 + 40) terminateWithContext:*(void *)(a1 + 32)])
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
    }
  }

  else
  {
    rbs_process_log();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__RBProcessManager_executeTerminateRequest_completion___block_invoke_cold_1( a1 + 40,  v10,  v11,  v12,  v13,  v14,  v15,  v16);
    }

    uint64_t v17 = *(void *)(a1 + 48);
    if (v17)
    {
      uint64_t v18 = *MEMORY[0x1896124B0];
      [MEMORY[0x189603FC8] dictionaryWithCapacity:2];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 setObject:@"Termination failed" forKey:*MEMORY[0x1896075F0]];
      [MEMORY[0x189607870] errorWithDomain:v18 code:5 userInfo:v19];
      id v20 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0LL, v20);
    }
  }
}

- (id)busyExtensionInstancesFromSet:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  rbs_process_log();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v4;
    _os_log_impl(&dword_188634000, v5, OS_LOG_TYPE_INFO, "matching extension instances: %{public}@", buf, 0xCu);
  }

  uint64_t v6 = (void *)objc_opt_new();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  -[RBProcessIndex allProcesses](self->_processIndex, "allProcesses", 0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (([v12 isSuspended] & 1) == 0)
        {
          [v12 identity];
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v13 xpcServiceIdentifier];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v9);
  }

  return v6;
}

- (void)_enqueueGuaranteedRunningLaunchForIdentity:(id)a3 atTime:(double)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  RBSMachAbsoluteTime();
  double v8 = v7;
  dispatch_time_t v9 = dispatch_time(0LL, 0LL);
  double v10 = fmax(a4 - v8, 0.0);
  rbs_process_log();
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v23 = v6;
    __int16 v24 = 2048;
    double v25 = v10;
    _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_DEFAULT,  "Enqueueing GuaranteedRunning launch for %@ in %0.2fs",  buf,  0x16u);
  }

  uint64_t v16 = MEMORY[0x1895F87A8];
  uint64_t v17 = 3221225472LL;
  __int128 v18 = __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke;
  __int128 v19 = &unk_18A255B00;
  id v20 = self;
  id v12 = v6;
  id v21 = v12;
  uint64_t v13 = (void *)MEMORY[0x1895CA0E4](&v16);
  if (fabs(v10) >= 2.22044605e-16)
  {
    dispatch_time_t v15 = dispatch_time(v9, (uint64_t)(v10 * 1000000000.0));
    +[RBProcessManager stateApplicationQueue]( &OBJC_CLASS___RBProcessManager,  "stateApplicationQueue",  v16,  v17,  v18,  v19,  v20);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_after(v15, v14, v13);
  }

  else
  {
    +[RBProcessManager stateApplicationQueue]( &OBJC_CLASS___RBProcessManager,  "stateApplicationQueue",  v16,  v17,  v18,  v19,  v20);
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_async(v14, v13);
  }
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (uint64_t *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 112) valueForIdentity:*(void *)(a1 + 40)];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3 && [v3 guaranteedRunning])
  {
    [*(id *)(*(void *)(a1 + 32) + 88) processForIdentity:*(void *)(a1 + 40)];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {

LABEL_10:
      rbs_process_log();
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *v2;
        *(_DWORD *)buf = 138412290;
        uint64_t v34 = v14;
        _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_DEFAULT,  "Applying state after GuaranteedRunning launch of %@",  buf,  0xCu);
      }

      uint64_t v16 = *(void **)(a1 + 32);
      dispatch_time_t v15 = *(void **)(a1 + 40);
      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_67;
      v29[3] = &unk_18A255970;
      v29[4] = v16;
      id v30 = v15;
      id v31 = v4;
      [v16 _executeLifecycleEventForIdentity:v30 sync:0 withBlock:v29];

      goto LABEL_13;
    }

    [MEMORY[0x189612240] contextWithIdentity:*(void *)(a1 + 40)];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_time_t v9 = (void *)[objc_alloc(MEMORY[0x189612250]) initWithContext:v8];
    double v10 = *(void **)(a1 + 32);
    id v32 = 0LL;
    [v10 _executeLaunchRequest:v9 withError:&v32];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v32;
    if (v11)
    {

      goto LABEL_10;
    }

    rbs_process_log();
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v12)
    {
      if (v18) {
        __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_3( v2,  (uint64_t)v12,  v17);
      }

      if ([v12 code] != 6) {
        goto LABEL_26;
      }
      [v12 userInfo];
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[os_log_s objectForKey:](v17, "objectForKey:", *MEMORY[0x1896124D0]);
      double v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
      {
        rbs_general_log();
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_2();
        }
      }

      uint64_t v28 = *(void **)(a1 + 32);
      uint64_t v27 = *(void *)(a1 + 40);
      [v25 doubleValue];
      objc_msgSend(v28, "_enqueueGuaranteedRunningLaunchForIdentity:atTime:", v27);
    }

    else if (v18)
    {
      __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_1( (uint64_t)v2,  v17,  v19,  v20,  v21,  v22,  v23,  v24);
    }

LABEL_26:
    goto LABEL_13;
  }

  rbs_process_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *v2;
    *(_DWORD *)buf = 138412290;
    uint64_t v34 = v7;
    _os_log_impl( &dword_188634000,  v6,  OS_LOG_TYPE_DEFAULT,  "Bailing previously enqueued GuaranteedRunning launch of %@ because it is now out-of-state",  buf,  0xCu);
  }

LABEL_13:
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_67(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = v2;
    [v2 _applyState:a1[6]];
    uint64_t v2 = v3;
  }
}

- (void)didUpdateProcessStates:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  blocuint64_t k = a4;
  [v6 processIdentities];
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        [v6 processStateChangeForIdentity:v10];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 updatedState];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();

        id v13 = -[RBProcessMap setValue:forIdentity:](self->_processState, "setValue:forIdentity:", v12, v10);
        uint64_t v27 = 0LL;
        uint64_t v28 = &v27;
        uint64_t v29 = 0x3032000000LL;
        id v30 = __Block_byref_object_copy__5;
        id v31 = __Block_byref_object_dispose__5;
        -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v10);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        if (!v28[5] && [v12 guaranteedRunning]) {
          -[RBProcessManager _enqueueGuaranteedRunningLaunchForIdentity:atTime:]( self,  "_enqueueGuaranteedRunningLaunchForIdentity:atTime:",  v10,  0.0);
        }
        v24[0] = MEMORY[0x1895F87A8];
        v24[1] = 3221225472LL;
        v24[2] = __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke;
        v24[3] = &unk_18A256E28;
        uint64_t v26 = &v27;
        v24[4] = self;
        v24[5] = v10;
        id v14 = v12;
        id v25 = v14;
        -[RBProcessManager _executeLifecycleEventForIdentity:sync:withBlock:]( self,  "_executeLifecycleEventForIdentity:sync:withBlock:",  v10,  0LL,  v24);

        _Block_object_dispose(&v27, 8);
      }

      uint64_t v7 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    }

    while (v7);
  }

  if (block)
  {
    [MEMORY[0x1896123C0] currentContext];
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RBProcessManager stateApplicationQueue](&OBJC_CLASS___RBProcessManager, "stateApplicationQueue");
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = v16;
    if (v15)
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke_2;
      v20[3] = &unk_18A255F90;
      uint64_t v21 = (dispatch_queue_s *)obj;
      uint64_t v22 = self;
      id v23 = block;
      [v15 handoffToQueue:v17 block:v20];

      uint64_t v17 = v21;
    }

    else
    {
      dispatch_async(v16, block);
    }
  }
}

void *__54__RBProcessManager_didUpdateProcessStates_completion___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 88) processForIdentity:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  result = *(void **)(*(void *)(a1[7] + 8LL) + 40LL);
  if (result) {
    return (void *)[result _applyState:a1[6]];
  }
  return result;
}

uint64_t __54__RBProcessManager_didUpdateProcessStates_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend( *(id *)(a1 + 40),  "_executeLifecycleEventForIdentity:sync:withBlock:",  *(void *)(*((void *)&v9 + 1) + 8 * v6++),  1,  &__block_literal_global_70,  (void)v9);
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v4);
  }

  +[RBProcess processStateApplicationQueue](&OBJC_CLASS___RBProcess, "processStateApplicationQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_async_and_wait(v7, &__block_literal_global_71);

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)applySystemState:(id)a3
{
  id v11 = a3;
  os_unfair_lock_lock(&self->_lock);
  [v11 prewarmConfiguration];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBSystemState prewarmConfiguration](self->_systemState, "prewarmConfiguration");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
  }

  else
  {
    uint64_t v6 = v5;
    if (v4 && v5)
    {
      char v7 = [v4 isEqual:v5];

      if ((v7 & 1) != 0) {
        goto LABEL_10;
      }
    }

    else
    {
    }

    prewarmManager = self->_prewarmManager;
    [v11 prewarmConfiguration];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBPrewarmManager prewarmingConfigurationDidChange:](prewarmManager, "prewarmingConfigurationDidChange:", v4);
  }

LABEL_10:
  __int128 v9 = (RBSystemState *)[v11 copy];
  systemState = self->_systemState;
  self->_systemState = v9;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeStateForProcessIdentity:(id)a3
{
}

- (NSString)stateCaptureTitle
{
  id v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_processForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v4);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[RBProcessIndex processForIdentifier:](self->_processGraveyard, "processForIdentifier:", v4);
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

- (id)_processForInstance:(id)a3
{
  id v4 = a3;
  [v4 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessManager _processForIdentifier:](self, "_processForIdentifier:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 instance];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v7 isEqual:v4];

  if ((v8 & 1) == 0)
  {

    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)_resolveProcessWithIdentifier:(id)a3 auditToken:(id)a4 properties:(id *)a5
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  uint64_t v9 = objc_msgSend(a3, "rbs_pid");
  if ((int)v9 >= 1)
  {
    uint64_t v10 = v9;
    +[RBLaunchdProperties propertiesForPid:](&OBJC_CLASS___RBLaunchdProperties, "propertiesForPid:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v12 = v11;
    if (a5) {
      *a5 = v11;
    }
    if (v8)
    {
      [v8 realToken];
    }

    else
    {
      [MEMORY[0x189612268] taskNameForPID:v10];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 auditToken];
      dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = v15;
      if (v15) {
        [v15 realToken];
      }
      else {
        memset(&buf, 0, sizeof(buf));
      }
      audit_token_t v47 = buf;
    }

    if ([v12 hasVariableEUID])
    {
      rbs_process_log();
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        buf.val[0] = 67109120;
        buf.val[1] = v10;
        _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_DEFAULT,  "Process %d has variable EUID - just use AUID/EUID 0",  (uint8_t *)&buf,  8u);
      }
    }

    else
    {
      audit_token_t buf = v47;
      if (RBSRealAuditTokenValid())
      {
        audit_token_t buf = v47;
        uid_t v18 = audit_token_to_euid(&buf);
        audit_token_t buf = v47;
        uid_t v19 = audit_token_to_auid(&buf);
        if (v19 + 1 >= 2) {
          uint64_t v20 = v19;
        }
        else {
          uint64_t v20 = v18;
        }
        rbs_process_log();
        uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          buf.val[0] = 67109632;
          buf.val[1] = v10;
          LOWORD(buf.val[2]) = 1024;
          *(unsigned int *)((char *)&buf.val[2] + 2) = v18;
          HIWORD(buf.val[3]) = 1024;
          buf.val[4] = v20;
          _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_DEFAULT,  "_resolveProcessWithIdentifier pid %d euid %d auid %d",  (uint8_t *)&buf,  0x14u);
        }

- (void)_executeLifecycleEventForIdentity:(id)a3 sync:(BOOL)a4 withBlock:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (!v9)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1104, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }

  -[RBProcessManager _getLifecycleQueueForIdentity:](self, "_getLifecycleQueueForIdentity:", v9);
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  __int128 v12 = v11;
  if (v6)
  {
    dispatch_async_and_wait(v11, v10);
    -[RBProcessManager _releaseLifecycleQueueForIdentity:](self, "_releaseLifecycleQueueForIdentity:", v9);
  }

  else
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__RBProcessManager__executeLifecycleEventForIdentity_sync_withBlock___block_invoke;
    block[3] = &unk_18A256E90;
    id v17 = v10;
    block[4] = self;
    id v16 = v9;
    dispatch_block_t v13 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, block);
    dispatch_async(v12, v13);
  }
}

uint64_t __69__RBProcessManager__executeLifecycleEventForIdentity_sync_withBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _releaseLifecycleQueueForIdentity:*(void *)(a1 + 40)];
}

- (id)_getLifecycleQueueForIdentity:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1123, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }

  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_identityToProcessLifecycleQueue, "objectForKey:", v5);
  BOOL v6 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (-[NSCountedSet countForObject:](self->_lifecycleQueuesInUse, "countForObject:", v5)) {
      -[RBProcessManager _getLifecycleQueueForIdentity:].cold.1();
    }
    char v7 = (void *)NSString;
    [v5 shortDescription];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 stringWithFormat:@"com.apple.runningboard.process-manager.%@", v8];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v10);
    id v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();

    id v12 = v9;
    BOOL v6 = dispatch_queue_create((const char *)[v12 UTF8String], v11);
    dispatch_set_qos_class_fallback();
    -[NSMutableDictionary setObject:forKey:](self->_identityToProcessLifecycleQueue, "setObject:forKey:", v6, v5);
    dispatch_activate(v6);
  }

  -[NSCountedSet addObject:](self->_lifecycleQueuesInUse, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);
  if (!v6)
  {
    [MEMORY[0x1896077D8] currentHandler];
    dispatch_time_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 handleFailureInMethod:a2 object:self file:@"RBProcessManager.m" lineNumber:1144 description:@"must return a queue"];
  }

  return v6;
}

- (void)_releaseLifecycleQueueForIdentity:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    [MEMORY[0x1896077D8] currentHandler];
    char v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1149, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }

  os_unfair_lock_lock_with_options();
  NSUInteger v5 = -[NSCountedSet countForObject:](self->_lifecycleQueuesInUse, "countForObject:", v8);
  if (!v5) {
    -[RBProcessManager _releaseLifecycleQueueForIdentity:].cold.1();
  }
  NSUInteger v6 = v5;
  -[NSCountedSet removeObject:](self->_lifecycleQueuesInUse, "removeObject:", v8);
  if (v6 == 1) {
    -[NSMutableDictionary removeObjectForKey:](self->_identityToProcessLifecycleQueue, "removeObjectForKey:", v8);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)_lifecycleQueue_addProcessWithInstance:(id)a3 properties:(id)a4
{
  uint64_t v75 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v59 = a4;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    id v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v46 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1165, @"Invalid parameter not satisfying: %@", @"instance" object file lineNumber description];
  }

  uint64_t v67 = 0LL;
  char v68 = &v67;
  uint64_t v69 = 0x3032000000LL;
  v70 = __Block_byref_object_copy__5;
  unsigned int v71 = __Block_byref_object_dispose__5;
  [v7 identity];
  id v72 = (id)objc_claimAutoreleasedReturnValue();
  [v7 identifier];
  id v58 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v68[5])
  {
    [MEMORY[0x1896077D8] currentHandler];
    audit_token_t v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1168, @"Invalid parameter not satisfying: %@", @"identity" object file lineNumber description];
  }

  if (!v58)
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
    [v48 handleFailureInMethod:a2, self, @"RBProcessManager.m", 1169, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  if ([v59 isDaemon])
  {
    uint64_t v8 = 2LL;
  }

  else
  {
    uint64_t v8 = 3LL;
  }

  [(id)v68[5] setOsServiceType:v8];
LABEL_12:
  os_unfair_lock_lock(&self->_pendingExitBlockLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_identityToPendingExitBlock, "objectForKeyedSubscript:", v68[5]);
  v57 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_pendingExitBlockLock);
  processIndex = self->_processIndex;
  [v7 identifier];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBProcessIndex processForIdentifier:](processIndex, "processForIdentifier:", v10);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  rbs_ttl_log();
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl(&dword_188634000, v12, OS_LOG_TYPE_DEFAULT, "existingInstance is: %{public}@", buf, 0xCu);
  }

  if (v11
    && ([v11 identity],
        dispatch_block_t v13 = (void *)objc_claimAutoreleasedReturnValue(),
        int v14 = [v13 isExtension],
        v13,
        v14))
  {
    rbs_process_log();
    dispatch_time_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.4( (uint64_t)v11,  buf,  objc_msgSend(v11, "rbs_pid"),  v15);
    }

    id v16 = v11;
  }

  else
  {
    v56 = -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v68[5]);
    if (v57)
    {
      if (v56)
      {
        [v56 handle];
        id v17 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 pid];
        int v18 = RBSPIDExists();

        if (v18)
        {
          rbs_process_log();
          uid_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.3();
          }
        }
      }

      rbs_process_log();
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = v68[5];
        *(_DWORD *)audit_token_t buf = 138543618;
        *(void *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v56;
        _os_log_impl( &dword_188634000,  v20,  OS_LOG_TYPE_DEFAULT,  "New process with identity (%{public}@) detected with pending exit from a prior process (%{public}@).  Forcing cleanup of the prior instance immediately.",  buf,  0x16u);
      }

      v57[2]();
    }

    objc_msgSend(MEMORY[0x189612268], "taskNameForPID:", objc_msgSend(v7, "rbs_pid"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v23 = [v22 auditToken];
    uint64_t v24 = (void *)v23;
    if (v22 && v23)
    {
      id v25 = self->_processIndex;
      objc_msgSend(MEMORY[0x189607968], "numberWithInt:", objc_msgSend(v59, "hostPid"));
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBProcessIndex processForIdentifier:](v25, "processForIdentifier:", v26);
      id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      -[RBProcessMap valueForIdentity:](self->_processState, "valueForIdentity:", v68[5]);
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBBundlePropertiesManaging propertiesForIdentity:identifier:]( self->_bundlePropertiesManager,  "propertiesForIdentity:identifier:",  v68[5],  v58);
      BOOL v54 = (void *)objc_claimAutoreleasedReturnValue();
      jetsamPropertytManager = self->_jetsamPropertytManager;
      uint64_t v28 = objc_msgSend(v58, "rbs_pid");
      uint64_t v29 = v68[5];
      [v24 realToken];
      -[RBJetsamPropertyManaging jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:]( jetsamPropertytManager,  "jetsamPropertiesForProcess:identity:bundleProperties:isPlatformBinary:",  v28,  v29,  v54,  RBSAuditTokenRepresentsPlatformBinary());
      audit_token_t v51 = (void *)objc_claimAutoreleasedReturnValue();
      id v30 = objc_alloc(&OBJC_CLASS___RBProcess);
      LOBYTE(v49) = self->_systemPreventsIdleSleep;
      id v16 = -[RBProcess _initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemPreventsIdleSleep:]( v30,  "_initWithInstance:auditToken:bundleProperties:jetsamProperties:initialState:hostProcess:properties:systemP reventsIdleSleep:",  v7,  v24,  v54,  v51,  v53,  v55,  v59,  v49);
      if (v16)
      {
        rbs_ttl_log();
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)audit_token_t buf = 138543362;
          *(void *)&uint8_t buf[4] = v16;
          _os_log_impl(&dword_188634000, v31, OS_LOG_TYPE_DEFAULT, "Now tracking process: %{public}@", buf, 0xCu);
        }

        id v32 = self->_processIndex;
        id v66 = 0LL;
        -[RBProcessIndex addProcess:existingProcess:](v32, "addProcess:existingProcess:", v16, &v66);
        id v52 = v66;
        rbs_ttl_log();
        __int128 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)audit_token_t buf = 138543362;
          *(void *)&uint8_t buf[4] = v52;
          _os_log_impl( &dword_188634000,  v33,  OS_LOG_TYPE_DEFAULT,  "existingProcess in RBProcessManager is: %{public}@",  buf,  0xCu);
        }

        -[RBHistoricalStatisticsMaintaining notifyProcessCount:]( self->_historicalStatistics,  "notifyProcessCount:",  -[RBProcessIndex count](self->_processIndex, "count"));
        if (v52)
        {
          os_unfair_lock_lock(&self->_pendingExitBlockLock);
          identityToPendingExitBlocuint64_t k = self->_identityToPendingExitBlock;
          [v52 identity];
          __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](identityToPendingExitBlock, "objectForKeyedSubscript:", v35);
          __int128 v36 = (void (**)(void))objc_claimAutoreleasedReturnValue();

          os_unfair_lock_unlock(&self->_pendingExitBlockLock);
          if (v36)
          {
            rbs_process_log();
            int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)audit_token_t buf = 138543618;
              *(void *)&uint8_t buf[4] = v52;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v16;
              _os_log_impl( &dword_188634000,  v37,  OS_LOG_TYPE_DEFAULT,  "Cleaning up (%{public}@) which was exec'ed into (%{public}@)",  buf,  0x16u);
            }

            v36[2](v36);
          }
        }

        -[RBProcessManager _getLifecycleQueueForIdentity:](self, "_getLifecycleQueueForIdentity:", v68[5]);
        uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v38 = (dispatch_queue_s *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
        uint64_t v39 = MEMORY[0x1895F87A8];
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke;
        block[3] = &unk_18A255B00;
        block[4] = self;
        id v40 = v16;
        id v65 = v40;
        dispatch_async(v38, block);

        -[RBProcessManagerDelegate processManager:didAddProcess:withState:]( self->_delegate,  "processManager:didAddProcess:withState:",  self,  v40,  v53);
        *(void *)audit_token_t buf = 0LL;
        *(void *)&uint8_t buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000LL;
        char v74 = 0;
        v60[0] = v39;
        v60[1] = 3221225472LL;
        v60[2] = __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke_2;
        v60[3] = &unk_18A256EB8;
        id v62 = buf;
        v60[4] = self;
        v63 = &v67;
        id v41 = v40;
        id v61 = v41;
        dispatch_block_t v42 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v60);
        os_unfair_lock_lock(&self->_pendingExitBlockLock);
        uint64_t v43 = (void *)MEMORY[0x1895CA0E4](v42);
        -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_identityToPendingExitBlock,  "setObject:forKeyedSubscript:",  v43,  v68[5]);

        os_unfair_lock_unlock(&self->_pendingExitBlockLock);
        -[RBLaunchdJobManager invokeOnProcessDeath:handler:onQueue:]( self->_jobManager,  "invokeOnProcessDeath:handler:onQueue:",  v41,  v42,  v50);
        id v44 = v41;

        _Block_object_dispose(buf, 8);
      }

      else
      {
        rbs_process_log();
        id v52 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_ERROR)) {
          -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.2();
        }
      }
    }

    else
    {
      rbs_process_log();
      id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[RBProcessManager _lifecycleQueue_addProcessWithInstance:properties:].cold.1();
      }
      id v16 = 0LL;
    }
  }

  _Block_object_dispose(&v67, 8);
  return v16;
}

id __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(*(void *)(a1 + 32) + 24) entitlementsForProcess:*(void *)(a1 + 40)];
}

void __70__RBProcessManager__lifecycleQueue_addProcessWithInstance_properties___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    [*(id *)(*(void *)(a1 + 32) + 112) valueForIdentity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 76LL));
    [*(id *)(*(void *)(a1 + 32) + 120) removeObjectForKey:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 76LL));
    [*(id *)(a1 + 32) _removeProcess:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _releaseLifecycleQueueForIdentity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    if ([v3 guaranteedRunning])
    {
      rbs_process_log();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
        int v6 = 138412290;
        uint64_t v7 = v5;
        _os_log_impl( &dword_188634000,  v4,  OS_LOG_TYPE_DEFAULT,  "Exiting process %@ is GuaranteedRunning",  (uint8_t *)&v6,  0xCu);
      }

      [*(id *)(a1 + 32) _enqueueGuaranteedRunningLaunchForIdentity:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) atTime:0.0];
    }
  }

- (void)_removeProcess:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  rbs_process_log();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)audit_token_t buf = 138543362;
    id v17 = v4;
    _os_log_impl(&dword_188634000, v5, OS_LOG_TYPE_DEFAULT, "Removing process: %{public}@", buf, 0xCu);
  }

  [v4 invalidate];
  -[RBProcessIndex addProcess:](self->_processGraveyard, "addProcess:", v4);
  -[RBProcessIndex removeProcess:](self->_processIndex, "removeProcess:", v4);
  -[RBHistoricalStatisticsMaintaining notifyProcessCount:]( self->_historicalStatistics,  "notifyProcessCount:",  -[RBProcessIndex count](self->_processIndex, "count"));
  id v6 = (id)[v4 lastExitContext];
  jobManager = self->_jobManager;
  [v4 instance];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  BOOL v9 = -[RBLaunchdJobManager removeJobWithInstance:error:](jobManager, "removeJobWithInstance:error:", v8, &v15);
  id v10 = v15;

  if (!v9)
  {
    rbs_process_log();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v4 shortDescription];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)audit_token_t buf = 138543618;
      id v17 = v12;
      __int16 v18 = 2114;
      id v19 = v10;
      _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Error deleting launchd job: <%{public}@>",  buf,  0x16u);
    }
  }

  -[RBProcessManagerDelegate processManager:didRemoveProcess:]( self->_delegate,  "processManager:didRemoveProcess:",  self,  v4);
  -[RBBundlePropertiesManaging removeProcess:](self->_bundlePropertiesManager, "removeProcess:", v4);
  prewarmManager = self->_prewarmManager;
  [v4 identity];
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBPrewarmManager identityDidTerminate:](prewarmManager, "identityDidTerminate:", v14);
}

- (void).cxx_destruct
{
}

- (void)_processForIdentifier:withAuditToken:forceStartTracking:.cold.1()
{
}

- (void)_processForIdentifier:(uint64_t)a3 withAuditToken:(os_log_s *)a4 forceStartTracking:.cold.2( void *a1,  uint64_t a2,  uint64_t a3,  os_log_s *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_13( &dword_188634000,  a4,  a3,  "AUID of process has changed from %{public}@ to %{public}@",  (uint8_t *)a3);
}

- (void)executeTerminateRequest:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_188634000, v0, OS_LOG_TYPE_DEBUG, "no process found to terminate : %{public}@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

- (void)executeTerminateRequest:completion:.cold.2()
{
}

- (void)executeTerminateRequest:completion:.cold.3()
{
}

void __55__RBProcessManager_executeTerminateRequest_completion___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_2()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_13( &dword_188634000,  v1,  (uint64_t)v1,  "Backoff triggered without backoff time %{public}@ : %{public}@",  v2);
  OUTLINED_FUNCTION_1_1();
}

void __70__RBProcessManager__enqueueGuaranteedRunningLaunchForIdentity_atTime___block_invoke_cold_3( uint64_t *a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Failed GuaranteedRunning launch of %@ because of %@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_resolveProcessWithIdentifier:(int)a1 auditToken:(os_log_s *)a2 properties:.cold.1(int a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl( &dword_188634000,  a2,  OS_LOG_TYPE_FAULT,  "failed to determine identity for pid=%d",  (uint8_t *)v2,  8u);
}

- (void)_resolveProcessWithIdentifier:(uint64_t)a1 auditToken:(int)a2 properties:(os_log_t)log .cold.2( uint64_t a1,  int a2,  os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_fault_impl( &dword_188634000,  log,  OS_LOG_TYPE_FAULT,  "_resolveProcessWithIdentifier could not get auid/euid for pid %d auditToken %{public}@",  (uint8_t *)v3,  0x12u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_getLifecycleQueueForIdentity:.cold.1()
{
  __assert_rtn( "-[RBProcessManager _getLifecycleQueueForIdentity:]",  "RBProcessManager.m",  1132,  "[_lifecycleQueuesInUse countForObject:identity] == 0");
}

- (void)_releaseLifecycleQueueForIdentity:.cold.1()
{
  __assert_rtn("-[RBProcessManager _releaseLifecycleQueueForIdentity:]", "RBProcessManager.m", 1154, "countBefore != 0");
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.1()
{
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.2()
{
}

- (void)_lifecycleQueue_addProcessWithInstance:properties:.cold.3()
{
}

- (void)_lifecycleQueue_addProcessWithInstance:(int)a3 properties:(os_log_t)log .cold.4( uint64_t a1,  uint8_t *buf,  int a3,  os_log_t log)
{
  *(_DWORD *)audit_token_t buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "We already have an extension %@ with this pid: %d, were two launches for the same extension executed? Returning the existing instance.",  buf,  0x12u);
}

@end