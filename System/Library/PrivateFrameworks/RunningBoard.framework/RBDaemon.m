@interface RBDaemon
+ (id)_sharedInstance;
+ (void)run;
- (NSString)debugDescription;
- (NSString)description;
- (RBAssertionManaging)assertionManager;
- (RBAssertionOriginatorPidPersisting)assertionOriginatorPidStore;
- (RBDaemon)init;
- (RBDomainAttributeManaging)domainAttributeManager;
- (RBEntitlementManaging)entitlementManager;
- (RBExtensionDataProviding)extensionDataProvider;
- (RBHistoricalStatisticsMaintaining)historicalStatistics;
- (RBJetsamPropertyManaging)jetsamPropertyManager;
- (RBProcess)process;
- (RBProcessManaging)processManager;
- (RBProcessMonitoring)processMonitor;
- (RBRequestManaging)requestManager;
- (RBStateCaptureManaging)stateCaptureManager;
- (uint64_t)setLowDiskIOPolicy;
- (void)_start;
- (void)assertionManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5;
- (void)assertionManager:(id)a3 didBeginTrackingInFightUpdatesForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didBeginTrackingStateForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didEndTrackingInFightUpdatesForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didEndTrackingStateForProcessIdentity:(id)a4;
- (void)assertionManager:(id)a3 didInvalidateAssertions:(id)a4;
- (void)assertionManager:(id)a3 didRejectAcquisitionFromOriginatorWithExcessiveAssertions:(id)a4;
- (void)assertionManager:(id)a3 didRemoveProcess:(id)a4 withState:(id)a5;
- (void)assertionManager:(id)a3 didResolveSystemState:(id)a4;
- (void)assertionManager:(id)a3 didUpdateProcessStates:(id)a4 completion:(id)a5;
- (void)assertionManager:(id)a3 willExpireAssertionsSoonForProcess:(id)a4 expirationTime:(double)a5;
- (void)assertionManager:(id)a3 willInvalidateAssertion:(id)a4;
- (void)bundlePropertiesManager:(id)a3 didChangePropertiesForProcessIdentities:(id)a4;
- (void)emitAssertionSignpostForTimeout:(uint64_t)a1;
- (void)powerAssertionManagerDidAllowIdleSleep:(id)a3;
- (void)powerAssertionManagerDidPreventIdleSleep:(id)a3;
- (void)processManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5;
- (void)processManager:(id)a3 didReconnectProcesses:(id)a4;
- (void)processManager:(id)a3 didRemoveProcess:(id)a4;
- (void)setLowDiskIOPolicy;
- (void)watchdogRegister;
@end

@implementation RBDaemon

+ (void)run
{
  if (run_onceToken != -1) {
    dispatch_once(&run_onceToken, &__block_literal_global_21);
  }
}

void __15__RBDaemon_run__block_invoke()
{
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  -[RBDaemon _start]((uint64_t)v0);
}

+ (id)_sharedInstance
{
  if (_sharedInstance_onceToken != -1) {
    dispatch_once(&_sharedInstance_onceToken, &__block_literal_global_32);
  }
  return (id)_sharedInstance___sharedInstance;
}

- (void)_start
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    rbs_general_log();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188634000, v2, OS_LOG_TYPE_DEFAULT, "Battlecruiser operational.", buf, 2u);
    }

    -[RBDaemon setLowDiskIOPolicy](a1);
    -[RBDaemon watchdogRegister](a1);
    [MEMORY[0x189607870] _setFileNameLocalizationEnabled:0];
    [MEMORY[0x1896079D8] processInfo];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 environment];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 objectForKey:@"XPC_SERVICE_NAME"];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = +[RBLaunchdJobManager lastExitStatusForLabel:error:]( &OBJC_CLASS___RBLaunchdJobManager,  "lastExitStatusForLabel:error:",  v5,  0LL);
    if ([v6 isValid])
    {
      rbs_general_log();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v68 = v6;
        _os_log_impl(&dword_188634000, v7, OS_LOG_TYPE_DEFAULT, "Back online after last exit: %{public}@", buf, 0xCu);
      }
    }

    [MEMORY[0x1896121C0] setInDaemon];
    v8 = objc_alloc_init(&OBJC_CLASS___RBStateCaptureManager);
    v9 = *(void **)(a1 + 104);
    *(void *)(a1 + 104) = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___RBPowerAssertionManager);
    v11 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = v10;

    [*(id *)(a1 + 72) setDelegate:a1];
    RBSPathForSystemDirectory();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 stringByAppendingPathComponent:@"LifecyclePolicy"];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 stringByAppendingPathComponent:@"DomainAttributes"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = -[RBDomainAttributeManagerDataProvider initWithPath:]( objc_alloc(&OBJC_CLASS___RBDomainAttributeManagerDataProvider),  "initWithPath:",  v14);
    v16 = -[RBDomainAttributeManager initWithDataProvider:]( objc_alloc(&OBJC_CLASS___RBDomainAttributeManager),  "initWithDataProvider:",  v15);
    v17 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = v16;

    v18 = objc_alloc(&OBJC_CLASS___RBEntitlementManager);
    [*(id *)(a1 + 32) allEntitlements];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = -[RBEntitlementManager initWithDomainAttributeEntitlements:](v18, "initWithDomainAttributeEntitlements:", v19);
    v21 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v20;

    v22 = -[RBJetsamPropertyManager initWithEntitlementManager:]( objc_alloc(&OBJC_CLASS___RBJetsamPropertyManager),  "initWithEntitlementManager:",  *(void *)(a1 + 48));
    v23 = *(void **)(a1 + 56);
    *(void *)(a1 + 56) = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___RBBundlePropertiesManager);
    v25 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v24;

    [*(id *)(a1 + 40) setDelegate:a1];
    v26 = objc_alloc_init(&OBJC_CLASS___RBAssertionDescriptorValidator);
    v27 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v26;

    v28 = -[RBAssertionOriginatorPidStore initWithPath:]( objc_alloc(&OBJC_CLASS___RBAssertionOriginatorPidStore),  "initWithPath:",  @"/runningboard");
    v29 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v28;

    v30 = -[RBHistoricalStatistics initWithReportFrequency:]( objc_alloc(&OBJC_CLASS___RBHistoricalStatistics),  "initWithReportFrequency:",  30LL);
    v31 = *(void **)(a1 + 128);
    *(void *)(a1 + 128) = v30;

    v32 = objc_alloc(&OBJC_CLASS___RBProcessManager);
    uint64_t v33 = *(void *)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 48);
    uint64_t v35 = *(void *)(a1 + 56);
    v36 = +[RBTimeProvider sharedInstance](&OBJC_CLASS___RBTimeProvider, "sharedInstance");
    uint64_t v37 = -[RBProcessManager initWithBundlePropertiesManager:entitlementManager:jetsamPropertytManager:timeProvider:historialStatistics:delegate:]( v32,  "initWithBundlePropertiesManager:entitlementManager:jetsamPropertytManager:timeProvider:historialStatistics:delegate:",  v33,  v34,  v35,  v36,  *(void *)(a1 + 128),  a1);
    v38 = *(void **)(a1 + 80);
    *(void *)(a1 + 80) = v37;

    v39 = objc_alloc(&OBJC_CLASS___RBAssertionManager);
    uint64_t v40 = *(void *)(a1 + 40);
    uint64_t v41 = *(void *)(a1 + 24);
    uint64_t v42 = *(void *)(a1 + 8);
    v43 = +[RBTimeProvider sharedInstance](&OBJC_CLASS___RBTimeProvider, "sharedInstance");
    uint64_t v44 = -[RBAssertionManager initWithDelegate:bundlePropertiesManager:originatorPidStore:assertionDescriptorValidator:timeProvider:daemonContext:maxOperationsInFlight:maxAssertionsPerOriginator:]( v39,  "initWithDelegate:bundlePropertiesManager:originatorPidStore:assertionDescriptorValidator:timeProvider:daemon Context:maxOperationsInFlight:maxAssertionsPerOriginator:",  a1,  v40,  v41,  v42,  v43,  a1,  50LL,  2000LL);
    v45 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v44;

    v46 = objc_alloc(&OBJC_CLASS___RBProcessReconnectManager);
    [(id)a1 process];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v48 = -[RBProcessReconnectManager initWithDaemonContext:originatorProcess:]( v46,  "initWithDaemonContext:originatorProcess:",  a1,  v47);
    v49 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = v48;

    v50 = objc_alloc_init(&OBJC_CLASS___RBThrottleBestEffortNetworkingManager);
    v51 = *(void **)(a1 + 112);
    *(void *)(a1 + 112) = v50;
    v52 = +[RBResourceViolationHandler sharedInstance]();
    -[RBResourceViolationHandler startWithAssertionManager:]((uint64_t)v52, *(void **)(a1 + 16));

    v53 = objc_alloc(&OBJC_CLASS___RBProcessMonitor);
    uint64_t v54 = *(void *)(a1 + 104);
    uint64_t v55 = *(void *)(a1 + 128);
    v56 = objc_alloc_init(&OBJC_CLASS___RBXNUWrapper);
    uint64_t v57 = -[RBProcessMonitor initWithStateCaptureManager:historialStatistics:xnuWrapper:]( v53,  "initWithStateCaptureManager:historialStatistics:xnuWrapper:",  v54,  v55,  v56);
    v58 = *(void **)(a1 + 88);
    *(void *)(a1 + 88) = v57;

    id v59 = -[RBConnectionListener initWithContext:](objc_alloc(&OBJC_CLASS___RBConnectionListener), (void *)a1);
    v60 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = v59;

    v61 = objc_alloc_init(&OBJC_CLASS___RBExtensionDataProvider);
    v62 = *(void **)(a1 + 144);
    *(void *)(a1 + 144) = v61;

    v63 = -[RBRequestManager initWithContext:](objc_alloc(&OBJC_CLASS___RBRequestManager), "initWithContext:", a1);
    v64 = *(void **)(a1 + 152);
    *(void *)(a1 + 152) = v63;

    v65 = *(void **)(a1 + 136);
    *(void *)(a1 + 136) = 0LL;

    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 16) withIdentifier:@"assertion"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 64) withIdentifier:@"connection"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 32) withIdentifier:@"domain"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 48) withIdentifier:@"entitlements"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 24) withIdentifier:@"originatorpids"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 72) withIdentifier:@"power"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 80) withIdentifier:@"process"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 40) withIdentifier:@"bundles"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 112) withIdentifier:@"throttleBestEffort"];
    [*(id *)(a1 + 104) addItem:*(void *)(a1 + 88) withIdentifier:@"processMonitor"];
    [*(id *)(a1 + 80) start];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x189612420], 0LL, 0LL, 1u);
  }

- (RBDaemon)init
{
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBDaemon.m" lineNumber:124 description:@"-init is not allowed on RBDaemon"];

  return 0LL;
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%@: %p>", objc_opt_class(), self];
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend( NSString,  "stringWithFormat:",  @"<%@: %p; listener=%p assertions=%p processes=%p monitor=%p>",
                       objc_opt_class(),
                       self,
                       self->_listener,
                       self->_assertionManager,
                       self->_processManager,
                       self->_processMonitor);
}

- (void)assertionManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5
{
}

- (void)assertionManager:(id)a3 didUpdateProcessStates:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  processManager = self->_processManager;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __63__RBDaemon_assertionManager_didUpdateProcessStates_completion___block_invoke;
  v12[3] = &unk_18A255F90;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  -[RBProcessManager didUpdateProcessStates:completion:](processManager, "didUpdateProcessStates:completion:", v11, v12);
  -[RBCoalitionManager didUpdateProcessStates:](self->_coalitionManager, "didUpdateProcessStates:", v11);
  -[RBPowerAssertionManager didUpdateProcessStates:](self->_powerAssertionManager, "didUpdateProcessStates:", v11);
  -[RBThrottleBestEffortNetworkingManager didUpdateProcessStates:]( self->_throttleBestEffortNetworkingManager,  "didUpdateProcessStates:",  v11);
  -[RBProcessMonitor didUpdateProcessStates:](self->_processMonitor, "didUpdateProcessStates:", v11);
}

uint64_t __63__RBDaemon_assertionManager_didUpdateProcessStates_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = -[RBConnectionListener readyClients](*(os_unfair_lock_s **)(*(void *)(a1 + 32) + 64LL));
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        -[RBConnectionClient didUpdateProcessStates:](*(void *)(*((void *)&v8 + 1) + 8 * v6++), *(void **)(a1 + 40));
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v4);
  }

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(result + 16))(result);
  }
  return result;
}

- (void)assertionManager:(id)a3 didResolveSystemState:(id)a4
{
  processManager = self->_processManager;
  id v6 = a4;
  -[RBProcessManager applySystemState:](processManager, "applySystemState:", v6);
  -[RBPowerAssertionManager applySystemState:](self->_powerAssertionManager, "applySystemState:", v6);
  processMonitor = self->_processMonitor;
  [v6 preventLaunchPredicates];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  -[RBProcessMonitor didResolvePreventLaunchPredicates:](processMonitor, "didResolvePreventLaunchPredicates:", v8);
}

- (void)assertionManager:(id)a3 didRemoveProcess:(id)a4 withState:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  id v8 = a5;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[RBConnectionClient didRemoveProcess:withState:](*(void *)(*((void *)&v14 + 1) + 8 * v13++), v7);
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v11);
  }

  -[RBProcessMonitor didRemoveProcess:withState:]( self->_processMonitor,  "didRemoveProcess:withState:",  v7,  v8,  (void)v14);
}

- (void)assertionManager:(id)a3 willExpireAssertionsSoonForProcess:(id)a4 expirationTime:(double)a5
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v7 = a4;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[RBConnectionClient willExpireAssertionsSoonForProcess:expirationTime:]( *(void *)(*((void *)&v13 + 1) + 8 * v12++),  v7,  a5);
      }

      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v10);
  }
}

- (void)assertionManager:(id)a3 willInvalidateAssertion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[RBConnectionClient willInvalidateAssertion:](*(void *)(*((void *)&v11 + 1) + 8 * v10++), v5);
      }

      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v8);
  }
}

- (void)assertionManager:(id)a3 didInvalidateAssertions:(id)a4
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v32 = *(void *)v40;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v40 != v32) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        -[RBProcessReconnectManager didInvalidateAssertion:](self->_reconnectManager, "didInvalidateAssertion:", v9);
        [v9 target];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identity];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

        int v12 = [v9 invalidationReason];
        -[RBProcessManager processForIdentity:](self->_processManager, "processForIdentity:", v11);
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          processManager = self->_processManager;
          [v9 originator];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend( v9,  "terminationContextForTargetProcess:originatorProcessIsActive:",  v13,  -[RBProcessManager isActiveProcess:](processManager, "isActiveProcess:", v15));
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = [v9 endPolicy];
          else {
            BOOL v18 = 0;
          }
          if (v18 && v17 == 2) {
            -[RBDaemon emitAssertionSignpostForTimeout:]((uint64_t)self, v9);
          }
          if (v16)
          {
            id v20 = objc_alloc(MEMORY[0x1896123A0]);
            v21 = (void *)MEMORY[0x189612320];
            [v13 identifier];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v21 predicateMatchingIdentifier:v22];
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (void *)[v20 initWithPredicate:v23 context:v16];

            v25 = (dispatch_queue_s *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
            block[0] = MEMORY[0x1895F87A8];
            block[1] = 3221225472LL;
            block[2] = __53__RBDaemon_assertionManager_didInvalidateAssertions___block_invoke;
            block[3] = &unk_18A255B00;
            block[4] = self;
            id v38 = v24;
            id v26 = v24;
            dispatch_async(v25, block);
          }
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v39 objects:v44 count:16];
    }

    while (v7);
  }

  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  v27 = -[RBConnectionListener readyClients]((os_unfair_lock_s *)self->_listener);
  uint64_t v28 = [v27 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v34;
    do
    {
      for (uint64_t j = 0LL; j != v29; ++j)
      {
        if (*(void *)v34 != v30) {
          objc_enumerationMutation(v27);
        }
        -[RBConnectionClient didInvalidateAssertions:](*(void *)(*((void *)&v33 + 1) + 8 * j), v5);
      }

      uint64_t v29 = [v27 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }

    while (v29);
  }
}

- (void)emitAssertionSignpostForTimeout:(uint64_t)a1
{
  uint64_t v102 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = v4;
  if (a1)
  {
    [v4 target];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 identity];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = [v5 legacyReason];
    if (v8 <= 9999)
    {
      switch(v8)
      {
        case 1LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v10 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v10;
          if (v10)
          {
            int v12 = 0;
            __int128 v13 = (void *)v10;
          }

          else
          {
            uint64_t v48 = [v7 xpcServiceIdentifier];
            v2 = (void *)v48;
            if (v48)
            {
              int v12 = 0;
              __int128 v13 = (void *)v48;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v77;
          v70 = "ExceededTimeLimit_MediaPlayback";
          break;
        case 2LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v22 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v22;
          if (v22)
          {
            int v12 = 0;
            __int128 v13 = (void *)v22;
          }

          else
          {
            uint64_t v49 = [v7 xpcServiceIdentifier];
            v2 = (void *)v49;
            if (v49)
            {
              int v12 = 0;
              __int128 v13 = (void *)v49;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v78;
          v70 = "ExceededTimeLimit_Location";
          break;
        case 3LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v23 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v23;
          if (v23)
          {
            int v12 = 0;
            __int128 v13 = (void *)v23;
          }

          else
          {
            uint64_t v50 = [v7 xpcServiceIdentifier];
            v2 = (void *)v50;
            if (v50)
            {
              int v12 = 0;
              __int128 v13 = (void *)v50;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v79;
          v70 = "ExceededTimeLimit_ExternalAccessory";
          break;
        case 4LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v24 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v24;
          if (v24)
          {
            int v12 = 0;
            __int128 v13 = (void *)v24;
          }

          else
          {
            uint64_t v51 = [v7 xpcServiceIdentifier];
            v2 = (void *)v51;
            if (v51)
            {
              int v12 = 0;
              __int128 v13 = (void *)v51;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v80;
          v70 = "ExceededTimeLimit_FinishTask";
          break;
        case 5LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v25 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v25;
          if (v25)
          {
            int v12 = 0;
            __int128 v13 = (void *)v25;
          }

          else
          {
            uint64_t v52 = [v7 xpcServiceIdentifier];
            v2 = (void *)v52;
            if (v52)
            {
              int v12 = 0;
              __int128 v13 = (void *)v52;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v81;
          v70 = "ExceededTimeLimit_Bluetooth";
          break;
        case 7LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v26 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v26;
          if (v26)
          {
            int v12 = 0;
            __int128 v13 = (void *)v26;
          }

          else
          {
            uint64_t v53 = [v7 xpcServiceIdentifier];
            v2 = (void *)v53;
            if (v53)
            {
              int v12 = 0;
              __int128 v13 = (void *)v53;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v82;
          v70 = "ExceededTimeLimit_BackgroundUI";
          break;
        case 8LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v27 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v27;
          if (v27)
          {
            int v12 = 0;
            __int128 v13 = (void *)v27;
          }

          else
          {
            uint64_t v54 = [v7 xpcServiceIdentifier];
            v2 = (void *)v54;
            if (v54)
            {
              int v12 = 0;
              __int128 v13 = (void *)v54;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v83;
          v70 = "ExceededTimeLimit_InterAppAudioStreaming";
          break;
        case 9LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v28 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v28;
          if (v28)
          {
            int v12 = 0;
            __int128 v13 = (void *)v28;
          }

          else
          {
            uint64_t v55 = [v7 xpcServiceIdentifier];
            v2 = (void *)v55;
            if (v55)
            {
              int v12 = 0;
              __int128 v13 = (void *)v55;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v84;
          v70 = "ExceededTimeLimit_ViewService";
          break;
        case 10LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v29 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v29;
          if (v29)
          {
            int v12 = 0;
            __int128 v13 = (void *)v29;
          }

          else
          {
            uint64_t v56 = [v7 xpcServiceIdentifier];
            v2 = (void *)v56;
            if (v56)
            {
              int v12 = 0;
              __int128 v13 = (void *)v56;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v85;
          v70 = "ExceededTimeLimit_NewsstandDownload";
          break;
        case 12LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v30 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v30;
          if (v30)
          {
            int v12 = 0;
            __int128 v13 = (void *)v30;
          }

          else
          {
            uint64_t v57 = [v7 xpcServiceIdentifier];
            v2 = (void *)v57;
            if (v57)
            {
              int v12 = 0;
              __int128 v13 = (void *)v57;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v86;
          v70 = "ExceededTimeLimit_VoIP";
          break;
        case 13LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v31 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v31;
          if (v31)
          {
            int v12 = 0;
            __int128 v13 = (void *)v31;
          }

          else
          {
            uint64_t v58 = [v7 xpcServiceIdentifier];
            v2 = (void *)v58;
            if (v58)
            {
              int v12 = 0;
              __int128 v13 = (void *)v58;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v87;
          v70 = "ExceededTimeLimit_Extension";
          break;
        case 16LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v32 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v32;
          if (v32)
          {
            int v12 = 0;
            __int128 v13 = (void *)v32;
          }

          else
          {
            uint64_t v59 = [v7 xpcServiceIdentifier];
            v2 = (void *)v59;
            if (v59)
            {
              int v12 = 0;
              __int128 v13 = (void *)v59;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v88;
          v70 = "ExceededTimeLimit_WatchConnectivity";
          break;
        case 18LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v33 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v33;
          if (v33)
          {
            int v12 = 0;
            __int128 v13 = (void *)v33;
          }

          else
          {
            uint64_t v60 = [v7 xpcServiceIdentifier];
            v2 = (void *)v60;
            if (v60)
            {
              int v12 = 0;
              __int128 v13 = (void *)v60;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v89;
          v70 = "ExceededTimeLimit_ComplicationUpdate";
          break;
        case 19LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v34 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v34;
          if (v34)
          {
            int v12 = 0;
            __int128 v13 = (void *)v34;
          }

          else
          {
            uint64_t v61 = [v7 xpcServiceIdentifier];
            v2 = (void *)v61;
            if (v61)
            {
              int v12 = 0;
              __int128 v13 = (void *)v61;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v90;
          v70 = "ExceededTimeLimit_WorkoutProcessing";
          break;
        case 20LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v35 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v35;
          if (v35)
          {
            int v12 = 0;
            __int128 v13 = (void *)v35;
          }

          else
          {
            uint64_t v62 = [v7 xpcServiceIdentifier];
            v2 = (void *)v62;
            if (v62)
            {
              int v12 = 0;
              __int128 v13 = (void *)v62;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v91;
          v70 = "ExceededTimeLimit_ComplicationPushUpdate";
          break;
        case 21LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v36 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v36;
          if (v36)
          {
            int v12 = 0;
            __int128 v13 = (void *)v36;
          }

          else
          {
            uint64_t v63 = [v7 xpcServiceIdentifier];
            v2 = (void *)v63;
            if (v63)
            {
              int v12 = 0;
              __int128 v13 = (void *)v63;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v92;
          v70 = "ExceededTimeLimit_BackgroundLocationProcessing";
          break;
        case 23LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v37 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v37;
          if (v37)
          {
            int v12 = 0;
            __int128 v13 = (void *)v37;
          }

          else
          {
            uint64_t v64 = [v7 xpcServiceIdentifier];
            v2 = (void *)v64;
            if (v64)
            {
              int v12 = 0;
              __int128 v13 = (void *)v64;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v93;
          v70 = "ExceededTimeLimit_AudioRecording";
          break;
        default:
          goto LABEL_90;
      }

      goto LABEL_205;
    }

    if (v8 <= 49999)
    {
      switch(v8)
      {
        case 10000LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v14 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v14;
          if (v14)
          {
            int v12 = 0;
            __int128 v13 = (void *)v14;
          }

          else
          {
            uint64_t v41 = [v7 xpcServiceIdentifier];
            v2 = (void *)v41;
            if (v41)
            {
              int v12 = 0;
              __int128 v13 = (void *)v41;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v69;
          v70 = "ExceededTimeLimit_Resume";
          break;
        case 10002LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v16 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v16;
          if (v16)
          {
            int v12 = 0;
            __int128 v13 = (void *)v16;
          }

          else
          {
            uint64_t v42 = [v7 xpcServiceIdentifier];
            v2 = (void *)v42;
            if (v42)
            {
              int v12 = 0;
              __int128 v13 = (void *)v42;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v71;
          v70 = "ExceededTimeLimit_TransientWakeup";
          break;
        case 10004LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v17 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v17;
          if (v17)
          {
            int v12 = 0;
            __int128 v13 = (void *)v17;
          }

          else
          {
            uint64_t v43 = [v7 xpcServiceIdentifier];
            v2 = (void *)v43;
            if (v43)
            {
              int v12 = 0;
              __int128 v13 = (void *)v43;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v72;
          v70 = "ExceededTimeLimit_FinishTaskUnbounded";
          break;
        case 10005LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v18 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v18;
          if (v18)
          {
            int v12 = 0;
            __int128 v13 = (void *)v18;
          }

          else
          {
            uint64_t v44 = [v7 xpcServiceIdentifier];
            v2 = (void *)v44;
            if (v44)
            {
              int v12 = 0;
              __int128 v13 = (void *)v44;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v73;
          v70 = "ExceededTimeLimit_Continuous";
          break;
        case 10006LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v19 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v19;
          if (v19)
          {
            int v12 = 0;
            __int128 v13 = (void *)v19;
          }

          else
          {
            uint64_t v45 = [v7 xpcServiceIdentifier];
            v2 = (void *)v45;
            if (v45)
            {
              int v12 = 0;
              __int128 v13 = (void *)v45;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v74;
          v70 = "ExceededTimeLimit_BackgroundContentFetching";
          break;
        case 10007LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v20 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v20;
          if (v20)
          {
            int v12 = 0;
            __int128 v13 = (void *)v20;
          }

          else
          {
            uint64_t v46 = [v7 xpcServiceIdentifier];
            v2 = (void *)v46;
            if (v46)
            {
              int v12 = 0;
              __int128 v13 = (void *)v46;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v75;
          v70 = "ExceededTimeLimit_NotificationAction";
          break;
        case 10008LL:
          rbs_sp_telemetry_log();
          uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_signpost_enabled(v9)) {
            goto LABEL_210;
          }
          uint64_t v21 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v21;
          if (v21)
          {
            int v12 = 0;
            __int128 v13 = (void *)v21;
          }

          else
          {
            uint64_t v47 = [v7 xpcServiceIdentifier];
            v2 = (void *)v47;
            if (v47)
            {
              int v12 = 0;
              __int128 v13 = (void *)v47;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v76;
          v70 = "ExceededTimeLimit_PIP";
          break;
        default:
          goto LABEL_90;
      }

      goto LABEL_205;
    }

    switch(v8)
    {
      case 50000LL:
        rbs_sp_telemetry_log();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          uint64_t v38 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v38;
          if (v38)
          {
            int v12 = 0;
            __int128 v13 = (void *)v38;
          }

          else
          {
            uint64_t v66 = [v7 xpcServiceIdentifier];
            v2 = (void *)v66;
            if (v66)
            {
              int v12 = 0;
              __int128 v13 = (void *)v66;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v95;
          v70 = "ExceededTimeLimit_FinishTaskAfterBackgroundContentFetching";
          goto LABEL_205;
        }

        break;
      case 50003LL:
        rbs_sp_telemetry_log();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          uint64_t v39 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v39;
          if (v39)
          {
            int v12 = 0;
            __int128 v13 = (void *)v39;
          }

          else
          {
            uint64_t v67 = [v7 xpcServiceIdentifier];
            v2 = (void *)v67;
            if (v67)
            {
              int v12 = 0;
              __int128 v13 = (void *)v67;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v96;
          v70 = "ExceededTimeLimit_FinishTaskAfterNotificationAction";
          goto LABEL_205;
        }

        break;
      case 50004LL:
        rbs_sp_telemetry_log();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          uint64_t v15 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v15;
          if (v15)
          {
            int v12 = 0;
            __int128 v13 = (void *)v15;
          }

          else
          {
            uint64_t v65 = [v7 xpcServiceIdentifier];
            v2 = (void *)v65;
            if (v65)
            {
              int v12 = 0;
              __int128 v13 = (void *)v65;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v94;
          v70 = "ExceededTimeLimit_FinishTaskAfterWatchConnectivity";
          goto LABEL_205;
        }

        break;
      default:
LABEL_90:
        rbs_sp_telemetry_log();
        uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_signpost_enabled(v9))
        {
          uint64_t v40 = [v7 embeddedApplicationIdentifier];
          __int128 v11 = (void *)v40;
          if (v40)
          {
            int v12 = 0;
            __int128 v13 = (void *)v40;
          }

          else
          {
            uint64_t v68 = [v7 xpcServiceIdentifier];
            v2 = (void *)v68;
            if (v68)
            {
              int v12 = 0;
              __int128 v13 = (void *)v68;
            }

            else
            {
              [v7 consistentLaunchdJobLabel];
              __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
              int v12 = 1;
            }
          }

          [v5 invalidationDuration];
          int v98 = 138543618;
          v99 = v13;
          __int16 v100 = 2050;
          uint64_t v101 = v97;
          v70 = "AssertionTimedOut";
LABEL_205:
          _os_signpost_emit_with_name_impl( &dword_188634000,  v9,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  v70,  "BundleIdOverride=%{public, signpost.description:attribute}@ permittedBackgroundDuration=%{public, signpost.t elemetry:number1}f enableTelemetry=YES ",  (uint8_t *)&v98,  0x16u);
          if (v12) {

          }
          if (!v11) {
        }
          }

        break;
    }

uint64_t __53__RBDaemon_assertionManager_didInvalidateAssertions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) executeTerminateRequest:*(void *)(a1 + 40) completion:0];
}

- (void)assertionManager:(id)a3 didBeginTrackingStateForProcessIdentity:(id)a4
{
}

- (void)assertionManager:(id)a3 didEndTrackingStateForProcessIdentity:(id)a4
{
  processManager = self->_processManager;
  id v6 = a4;
  -[RBProcessManager removeStateForProcessIdentity:](processManager, "removeStateForProcessIdentity:", v6);
  -[RBProcessMonitor removeStateForProcessIdentity:](self->_processMonitor, "removeStateForProcessIdentity:", v6);
  -[RBPowerAssertionManager removeStateForProcessIdentity:]( self->_powerAssertionManager,  "removeStateForProcessIdentity:",  v6);
}

- (void)assertionManager:(id)a3 didBeginTrackingInFightUpdatesForProcessIdentity:(id)a4
{
}

- (void)assertionManager:(id)a3 didEndTrackingInFightUpdatesForProcessIdentity:(id)a4
{
}

- (void)assertionManager:(id)a3 didRejectAcquisitionFromOriginatorWithExcessiveAssertions:(id)a4
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x189612398];
  [NSString stringWithFormat:@"Process %@ has an excessive number of assertions. Direct this report to owners of that process", v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 defaultContextWithExplanation:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 setPreventIfBeingDebugged:1];
  [v9 setReportType:1];
  [v9 setExceptionCode:3490524077];
  [v6 identity];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_sp_telemetry_log();
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    uint64_t v12 = [v10 embeddedApplicationIdentifier];
    __int128 v13 = (void *)v12;
    if (v12)
    {
      int v14 = 0;
      uint64_t v15 = (void *)v12;
    }

    else
    {
      uint64_t v16 = [v10 xpcServiceIdentifier];
      id v4 = (void *)v16;
      if (v16)
      {
        int v14 = 0;
        uint64_t v15 = (void *)v16;
      }

      else
      {
        [v10 consistentLaunchdJobLabel];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        int v14 = 1;
      }
    }

    *(_DWORD *)buf = 138543362;
    uint64_t v27 = v15;
    _os_signpost_emit_with_name_impl( &dword_188634000,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "RBAssertionMaxCountReached_ProcessTerminated",  "BundleIdOverride=%{public, signpost.description:attribute}@ enableTelemetry=YES ",  buf,  0xCu);
    if (v14) {

    }
    if (!v13) {
  }
    }

  id v17 = objc_alloc(MEMORY[0x1896123A0]);
  uint64_t v18 = (void *)MEMORY[0x189612320];
  [v6 identifier];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 predicateMatchingIdentifier:v19];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = (void *)[v17 initWithPredicate:v20 context:v9];

  uint64_t v22 = (dispatch_queue_s *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __87__RBDaemon_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions___block_invoke;
  block[3] = &unk_18A255B00;
  block[4] = self;
  id v25 = v21;
  id v23 = v21;
  dispatch_async(v22, block);
}

uint64_t __87__RBDaemon_assertionManager_didRejectAcquisitionFromOriginatorWithExcessiveAssertions___block_invoke( uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) executeTerminateRequest:*(void *)(a1 + 40) completion:0];
}

- (void)powerAssertionManagerDidAllowIdleSleep:(id)a3
{
}

- (void)powerAssertionManagerDidPreventIdleSleep:(id)a3
{
}

- (void)processManager:(id)a3 didReconnectProcesses:(id)a4
{
}

- (void)processManager:(id)a3 didAddProcess:(id)a4 withState:(id)a5
{
  assertionManager = self->_assertionManager;
  id v8 = a5;
  id v9 = a4;
  -[RBAssertionManager processDidLaunch:](assertionManager, "processDidLaunch:", v9);
  -[RBPowerAssertionManager addProcess:](self->_powerAssertionManager, "addProcess:", v9);
  -[RBThrottleBestEffortNetworkingManager addProcess:](self->_throttleBestEffortNetworkingManager, "addProcess:", v9);
  -[RBCoalitionManager addProcess:withState:](self->_coalitionManager, "addProcess:withState:", v9, v8);
}

- (void)processManager:(id)a3 didRemoveProcess:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v5 = a4;
  [v5 identity];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v6 isEmbeddedApplication])
  {
    [v5 lastExitContext];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 status];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 embeddedApplicationIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v10 = -[RBAssertionManager isProcessForeground:](self->_assertionManager, "isProcessForeground:", v5);
    rbs_sp_telemetry_log();
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      int v12 = [v8 domain];
      uint64_t v13 = [v8 code];
      int v14 = "NO";
      *(_DWORD *)uint64_t v15 = 138544130;
      *(_WORD *)&v15[12] = 1026;
      *(void *)&v15[4] = v9;
      if (v10) {
        int v14 = "YES";
      }
      *(_DWORD *)&v15[14] = v12;
      __int16 v16 = 2050;
      uint64_t v17 = v13;
      __int16 v18 = 2082;
      uint64_t v19 = v14;
      _os_signpost_emit_with_name_impl( &dword_188634000,  v11,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "ProcessExited",  "BundleIdOverride=%{public,signpost.description:attribute}@ exitStatusDomain=%{public,signpost.telemetry:number1} u exitStatusCode=%{public,signpost.telemetry:number2}llu foreground=%{public,signpost.telemetry:string1}s  enableTelemetry=YES ",  v15,  0x26u);
    }
  }

  -[RBAssertionManager processDidTerminate:](self->_assertionManager, "processDidTerminate:", v5, *(_OWORD *)v15);
  -[RBPowerAssertionManager removeProcess:](self->_powerAssertionManager, "removeProcess:", v5);
  -[RBThrottleBestEffortNetworkingManager removeProcess:]( self->_throttleBestEffortNetworkingManager,  "removeProcess:",  v5);
  -[RBBundlePropertiesManager removeProcess:](self->_bundlePropertiesManager, "removeProcess:", v5);
  -[RBCoalitionManager removeProcess:](self->_coalitionManager, "removeProcess:", v5);
}

- (void)bundlePropertiesManager:(id)a3 didChangePropertiesForProcessIdentities:(id)a4
{
}

void __27__RBDaemon__sharedInstance__block_invoke()
{
  id v0 = objc_alloc(&OBJC_CLASS___RBDaemon);
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)&OBJC_CLASS___RBDaemon;
    id v0 = (RBDaemon *)objc_msgSendSuper2(&v2, sel_init);
  }

  v1 = (void *)_sharedInstance___sharedInstance;
  _sharedInstance___sharedInstance = (uint64_t)v0;
}

- (uint64_t)setLowDiskIOPolicy
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t result = setiopolicy_np(9, 0, 1);
    if ((_DWORD)result) {
      -[RBDaemon setLowDiskIOPolicy].cold.1(&v1, v2);
    }
  }

  return result;
}

- (void)watchdogRegister
{
  v3[5] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    wd_endpoint_register();
    +[RBConnectionListener sharedConnectionWorkloop]();
    v3[1] = +[RBAssertionManager sharedWorkloop]( &OBJC_CLASS___RBAssertionManager,  "sharedWorkloop",  objc_claimAutoreleasedReturnValue());
    v3[2] = [MEMORY[0x1896121C0] handshakeQueue];
    v3[3] = [MEMORY[0x1896121C0] connectionQueue];
    +[RBProcessManager stateApplicationQueue](&OBJC_CLASS___RBProcessManager, "stateApplicationQueue");
    v3[4] = uint64_t v1 = 0LL;
    do
    {
      wd_endpoint_add_queue();
      v1 += 8LL;
    }

    while (v1 != 40);
    wd_endpoint_activate();
    for (uint64_t i = 4LL; i != -1; --i)
  }

- (RBProcess)process
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __19__RBDaemon_process__block_invoke;
  block[3] = &unk_18A255C70;
  block[4] = self;
  if (process_onceToken != -1) {
    dispatch_once(&process_onceToken, block);
  }
  return (RBProcess *)(id)process_process;
}

void __19__RBDaemon_process__block_invoke(uint64_t a1)
{
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v2 = (void *)MEMORY[0x1896122E8];
  [MEMORY[0x1896079D8] processInfo];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 environment];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKey:@"XPC_SERVICE_NAME"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 identityForDaemonJobLabel:v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612300] instanceWithIdentifier:v10 identity:v6];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 80) processForInstance:v7];
  id v9 = (void *)process_process;
  process_process = v8;
}

- (RBAssertionManaging)assertionManager
{
  return (RBAssertionManaging *)self->_assertionManager;
}

- (RBEntitlementManaging)entitlementManager
{
  return (RBEntitlementManaging *)self->_entitlementManager;
}

- (RBProcessManaging)processManager
{
  return (RBProcessManaging *)self->_processManager;
}

- (RBProcessMonitoring)processMonitor
{
  return (RBProcessMonitoring *)self->_processMonitor;
}

- (RBStateCaptureManaging)stateCaptureManager
{
  return (RBStateCaptureManaging *)self->_stateCaptureManager;
}

- (RBAssertionOriginatorPidPersisting)assertionOriginatorPidStore
{
  return (RBAssertionOriginatorPidPersisting *)self->_assertionOriginatorPidStore;
}

- (RBDomainAttributeManaging)domainAttributeManager
{
  return (RBDomainAttributeManaging *)self->_domainAttributeManager;
}

- (RBJetsamPropertyManaging)jetsamPropertyManager
{
  return (RBJetsamPropertyManaging *)self->_jetsamPropertyManager;
}

- (RBExtensionDataProviding)extensionDataProvider
{
  return self->_extensionDataProvider;
}

- (RBRequestManaging)requestManager
{
  return self->_requestManager;
}

- (RBHistoricalStatisticsMaintaining)historicalStatistics
{
  return (RBHistoricalStatisticsMaintaining *)self->_historicalStatistics;
}

- (void).cxx_destruct
{
}

- (void)setLowDiskIOPolicy
{
  *a1 = 0LL;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR);
  __error();
  objc_super v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end