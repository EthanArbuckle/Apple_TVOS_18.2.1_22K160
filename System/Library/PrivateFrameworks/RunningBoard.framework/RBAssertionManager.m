@interface RBAssertionManager
+ (id)sharedWorkloop;
- (BOOL)_decreaseInFlightOperationsForOriginator:(id)a3;
- (BOOL)_increaseInFlightOperationsForOriginator:(id)a3 andSuspendIfNeeded:(id)a4;
- (BOOL)_invalidateAssertion:(id)a3 sync:(BOOL)a4;
- (BOOL)_lock_batchContextInvalidatesSynchronously:(id)a3;
- (BOOL)_lock_enforceAssertionLimitIfNecessaryForBatchContext:(id)a3 originatorProcess:(id)a4 error:(id *)a5;
- (BOOL)_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3;
- (BOOL)_lock_originatorHasExited:(id)a3;
- (BOOL)_lock_validateDescriptor:(id)a3 originatorProcess:(id)a4 originatorState:(id)a5 concreteTarget:(id)a6 targetProcess:(id)a7 targetIdentity:(id)a8 targetIdentifier:(id)a9 targetState:(id)a10 acquisitionContext:(id)a11 error:(id *)a12;
- (BOOL)_lock_willExceedAssertionLimitForOriginatorProcess:(id)a3 withIncomingCount:(unint64_t)a4;
- (BOOL)addSavedEndowment:(id)a3 forProcess:(id)a4;
- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5;
- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4;
- (BOOL)hasAssertionWithIdentifier:(id)a3;
- (BOOL)invalidateAssertion:(id)a3;
- (BOOL)invalidateAssertionFromOriginator:(id)a3 sync:(BOOL)a4 withIdentifier:(id)a5;
- (BOOL)invalidateAssertionFromOriginator:(id)a3 withIdentifier:(id)a4;
- (BOOL)invalidateAssertionWithIdentifier:(id)a3;
- (BOOL)invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:(id)a3;
- (BOOL)isProcessForeground:(id)a3;
- (NSString)debugDescription;
- (NSString)stateCaptureTitle;
- (RBAssertionManager)init;
- (RBAssertionManager)initWithDelegate:(id)a3 bundlePropertiesManager:(id)a4 originatorPidStore:(id)a5 assertionDescriptorValidator:(id)a6 timeProvider:(id)a7 daemonContext:(id)a8 maxOperationsInFlight:(unint64_t)a9 maxAssertionsPerOriginator:(unint64_t)a10;
- (RBSystemState)systemState;
- (double)_lock_delayedStartTimeForAssertion:(id)a3;
- (double)_lock_invalidationTimeForAssertion:(id)a3;
- (double)_lock_originatorExitTimeForAssertion:(id)a3;
- (double)_lock_relativeStartTimeForAssertion:(id)a3;
- (double)_lock_startTimeForAssertion:(id)a3;
- (double)_remainingRuntimeForProcessIdentity:(id)a3;
- (double)eventQueue:(id)a3 remainingRuntimeForProcessIdentity:(id)a4;
- (double)eventQueue:(id)a3 startTimeForAssertion:(id)a4;
- (id)_concreteTargetForTarget:(id)a3 allowAbstractTarget:(BOOL)a4;
- (id)_lock_activateDelayedAssertionsForTargets:(id)a3;
- (id)_lock_assertionCreationAttributeContextForTargetIdentity:(id)a3 originator:(id)a4;
- (id)_lock_createAssertionForDescriptor:(id)a3 originatorState:(id)a4 acquisitionContext:(id)a5 error:(id *)a6;
- (id)_lock_createAssertionWithAcquisitionContext:(id)a3 attributeContext:(id)a4 concreteTarget:(id)a5 targetIdentity:(id)a6 originator:(id)a7 error:(id *)a8;
- (id)_lock_createAssertionsForBatchContext:(id)a3 originatorState:(id)a4 errorsByIndex:(id)a5;
- (id)_lock_deactivateAssertions:(id)a3;
- (id)_lock_deactivateDelayedAssertionsForTargets:(id)a3;
- (id)_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:(id)a3;
- (id)_lock_invalidateAssertionByConditions:(id)a3 changedAssertions:(id *)a4;
- (id)_lock_originatorIdentifiersInAssertions:(id)a3;
- (id)_lock_savedEndowmentsForProcess:(id)a3;
- (id)_lock_sortedAssertionsForTarget:(id)a3;
- (id)_lock_targetIdentitiesInAssertions:(id)a3;
- (id)_lock_updateStatesDueToChangingAssertions:(id)a3 invalidatedAssertions:(id)a4;
- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4;
- (id)allEntitlements;
- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3;
- (id)assertionsForOriginator:(id)a3;
- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6;
- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4;
- (id)limitationsForInstance:(id)a3;
- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4;
- (id)popPluginHoldForAssertion:(id)a3;
- (id)processForIdentity:(id)a3;
- (id)restrictionsForDomain:(id)a3 andName:(id)a4;
- (id)savedEndowmentsForProcess:(id)a3;
- (id)stateForIdentity:(id)a3;
- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4;
- (unint64_t)_lock_incomingAssertionCountForBatchContext:(id)a3 originatorIdentifier:(id)a4;
- (unint64_t)_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3;
- (unint64_t)_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:(id)a3 completionPolicy:(unint64_t)a4;
- (void)_acquireAssertions:(id)a3 invalidateIdentifiers:(id)a4 forOriginatorProcess:(id)a5 completionPolicy:(unint64_t)a6 acquisitionErrorsByIndex:(id)a7 completeStage:(id)a8;
- (void)_acquireUnderlyingAssertionForProcess:(id)a3;
- (void)_decreaseInFlightOperationsForTargetIdentities:(id)a3;
- (void)_dumpAssertions;
- (void)_increaseInFlightOperationsForTargetIdentities:(id)a3;
- (void)_invalidateAssertionsWithContext:(id)a3;
- (void)_lock_addAssertion:(id)a3;
- (void)_lock_checkAssertionToInvalidateByCondition:(id)a3 condition:(id)a4 currentValue:(id)a5 assertionsToInvalidate:(id)a6;
- (void)_lock_clearStartTimesForUnbusyTargets:(id)a3;
- (void)_lock_dumpAssertionsForTarget:(id)a3;
- (void)_lock_enqueueAssertionsForRemoval:(id)a3;
- (void)_lock_finalizeRemovingAssertions:(id)a3;
- (void)_lock_invalidateAssertions:(id)a3 forceSync:(BOOL)a4;
- (void)_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:(id)a3;
- (void)_lock_notifyDelegateOfInvalidatedAssertions:(id)a3;
- (void)_lock_notifyDelegateOfProcessStateChangeSet:(id)a3;
- (void)_lock_removeAssertion:(id)a3;
- (void)_lock_removeAssertions:(id)a3 andUpdateChangedAssertions:(id)a4;
- (void)_lock_removeInvalidAssertions;
- (void)_lock_removeStateForProcessIdentityIfNecessary:(id)a3;
- (void)_lock_setState:(id)a3 forProcessIdentity:(id)a4;
- (void)_lock_setSystemState:(id)a3;
- (void)_removeInvalidAssertions;
- (void)acquireAssertionWithContext:(id)a3 completion:(id)a4;
- (void)commitBatchWithContext:(id)a3 completion:(id)a4;
- (void)eventQueue:(id)a3 handleAssertionsExpirationWarningEventForProcessIdentity:(id)a4 expirationTime:(double)a5;
- (void)eventQueue:(id)a3 handleInvalidationEventForAssertion:(id)a4;
- (void)eventQueue:(id)a3 handleWarningEventForAssertion:(id)a4;
- (void)periodicRunningProcessDump;
- (void)processDidLaunch:(id)a3;
- (void)processDidTerminate:(id)a3;
- (void)revalidateAssertionsForProcessIdentities:(id)a3;
@end

@implementation RBAssertionManager

- (RBSystemState)systemState
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[RBSystemState copy](self->_systemState, "copy");
  os_unfair_lock_unlock(p_lock);
  return (RBSystemState *)v4;
}

+ (id)sharedWorkloop
{
  if (sharedWorkloop_onceToken != -1) {
    dispatch_once(&sharedWorkloop_onceToken, &__block_literal_global_2);
  }
  return (id)sharedWorkloop_workloop;
}

void __36__RBAssertionManager_sharedWorkloop__block_invoke()
{
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("RBAssertionManager");
  v1 = (void *)sharedWorkloop_workloop;
  sharedWorkloop_workloop = (uint64_t)inactive;

  dispatch_set_qos_class_fallback();
  dispatch_activate((dispatch_object_t)sharedWorkloop_workloop);
}

- (void)periodicRunningProcessDump
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __48__RBAssertionManager_periodicRunningProcessDump__block_invoke;
  block[3] = &unk_18A255C70;
  block[4] = self;
  if (periodicRunningProcessDump_onceToken != -1) {
    dispatch_once(&periodicRunningProcessDump_onceToken, block);
  }
}

void __48__RBAssertionManager_periodicRunningProcessDump__block_invoke(uint64_t a1)
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v3 = dispatch_queue_create("RBRunningProcessDump", v2);
  v4 = (void *)periodicRunningProcessDump_periodicQueue;
  periodicRunningProcessDump_periodicQueue = (uint64_t)v3;

  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)periodicRunningProcessDump_periodicQueue);
  v6 = (void *)periodicRunningProcessDump_periodicSource;
  periodicRunningProcessDump_periodicSource = (uint64_t)v5;

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __48__RBAssertionManager_periodicRunningProcessDump__block_invoke_2;
  handler[3] = &unk_18A255C70;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)periodicRunningProcessDump_periodicSource, handler);
  dispatch_activate((dispatch_object_t)periodicRunningProcessDump_periodicSource);
  v7 = (dispatch_source_s *)periodicRunningProcessDump_periodicSource;
  dispatch_time_t v8 = dispatch_time(0LL, 1800000000000LL);
  dispatch_source_set_timer(v7, v8, 0x1A3185C5000uLL, 0x29E8D60800uLL);
}

void __48__RBAssertionManager_periodicRunningProcessDump__block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(a1 + 32) + 64) allValue];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_process_log();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188634000, v2, OS_LOG_TYPE_DEFAULT, "Periodic Run States >>>>>", buf, 2u);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v15;
    *(void *)&__int128 v5 = 138543362LL;
    __int128 v13 = v5;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "preventSuspend", v13, (void)v14))
        {
          rbs_process_log();
          v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            [v9 debugDescription];
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v13;
            v19 = v11;
            _os_log_impl(&dword_188634000, v10, OS_LOG_TYPE_DEFAULT, "Periodic Run States %{public}@", buf, 0xCu);
          }
        }
      }

      uint64_t v6 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }

    while (v6);
  }

  rbs_process_log();
  v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188634000, v12, OS_LOG_TYPE_DEFAULT, "Periodic Run States <<<<<", buf, 2u);
  }
}

- (RBAssertionManager)init
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 handleFailureInMethod:a2 object:self file:@"RBAssertionManager.m" lineNumber:159 description:@"-init is not allowed on RBAssertionManager"];

  return 0LL;
}

- (RBAssertionManager)initWithDelegate:(id)a3 bundlePropertiesManager:(id)a4 originatorPidStore:(id)a5 assertionDescriptorValidator:(id)a6 timeProvider:(id)a7 daemonContext:(id)a8 maxOperationsInFlight:(unint64_t)a9 maxAssertionsPerOriginator:(unint64_t)a10
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v76 = a6;
  id obj = a7;
  id v20 = a7;
  id v75 = a8;
  id v21 = a8;
  v77.receiver = self;
  v77.super_class = (Class)&OBJC_CLASS___RBAssertionManager;
  v22 = -[RBAssertionManager init](&v77, sel_init);
  if (!v22) {
    goto LABEL_10;
  }
  if (v17)
  {
    if (v18) {
      goto LABEL_4;
    }
LABEL_12:
    id v72 = v21;
    [MEMORY[0x1896077D8] currentHandler];
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    [v64 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 173, @"Invalid parameter not satisfying: %@", @"bundlePropertiesManager" object file lineNumber description];

    id v21 = v72;
    if (v19) {
      goto LABEL_5;
    }
LABEL_13:
    id v73 = v21;
    [MEMORY[0x1896077D8] currentHandler];
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    [v65 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 174, @"Invalid parameter not satisfying: %@", @"originatorPidStore" object file lineNumber description];

    id v21 = v73;
    goto LABEL_5;
  }

  id v71 = v21;
  [MEMORY[0x1896077D8] currentHandler];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  [v63 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 172, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

  id v21 = v71;
  if (!v18) {
    goto LABEL_12;
  }
LABEL_4:
  if (!v19) {
    goto LABEL_13;
  }
LABEL_5:
  id v69 = v18;
  if (!v76)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    [v66 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 175, @"Invalid parameter not satisfying: %@", @"validator" object file lineNumber description];
  }

  id v70 = v17;
  if (!v21)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    [v67 handleFailureInMethod:a2, v22, @"RBAssertionManager.m", 176, @"Invalid parameter not satisfying: %@", @"daemonContext" object file lineNumber description];
  }

  v22->_lock._os_unfair_lock_opaque = 0;
  uint64_t v23 = +[RBAssertionManager sharedWorkloop](&OBJC_CLASS___RBAssertionManager, "sharedWorkloop");
  workloop = v22->_workloop;
  v22->_workloop = (OS_dispatch_queue *)v23;

  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v25 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v26 = dispatch_queue_create("RBAssertionManagerCallOut", v25);
  calloutQueue = v22->_calloutQueue;
  v22->_calloutQueue = (OS_dispatch_queue *)v26;

  objc_storeStrong((id *)&v22->_delegate, a3);
  objc_storeStrong((id *)&v22->_bundlePropertiesManager, a4);
  objc_storeStrong((id *)&v22->_descriptorValidator, a6);
  objc_storeStrong((id *)&v22->_originatorPidStore, a5);
  objc_storeStrong((id *)&v22->_timeProvider, obj);
  v22->_maxOperationsInFlight = a9;
  v22->_maxAssertionsPerOriginator = a10;
  objc_storeStrong((id *)&v22->_daemonContext, v75);
  v28 = objc_alloc_init(&OBJC_CLASS___RBAssertionCollection);
  assertions = v22->_assertions;
  v22->_assertions = v28;

  v30 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  pluginHoldsForAssertions = v22->_pluginHoldsForAssertions;
  v22->_pluginHoldsForAssertions = v30;

  v32 = objc_alloc_init(&OBJC_CLASS___RBProcessIndex);
  processIndex = v22->_processIndex;
  v22->_processIndex = v32;

  v34 = objc_alloc_init(&OBJC_CLASS___RBProcessMap);
  stateMap = v22->_stateMap;
  v22->_stateMap = v34;

  uint64_t v36 = [MEMORY[0x189603FC8] dictionary];
  relativeStartTimesByTargetIdentity = v22->_relativeStartTimesByTargetIdentity;
  v22->_relativeStartTimesByTargetIdentity = (NSMutableDictionary *)v36;

  uint64_t v38 = [MEMORY[0x189607920] weakToStrongObjectsMapTable];
  originatorExitTimesByAssertion = v22->_originatorExitTimesByAssertion;
  v22->_originatorExitTimesByAssertion = (NSMapTable *)v38;

  uint64_t v40 = [MEMORY[0x189603FC8] dictionary];
  originatorToInFlightOperationsCountMap = v22->_originatorToInFlightOperationsCountMap;
  v22->_originatorToInFlightOperationsCountMap = (NSMutableDictionary *)v40;

  v42 = (NSCountedSet *)objc_alloc_init(MEMORY[0x189607838]);
  inFlightAssertionTargets = v22->_inFlightAssertionTargets;
  v22->_inFlightAssertionTargets = v42;

  v22->_inFlightOperationsLock._os_unfair_lock_opaque = 0;
  v44 = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
  inFlightTerminations = v22->_inFlightTerminations;
  v22->_inFlightTerminations = v44;

  v46 = -[RBAssertionManagerEventQueue initWithTimeProvider:]( objc_alloc(&OBJC_CLASS___RBAssertionManagerEventQueue),  "initWithTimeProvider:",  v20);
  eventQueue = v22->_eventQueue;
  v22->_eventQueue = v46;

  -[RBAssertionManagerEventQueue setDelegate:](v22->_eventQueue, "setDelegate:", v22);
  uint64_t v48 = [MEMORY[0x189603FE0] set];
  assertionTargets = v22->_assertionTargets;
  v22->_assertionTargets = (NSMutableSet *)v48;

  uint64_t v50 = [MEMORY[0x189603FE0] set];
  acquiringAssertionIdentifiers = v22->_acquiringAssertionIdentifiers;
  v22->_acquiringAssertionIdentifiers = (NSMutableSet *)v50;

  uint64_t v52 = [MEMORY[0x189603FE0] set];
  invalidAssertions = v22->_invalidAssertions;
  v22->_invalidAssertions = (NSMutableSet *)v52;

  uint64_t v54 = [MEMORY[0x189607920] weakToStrongObjectsMapTable];
  savedEndowments = v22->_savedEndowments;
  v22->_savedEndowments = (NSMapTable *)v54;

  v56 = objc_alloc_init(&OBJC_CLASS___RBAssertionStateResolver);
  stateResolver = v22->_stateResolver;
  v22->_stateResolver = v56;

  -[RBAssertionStateResolver setAssertionCollection:](v22->_stateResolver, "setAssertionCollection:", v22->_assertions);
  -[RBAssertionStateResolver setProcessIndex:](v22->_stateResolver, "setProcessIndex:", v22->_processIndex);
  -[RBAssertionStateResolver setStateMap:](v22->_stateResolver, "setStateMap:", v22->_stateMap);
  v58 = v22->_stateResolver;
  [v21 domainAttributeManager];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionStateResolver setDomainAttributeManager:](v58, "setDomainAttributeManager:", v59);

  -[RBAssertionStateResolver setBundlePropertiesManager:]( v22->_stateResolver,  "setBundlePropertiesManager:",  v22->_bundlePropertiesManager);
  v60 = v22->_stateResolver;
  v61 = -[RBDaemonContextProviding entitlementManager](v22->_daemonContext, "entitlementManager");
  -[RBAssertionStateResolver setEntitlementManager:](v60, "setEntitlementManager:", v61);

  -[RBAssertionStateResolver setSavedEndowments:](v22->_stateResolver, "setSavedEndowments:", v22->_savedEndowments);
  -[RBAssertionManager periodicRunningProcessDump](v22, "periodicRunningProcessDump");
  id v18 = v69;
  id v17 = v70;
LABEL_10:

  return v22;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc(NSString);
  [(id)objc_opt_class() description];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v5 = -[RBAssertionCollection count](self->_assertions, "count");
  -[RBSystemState debugDescription](self->_systemState, "debugDescription");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v7 = -[RBAssertionManagerEventQueue count](self->_eventQueue, "count");
  -[RBProcessMap dictionary](self->_stateMap, "dictionary");
  dispatch_time_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 entriesToStringWithIndent:1 debug:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[v3 initWithFormat:@"<%@| assertionCount:%lu systemState:%@ eventQueueCount:%lu processStates:{\n%@}>", v4, v5, v6, v7, v9];

  return (NSString *)v10;
}

- (void)commitBatchWithContext:(id)a3 completion:(id)a4
{
  uint64_t v102 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_workloop);
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_calloutQueue);
  v59 = self;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    [v47 handleFailureInMethod:a2, self, @"RBAssertionManager.m", 244, @"Invalid parameter not satisfying: %@", @"batchContext" object file lineNumber description];
  }

  v93[0] = 0LL;
  v93[1] = v93;
  v93[2] = 0x2020000000LL;
  char v94 = 0;
  v88[0] = MEMORY[0x1895F87A8];
  v88[1] = 3221225472LL;
  v88[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke;
  v88[3] = &unk_18A255D30;
  v91 = v93;
  SEL v92 = a2;
  v88[4] = self;
  id v60 = v7;
  id v89 = v60;
  id v52 = v8;
  id v90 = v52;
  v55 = (void (**)(void, void, void, void))MEMORY[0x1895CA0E4](v88);
  [MEMORY[0x189603FC8] dictionary];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FA8] array];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FC8] dictionary];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [v60 process];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 identifier];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 identity];
  uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v60 acquisitionPolicy];
  if (v11 == 1)
  {
    uint64_t v12 = 1LL;
  }

  else if (-[RBAssertionManager _lock_batchContextInvalidatesSynchronously:]( self,  "_lock_batchContextInvalidatesSynchronously:",  v60))
  {
    uint64_t v12 = 1LL;
  }

  else
  {
    uint64_t v12 = v11;
  }

  uint64_t v58 = v12;
  [v60 descriptorsToAcquire];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v10;
  BOOL v14 = [v13 count] == 0;

  if (v14)
  {
    v51 = 0LL;
  }

  else
  {
    id v87 = 0LL;
    BOOL v15 = -[RBAssertionManager _lock_enforceAssertionLimitIfNecessaryForBatchContext:originatorProcess:error:]( self,  "_lock_enforceAssertionLimitIfNecessaryForBatchContext:originatorProcess:error:",  v60,  v57,  &v87);
    id v16 = v87;
    if (v15)
    {
      os_unfair_lock_unlock(lock);
      ((void (**)(void, void, void, id))v55)[2](v55, 0LL, 0LL, v16);
      goto LABEL_39;
    }

    -[RBProcessMap valueForIdentity:](v59->_stateMap, "valueForIdentity:", v54);
    uint64_t v50 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v49 = [MEMORY[0x189603FC8] dictionary];
    uint64_t v48 = v16;
    v51 = -[RBAssertionManager _lock_createAssertionsForBatchContext:originatorState:errorsByIndex:]( v59,  "_lock_createAssertionsForBatchContext:originatorState:errorsByIndex:",  v60,  v50,  v49);
    if ([v51 count])
    {
      uint64_t v58 = -[RBAssertionManager _lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:completionPolicy:]( v59,  "_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:completionPolicy:",  v51,  v58);
      __int128 v85 = 0u;
      __int128 v86 = 0u;
      __int128 v83 = 0u;
      __int128 v84 = 0u;
      id obj = v51;
      uint64_t v17 = [obj countByEnumeratingWithState:&v83 objects:v101 count:16];
      if (v17)
      {
        uint64_t v62 = *(void *)v84;
        do
        {
          uint64_t v64 = v17;
          for (uint64_t i = 0LL; i != v64; ++i)
          {
            if (*(void *)v84 != v62) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v83 + 1) + 8 * i);
            [obj objectForKeyedSubscript:v19];
            id v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 identifier];
            id v21 = (void *)objc_claimAutoreleasedReturnValue();
            [v63 setObject:v21 forKeyedSubscript:v19];
            [v20 target];
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            [v22 identity];
            uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23) {
              [v61 addObject:v23];
            }
            [v20 target];
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 process];
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            rbs_sp_assertion_log();
            dispatch_queue_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v26, (const void *)[v21 hash]);

            rbs_sp_assertion_log();
            v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            v29 = v28;
            if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
            {
              [v20 explanation];
              id v30 = (id)objc_claimAutoreleasedReturnValue();
              [v25 shortDescription];
              id v31 = (id)objc_claimAutoreleasedReturnValue();
              [v21 description];
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              id v96 = v30;
              __int16 v97 = 2114;
              id v98 = v31;
              __int16 v99 = 2114;
              v100 = v32;
              _os_signpost_emit_with_name_impl( &dword_188634000,  v29,  OS_SIGNPOST_INTERVAL_BEGIN,  v27,  "ClientAssertion",  "explanation=%{public}@;target=%{public}@;identifier=%{public}@",
                buf,
                0x20u);
            }
          }

          uint64_t v17 = [obj countByEnumeratingWithState:&v83 objects:v101 count:16];
        }

        while (v17);
      }
    }

    id v9 = (id)v49;
  }

  os_unfair_lock_unlock(lock);
  dispatch_sync((dispatch_queue_t)v59->_calloutQueue, &__block_literal_global_41);
  [MEMORY[0x1896123C0] currentContext];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 connection];
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAssertionManager _increaseInFlightOperationsForTargetIdentities:]( v59,  "_increaseInFlightOperationsForTargetIdentities:",  v61);
  if (v34
    && -[RBAssertionManager _increaseInFlightOperationsForOriginator:andSuspendIfNeeded:]( v59,  "_increaseInFlightOperationsForOriginator:andSuspendIfNeeded:",  v56,  v34))
  {
    rbs_process_log();
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionManager commitBatchWithContext:completion:].cold.1();
    }
  }

  v73[0] = MEMORY[0x1895F87A8];
  v73[1] = 3221225472LL;
  v73[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_43;
  v73[3] = &unk_18A255D78;
  v73[4] = v59;
  id v74 = v61;
  id v36 = v51;
  id v75 = v36;
  id v37 = v34;
  id v76 = v37;
  id v77 = v56;
  id v38 = v57;
  id v78 = v38;
  uint64_t v82 = v58;
  v81 = v55;
  id v79 = v63;
  id v39 = v9;
  id v80 = v39;
  uint64_t v40 = (void (**)(void, void, void))[v73 copy];
  v40[2](v40, 0LL, 0LL);
  v66[0] = MEMORY[0x1895F87A8];
  v66[1] = 3221225472LL;
  v66[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_46;
  v66[3] = &unk_18A255DA0;
  v66[4] = v59;
  id v41 = v36;
  id v67 = v41;
  id v68 = v60;
  id v69 = v38;
  uint64_t v72 = v58;
  id v9 = v39;
  id v70 = v9;
  v42 = v40;
  id v71 = v42;
  v43 = (void *)MEMORY[0x1895CA0E4](v66);
  [MEMORY[0x1896123C0] currentContext];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v58 == 1 && v44)
  {
    [v44 handoffToQueue:v59->_workloop block:v43];
  }

  else
  {
    workloop = (dispatch_queue_s *)v59->_workloop;
    if (v58 == 1) {
      dispatch_async_and_wait(workloop, v43);
    }
    else {
      dispatch_async(workloop, v43);
    }
  }

  id v16 = v41;
LABEL_39:

  _Block_object_dispose(v93, 8);
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke( void *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1[7] + 8LL);
  if (*(_BYTE *)(v10 + 24))
  {
    [MEMORY[0x1896077D8] currentHandler];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInMethod:a1[8] object:a1[4] file:@"RBAssertionManager.m" lineNumber:249 description:@"called completion more than once"];

    uint64_t v10 = *(void *)(a1[7] + 8LL);
  }

  *(_BYTE *)(v10 + 24) = 1;
  if (v9)
  {
    rbs_assertion_log();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_cold_1((uint64_t)a1, (uint64_t)v9, v11);
    }
  }

  uint64_t v12 = a1[6];
  if (v12) {
    (*(void (**)(uint64_t, id, id, id))(v12 + 16))(v12, v7, v8, v9);
  }
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_43( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2 == 1)
  {
    id v17 = v5;
    [*(id *)(a1 + 32) _decreaseInFlightOperationsForTargetIdentities:*(void *)(a1 + 40)];
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(a1 + 48) objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          rbs_assertion_log();
          __int128 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            dispatch_queue_t v26 = v12;
            _os_log_impl(&dword_188634000, v13, OS_LOG_TYPE_INFO, "Finished acquiring assertion %{public}@", buf, 0xCu);
          }
        }

        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }

      while (v9);
    }

    uint64_t v6 = v17;
    if (*(void *)(a1 + 56)
      && [*(id *)(a1 + 32) _decreaseInFlightOperationsForOriginator:*(void *)(a1 + 64)])
    {
      uint64_t v14 = *(void *)(a1 + 32);
      BOOL v15 = *(void **)(v14 + 144);
      uint64_t v16 = *(void *)(v14 + 8);
      v18[0] = MEMORY[0x1895F87A8];
      v18[1] = 3221225472LL;
      v18[2] = __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_44;
      v18[3] = &unk_18A255B00;
      id v19 = *(id *)(a1 + 72);
      id v20 = *(id *)(a1 + 56);
      [v15 executeAfter:v16 onQueue:v18 block:0.01];
    }
  }

  if (*(void *)(a1 + 104) == a2) {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16LL))();
  }
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_44(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  rbs_process_log();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138543362;
    uint64_t v5 = v3;
    _os_log_impl(&dword_188634000, v2, OS_LOG_TYPE_DEFAULT, "Resuming connection from %{public}@", (uint8_t *)&v4, 0xCu);
  }

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_46(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [*(id *)(a1 + 48) identifiersToInvalidate];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v2 _acquireAssertions:v3 invalidateIdentifiers:v4 forOriginatorProcess:*(void *)(a1 + 56) completionPolicy:*(void *)(a1 + 80) acquisitionErrorsByIndex:*(void *)(a1 + 64) completeStage:*(void *)(a1 + 72)];
}

- (void)acquireAssertionWithContext:(id)a3 completion:(id)a4
{
  v17[1] = *MEMORY[0x1895F89C0];
  id v6 = a4;
  id v7 = a3;
  [v7 process];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 descriptor];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  [MEMORY[0x189603F18] arrayWithObjects:v17 count:1];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBAssertionBatchContext contextForProcess:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:]( &OBJC_CLASS___RBAssertionBatchContext,  "contextForProcess:withDescriptorsToAcquire:identifiersToInvalidate:daemonContext:",  v8,  v10,  MEMORY[0x189604A58],  self->_daemonContext);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setUnitTesting:", objc_msgSend(v7, "unitTesting"));
  [v7 holdToken];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setHoldToken:v12];

  objc_msgSend(v11, "setAllowAbstractTarget:", objc_msgSend(v7, "allowAbstractTarget"));
  uint64_t v13 = [v7 acquisitionPolicy];

  [v11 setAcquisitionPolicy:v13];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __61__RBAssertionManager_acquireAssertionWithContext_completion___block_invoke;
  v15[3] = &unk_18A255DC8;
  id v16 = v6;
  id v14 = v6;
  -[RBAssertionManager commitBatchWithContext:completion:](self, "commitBatchWithContext:completion:", v11, v15);
}

void __61__RBAssertionManager_acquireAssertionWithContext_completion___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (a4)
  {
    (*(void (**)(void, uint64_t))(v4 + 16))(*(void *)(a1 + 32), a4);
  }

  else
  {
    [a3 objectForKeyedSubscript:&unk_18A26EAE0];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
  }

- (BOOL)invalidateAssertionFromOriginator:(id)a3 sync:(BOOL)a4 withIdentifier:(id)a5
{
  BOOL v5 = a4;
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v7 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v7);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v7))
  {
    -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v7);
    os_unfair_lock_unlock(&self->_lock);
    if (!v8)
    {
      BOOL v9 = 1;
      goto LABEL_9;
    }

- (BOOL)invalidateAssertionFromOriginator:(id)a3 withIdentifier:(id)a4
{
  return -[RBAssertionManager invalidateAssertionFromOriginator:sync:withIdentifier:]( self,  "invalidateAssertionFromOriginator:sync:withIdentifier:",  a3,  0LL,  a4);
}

- (BOOL)invalidateAssertionWithIdentifier:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    [MEMORY[0x1896077D8] currentHandler];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a2, self, @"RBAssertionManager.m", 429, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];
  }

  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  BOOL v7 = -[RBAssertionManager invalidateAssertion:](self, "invalidateAssertion:", v6);

  return v7;
}

- (BOOL)_invalidateAssertion:(id)a3 sync:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    os_unfair_lock_lock(&self->_lock);
    [MEMORY[0x189604010] setWithObject:v6];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_invalidateAssertions:forceSync:](self, "_lock_invalidateAssertions:forceSync:", v7, v4);

    os_unfair_lock_unlock(&self->_lock);
  }

  else
  {
    rbs_assertion_log();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[RBAssertionManager _invalidateAssertion:sync:].cold.1(v8);
    }
  }

  return v6 != 0LL;
}

- (BOOL)invalidateAssertion:(id)a3
{
  return -[RBAssertionManager _invalidateAssertion:sync:](self, "_invalidateAssertion:sync:", a3, 0LL);
}

- (BOOL)invalidateAssertionsDueToCPUUsageViolationForProcessIdentifier:(id)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identity];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    __int128 v23 = v6;
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v7);
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v22 role];
    [MEMORY[0x189603FE0] set];
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v7);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v25;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v25 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if ([v15 maxCPUUsageViolationPolicyForRole:v8] == 1)
          {
            [v15 setInvalidationReason:5];
            [v9 addObject:v15];
          }
        }

        uint64_t v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }

      while (v12);
    }

    rbs_process_log();
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = [v4 pid];
      uint64_t v18 = [v9 count];
      *(_DWORD *)buf = 67240448;
      int v29 = v17;
      __int16 v30 = 2050;
      uint64_t v31 = v18;
      _os_log_impl( &dword_188634000,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}d violated CPU limit; removing %{public}lu assertions",
        buf,
        0x12u);
    }

    uint64_t v19 = [v9 count];
    BOOL v20 = v19 != 0;
    id v6 = v23;
    p_os_unfair_lock_t lock = &self->_lock;
    if (v19) {
      -[RBAssertionManager _lock_enqueueAssertionsForRemoval:](self, "_lock_enqueueAssertionsForRemoval:", v9);
    }
  }

  else
  {
    BOOL v20 = 0;
  }

  os_unfair_lock_unlock(p_lock);

  return v20;
}

- (id)assertionDescriptorsWithFlattenedAttributes:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionStateResolver assertionDescriptorsWithFlattenedAttributes:]( self->_stateResolver,  "assertionDescriptorsWithFlattenedAttributes:",  v3);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)limitationsForInstance:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x189612308];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v5 identity];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAssertionManager _remainingRuntimeForProcessIdentity:](self, "_remainingRuntimeForProcessIdentity:", v7);
  objc_msgSend(v6, "setRunTime:");

  return v6;
}

- (id)assertionsForOriginator:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    [MEMORY[0x189604010] set];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  id v6 = v5;

  return v6;
}

- (BOOL)hasAssertionWithIdentifier:(id)a3
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (id)popPluginHoldForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKey:](self->_pluginHoldsForAssertions, "objectForKey:", v4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    -[NSMutableDictionary removeObjectForKey:](self->_pluginHoldsForAssertions, "removeObjectForKey:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)processDidLaunch:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  [v4 identity];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessIndex addProcess:](self->_processIndex, "addProcess:", v4))
  {
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v6);
    BOOL v7 = (RBProcessState *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      BOOL v7 = -[RBProcessState initWithIdentity:](objc_alloc(&OBJC_CLASS___RBProcessState), "initWithIdentity:", v6);
      -[RBAssertionManager _lock_setState:forProcessIdentity:](self, "_lock_setState:forProcessIdentity:", v7, v6);
    }

    BOOL v20 = &self->_lock;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v21 = v6;
    __int128 v22 = self;
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v6, v7);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v14 setTargetProcessForAbstract:v4];
          if (!v11)
          {
            [MEMORY[0x189603FE0] set];
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
          }

          rbs_assertion_log();
          BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v31 = v4;
            __int16 v32 = 2112;
            uint64_t v33 = v14;
            _os_log_impl( &dword_188634000,  v15,  OS_LOG_TYPE_DEFAULT,  "%@: applying persistent assertion '%@'",  buf,  0x16u);
          }

          [v11 addObject:v14];
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }

      while (v10);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    self = v22;
    calloutQueue = (dispatch_queue_s *)v22->_calloutQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__RBAssertionManager_processDidLaunch___block_invoke;
    block[3] = &unk_18A255970;
    block[4] = v22;
    id v24 = v4;
    id v25 = v19;
    id v17 = v19;
    dispatch_async(calloutQueue, block);

    if (v11)
    {
      [MEMORY[0x189604010] set];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:]( v22,  "_lock_removeAssertions:andUpdateChangedAssertions:",  v18,  v11);
    }

    p_os_unfair_lock_t lock = v20;
    id v6 = v21;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  os_unfair_lock_unlock(p_lock);
  dispatch_sync((dispatch_queue_t)self->_calloutQueue, &__block_literal_global_55);
  -[RBAssertionManager _acquireUnderlyingAssertionForProcess:](self, "_acquireUnderlyingAssertionForProcess:", v4);
}

uint64_t __39__RBAssertionManager_processDidLaunch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "assertionManager:didAddProcess:withState:");
}

- (BOOL)isProcessForeground:(id)a3
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v4))
  {
    [v4 identity];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v6);
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      uint64_t v12 = *MEMORY[0x189612510];
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          __int128 v26 = 0u;
          __int128 v27 = 0u;
          [v14 inheritances];
          BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v15 allNamespaces];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();

          uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0LL; j != v18; ++j)
              {
                if (*(void *)v25 != v19) {
                  objc_enumerationMutation(v16);
                }
                if ([*(id *)(*((void *)&v24 + 1) + 8 * j) isEqual:v12])
                {

                  BOOL v21 = 1;
                  goto LABEL_23;
                }
              }

              uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v18) {
                continue;
              }
              break;
            }
          }

          uint64_t v11 = v23;
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        BOOL v21 = 0;
      }

      while (v10);
    }

    else
    {
      BOOL v21 = 0;
    }

- (void)processDidTerminate:(id)a3
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v4 = (RBProcessState *)a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (-[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v4))
  {
    -[NSMutableSet addObject:](self->_inFlightTerminations, "addObject:", v4);
    -[RBProcessState identity](v4, "identity");
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = -[RBProcessState identifier](v4, "identifier");
    rbs_process_log();
    BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v4;
      _os_log_impl( &dword_188634000,  v7,  OS_LOG_TYPE_DEFAULT,  "Removing assertions for terminated process: %{public}@",  buf,  0xCu);
    }

    uint64_t v34 = v4;

    id v8 = (void *)MEMORY[0x189603FE0];
    uint64_t v33 = (void *)v6;
    -[RBAssertionCollection assertionsForOriginator:](self->_assertions, "assertionsForOriginator:", v6);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setWithSet:v9];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189603FE0] set];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = (void *)MEMORY[0x189607968];
    -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
    objc_msgSend(v13, "numberWithDouble:");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v15 = v10;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          BOOL v20 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          if ([v20 startPolicy] == 3)
          {
            -[NSMapTable setObject:forKey:](self->_originatorExitTimesByAssertion, "setObject:forKey:", v14, v20);
            [v20 activate];
            [v12 addObject:v20];
            rbs_ttl_log();
            BOOL v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              [v20 identifier];
              __int128 v22 = (RBProcessState *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              uint64_t v50 = v22;
              _os_log_impl( &dword_188634000,  v21,  OS_LOG_TYPE_DEFAULT,  "Activating after-originator-exit assertion %{public}@",  buf,  0xCu);
            }
          }

          else
          {
            [v20 setInvalidationReason:1];
            [v11 addObject:v20];
          }
        }

        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }

      while (v17);
    }

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v35);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (uint64_t j = 0LL; j != v25; ++j)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          __int128 v28 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          if (([v28 isPersistent] & 1) == 0)
          {
            [v28 setInvalidationReason:1];
            [v11 addObject:v28];
          }
        }

        uint64_t v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }

      while (v25);
    }

    -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:]( self,  "_lock_removeAssertions:andUpdateChangedAssertions:",  v11,  v12);
    -[NSMutableDictionary removeObjectForKey:](self->_relativeStartTimesByTargetIdentity, "removeObjectForKey:", v35);
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v35);
    __int128 v29 = (RBProcessState *)objc_claimAutoreleasedReturnValue();
    if (!v29) {
      __int128 v29 = -[RBProcessState initWithIdentity:](objc_alloc(&OBJC_CLASS___RBProcessState), "initWithIdentity:", v35);
    }
    rbs_process_log();
    __int128 v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    id v4 = v34;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v50 = v29;
      _os_log_impl(&dword_188634000, v30, OS_LOG_TYPE_INFO, "Resolved state for exited process: %{public}@", buf, 0xCu);
    }

    -[RBProcessIndex removeProcess:](self->_processIndex, "removeProcess:", v34);
    -[NSMutableSet removeObject:](self->_inFlightTerminations, "removeObject:", v34);
    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __42__RBAssertionManager_processDidTerminate___block_invoke;
    block[3] = &unk_18A255970;
    block[4] = self;
    id v37 = v34;
    id v38 = v29;
    __int16 v32 = v29;
    dispatch_async((dispatch_queue_t)calloutQueue, block);
    -[RBAssertionManager _lock_removeStateForProcessIdentityIfNecessary:]( self,  "_lock_removeStateForProcessIdentityIfNecessary:",  v35);

    p_os_unfair_lock_t lock = &self->_lock;
  }

  -[NSMapTable removeObjectForKey:](self->_savedEndowments, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(p_lock);
}

uint64_t __42__RBAssertionManager_processDidTerminate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "assertionManager:didRemoveProcess:withState:");
}

- (id)stateForIdentity:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)processForIdentity:(id)a3
{
  return -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", a3);
}

- (void)revalidateAssertionsForProcessIdentities:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  [MEMORY[0x189603FE0] set];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        assertions = self->_assertions;
        v14[0] = v9;
        v14[1] = 3221225472LL;
        v14[2] = __63__RBAssertionManager_revalidateAssertionsForProcessIdentities___block_invoke;
        v14[3] = &unk_18A255E10;
        v14[4] = self;
        v14[5] = v11;
        id v15 = v5;
        -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:]( assertions,  "enumerateAssertionsForTargetProcessIdentity:withBlock:",  v11,  v14);
      }

      uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:]( self,  "_lock_removeAssertions:andUpdateChangedAssertions:",  v5,  0LL);
  os_unfair_lock_unlock(&self->_lock);
}

void __63__RBAssertionManager_revalidateAssertionsForProcessIdentities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  [v3 target];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)MEMORY[0x189612168];
  [v5 createRBSTarget];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 explanation];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 attributes];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v32 = (void *)v4;
  uint64_t v10 = [v6 descriptorWithIdentifier:v4 target:v7 explanation:v8 attributes:v9];

  [*(id *)(*(void *)(a1 + 32) + 56) processForIdentity:*(void *)(a1 + 40)];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 identifier];
  [*(id *)(*(void *)(a1 + 32) + 64) valueForIdentity:*(void *)(a1 + 40)];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 originator];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 identity];
  __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "valueForIdentity:");
  +[RBAssertionDescriptorValidatorContext context](&OBJC_CLASS___RBAssertionDescriptorValidatorContext, "context");
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v31 = (void *)v10;
  [v16 setAssertionDescriptor:v10];
  [v16 setOriginatorState:v15];
  [v16 setOriginatorProcess:v14];
  __int128 v28 = (void *)v15;
  [v16 setOriginatorState:v15];
  [*(id *)(*(void *)(a1 + 32) + 152) entitlementManager];
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 entitlementsForProcess:v14];
  __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setOriginatorEntitlements:v18];

  [v16 setTarget:v5];
  [v16 setTargetProcess:v11];
  [v16 setTargetIdentity:*(void *)(a1 + 40)];
  __int128 v30 = (void *)v12;
  [v16 setTargetIdentifier:v12];
  [v16 setTargetState:v13];
  [*(id *)(*(void *)(a1 + 32) + 152) entitlementManager];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 entitlementsForProcess:v11];
  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setTargetEntitlements:v20];

  objc_msgSend(*(id *)(a1 + 32), "_lock_savedEndowmentsForProcess:", v14);
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setSavedEndowments:v21];

  [*(id *)(*(void *)(a1 + 32) + 152) entitlementManager];
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setEntitlementManager:v22];

  [v16 setBundlePropertiesManager:*(void *)(*(void *)(a1 + 32) + 120)];
  [*(id *)(*(void *)(a1 + 32) + 152) domainAttributeManager];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 setDomainAttributeManager:v23];

  [v16 setSystemState:*(void *)(*(void *)(a1 + 32) + 224)];
  uint64_t v24 = *(void **)(*(void *)(a1 + 32) + 128LL);
  id v33 = 0LL;
  LODWORD(v12) = [v24 isAssertionValidForContext:v16 error:&v33];
  id v25 = v33;
  rbs_assertion_log();
  uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  __int128 v27 = v26;
  if ((_DWORD)v12)
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v3;
      _os_log_impl(&dword_188634000, v27, OS_LOG_TYPE_INFO, "Assertion %{public}@ revalidated correctly", buf, 0xCu);
    }
  }

  else
  {
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v3;
      _os_log_impl( &dword_188634000,  v27,  OS_LOG_TYPE_DEFAULT,  "Assertion %{public}@ is invalid because its target's properties have changed",  buf,  0xCu);
    }

    [v3 setInvalidationReason:6];
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (id)attributesForDomain:(id)a3 andName:(id)a4 context:(id)a5 withError:(id *)a6
{
  daemonContext = self->_daemonContext;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 attributesForDomain:v12 andName:v11 context:v10 withError:a6];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)originatorEntitlementsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 originatorEntitlementsForDomain:v7 andName:v6];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)endowmentNamespaceForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 endowmentNamespaceForDomain:v7 andName:v6];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)containsAttributeWithDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  char v9 = [v8 containsAttributeWithDomain:v7 andName:v6];

  return v9;
}

- (id)allEntitlements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 allEntitlements];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)areTargetPropertiesValidForContext:(id)a3 forAttributeWithDomain:(id)a4 andName:(id)a5
{
  daemonContext = self->_daemonContext;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  char v12 = [v11 areTargetPropertiesValidForContext:v10 forAttributeWithDomain:v9 andName:v8];

  return v12;
}

- (id)additionalRestrictionsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 additionalRestrictionsForDomain:v7 andName:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)restrictionsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 restrictionsForDomain:v7 andName:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)targetEntitlementsForDomain:(id)a3 andName:(id)a4
{
  daemonContext = self->_daemonContext;
  id v6 = a4;
  id v7 = a3;
  -[RBDaemonContextProviding domainAttributeManager](daemonContext, "domainAttributeManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 targetEntitlementsForDomain:v7 andName:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)eventQueue:(id)a3 handleAssertionsExpirationWarningEventForProcessIdentity:(id)a4 expirationTime:(double)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  p_os_unfair_lock_t lock = &self->_lock;
  id v8 = a4;
  os_unfair_lock_lock(p_lock);
  -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    rbs_process_log();
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      __int128 v16 = v9;
      _os_log_impl( &dword_188634000,  v10,  OS_LOG_TYPE_DEFAULT,  "Assertions for process will expire soon: %{public}@",  buf,  0xCu);
    }

    calloutQueue = self->_calloutQueue;
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __105__RBAssertionManager_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime___block_invoke;
    block[3] = &unk_18A255E38;
    block[4] = self;
    id v13 = v9;
    double v14 = a5;
    dispatch_async((dispatch_queue_t)calloutQueue, block);
  }

  os_unfair_lock_unlock(p_lock);
}

uint64_t __105__RBAssertionManager_eventQueue_handleAssertionsExpirationWarningEventForProcessIdentity_expirationTime___block_invoke( uint64_t a1)
{
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + 32),  "assertionManager:willExpireAssertionsSoonForProcess:expirationTime:",  *(double *)(a1 + 48));
}

- (void)eventQueue:(id)a3 handleWarningEventForAssertion:(id)a4
{
  id v5 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (-[RBAssertionCollection hasAssertion:](self->_assertions, "hasAssertion:", v5))
  {
    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __64__RBAssertionManager_eventQueue_handleWarningEventForAssertion___block_invoke;
    v7[3] = &unk_18A255B00;
    v7[4] = self;
    id v8 = v5;
    dispatch_async((dispatch_queue_t)calloutQueue, v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

uint64_t __64__RBAssertionManager_eventQueue_handleWarningEventForAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) willInvalidateAssertion:*(void *)(a1 + 40)];
}

- (void)eventQueue:(id)a3 handleInvalidationEventForAssertion:(id)a4
{
  id v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  if ([v6 isValid])
  {
    [v6 setInvalidationReason:4];
    [MEMORY[0x189604010] setWithObject:v6];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_enqueueAssertionsForRemoval:](self, "_lock_enqueueAssertionsForRemoval:", v5);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (double)eventQueue:(id)a3 startTimeForAssertion:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v6 = a4;
  os_unfair_lock_lock(p_lock);
  -[RBAssertionManager _lock_startTimeForAssertion:](self, "_lock_startTimeForAssertion:", v6);
  double v8 = v7;

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (double)eventQueue:(id)a3 remainingRuntimeForProcessIdentity:(id)a4
{
  return result;
}

- (NSString)stateCaptureTitle
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (double)_remainingRuntimeForProcessIdentity:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  double v6 = v5;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v4);
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v31 = v4;
    char v10 = 0;
    char v11 = 0;
    uint64_t v12 = *(void *)v33;
    double v13 = 0.0;
    double v14 = 1.79769313e308;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v7);
        }
        __int128 v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if ([v16 isActive])
        {
          [v16 invalidationDuration];
          if (v17 <= 0.0)
          {
            [v16 processState];
            __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v28 = [v27 role] > 1;

            v11 |= v28;
          }

          else
          {
            double v18 = v17;
            -[RBAssertionManager _lock_startTimeForAssertion:](self, "_lock_startTimeForAssertion:", v16);
            double v20 = v19;
            uint64_t v21 = [v16 endPolicy];
            double v22 = v18 + v20 - v6;
            if (v14 >= v22) {
              double v23 = v22;
            }
            else {
              double v23 = v14;
            }
            if (v21 == 2) {
              double v14 = v23;
            }
            v10 |= v21 == 2;
            [v16 processState];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
            unsigned int v25 = [v24 role];

            if (v13 < v22 && v25 > 1) {
              double v13 = v22;
            }
          }
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }

    while (v9);

    os_unfair_lock_unlock(&self->_lock);
    if ((v11 & 1) != 0)
    {
      if ((v10 & 1) != 0) {
        double v13 = v14;
      }
      else {
        double v13 = *MEMORY[0x1896124A0];
      }
      id v4 = v31;
    }

    else
    {
      id v4 = v31;
      if ((v10 & 1) != 0)
      {
        if (v14 >= v13) {
          double v29 = v13;
        }
        else {
          double v29 = v14;
        }
        if (v13 > 0.0) {
          double v13 = v29;
        }
        else {
          double v13 = 0.0;
        }
      }
    }
  }

  else
  {

    os_unfair_lock_unlock(&self->_lock);
    double v13 = 0.0;
  }

  return v13;
}

- (id)_concreteTargetForTarget:(id)a3 allowAbstractTarget:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  if (!v7)
  {
    [MEMORY[0x1896077D8] currentHandler];
    double v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 handleFailureInMethod:a2, self, @"RBAssertionManager.m", 903, @"Invalid parameter not satisfying: %@", @"target" object file lineNumber description];
  }

  if (![v7 isSystem])
  {
    [v7 processIdentity];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    processIndex = self->_processIndex;
    if (v9)
    {
      -[RBProcessIndex processForIdentity:](processIndex, "processForIdentity:", v9);
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      [v7 processIdentifier];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBProcessIndex processForIdentifier:](processIndex, "processForIdentifier:", v12);
      char v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if ([v11 isTerminating])
    {
      rbs_assertion_log();
      double v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        double v20 = v11;
        _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_DEFAULT,  "ignoring %{public}@ as candidate for concrete target as it is terminating",  buf,  0xCu);
      }

      char v11 = 0LL;
      uint64_t v8 = 0LL;
      if (!v4) {
        goto LABEL_21;
      }
    }

    else if (!v4)
    {
      if (v11)
      {
        [v7 environment];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[RBConcreteTarget targetWithProcess:environment:]( &OBJC_CLASS___RBConcreteTarget,  "targetWithProcess:environment:",  v11,  v15);
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
        goto LABEL_22;
      }

      goto LABEL_20;
    }

    if (v9)
    {
      id v14 = v9;
LABEL_19:
      [v7 environment];
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RBConcreteTarget targetWithIdentity:environment:]( &OBJC_CLASS___RBConcreteTarget,  "targetWithIdentity:environment:",  v14,  v16);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_21;
    }

    [v11 identity];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (v14) {
      goto LABEL_19;
    }
LABEL_20:
    uint64_t v8 = 0LL;
    goto LABEL_21;
  }

  +[RBConcreteTarget systemTarget](&OBJC_CLASS___RBConcreteTarget, "systemTarget");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v8;
}

- (void)_increaseInFlightOperationsForTargetIdentities:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_inFlightOperationsLock);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      uint64_t v9 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          -[NSCountedSet addObject:](self->_inFlightAssertionTargets, "addObject:", v11);
          if (-[NSCountedSet countForObject:](self->_inFlightAssertionTargets, "countForObject:", v11) == 1)
          {
            calloutQueue = self->_calloutQueue;
            block[0] = v9;
            block[1] = 3221225472LL;
            block[2] = __69__RBAssertionManager__increaseInFlightOperationsForTargetIdentities___block_invoke;
            block[3] = &unk_18A255B00;
            block[4] = self;
            void block[5] = v11;
            dispatch_async((dispatch_queue_t)calloutQueue, block);
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v7);
    }

    os_unfair_lock_unlock(&self->_inFlightOperationsLock);
  }
}

uint64_t __69__RBAssertionManager__increaseInFlightOperationsForTargetIdentities___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didBeginTrackingInFightUpdatesForProcessIdentity:*(void *)(a1 + 40)];
}

- (void)_decreaseInFlightOperationsForTargetIdentities:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_inFlightOperationsLock);
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      uint64_t v9 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          -[NSCountedSet removeObject:](self->_inFlightAssertionTargets, "removeObject:", v11);
          if (!-[NSCountedSet countForObject:](self->_inFlightAssertionTargets, "countForObject:", v11))
          {
            calloutQueue = self->_calloutQueue;
            block[0] = v9;
            block[1] = 3221225472LL;
            block[2] = __69__RBAssertionManager__decreaseInFlightOperationsForTargetIdentities___block_invoke;
            block[3] = &unk_18A255B00;
            block[4] = self;
            void block[5] = v11;
            dispatch_async((dispatch_queue_t)calloutQueue, block);
          }
        }

        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }

      while (v7);
    }

    os_unfair_lock_unlock(&self->_inFlightOperationsLock);
  }
}

uint64_t __69__RBAssertionManager__decreaseInFlightOperationsForTargetIdentities___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didEndTrackingInFightUpdatesForProcessIdentity:*(void *)(a1 + 40)];
}

- (BOOL)_increaseInFlightOperationsForOriginator:(id)a3 andSuspendIfNeeded:(id)a4
{
  uint64_t v6 = (_xpc_connection_s *)a4;
  p_inFlightOperationsLock = &self->_inFlightOperationsLock;
  id v8 = a3;
  os_unfair_lock_lock(&self->_inFlightOperationsLock);
  -[NSMutableDictionary objectForKeyedSubscript:]( self->_originatorToInFlightOperationsCountMap,  "objectForKeyedSubscript:",  v8);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 unsignedIntegerValue] + 1;
  [MEMORY[0x189607968] numberWithUnsignedInteger:v10];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_originatorToInFlightOperationsCountMap,  "setObject:forKeyedSubscript:",  v11,  v8);

  unint64_t maxOperationsInFlight = self->_maxOperationsInFlight;
  if (v10 == maxOperationsInFlight) {
    xpc_connection_suspend(v6);
  }
  os_unfair_lock_unlock(p_inFlightOperationsLock);

  return v10 == maxOperationsInFlight;
}

- (BOOL)_decreaseInFlightOperationsForOriginator:(id)a3
{
  id v4 = a3;
  p_inFlightOperationsLock = &self->_inFlightOperationsLock;
  os_unfair_lock_lock(&self->_inFlightOperationsLock);
  -[NSMutableDictionary objectForKeyedSubscript:]( self->_originatorToInFlightOperationsCountMap,  "objectForKeyedSubscript:",  v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 unsignedIntegerValue];
    uint64_t v9 = v8 - 1;
    if (v8 == 1)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_originatorToInFlightOperationsCountMap,  "setObject:forKeyedSubscript:",  0LL,  v4);
    }

    else
    {
      [MEMORY[0x189607968] numberWithUnsignedInteger:v9];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_originatorToInFlightOperationsCountMap,  "setObject:forKeyedSubscript:",  v10,  v4);
    }
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  BOOL v11 = v9 == self->_maxOperationsInFlight - 1;
  os_unfair_lock_unlock(p_inFlightOperationsLock);

  return v11;
}

- (void)_lock_enqueueAssertionsForRemoval:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (-[NSMutableSet count](self->_invalidAssertions, "count"))
  {
    -[NSMutableSet unionSet:](self->_invalidAssertions, "unionSet:", v4);
  }

  else
  {
    uint64_t v5 = [v4 count];
    -[NSMutableSet unionSet:](self->_invalidAssertions, "unionSet:", v4);
    if (v5)
    {
      timeProvider = self->_timeProvider;
      uint64_t v7 = (void *)[MEMORY[0x1896123B0] sharedBackgroundWorkloop];
      v8[0] = MEMORY[0x1895F87A8];
      v8[1] = 3221225472LL;
      v8[2] = __56__RBAssertionManager__lock_enqueueAssertionsForRemoval___block_invoke;
      v8[3] = &unk_18A255C70;
      v8[4] = self;
      -[RBTimeProviding executeAfter:onQueue:block:](timeProvider, "executeAfter:onQueue:block:", v7, v8, 0.1);
    }
  }
}

uint64_t __56__RBAssertionManager__lock_enqueueAssertionsForRemoval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeInvalidAssertions];
}

- (void)_removeInvalidAssertions
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[RBAssertionManager _lock_removeInvalidAssertions](self, "_lock_removeInvalidAssertions");
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_removeInvalidAssertions
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  os_unfair_lock_assert_owner(&self->_lock);
  rbs_assertion_log();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = -[NSMutableSet count](self->_invalidAssertions, "count");
    int v6 = 134349056;
    uint64_t v7 = v4;
    _os_log_impl( &dword_188634000,  v3,  OS_LOG_TYPE_INFO,  "Processing invalidation queue with %{public}lu assertions",  (uint8_t *)&v6,  0xCu);
  }

  uint64_t v5 = (void *)-[NSMutableSet copy](self->_invalidAssertions, "copy");
  -[RBAssertionManager _lock_removeAssertions:andUpdateChangedAssertions:]( self,  "_lock_removeAssertions:andUpdateChangedAssertions:",  v5,  0LL);

  -[NSMutableSet removeAllObjects](self->_invalidAssertions, "removeAllObjects");
}

- (void)_lock_notifyDelegateOfProcessStateChangeSet:(id)a3
{
  id v4 = a3;
  activity_block[0] = MEMORY[0x1895F87A8];
  activity_block[1] = 3221225472LL;
  activity_block[2] = __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke;
  activity_block[3] = &unk_18A255B00;
  activity_block[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_188634000, "state notification", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 40) hasChanges])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    id v4 = *(dispatch_queue_s **)(v2 + 16);
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke_2;
    v5[3] = &unk_18A255B00;
    v5[4] = v2;
    id v6 = v3;
    dispatch_async(v4, v5);
  }

uint64_t __66__RBAssertionManager__lock_notifyDelegateOfProcessStateChangeSet___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didUpdateProcessStates:*(void *)(a1 + 40) completion:0];
}

- (id)_lock_targetIdentitiesInAssertions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FE0] set];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "target", (void)v13);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identity];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11) {
          [v4 addObject:v11];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)_lock_originatorIdentifiersInAssertions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [MEMORY[0x189603FE0] set];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v9), "originator", (void)v13);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 identifier];
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11) {
          [v4 addObject:v11];
        }

        ++v9;
      }

      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return v4;
}

- (id)_lock_deactivateAssertions:(id)a3
{
  uint64_t v48 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  __int128 v34 = self;
  os_unfair_lock_assert_owner(&self->_lock);
  rbs_assertion_log();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v47 = [v5 count];
    _os_log_impl(&dword_188634000, v6, OS_LOG_TYPE_INFO, "Removing %{public}lu assertions", buf, 0xCu);
  }

  if ([v5 count])
  {
    SEL v31 = a2;
    context = (void *)MEMORY[0x1895C9F58]();
    [MEMORY[0x189603FC8] dictionary];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FE0] set];
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v33 = v5;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v41;
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v41 != v11) {
            objc_enumerationMutation(v8);
          }
          __int128 v13 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (![v13 invalidationReason])
          {
            [MEMORY[0x1896077D8] currentHandler];
            double v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 handleFailureInMethod:v31 object:self file:@"RBAssertionManager.m" lineNumber:1091 description:@"Must have an invalidation reason before we remove an assertion"];
          }

          [v13 target];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 identity];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15
            && [v13 definesRelativeStartTime]
            && [v13 isActive])
          {
            [v7 objectForKeyedSubscript:v15];
            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              __int128 v17 = v16;
              objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  objc_msgSend(v16, "unsignedIntegerValue") - 1);
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            }

            else
            {
              objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedInteger:",  -[RBAssertionManager _lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:",  v15)
              - 1);
              uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
            }

            [v7 setObject:v18 forKeyedSubscript:v15];
            if (![v18 unsignedIntegerValue])
            {
              rbs_assertion_log();
              uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                uint64_t v47 = (uint64_t)v15;
                _os_log_impl( &dword_188634000,  v19,  OS_LOG_TYPE_DEFAULT,  "Removed last relative-start-date-defining assertion for process %{public}@",  buf,  0xCu);
              }

              [v35 addObject:v15];
            }
          }
        }

        uint64_t v10 = [v8 countByEnumeratingWithState:&v40 objects:v45 count:16];
      }

      while (v10);
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    id v21 = v8;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (uint64_t j = 0LL; j != v23; ++j)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v21);
          }
          [*(id *)(*((void *)&v36 + 1) + 8 * j) deactivate];
        }

        uint64_t v23 = [v21 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }

      while (v23);
    }

    -[RBAssertionManager _lock_activateDelayedAssertionsForTargets:]( v34,  "_lock_activateDelayedAssertionsForTargets:",  v35);
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_targetIdentitiesInAssertions:](v34, "_lock_targetIdentitiesInAssertions:", v21);
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[RBAssertionManager _lock_clearStartTimesForUnbusyTargets:](v34, "_lock_clearStartTimesForUnbusyTargets:", v27);
    if (v26)
    {
      [v21 setByAddingObjectsFromSet:v26];
      id v28 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v28 = v21;
    }

    double v29 = v28;
    id v5 = v33;

    objc_autoreleasePoolPop(context);
  }

  else
  {
    double v29 = 0LL;
  }

  return v29;
}

- (void)_lock_finalizeRemovingAssertions:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        -[RBAssertionManager _lock_removeAssertion:]( self,  "_lock_removeAssertion:",  *(void *)(*((void *)&v18 + 1) + 8 * v8++));
      }

      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }

    while (v6);
  }

  -[RBAssertionManager _lock_targetIdentitiesInAssertions:](self, "_lock_targetIdentitiesInAssertions:", v4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
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
        -[RBAssertionManager _lock_removeStateForProcessIdentityIfNecessary:]( self,  "_lock_removeStateForProcessIdentityIfNecessary:",  *(void *)(*((void *)&v14 + 1) + 8 * v13++));
      }

      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }

    while (v11);
  }
}

- (void)_lock_notifyDelegateOfInvalidatedAssertions:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __66__RBAssertionManager__lock_notifyDelegateOfInvalidatedAssertions___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)calloutQueue, v7);
}

uint64_t __66__RBAssertionManager__lock_notifyDelegateOfInvalidatedAssertions___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didInvalidateAssertions:*(void *)(a1 + 40)];
}

- (void)_lock_removeAssertions:(id)a3 andUpdateChangedAssertions:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionManager _lock_deactivateAssertions:](self, "_lock_deactivateAssertions:", v11);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 count]) {
    [v8 unionSet:v7];
  }
  if ([v6 count]) {
    [v8 unionSet:v6];
  }
  uint64_t v9 = (void *)[v11 mutableCopy];
  -[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]( self,  "_lock_updateStatesDueToChangingAssertions:invalidatedAssertions:",  v8,  v9);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionManager _lock_finalizeRemovingAssertions:](self, "_lock_finalizeRemovingAssertions:", v9);
  -[RBAssertionManager _lock_notifyDelegateOfInvalidatedAssertions:]( self,  "_lock_notifyDelegateOfInvalidatedAssertions:",  v9);
  -[RBAssertionManager _lock_notifyDelegateOfProcessStateChangeSet:]( self,  "_lock_notifyDelegateOfProcessStateChangeSet:",  v10);
}

- (void)_lock_dumpAssertionsForTarget:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionManager _lock_sortedAssertionsForTarget:](self, "_lock_sortedAssertionsForTarget:", v4);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v5 count];
  rbs_assertion_log();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v4;
    __int16 v25 = 2048;
    uint64_t v26 = v17;
    _os_log_impl( &dword_188634000,  v6,  OS_LOG_TYPE_INFO,  "%{public}@ has %lu targeting assertions. Debug log lines of their details follow.",  buf,  0x16u);
  }

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    uint64_t v10 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        rbs_assertion_log();
        uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          ++v9;
          [v12 identifier];
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 explanation];
          __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 attributes];
          __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          id v24 = v4;
          __int16 v25 = 2048;
          uint64_t v26 = v9;
          __int16 v27 = 2048;
          uint64_t v28 = v17;
          __int16 v29 = 2114;
          __int128 v30 = v14;
          __int16 v31 = 2114;
          __int128 v32 = v15;
          __int16 v33 = 2114;
          __int128 v34 = v16;
          _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_INFO,  "%{public}@ assertion details %lu/%lu. ID:%{public}@ Explanation:%{public}@ Attributes:\n%{public}@",  buf,  0x3Eu);
        }
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v19 objects:v35 count:16];
    }

    while (v8);
  }
}

- (id)_lock_sortedAssertionsForTarget:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[RBAssertionCollection assertionsForTargetIdentity:](self->_assertions, "assertionsForTargetIdentity:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v6 allObjects];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 sortedArrayUsingComparator:&__block_literal_global_67];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __54__RBAssertionManager__lock_sortedAssertionsForTarget___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v4 = (void *)MEMORY[0x189607968];
  id v5 = a3;
  [a2 identifier];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v6, "count"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)MEMORY[0x189607968];
  [v5 identifier];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "numberWithUnsignedLongLong:", objc_msgSend(v9, "count"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v7 compare:v10];

  return v11;
}

- (void)_dumpAssertions
{
  timeProvider = self->_timeProvider;
  dispatch_get_global_queue(17LL, 0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __37__RBAssertionManager__dumpAssertions__block_invoke;
  v5[3] = &unk_18A255C70;
  v5[4] = self;
  -[RBTimeProviding executeAfter:onQueue:block:](timeProvider, "executeAfter:onQueue:block:", v4, v5, 600.0);
}

void __37__RBAssertionManager__dumpAssertions__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24LL));
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 192) copy];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend( *(id *)(a1 + 32),  "_lock_dumpAssertionsForTarget:",  *(void *)(*((void *)&v8 + 1) + 8 * v7++),  (void)v8);
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24LL));
  [*(id *)(a1 + 32) _dumpAssertions];
}

- (void)_lock_removeAssertion:(id)a3
{
  id v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionCollection removeAssertion:](self->_assertions, "removeAssertion:", v11);
  -[RBDaemonContextProviding historicalStatistics](self->_daemonContext, "historicalStatistics");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notifyAssertionCount:", -[RBAssertionCollection count](self->_assertions, "count"));

  -[RBDaemonContextProviding stateCaptureManager](self->_daemonContext, "stateCaptureManager");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 removeItem:v11];

  [v11 originator];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 identifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[RBAssertionCollection hasAssertionsForOriginator:](self->_assertions, "hasAssertionsForOriginator:", v7))
  {
    -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v7);
    __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v11 target];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identity];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    RBPowerlogEvent( 2LL,  v10,  -[RBAssertionCollection assertionCountForTargetProcessIdentity:]( self->_assertions,  "assertionCountForTargetProcessIdentity:",  v10),  0xFFFFFFFFLL);
  }
}

- (void)_lock_addAssertion:(id)a3
{
  id v11 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  bos_unfair_lock_t lock = MEMORY[0x1895F87A8];
  uint64_t v14 = 3221225472LL;
  __int128 v15 = __41__RBAssertionManager__lock_addAssertion___block_invoke;
  __int128 v16 = &unk_18A255C70;
  uint64_t v17 = self;
  if (_lock_addAssertion__onceToken != -1) {
    dispatch_once(&_lock_addAssertion__onceToken, &block);
  }
  objc_msgSend(v11, "originator", v11, block, v14, v15, v16, v17);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 identifier];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[RBAssertionCollection hasAssertionsForOriginator:](self->_assertions, "hasAssertionsForOriginator:", v5))
  {
    -[RBProcessIndex processForIdentifier:](self->_processIndex, "processForIdentifier:", v5);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[RBAssertionCollection addAssertion:](self->_assertions, "addAssertion:", v12);
  -[RBDaemonContextProviding historicalStatistics](self->_daemonContext, "historicalStatistics");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "notifyAssertionCount:", -[RBAssertionCollection count](self->_assertions, "count"));

  -[RBDaemonContextProviding stateCaptureManager](self->_daemonContext, "stateCaptureManager");
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 addItem:v12];

  [v12 target];
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 identity];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    RBPowerlogEvent( 1LL,  v10,  -[RBAssertionCollection assertionCountForTargetProcessIdentity:]( self->_assertions,  "assertionCountForTargetProcessIdentity:",  v10),  0xFFFFFFFFLL);
  }
}

uint64_t __41__RBAssertionManager__lock_addAssertion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dumpAssertions];
}

- (void)_lock_checkAssertionToInvalidateByCondition:(id)a3 condition:(id)a4 currentValue:(id)a5 assertionsToInvalidate:(id)a6
{
  id v16 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if ([v16 isActive])
  {
    [v16 intransientState];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 invalidatesOnConditions];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 objectForKey:v9];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (!v10) {
        -[RBAssertionManager _lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:].cold.1();
      }
      uint64_t v15 = [v10 integerValue];
      if (v15 > [v14 integerValue])
      {
        [v11 addObject:v16];
        [v16 setInvalidationReason:8];
      }
    }
  }
}

- (id)_lock_invalidateAssertionByConditions:(id)a3 changedAssertions:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x189603FE0] set];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        [v7 objectForKey:v12];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        assertions = self->_assertions;
        v18[0] = MEMORY[0x1895F87A8];
        v18[1] = 3221225472LL;
        v18[2] = __78__RBAssertionManager__lock_invalidateAssertionByConditions_changedAssertions___block_invoke;
        v18[3] = &unk_18A255EA0;
        void v18[4] = self;
        v18[5] = v12;
        id v19 = v13;
        id v20 = v6;
        id v15 = v13;
        -[RBAssertionCollection enumerateAssertionsWithBlock:](assertions, "enumerateAssertionsWithBlock:", v18);
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v9);
  }

  -[RBAssertionManager _lock_deactivateAssertions:](self, "_lock_deactivateAssertions:", v6);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __78__RBAssertionManager__lock_invalidateAssertionByConditions_changedAssertions___block_invoke( uint64_t a1,  uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "_lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:",  a2,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 56));
}

- (id)_lock_updateStatesDueToChangingAssertions:(id)a3 invalidatedAssertions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  __int128 v21 = __Block_byref_object_copy__1;
  __int128 v22 = __Block_byref_object_dispose__1;
  uint64_t v8 = objc_alloc(&OBJC_CLASS___RBProcessStateChangeSet);
  __int128 v23 = -[RBProcessStateChangeSet initWithChanges:](v8, "initWithChanges:", MEMORY[0x189604A58]);
  os_unfair_lock_assert_owner(&self->_lock);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke;
  v13[3] = &unk_18A255EC8;
  id v14 = v6;
  id v15 = self;
  id v16 = v7;
  uint64_t v17 = &v18;
  id v9 = v7;
  id v10 = v6;
  _os_activity_initiate(&dword_188634000, "state update", OS_ACTIVITY_FLAG_DEFAULT, v13);

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke( uint64_t a1)
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  id v45 = objc_alloc_init(MEMORY[0x189603FE0]);
  [*(id *)(*(void *)(a1 + 40) + 224) conditions];
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v43 = a1 + 56;
  id v44 = (id)objc_claimAutoreleasedReturnValue();
  while (1)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 176);
    if (v4)
    {
      [v4 systemState];
      id v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 setSystemState:v7];
    }

    else
    {
      objc_msgSend(*(id *)(v5 + 176), "setSystemState:", *(void *)(v5 + 224), v43);
    }

    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "resolveForAssertions:", v2, v43);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    id v9 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    [v8 changeSet];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 applyChanges:v10];

    id v11 = *(void **)(a1 + 40);
    [v8 gainedStartTimeDefining];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_lock_deactivateDelayedAssertionsForTargets:", v12);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

    id v14 = *(void **)(a1 + 40);
    [v8 lostStartTimeDefining];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_lock_activateDelayedAssertionsForTargets:", v15);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v48 = v16;
    [v16 setByAddingObjectsFromSet:v13];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      uint64_t v18 = *(void **)(a1 + 40);
      [v8 systemState];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 conditions];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      id v53 = 0LL;
      objc_msgSend(v18, "_lock_invalidateAssertionByConditions:changedAssertions:", v20, &v53);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v22 = v53;

      if ([v21 count])
      {
        if (!v22) {
          __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_3();
        }
        [*(id *)(a1 + 48) unionSet:v21];
        uint64_t v23 = [v17 setByAddingObjectsFromSet:v22];

        uint64_t v17 = (void *)v23;
      }

      else if (v22)
      {
        __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_2();
      }

      [v8 systemState];
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 conditions];
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      if (v44 == v25)
      {
      }

      else
      {
        if (v44 && v25)
        {
          char v26 = [v44 isEqual:v25];

          if ((v26 & 1) != 0) {
            goto LABEL_19;
          }
        }

        else
        {
        }

        [v8 systemState];
        __int16 v27 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v27 conditions];

        [*(id *)(*(void *)(a1 + 40) + 40) allAssertions];
        __int128 v24 = v17;
        id v44 = (id)v28;
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

LABEL_19:
    }

    id v2 = v17;
    if (v3 == 50) {
      break;
    }
    __int128 v46 = v17;
    uint64_t v47 = v13;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    [v8 changeSet];
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v50;
      do
      {
        for (uint64_t i = 0LL; i != v31; ++i)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v29);
          }
          __int128 v34 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          __int128 v35 = *(void **)(a1 + 40);
          [v34 updatedState];
          uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
          [v34 identity];
          __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "_lock_setState:forProcessIdentity:", v36, v37);
        }

        uint64_t v31 = [v29 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }

      while (v31);
    }

    ++v3;

    [v8 touchedAssertions];
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 unionSet:v38];

    id v2 = v46;
    [v46 anyObject];
    __int128 v39 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v4 = v8;
    if (!v39) {
      goto LABEL_33;
    }
  }

  rbs_assertion_log();
  __int128 v40 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
    __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_1( (uint64_t)v17,  v43,  v40);
  }

LABEL_33:
  __int128 v41 = *(void **)(a1 + 40);
  [v8 systemState];
  __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "_lock_setSystemState:", v42);

  [*(id *)(*(void *)(a1 + 40) + 184) updateEventsForAssertions:v45];
}

- (void)_lock_removeStateForProcessIdentityIfNecessary:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!-[RBAssertionCollection assertionCountForTargetProcessIdentity:]( self->_assertions,  "assertionCountForTargetProcessIdentity:",  v4)
    && !-[RBProcessIndex containsIdentity:](self->_processIndex, "containsIdentity:", v4))
  {
    -[RBProcessMap removeIdentity:](self->_stateMap, "removeIdentity:", v4);
    -[NSMutableSet removeObject:](self->_assertionTargets, "removeObject:", v4);
    rbs_process_log();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v10 = v4;
      _os_log_impl( &dword_188634000,  v5,  OS_LOG_TYPE_INFO,  "Ended tracking state for process identity %{public}@",  buf,  0xCu);
    }

    calloutQueue = self->_calloutQueue;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __69__RBAssertionManager__lock_removeStateForProcessIdentityIfNecessary___block_invoke;
    v7[3] = &unk_18A255B00;
    v7[4] = self;
    id v8 = v4;
    dispatch_async((dispatch_queue_t)calloutQueue, v7);
  }
}

uint64_t __69__RBAssertionManager__lock_removeStateForProcessIdentityIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didEndTrackingStateForProcessIdentity:*(void *)(a1 + 40)];
}

- (void)_lock_setState:(id)a3 forProcessIdentity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v8 = -[RBProcessMap containsIdentity:](self->_stateMap, "containsIdentity:", v7);
  id v9 = -[RBProcessMap setValue:forIdentity:](self->_stateMap, "setValue:forIdentity:", v6, v7);
  if (!v8)
  {
    -[NSMutableSet addObject:](self->_assertionTargets, "addObject:", v7);
    calloutQueue = self->_calloutQueue;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __56__RBAssertionManager__lock_setState_forProcessIdentity___block_invoke;
    v11[3] = &unk_18A255B00;
    v11[4] = self;
    id v12 = v7;
    dispatch_async((dispatch_queue_t)calloutQueue, v11);
  }
}

uint64_t __56__RBAssertionManager__lock_setState_forProcessIdentity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didBeginTrackingStateForProcessIdentity:*(void *)(a1 + 40)];
}

- (void)_lock_setSystemState:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (([v4 isEqual:self->_systemState] & 1) == 0)
  {
    uint64_t v5 = (void *)[v4 copy];
    objc_storeStrong((id *)&self->_systemState, v5);
    calloutQueue = self->_calloutQueue;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __43__RBAssertionManager__lock_setSystemState___block_invoke;
    v8[3] = &unk_18A255B00;
    v8[4] = self;
    id v9 = v5;
    id v7 = v5;
    dispatch_async((dispatch_queue_t)calloutQueue, v8);
  }
}

uint64_t __43__RBAssertionManager__lock_setSystemState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didResolveSystemState:*(void *)(a1 + 40)];
}

- (double)_lock_startTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [v4 creationTime];
  double v6 = v5;
  uint64_t v7 = [v4 startPolicy];
  if (v7 > 100)
  {
    if (v7 == 101)
    {
      -[RBAssertionManager _lock_relativeStartTimeForAssertion:](self, "_lock_relativeStartTimeForAssertion:", v4);
    }

    else
    {
      if (v7 != 102)
      {
        if (v7 == 103)
        {
          -[RBAssertionManager _lock_delayedStartTimeForAssertion:](self, "_lock_delayedStartTimeForAssertion:", v4);
          double v6 = v8;
          [v4 creationTime];
          if (v6 < v9) {
            double v6 = v9;
          }
        }

        goto LABEL_14;
      }

      -[RBAssertionManager _lock_delayedStartTimeForAssertion:](self, "_lock_delayedStartTimeForAssertion:", v4);
    }

- (double)_lock_invalidationTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBAssertionManager _lock_startTimeForAssertion:](self, "_lock_startTimeForAssertion:", v4);
  double v6 = v5;
  [v4 invalidationDuration];
  double v8 = v6 + v7;
  uint64_t v9 = [v4 startPolicy];

  return v8;
}

- (double)_lock_relativeStartTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  double v6 = v5;
  [v4 target];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identity];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (([v4 isActive] & 1) != 0
      || !-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:",  v8))
    {
      -[NSMutableDictionary objectForKeyedSubscript:]( self->_relativeStartTimesByTargetIdentity,  "objectForKeyedSubscript:",  v8);
      double v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = v10;
      if (v10)
      {
        [v10 doubleValue];
        double v6 = v12;
      }
    }

    else
    {
      -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
      double v6 = v9;
    }
  }

  return v6;
}

- (double)_lock_originatorExitTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  double v6 = v5;
  [v4 originator];
  double v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identifier];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if ([v4 isActive])
    {
      -[NSMapTable objectForKey:](self->_originatorExitTimesByAssertion, "objectForKey:", v4);
      double v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        double v10 = (void *)MEMORY[0x189607968];
        -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
        objc_msgSend(v10, "numberWithDouble:");
        double v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMapTable setObject:forKey:](self->_originatorExitTimesByAssertion, "setObject:forKey:", v9, v4);
        if (!v9) {
          -[RBAssertionManager _lock_originatorExitTimeForAssertion:].cold.1();
        }
      }

      [v9 doubleValue];
      double v6 = v11;
    }

    else
    {
      double v6 = 1.79769313e308;
    }
  }

  return v6;
}

- (id)_lock_deactivateDelayedAssertionsForTargets:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:",  v11))
        {
          assertions = self->_assertions;
          v14[0] = MEMORY[0x1895F87A8];
          v14[1] = 3221225472LL;
          v14[2] = __66__RBAssertionManager__lock_deactivateDelayedAssertionsForTargets___block_invoke;
          v14[3] = &unk_18A255EF0;
          id v15 = v5;
          -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:]( assertions,  "enumerateAssertionsForTargetProcessIdentity:withBlock:",  v11,  v14);
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v8);
  }

  return v5;
}

void __66__RBAssertionManager__lock_deactivateDelayedAssertionsForTargets___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (([v3 startPolicy] == 103 || objc_msgSend(v3, "startPolicy") == 102)
    && [v3 isActive]
    && ![v3 invalidationReason])
  {
    rbs_ttl_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl( &dword_188634000,  v4,  OS_LOG_TYPE_DEFAULT,  "Deactivating delayed assertion %{public}@",  (uint8_t *)&v5,  0xCu);
    }

    [v3 deactivate];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (id)_lock_activateDelayedAssertionsForTargets:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v4 count])
  {
    [MEMORY[0x189603FE0] set];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v16 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          double v12 = (void *)MEMORY[0x189607968];
          -[RBTimeProviding currentTime](self->_timeProvider, "currentTime", v16);
          objc_msgSend(v12, "numberWithDouble:");
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_relativeStartTimesByTargetIdentity,  "setObject:forKeyedSubscript:",  v13,  v11);

          if (!-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:",  v11))
          {
            assertions = self->_assertions;
            v17[0] = MEMORY[0x1895F87A8];
            v17[1] = 3221225472LL;
            void v17[2] = __64__RBAssertionManager__lock_activateDelayedAssertionsForTargets___block_invoke;
            v17[3] = &unk_18A255EF0;
            id v18 = v5;
            -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:]( assertions,  "enumerateAssertionsForTargetProcessIdentity:withBlock:",  v11,  v17);
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }

      while (v8);
    }

    id v4 = v16;
  }

  else
  {
    [MEMORY[0x189604010] set];
    int v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __64__RBAssertionManager__lock_activateDelayedAssertionsForTargets___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (([v3 startPolicy] & 0xFFFFFFFFFFFFFFFELL) == 0x66
    && ([v3 isActive] & 1) == 0
    && [v3 isValid])
  {
    rbs_ttl_log();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl( &dword_188634000,  v4,  OS_LOG_TYPE_DEFAULT,  "Activating delayed assertion %{public}@",  (uint8_t *)&v5,  0xCu);
    }

    [v3 activate];
    [*(id *)(a1 + 32) addObject:v3];
  }
}

- (void)_lock_clearStartTimesForUnbusyTargets:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if ([v4 count])
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    id v12 = v4;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v19;
      uint64_t v8 = MEMORY[0x1895F87A8];
      do
      {
        for (uint64_t i = 0LL; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if (!-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:",  v10,  v12))
          {
            uint64_t v14 = 0LL;
            id v15 = &v14;
            uint64_t v16 = 0x2020000000LL;
            char v17 = 0;
            assertions = self->_assertions;
            v13[0] = v8;
            v13[1] = 3221225472LL;
            v13[2] = __60__RBAssertionManager__lock_clearStartTimesForUnbusyTargets___block_invoke;
            v13[3] = &unk_18A255F18;
            void v13[4] = &v14;
            -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:]( assertions,  "enumerateAssertionsForTargetProcessIdentity:withBlock:",  v10,  v13);
            if (!*((_BYTE *)v15 + 24)) {
              -[NSMutableDictionary removeObjectForKey:]( self->_relativeStartTimesByTargetIdentity,  "removeObjectForKey:",  v10);
            }
            _Block_object_dispose(&v14, 8);
          }
        }

        uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }

      while (v6);
    }

    id v4 = v12;
  }
}

void __60__RBAssertionManager__lock_clearStartTimesForUnbusyTargets___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)([v3 startPolicy] - 101) <= 2
    && [v3 isActive]
    && [v3 isValid])
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
}

- (double)_lock_delayedStartTimeForAssertion:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  double v6 = v5;
  [v4 target];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 identity];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (([v4 isActive] & 1) != 0
      || !-[RBAssertionManager _lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:]( self,  "_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:",  v8))
    {
      -[NSMutableDictionary objectForKeyedSubscript:]( self->_relativeStartTimesByTargetIdentity,  "objectForKeyedSubscript:",  v8);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v10 = v9;
      if (v9)
      {
        [v9 doubleValue];
        double v6 = v11;
      }
    }

    else
    {
      double v6 = 1.79769313e308;
    }
  }

  return v6;
}

- (unint64_t)_lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000LL;
  uint64_t v12 = 0LL;
  assertions = self->_assertions;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __88__RBAssertionManager__lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke;
  v8[3] = &unk_18A255F18;
  v8[4] = &v9;
  -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:]( assertions,  "enumerateAssertionsForTargetProcessIdentity:withBlock:",  v4,  v8);
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __88__RBAssertionManager__lock_numberOfStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
}

- (BOOL)_lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  assertions = self->_assertions;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __83__RBAssertionManager__lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke;
  v7[3] = &unk_18A255F18;
  v7[4] = &v8;
  -[RBAssertionCollection enumerateAssertionsForTargetProcessIdentity:withBlock:]( assertions,  "enumerateAssertionsForTargetProcessIdentity:withBlock:",  v4,  v7);
  LOBYTE(self) = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __83__RBAssertionManager__lock_hasStartTimeDefiningAssertionsForTargetProcessIdentity___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  id v5 = a2;
  if ([v5 definesRelativeStartTime] && objc_msgSend(v5, "isActive"))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }
}

- (void)_acquireUnderlyingAssertionForProcess:(id)a3
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy__1;
  uint64_t v31 = __Block_byref_object_dispose__1;
  [v4 underlyingAssertion];
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  if (!v28[5])
  {
    [v4 identity];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = [v5 isApplication];

    if (v6)
    {
      if (!os_variant_has_internal_content()
        || ([v4 identity],
            uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(),
            [v7 embeddedApplicationIdentifier],
            uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(),
            char v9 = [v8 hasPrefix:@"com.apple.runningboard.test"],
            v8,
            v7,
            (v9 & 1) == 0))
      {
        uint64_t v10 = (void *)v28[5];
        v28[5] = (uint64_t)@"defaultUnderlyingAppAssertion";

        rbs_assertion_log();
        char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          id v35 = v4;
          _os_log_impl( &dword_188634000,  v11,  OS_LOG_TYPE_DEFAULT,  "Using default underlying assertion for app: %{public}@",  buf,  0xCu);
        }
      }
    }
  }

  if (v28[5])
  {
    [v4 auditToken];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = v12 == 0LL;

    if (v13)
    {
      rbs_assertion_log();
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[RBAssertionManager _acquireUnderlyingAssertionForProcess:].cold.1();
      }
    }

    else
    {
      uint64_t v14 = (void *)MEMORY[0x189612168];
      [MEMORY[0x189612170] identifierWithClientPid:getpid()];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = (void *)MEMORY[0x189612388];
      [v4 identifier];
      char v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 targetWithProcessIdentifier:v17];
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [MEMORY[0x1896121D8] attributeWithDomain:@"com.apple.underlying" name:v28[5]];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v19;
      [MEMORY[0x189612118] attributeWithCompletionPolicy:1];
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[1] = v20;
      [MEMORY[0x189603F18] arrayWithObjects:v33 count:2];
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 descriptorWithIdentifier:v15 target:v18 explanation:@"RB Underlying Assertion" attributes:v21];
      __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      +[RBAssertionAcquisitionContext contextForProcess:withDescriptor:daemonContext:]( &OBJC_CLASS___RBAssertionAcquisitionContext,  "contextForProcess:withDescriptor:daemonContext:",  v4,  v22,  self->_daemonContext);
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke;
      v24[3] = &unk_18A255F40;
      id v25 = v4;
      char v26 = &v27;
      -[RBAssertionManager acquireAssertionWithContext:completion:]( self,  "acquireAssertionWithContext:completion:",  v23,  v24);
    }
  }

  _Block_object_dispose(&v27, 8);
}

void __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 userInfo];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 valueForKey:@"IgnoreOnReconnect"];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    rbs_assertion_log();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
        int v12 = 138543874;
        uint64_t v13 = v9;
        __int16 v14 = 2114;
        uint64_t v15 = v10;
        __int16 v16 = 2114;
        char v17 = v4;
        _os_log_impl( &dword_188634000,  v8,  OS_LOG_TYPE_INFO,  "Underlying assertion for %{public}@ with name %{public}@ failed to acquire with error %{public}@",  (uint8_t *)&v12,  0x20u);
      }
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke_cold_1(a1, (uint64_t)v4, v8);
    }
  }

  else
  {
    rbs_assertion_log();
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl( &dword_188634000,  (os_log_t)v5,  OS_LOG_TYPE_DEFAULT,  "Successfully acquired underlying assertion for %{public}@",  (uint8_t *)&v12,  0xCu);
    }
  }
}

- (void)_invalidateAssertionsWithContext:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FE0] set];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v15 = v4;
  [v4 identifiersToInvalidate];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        -[RBAssertionCollection assertionWithIdentifier:](self->_assertions, "assertionWithIdentifier:", v11, lock);
        int v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          [v5 addObject:v12];
        }

        else if (-[NSMutableSet containsObject:]( self->_acquiringAssertionIdentifiers,  "containsObject:",  v11))
        {
          -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v11);
        }

        else
        {
          rbs_assertion_log();
          uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v21 = v11;
            _os_log_error_impl( &dword_188634000,  v13,  OS_LOG_TYPE_ERROR,  "Attempt to invalidate nonexistent assertion failed for identifier %@",  buf,  0xCu);
          }
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }

    while (v8);
  }

  if ([v5 count]) {
    -[RBAssertionManager _lock_invalidateAssertions:forceSync:](self, "_lock_invalidateAssertions:forceSync:", v5, 0LL);
  }
  os_unfair_lock_unlock(lock);
}

- (BOOL)_lock_validateDescriptor:(id)a3 originatorProcess:(id)a4 originatorState:(id)a5 concreteTarget:(id)a6 targetProcess:(id)a7 targetIdentity:(id)a8 targetIdentifier:(id)a9 targetState:(id)a10 acquisitionContext:(id)a11 error:(id *)a12
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v39 = a11;
  id v38 = a10;
  id v37 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  os_unfair_lock_assert_owner(p_lock);
  +[RBAssertionDescriptorValidatorContext context](&OBJC_CLASS___RBAssertionDescriptorValidatorContext, "context");
  char v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setAssertionDescriptor:v25];

  [v26 setOriginatorProcess:v24];
  [v26 setOriginatorState:v23];

  [v26 setTarget:v22];
  [v26 setTargetProcess:v21];

  [v26 setTargetIdentity:v20];
  [v26 setTargetIdentifier:v37];

  [v26 setTargetState:v38];
  [v26 setAcquisitionContext:v39];

  -[RBDaemonContextProviding entitlementManager](self->_daemonContext, "entitlementManager");
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setEntitlementManager:v27];

  [v26 setBundlePropertiesManager:self->_bundlePropertiesManager];
  -[RBDaemonContextProviding domainAttributeManager](self->_daemonContext, "domainAttributeManager");
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setDomainAttributeManager:v28];

  -[RBAssertionManager _lock_savedEndowmentsForProcess:](self, "_lock_savedEndowmentsForProcess:", v24);
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

  [v26 setSavedEndowments:v29];
  [v26 setSystemState:self->_systemState];
  descriptorValidator = self->_descriptorValidator;
  id v40 = 0LL;
  char v31 = -[RBAssertionDescriptorValidating isAssertionValidForContext:error:]( descriptorValidator,  "isAssertionValidForContext:error:",  v26,  &v40);
  id v32 = v40;
  __int16 v33 = v32;
  if ((v31 & 1) == 0)
  {
    if (!v32)
    {
      [MEMORY[0x1896077D8] currentHandler];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 handleFailureInMethod:a2 object:self file:@"RBAssertionManager.m" lineNumber:1758 description:@"assertion validator failed to return error. this is required."];

      if (!a12) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }

    if (a12) {
LABEL_4:
    }
      *a12 = v33;
  }

- (id)_lock_assertionCreationAttributeContextForTargetIdentity:(id)a3 originator:(id)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS___RBAttributeContext);
  -[RBDaemonContextProviding entitlementManager](self->_daemonContext, "entitlementManager");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeContext setEntitlementManager:](v9, "setEntitlementManager:", v10);

  -[RBDaemonContextProviding domainAttributeManager](self->_daemonContext, "domainAttributeManager");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAttributeContext setDomainAttributeManager:](v9, "setDomainAttributeManager:", v11);

  -[RBAttributeContext setBundlePropertiesManager:](v9, "setBundlePropertiesManager:", self->_bundlePropertiesManager);
  -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v8);
  int v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAttributeContext setInitialProcessState:](v9, "setInitialProcessState:", v12);
  -[RBAssertionManager _lock_savedEndowmentsForProcess:](self, "_lock_savedEndowmentsForProcess:", v7);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBAttributeContext setSavedEndowments:](v9, "setSavedEndowments:", v13);
  -[RBAttributeContext setSystemState:](v9, "setSystemState:", self->_systemState);
  return v9;
}

- (BOOL)_lock_originatorHasExited:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3) {
    char v5 = [v3 isTerminating];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (id)_lock_createAssertionWithAcquisitionContext:(id)a3 attributeContext:(id)a4 concreteTarget:(id)a5 targetIdentity:(id)a6 originator:(id)a7 error:(id *)a8
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a4;
  [v14 descriptor];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBTimeProviding currentTime](self->_timeProvider, "currentTime");
  +[RBAssertion assertionWithDescriptor:target:originator:context:creationTime:]( &OBJC_CLASS___RBAssertion,  "assertionWithDescriptor:target:originator:context:creationTime:",  v19,  v15,  v17,  v18);
  id v20 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v21 = [v20 startPolicy];
  if (v21 <= 100)
  {
    if ((unint64_t)v21 >= 3)
    {
      if (v21 != 3) {
        goto LABEL_22;
      }
      BOOL v22 = -[RBAssertionManager _lock_originatorHasExited:](self, "_lock_originatorHasExited:", v20);
      rbs_ttl_log();
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          *(_DWORD *)buf = 138543362;
          __int128 v50 = v20;
          id v25 = "Assertion %{public}@ will be created as active as originator process has exited";
LABEL_14:
          _os_log_impl(&dword_188634000, v23, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
          goto LABEL_15;
        }

        goto LABEL_15;
      }

      if (v24)
      {
        *(_DWORD *)buf = 138543362;
        __int128 v50 = v20;
        uint64_t v28 = "Assertion %{public}@ will be created as inactive as originator process has not exited";
        goto LABEL_20;
      }

      goto LABEL_21;
    }

- (id)_lock_createAssertionForDescriptor:(id)a3 originatorState:(id)a4 acquisitionContext:(id)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  [v9 target];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 process];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBAssertionManager _concreteTargetForTarget:allowAbstractTarget:]( self,  "_concreteTargetForTarget:allowAbstractTarget:",  v12,  [v11 allowAbstractTarget]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v11 allowAbstractTarget])
  {
    -[RBAssertionManager _concreteTargetForTarget:allowAbstractTarget:]( self,  "_concreteTargetForTarget:allowAbstractTarget:",  v12,  0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 process];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v16 = 0LL;
  }

  rbs_ttl_log();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v48 = v16;
  __int128 v49 = v13;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    [v14 description];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v19 = v18;
    if (!v18)
    {
      [v12 shortDescription];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v9 debugDescription];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    uint64_t v54 = v19;
    __int16 v55 = 2114;
    v56 = v49;
    __int16 v57 = 2114;
    uint64_t v58 = v20;
    _os_log_impl( &dword_188634000,  v17,  OS_LOG_TYPE_DEFAULT,  "Acquiring assertion targeting %{public}@ from originator %{public}@ with description %{public}@",  buf,  0x20u);
    if (!v18) {

    }
    id v16 = v48;
    uint64_t v13 = v49;
  }

  if (v14)
  {
    uint64_t v44 = v12;
    [v14 identity];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 process];
    BOOL v22 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = v22;
    id v47 = v10;
    if (v22)
    {
      id v24 = v22;
    }

    else
    {
      -[RBProcessIndex processForIdentity:](self->_processIndex, "processForIdentity:", v21);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
    }

    uint64_t v29 = v24;

    uint64_t v30 = [v29 identifier];
    -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v21);
    int v31 = (void *)objc_claimAutoreleasedReturnValue();
    id v50 = 0LL;
    uint64_t v43 = (void *)v30;
    id v32 = v9;
    BOOL v33 = -[RBAssertionManager _lock_validateDescriptor:originatorProcess:originatorState:concreteTarget:targetProcess:targetIdentity:targetIdentifier:targetState:acquisitionContext:error:]( self,  "_lock_validateDescriptor:originatorProcess:originatorState:concreteTarget:targetProcess:targetIdentity:targe tIdentifier:targetState:acquisitionContext:error:",  v9,  v13,  v47,  v14,  v29,  v21,  v30,  v31,  v11,  &v50);
    double v34 = v13;
    BOOL v35 = v33;
    id v36 = v50;
    double v37 = v36;
    if (v35)
    {
      -[RBAssertionManager _lock_assertionCreationAttributeContextForTargetIdentity:originator:]( self,  "_lock_assertionCreationAttributeContextForTargetIdentity:originator:",  v21,  v34);
      __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBAssertionManager _lock_createAssertionWithAcquisitionContext:attributeContext:concreteTarget:targetIdentity:originator:error:]( self,  "_lock_createAssertionWithAcquisitionContext:attributeContext:concreteTarget:targetIdentity:originator:error:",  v11);
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      id v27 = 0LL;

      if (v28)
      {
        id v9 = v32;
        id v16 = v48;
        if ([v11 allowAbstractTarget] && v48)
        {
          rbs_ttl_log();
          double v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            [v9 debugDescription];
            loga = v38;
            id v39 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            uint64_t v54 = v39;
            __int16 v55 = 2114;
            v56 = v48;
            _os_log_impl( &dword_188634000,  loga,  OS_LOG_TYPE_DEFAULT,  "setting abstract target for %{public}@ to %{public}@",  buf,  0x16u);

            double v38 = loga;
          }

          [v28 setTargetProcessForAbstract:v48];
        }

        id v40 = v28;
      }

      else
      {
        id v9 = v32;
        id v16 = v48;
        if (a6) {
          *a6 = v27;
        }
      }
    }

    else
    {
      if (a6)
      {
        id v27 = v36;
        uint64_t v28 = 0LL;
        *a6 = v27;
      }

      else
      {
        uint64_t v28 = 0LL;
        id v27 = v36;
      }

      id v9 = v32;
      id v16 = v48;
    }

    id v10 = v47;
    int v12 = v44;
    goto LABEL_33;
  }

  if (a6)
  {
    id v25 = (void *)MEMORY[0x189607870];
    uint64_t v26 = *MEMORY[0x1896123E0];
    uint64_t v51 = *MEMORY[0x1896075F0];
    __int128 v52 = @"Specified target process does not exist";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    [v25 errorWithDomain:v26 code:2 userInfo:v27];
    uint64_t v28 = 0LL;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

    uint64_t v13 = v49;
    goto LABEL_34;
  }

  uint64_t v28 = 0LL;
LABEL_34:

  return v28;
}

- (unint64_t)_lock_incomingAssertionCountForBatchContext:(id)a3 originatorIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [v6 descriptorsToAcquire];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v9 = [v8 count];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = v6;
  [v6 identifiersToInvalidate];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        -[RBAssertionCollection assertionWithIdentifier:]( self->_assertions,  "assertionWithIdentifier:",  *(void *)(*((void *)&v21 + 1) + 8 * v13));
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 originator];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 identifier];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        unsigned int v17 = [v16 isEqual:v7];

        v9 -= v17;
        ++v13;
      }

      while (v11 != v13);
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  return v9;
}

- (BOOL)_lock_willExceedAssertionLimitForOriginatorProcess:(id)a3 withIncomingCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  unint64_t maxAssertionsPerOriginator = self->_maxAssertionsPerOriginator;
  BOOL v9 = maxAssertionsPerOriginator >= a4;
  unint64_t v10 = maxAssertionsPerOriginator - a4;
  if (v10 != 0 && v9)
  {
    assertions = self->_assertions;
    [v6 identifier];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v13 = -[RBAssertionCollection hasAssertionsForOriginator:exceedingCount:]( assertions,  "hasAssertionsForOriginator:exceedingCount:",  v12,  v10);

    if (v13)
    {
      -[RBDaemonContextProviding entitlementManager](self->_daemonContext, "entitlementManager");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 entitlementsForProcess:v7];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      char v16 = [v15 hasEntitlement:@"com.apple.runningboard.performancetest"];

      char v17 = v16 ^ 1;
    }

    else
    {
      char v17 = 0;
    }
  }

  else
  {
    char v17 = 1;
  }

  return v17;
}

- (void)_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __84__RBAssertionManager__lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess___block_invoke;
  v7[3] = &unk_18A255B00;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)calloutQueue, v7);
}

uint64_t __84__RBAssertionManager__lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess___block_invoke( uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) assertionManager:*(void *)(a1 + 32) didRejectAcquisitionFromOriginatorWithExcessiveAssertions:*(void *)(a1 + 40)];
}

- (BOOL)_lock_enforceAssertionLimitIfNecessaryForBatchContext:(id)a3 originatorProcess:(id)a4 error:(id *)a5
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a3;
  [v8 identifier];
  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = -[RBAssertionManager _lock_incomingAssertionCountForBatchContext:originatorIdentifier:]( self,  "_lock_incomingAssertionCountForBatchContext:originatorIdentifier:",  v9,  v10);

  BOOL v12 = -[RBAssertionManager _lock_willExceedAssertionLimitForOriginatorProcess:withIncomingCount:]( self,  "_lock_willExceedAssertionLimitForOriginatorProcess:withIncomingCount:",  v8,  v11);
  if (v12)
  {
    -[RBAssertionManager _lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:]( self,  "_lock_notifyDelegateOfExcessiveAssertionsForOriginatorProcess:",  v8);
    if (a5)
    {
      BOOL v13 = (void *)MEMORY[0x189607870];
      uint64_t v14 = *MEMORY[0x1896123E0];
      uint64_t v17 = *MEMORY[0x1896075F0];
      v18[0] = @"Originator is holding too many assertions";
      [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 errorWithDomain:v14 code:2 userInfo:v15];
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v12;
}

- (id)_lock_createAssertionsForBatchContext:(id)a3 originatorState:(id)a4 errorsByIndex:(id)a5
{
  id v8 = a3;
  id v23 = a4;
  id v21 = a5;
  [v8 descriptorsToAcquire];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 count];

  [MEMORY[0x189603FC8] dictionary];
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    for (uint64_t i = 0LL; i != v10; ++i)
    {
      [v8 descriptorsToAcquire];
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 objectAtIndexedSubscript:i];
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

      [v8 acquisitionContextForDescriptor:v13];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v24 = 0LL;
      -[RBAssertionManager _lock_createAssertionForDescriptor:originatorState:acquisitionContext:error:]( self,  "_lock_createAssertionForDescriptor:originatorState:acquisitionContext:error:",  v13,  v23,  v14,  &v24);
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      id v16 = v24;
      if (v15)
      {
        acquiringAssertionIdentifiers = self->_acquiringAssertionIdentifiers;
        [v15 identifier];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](acquiringAssertionIdentifiers, "addObject:", v18);

        [MEMORY[0x189607968] numberWithUnsignedInteger:i];
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 setObject:v15 forKeyedSubscript:v19];
      }

      else
      {
        [MEMORY[0x189607968] numberWithUnsignedInteger:i];
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v21 setObject:v16 forKeyedSubscript:v19];
      }
    }
  }

  return v22;
}

- (id)_lock_deactivateExistingAssertionsDelayedByIncomingAssertions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [MEMORY[0x189603FE0] set];
  char v5 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "target", (void)v17);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 identity];
        BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();

        else {
          BOOL v14 = 1;
        }
        if (!v14 && ([v5 containsObject:v13] & 1) == 0) {
          [v5 addObject:v13];
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v8);
  }

  -[RBAssertionManager _lock_deactivateDelayedAssertionsForTargets:]( self,  "_lock_deactivateDelayedAssertionsForTargets:",  v5);
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_lock_invalidateAssertions:(id)a3 forceSync:(BOOL)a4
{
  int v4 = a4;
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        rbs_ttl_log();
        BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          [v12 originator];
          BOOL v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          id v23 = v12;
          __int16 v24 = 2114;
          id v25 = v14;
          _os_log_impl( &dword_188634000,  v13,  OS_LOG_TYPE_DEFAULT,  "Invalidating assertion %{public}@ from originator %{public}@",  buf,  0x16u);
        }

        [v12 setInvalidationReason:3];
        [v12 identifier];
        id v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((-[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v15) & 1) != 0)
        {
          -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v15);
        }

        else
        {
          [MEMORY[0x189604010] setWithObject:v12];
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionManager _lock_enqueueAssertionsForRemoval:](self, "_lock_enqueueAssertionsForRemoval:", v16);

          v4 |= [v12 invalidatesSynchronously];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v9);
  }

  if ((v4 & 1) != 0)
  {
    rbs_assertion_log();
    __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188634000, v17, OS_LOG_TYPE_INFO, "Invalidating assertions synchronously", buf, 2u);
    }

    -[RBAssertionManager _lock_removeInvalidAssertions](self, "_lock_removeInvalidAssertions");
  }
}

- (void)_acquireAssertions:(id)a3 invalidateIdentifiers:(id)a4 forOriginatorProcess:(id)a5 completionPolicy:(unint64_t)a6 acquisitionErrorsByIndex:(id)a7 completeStage:(id)a8
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  id v13 = a3;
  id v79 = a4;
  id v14 = a5;
  id v82 = a7;
  id v15 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workloop);
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [MEMORY[0x189603FE0] set];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE0] set];
  __int128 v83 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v111 = 0u;
  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v114 = 0u;
  id obj = v13;
  uint64_t v86 = [obj countByEnumeratingWithState:&v111 objects:v125 count:16];
  id v87 = v16;
  if (v86)
  {
    uint64_t v88 = *(void *)v112;
    uint64_t v80 = *MEMORY[0x1896075F0];
    uint64_t v81 = *MEMORY[0x1896123E0];
    *(void *)&__int128 v17 = 138543362LL;
    __int128 v75 = v17;
    __int128 v85 = v14;
    id v76 = v15;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v112 != v88) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v111 + 1) + 8 * v18);
        objc_msgSend(obj, "objectForKeyedSubscript:", v19, v75);
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v21 = [v20 identifier];
        [v20 target];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v23 = [v22 process];
        v95 = (void *)v23;
        uint64_t v96 = v18;
        v93 = v22;
        char v94 = (void *)v21;
        uint64_t v89 = v19;
        int v92 = -[NSMutableSet containsObject:](self->_acquiringAssertionIdentifiers, "containsObject:", v21);
        if (!v23)
        {
          int v24 = 1;
          goto LABEL_10;
        }

        if (-[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v23))
        {
          int v24 = -[NSMutableSet containsObject:](self->_inFlightTerminations, "containsObject:", v23) ^ 1;
LABEL_10:
          int v90 = v24;
          goto LABEL_12;
        }

        int v90 = 0;
LABEL_12:
        BOOL v91 = -[RBProcessIndex containsProcess:](self->_processIndex, "containsProcess:", v14);
        id v99 = objc_alloc_init(MEMORY[0x189603FA8]);
        __int128 v107 = 0u;
        __int128 v108 = 0u;
        __int128 v109 = 0u;
        __int128 v110 = 0u;
        -[RBSystemState conditions](self->_systemState, "conditions");
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 allKeys];
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v27 = [v26 countByEnumeratingWithState:&v107 objects:v124 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v108;
          do
          {
            for (uint64_t i = 0LL; i != v28; ++i)
            {
              if (*(void *)v108 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v31 = *(void *)(*((void *)&v107 + 1) + 8 * i);
              [v20 intransientState];
              id v32 = (void *)objc_claimAutoreleasedReturnValue();
              [v32 invalidatesOnConditions];
              BOOL v33 = (void *)objc_claimAutoreleasedReturnValue();
              [v33 objectForKey:v31];
              double v34 = (void *)objc_claimAutoreleasedReturnValue();

              if (v34)
              {
                -[RBSystemState conditions](self->_systemState, "conditions");
                BOOL v35 = (void *)objc_claimAutoreleasedReturnValue();
                [v35 objectForKey:v31];
                id v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v36) {
                  -[RBAssertionManager _acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:].cold.1();
                }
                uint64_t v37 = [v36 integerValue];
              }
            }

            uint64_t v28 = [v26 countByEnumeratingWithState:&v107 objects:v124 count:16];
          }

          while (v28);
        }

        if ([v20 suspendsOnOriginatorSuspension])
        {
          id v14 = v85;
          id v16 = v87;
          id v39 = v93;
          double v38 = v94;
          if ([v85 isLifecycleManaged])
          {
            stateMap = self->_stateMap;
            [v85 identity];
            __int128 v41 = (void *)objc_claimAutoreleasedReturnValue();
            -[RBProcessMap valueForIdentity:](stateMap, "valueForIdentity:", v41);
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue();
            BOOL v43 = [v42 role] == 1;
          }

          else
          {
            BOOL v43 = 0;
          }
        }

        else
        {
          BOOL v43 = 0;
          id v14 = v85;
          id v16 = v87;
          id v39 = v93;
          double v38 = v94;
        }

        -[NSMutableSet removeObject:](self->_acquiringAssertionIdentifiers, "removeObject:", v38);
        if ([v99 count])
        {
          if (a6 != 1)
          {
            [v83 addObject:v20];
            rbs_assertion_log();
            __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v48 = v96;
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_40;
            }
            *(_DWORD *)buf = 138543618;
            v119 = v20;
            __int16 v120 = 2114;
            id v121 = v99;
            id v50 = v49;
            uint64_t v51 = "Invalidating assertion <%{public}@> on acquisition for unmet conditions: %{public}@";
            uint32_t v52 = 22;
            goto LABEL_39;
          }

          uint64_t v44 = (void *)MEMORY[0x189607870];
          uint64_t v122 = v80;
          v123 = @"Conditions do not allow this assertion";
          [MEMORY[0x189603F68] dictionaryWithObjects:&v123 forKeys:&v122 count:1];
          id v45 = (void *)objc_claimAutoreleasedReturnValue();
          [v44 errorWithDomain:v81 code:5 userInfo:v45];
          __int128 v46 = (void *)objc_claimAutoreleasedReturnValue();

          [v82 setObject:v46 forKeyedSubscript:v89];
          goto LABEL_42;
        }

        if (((v92 & v91 & v90 ^ 1 | v43) & 1) == 0)
        {
          -[RBAssertionManager _lock_addAssertion:](self, "_lock_addAssertion:", v20);
          [v16 addObject:v20];
LABEL_42:
          uint64_t v48 = v96;
          goto LABEL_43;
        }

        if ((v92 & v91 & v90 & v43) != 1)
        {
          if (((v92 & v91 ^ 1 | v90) & 1) != 0)
          {
            rbs_ttl_log();
            __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            uint64_t v48 = v96;
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v75;
              v119 = v20;
              id v50 = v49;
              uint64_t v51 = "Silently discarding acquired but invalid %{public}@";
              goto LABEL_52;
            }

void __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke_2;
  v5[3] = &unk_18A255F68;
  id v6 = *(id *)(a1 + 48);
  [v4 assertionManager:v2 didUpdateProcessStates:v3 completion:v5];
}

uint64_t __140__RBAssertionManager__acquireAssertions_invalidateIdentifiers_forOriginatorProcess_completionPolicy_acquisitionErrorsByIndex_completeStage___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (unint64_t)_lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions:(id)a3 completionPolicy:(unint64_t)a4
{
  unint64_t v35 = a4;
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x189603FC8] dictionary];
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
  uint64_t v37 = v6;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v41 = 0LL;
    uint64_t v9 = *(void *)v49;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v49 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", *(void *)(*((void *)&v48 + 1) + 8 * i), v35);
        unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 target];
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 process];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [v12 identity];
        id v15 = (void *)v14;
        if (v13) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = v14 == 0;
        }
        if (!v16)
        {
          __int128 v17 = self;
          -[RBProcessMap valueForIdentity:](self->_stateMap, "valueForIdentity:", v14);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v18 && [v11 isActive] && (objc_msgSend(v11, "isPersistent") & 1) == 0)
          {
            [v11 originator];
            id v39 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v19 = -[RBAssertionManager _lock_assertionCreationAttributeContextForTargetIdentity:originator:]( v17,  "_lock_assertionCreationAttributeContextForTargetIdentity:originator:",  v15,  v39);

            id v40 = (void *)v19;
            [v11 updateProcessStateWithAttributeContext:v19];
            __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              id v38 = v20;
              [v36 objectForKeyedSubscript:v15];
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                uint64_t v22 = v21;
                [v21 unionState:v38];
              }

              else
              {
                uint64_t v22 = (void *)[v38 mutableCopy];
                [v36 setObject:v22 forKeyedSubscript:v15];
              }

              __int128 v20 = v38;
            }

            ++v41;

            id v6 = v37;
          }

          self = v17;
        }
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }

    while (v8);
  }

  else
  {
    uint64_t v41 = 0LL;
  }

  if ([v36 count])
  {
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id v23 = v36;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v45;
      do
      {
        for (uint64_t j = 0LL; j != v25; ++j)
        {
          if (*(void *)v45 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v44 + 1) + 8 * j);
          objc_msgSend(v23, "objectForKeyedSubscript:", v28, v35);
          uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[RBAssertionManager _lock_setState:forProcessIdentity:](self, "_lock_setState:forProcessIdentity:", v29, v28);
        }

        uint64_t v25 = [v23 countByEnumeratingWithState:&v44 objects:v52 count:16];
      }

      while (v25);
    }

    unint64_t v30 = v35;
    if (v41 == [v37 count] && v35 == 1) {
      unint64_t v30 = 0LL;
    }
    id v32 = (void *)MEMORY[0x1896123C0];
    v42[0] = MEMORY[0x1895F87A8];
    v42[1] = 3221225472LL;
    v42[2] = __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke;
    v42[3] = &unk_18A255B00;
    v42[4] = self;
    id v43 = v23;
    BOOL v33 = v32;
    id v6 = v37;
    [v33 runWithoutContext:v42];
  }

  else
  {
    unint64_t v30 = v35;
  }

  return v30;
}

void __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(dispatch_queue_s **)(*(void *)(a1 + 32) + 16LL);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke_2;
  v6[3] = &unk_18A255B00;
  id v4 = v2;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v3, v6);
}

void __107__RBAssertionManager__lock_resolvePreliminaryStatesForNonExistingProcessesWithAssertions_completionPolicy___block_invoke_2( uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
        id v7 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v8 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]( objc_alloc(&OBJC_CLASS___RBProcessStateChange),  "initWithIdentity:originalState:updatedState:",  v6,  0LL,  v7);
        uint64_t v9 = objc_alloc(&OBJC_CLASS___RBProcessStateChangeSet);
        __int128 v17 = v8;
        [MEMORY[0x189603F18] arrayWithObjects:&v17 count:1];
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
        unint64_t v11 = -[RBProcessStateChangeSet initWithChanges:](v9, "initWithChanges:", v10);

        [*(id *)(*(void *)(a1 + 40) + 32) assertionManager:*(void *)(a1 + 40) didUpdateProcessStates:v11 completion:0];
      }

      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v3);
  }
}

- (BOOL)_lock_batchContextInvalidatesSynchronously:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  objc_msgSend(a3, "identifiersToInvalidate", 0);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        -[RBAssertionCollection assertionWithIdentifier:]( self->_assertions,  "assertionWithIdentifier:",  *(void *)(*((void *)&v13 + 1) + 8 * i));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
        char v10 = [v9 invalidatesSynchronously];

        if ((v10 & 1) != 0)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }

      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)addSavedEndowment:(id)a3 forProcess:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  savedEndowments = self->_savedEndowments;
  p_savedEndowments = (id *)&self->_savedEndowments;
  uint64_t v11 = -[NSMapTable objectForKey:](savedEndowments, "objectForKey:", v7);
  if (v11)
  {
    BOOL v12 = (void *)v11;
    [v6 key];
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 objectForKey:v13];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      BOOL v15 = 0;
      goto LABEL_7;
    }

    uint64_t v19 = (void *)[v12 mutableCopy];
    [v6 endowment];
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 key];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 setObject:v20 forKey:v21];

    id v22 = *p_savedEndowments;
    id v23 = (void *)[v19 copy];
    [v22 setObject:v23 forKey:v7];
  }

  else
  {
    __int128 v16 = (void *)MEMORY[0x189603F68];
    [v6 endowment];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 key];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 dictionaryWithObject:v17 forKey:v18];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

    [*p_savedEndowments setObject:v12 forKey:v7];
  }

  BOOL v15 = 1;
LABEL_7:
  rbs_assertion_log();
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    -[RBAssertionManager addSavedEndowment:forProcess:].cold.1(p_savedEndowments, v24);
  }

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (id)_lock_savedEndowmentsForProcess:(id)a3
{
  return -[NSMapTable objectForKey:](self->_savedEndowments, "objectForKey:", a3);
}

- (id)savedEndowmentsForProcess:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[RBAssertionManager _lock_savedEndowmentsForProcess:](self, "_lock_savedEndowmentsForProcess:", v5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
}

- (void)commitBatchWithContext:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3( &dword_188634000,  v0,  v1,  "Suspending connection from %{public}@ because there are too many assertions in flight",  v2);
  OUTLINED_FUNCTION_1_1();
}

void __56__RBAssertionManager_commitBatchWithContext_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Error committing batch context %@: %@",  (uint8_t *)&v4,  0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_invalidateAssertion:(os_log_t)log sync:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl( &dword_188634000,  log,  OS_LOG_TYPE_ERROR,  "Ignoring invalidation request for nil assertion",  v1,  2u);
}

- (void)isProcessForeground:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_188634000, v0, v1, "isProcessForeground called for untracked process: %{public}@", v2);
  OUTLINED_FUNCTION_1_1();
}

- (void)_lock_checkAssertionToInvalidateByCondition:condition:currentValue:assertionsToInvalidate:.cold.1()
{
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [*(id *)(*(void *)(*(void *)a2 + 8) + 40) processIdentities];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v5;
  _os_log_fault_impl( &dword_188634000,  a3,  OS_LOG_TYPE_FAULT,  "State resolution exceeded max depth, possible cycle in assertion activation, latest assertions %{public}@ and change d ids %{public}@",  (uint8_t *)&v6,  0x16u);
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_2()
{
  __assert_rtn( "-[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]_block_invoke",  "RBAssertionManager.m",  1333,  "changedAssertions == nil");
}

void __86__RBAssertionManager__lock_updateStatesDueToChangingAssertions_invalidatedAssertions___block_invoke_cold_3()
{
  __assert_rtn( "-[RBAssertionManager _lock_updateStatesDueToChangingAssertions:invalidatedAssertions:]_block_invoke",  "RBAssertionManager.m",  1329,  "changedAssertions != nil");
}

- (void)_lock_originatorExitTimeForAssertion:.cold.1()
{
  __assert_rtn( "-[RBAssertionManager _lock_originatorExitTimeForAssertion:]",  "RBAssertionManager.m",  1511,  "startTimeNumber != nil");
}

- (void)_acquireUnderlyingAssertionForProcess:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3( &dword_188634000,  v0,  v1,  "Not acquiring underlying assertion for %{public}@ as it has no audit token",  v2);
  OUTLINED_FUNCTION_1_1();
}

void __60__RBAssertionManager__acquireUnderlyingAssertionForProcess___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_fault_impl( &dword_188634000,  log,  OS_LOG_TYPE_FAULT,  "Underlying assertion for %{public}@ with name %{public}@ failed to acquire with error %{public}@",  (uint8_t *)&v5,  0x20u);
}

- (void)_acquireAssertions:invalidateIdentifiers:forOriginatorProcess:completionPolicy:acquisitionErrorsByIndex:completeStage:.cold.1()
{
}

- (void)addSavedEndowment:(id *)a1 forProcess:(os_log_s *)a2 .cold.1(id *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [*a1 description];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_188634000, a2, v4, "Saved endowments: %@", v5);
}

@end