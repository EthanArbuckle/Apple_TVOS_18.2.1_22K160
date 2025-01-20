@interface CKKSKeychainView
- (BOOL)_onQueueZoneIsReadyForFetching:(id)a3;
- (BOOL)_onqueueOtherDevicesReportHavingTLKs:(id)a3 trustStates:(id)a4;
- (BOOL)_onqueueResetAllInflightOQE:(id *)a3;
- (BOOL)allowOutOfBandFetch:(id *)a3;
- (BOOL)anyViewsInState:(id)a3;
- (BOOL)ckErrorOrPartialError:(id)a3 isError:(int64_t)a4 zoneID:(id)a5;
- (BOOL)firstManateeKeyFetched;
- (BOOL)halted;
- (BOOL)havoc;
- (BOOL)initiatedLocalScan;
- (BOOL)insideSQLTransaction;
- (BOOL)itemModificationsBeforePolicyLoaded;
- (BOOL)keyStateFullRefetchRequested;
- (BOOL)keyStateMachineRefetched;
- (BOOL)outgoingQueueEmpty:(id *)a3;
- (BOOL)scheduleOperationWithoutDependencies:(id)a3;
- (BOOL)setCurrentSyncingPolicy:(id)a3;
- (BOOL)setCurrentSyncingPolicy:(id)a3 policyIsFresh:(BOOL)a4;
- (BOOL)shouldRetryAfterFetchError:(id)a3 zoneID:(id)a4;
- (BOOL)unwrapKeysAndSaveToCache:(id)a3 syncKeys:(id)a4 error:(id *)a5;
- (BOOL)unwrapTLKAndSaveToCache:(id)a3 tlks:(id)a4 tlkShares:(id)a5 error:(id *)a6;
- (BOOL)waitForFetchAndIncomingQueueProcessing;
- (BOOL)waitForKeyHierarchyReadiness;
- (BOOL)waitForPolicy:(unint64_t)a3 error:(id *)a4;
- (BOOL)waitUntilAllOperationsAreFinished;
- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 errorOnNoCloudKitAccount:(BOOL)a5 errorOnPolicyMissing:(BOOL)a6 error:(id *)a7;
- (BOOL)zoneIsReadyForFetching:(id)a3;
- (CKContainer)container;
- (CKKSAccountStateTracker)accountTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSCondition)accountStateKnown;
- (CKKSCondition)loggedIn;
- (CKKSCondition)loggedOut;
- (CKKSCondition)policyLoaded;
- (CKKSCondition)trustStatusKnown;
- (CKKSCuttlefishAdapterProtocol)cuttlefishAdapter;
- (CKKSIncomingQueueOperation)lastIncomingQueueOperation;
- (CKKSKeychainView)initWithContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 accountTracker:(id)a6 lockStateTracker:(id)a7 reachabilityTracker:(id)a8 savedTLKNotifier:(id)a9 cloudKitClassDependencies:(id)a10 personaAdapter:(id)a11 accountsAdapter:(id)a12 cuttlefishAdapter:(id)a13;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)outgoingQueueOperationScheduler;
- (CKKSNearFutureScheduler)outgoingQueuePriorityOperationScheduler;
- (CKKSNearFutureScheduler)suggestTLKUpload;
- (CKKSNewTLKOperation)lastNewTLKOperation;
- (CKKSOperationDependencies)operationDependencies;
- (CKKSOutgoingQueueOperation)lastOutgoingQueueOperation;
- (CKKSProcessReceivedKeysOperation)lastProcessReceivedKeysOperation;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSReencryptOutgoingItemsOperation)lastReencryptOutgoingItemsOperation;
- (CKKSResultOperation)accountLoggedInDependency;
- (CKKSResultOperation)lastFixupOperation;
- (CKKSResultOperation)resultsOfNextIncomingQueueOperationOperation;
- (CKKSSecDbAdapter)databaseProvider;
- (CKKSSynchronizeOperation)lastSynchronizeOperation;
- (CKKSZoneChangeFetcher)zoneChangeFetcher;
- (NSArray)currentTrustStates;
- (NSDate)earliestFetchTime;
- (NSDictionary)stateConditions;
- (NSHashTable)outgoingQueueOperations;
- (NSMutableSet)resyncRecordsSeen;
- (NSOperation)holdIncomingQueueOperation;
- (NSOperation)holdLocalSynchronizeOperation;
- (NSOperation)holdOutgoingQueueOperation;
- (NSOperationQueue)operationQueue;
- (NSSet)viewAllowList;
- (NSSet)viewList;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)zoneName;
- (OS_dispatch_queue)queue;
- (OTAccountsAdapter)accountsAdapter;
- (OTPersonaAdapter)personaAdapter;
- (OctagonStateMachine)stateMachine;
- (OctagonStateMultiStateArrivalWatcher)priorityViewsProcessed;
- (TPSyncingPolicy)syncingPolicy;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)becomeReadyOperation:(id)a3;
- (id)createAccountLoggedInDependency:(id)a3;
- (id)createViewState:(id)a3 contextID:(id)a4 zoneIsNew:(BOOL)a5 priorityView:(BOOL)a6 ckksManagedView:(BOOL)a7;
- (id)externalManagedViewForRPC:(id)a3 error:(id *)a4;
- (id)fastStatus:(id)a3 zoneStateEntry:(id)a4;
- (id)findFirstPendingOperation:(id)a3;
- (id)findFirstPendingOperation:(id)a3 ofClass:(Class)a4;
- (id)findKeySets:(BOOL)a3;
- (id)intransactionSlowStatus:(id)a3;
- (id)loseTrustOperation:(id)a3;
- (id)participateInFetch:(id)a3;
- (id)performInitializedOperation;
- (id)policyDependentViewStateForName:(id)a3 error:(id *)a4;
- (id)policyDependentViewStateForName:(id)a3 timeout:(unint64_t)a4 error:(id *)a5;
- (id)resultsOfNextProcessIncomingQueueOperation;
- (id)resyncLocal;
- (id)resyncWithCloud;
- (id)rpcFetchAndProcessIncomingQueue:(id)a3 because:(id)a4 errorOnClassAFailure:(BOOL)a5;
- (id)rpcFetchBecause:(id)a3;
- (id)rpcProcessIncomingQueue:(id)a3 errorOnClassAFailure:(BOOL)a4;
- (id)rpcProcessOutgoingQueue:(id)a3 operationGroup:(id)a4;
- (id)rpcResetCloudKit:(id)a3 reply:(id)a4;
- (id)rpcResetLocal:(id)a3 reply:(id)a4;
- (id)rpcWaitForPriorityViewProcessing;
- (id)tlkMissingOperation:(id)a3;
- (id)updateDeviceState:(BOOL)a3 waitForKeyHierarchyInitialization:(unint64_t)a4 ckoperationGroup:(id)a5;
- (id)viewStateForName:(id)a3;
- (id)viewsForPeerID:(id)a3 error:(id *)a4;
- (id)viewsInState:(id)a3;
- (id)viewsRequiringTLKUpload;
- (id)zoneIDForViewHint:(id)a3 pcsShortcut:(BOOL)a4 error:(id *)a5;
- (int64_t)accountStatus;
- (int64_t)accountStatusFromCKAccountInfo:(id)a3;
- (int64_t)trustStatus;
- (void)_onqueuePokeKeyStateMachine;
- (void)_onqueuePrioritizePriorityViews;
- (void)_onqueueProcessOutgoingQueue:(id)a3 priorityRush:(BOOL)a4;
- (void)beginCloudKitOperation;
- (void)beginTrustedOperation:(id)a3 suggestTLKUpload:(id)a4 requestPolicyCheck:(id)a5;
- (void)cancelAllOperations;
- (void)cancelPendingOperations;
- (void)changesFetched:(id)a3 deletedRecordIDs:(id)a4 zoneID:(id)a5 newChangeToken:(id)a6 moreComing:(BOOL)a7 resync:(BOOL)a8;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)decryptCurrentItems:(id)a3 cache:(id)a4 complete:(id)a5;
- (void)decryptPCSIdentities:(id)a3 cache:(id)a4 complete:(id)a5;
- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3;
- (void)dispatchSyncWithSQLTransaction:(id)a3;
- (void)endTrustedOperation;
- (void)fetchCloudKitExternallyManagedViewKeyHierarchy:(id)a3 reply:(id)a4;
- (void)fetchExternallyManagedViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5;
- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7;
- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5;
- (void)halt;
- (void)handleCKLogin;
- (void)handleCKLogout;
- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6 rateLimiter:(id)a7;
- (void)keyStateMachineRequestProcess;
- (void)loadKeys:(id)a3 reply:(id)a4;
- (void)modifyTLKSharesForExternallyManagedView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6;
- (void)notifyForItem:(SecDbItem *)a3;
- (void)notifyPasswordsOrPCSChangedForAddedItem:(SecDbItem *)a3 modified:(SecDbItem *)a4 deleted:(SecDbItem *)a5;
- (void)onqueueCreatePriorityViewsProcessedWatcher;
- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4;
- (void)proposeTLKForExternallyManagedView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7;
- (void)receiveTLKUploadRecords:(id)a3;
- (void)resetExternallyManagedCloudKitView:(id)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6;
- (void)scanLocalItems;
- (void)scheduleOperation:(id)a3;
- (void)selfPeerChanged:(id)a3;
- (void)sendMetricForFirstManateeAccess;
- (void)setAccountLoggedInDependency:(id)a3;
- (void)setAccountStateKnown:(id)a3;
- (void)setAccountStatus:(int64_t)a3;
- (void)setAccountTracker:(id)a3;
- (void)setAccountsAdapter:(id)a3;
- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10;
- (void)setCurrentTrustStates:(id)a3;
- (void)setCuttlefishAdapter:(id)a3;
- (void)setDatabaseProvider:(id)a3;
- (void)setFirstManateeKeyFetched:(BOOL)a3;
- (void)setHalted:(BOOL)a3;
- (void)setHavoc:(BOOL)a3;
- (void)setHoldIncomingQueueOperation:(id)a3;
- (void)setHoldLocalSynchronizeOperation:(id)a3;
- (void)setHoldOutgoingQueueOperation:(id)a3;
- (void)setInitiatedLocalScan:(BOOL)a3;
- (void)setItemModificationsBeforePolicyLoaded:(BOOL)a3;
- (void)setKeyStateFullRefetchRequested:(BOOL)a3;
- (void)setKeyStateMachineRefetched:(BOOL)a3;
- (void)setLastFixupOperation:(id)a3;
- (void)setLastIncomingQueueOperation:(id)a3;
- (void)setLastNewTLKOperation:(id)a3;
- (void)setLastOutgoingQueueOperation:(id)a3;
- (void)setLastProcessReceivedKeysOperation:(id)a3;
- (void)setLastReencryptOutgoingItemsOperation:(id)a3;
- (void)setLastSynchronizeOperation:(id)a3;
- (void)setLockStateTracker:(id)a3;
- (void)setLoggedIn:(id)a3;
- (void)setLoggedOut:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setOutgoingQueueOperationScheduler:(id)a3;
- (void)setOutgoingQueueOperations:(id)a3;
- (void)setOutgoingQueuePriorityOperationScheduler:(id)a3;
- (void)setPersonaAdapter:(id)a3;
- (void)setPolicyLoaded:(id)a3;
- (void)setPriorityViewsProcessed:(id)a3;
- (void)setResultsOfNextIncomingQueueOperationOperation:(id)a3;
- (void)setResyncRecordsSeen:(id)a3;
- (void)setSuggestTLKUpload:(id)a3;
- (void)setSyncingViewsAllowList:(id)a3;
- (void)setTrustStatus:(int64_t)a3;
- (void)setTrustStatusKnown:(id)a3;
- (void)setViewAllowList:(id)a3;
- (void)setZoneChangeFetcher:(id)a3;
- (void)testDropPolicy;
- (void)toggleHavoc:(id)a3;
- (void)trustedPeerSetChanged:(id)a3;
- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6;
- (void)waitForOperationsOfClass:(Class)a3;
- (void)xpc24HrNotification;
@end

@implementation CKKSKeychainView

- (CKKSKeychainView)initWithContainer:(id)a3 contextID:(id)a4 activeAccount:(id)a5 accountTracker:(id)a6 lockStateTracker:(id)a7 reachabilityTracker:(id)a8 savedTLKNotifier:(id)a9 cloudKitClassDependencies:(id)a10 personaAdapter:(id)a11 accountsAdapter:(id)a12 cuttlefishAdapter:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v101 = a5;
  id v92 = a6;
  id v20 = a6;
  id v102 = a7;
  id v104 = a8;
  id v21 = a9;
  id v103 = a10;
  id v100 = a11;
  v22 = v18;
  v23 = v19;
  id v97 = a12;
  id v96 = a13;
  v110.receiver = self;
  v110.super_class = (Class)&OBJC_CLASS___CKKSKeychainView;
  v24 = -[CKKSKeychainView init](&v110, "init");
  v25 = v24;
  if (v24)
  {
    id v95 = v21;
    id v99 = v20;
    p_container = (id *)&v24->_container;
    objc_storeStrong((id *)&v24->_container, a3);
    objc_storeStrong((id *)&v25->_accountTracker, v92);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a8);
    objc_storeStrong((id *)&v25->_lockStateTracker, a7);
    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, a10);
    objc_storeStrong((id *)&v25->_personaAdapter, a11);
    objc_storeStrong((id *)&v25->_accountsAdapter, a12);
    zoneName = v25->_zoneName;
    v25->_zoneName = (NSString *)@"all";

    *(_WORD *)&v25->_halted = 0;
    v25->_accountStatus = 0LL;
    uint64_t v27 = objc_claimAutoreleasedReturnValue( -[CKKSKeychainView createAccountLoggedInDependency:]( v25,  "createAccountLoggedInDependency:",  @"CloudKit account logged in."));
    accountLoggedInDependency = v25->_accountLoggedInDependency;
    v25->_accountLoggedInDependency = (CKKSResultOperation *)v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue([v22 containerIdentifier]);
    id v30 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"CKKSQueue.%@.%@", v29, v19));
    v31 = (const char *)[v30 UTF8String];
    dispatch_queue_attr_t v32 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v33 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v32);
    dispatch_queue_t v34 = dispatch_queue_create(v31, v33);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v34;

    v36 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v25->_operationQueue;
    v25->_operationQueue = v36;

    v38 = -[CKKSSecDbAdapter initWithQueue:](objc_alloc(&OBJC_CLASS___CKKSSecDbAdapter), "initWithQueue:", v25->_queue);
    databaseProvider = v25->_databaseProvider;
    v25->_databaseProvider = v38;

    v40 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    loggedIn = v25->_loggedIn;
    v25->_loggedIn = v40;

    v42 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    loggedOut = v25->_loggedOut;
    v25->_loggedOut = v42;

    v44 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    accountStateKnown = v25->_accountStateKnown;
    v25->_accountStateKnown = v44;

    v25->_initiatedLocalScan = 0;
    v25->_trustStatus = 0LL;
    v46 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    trustStatusKnown = v25->_trustStatusKnown;
    v25->_trustStatusKnown = v46;

    uint64_t v48 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](&OBJC_CLASS___NSHashTable, "weakObjectsHashTable"));
    outgoingQueueOperations = v25->_outgoingQueueOperations;
    v25->_outgoingQueueOperations = (NSHashTable *)v48;

    currentTrustStates = v25->_currentTrustStates;
    v25->_currentTrustStates = (NSArray *)&__NSArray0__struct;

    resyncRecordsSeen = v25->_resyncRecordsSeen;
    v25->_resyncRecordsSeen = 0LL;

    v25->_firstManateeKeyFetched = 0;
    else {
      v52 = (const __CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ckks-%@",  v19));
    }
    v53 = objc_alloc(&OBJC_CLASS___OctagonStateMachine);
    if (qword_1002DE830 != -1) {
      dispatch_once(&qword_1002DE830, &stru_100283900);
    }
    id v54 = (id)qword_1002DE828;
    if (qword_1002DE840 != -1) {
      dispatch_once(&qword_1002DE840, &stru_100283920);
    }
    id v55 = (id)qword_1002DE838;
    v56 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:]( v53,  "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:",  v52,  v54,  v55,  @"wait_for_ck_account_status",  v25->_queue,  v25,  @"com.apple.ckks.state",  v102,  v104);
    stateMachine = v25->_stateMachine;
    v25->_stateMachine = v56;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v25);
    v93 = (__CFString *)v52;
    if (qword_1002DE960 != -1) {
      dispatch_once(&qword_1002DE960, &stru_1002849E8);
    }
    id v94 = v19;
    if (byte_1002DE968) {
      uint64_t v58 = 200000000LL;
    }
    else {
      uint64_t v58 = 1000000000LL;
    }
    if (byte_1002DE968) {
      uint64_t v59 = 200000000LL;
    }
    else {
      uint64_t v59 = 30000000000LL;
    }
    v60 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v61 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"outgoing-queue-scheduler"));
    v107[0] = _NSConcreteStackBlock;
    v107[1] = 3221225472LL;
    v107[2] = sub_100156FCC;
    v107[3] = &unk_100291A38;
    objc_copyWeak(&v108, &location);
    v62 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v60,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  v61,  v58,  v59,  0LL,  1003LL,  v107);
    outgoingQueueOperationScheduler = v25->_outgoingQueueOperationScheduler;
    v25->_outgoingQueueOperationScheduler = v62;

    v64 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v65 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"outgoing-queue-priority-scheduler"));
    v105[0] = _NSConcreteStackBlock;
    v105[1] = 3221225472LL;
    v105[2] = sub_100157018;
    v105[3] = &unk_100291A38;
    objc_copyWeak(&v106, &location);
    v66 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v64,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  v65,  500000000LL,  500000000LL,  0LL,  1003LL,  v105);
    outgoingQueuePriorityOperationScheduler = v25->_outgoingQueuePriorityOperationScheduler;
    v25->_outgoingQueuePriorityOperationScheduler = v66;

    v23 = v19;
    v68 = v22;
    v69 = -[SecLaunchSequence initWithRocketName:]( objc_alloc(&OBJC_CLASS___SecLaunchSequence),  "initWithRocketName:",  @"com.apple.security.ckks.launch");
    -[SecLaunchSequence addAttribute:value:](v69, "addAttribute:value:", @"view", @"global");
    v70 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    policyLoaded = v25->_policyLoaded;
    v25->_policyLoaded = v70;

    v72 = objc_alloc(&OBJC_CLASS___CKKSOperationDependencies);
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    v74 = (void *)objc_claimAutoreleasedReturnValue([*p_container privateCloudDatabase]);
    LOBYTE(v89) = 0;
    v75 = -[CKKSOperationDependencies initWithViewStates:contextID:activeAccount:ckdatabase:cloudKitClassDependencies:ckoperationGroup:flagHandler:overallLaunch:accountStateTracker:lockStateTracker:reachabilityTracker:peerProviders:databaseProvider:savedTLKNotifier:personaAdapter:sendMetric:]( v72,  "initWithViewStates:contextID:activeAccount:ckdatabase:cloudKitClassDependencies:ckoperationGroup:flagHandler :overallLaunch:accountStateTracker:lockStateTracker:reachabilityTracker:peerProviders:databaseProvider:saved TLKNotifier:personaAdapter:sendMetric:",  v73,  v94,  v101,  v74,  v25->_cloudKitClassDependencies,  0LL,  v25->_stateMachine,  v69,  v99,  v25->_lockStateTracker,  v104,  &__NSArray0__struct,  v25->_databaseProvider,  v95,  v100,  v89);
    operationDependencies = v25->_operationDependencies;
    v25->_operationDependencies = v75;

    v77 = objc_alloc(&OBJC_CLASS___CKKSZoneChangeFetcher);
    id v78 = [v103 fetchRecordZoneChangesOperationClass];
    reachabilityTracker = v25->_reachabilityTracker;
    v80 = (void *)objc_claimAutoreleasedReturnValue([v101 altDSID]);
    v81 = -[CKKSZoneChangeFetcher initWithContainer:fetchClass:reachabilityTracker:altDSID:sendMetric:]( v77,  "initWithContainer:fetchClass:reachabilityTracker:altDSID:sendMetric:",  v68,  v78,  reachabilityTracker,  v80,  0LL);
    zoneChangeFetcher = v25->_zoneChangeFetcher;
    v25->_zoneChangeFetcher = v81;

    v83 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:]( OctagonAPSReceiver,  "receiverForNamedDelegatePort:apsConnectionClass:",  @"com.apple.securityd.aps",  [v103 apsConnectionClass]));
    id v84 = [v83 registerCKKSReceiver:v25->_zoneChangeFetcher contextID:v94];
    v85 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    v86 = (void *)objc_claimAutoreleasedReturnValue([v101 altDSID]);
    v87 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v85,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v86,  kSecurityRTCEventNameLaunchStart,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  1LL);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v87,  1LL,  0LL);
    objc_storeStrong((id *)&v25->_cuttlefishAdapter, a13);
    -[OctagonStateMachine startOperation](v25->_stateMachine, "startOperation");

    objc_destroyWeak(&v106);
    objc_destroyWeak(&v108);
    objc_destroyWeak(&location);

    id v20 = v99;
    id v21 = v95;
    v22 = v68;
  }

  return v25;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 views]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: cid:%@ state:%@ views:%@>",  v5,  v7,  v9,  v11));

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 views]);
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: cid:%@ state:%@ views:%@ %p>",  v5,  v7,  v9,  v11,  self));

  return (NSString *)v12;
}

- (NSDictionary)stateConditions
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stateConditions]);

  return (NSDictionary *)v3;
}

- (id)performInitializedOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100156440;
  v4[3] = &unk_100291A88;
  objc_copyWeak(&v5, &location);
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"ckks-initialized-operation",  @"become_ready",  @"error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)rpcResetLocal:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v23 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  id v8 = sub_1000AA6AC(@"ckksreset", v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting local data reset", buf, 2u);
  }

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100156244;
  v24[3] = &unk_1002904F0;
  objc_copyWeak(&v26, &location);
  id v21 = v6;
  id v25 = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"set-zones",  @"resetlocal",  @"error",  v24));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  v35[2] = @"fetchcomplete";
  v35[3] = @"process_key_hierarchy";
  v35[0] = @"ready";
  v35[1] = @"initialized";
  v35[4] = @"waitfortrust";
  v35[5] = @"loggedout";
  v35[6] = @"error";
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v35, 7LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));
  v33 = @"resetlocal";
  v31 = @"initializing";
  v29[0] = @"initialized";
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  v29[1] = @"loggedout";
  v30[0] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  v30[1] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  dispatch_queue_attr_t v32 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
  dispatch_queue_t v34 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v17));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v10 doWatchedStateMachineRPC:@"local-reset" sourceStates:v12 path:v18 transitionOp:v22 reply:v23]);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v19;
}

- (id)rpcResetCloudKit:(id)a3 reply:(id)a4
{
  id v26 = a3;
  v28 = (void (**)(id, id))a4;
  id v36 = 0LL;
  LOBYTE(a4) = -[CKKSKeychainView waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:]( self,  "waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:",  @"reset-cloudkit",  0LL,  1LL,  1LL,  &v36);
  id v6 = v36;
  uint64_t v27 = v6;
  if ((a4 & 1) != 0)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v8 = sub_1000AA6AC(@"ckksreset", v7);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Requesting reset of CK zone (logged in)",  buf,  2u);
    }

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    void v29[2] = sub_100155FB4;
    v29[3] = &unk_1002904F0;
    objc_copyWeak(&v31, &location);
    id v30 = v26;
    id v25 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"set-zones",  @"resetzone",  @"error",  v29));
    uint64_t v48 = @"initializing";
    v46[0] = @"initialized";
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    v46[1] = @"loggedout";
    v47[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    v47[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v47,  v46,  2LL));
    v49 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    v45[0] = @"ready";
    v45[1] = @"initialized";
    v45[2] = @"fetchcomplete";
    v45[3] = @"process_key_hierarchy";
    v45[4] = @"waitfortrust";
    v45[5] = @"loggedout";
    v45[6] = @"error";
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v45, 7LL));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
    v43 = @"resetzone";
    v41[1] = @"resetzone";
    v42[0] = v13;
    v41[0] = @"resetlocal";
    v39[1] = @"resetzone";
    v40[0] = v13;
    v38 = v13;
    v39[0] = @"resetlocal";
    v37 = @"resetlocal";
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
    v40[1] = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));
    v42[1] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v42,  v41,  2LL));
    v44 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue( [v14 doWatchedStateMachineRPC:@"ckks-cloud-reset" sourceStates:v16 path:v21 transitionOp:v25 reply:v28]);

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  else
  {
    v28[2](v28, v6);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100155FA8;
    v34[3] = &unk_100290518;
    id v35 = v27;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"fail",  v34));
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    [v23 addOperation:v22];
  }

  return v22;
}

- (void)keyStateMachineRequestProcess
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v2 handleFlag:@"key_process_requested"];
}

- (void)_onqueuePokeKeyStateMachine
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v4 _onqueuePokeStateMachine];
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  if ([v9 _onqueueContains:@"ck_account_logged_out"])
  {
    [v9 _onqueueRemoveFlag:@"ck_account_logged_out"];
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v13 = sub_1000AA6AC(@"ckkskey", v12);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "CK account is not present", buf, 2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    [v15 setStateForActiveZones:@"loggedout"];

    v16 = objc_alloc(&OBJC_CLASS___CKKSLocalResetOperation);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v18 = -[CKKSLocalResetOperation initWithDependencies:intendedState:errorState:]( v16,  "initWithDependencies:intendedState:errorState:",  v17,  @"loggedout",  @"error");

    goto LABEL_35;
  }

  if ([v9 _onqueueContains:@"ck_zone_missing"])
  {
    [v9 _onqueueRemoveFlag:@"ck_zone_missing"];
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    [v19 setStateForActiveZones:@"initializing"];

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"ck-zone-missing",  @"resetlocal"));
LABEL_34:
    id v18 = (CKKSLocalResetOperation *)v20;
    goto LABEL_35;
  }

  if ([v9 _onqueueContains:@"ck_change_token_expired"])
  {
    [v9 _onqueueRemoveFlag:@"ck_change_token_expired"];
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    [v21 setStateForActiveZones:@"initializing"];

    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"ck-token-expired",  @"resetlocal"));
    goto LABEL_34;
  }

  if ([v8 isEqualToString:@"loggedout"])
  {
    if (([v9 _onqueueContains:@"ck_account_logged_in"] & 1) != 0
      || (id)-[CKKSKeychainView accountStatus](self, "accountStatus") == (id)1)
    {
      [v9 _onqueueRemoveFlag:@"ck_account_logged_in"];
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      id v23 = sub_1000AA6AC(@"ckkskey", v22);
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "CloudKit account now present", buf, 2u);
      }

- (id)becomeReadyOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001539D8;
  v8[3] = &unk_1002904F0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"become-ready",  v5,  @"error",  v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)loseTrustOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1001537D8;
  v8[3] = &unk_1002904F0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"lose-trust",  v5,  @"error",  v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)anyViewsInState:(id)a3
{
  id v4 = a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 views]);

  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) viewKeyHierarchyState]);
        unsigned __int8 v11 = [v10 isEqualToString:v4];

        if ((v11 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)viewsInState:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewsInState:v4]);

  return v6;
}

- (NSSet)viewList
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeManagedViews]);

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)v9) zoneID]);
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
        [v3 addObject:v11];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v7);
  }

  return (NSSet *)v3;
}

- (NSDate)earliestFetchTime
{
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 views]);

  id v5 = [v4 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v5)
  {

LABEL_17:
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));
    return (NSDate *)v7;
  }

  id v6 = v5;
  id v7 = 0LL;
  uint64_t v8 = *(void *)v24;
  id obj = v4;
  while (2)
  {
    for (i = 0LL; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(obj);
      }
      id v10 = *(void **)(*((void *)&v23 + 1) + 8LL * (void)i);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      v12 = (void *)objc_claimAutoreleasedReturnValue([v11 contextID]);
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSZoneStateEntry contextID:zoneName:]( &OBJC_CLASS___CKKSZoneStateEntry,  "contextID:zoneName:",  v12,  v13));

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 lastFetchTime]);
      if (!v15)
      {
        uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](&OBJC_CLASS___NSDate, "distantPast"));

        id v7 = (void *)v20;
        id v19 = obj;
        goto LABEL_14;
      }

      if (!v7
        || (__int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v14 lastFetchTime]),
            id v17 = [v7 compare:v16],
            v16,
            v17 == (id)1))
      {
        uint64_t v18 = objc_claimAutoreleasedReturnValue([v14 lastFetchTime]);

        id v7 = (void *)v18;
      }
    }

    id v19 = obj;
    id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v6) {
      continue;
    }
    break;
  }

- (BOOL)allowOutOfBandFetch:(id *)a3
{
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allCKKSManagedViews]);

  id obj = v5;
  id v30 = [v5 countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (!v30)
  {
    BOOL v20 = 0;
    goto LABEL_22;
  }

  uint64_t v31 = *(void *)v34;
  while (2)
  {
    for (i = 0LL; i != v30; i = (char *)i + 1)
    {
      if (*(void *)v34 != v31) {
        objc_enumerationMutation(obj);
      }
      id v7 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
      unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSZoneStateEntry contextID:zoneName:]( &OBJC_CLASS___CKKSZoneStateEntry,  "contextID:zoneName:",  v9,  v10));

      uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 lastFetchTime]);
      if (!v12
        || (__int128 v13 = (void *)v12,
            unsigned __int8 v14 = [v11 moreRecordsInCloudKit],
            v13,
            (v14 & 1) != 0))
      {
        BOOL v20 = 1;
        goto LABEL_21;
      }

      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 contextID]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      id v32 = 0LL;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSIncomingQueueEntry fetch:startingAtUUID:state:action:contextID:zoneID:error:]( &OBJC_CLASS___CKKSIncomingQueueEntry,  "fetch:startingAtUUID:state:action:contextID:zoneID:error:",  50LL,  0LL,  @"new",  0LL,  v16,  v17,  &v32));
      id v19 = v32;

      BOOL v20 = v19 == 0LL;
      if (!v19)
      {
        if (![v18 count]) {
          goto LABEL_14;
        }
        id v26 = 0LL;
LABEL_20:

LABEL_21:
        goto LABEL_22;
      }

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneID]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 zoneName]);
      id v23 = sub_1000AA6AC(@"ckks", v22);
      __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
        *(_DWORD *)buf = 138412546;
        v38 = v25;
        __int16 v39 = 2112;
        id v40 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Error fetching IQEs for zone %@: %@",  buf,  0x16u);
      }

      if (a3)
      {
        id v26 = v19;
        *a3 = v26;
        goto LABEL_20;
      }

- (id)tlkMissingOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100153228;
  v8[3] = &unk_1002904F0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"tlk-missing",  v5,  @"error",  v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)_onqueueOtherDevicesReportHavingTLKs:(id)a3 trustStates:(id)a4
{
  id v112 = a3;
  id v5 = a4;
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v7, "setDay:", -45LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  unsigned __int8 v109 = v7;
  v116 = (void *)objc_claimAutoreleasedReturnValue([v8 dateByAddingComponents:v7 toDate:v6 options:0]);

  id v9 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v9, "setDay:", -4LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
  id v108 = v9;
  objc_super v110 = (void *)v6;
  id v113 = (void *)objc_claimAutoreleasedReturnValue([v10 dateByAddingComponents:v9 toDate:v6 options:0]);

  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  __int128 v135 = 0u;
  __int128 v136 = 0u;
  __int128 v137 = 0u;
  __int128 v138 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v135 objects:v147 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v136;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v136 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v135 + 1) + 8LL * (void)i);
        __int128 v131 = 0u;
        __int128 v132 = 0u;
        __int128 v133 = 0u;
        __int128 v134 = 0u;
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 currentTrustedPeers]);
        id v19 = [v18 countByEnumeratingWithState:&v131 objects:v146 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v132;
          do
          {
            for (j = 0LL; j != v20; j = (char *)j + 1)
            {
              if (*(void *)v132 != v21) {
                objc_enumerationMutation(v18);
              }
              [v11 addObject:v23];
            }

            id v20 = [v18 countByEnumeratingWithState:&v131 objects:v146 count:16];
          }

          while (v20);
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v135 objects:v147 count:16];
    }

    while (v14);
  }

  __int128 v24 = v112;
  __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v112 currentTLKPointer]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 zoneID]);
  id v130 = 0LL;
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSDeviceStateEntry allInZone:error:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "allInZone:error:",  v26,  &v130));
  id v28 = v130;

  v111 = v27;
  if (v28)
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v30 = sub_1000AA6AC(@"ckkskey", v29);
    uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);

    id obj = v28;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v142 = (os_log_s *)v28;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error fetching device states: %@", buf, 0xCu);
    }

    BOOL v32 = 1;
    goto LABEL_57;
  }

  __int128 v128 = 0u;
  __int128 v129 = 0u;
  __int128 v126 = 0u;
  __int128 v127 = 0u;
  id v33 = v27;
  id v34 = [v33 countByEnumeratingWithState:&v126 objects:v145 count:16];
  if (!v34) {
    goto LABEL_48;
  }
  id v36 = v34;
  uint64_t v37 = *(void *)v127;
  *(void *)&__int128 v35 = 138412546LL;
  __int128 v105 = v35;
  id obj = v33;
  do
  {
    v38 = 0LL;
    do
    {
      if (*(void *)v127 != v37) {
        objc_enumerationMutation(obj);
      }
      __int16 v39 = *(void **)(*((void *)&v126 + 1) + 8LL * (void)v38);
      id v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "circlePeerID", v105));
      if (v40)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue([v39 circlePeerID]);
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue([@"spid-" stringByAppendingString:v41]);
      }

      else
      {
        uint64_t v31 = 0LL;
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue([v39 circlePeerID]);
      if (([v11 containsObject:v42] & 1) != 0
        || v31 && [v11 containsObject:v31])
      {
      }

      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue([v39 octagonPeerID]);
        unsigned int v44 = [v11 containsObject:v43];

        if (!v44)
        {
          id v54 = (void *)objc_claimAutoreleasedReturnValue([v39 storedCKRecord]);
          id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 modificationDate]);
          id v56 = [v55 compare:v113];

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
          id v58 = sub_1000AA6AC(@"ckkskey", v57);
          id v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);

          BOOL v59 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
          if (v56 != (id)-1LL)
          {
            if (v59)
            {
              v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 circlePeerID]);
              *(_DWORD *)buf = v105;
              v142 = v60;
              __int16 v143 = 2112;
              v144 = v39;
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Device (%@) is not trusted, but very recent. Including in heuristic: %@",  buf,  0x16u);
            }

            goto LABEL_33;
          }

          if (v59)
          {
            uint64_t v61 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 circlePeerID]);
            *(_DWORD *)buf = v105;
            v142 = v61;
            __int16 v143 = 2112;
            v144 = v39;
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "Device (%@) is not trusted and from too long ago; ignoring device state (%@)",
              buf,
              0x16u);
          }

- (void)notifyForItem:(SecDbItem *)a3
{
  id v5 = (void *)sub_1000E705C(a3, (uint64_t)&off_100290598, 0LL);
  if (v5)
  {
    uint64_t v6 = v5;
    if (!CFEqual(v5, kCFNull))
    {
      CFRetain(v6);
      if ([v6 isEqualToString:@"com.apple.cfnetwork"])
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cloudKitClassDependencies](self, "cloudKitClassDependencies"));
        id v8 = [v7 notifierClass];
        id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.security.view-change.Passwords"));
        [v8 post:v9];
      }
    }
  }

  id v10 = (void *)sub_1000E705C(a3, (uint64_t)&off_1002905C0, 0LL);
  if (v10)
  {
    cf = v10;
    if (!CFEqual(v10, kCFNull))
    {
      CFRetain(cf);
      if ([cf isEqualToString:kSOSViewHintPCSMasterKey])
      {
        unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cloudKitClassDependencies](self, "cloudKitClassDependencies"));
        id v12 = [v11 notifierClass];
        id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.security.view-change.PCS"));
        [v12 post:v13];
      }
    }
  }

- (void)notifyPasswordsOrPCSChangedForAddedItem:(SecDbItem *)a3 modified:(SecDbItem *)a4 deleted:(SecDbItem *)a5
{
  if (a3) {
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:");
  }
  if (a4) {
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:", a4);
  }
  if (a5) {
    -[CKKSKeychainView notifyForItem:](self, "notifyForItem:", a5);
  }
}

- (void)handleKeychainEventDbConnection:(__OpaqueSecDbConnection *)a3 source:(unint64_t)a4 added:(SecDbItem *)a5 deleted:(SecDbItem *)a6 rateLimiter:(id)a7
{
  id v94 = a7;
  if ((sub_100098648((uint64_t)v94, v10) & 1) == 0)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v18 = sub_1000AA6AC(@"ckks", v17);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Skipping handleKeychainEventDbConnection due to disabled CKKS",  buf,  2u);
    }

    goto LABEL_105;
  }

  id v91 = a6;
  if (a5) {
    unsigned __int8 v11 = a5;
  }
  else {
    unsigned __int8 v11 = a6;
  }
  id v89 = v11;
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CKKSKey isItemKeyForKeychainView:](&OBJC_CLASS___CKKSKey, "isItemKeyForKeychainView:"));
  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v14 = sub_1000AA6AC(@"ckks", v13);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&_BYTE buf[12] = 2048;
      *(void *)&buf[14] = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Potential new key material from %@ (source %lu)",  buf,  0x16u);
    }

    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    [v16 handleFlag:@"key_process_requested"];

    goto LABEL_105;
  }

  if (a5) {
    int v19 = sub_1000E9934(a5);
  }
  else {
    int v19 = 0;
  }
  int v20 = (int)v91;
  if (v91) {
    int v20 = sub_1000E9934(v91);
  }
  if (((v19 | v20) & 1) == 0)
  {
    id v32 = sub_1000AA6AC(@"ckks", 0LL);
    id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)&uint8_t buf[4] = 0;
      *(_WORD *)&buf[8] = 1024;
      *(_DWORD *)&buf[10] = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "skipping sync of non-sync item (%d, %d)",  buf,  0xEu);
    }

    goto LABEL_104;
  }

  int v87 = v20;
  int v88 = v19;
  uint64_t v102 = 0LL;
  id v103 = &v102;
  uint64_t v104 = 0x2020000000LL;
  char v105 = 0;
  uint64_t v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100151DE4;
  block[3] = &unk_1002939C8;
  block[5] = &v102;
  block[6] = v89;
  block[4] = self;
  dispatch_sync(v21, block);

  if (!*((_BYTE *)v103 + 24))
  {
    -[CKKSKeychainView notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:]( self,  "notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:",  a5,  v89,  v91);
    goto LABEL_103;
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v92 = (void *)objc_claimAutoreleasedReturnValue([v22 viewNameForItem:v89]);

  if (!v92)
  {
    id v57 = sub_1000AA6AC(@"ckks", 0LL);
    id v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = v89;
      _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_DEFAULT,  "No intended CKKS view for item; skipping: %{private}@",
        buf,
        0xCu);
    }

    -[CKKSKeychainView notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:]( self,  "notifyPasswordsOrPCSChangedForAddedItem:modified:deleted:",  a5,  v89,  v91);
    goto LABEL_102;
  }

  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v97 = 0u;
  __int128 v98 = 0u;
  id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allCKKSManagedViews]);

  id v25 = [v24 countByEnumeratingWithState:&v97 objects:v115 count:16];
  if (!v25) {
    goto LABEL_27;
  }
  uint64_t v26 = *(void *)v98;
  while (2)
  {
    for (i = 0LL; i != v25; i = (char *)i + 1)
    {
      if (*(void *)v98 != v26) {
        objc_enumerationMutation(v24);
      }
      id v28 = *(void **)(*((void *)&v97 + 1) + 8LL * (void)i);
      v29 = (void *)objc_claimAutoreleasedReturnValue([v28 zoneID]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneName]);
      unsigned __int8 v31 = [v30 isEqualToString:v92];

      if ((v31 & 1) != 0)
      {
        id v34 = v28;

        if (!v34) {
          goto LABEL_38;
        }
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 zoneID]);
        id v36 = (void *)objc_claimAutoreleasedReturnValue([v35 zoneName]);
        id v37 = sub_1000AA6AC(@"ckks", v36);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);

        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412547;
          *(void *)&uint8_t buf[4] = v92;
          *(_WORD *)&_BYTE buf[12] = 2113;
          *(void *)&buf[14] = v89;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEBUG,  "Routing item to zone %@: %{private}@",  buf,  0x16u);
        }

        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000LL;
        objc_super v110 = sub_10014BED0;
        v111 = sub_10014BEE0;
        id v112 = 0LL;
        if (a5)
        {
          int v39 = sub_1000E9A9C(a5);
          id v40 = v91;
          if (!v91)
          {
            int v41 = 0;
            int v42 = 0;
            int v43 = 0;
            int v44 = 1;
            int v45 = 1;
            v46 = v34;
            int v47 = v87;
            goto LABEL_62;
          }
        }

        else
        {
          int v39 = 0;
          id v40 = v91;
          if (!v91)
          {
            BOOL v59 = 1;
            int v43 = 0;
            int v42 = 0;
LABEL_48:
            v46 = v34;
            if (a5) {
              BOOL v60 = v40 == 0LL;
            }
            else {
              BOOL v60 = 1;
            }
            int v41 = !v60;
            int v44 = v41 ^ 1;
            int v45 = v41 & ~v39 & v42;
            int v47 = v87;
            if ((v45 & 1) == 0 && (v44 & 1) == 0) {
              int v45 = v88 & (v87 ^ 1);
            }
            if (!v40) {
              BOOL v59 = 0;
            }
            if (v59)
            {
              if ((v41 & 1) == 0)
              {
                if ((v43 & 1) == 0)
                {
                  int v62 = 0;
                  int v61 = 1;
                  goto LABEL_79;
                }

                goto LABEL_75;
              }

              int v61 = 1;
              goto LABEL_66;
            }

- (void)setCurrentItemForAccessGroup:(id)a3 hash:(id)a4 accessGroup:(id)a5 identifier:(id)a6 viewHint:(id)a7 replacing:(id)a8 hash:(id)a9 complete:(id)a10
{
  id v51 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  id v56 = 0LL;
  v22 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView policyDependentViewStateForName:error:]( self,  "policyDependentViewStateForName:error:",  a7,  &v56));
  id v23 = v56;
  if (v22)
  {
    id v50 = v19;
    if (v17 && v18)
    {
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
      [v24 wait:30000000000];

      int64_t v25 = -[CKKSKeychainView accountStatus](self, "accountStatus");
      if (v25 == 1)
      {
        id v49 = v16;
        id v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        id v37 = sub_1000AA6AC(@"ckkscurrent", v36);
        v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);

        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v58 = v17;
          __int16 v59 = 2112;
          id v60 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Starting change current pointer operation for %@-%@",  buf,  0x16u);
        }

        int v39 = objc_alloc(&OBJC_CLASS___CKKSUpdateCurrentItemPointerOperation);
        id v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        int v41 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"currentitem-api"));
        int v42 = -[CKKSUpdateCurrentItemPointerOperation initWithCKKSOperationDependencies:viewState:newItem:hash:accessGroup:identifier:replacing:hash:ckoperationGroup:]( v39,  "initWithCKKSOperationDependencies:viewState:newItem:hash:accessGroup:identifier:replacing:hash:ckoperationGroup:",  v40,  v22,  v51,  v49,  v17,  v18,  v50,  v20,  v41);

        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472LL;
        v52[2] = sub_100151C38;
        v52[3] = &unk_100290668;
        id v53 = v42;
        id v54 = v22;
        id v55 = v21;
        int v43 = v42;
        int v44 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation operationWithBlock:]( &OBJC_CLASS___CKKSResultOperation,  "operationWithBlock:",  v52));
        [v44 setName:@"setCurrentItem-return-callback"];
        [v44 addDependency:v43];
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v44);
        int v45 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
        -[CKKSUpdateCurrentItemPointerOperation linearDependencies:](v43, "linearDependencies:", v45);

        id v46 = -[CKKSResultOperation timeout:](v43, "timeout:", 60000000000LL);
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v43);

        id v16 = v49;
        goto LABEL_18;
      }

      id v26 = v16;
      if (v25)
      {
        uint64_t v27 = @"User is not signed into iCloud.";
        uint64_t v28 = 10LL;
      }

      else
      {
        uint64_t v27 = @"iCloud account status unknown.";
        uint64_t v28 = 64LL;
      }

      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  v28,  v27));
      int v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      id v48 = sub_1000AA6AC(@"ckkscurrent", v47);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v29;
        id v33 = "Rejecting current item pointer set since we don't have an iCloud account: %@";
        id v34 = v32;
        os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_16;
      }
    }

    else
    {
      id v26 = v16;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  -50LL,  @"No access group or identifier given"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      id v31 = sub_1000AA6AC(@"ckkscurrent", v30);
      id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);

      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v58 = v29;
        id v33 = "Cancelling request: %@";
        id v34 = v32;
        os_log_type_t v35 = OS_LOG_TYPE_ERROR;
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v34, v35, v33, buf, 0xCu);
      }
    }

    (*((void (**)(id, void *))v21 + 2))(v21, v29);
    id v16 = v26;
LABEL_18:
    id v19 = v50;
    goto LABEL_19;
  }

  (*((void (**)(id, id))v21 + 2))(v21, v23);
LABEL_19:
}

- (void)unsetCurrentItemsForAccessGroup:(id)a3 identifiers:(id)a4 viewHint:(id)a5 complete:(id)a6
{
  uint64_t v10 = (CKKSDeleteCurrentItemPointersOperation *)a3;
  id v11 = a4;
  id v12 = a6;
  id v45 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView policyDependentViewStateForName:error:]( self,  "policyDependentViewStateForName:error:",  a5,  &v45));
  id v14 = v45;
  if (v13)
  {
    if (v10 && v11 && [v11 count])
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
      [v15 wait:30000000000];

      int64_t v16 = -[CKKSKeychainView accountStatus](self, "accountStatus");
      if (v16 == 1)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        id v24 = sub_1000AA6AC(@"ckkscurrent", v23);
        int64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          id v26 = [v11 count];
          *(_DWORD *)buf = 138412546;
          int v47 = v10;
          __int16 v48 = 2048;
          id v49 = v26;
          _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Starting delete current item pointer(s) operation for %@ (%lu)",  buf,  0x16u);
        }

        uint64_t v27 = objc_alloc(&OBJC_CLASS___CKKSDeleteCurrentItemPointersOperation);
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[CKOperationGroup CKKSGroupWithName:]( &OBJC_CLASS___CKOperationGroup,  "CKKSGroupWithName:",  @"currentitem-api"));
        id v30 = -[CKKSDeleteCurrentItemPointersOperation initWithCKKSOperationDependencies:viewState:accessGroup:identifiers:ckoperationGroup:]( v27,  "initWithCKKSOperationDependencies:viewState:accessGroup:identifiers:ckoperationGroup:",  v28,  v13,  v10,  v11,  v29);

        v38 = _NSConcreteStackBlock;
        uint64_t v39 = 3221225472LL;
        id v40 = sub_100151AC8;
        int v41 = &unk_100290668;
        int v42 = v30;
        id v43 = v13;
        id v44 = v12;
        id v31 = v30;
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation operationWithBlock:]( &OBJC_CLASS___CKKSResultOperation,  "operationWithBlock:",  &v38));
        objc_msgSend(v32, "setName:", @"unsetCurrentItems-return-callback", v38, v39, v40, v41);
        [v32 addDependency:v31];
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v32);
        id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
        -[CKKSDeleteCurrentItemPointersOperation linearDependencies:](v31, "linearDependencies:", v33);

        id v34 = -[CKKSResultOperation timeout:](v31, "timeout:", 60000000000LL);
        -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v31);
      }

      else
      {
        if (v16)
        {
          id v17 = @"User is not signed into iCloud.";
          uint64_t v18 = 10LL;
        }

        else
        {
          id v17 = @"iCloud account status unknown.";
          uint64_t v18 = 64LL;
        }

        id v31 = (CKKSDeleteCurrentItemPointersOperation *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  v18,  v17));
        os_log_type_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        id v36 = sub_1000AA6AC(@"ckkscurrent", v35);
        id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          int v47 = v31;
          _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Rejecting current item pointer delete since we don't have an iCloud account: %@",  buf,  0xCu);
        }

        (*((void (**)(id, CKKSDeleteCurrentItemPointersOperation *))v12 + 2))(v12, v31);
      }
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      id v20 = sub_1000AA6AC(@"ckkscurrent", v19);
      id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v47 = v10;
        __int16 v48 = 2112;
        id v49 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Rejecting current item pointer delete since no access group(%@) or identifiers(%@) given",  buf,  0x16u);
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  -50LL,  @"No access group or identifier given"));
      (*((void (**)(id, void *))v12 + 2))(v12, v22);
    }
  }

  else
  {
    (*((void (**)(id, id))v12 + 2))(v12, v14);
  }
}

- (id)zoneIDForViewHint:(id)a3 pcsShortcut:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  if (v6) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = 5000000000LL;
  }
  id v18 = 0LL;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView policyDependentViewStateForName:timeout:error:]( self,  "policyDependentViewStateForName:timeout:error:",  v8,  v9,  &v18));
  id v11 = v18;
  if (v10)
  {
    id v12 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue([v10 zoneID]);
LABEL_6:
    id v13 = v12;
    goto LABEL_7;
  }

  if (v6 && [v8 isEqualToString:@"ProtectedCloudStorage"])
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v16 = sub_1000AA6AC(@"ckkscurrent", v15);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to retrieve view state, using ProtectedCloudStorage: %@",  buf,  0xCu);
    }

    id v12 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"ProtectedCloudStorage",  CKCurrentUserDefaultName);
    goto LABEL_6;
  }

  id v13 = 0LL;
  if (a5) {
    *a5 = v11;
  }
LABEL_7:

  return v13;
}

- (void)getCurrentItemForAccessGroup:(id)a3 identifier:(id)a4 viewHint:(id)a5 fetchCloudValue:(BOOL)a6 complete:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  if (v8) {
    id v16 = 0LL;
  }
  else {
    id v16 = [v14 isEqualToString:@"ProtectedCloudStorage"];
  }
  id v47 = 0LL;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView zoneIDForViewHint:pcsShortcut:error:]( self,  "zoneIDForViewHint:pcsShortcut:error:",  v14,  v16,  &v47));
  id v18 = v47;
  if (v17)
  {
    if (v12 && v13)
    {
      if ((v16 & 1) != 0
        || (id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown")),
            [v19 wait:30000000000],
            v19,
            int64_t v20 = -[CKKSKeychainView accountStatus](self, "accountStatus"),
            v20 == 1))
      {
        if (v8)
        {
          id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v14));
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:]( self,  "rpcFetchAndProcessIncomingQueue:because:errorOnClassAFailure:",  v26,  @"currentitemcheck",  0LL));
        }

        else
        {
          uint64_t v27 = 0LL;
        }

        *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, self);
        os_log_type_t v35 = _NSConcreteStackBlock;
        uint64_t v36 = 3221225472LL;
        id v37 = sub_100151320;
        v38 = &unk_1002910D0;
        id v28 = v27;
        id v39 = v28;
        id v40 = self;
        id v45 = v15;
        objc_copyWeak(&v46, (id *)buf);
        id v41 = v12;
        id v42 = v13;
        id v43 = v14;
        id v44 = v17;
        v29 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"get-current-item-pointer",  &v35));
        [v29 addNullableDependency:v28];
        if ((_DWORD)v16) {
          -[CKKSKeychainView scheduleOperationWithoutDependencies:]( self,  "scheduleOperationWithoutDependencies:",  v29,  &v46,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  v43);
        }
        else {
          -[CKKSKeychainView scheduleOperation:]( self,  "scheduleOperation:",  v29,  &v46,  v35,  v36,  v37,  v38,  v39,  v40,  v41,  v42,  v43);
        }

        objc_destroyWeak(location);
        objc_destroyWeak((id *)buf);
      }

      else
      {
        if (v20) {
          uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  10LL,  @"User is not signed into iCloud."));
        }
        else {
          uint64_t v21 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  64LL,  @"iCloud account status unknown."));
        }
        id v30 = (void *)v21;
        id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        id v32 = sub_1000AA6AC(@"ckkscurrent", v31);
        id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Rejecting current item pointer get since we don't have an iCloud account: %@",  buf,  0xCu);
        }

        (*((void (**)(id, void, void *))v15 + 2))(v15, 0LL, v30);
      }
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      id v23 = sub_1000AA6AC(@"ckkscurrent", v22);
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        __int16 v49 = 2112;
        id v50 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Rejecting current item pointer get since no access group(%@) or identifier(%@) given",  buf,  0x16u);
      }

      int64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  -50LL,  @"No access group or identifier given"));
      (*((void (**)(id, void, void *))v15 + 2))(v15, 0LL, v25);
    }
  }

  else
  {
    (*((void (**)(id, void, id))v15 + 2))(v15, 0LL, v18);
  }
}

- (void)getCurrentItemOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v55 = a3;
  BOOL v8 = (void (**)(id, void, id))a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  [v9 wait:1000000000];

  int64_t v10 = -[CKKSKeychainView accountStatus](self, "accountStatus");
  if (!v10)
  {
    id v56 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  64LL,  @"iCloud account status unknown."));
    goto LABEL_25;
  }

  if (v10 != 1
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter")),
        v11,
        !v11))
  {
    id v56 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  10LL,  @"User is not signed into iCloud."));
LABEL_25:
    os_log_type_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v36 = sub_1000AA6AC(@"ckks-oob", v35);
    id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);

    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Rejecting current item requests since we don't have an iCloud account: %@",  buf,  0xCu);
    }

    v8[2](v8, 0LL, v56);
    goto LABEL_39;
  }

  id v64 = 0LL;
  unsigned int v12 = -[CKKSKeychainView allowOutOfBandFetch:](self, "allowOutOfBandFetch:", &v64);
  id v56 = v64;
  if (v56)
  {
    id v13 = sub_1000AA6AC(@"ckks-oob", 0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = @"DISABLED";
      if (v6) {
        id v15 = @"ENABLED";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v66 = 2112;
      id v67 = v56;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error fetching out of band fetch permission, relying on forceFetch enablement (%@) : %@",  buf,  0x16u);
    }
  }

  if (((v12 | v6) & 1) != 0)
  {
    id v53 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id obj = v55;
    id v16 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v61;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v61 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)i);
          int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
          if (!v20
            || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 accessGroup]),
                BOOL v22 = v21 == 0LL,
                v21,
                v20,
                v22))
          {
            id v40 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
            id v41 = sub_1000AA6AC(@"ckks-oob", v40);
            id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);

            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              id v43 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
              id v44 = (void *)objc_claimAutoreleasedReturnValue([v19 accessGroup]);
              id v45 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v43;
              __int16 v66 = 2112;
              id v67 = v44;
              __int16 v68 = 2112;
              v69 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "Rejecting current item pointer for identifier(%@) get since no access group(%@) or zoneID(%@) given",  buf,  0x20u);
            }

            id v46 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
            id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No access group or view given for identifier(%@)",  v46));
            __int16 v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  -50LL,  v47));
            v8[2](v8, 0LL, v48);

            goto LABEL_37;
          }

          id v23 = objc_alloc(&OBJC_CLASS___CuttlefishCurrentItemSpecifier);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 accessGroup]);
          int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v19 identifier]);
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  v24,  v25));
          uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
          id v28 = -[CuttlefishCurrentItemSpecifier init:zoneID:](v23, "init:zoneID:", v26, v27);
          -[NSMutableArray addObject:](v53, "addObject:", v28);
        }

        id v16 = [obj countByEnumeratingWithState:&v60 objects:v70 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountsAdapter](self, "accountsAdapter"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView personaAdapter](self, "personaAdapter"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 contextID]);
    id v59 = 0LL;
    id obj = (id)objc_claimAutoreleasedReturnValue( [v29 findAccountForCurrentThread:v30 optionalAltDSID:0 cloudkitContainerName:@"com.apple.security.keychain" octagonContextID:v32 error:&v59]);
    id v33 = v59;

    if (!obj || v33)
    {
      id v49 = sub_1000AA6AC(@"ckks-cuttlefish", 0LL);
      id v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"defaultContext";
        __int16 v66 = 2112;
        id v67 = v33;
        _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "unable to determine active account for context(%@). Issues ahead: %@",  buf,  0x16u);
      }

      v8[2](v8, 0LL, v33);
LABEL_37:
    }

    else
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter"));
      objc_copyWeak(&v58, (id *)buf);
      id v57 = v8;
      id obja = obj;
      objc_msgSend(v34, "fetchCurrentItem:items:reply:");

      objc_destroyWeak(&v58);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v38 = sub_1000AA6AC(@"ckks", 0LL);
    id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Out of band fetch disabled due to CKKS readiness",  buf,  2u);
    }

    id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  67LL,  @"Out of band fetch disabled due to CKKS readiness"));
    v8[2](v8, 0LL, v54);
  }

- (void)fetchPCSIdentityOutOfBand:(id)a3 forceFetch:(BOOL)a4 complete:(id)a5
{
  BOOL v6 = a4;
  id v54 = a3;
  BOOL v8 = (void (**)(id, void, id))a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  [v9 wait:1000000000];

  int64_t v10 = -[CKKSKeychainView accountStatus](self, "accountStatus");
  if (!v10)
  {
    id v55 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  64LL,  @"iCloud account status unknown."));
    goto LABEL_25;
  }

  if (v10 != 1
    || (id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter")),
        v11,
        !v11))
  {
    id v55 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  10LL,  @"User is not signed into iCloud."));
LABEL_25:
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v37 = sub_1000AA6AC(@"ckks-oob", v36);
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Rejecting PCS Identity requests since we don't have an iCloud account: %@",  buf,  0xCu);
    }

    v8[2](v8, 0LL, v55);
    goto LABEL_39;
  }

  id v63 = 0LL;
  unsigned int v12 = -[CKKSKeychainView allowOutOfBandFetch:](self, "allowOutOfBandFetch:", &v63);
  id v55 = v63;
  if (v55)
  {
    id v13 = sub_1000AA6AC(@"ckks-oob", 0LL);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = @"DISABLED";
      if (v6) {
        id v15 = @"ENABLED";
      }
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      __int16 v65 = 2112;
      id v66 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Error fetching out of band fetch permission, relying on forceFetch enablement (%@) : %@",  buf,  0x16u);
    }
  }

  if (((v12 | v6) & 1) != 0)
  {
    id v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    id obj = v54;
    id v16 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v60;
      while (2)
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v60 != v17) {
            objc_enumerationMutation(obj);
          }
          id v19 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          int64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 accessGroup]);
          if (!v20
            || (uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]),
                BOOL v22 = v21 == 0LL,
                v21,
                v20,
                v22))
          {
            id v41 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
            id v42 = sub_1000AA6AC(@"ckks-oob", v41);
            id v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);

            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              id v44 = (void *)objc_claimAutoreleasedReturnValue([v19 accessGroup]);
              id v45 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v19;
              __int16 v65 = 2112;
              id v66 = v44;
              __int16 v67 = 2112;
              __int16 v68 = v45;
              _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "Rejecting pcs service (%@) get since no access group(%@) or zoneID(%@) given",  buf,  0x20u);
            }

            id v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No access group or view given for PCS Service(%@)",  v19));
            id v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  -50LL,  v46));
            v8[2](v8, 0LL, v47);

            goto LABEL_37;
          }

          id v23 = objc_alloc(&OBJC_CLASS___CuttlefishPCSServiceIdentifier);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v19 serviceNumber]);
          int64_t v25 = objc_alloc(&OBJC_CLASS___NSData);
          id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 publicKey]);
          uint64_t v27 = -[NSData initWithBase64EncodedString:options:](v25, "initWithBase64EncodedString:options:", v26, 0LL);
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v19 zoneID]);
          id v29 = -[CuttlefishPCSServiceIdentifier init:PCSPublicKey:zoneID:]( v23,  "init:PCSPublicKey:zoneID:",  v24,  v27,  v28);
          -[NSMutableArray addObject:](v52, "addObject:", v29);
        }

        id v16 = [obj countByEnumeratingWithState:&v59 objects:v69 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountsAdapter](self, "accountsAdapter"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView personaAdapter](self, "personaAdapter"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 contextID]);
    id v58 = 0LL;
    id obj = (id)objc_claimAutoreleasedReturnValue( [v30 findAccountForCurrentThread:v31 optionalAltDSID:0 cloudkitContainerName:@"com.apple.security.keychain" octagonContextID:v33 error:&v58]);
    id v34 = v58;

    if (!obj || v34)
    {
      id v48 = sub_1000AA6AC(@"ckks-cuttlefish", 0LL);
      id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = @"defaultContext";
        __int16 v65 = 2112;
        id v66 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "unable to determine active account for context(%@). Issues ahead: %@",  buf,  0x16u);
      }

      v8[2](v8, 0LL, v34);
LABEL_37:
    }

    else
    {
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      os_log_type_t v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView cuttlefishAdapter](self, "cuttlefishAdapter"));
      objc_copyWeak(&v57, (id *)buf);
      id v56 = v8;
      id obja = obj;
      objc_msgSend(v35, "fetchPCSIdentityByKey:pcsservices:reply:");

      objc_destroyWeak(&v57);
      objc_destroyWeak((id *)buf);
    }
  }

  else
  {
    id v39 = sub_1000AA6AC(@"ckks-oob", 0LL);
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Out of band fetch disabled due to CKKS readiness",  buf,  2u);
    }

    id v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  67LL,  @"Out of band fetch disabled due to CKKS readiness"));
    v8[2](v8, 0LL, v53);
  }

- (BOOL)unwrapTLKAndSaveToCache:(id)a3 tlks:(id)a4 tlkShares:(id)a5 error:(id *)a6
{
  id v37 = a3;
  id v9 = a4;
  id v10 = a5;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  id obj = v9;
  id v35 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
  if (v35)
  {
    id v32 = a6;
    uint64_t v34 = *(void *)v46;
LABEL_3:
    uint64_t v11 = 0LL;
    while (2)
    {
      if (*(void *)v46 != v34) {
        objc_enumerationMutation(obj);
      }
      unsigned int v12 = *(void **)(*((void *)&v45 + 1) + 8 * v11);
      __int128 v41 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      __int128 v44 = 0u;
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 peerProviders]);

      id v15 = [v14 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v38 = v11;
        id v17 = 0LL;
        uint64_t v18 = *(void *)v42;
LABEL_8:
        id v19 = 0LL;
        int64_t v20 = v17;
        while (1)
        {
          if (*(void *)v42 != v18) {
            objc_enumerationMutation(v14);
          }
          uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v41 + 1) + 8 * (void)v19) currentState]);
          id v40 = v20;
          unsigned int v22 = [v21 unwrapKey:v12 fromShares:v10 error:&v40];
          id v17 = v40;

          if (v22) {
            break;
          }
          if (v17)
          {
            id v23 = sub_1000AA6AC(@"ckks-oob", 0LL);
            id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              id v50 = v12;
              __int16 v51 = 2112;
              id v52 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "Errored unwrapping TLK %@: %@",  buf,  0x16u);
            }
          }

          id v19 = (char *)v19 + 1;
          int64_t v20 = v17;
          if (v16 == v19)
          {
            id v16 = [v14 countByEnumeratingWithState:&v41 objects:v53 count:16];
            if (v16) {
              goto LABEL_8;
            }
            goto LABEL_28;
          }
        }

        int64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v12 uuid]);
        [v37 addKeyToCache:v25 key:v12];

        id v39 = 0LL;
        [v12 saveKeyMaterialToKeychain:&v39];
        id v26 = v39;
        if (v26)
        {
          id v27 = sub_1000AA6AC(@"ckks-oob", 0LL);
          id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v26;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_ERROR,  "Errored saving TLK to keychain: %@",  buf,  0xCu);
          }
        }

        uint64_t v11 = v38 + 1;
        if ((id)(v38 + 1) != v35) {
          continue;
        }
        BOOL v29 = 1;
        id v35 = [obj countByEnumeratingWithState:&v45 objects:v54 count:16];
        if (v35) {
          goto LABEL_3;
        }
      }

      else
      {
        id v17 = 0LL;
LABEL_28:

        if (v32)
        {
          id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No trusted TLKShares for %@",  v12));
          *id v32 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:underlying:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:underlying:",  @"CKKSErrorDomain",  35LL,  v30,  v17));
        }

        BOOL v29 = 0;
      }

      break;
    }
  }

  else
  {
    BOOL v29 = 1;
  }

  return v29;
}

- (BOOL)unwrapKeysAndSaveToCache:(id)a3 syncKeys:(id)a4 error:(id *)a5
{
  id v7 = a3;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v8 = a4;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v9)
  {
    id v10 = v9;
    int64_t v25 = a5;
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        id v27 = 0LL;
        id v14 = [v13 unwrapViaKeyHierarchy:v7 error:&v27];
        id v15 = v27;
        if (v15)
        {
          uint64_t v21 = v15;
          id v22 = sub_1000AA6AC(@"ckks-oob", 0LL);
          id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v33 = v13;
            __int16 v34 = 2112;
            id v35 = v21;
            _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Unable to decrypt synckey %@: %@",  buf,  0x16u);
          }

          if (v25) {
            id *v25 = v21;
          }

          BOOL v20 = 0;
          goto LABEL_19;
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v13 uuid]);
        [v7 addKeyToCache:v16 key:v13];

        id v26 = 0LL;
        [v13 saveKeyMaterialToKeychain:&v26];
        id v17 = v26;
        if (v17)
        {
          id v18 = sub_1000AA6AC(@"ckks-oob", 0LL);
          id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v17;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "Errored saving synckey to keychain: %@",  buf,  0xCu);
          }
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  BOOL v20 = 1;
LABEL_19:

  return v20;
}

- (void)decryptPCSIdentities:(id)a3 cache:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v49 = a4;
  id v37 = (void (**)(id, NSMutableArray *, void *))a5;
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  id obj = v8;
  id v48 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
  id v10 = 0LL;
  if (v48)
  {
    uint64_t v47 = *(void *)v53;
    uint64_t v38 = kSecAttrViewHintManatee;
    id v39 = self;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v53 != v47) {
        objc_enumerationMutation(obj);
      }
      unsigned int v12 = *(void **)(*((void *)&v52 + 1) + 8 * v11);
      id v50 = objc_autoreleasePoolPush();
      id v13 = objc_alloc(&OBJC_CLASS___CKKSItem);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 item]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 contextID]);
      id v17 = -[CKKSItem initWithCKRecord:contextID:](v13, "initWithCKRecord:contextID:", v14, v16);

      id v18 = v17;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      id v51 = 0LL;
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:]( &OBJC_CLASS___CKKSIncomingQueueOperation,  "decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:",  v17,  v49,  v19,  &v51));
      id v21 = v51;

      if (v21)
      {
        id v22 = sub_1000AA6AC(@"ckks-oob", 0LL);
        id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v57 = (NSMutableArray *)v18;
          __int16 v58 = 2112;
          id v59 = v21;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "error decrypting pcs item record(%@): %@",  buf,  0x16u);
        }

        id v24 = v21;
        id v9 = 0LL;
        id v10 = v24;
        int64_t v25 = v50;
      }

      else
      {
        __int128 v44 = v17;
        __int128 v45 = v10;
        id v46 = objc_alloc(&OBJC_CLASS___CKKSPCSIdentityQueryResult);
        __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v42 PCSServiceID]);
        __int128 v41 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v41 PCSPublicKey]);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v27 base64EncodedStringWithOptions:0]);
        __int128 v29 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
        __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v29 zoneID]);
        __int128 v43 = v20;
        id v31 = [v46 initWithServiceNumber:v26 publicKey:v28 zoneID:v30 decryptedRecord:v20];
        -[NSMutableArray addObject:](v9, "addObject:", v31);

        self = v39;
        if (-[CKKSKeychainView firstManateeKeyFetched](v39, "firstManateeKeyFetched"))
        {
          id v10 = v45;
        }

        else
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v12 service]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneID]);
          unsigned int v34 = [v33 isEqualToString:v38];

          id v10 = v45;
          if (v34)
          {
            -[CKKSKeychainView setFirstManateeKeyFetched:](v39, "setFirstManateeKeyFetched:", 1LL);
            -[CKKSKeychainView sendMetricForFirstManateeAccess](v39, "sendMetricForFirstManateeAccess");
          }
        }

        int64_t v25 = v50;
        BOOL v20 = v43;
        id v18 = v44;
      }

      objc_autoreleasePoolPop(v25);
      if (v21) {
        break;
      }
      if (v48 == (id)++v11)
      {
        id v48 = [obj countByEnumeratingWithState:&v52 objects:v60 count:16];
        if (v48) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v9)
  {
    id v35 = sub_1000AA6AC(@"ckks-oob", 0LL);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Successfully retrieved identities: %@",  buf,  0xCu);
    }
  }

  v37[2](v37, v9, v10);
}

- (void)decryptCurrentItems:(id)a3 cache:(id)a4 complete:(id)a5
{
  id v7 = a3;
  id v56 = a4;
  uint64_t v47 = (void (**)(id, NSMutableArray *, id))a5;
  id v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = v7;
  id v55 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
  id v9 = 0LL;
  if (v55)
  {
    uint64_t v54 = *(void *)v60;
    uint64_t v48 = kSecAttrViewHintManatee;
    id v10 = self;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v60 != v54) {
        objc_enumerationMutation(obj);
      }
      unsigned int v12 = *(void **)(*((void *)&v59 + 1) + 8 * v11);
      id v57 = objc_autoreleasePoolPush();
      id v13 = objc_alloc(&OBJC_CLASS___CKKSItem);
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 item]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](v10, "operationDependencies"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 contextID]);
      id v17 = -[CKKSItem initWithCKRecord:contextID:](v13, "initWithCKRecord:contextID:", v14, v16);

      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](v10, "operationDependencies"));
      id v58 = 0LL;
      id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSIncomingQueueOperation decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:]( &OBJC_CLASS___CKKSIncomingQueueOperation,  "decryptCKKSItemToAttributes:keyCache:ckksOperationalDependencies:error:",  v17,  v56,  v18,  &v58));
      id v20 = v58;

      if (v20)
      {
        id v21 = sub_1000AA6AC(@"ckks-oob", 0LL);
        id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v64 = (NSMutableArray *)v17;
          __int16 v65 = 2112;
          id v66 = v20;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "error decrypting item record(%@): %@",  buf,  0x16u);
        }

        id v8 = 0LL;
        id v23 = v9;
        int v24 = 2;
        id v9 = v20;
        int64_t v25 = v57;
      }

      else
      {
        __int128 v53 = v19;
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v12 itemPtr]);
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 itemPtrName]);
        id v23 = (void *)objc_claimAutoreleasedReturnValue([v27 componentsSeparatedByString:@"-"]);

        if ([v23 count] == (id)2)
        {
          id v49 = v17;
          id v50 = v9;
          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:0]);
          uint64_t v29 = objc_claimAutoreleasedReturnValue([v23 objectAtIndexedSubscript:1]);
          id v30 = objc_alloc(&OBJC_CLASS___CKKSCurrentItemQueryResult);
          id v31 = (void *)objc_claimAutoreleasedReturnValue([v12 itemPtr]);
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 zoneID]);
          id v33 = [v30 initWithIdentifier:v29 accessGroup:v28 zoneID:v32 decryptedRecord:v53];
          -[NSMutableArray addObject:](v8, "addObject:", v33);

          id v10 = self;
          if (-[CKKSKeychainView firstManateeKeyFetched](self, "firstManateeKeyFetched"))
          {
            int v24 = 0;
            id v9 = v50;
            int64_t v25 = v57;
          }

          else
          {
            __int128 v42 = (void *)objc_claimAutoreleasedReturnValue([v12 itemPtr]);
            __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 zoneID]);
            unsigned int v44 = [v43 isEqualToString:v48];

            int64_t v25 = v57;
            if (v44)
            {
              id v10 = self;
              -[CKKSKeychainView setFirstManateeKeyFetched:](self, "setFirstManateeKeyFetched:", 1LL);
              -[CKKSKeychainView sendMetricForFirstManateeAccess](self, "sendMetricForFirstManateeAccess");
              int v24 = 0;
              id v9 = v50;
            }

            else
            {
              int v24 = 0;
              id v9 = v50;
              id v10 = self;
            }
          }

          __int128 v41 = (void *)v29;
          id v17 = v49;
        }

        else
        {
          unsigned int v34 = v9;
          id v35 = sub_1000AA6AC(@"ckks-oob", 0LL);
          id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            id v37 = (void *)objc_claimAutoreleasedReturnValue([v12 itemPtr]);
            uint64_t v38 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v37 itemPtrName]);
            *(_DWORD *)buf = 138412290;
            id v64 = v38;
            _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "unexpected item pointer name format: %@",  buf,  0xCu);
          }

          __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v12 itemPtr]);
          uint64_t v39 = objc_claimAutoreleasedReturnValue([v28 itemPtrName]);
          id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Item pointer name %@ does not match expected format",  v39));
          id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  20LL,  v40));

          __int128 v41 = (void *)v39;
          id v8 = 0LL;
          int v24 = 2;
          id v10 = self;
          int64_t v25 = v57;
        }

        id v19 = v53;
      }

      objc_autoreleasePoolPop(v25);
      if (v24) {
        break;
      }
      if (v55 == (id)++v11)
      {
        id v55 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
        if (v55) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (v8)
  {
    id v45 = sub_1000AA6AC(@"ckks-oob", 0LL);
    id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v64 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Successfully retrieved current items: %@",  buf,  0xCu);
    }
  }

  v47[2](v47, v8, v9);
}

- (void)sendMetricForFirstManateeAccess
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  unsigned int v4 = [v3 sendMetric];

  if (v4)
  {
    id v5 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 activeAccount]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
    uint64_t v9 = kSecurityRTCEventNameFirstManateeKeyFetch;
    uint64_t v10 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    unsigned int v12 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v5,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v8,  v9,  0,  v10,  [v11 sendMetric]);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v12,  1LL,  0LL);
  }

- (id)findKeySets:(BOOL)a3
{
  if (a3)
  {
    unsigned int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014FEA8;
    block[3] = &unk_1002927F0;
    block[4] = self;
    dispatch_sync(v4, block);
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000LL;
  uint64_t v11 = sub_10014BED0;
  unsigned int v12 = sub_10014BEE0;
  id v13 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10014FF24;
  v7[3] = &unk_1002916D0;
  v7[4] = self;
  v7[5] = &v8;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v7);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)receiveTLKUploadRecords:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  id v6 = sub_1000AA6AC(@"ckkskey", v5);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v12 = [v4 count];
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Received a set of %lu TLK upload records",  buf,  0xCu);
  }

  if (v4 && [v4 count])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10014FD74;
    v8[3] = &unk_1002904C8;
    id v9 = v4;
    uint64_t v10 = self;
    -[CKKSKeychainView dispatchSyncWithSQLTransaction:](self, "dispatchSyncWithSQLTransaction:", v8);
  }
}

- (id)viewsRequiringTLKUpload
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10014BED0;
  uint64_t v11 = sub_10014BEE0;
  id v12 = 0LL;
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014FD18;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)findFirstPendingOperation:(id)a3
{
  return -[CKKSKeychainView findFirstPendingOperation:ofClass:](self, "findFirstPendingOperation:ofClass:", a3, 0LL);
}

- (id)findFirstPendingOperation:(id)a3 ofClass:(Class)a4
{
  id v5 = a3;
  objc_sync_enter(v5);
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)v9);
        if (v10
          && objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "isPending", (void)v13)
          && (!a4 || (objc_opt_isKindOfClass(v10, a4) & 1) != 0))
        {
          id v11 = v10;
          goto LABEL_14;
        }

        uint64_t v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  id v11 = 0LL;
LABEL_14:

  objc_sync_exit(v6);
  return v11;
}

- (id)rpcProcessOutgoingQueue:(id)a3 operationGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = sub_10014BED0;
  unsigned int v34 = sub_10014BEE0;
  id v35 = 0LL;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014F868;
  block[3] = &unk_1002912B8;
  block[4] = self;
  uint64_t v29 = &v30;
  id v9 = v6;
  id v28 = v9;
  dispatch_sync(v8, block);

  if (v31[5])
  {
    -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:");
    id v10 = (id)v31[5];
  }

  else
  {
    uint64_t v38 = @"process_outgoing_queue";
    id v36 = @"become_ready";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    id v37 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
    uint64_t v39 = v12;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));

    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v13));
    __int128 v15 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionWatcher);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    id v17 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:]( v15,  "initNamed:stateMachine:path:initialRequest:",  @"push",  v16,  v14,  0LL);

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    [v18 registerStateTransitionWatcher:v17 startTimeout:300000000000];

    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    id v23 = sub_10014FB28;
    int v24 = &unk_100290788;
    int64_t v25 = self;
    id v26 = v7;
    dispatch_sync(v19, &v21);

    id v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "result", v21, v22, v23, v24, v25));
  }

  _Block_object_dispose(&v30, 8);
  return v10;
}

- (void)_onqueueProcessOutgoingQueue:(id)a3 priorityRush:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v7);

  if (v6)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentOutgoingQueueOperationGroup]);

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
      id v11 = sub_1000AA6AC(@"ckks", v10);
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
        __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v14 ckoperationGroup]);
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v15 name]);
        int v20 = 138412546;
        id v21 = v13;
        __int16 v22 = 2112;
        id v23 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Throwing away CKOperationGroup(%@) in favor of (%@)",  (uint8_t *)&v20,  0x16u);
      }
    }

    else
    {
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      -[os_log_s setCurrentOutgoingQueueOperationGroup:](v12, "setCurrentOutgoingQueueOperationGroup:", v6);
    }
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v17 _onqueueHandleFlag:@"process_outgoing_queue"];

  if (v4) {
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView outgoingQueuePriorityOperationScheduler]( self,  "outgoingQueuePriorityOperationScheduler"));
  }
  else {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperationScheduler](self, "outgoingQueueOperationScheduler"));
  }
  id v19 = v18;
  [v18 trigger];
}

- (id)resultsOfNextProcessIncomingQueueOperation
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue( -[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation]( self,  "resultsOfNextIncomingQueueOperationOperation"));
  if (!v3
    || (BOOL v4 = (void *)v3,
        id v5 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation]( self,  "resultsOfNextIncomingQueueOperationOperation")),  v6 = [v5 isPending],  v5,  v4,  (v6 & 1) == 0))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"wait-for-next-incoming-queue-operation"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  v7,  &stru_1002907A8));
    -[CKKSKeychainView setResultsOfNextIncomingQueueOperationOperation:]( self,  "setResultsOfNextIncomingQueueOperationOperation:",  v8);
  }

  return (id)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView resultsOfNextIncomingQueueOperationOperation]( self,  "resultsOfNextIncomingQueueOperationOperation"));
}

- (id)rpcFetchBecause:(id)a3
{
  id v4 = a3;
  id v38 = 0LL;
  unsigned __int8 v5 = -[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", 5000000000LL, &v38);
  id v6 = v38;
  id v7 = v6;
  if ((v5 & 1) != 0)
  {
    __int128 v53 = @"begin_fetch";
    id v30 = v6;
    id v31 = v4;
    id v51 = @"fetching";
    v49[0] = @"fetchcomplete";
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    v49[1] = @"resetlocal";
    v50[0] = v29;
    uint64_t v47 = @"initializing";
    id v45 = @"initialized";
    __int128 v43 = @"begin_fetch";
    __int128 v41 = @"fetching";
    uint64_t v39 = @"fetchcomplete";
    id v28 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    id v40 = v28;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
    __int128 v42 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
    unsigned int v44 = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
    id v46 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
    uint64_t v48 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    v50[1] = v12;
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  2LL));
    __int128 v52 = v13;
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
    uint64_t v54 = v14;
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v15));

    id v4 = v31;
    id v17 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionWatcher);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    id v19 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:]( v17,  "initNamed:stateMachine:path:initialRequest:",  @"rpc-fetch",  v18,  v16,  0LL);

    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    [v20 registerStateTransitionWatcher:v19 startTimeout:300000000000];

    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014F6C4;
    block[3] = &unk_100290788;
    block[4] = self;
    id v35 = v31;
    dispatch_sync(v21, block);

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10014F73C;
    v32[3] = &unk_100290518;
    id v33 = v19;
    id v22 = v19;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"check-keys",  v32));
    int v24 = (void *)objc_claimAutoreleasedReturnValue([v22 result]);
    [v23 addDependency:v24];

    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    [v25 addOperation:v23];

    id v7 = v30;
  }

  else
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_10014F6B8;
    v36[3] = &unk_100290518;
    id v37 = v6;
    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"fail",  v36));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    [v26 addOperation:v23];

    __int128 v16 = v37;
  }

  return v23;
}

- (id)rpcFetchAndProcessIncomingQueue:(id)a3 because:(id)a4 errorOnClassAFailure:(BOOL)a5
{
  BOOL v5 = a5;
  id v37 = a3;
  id v38 = a4;
  id v48 = 0LL;
  LOBYTE(a4) = -[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", 5000000000LL, &v48);
  id v8 = v48;
  id v36 = v8;
  if ((a4 & 1) != 0)
  {
    if (v5)
    {
      id v73 = @"become_ready";
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v74 = v9;
      uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v74,  &v73,  1LL));
    }

    else
    {
      v71[0] = @"become_ready";
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v71[1] = @"class_a_incoming_items_remaining";
      v72[0] = v9;
      v69 = @"become_ready";
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      uint32_t v70 = v13;
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v70,  &v69,  1LL));
      v72[1] = v14;
      uint64_t v35 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v72,  v71,  2LL));
    }

    __int16 v67 = @"begin_fetch";
    __int16 v65 = @"fetching";
    id v63 = @"fetchcomplete";
    __int128 v61 = @"process_key_hierarchy";
    __int128 v59 = @"check_zone_hierarchies";
    id v55 = @"process_incoming_queue";
    uint64_t v56 = v35;
    v57[0] = @"heal_tlk_shares";
    unsigned int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
    v57[1] = @"tlkmissing";
    v58[0] = v34;
    __int128 v53 = @"check_zone_hierarchies";
    id v49 = @"process_incoming_queue";
    uint64_t v50 = v35;
    id v51 = @"heal_tlk_shares";
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
    __int128 v52 = v15;
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v52,  &v51,  1LL));
    uint64_t v54 = v16;
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));
    v58[1] = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v58,  v57,  2LL));
    __int128 v60 = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
    __int128 v62 = v19;
    int v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    id v64 = v20;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
    id v66 = v21;
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v66,  &v65,  1LL));
    __int16 v68 = v22;
    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v68,  &v67,  1LL));

    id v23 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v33));
    int v24 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionWatcher);
    int64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    id v26 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:]( v24,  "initNamed:stateMachine:path:initialRequest:",  @"fetch-and-process",  v25,  v23,  0LL);

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    [v27 registerStateTransitionWatcher:v26 startTimeout:300000000000];

    id v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014F270;
    block[3] = &unk_100290788;
    block[4] = self;
    id v45 = v38;
    dispatch_sync(v28, block);

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    void v39[2] = sub_10014F2E8;
    v39[3] = &unk_1002907D0;
    objc_copyWeak(&v42, &location);
    id v29 = v26;
    id v40 = v29;
    id v41 = v37;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"check-keys",  v39));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 result]);
    [v10 addDependency:v30];

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    [v31 addOperation:v10];

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

    id v12 = (void *)v35;
  }

  else
  {
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472LL;
    void v46[2] = sub_10014F264;
    v46[3] = &unk_100290518;
    id v47 = v8;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"fail",  v46));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    [v11 addOperation:v10];

    id v12 = v47;
  }

  return v10;
}

- (id)rpcProcessIncomingQueue:(id)a3 errorOnClassAFailure:(BOOL)a4
{
  if (a4)
  {
    int v24 = @"become_ready";
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPathStep success]( &OBJC_CLASS___OctagonStateTransitionPathStep,  "success",  a3));
    int64_t v25 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v25,  &v24,  1LL));
  }

  else
  {
    v22[0] = @"become_ready";
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPathStep success]( &OBJC_CLASS___OctagonStateTransitionPathStep,  "success",  a3));
    v22[1] = @"class_a_incoming_items_remaining";
    v23[0] = v5;
    int v20 = @"become_ready";
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    id v21 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    v23[1] = v8;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
  }

  id v18 = @"process_incoming_queue";
  id v19 = v6;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v9));
  id v11 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionWatcher);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  id v13 = -[OctagonStateTransitionWatcher initNamed:stateMachine:path:initialRequest:]( v11,  "initNamed:stateMachine:path:initialRequest:",  @"process-incoming-queue",  v12,  v10,  0LL);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v14 registerStateTransitionWatcher:v13 startTimeout:300000000000];

  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v15 handleFlag:@"process_incoming_queue"];

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v13 result]);
  return v16;
}

- (id)rpcWaitForPriorityViewProcessing
{
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = sub_10014BED0;
  id v11 = sub_10014BEE0;
  id v12 = 0LL;
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014EE04;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)scanLocalItems
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v2 handleFlag:@"dropped_items"];
}

- (id)updateDeviceState:(BOOL)a3 waitForKeyHierarchyInitialization:(unint64_t)a4 ckoperationGroup:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = objc_alloc(&OBJC_CLASS___OctagonStateMultiStateArrivalWatcher);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  id v11 = sub_100098524();
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:]( v9,  "initNamed:serialQueue:states:",  @"rpc-watcher",  v10,  v12);

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v14 registerMultiStateArrivalWatcher:v13 startTimeout:a4];

  __int128 v15 = objc_alloc(&OBJC_CLASS___CKKSUpdateDeviceStateOperation);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v17 = -[CKKSUpdateDeviceStateOperation initWithOperationDependencies:rateLimit:ckoperationGroup:]( v15,  "initWithOperationDependencies:rateLimit:ckoperationGroup:",  v16,  v6,  v8);

  -[CKKSGroupOperation setName:](v17, "setName:", @"device-state-operation");
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 result]);
  -[CKKSGroupOperation addDependency:](v17, "addDependency:", v18);

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
  -[CKKSUpdateDeviceStateOperation linearDependenciesWithSelfFirst:](v17, "linearDependenciesWithSelfFirst:", v19);

  -[CKKSKeychainView scheduleOperationWithoutDependencies:](self, "scheduleOperationWithoutDependencies:", v17);
  return v17;
}

- (void)toggleHavoc:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014ED10;
  v6[3] = &unk_1002916D0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)pcsMirrorKeysForServices:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472LL;
  id v13 = sub_10014EA64;
  __int128 v14 = &unk_100290818;
  objc_copyWeak(&v17, &location);
  id v8 = v6;
  id v15 = v8;
  id v9 = v7;
  id v16 = v9;
  char v10 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"pcs-mirror-keys",  &v11));
  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v10, v11, v12, v13, v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)xpc24HrNotification
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v2 handleFlag:@"24_hr_notification"];
}

- (id)resyncWithCloud
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___CKKSSynchronizeOperation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  BOOL v5 = -[CKKSSynchronizeOperation initWithCKKSKeychainView:dependencies:]( v3,  "initWithCKKSKeychainView:dependencies:",  self,  v4);

  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v5);
  return v5;
}

- (id)resyncLocal
{
  uint64_t v3 = objc_alloc(&OBJC_CLASS___CKKSLocalSynchronizeOperation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  BOOL v5 = -[CKKSLocalSynchronizeOperation initWithCKKSKeychainView:operationDependencies:]( v3,  "initWithCKKSKeychainView:operationDependencies:",  self,  v4);

  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v5);
  return v5;
}

- (BOOL)_onqueueResetAllInflightOQE:(id *)a3
{
  id v4 = self;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  __int128 v50 = 0u;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v47 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](v4, "operationDependencies"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allCKKSManagedViews]);

  id v8 = [v7 countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v8)
  {
    uint64_t v39 = a3;
    id v40 = v7;
    uint64_t v9 = *(void *)v48;
    p_superclass = &OBJC_CLASS___CKKSProcessReceivedKeysOperation.superclass;
    id v11 = @"inflight";
    uint64_t v36 = *(void *)v48;
    do
    {
      uint64_t v12 = 0LL;
      id v37 = v8;
      while (2)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v38 = v12;
        id v13 = *(void **)(*((void *)&v47 + 1) + 8 * v12);
        while (1)
        {
          __int128 v14 = p_superclass + 74;
          id v15 = v4;
          id v16 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](v4, "operationDependencies", v36));
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 contextID]);
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneID]);
          id v46 = 0LL;
          id v19 = v11;
          id v20 = (id)objc_claimAutoreleasedReturnValue([v14 fetch:100 state:v11 contextID:v17 zoneID:v18 error:&v46]);
          id v21 = v46;

          if (v21)
          {
            id v33 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](v15, "zoneName"));
            id v34 = sub_1000AA6AC(@"ckks", v33);
            uint64_t v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);

            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v52 = v21;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "Error finding inflight outgoing queue records: %@",  buf,  0xCu);
            }

            id v7 = v40;
            if (v39)
            {
              id v21 = v21;
              id *v39 = v21;
            }

- (void)dispatchSyncWithSQLTransaction:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 databaseProvider]);
  [v5 dispatchSyncWithSQLTransaction:v4];
}

- (void)dispatchSyncWithReadOnlySQLTransaction:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v6 databaseProvider]);
  [v5 dispatchSyncWithReadOnlySQLTransaction:v4];
}

- (BOOL)insideSQLTransaction
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 databaseProvider]);
  unsigned __int8 v4 = [v3 insideSQLTransaction];

  return v4;
}

- (void)beginCloudKitOperation
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountTracker](self, "accountTracker"));
  id v3 = [v4 registerForNotificationsOfCloudKitAccountStatusChange:self];
}

- (id)createAccountLoggedInDependency:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10014E988;
  v8[3] = &unk_100290FC8;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"account-logged-in-dependency",  v8));
  [v6 setDescriptionErrorCode:3];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (int64_t)accountStatusFromCKAccountInfo:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    else {
      int64_t v5 = 3LL;
    }
  }

  else
  {
    int64_t v5 = 0LL;
  }

  return v5;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  id v9 = sub_1000AA6AC(@"ckkszone", v8);
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v31 = 138412546;
    *(void *)&v31[4] = v6;
    __int16 v32 = 2112;
    id v33 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Received notification of CloudKit account status change, moving from %@ to %@",  v31,  0x16u);
  }

  int64_t v11 = -[CKKSKeychainView accountStatusFromCKAccountInfo:](self, "accountStatusFromCKAccountInfo:", v6);
  int64_t v12 = -[CKKSKeychainView accountStatusFromCKAccountInfo:](self, "accountStatusFromCKAccountInfo:", v7);
  if (v11 == v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v14 = sub_1000AA6AC(@"ckkszone", v13);
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSAccountStateTracker stringFromAccountStatus:]( &OBJC_CLASS___CKKSAccountStateTracker,  "stringFromAccountStatus:",  v11));
      *(_DWORD *)id v31 = 138412290;
      *(void *)&v31[4] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Computed status of new CK account info is same as old status: %@",  v31,  0xCu);
    }

    goto LABEL_22;
  }

  if (v12)
  {
    if (v12 != 3)
    {
      if (v12 == 1)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
        id v18 = sub_1000AA6AC(@"ckkszone", v17);
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);

        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v31 = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Logged into iCloud.", v31, 2u);
        }

        -[CKKSKeychainView handleCKLogin](self, "handleCKLogin");
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));

        if (v20)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));
          [v21 addOperation:v22];

          -[CKKSKeychainView setAccountLoggedInDependency:](self, "setAccountLoggedInDependency:", 0LL);
        }
      }

      goto LABEL_22;
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v28 = sub_1000AA6AC(@"ckkszone", v27);
    int64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v31 = 0;
      id v26 = "Logging out of iCloud. Shutting down.";
      goto LABEL_18;
    }
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v24 = sub_1000AA6AC(@"ckkszone", v23);
    int64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v31 = 0;
      id v26 = "Account status has become undetermined. Pausing!";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, v31, 2u);
    }
  }

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));
  if (!v29)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView createAccountLoggedInDependency:]( self,  "createAccountLoggedInDependency:",  @"CloudKit account logged in again."));
    -[CKKSKeychainView setAccountLoggedInDependency:](self, "setAccountLoggedInDependency:", v30);
  }

  -[CKKSKeychainView handleCKLogout](self, "handleCKLogout", *(void *)v31);
LABEL_22:
}

- (void)handleCKLogin
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
  id v4 = sub_1000AA6AC(@"ckks", v3);
  int64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "received a notification of CK login", buf, 2u);
  }

  if ((sub_100098648(v6, v7) & 1) != 0)
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014E888;
    block[3] = &unk_1002927F0;
    block[4] = self;
    dispatch_sync(v8, block);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 overallLaunch]);
    [v10 addEvent:@"ck-account-login"];

    int64_t v11 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 activeAccount]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 altDSID]);
    uint64_t v15 = kSecurityRTCEventNameCKAccountLogin;
    uint64_t v16 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v18 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v11,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v14,  v15,  0,  v16,  [v17 sendMetric]);

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v18,  1LL,  0LL);
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    [v19 handleFlag:@"ck_account_logged_in"];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
    [v20 fulfill];
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v22 = sub_1000AA6AC(@"ckks", v21);
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Skipping CloudKit initialization due to disabled CKKS",  buf,  2u);
    }
  }

- (void)handleCKLogout
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014E788;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v3, block);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 overallLaunch]);
  [v5 addEvent:@"ck-account-logout"];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v6 handleFlag:@"ck_account_logged_out"];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  [v7 fulfill];
}

- (void)beginTrustedOperation:(id)a3 suggestTLKUpload:(id)a4 requestPolicyCheck:(id)a5
{
  id v8 = a3;
  id v30 = a4;
  id v29 = a5;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      int64_t v12 = 0LL;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * (void)v12) registerForPeerChangeUpdates:self];
        int64_t v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }

    while (v10);
  }

  id v28 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  uint64_t v39 = kSecurityRTCFieldTrustStatus;
  int64_t v13 = -[CKKSKeychainView trustStatus](self, "trustStatus");
  id v14 = @"available";
  if (v13 == 3) {
    id v14 = @"no account";
  }
  if (!v13) {
    id v14 = @"unknown";
  }
  uint64_t v15 = v14;
  id v40 = v15;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 activeAccount]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 altDSID]);
  uint64_t v20 = kSecurityRTCEventNameTrustGain;
  uint64_t v21 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v23 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v28,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v16,  v19,  v20,  0,  v21,  [v22 sendMetric]);

  id v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014E450;
  block[3] = &unk_100290840;
  block[4] = self;
  id v32 = v8;
  id v33 = v29;
  id v34 = v30;
  id v25 = v30;
  id v26 = v29;
  id v27 = v8;
  dispatch_sync(v24, block);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v23,  1LL,  0LL);
}

- (void)endTrustedOperation
{
  id v3 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  int64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 activeAccount]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
  uint64_t v7 = kSecurityRTCEventNameTrustLoss;
  uint64_t v8 = kSecurityRTCEventCategoryAccountDataAccessRecovery;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  uint64_t v11 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v3,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  &__NSDictionary0__struct,  v6,  v7,  0,  v8,  [v9 sendMetric]);

  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014E31C;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v10, block);

  +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v11,  1LL,  0LL);
}

- (TPSyncingPolicy)syncingPolicy
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 syncingPolicy]);

  return (TPSyncingPolicy *)v3;
}

- (BOOL)setCurrentSyncingPolicy:(id)a3
{
  return -[CKKSKeychainView setCurrentSyncingPolicy:policyIsFresh:]( self,  "setCurrentSyncingPolicy:policyIsFresh:",  a3,  0LL);
}

- (BOOL)setCurrentSyncingPolicy:(id)a3 policyIsFresh:(BOOL)a4
{
  BOOL v56 = a4;
  id v5 = a3;
  id v57 = v5;
  if (v5)
  {
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v5 version]);
    id v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%llu",  [v55 versionNumber]));
    uint64_t v6 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    v74[0] = v54;
    v73[0] = kSecurityRTCFieldSyncingPolicy;
    v73[1] = kSecurityRTCFieldPolicyFreshness;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v56));
    v74[1] = v7;
    v73[2] = kSecurityRTCFieldNumViews;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v57 viewList]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v8 count]));
    v74[2] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v74,  v73,  3LL));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 activeAccount]);
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v15 = [v14 sendMetric];
    uint64_t v16 = -[AAFAnalyticsEventSecurity initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:]( v6,  "initWithCKKSMetrics:altDSID:eventName:testsAreEnabled:category:sendMetric:",  v10,  v13,  kSecurityRTCEventNameSyncingPolicySet,  0LL,  kSecurityRTCEventCategoryAccountDataAccessRecovery,  v15);

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v57 viewList]);
    id v18 = sub_1000AA6AC(@"ckks-policy", 0LL);
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = @"cached";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v57;
      *(_WORD *)&_BYTE buf[12] = 2112;
      if (v56) {
        uint64_t v20 = @"fresh";
      }
      *(void *)&buf[14] = v20;
      *(_WORD *)&buf[22] = 2112;
      v72 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "New syncing policy: %@ (%@) views: %@",  buf,  0x20u);
    }

    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 overallLaunch]);
    [v22 addEvent:@"syncing-policy-set"];

    v70[0] = CKKSSEViewPTA;
    v70[1] = CKKSSEViewPTC;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v70, 2LL));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));

    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
    if (v25)
    {
      id v26 = sub_1000AA6AC(@"ckks-policy", 0LL);
      id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Intersecting view list with allow list: %@",  buf,  0xCu);
      }

      id v29 = [v17 mutableCopy];
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
      [v29 intersectSet:v30];

      id v31 = v29;
      id v32 = sub_1000AA6AC(@"ckks-policy", 0LL);
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v31;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Final list: %@", buf, 0xCu);
      }

      id v34 = [v24 mutableCopy];
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView viewAllowList](self, "viewAllowList"));
      [v34 intersectSet:v35];

      id v36 = v34;
      id v37 = sub_1000AA6AC(@"ckks-policy", 0LL);
      __int128 v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v36;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "Final list of externally-managed view names: %@",  buf,  0xCu);
      }
    }

    else
    {
      id v31 = v17;
      id v36 = v24;
    }

    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000LL;
    LOBYTE(v72) = 0;
    uint64_t v66 = 0LL;
    __int16 v67 = &v66;
    uint64_t v68 = 0x2020000000LL;
    char v69 = 0;
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    __int128 v43 = (void *)objc_claimAutoreleasedReturnValue([v42 databaseProvider]);
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_10014D910;
    v59[3] = &unk_100290868;
    v59[4] = self;
    id v44 = v31;
    id v60 = v44;
    id v61 = v57;
    id v45 = v36;
    id v62 = v45;
    id v63 = &v66;
    id v64 = buf;
    BOOL v65 = v56;
    [v43 dispatchSyncWithReadOnlySQLTransaction:v59];

    if (v56)
    {
      id v46 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
      [v46 handleFlag:@"policy_fresh"];

      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
      [v47 handleFlag:@"process_incoming_queue"];
    }

    if (-[CKKSKeychainView itemModificationsBeforePolicyLoaded](self, "itemModificationsBeforePolicyLoaded"))
    {
      id v48 = sub_1000AA6AC(@"ckks-policy", 0LL);
      __int128 v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v58 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEFAULT,  "Issuing scan suggestions to handle missed items",  v58,  2u);
      }

      -[CKKSKeychainView setItemModificationsBeforePolicyLoaded:](self, "setItemModificationsBeforePolicyLoaded:", 0LL);
      __int128 v50 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
      [v50 handleFlag:@"dropped_items"];
    }

    id v51 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
    [v51 setupAnalytics];

    id v52 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyLoaded](self, "policyLoaded"));
    [v52 fulfill];

    +[SecurityAnalyticsReporterRTC sendMetricWithEvent:success:error:]( &OBJC_CLASS___SecurityAnalyticsReporterRTC,  "sendMetricWithEvent:success:error:",  v16,  1LL,  0LL);
    if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
      BOOL v41 = 1;
    }
    else {
      BOOL v41 = *((_BYTE *)v67 + 24) != 0;
    }

    _Block_object_dispose(&v66, 8);
    _Block_object_dispose(buf, 8);

    id v40 = (os_log_s *)v55;
  }

  else
  {
    id v39 = sub_1000AA6AC(@"ckks-policy", 0LL);
    id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "Nil syncing policy presented; ignoring",
        buf,
        2u);
    }

    BOOL v41 = 0;
  }

  return v41;
}

- (void)onqueueCreatePriorityViewsProcessedWatcher
{
  id v3 = objc_alloc(&OBJC_CLASS___OctagonStateMultiStateArrivalWatcher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  v15[0] = @"ready";
  v15[1] = @"handle_all_views";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 2LL));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  v13[0] = @"loggedout";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  10LL,  @"CloudKit account not present"));
  v13[1] = @"error";
  v14[0] = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  65LL,  @"CKKS currently in error state"));
  v14[1] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v14,  v13,  2LL));
  id v10 = -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:failStates:]( v3,  "initNamed:serialQueue:states:failStates:",  @"wait-for-priority-view-processing",  v4,  v6,  v9);
  -[CKKSKeychainView setPriorityViewsProcessed:](self, "setPriorityViewsProcessed:", v10);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView priorityViewsProcessed](self, "priorityViewsProcessed"));
  [v11 _onqueueRegisterMultiStateArrivalWatcher:v12 startTimeout:-1];
}

- (id)createViewState:(id)a3 contextID:(id)a4 zoneIsNew:(BOOL)a5 priorityView:(BOOL)a6 ckksManagedView:(BOOL)a7
{
  BOOL v25 = a7;
  BOOL v26 = a6;
  BOOL v24 = a5;
  id v9 = a3;
  id v10 = a4;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  uint64_t v11 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
  int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"ckks-%@-notify-scheduler",  v9));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  void v30[2] = sub_10014D670;
  v30[3] = &unk_100290FC8;
  objc_copyWeak(&v32, &location);
  id v13 = v9;
  id v31 = v13;
  id v14 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v11,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  v12,  250000000LL,  1000000000LL,  1LL,  1001LL,  v30);

  id v15 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-ready-scheduler",  v13));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10014D7CC;
  v27[3] = &unk_100290FC8;
  objc_copyWeak(&v29, &location);
  id v17 = v13;
  id v28 = v17;
  id v18 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v15,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  v16,  250000000LL,  120000000000LL,  1LL,  1001LL,  v27);

  id v19 = objc_alloc(&OBJC_CLASS___CKKSKeychainViewState);
  uint64_t v20 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  v17,  CKCurrentUserDefaultName);
  uint64_t v21 = -[CKKSKeychainViewState initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:]( v19,  "initWithZoneID:forContextID:ckksManagedView:priorityView:notifyViewChangedScheduler:notifyViewReadyScheduler:",  v20,  v10,  v25,  v26,  v14,  v18);

  if (v24)
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainViewState launch](v21, "launch"));
    [v22 setFirstLaunch:1];
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v21;
}

- (void)setSyncingViewsAllowList:(id)a3
{
}

- (void)testDropPolicy
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
  [v3 applyNewSyncingPolicy:0 viewStates:v4];

  id v5 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
  -[CKKSKeychainView setPolicyLoaded:](self, "setPolicyLoaded:", v5);
}

- (id)viewStateForName:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 viewStateForName:v4]);

  return v6;
}

- (void)_onqueuePrioritizePriorityViews
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allPriorityViews]);

  if ([v4 count])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    [v5 limitOperationToPriorityViews];

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v7 = sub_1000AA6AC(@"ckksviews", v6);
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 views]);
      *(_DWORD *)buf = 138412290;
      id v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Restricting operation to priority views: %@",  buf,  0xCu);
    }

    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0LL));
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 allViews]);

    id v13 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v25;
      do
      {
        for (i = 0LL; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v25 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
          unsigned int v18 = [v17 priorityView];
          id v19 = (void *)objc_claimAutoreleasedReturnValue([v17 launch]);
          uint64_t v20 = v19;
          if (v18) {
            uint64_t v21 = @"priority-start";
          }
          else {
            uint64_t v21 = @"priority-pause";
          }
          [v19 addEvent:v21];
        }

        id v14 = [v12 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v14);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 overallLaunch]);
    [v23 addEvent:@"priority-start"];
  }
}

- (BOOL)zoneIsReadyForFetching:(id)a3
{
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10014D63C;
  v6[3] = &unk_1002912B8;
  id v9 = &v10;
  id v7 = self;
  id v3 = a3;
  id v8 = v3;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](v7, "dispatchSyncWithReadOnlySQLTransaction:", v6);
  char v4 = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (BOOL)_onQueueZoneIsReadyForFetching:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  dispatch_assert_queue_V2(v5);

  if ((id)-[CKKSKeychainView accountStatus](self, "accountStatus") == (id)1)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contextID]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSZoneStateEntry contextID:zoneName:]( &OBJC_CLASS___CKKSZoneStateEntry,  "contextID:zoneName:",  v7,  v8));

    if ([v9 ckzonecreated])
    {
      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0LL));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 views]);

      id v12 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v12)
      {
        id v13 = v12;
        uint64_t v14 = *(void *)v31;
LABEL_5:
        uint64_t v15 = 0LL;
        while (1)
        {
          if (*(void *)v31 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v30 + 1) + 8 * v15);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneName]);
          unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
          unsigned __int8 v19 = [v17 isEqualToString:v18];

          if ((v19 & 1) != 0) {
            break;
          }
          if (v13 == (id)++v15)
          {
            id v13 = [v11 countByEnumeratingWithState:&v30 objects:v35 count:16];
            if (v13) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }

        __int128 v25 = v16;

        if (!v25) {
          goto LABEL_19;
        }
        BOOL v22 = 1;
        goto LABEL_23;
      }

- (id)participateInFetch:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  uint64_t v14 = sub_10014BED0;
  uint64_t v15 = sub_10014BEE0;
  uint64_t v16 = (CKKSCloudKitFetchRequest *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v16 = objc_alloc_init(&OBJC_CLASS___CKKSCloudKitFetchRequest);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10014D428;
  v8[3] = &unk_1002912B8;
  void v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  uint64_t v10 = &v11;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)changesFetched:(id)a3 deletedRecordIDs:(id)a4 zoneID:(id)a5 newChangeToken:(id)a6 moreComing:(BOOL)a7 resync:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472LL;
  id v29 = sub_10014C420;
  __int128 v30 = &unk_100290890;
  __int128 v31 = self;
  id v18 = v16;
  id v32 = v18;
  id v19 = v14;
  id v33 = v19;
  BOOL v36 = a8;
  id v20 = v15;
  BOOL v37 = a7;
  id v34 = v20;
  id v35 = v17;
  id v21 = v17;
  -[CKKSKeychainView dispatchSyncWithSQLTransaction:](self, "dispatchSyncWithSQLTransaction:", &v27);
  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", v27, v28, v29, v30, v31));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 zoneName]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue([v22 viewStateForName:v23]);

  if ([v20 count])
  {
    __int128 v25 = (void *)objc_claimAutoreleasedReturnValue([v24 notifyViewChangedScheduler]);
    [v25 trigger];
  }

  if (([v24 ckksManagedView] & 1) == 0)
  {
    if ([v19 count] || objc_msgSend(v20, "count"))
    {
      __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([v24 notifyViewChangedScheduler]);
      [v26 trigger];
    }

    if (!a7) {
      [v24 launchComplete];
    }
  }
}

- (BOOL)ckErrorOrPartialError:(id)a3 isError:(int64_t)a4 zoneID:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 code] == (id)a4)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
    unsigned __int8 v10 = [v9 isEqualToString:CKErrorDomain];

    if ((v10 & 1) != 0) {
      goto LABEL_3;
    }
  }

  if ([v7 code] != (id)2
    || (id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]),
        unsigned int v13 = [v12 isEqualToString:CKErrorDomain],
        v12,
        !v13))
  {
LABEL_10:
    BOOL v11 = 0;
    goto LABEL_11;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:CKPartialErrorsByItemIDKey]);

  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v8]);
  if ([v16 code] != (id)a4)
  {

    goto LABEL_10;
  }

  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 domain]);
  unsigned __int8 v18 = [v17 isEqualToString:CKErrorDomain];

  if ((v18 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_3:
  BOOL v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)shouldRetryAfterFetchError:(id)a3 zoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[CKKSKeychainView ckErrorOrPartialError:isError:zoneID:]( self,  "ckErrorOrPartialError:isError:zoneID:",  v6,  21LL,  v7))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    id v9 = sub_1000AA6AC(@"ckks", v8);
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Received notice that our change token is out of date (for %@). Resetting local data...",  (uint8_t *)&v23,  0xCu);
    }

    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    id v12 = v11;
    unsigned int v13 = @"ck_change_token_expired";
  }

  else
  {
    if (!-[CKKSKeychainView ckErrorOrPartialError:isError:zoneID:]( self,  "ckErrorOrPartialError:isError:zoneID:",  v6,  26LL,  v7))
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
      if ([v19 isEqualToString:CKErrorDomain])
      {
        id v20 = [v6 code];

        if (v20 == (id)5)
        {
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
          id v22 = sub_1000AA6AC(@"ckks", v21);
          id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);

          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v23) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Received notice that our container does not exist. Nothing to do.",  (uint8_t *)&v23,  2u);
          }

          goto LABEL_10;
        }
      }

      else
      {
      }

      BOOL v17 = 1;
      goto LABEL_11;
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneName]);
    id v15 = sub_1000AA6AC(@"ckks", v14);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v23 = 138412290;
      id v24 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Received notice that our zone(%@) does not exist. Resetting local data.",  (uint8_t *)&v23,  0xCu);
    }

    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    id v12 = v11;
    unsigned int v13 = @"ck_zone_missing";
  }

  -[os_log_s handleFlag:](v11, "handleFlag:", v13);
LABEL_10:

  BOOL v17 = 0;
LABEL_11:

  return v17;
}

- (void)selfPeerChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName", a3));
  id v5 = sub_1000AA6AC(@"ckks", v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Received update that our self identity has changed",  v7,  2u);
  }

  -[CKKSKeychainView keyStateMachineRequestProcess](self, "keyStateMachineRequestProcess");
}

- (void)trustedPeerSetChanged:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName", a3));
  id v5 = sub_1000AA6AC(@"ckks", v4);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);

  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_ERROR,  "Received update that the trust set has changed",  v8,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v7 handleFlag:@"trusted_peers_changed"];
}

- (BOOL)outgoingQueueEmpty:(id *)a3
{
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10014C3BC;
  v5[3] = &unk_100291378;
  v5[4] = &v6;
  v5[5] = a3;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)waitForFetchAndIncomingQueueProcessing
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneChangeFetcher](self, "zoneChangeFetcher"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 inflightFetch]);

  if (v4) {
    [v4 waitUntilFinished];
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 flags]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 conditionForFlagIfPresent:@"process_incoming_queue"]);

  if (v7) {
    BOOL v8 = [v7 wait:117000000000] == 0;
  }
  else {
    BOOL v8 = 1;
  }
  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 paused]);
  if ([v10 wait:109000000000]) {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)waitForKeyHierarchyReadiness
{
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0LL));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allCKKSManagedViews]);

  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    char v7 = 1;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        char v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v13 + 1) + 8 * (void)i) keyHierarchyConditions]);
        unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:@"ready"]);
        BOOL v11 = [v10 wait:300000000000] == 0;

        v7 &= v11;
      }

      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v5);
  }

  else
  {
    char v7 = 1;
  }

  return v7;
}

- (void)scheduleOperation:(id)a3
{
  id v4 = a3;
  if (-[CKKSKeychainView halted](self, "halted"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v6 = sub_1000AA6AC(@"ckkszone", v5);
    char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)char v9 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "attempted to schedule an operation on a halted zone, ignoring",  v9,  2u);
    }
  }

  else
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountLoggedInDependency](self, "accountLoggedInDependency"));
    [v4 addNullableDependency:v8];

    char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    -[os_log_s addOperation:](v7, "addOperation:", v4);
  }
}

- (BOOL)scheduleOperationWithoutDependencies:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[CKKSKeychainView halted](self, "halted");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v7 = sub_1000AA6AC(@"ckkszone", v6);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned __int8 v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "attempted to schedule an non-dependent operation on a halted zone, ignoring",  v10,  2u);
    }
  }

  else
  {
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    -[os_log_s addOperation:](v8, "addOperation:", v4);
  }

  return v5 ^ 1;
}

- (BOOL)waitUntilAllOperationsAreFinished
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  char v3 = (void *)objc_claimAutoreleasedReturnValue([v2 paused]);
  BOOL v4 = [v3 wait:189000000000] == 0;

  return v4;
}

- (void)waitForOperationsOfClass:(Class)a3
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 operations]);
  id v6 = [v5 copy];

  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v12, a3) & 1) != 0) {
          objc_msgSend(v12, "waitUntilFinished", (void)v13);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)cancelPendingOperations
{
  char v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
  objc_sync_enter(v3);
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations", 0LL));
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) cancel];
        id v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView outgoingQueueOperations](self, "outgoingQueueOperations"));
  [v8 removeAllObjects];

  objc_sync_exit(v3);
}

- (void)cancelAllOperations
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
  [v3 cancelAllOperations];
}

- (void)halt
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
  [v3 haltOperation];

  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10014C3B0;
  block[3] = &unk_1002927F0;
  block[4] = self;
  dispatch_sync(v4, block);

  -[CKKSKeychainView cancelAllOperations](self, "cancelAllOperations");
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 operations]);

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v6);
        }
        __int128 v11 = *(void **)(*((void *)&v26 + 1) + 8LL * (void)i);
      }

      id v8 = [v6 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }

    while (v8);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies", 0LL));
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 allViews]);

  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (j = 0LL; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        unsigned __int8 v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)j);
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 notifyViewChangedScheduler]);
        [v19 cancel];

        id v20 = (void *)objc_claimAutoreleasedReturnValue([v18 notifyViewReadyScheduler]);
        [v20 cancel];
      }

      id v15 = [v13 countByEnumeratingWithState:&v22 objects:v31 count:16];
    }

    while (v15);
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneChangeFetcher](self, "zoneChangeFetcher"));
  [v21 halt];
}

- (BOOL)waitForPolicy:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView policyLoaded](self, "policyLoaded"));
  id v7 = [v6 wait:a3];

  if (v7)
  {
    id v8 = sub_1000AA6AC(@"ckks", 0LL);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Haven't yet received a syncing policy", v13, 2u);
    }

    if (a4)
    {
      NSErrorUserInfoKey v14 = NSLocalizedDescriptionKey;
      __int128 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"CKKS syncing policy not yet loaded"));
      id v15 = v10;
      __int128 v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  56LL,  v11));
    }
  }

  return v7 == 0LL;
}

- (id)policyDependentViewStateForName:(id)a3 timeout:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (-[CKKSKeychainView waitForPolicy:error:](self, "waitForPolicy:error:", a4, a5))
  {
    uint64_t v20 = 0LL;
    id v21 = &v20;
    uint64_t v22 = 0x3032000000LL;
    __int128 v23 = sub_10014BED0;
    __int128 v24 = sub_10014BEE0;
    id v25 = 0LL;
    uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10014C254;
    block[3] = &unk_1002912B8;
    block[4] = self;
    id v10 = v8;
    id v18 = v10;
    id v19 = &v20;
    dispatch_sync(v9, block);

    __int128 v11 = (void *)v21[5];
    if (v11)
    {
      if ([v11 ckksManagedView])
      {
        a5 = (id *)(id)v21[5];
LABEL_11:

        _Block_object_dispose(&v20, 8);
        goto LABEL_12;
      }

      if (!a5) {
        goto LABEL_11;
      }
      NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue([(id)v21[5] zoneName]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot get view %@; is externally managed",
                        v14));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  63LL,  v15));
    }

    else
    {
      if (!a5) {
        goto LABEL_11;
      }
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"No syncing view for '%@'",  v10));
      __int128 v27 = v12;
      __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v27,  &v26,  1LL));
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"CKKSErrorDomain",  11LL,  v13));
    }

    a5 = 0LL;
    goto LABEL_11;
  }

  a5 = 0LL;
LABEL_12:

  return a5;
}

- (id)policyDependentViewStateForName:(id)a3 error:(id *)a4
{
  return -[CKKSKeychainView policyDependentViewStateForName:timeout:error:]( self,  "policyDependentViewStateForName:timeout:error:",  a3,  5000000000LL,  a4);
}

- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 errorOnNoCloudKitAccount:(BOOL)a5 errorOnPolicyMissing:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  NSErrorUserInfoKey v14 = (void *)objc_claimAutoreleasedReturnValue([v13 completedSecCKKSInitialize]);
  id v15 = [v14 wait:5000000000];

  if (v15)
  {
    id v16 = sub_1000AA6AC(@"ckks", 0LL);
    BOOL v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v32) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "Haven't yet initialized SecDb; expect failure",
        (uint8_t *)&v32,
        2u);
    }
  }

  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView accountStateKnown](self, "accountStateKnown"));
  id v19 = v18;
  if (v10) {
    uint64_t v20 = 500000000LL;
  }
  else {
    uint64_t v20 = 2000000000LL;
  }
  [v18 wait:v20];

  int64_t v21 = -[CKKSKeychainView accountStatus](self, "accountStatus");
  if (v9 && v21 != 1)
  {
    if (v21)
    {
      uint64_t v22 = @"User is not signed into iCloud.";
      uint64_t v23 = 10LL;
    }

    else
    {
      uint64_t v22 = @"iCloud account status unknown.";
      uint64_t v23 = 64LL;
    }

    id v25 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  v23,  v22));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView zoneName](self, "zoneName"));
    id v28 = sub_1000AA6AC(@"ckkscurrent", v27);
    __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v32 = 138412546;
      id v33 = v12;
      __int16 v34 = 2112;
      id v35 = v25;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Rejecting %@ RPC since we don't have an iCloud account: %@",  (uint8_t *)&v32,  0x16u);
    }

    if (a7)
    {
      id v25 = v25;
      BOOL v26 = 0;
      *a7 = v25;
LABEL_27:

      goto LABEL_28;
    }

- (id)viewsForPeerID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0LL;
  int64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = sub_10014BED0;
  id v24 = sub_10014BEE0;
  id v25 = (id)0xAAAAAAAAAAAAAAAALL;
  id v25 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  BOOL v17 = sub_10014BED0;
  id v18 = sub_10014BEE0;
  id v19 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10014BEE8;
  v10[3] = &unk_100291798;
  v10[4] = self;
  id v12 = &v14;
  id v7 = v6;
  id v11 = v7;
  __int128 v13 = &v20;
  -[CKKSKeychainView dispatchSyncWithReadOnlySQLTransaction:](self, "dispatchSyncWithReadOnlySQLTransaction:", v10);
  if (a4) {
    *a4 = (id) v15[5];
  }
  id v8 = (id)v21[5];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v8;
}

- (void)rpcStatus:(id)a3 fast:(BOOL)a4 waitForNonTransientState:(unint64_t)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  id v32 = 0LL;
  unsigned __int8 v12 = -[CKKSKeychainView waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:]( self,  "waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:",  @"status",  v8,  0LL,  0LL,  &v32);
  id v13 = v32;
  if ((v12 & 1) != 0)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___OctagonStateMultiStateArrivalWatcher);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView queue](self, "queue"));
    v33[0] = @"loggedout";
    v33[1] = @"ready";
    v33[2] = @"error";
    v33[3] = @"waitfortrust";
    v33[4] = @"halted";
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 5LL));
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v16));
    id v18 = -[OctagonStateMultiStateArrivalWatcher initNamed:serialQueue:states:]( v14,  "initNamed:serialQueue:states:",  @"rpc-watcher",  v15,  v17);

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    [v19 registerMultiStateArrivalWatcher:v18 startTimeout:a5];

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v23 = _NSConcreteStackBlock;
    uint64_t v24 = 3221225472LL;
    id v25 = sub_10014B0E8;
    BOOL v26 = &unk_1002908E0;
    objc_copyWeak(&v29, &location);
    BOOL v30 = v8;
    id v27 = v10;
    id v28 = v11;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"status-rpc",  &v23));
    int64_t v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "result", v23, v24, v25, v26));
    [v20 addDependency:v21];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationQueue](self, "operationQueue"));
    [v22 addOperation:v20];

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  else
  {
    (*((void (**)(id, void, id))v11 + 2))(v11, 0LL, v13);
  }
}

- (id)intransactionSlowStatus:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 contextID]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCurrentKeySet loadForZone:contextID:]( &OBJC_CLASS___CKKSCurrentKeySet,  "loadForZone:contextID:",  v4,  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneName]);
    id v10 = sub_1000AA6AC(@"ckks", v9);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v6 error]);
      *(_DWORD *)buf = 138412290;
      v147 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "error loading keyset: %@", buf, 0xCu);
    }
  }

  id v13 = v3;
  uint64_t v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v129 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  contexta = objc_autoreleasePoolPush();
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  id v141 = 0LL;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSDeviceStateEntry allInZone:error:]( &OBJC_CLASS___CKKSDeviceStateEntry,  "allInZone:error:",  v15,  &v141));
  id v17 = v141;

  v139[0] = _NSConcreteStackBlock;
  v139[1] = 3221225472LL;
  v139[2] = sub_10014B060;
  v139[3] = &unk_100290908;
  __int128 v127 = v14;
  v140 = v127;
  [v16 enumerateObjectsUsingBlock:v139];
  __int128 v128 = v6;
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v6 currentTLKPointer]);
  id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentKeyUUID]);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 contextID]);
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  id v138 = v17;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSTLKShareRecord allForUUID:contextID:zoneID:error:]( &OBJC_CLASS___CKKSTLKShareRecord,  "allForUUID:contextID:zoneID:error:",  v19,  v20,  v21,  &v138));
  id v23 = v138;

  v136[0] = _NSConcreteStackBlock;
  uint64_t v24 = v13;
  v136[1] = 3221225472LL;
  v136[2] = sub_10014B0A4;
  v136[3] = &unk_100290908;
  id v130 = v129;
  __int128 v137 = v130;
  [v22 enumerateObjectsUsingBlock:v136];

  objc_autoreleasePoolPop(contexta);
  if ([v13 ckksManagedView])
  {
    v144[0] = @"statusError";
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
    BOOL v26 = v25;
    if (v25) {
      id v27 = v25;
    }
    else {
      id v27 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v31 = v27;

    context = v31;
    v145[0] = v31;
    v144[1] = @"oqe";
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue([v32 contextID]);
    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneID]);
    id v135 = v23;
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSOutgoingQueueEntry countsByStateWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSOutgoingQueueEntry,  "countsByStateWithContextID:zoneID:error:",  v33,  v34,  &v135));
    id v36 = v135;

    if (v35) {
      BOOL v37 = v35;
    }
    else {
      BOOL v37 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    __int128 v43 = v37;

    __int128 v124 = v43;
    v145[1] = v43;
    v144[2] = @"iqe";
    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    id v45 = (void *)objc_claimAutoreleasedReturnValue([v44 contextID]);
    id v46 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneID]);
    id v134 = v36;
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSIncomingQueueEntry countsByStateWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSIncomingQueueEntry,  "countsByStateWithContextID:zoneID:error:",  v45,  v46,  &v134));
    id v48 = v134;

    if (v47) {
      id v49 = v47;
    }
    else {
      id v49 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v54 = v49;

    __int128 v123 = v54;
    v145[2] = v54;
    v144[3] = @"ckmirror";
    id v55 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    BOOL v56 = (void *)objc_claimAutoreleasedReturnValue([v55 contextID]);
    id v57 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneID]);
    id v133 = v48;
    id v58 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSMirrorEntry countsByParentKeyWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSMirrorEntry,  "countsByParentKeyWithContextID:zoneID:error:",  v56,  v57,  &v133));
    id v59 = v133;

    if (v58) {
      id v60 = v58;
    }
    else {
      id v60 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v65 = v60;

    v145[3] = v65;
    v144[4] = @"devicestates";
    uint64_t v66 = v127;
    __int16 v67 = v66;
    if (v66) {
      uint64_t v68 = v66;
    }
    else {
      uint64_t v68 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v71 = v68;

    v145[4] = v71;
    v144[5] = @"tlkshares";
    v72 = v130;
    id v73 = v72;
    __int128 v121 = v71;
    __int128 v122 = v65;
    if (v72) {
      v74 = v72;
    }
    else {
      v74 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    v75 = v74;

    v145[5] = v75;
    v144[6] = @"keys";
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    v77 = (void *)objc_claimAutoreleasedReturnValue([v76 contextID]);
    id v78 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneID]);
    id v132 = v59;
    id v79 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSKey countsByClassWithContextID:zoneID:error:]( &OBJC_CLASS___CKKSKey,  "countsByClassWithContextID:zoneID:error:",  v77,  v78,  &v132));
    id v80 = v132;

    if (v79) {
      id v81 = v79;
    }
    else {
      id v81 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v82 = v81;

    __int128 v119 = v82;
    v145[6] = v82;
    v144[7] = @"currentTLK";
    v83 = (void *)objc_claimAutoreleasedReturnValue([v128 tlk]);
    id v84 = (void *)objc_claimAutoreleasedReturnValue([v83 uuid]);

    if (v84) {
      id v85 = v84;
    }
    else {
      id v85 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v86 = v85;

    __int128 v118 = v86;
    v145[7] = v86;
    v144[8] = @"currentClassA";
    int v87 = (void *)objc_claimAutoreleasedReturnValue([v128 classA]);
    int v88 = (void *)objc_claimAutoreleasedReturnValue([v87 uuid]);

    if (v88) {
      id v89 = v88;
    }
    else {
      id v89 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v90 = v89;

    __int128 v117 = v90;
    v145[8] = v90;
    v144[9] = @"currentClassC";
    id v91 = (void *)objc_claimAutoreleasedReturnValue([v128 classC]);
    id v92 = (void *)objc_claimAutoreleasedReturnValue([v91 uuid]);

    if (v92) {
      id v93 = v92;
    }
    else {
      id v93 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v94 = v93;

    v116 = v94;
    v145[9] = v94;
    v144[10] = @"currentTLKPtr";
    id v95 = (void *)objc_claimAutoreleasedReturnValue([v128 currentTLKPointer]);
    id v96 = (void *)objc_claimAutoreleasedReturnValue([v95 currentKeyUUID]);

    if (v96) {
      id v97 = v96;
    }
    else {
      id v97 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    __int128 v98 = v97;

    v145[10] = v98;
    v144[11] = @"currentClassAPtr";
    __int128 v99 = (void *)objc_claimAutoreleasedReturnValue([v128 currentClassAPointer]);
    __int128 v100 = (void *)objc_claimAutoreleasedReturnValue([v99 currentKeyUUID]);

    __int128 v120 = v75;
    if (v100) {
      id v101 = v100;
    }
    else {
      id v101 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    uint64_t v102 = v101;
    id v103 = v24;

    v145[11] = v102;
    v144[12] = @"currentClassCPtr";
    uint64_t v104 = (void *)objc_claimAutoreleasedReturnValue([v128 currentClassCPointer]);
    char v105 = (void *)objc_claimAutoreleasedReturnValue([v104 currentKeyUUID]);

    id v106 = v80;
    if (v105) {
      id v107 = v105;
    }
    else {
      id v107 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v108 = v107;

    v145[12] = v108;
    v144[13] = @"itemsyncing";
    unsigned __int8 v109 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    objc_super v110 = (void *)objc_claimAutoreleasedReturnValue([v109 syncingPolicy]);
    v111 = (void *)objc_claimAutoreleasedReturnValue([v103 zoneID]);
    id v112 = (void *)objc_claimAutoreleasedReturnValue([v111 zoneName]);
    unsigned int v113 = [v110 isSyncingEnabledForView:v112];
    v114 = @"paused";
    if (v113) {
      v114 = @"enabled";
    }
    v145[13] = v114;
    uint32_t v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v145,  v144,  14LL));

    id v39 = v128;
    uint64_t v24 = v103;
    __int128 v50 = v124;
    __int128 v38 = context;
    id v23 = v106;
    char v69 = v122;
    id v61 = v123;
  }

  else
  {
    v142[0] = @"statusError";
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v23 description]);
    id v29 = v28;
    if (v28) {
      id v30 = v28;
    }
    else {
      id v30 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    __int128 v38 = v30;
    id v39 = v128;

    v143[0] = v38;
    v142[1] = @"tlkshares";
    id v40 = v130;
    BOOL v41 = v40;
    if (v40) {
      __int128 v42 = v40;
    }
    else {
      __int128 v42 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    __int128 v50 = v42;

    v143[1] = v50;
    v142[2] = @"currentTLK";
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v128 tlk]);
    id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 uuid]);

    if (v52) {
      id v53 = v52;
    }
    else {
      id v53 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    id v61 = v53;

    v143[2] = v61;
    v142[3] = @"currentTLKPtr";
    id v62 = (void *)objc_claimAutoreleasedReturnValue([v128 currentTLKPointer]);
    id v63 = (void *)objc_claimAutoreleasedReturnValue([v62 currentKeyUUID]);

    if (v63) {
      id v64 = v63;
    }
    else {
      id v64 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    }
    char v69 = v64;

    v143[3] = v69;
    uint32_t v70 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v143,  v142,  4LL));
  }

  return v70;
}

- (id)fastStatus:(id)a3 zoneStateEntry:(id)a4
{
  id v5 = a3;
  v26[0] = @"view";
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 zoneName]);
  BOOL v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v10 = v9;

  v27[0] = v10;
  v26[1] = @"zoneCreated";
  else {
    id v11 = @"no";
  }
  v27[1] = v11;
  v26[2] = @"zoneSubscribed";
  unsigned int v12 = [v6 ckzonesubscribed];

  if (v12) {
    id v13 = @"yes";
  }
  else {
    id v13 = @"no";
  }
  v27[2] = v13;
  v26[3] = @"keystate";
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v5 viewKeyHierarchyState]);
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v17 = v16;

  v27[3] = v17;
  v26[4] = @"ckksManaged";
  else {
    id v18 = @"no";
  }
  void v27[4] = v18;
  v26[5] = @"statusError";
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  v27[5] = v19;
  v26[6] = @"launchSequence";
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v5 launch]);
  int64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 eventsByTime]);

  if (v21) {
    id v22 = v21;
  }
  else {
    id v22 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
  }
  id v23 = v22;

  v27[6] = v23;
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v27,  v26,  7LL));

  return v24;
}

- (int64_t)accountStatus
{
  return self->_accountStatus;
}

- (void)setAccountStatus:(int64_t)a3
{
  self->_accountStatus = a3;
}

- (CKContainer)container
{
  return (CKContainer *)objc_getProperty(self, a2, 24LL, 1);
}

- (CKKSAccountStateTracker)accountTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAccountTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 40LL, 1);
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 48LL, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56LL, 1);
}

- (CKKSCondition)loggedIn
{
  return (CKKSCondition *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setLoggedIn:(id)a3
{
}

- (CKKSCondition)loggedOut
{
  return (CKKSCondition *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setLoggedOut:(id)a3
{
}

- (CKKSCondition)accountStateKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setAccountStateKnown:(id)a3
{
}

- (int64_t)trustStatus
{
  return self->_trustStatus;
}

- (void)setTrustStatus:(int64_t)a3
{
  self->_trustStatus = a3;
}

- (CKKSCondition)trustStatusKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setTrustStatusKnown:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return (CKKSLockStateTracker *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setLockStateTracker:(id)a3
{
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 112LL, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPersonaAdapter:(id)a3
{
}

- (BOOL)keyStateMachineRefetched
{
  return self->_keyStateMachineRefetched;
}

- (void)setKeyStateMachineRefetched:(BOOL)a3
{
  self->_keyStateMachineRefetched = a3;
}

- (BOOL)keyStateFullRefetchRequested
{
  return self->_keyStateFullRefetchRequested;
}

- (void)setKeyStateFullRefetchRequested:(BOOL)a3
{
  self->_keyStateFullRefetchRequested = a3;
}

- (BOOL)firstManateeKeyFetched
{
  return self->_firstManateeKeyFetched;
}

- (void)setFirstManateeKeyFetched:(BOOL)a3
{
  self->_firstManateeKeyFetched = a3;
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setAccountsAdapter:(id)a3
{
}

- (CKKSCuttlefishAdapterProtocol)cuttlefishAdapter
{
  return (CKKSCuttlefishAdapterProtocol *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setCuttlefishAdapter:(id)a3
{
}

- (CKKSZoneChangeFetcher)zoneChangeFetcher
{
  return (CKKSZoneChangeFetcher *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setZoneChangeFetcher:(id)a3
{
}

- (CKKSNearFutureScheduler)suggestTLKUpload
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setSuggestTLKUpload:(id)a3
{
}

- (CKKSNearFutureScheduler)outgoingQueueOperationScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setOutgoingQueueOperationScheduler:(id)a3
{
}

- (CKKSNearFutureScheduler)outgoingQueuePriorityOperationScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setOutgoingQueuePriorityOperationScheduler:(id)a3
{
}

- (CKKSIncomingQueueOperation)lastIncomingQueueOperation
{
  return (CKKSIncomingQueueOperation *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setLastIncomingQueueOperation:(id)a3
{
}

- (CKKSNewTLKOperation)lastNewTLKOperation
{
  return (CKKSNewTLKOperation *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setLastNewTLKOperation:(id)a3
{
}

- (CKKSOutgoingQueueOperation)lastOutgoingQueueOperation
{
  return (CKKSOutgoingQueueOperation *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setLastOutgoingQueueOperation:(id)a3
{
}

- (CKKSProcessReceivedKeysOperation)lastProcessReceivedKeysOperation
{
  return (CKKSProcessReceivedKeysOperation *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setLastProcessReceivedKeysOperation:(id)a3
{
}

- (CKKSReencryptOutgoingItemsOperation)lastReencryptOutgoingItemsOperation
{
  return (CKKSReencryptOutgoingItemsOperation *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setLastReencryptOutgoingItemsOperation:(id)a3
{
}

- (CKKSSynchronizeOperation)lastSynchronizeOperation
{
  return (CKKSSynchronizeOperation *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setLastSynchronizeOperation:(id)a3
{
}

- (CKKSResultOperation)lastFixupOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setLastFixupOperation:(id)a3
{
}

- (NSOperation)holdOutgoingQueueOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setHoldOutgoingQueueOperation:(id)a3
{
}

- (NSOperation)holdIncomingQueueOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setHoldIncomingQueueOperation:(id)a3
{
}

- (NSOperation)holdLocalSynchronizeOperation
{
  return (NSOperation *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setHoldLocalSynchronizeOperation:(id)a3
{
}

- (NSString)zoneName
{
  return (NSString *)objc_getProperty(self, a2, 256LL, 1);
}

- (BOOL)initiatedLocalScan
{
  return self->_initiatedLocalScan;
}

- (void)setInitiatedLocalScan:(BOOL)a3
{
  self->_initiatedLocalScan = a3;
}

- (CKKSOperationDependencies)operationDependencies
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 264LL, 1);
}

- (CKKSCondition)policyLoaded
{
  return (CKKSCondition *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setPolicyLoaded:(id)a3
{
}

- (OctagonStateMultiStateArrivalWatcher)priorityViewsProcessed
{
  return (OctagonStateMultiStateArrivalWatcher *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setPriorityViewsProcessed:(id)a3
{
}

- (BOOL)itemModificationsBeforePolicyLoaded
{
  return self->_itemModificationsBeforePolicyLoaded;
}

- (void)setItemModificationsBeforePolicyLoaded:(BOOL)a3
{
  self->_itemModificationsBeforePolicyLoaded = a3;
}

- (CKKSResultOperation)resultsOfNextIncomingQueueOperationOperation
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setResultsOfNextIncomingQueueOperationOperation:(id)a3
{
}

- (NSHashTable)outgoingQueueOperations
{
  return (NSHashTable *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setOutgoingQueueOperations:(id)a3
{
}

- (NSMutableSet)resyncRecordsSeen
{
  return (NSMutableSet *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setResyncRecordsSeen:(id)a3
{
}

- (CKKSSecDbAdapter)databaseProvider
{
  return (CKKSSecDbAdapter *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setDatabaseProvider:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (CKKSResultOperation)accountLoggedInDependency
{
  return (CKKSResultOperation *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setAccountLoggedInDependency:(id)a3
{
}

- (BOOL)halted
{
  return self->_halted;
}

- (void)setHalted:(BOOL)a3
{
  self->_halted = a3;
}

- (NSArray)currentTrustStates
{
  return (NSArray *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setCurrentTrustStates:(id)a3
{
}

- (NSSet)viewAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setViewAllowList:(id)a3
{
}

- (BOOL)havoc
{
  return self->_havoc;
}

- (void)setHavoc:(BOOL)a3
{
  self->_havoc = a3;
}

- (void).cxx_destruct
{
}

- (id)externalManagedViewForRPC:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (-[CKKSKeychainView waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:]( self,  "waitUntilReadyForRPCForOperation:fast:errorOnNoCloudKitAccount:errorOnPolicyMissing:error:",  @"external operation",  0LL,  1LL,  1LL,  a4))
  {
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView operationDependencies](self, "operationDependencies"));
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v7 allExternalManagedViews]);

    id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v21;
LABEL_4:
      uint64_t v12 = 0LL;
      while (1)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v20 + 1) + 8 * v12);
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 zoneName]);
        unsigned __int8 v15 = [v14 isEqualToString:v6];

        if ((v15 & 1) != 0) {
          break;
        }
        if (v10 == (id)++v12)
        {
          id v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
          if (v10) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }

      id v16 = v13;

      if (!v16) {
        goto LABEL_16;
      }
      if (![v16 ckksManagedView])
      {
        id v16 = v16;
        a4 = (id *)v16;
        goto LABEL_21;
      }

      if (!a4) {
        goto LABEL_21;
      }
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"View is not externally managed: '%@'",  v6));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  62LL,  v17));
    }

    else
    {
LABEL_10:

LABEL_16:
      if (!a4)
      {
        id v16 = 0LL;
        goto LABEL_21;
      }

      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown external view: '%@'",  v6));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"CKKSErrorDomain",  11LL,  v18));

      id v16 = 0LL;
    }

    a4 = 0LL;
LABEL_21:

    goto LABEL_22;
  }

  a4 = 0LL;
LABEL_22:

  return a4;
}

- (void)resetExternallyManagedCloudKitView:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v14 = 0LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView externalManagedViewForRPC:error:]( self,  "externalManagedViewForRPC:error:",  v6,  &v14));
  id v9 = v14;
  if (v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v6));
    id v11 = -[CKKSKeychainView rpcResetCloudKit:reply:](self, "rpcResetCloudKit:reply:", v10, v7);
  }

  else
  {
    id v12 = sub_1000AA6AC(@"ckkszone", 0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Can't reset CloudKit zone for view %@: %@",  buf,  0x16u);
    }

    v7[2](v7, v9);
  }
}

- (void)proposeTLKForExternallyManagedView:(id)a3 proposedTLK:(id)a4 wrappedOldTLK:(id)a5 tlkShares:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v23 = a4;
  id v24 = a5;
  id v13 = a6;
  id v14 = a7;
  id v32 = 0LL;
  unsigned __int8 v15 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView externalManagedViewForRPC:error:]( self,  "externalManagedViewForRPC:error:",  v12,  &v32));
  id v16 = v32;
  if (v15)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_100170AD8;
    v25[3] = &unk_1002910F8;
    objc_copyWeak(&v31, (id *)location);
    id v26 = v23;
    id v27 = v15;
    id v28 = v24;
    id v17 = v14;
    id v30 = v17;
    id v29 = v13;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionGroupOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"external-tlk-rpc",  @"ready",  @"ready",  v25));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"ready"));
    [v19 doSimpleStateMachineRPC:@"external-tlk-rpc" op:v18 sourceStates:v20 reply:v17];

    objc_destroyWeak(&v31);
    objc_destroyWeak((id *)location);
  }

  else
  {
    id v21 = sub_1000AA6AC(@"ckkszone", 0LL);
    __int128 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v12;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Can't propose TLKs for view %@: %@",  location,  0x16u);
    }

    (*((void (**)(id, id))v14 + 2))(v14, v16);
  }
}

- (void)fetchExternallyManagedViewKeyHierarchy:(id)a3 forceFetch:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v14 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView externalManagedViewForRPC:error:]( self,  "externalManagedViewForRPC:error:",  v8,  &v14));
  id v11 = v14;
  if (v10)
  {
    if (v6) {
      -[CKKSKeychainView fetchCloudKitExternallyManagedViewKeyHierarchy:reply:]( self,  "fetchCloudKitExternallyManagedViewKeyHierarchy:reply:",  v10,  v9);
    }
    else {
      -[CKKSKeychainView loadKeys:reply:](self, "loadKeys:reply:", v10, v9);
    }
  }

  else
  {
    id v12 = sub_1000AA6AC(@"ckkszone", 0LL);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v8;
      __int16 v17 = 2112;
      id v18 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Can't fetch CloudKit zone for view %@: %@",  buf,  0x16u);
    }

    (*((void (**)(id, void, void, void, id))v9 + 2))(v9, 0LL, 0LL, 0LL, v11);
  }
}

- (void)fetchCloudKitExternallyManagedViewKeyHierarchy:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView rpcFetchBecause:](self, "rpcFetchBecause:", @"se-api"));
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_100170970;
  v13[3] = &unk_100291120;
  objc_copyWeak(&v17, &location);
  id v9 = v8;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  id v11 = v7;
  id v16 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"rpc-response",  v13));
  [v12 addDependency:v9];
  -[CKKSKeychainView scheduleOperation:](self, "scheduleOperation:", v12);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)loadKeys:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView databaseProvider](self, "databaseProvider"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10017023C;
  v11[3] = &unk_100291608;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 dispatchSyncWithReadOnlySQLTransaction:v11];
}

- (void)modifyTLKSharesForExternallyManagedView:(id)a3 adding:(id)a4 deleting:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, id))a6;
  id v26 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[CKKSKeychainView externalManagedViewForRPC:error:]( self,  "externalManagedViewForRPC:error:",  v10,  &v26));
  id v15 = v26;
  if (v14)
  {
    *(void *)id location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10016EE90;
    v21[3] = &unk_1002911D8;
    objc_copyWeak(&v25, (id *)location);
    id v22 = v14;
    id v23 = v11;
    id v24 = v12;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionGroupOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"external-tlk-rpc",  @"ready",  @"ready",  v21));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CKKSKeychainView stateMachine](self, "stateMachine"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"ready"));
    [v17 doSimpleStateMachineRPC:@"external-tlkshare-modification-rpc" op:v16 sourceStates:v18 reply:v13];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)location);
  }

  else
  {
    id v19 = sub_1000AA6AC(@"ckkszone", 0LL);
    __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138412546;
      *(void *)&location[4] = v10;
      __int16 v28 = 2112;
      id v29 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Can't modify CloudKit zone for view %@: %@",  location,  0x16u);
    }

    v13[2](v13, v15);
  }
}

@end