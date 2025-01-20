@interface OTCuttlefishContext
- (BOOL)accountAvailable:(id)a3 error:(id *)a4;
- (BOOL)accountNoLongerAvailable;
- (BOOL)canSendMetricsUsingAccountState:(int)a3;
- (BOOL)checkAllStateCleared;
- (BOOL)checkForPhonePeerPresence:(id)a3;
- (BOOL)fetchSendingMetricsPermitted:(id *)a3;
- (BOOL)idmsTrustLevelChanged:(id *)a3;
- (BOOL)initialBecomeUntrustedPosted;
- (BOOL)leaveTrust:(id *)a3;
- (BOOL)machineIDOnMemoizedList:(id)a3 error:(id *)a4;
- (BOOL)persistSendingMetricsPermitted:(BOOL)a3 error:(id *)a4;
- (BOOL)postConfirmPasscodeCFU:(id *)a3;
- (BOOL)postRepairCFU:(id *)a3;
- (BOOL)processMoveRequest:(id)a3 error:(id *)a4;
- (BOOL)recheckCKKSTrustStatus:(id *)a3;
- (BOOL)setCDPEnabled:(id *)a3;
- (BOOL)shouldPostConfirmPasscodeCFU:(id *)a3;
- (BOOL)waitForReady:(int64_t)a3;
- (CKAccountInfo)cloudKitAccountInfo;
- (CKKSCloudKitAccountStateTrackingProvider)accountStateTracker;
- (CKKSCondition)cloudKitAccountStateKnown;
- (CKKSCondition)pendingEscrowCacheWarmup;
- (CKKSKeychainView)ckks;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)apsRateLimiter;
- (CKKSNearFutureScheduler)checkMetricsTrigger;
- (CKKSNearFutureScheduler)fixupRetryScheduler;
- (CKKSNearFutureScheduler)requestPolicyCheckNotifier;
- (CKKSNearFutureScheduler)sosConsistencyRateLimiter;
- (CKKSNearFutureScheduler)suggestTLKUploadNotifier;
- (CKKSNearFutureScheduler)upgradeUserControllableViewsRateLimiter;
- (CKKSPeerProvider)octagonAdapter;
- (CKKSReachabilityTracker)reachabilityTracker;
- (Class)escrowRequestClass;
- (Class)notifierClass;
- (CuttlefishXPCWrapper)cuttlefishXPCWrapper;
- (NSOperationQueue)operationQueue;
- (NSString)containerName;
- (NSString)contextID;
- (NSString)description;
- (NSString)machineID;
- (NSString)pairingUUID;
- (NSString)recoveryKey;
- (OS_dispatch_queue)queue;
- (OTAccountSettings)accountSettings;
- (OTAccountsAdapter)accountsAdapter;
- (OTAuthKitAdapter)authKitAdapter;
- (OTCustodianRecoveryKey)custodianRecoveryKey;
- (OTCuttlefishAccountStateHolder)accountMetadataStore;
- (OTCuttlefishContext)initWithContainerName:(id)a3 contextID:(id)a4 activeAccount:(id)a5 cuttlefish:(id)a6 ckksAccountSync:(id)a7 sosAdapter:(id)a8 accountsAdapter:(id)a9 authKitAdapter:(id)a10 personaAdapter:(id)a11 tooManyPeersAdapter:(id)a12 tapToRadarAdapter:(id)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 accountStateTracker:(id)a16 deviceInformationAdapter:(id)a17 apsConnectionClass:(Class)a18 escrowRequestClass:(Class)a19 notifierClass:(Class)a20 cdpd:(id)a21;
- (OTDeviceInformationAdapter)deviceAdapter;
- (OTFollowup)followupHandler;
- (OTInheritanceKey)inheritanceKey;
- (OTMetricsSessionData)sessionMetrics;
- (OTPersonaAdapter)personaAdapter;
- (OTSOSAdapter)sosAdapter;
- (OTTapToRadarAdapter)tapToRadarAdapter;
- (OTTooManyPeersAdapter)tooManyPeersAdapter;
- (OctagonAPSReceiver)apsReceiver;
- (OctagonStateMachine)stateMachine;
- (SecLaunchSequence)launchSequence;
- (TPPolicyVersion)policyOverride;
- (TPSpecificUser)activeAccount;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)appleAccountSignOutOperation;
- (id)becomeInheritedOperation;
- (id)becomeReadyOperation;
- (id)becomeUntrustedOperation:(id)a3;
- (id)checkForAccountFixupsOperation:(id)a3;
- (id)ckksPeerStatus:(id)a3;
- (id)cloudKitAccountNewlyAvailableOperation:(id)a3;
- (id)currentMemoizedLastHealthCheck;
- (id)currentlyEnforcingIDMSTDL_testOnly:(id *)a3;
- (id)cuttlefishTrustEvaluation;
- (id)egoPeerStatus:(id *)a3;
- (id)errorIfNoCKAccount:(id)a3;
- (id)establishStatePathDictionary;
- (id)evaluateSecdOctagonTrust;
- (id)evaluateTPHOctagonTrust;
- (id)extractStringKey:(id)a3 fromDictionary:(id)a4;
- (id)initializingOperation;
- (id)joinStatePathDictionary;
- (id)mergedAccountSettings:(id)a3;
- (id)operationDependencies;
- (id)postRepairCFUAndBecomeUntrusted;
- (id)prepareInformation;
- (id)repairAccountIfTrustedByTPHWithIntendedState:(id)a3;
- (id)sosSelvesStatus;
- (id)sosTrustedPeersStatus;
- (int)currentMemoizedAccountState;
- (int)currentMemoizedTrustState;
- (int)shouldSendMetricsForOctagon;
- (int64_t)checkForCKAccount:(id)a3;
- (int64_t)getCDPStatus:(id *)a3;
- (void)accountStateUpdated:(id)a3 from:(id)a4;
- (void)areRecoveryKeysDistrusted:(id)a3;
- (void)checkOctagonHealth:(BOOL)a3 repair:(BOOL)a4 reply:(id)a5;
- (void)checkTrustStatusAndPostRepairCFUIfNecessary:(id)a3;
- (void)clearCKKS;
- (void)clearContextState;
- (void)clearPairingUUID;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)deviceNameUpdated;
- (void)fetchEscrowContents:(id)a3;
- (void)fetchTrustedDeviceNamesByPeerID:(id)a3;
- (void)getAccountMetadataWithReply:(id)a3;
- (void)handlePairingRestart:(id)a3;
- (void)handleTTRRequest:(id)a3;
- (void)joinWithBottle:(id)a3 entropy:(id)a4 bottleSalt:(id)a5 reply:(id)a6;
- (void)joinWithCustodianRecoveryKey:(id)a3 reply:(id)a4;
- (void)joinWithInheritanceKey:(id)a3 reply:(id)a4;
- (void)joinWithRecoveryKey:(id)a3 reply:(id)a4;
- (void)localReset:(id)a3;
- (void)moveToCheckTrustedState;
- (void)notificationOfMachineIDListChange;
- (void)notifyContainerChange:(id)a3;
- (void)notifyContainerChangeWithUserInfo:(id)a3;
- (void)notifyTrustChanged:(int)a3;
- (void)octagonPeerIDGivenBottleID:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemoval:(BOOL)a3 altDSID:(id)a4 reply:(id)a5;
- (void)popTooManyPeersDialogWithEgoPeerStatus:(id)a3 accountMeta:(id)a4;
- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 reply:(id)a4;
- (void)preflightJoinWithInheritanceKey:(id)a3 reply:(id)a4;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 reply:(id)a4;
- (void)requestTrustedDeviceListRefresh;
- (void)rerollWithReply:(id)a3;
- (void)resetCKKS:(id)a3;
- (void)rpcAccountWideSettingsWithForceFetch:(BOOL)a3 reply:(id)a4;
- (void)rpcCheckCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcCheckInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcCreateCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 reply:(id)a6;
- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcEpoch:(id)a3;
- (void)rpcEstablish:(id)a3 reply:(id)a4;
- (void)rpcFetchAccountSettings:(id)a3;
- (void)rpcFetchAllViableBottlesFromSource:(int64_t)a3 reply:(id)a4;
- (void)rpcFetchAllViableEscrowRecordsFromSource:(int64_t)a3 reply:(id)a4;
- (void)rpcFetchEgoPeerID:(id)a3;
- (void)rpcFetchTotalCountOfTrustedPeers:(id)a3;
- (void)rpcFetchTrustedSecureElementIdentities:(id)a3;
- (void)rpcFetchUserControllableViewsSyncingStatus:(id)a3;
- (void)rpcGenerateInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcInvalidateEscrowCache:(id)a3;
- (void)rpcIsRecoveryKeySet:(id)a3;
- (void)rpcJoin:(id)a3 vouchSig:(id)a4 reply:(id)a5;
- (void)rpcLeaveClique:(id)a3;
- (void)rpcPrepareIdentityAsApplicantWithConfiguration:(id)a3 epoch:(unint64_t)a4 reply:(id)a5;
- (void)rpcRecreateInheritanceKeyWithUUID:(id)a3 oldIK:(id)a4 reply:(id)a5;
- (void)rpcRefetchCKKSPolicy:(id)a3;
- (void)rpcRemoveCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcRemoveFriendsInClique:(id)a3 reply:(id)a4;
- (void)rpcRemoveInheritanceKeyWithUUID:(id)a3 reply:(id)a4;
- (void)rpcRemoveLocalSecureElementIdentityPeerID:(id)a3 reply:(id)a4;
- (void)rpcRemoveRecoveryKey:(id)a3;
- (void)rpcReset:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5;
- (void)rpcResetAccountCDPContentsWithIdmsTargetContext:(id)a3 idmsCuttlefishPassword:(id)a4 notifyIdMS:(BOOL)a5 reply:(id)a6;
- (void)rpcResetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 reply:(id)a9;
- (void)rpcResetAndEstablish:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5;
- (void)rpcSetAccountSetting:(id)a3 reply:(id)a4;
- (void)rpcSetLocalSecureElementIdentity:(id)a3 reply:(id)a4;
- (void)rpcSetRecoveryKey:(id)a3 reply:(id)a4;
- (void)rpcSetUserControllableViewsSyncingStatus:(BOOL)a3 reply:(id)a4;
- (void)rpcStatus:(id)a3;
- (void)rpcStoreInheritanceKeyWithIK:(id)a3 reply:(id)a4;
- (void)rpcTlkRecoverabilityForEscrowRecordData:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)rpcTrustStatus:(id)a3 reply:(id)a4;
- (void)rpcTrustStatusCachedStatus:(id)a3 reply:(id)a4;
- (void)rpcVoucherWithConfiguration:(id)a3 permanentInfo:(id)a4 permanentInfoSig:(id)a5 stableInfo:(id)a6 stableInfoSig:(id)a7 reply:(id)a8;
- (void)rpcWaitForPriorityViewKeychainDataRecovery:(id)a3;
- (void)setAccountMetadataStore:(id)a3;
- (void)setAccountSettings:(id)a3;
- (void)setActiveAccount:(id)a3;
- (void)setApsRateLimiter:(id)a3;
- (void)setApsReceiver:(id)a3;
- (void)setCheckMetricsTrigger:(id)a3;
- (void)setCkks:(id)a3;
- (void)setCloudKitAccountInfo:(id)a3;
- (void)setCloudKitAccountStateKnown:(id)a3;
- (void)setCustodianRecoveryKey:(id)a3;
- (void)setFixupRetryScheduler:(id)a3;
- (void)setFollowupHandler:(id)a3;
- (void)setInheritanceKey:(id)a3;
- (void)setInitialBecomeUntrustedPosted:(BOOL)a3;
- (void)setLaunchSequence:(id)a3;
- (void)setMachineID:(id)a3;
- (void)setMachineIDOverride:(id)a3;
- (void)setMetricsStateToActive;
- (void)setMetricsStateToInactive;
- (void)setMetricsToState:(int)a3;
- (void)setOctagonAdapter:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setPairingUUID:(id)a3;
- (void)setPendingEscrowCacheWarmup:(id)a3;
- (void)setPolicyOverride:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setRecoveryKey:(id)a3;
- (void)setRequestPolicyCheckNotifier:(id)a3;
- (void)setSessionMetrics:(id)a3;
- (void)setShouldSendMetricsForOctagon:(int)a3;
- (void)setSosConsistencyRateLimiter:(id)a3;
- (void)setSuggestTLKUploadNotifier:(id)a3;
- (void)setUpgradeUserControllableViewsRateLimiter:(id)a3;
- (void)startOctagonStateMachine;
- (void)tlkRecoverabilityInOctagon:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)trustedPeerSetChanged:(id)a3;
- (void)waitForOctagonUpgrade:(id)a3;
@end

@implementation OTCuttlefishContext

- (OTCuttlefishContext)initWithContainerName:(id)a3 contextID:(id)a4 activeAccount:(id)a5 cuttlefish:(id)a6 ckksAccountSync:(id)a7 sosAdapter:(id)a8 accountsAdapter:(id)a9 authKitAdapter:(id)a10 personaAdapter:(id)a11 tooManyPeersAdapter:(id)a12 tapToRadarAdapter:(id)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 accountStateTracker:(id)a16 deviceInformationAdapter:(id)a17 apsConnectionClass:(Class)a18 escrowRequestClass:(Class)a19 notifierClass:(Class)a20 cdpd:(id)a21
{
  id v80 = a3;
  id v87 = a4;
  id v86 = a5;
  id v26 = a6;
  id v79 = a7;
  id v71 = a8;
  id v78 = a8;
  id v77 = a9;
  id v76 = a10;
  id v85 = a11;
  id v75 = a12;
  id v74 = a13;
  id v84 = a14;
  id v83 = a15;
  id v82 = a16;
  id v73 = a17;
  id v27 = a21;
  v97.receiver = self;
  v97.super_class = (Class)&OBJC_CLASS___OTCuttlefishContext;
  v28 = -[OTCuttlefishContext init](&v97, "init");
  if (v28)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v28);
    objc_storeStrong((id *)&v28->_containerName, a3);
    objc_storeStrong((id *)&v28->_contextID, a4);
    objc_storeStrong((id *)&v28->_activeAccount, a5);
    objc_storeStrong((id *)&v28->_reachabilityTracker, a15);
    uint64_t v29 = objc_claimAutoreleasedReturnValue( +[OctagonAPSReceiver receiverForNamedDelegatePort:apsConnectionClass:]( &OBJC_CLASS___OctagonAPSReceiver,  "receiverForNamedDelegatePort:apsConnectionClass:",  @"com.apple.securityd.aps",  a18));
    apsReceiver = v28->_apsReceiver;
    v28->_apsReceiver = (OctagonAPSReceiver *)v29;

    v31 = v28->_apsReceiver;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](v28, "containerName"));
    id v33 =  -[OctagonAPSReceiver registerCuttlefishReceiver:forContainerName:contextID:]( v31,  "registerCuttlefishReceiver:forContainerName:contextID:",  v28,  v32,  v87);

    objc_storeStrong((id *)&v28->_ckks, a7);
    v28->_initialBecomeUntrustedPosted = 0;
    objc_storeStrong((id *)&v28->_tooManyPeersAdapter, a12);
    objc_storeStrong((id *)&v28->_tapToRadarAdapter, a13);
    v34 = -[SecLaunchSequence initWithRocketName:]( objc_alloc(&OBJC_CLASS___SecLaunchSequence),  "initWithRocketName:",  @"com.apple.octagon.launch");
    launchSequence = v28->_launchSequence;
    v28->_launchSequence = v34;

    dispatch_queue_t v36 = dispatch_queue_create("com.apple.security.otcuttlefishcontext", 0LL);
    queue = v28->_queue;
    v28->_queue = (OS_dispatch_queue *)v36;

    v38 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v28->_operationQueue;
    v28->_operationQueue = v38;

    v40 = objc_alloc_init(&OBJC_CLASS___CKKSCondition);
    cloudKitAccountStateKnown = v28->_cloudKitAccountStateKnown;
    v28->_cloudKitAccountStateKnown = v40;

    v42 = -[OTCuttlefishAccountStateHolder initWithQueue:container:context:personaAdapter:activeAccount:]( objc_alloc(&OBJC_CLASS___OTCuttlefishAccountStateHolder),  "initWithQueue:container:context:personaAdapter:activeAccount:",  v28->_queue,  v28->_containerName,  v28->_contextID,  v85,  v86);
    accountMetadataStore = v28->_accountMetadataStore;
    v28->_accountMetadataStore = v42;

    -[OTCuttlefishAccountStateHolder registerNotification:](v28->_accountMetadataStore, "registerNotification:", v28);
    v44 = objc_alloc(&OBJC_CLASS___OctagonStateMachine);
    unsigned __int8 v45 = [v87 isEqualToString:@"defaultContext"];
    if ((v45 & 1) != 0) {
      v46 = @"octagon";
    }
    else {
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"octagon-%@",  v87));
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonStateMap](&OBJC_CLASS___OTStates, "OctagonStateMap"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates AllOctagonFlags](&OBJC_CLASS___OTStates, "AllOctagonFlags"));
    v49 = -[OctagonStateMachine initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:]( v44,  "initWithName:states:flags:initialState:queue:stateEngine:unexpectedStateErrorDomain:lockStateTracker:reachabilityTracker:",  v46,  v47,  v48,  @"Initializing",  v28->_queue,  v28,  @"com.apple.security.octagon.state",  v84,  v83);
    stateMachine = v28->_stateMachine;
    v28->_stateMachine = v49;

    if ((v45 & 1) == 0) {
    objc_storeStrong((id *)&v28->_sosAdapter, v71);
    }
    -[OTSOSAdapter registerForPeerChangeUpdates:](v28->_sosAdapter, "registerForPeerChangeUpdates:", v28);
    objc_storeStrong((id *)&v28->_accountsAdapter, a9);
    objc_storeStrong((id *)&v28->_authKitAdapter, a10);
    objc_storeStrong((id *)&v28->_personaAdapter, a11);
    objc_storeStrong((id *)&v28->_deviceAdapter, a17);
    -[OTDeviceInformationAdapter registerForDeviceNameUpdates:]( v28->_deviceAdapter,  "registerForDeviceNameUpdates:",  v28);
    v51 = -[CuttlefishXPCWrapper initWithCuttlefishXPCConnection:]( objc_alloc(&OBJC_CLASS___CuttlefishXPCWrapper),  "initWithCuttlefishXPCConnection:",  v26);
    cuttlefishXPCWrapper = v28->_cuttlefishXPCWrapper;
    v28->_cuttlefishXPCWrapper = v51;

    objc_storeStrong((id *)&v28->_lockStateTracker, a14);
    objc_storeStrong((id *)&v28->_accountStateTracker, a16);
    v53 = -[OTFollowup initWithFollowupController:]( objc_alloc(&OBJC_CLASS___OTFollowup),  "initWithFollowupController:",  v27);
    followupHandler = v28->_followupHandler;
    v28->_followupHandler = v53;

    id v55 = [v82 registerForNotificationsOfCloudKitAccountStatusChange:v28];
    -[OTAuthKitAdapter registerNotification:](v28->_authKitAdapter, "registerNotification:", v28);
    objc_storeStrong((id *)&v28->_notifierClass, a20);
    objc_storeStrong((id *)&v28->_escrowRequestClass, a19);
    v56 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472LL;
    v94[2] = sub_1000C8538;
    v94[3] = &unk_100291A38;
    objc_copyWeak(&v95, &location);
    v57 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v56,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  @"octagon-tlk-request",  500000000LL,  0LL,  0LL,  v94);
    suggestTLKUploadNotifier = v28->_suggestTLKUploadNotifier;
    v28->_suggestTLKUploadNotifier = v57;

    v59 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472LL;
    v92[2] = sub_1000C85D4;
    v92[3] = &unk_100291A38;
    objc_copyWeak(&v93, &location);
    v60 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v59,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  @"octagon-policy-check",  500000000LL,  0LL,  0LL,  v92);
    requestPolicyCheckNotifier = v28->_requestPolicyCheckNotifier;
    v28->_requestPolicyCheckNotifier = v60;

    v62 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v90[0] = _NSConcreteStackBlock;
    v90[1] = 3221225472LL;
    v90[2] = sub_1000C8670;
    v90[3] = &unk_100291A38;
    objc_copyWeak(&v91, &location);
    v63 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v62,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"octagon-upgrade-ucv",  0LL,  10000000000LL,  0LL,  0LL,  v90);
    upgradeUserControllableViewsRateLimiter = v28->_upgradeUserControllableViewsRateLimiter;
    v28->_upgradeUserControllableViewsRateLimiter = v63;

    v65 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler),  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"octagon-retry-fixup",  10000000000LL,  600000000000LL,  0LL,  0LL,  &stru_100284FA0,  2.0);
    fixupRetryScheduler = v28->_fixupRetryScheduler;
    v28->_fixupRetryScheduler = v65;

    v28->_shouldSendMetricsForOctagon = 0;
    v67 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v88[0] = _NSConcreteStackBlock;
    v88[1] = 3221225472LL;
    v88[2] = sub_1000C86E0;
    v88[3] = &unk_100291A38;
    objc_copyWeak(&v89, &location);
    v68 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v67,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"ensure-metrics-off",  3600000000000LL,  0LL,  1LL,  0LL,  v88);
    checkMetricsTrigger = v28->_checkMetricsTrigger;
    v28->_checkMetricsTrigger = v68;

    v28->_accountType = 0LL;
    objc_destroyWeak(&v89);
    objc_destroyWeak(&v91);
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v95);
    objc_destroyWeak(&location);
  }

  return v28;
}

- (void)clearCKKS
{
}

- (void)resetCKKS:(id)a3
{
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___OTCuttlefishContext;
  -[OTCuttlefishContext dealloc](&v2, "dealloc");
}

- (void)notifyTrustChanged:(int)a3
{
  v5 = sub_10001267C("octagon");
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"Untrusted";
    if (a3 == 2) {
      v7 = @"Trusted";
    }
    int v14 = 138412290;
    v15 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Changing trust status to: %@",  (uint8_t *)&v14,  0xCu);
  }

  if (!-[OTSOSActualAdapter sosEnabled]_0(v8, v9))
  {
    v10 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  kSOSCCCircleChangedNotification));
    -[objc_class post:](v10, "post:", v11);
  }

  v12 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "com.apple.security.octagon.trust-status-change"));
  -[objc_class post:](v12, "post:", v13);
}

- (void)accountStateUpdated:(id)a3 from:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 icloudAccountState] == 2
    && [v7 icloudAccountState] != 2)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    [v8 addEvent:@"iCloudAccount"];
  }

  if ([v6 trustState] == 2 && objc_msgSend(v7, "trustState") != 2)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    [v9 addEvent:@"Trusted"];

    -[OTCuttlefishContext notifyTrustChanged:](self, "notifyTrustChanged:", [v6 trustState]);
  }

  if ([v6 trustState] != 2 && objc_msgSend(v7, "trustState") == 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    [v10 addEvent:@"Untrusted"];

    -[OTCuttlefishContext notifyTrustChanged:](self, "notifyTrustChanged:", [v6 trustState]);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 deviceInformationAdapter]);
    unsigned int v13 = [v12 isHomePod];

    int v14 = sub_10001267C("octagon");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Trust transition from TRUSTED to some other state, posting TTR",  buf,  2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithCapacity:",  5LL));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v19 = (void *)objc_claimAutoreleasedReturnValue([v18 deviceInformationAdapter]);
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 serialNumber]);
      [v17 setObject:v20 forKeyedSubscript:@"serial"];

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 deviceInformationAdapter]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 deviceName]);
      [v17 setObject:v23 forKeyedSubscript:@"name"];

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 deviceInformationAdapter]);
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 osVersion]);
      [v17 setObject:v26 forKeyedSubscript:@"os_version"];

      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 deviceInformationAdapter]);
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 modelID]);
      [v17 setObject:v29 forKeyedSubscript:@"model_id"];

      v30 = (void *)objc_claimAutoreleasedReturnValue([v6 peerID]);
      [v17 setObject:v30 forKeyedSubscript:@"peer_id"];

      id v46 = 0LL;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v17,  2LL,  &v46));
      v15 = (os_log_s *)v46;
      if (v31) {
        v32 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v31, 4LL);
      }
      else {
        v32 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Error while serializing identifiers: %@",  v15));
      }
      id v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tapToRadarAdapter](self, "tapToRadarAdapter"));
      [v34 postHomePodLostTrustTTR:v33];
    }

    else if (v16)
    {
      *(_WORD *)unsigned __int8 v45 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Trust transition from TRUSTED to UNTRUSTED on a non-homepod",  v45,  2u);
    }
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue([v6 syncingPolicy]);
  dispatch_queue_t v36 = (void *)objc_claimAutoreleasedReturnValue([v7 syncingPolicy]);
  unsigned __int8 v37 = [v35 isEqualToData:v36];

  if ((v37 & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue([v6 getTPSyncingPolicy]);
    v39 = (void *)objc_claimAutoreleasedReturnValue([v7 getTPSyncingPolicy]);
    unsigned int v40 = [v38 syncUserControllableViews];
    if (v40 != [v39 syncUserControllableViews])
    {
      v41 = sub_10001267C("octagon-ucv");
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "User controllable view state changed; posting notification",
          v44,
          2u);
      }

      v43 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
      -[objc_class post:](v43, "post:", OTUserControllableViewStatusChanged);
    }
  }
}

- (NSString)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<OTCuttlefishContext: %@, %@>",  v3,  v4));

  return (NSString *)v5;
}

- (void)notificationOfMachineIDListChange
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "machine ID list notification -- refreshing device list",  v5,  2u);
  }

  -[OTCuttlefishContext requestTrustedDeviceListRefresh](self, "requestTrustedDeviceListRefresh");
}

- (BOOL)canSendMetricsUsingAccountState:(int)a3
{
  return a3 != 2;
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v5 = a4;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C80B8;
  block[3] = &unk_100290788;
  id v7 = v5;
  id v26 = v7;
  id v27 = self;
  dispatch_sync(v6, block);

  if ([v7 accountStatus] != (id)1)
  {
    uint64_t v8 = sub_10001267C("octagon");
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Informed that the CK account is now unavailable: %@",  buf,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
    v11 = objc_alloc(&OBJC_CLASS___AAFAnalyticsEventSecurity);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v10 flowID]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceSessionID]);
    uint64_t v16 = kSecurityRTCEventNameCloudKitAccountAvailability;
    LOBYTE(v22) = -[OTCuttlefishContext canSendMetricsUsingAccountState:]( self,  "canSendMetricsUsingAccountState:",  -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon"));
    v17 = -[AAFAnalyticsEventSecurity initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:]( v11,  "initWithKeychainCircleMetrics:altDSID:flowID:deviceSessionID:eventName:testsAreEnabled:canSendMetrics:category:",  0LL,  v13,  v14,  v15,  v16,  0LL,  v22,  kSecurityRTCEventCategoryAccountDataAccessRecovery);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"cloudkit-account-gone",  @"WaitingForCloudKitAccount"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000C8518;
    v23[3] = &unk_100284FC8;
    v24 = v17;
    v21 = v17;
    [v18 doSimpleStateMachineRPC:@"cloudkit-account-gone" op:v19 sourceStates:v20 reply:v23];
  }
}

- (BOOL)accountAvailable:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = sub_10001267C("octagon");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v58 = v6;
    __int16 v59 = 2112;
    v60 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Account available with altDSID: %@ %@",  buf,  0x16u);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
  [v9 setFirstLaunch:1];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountsAdapter](self, "accountsAdapter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext personaAdapter](self, "personaAdapter"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  id v56 = 0LL;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( [v10 findAccountForCurrentThread:v11 optionalAltDSID:v6 cloudkitContainerName:v12 octagonContextID:v13 error:&v56]);
  v15 = (OTCuttlefishContext *)v56;
  -[OTCuttlefishContext setActiveAccount:](self, "setActiveAccount:", v14);

  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v52 = v15;
  if (!v16 || v15)
  {
    v41 = sub_10001267C("SecError");
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
      *(_DWORD *)buf = 138412546;
      id v58 = v42;
      __int16 v59 = 2112;
      v60 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon-account: unable to determine active account for context(%@). Issues ahead: %@",  buf,  0x16u);
    }
  }

  else
  {
    id v51 = v6;
    v17 = sub_10001267C("octagon-account");
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
      v20 = (OTCuttlefishContext *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      *(_DWORD *)buf = 138412546;
      id v58 = v19;
      __int16 v59 = 2112;
      v60 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found a new account (%@): %@", buf, 0x16u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    [v21 changeActiveAccount:v22];

    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s operationDependencies](v23, "operationDependencies"));
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 activeAccount]);
    if (v25)
    {
      id v26 = (void *)v25;
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 operationDependencies]);
      id v29 = a4;
      v30 = (void *)objc_claimAutoreleasedReturnValue([v28 activeAccount]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      unsigned __int8 v32 = [v30 isEqual:v31];

      a4 = v29;
      id v6 = v51;
      if ((v32 & 1) != 0) {
        goto LABEL_16;
      }
      id v33 = sub_10001267C("ckks-account");
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        dispatch_queue_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
        unsigned __int8 v37 = (void *)objc_claimAutoreleasedReturnValue([v36 operationDependencies]);
        v38 = (OTCuttlefishContext *)objc_claimAutoreleasedReturnValue([v37 activeAccount]);
        *(_DWORD *)buf = 138412546;
        id v58 = v35;
        __int16 v59 = 2112;
        v60 = v38;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Updating CKKS's idea of account to %@; old: %@",
          buf,
          0x16u);
      }

      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      unsigned int v40 = (void *)objc_claimAutoreleasedReturnValue([v39 operationDependencies]);
      [v40 setActiveAccount:v23];
    }

    else
    {
    }
  }

LABEL_16:
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1000C8088;
  v54[3] = &unk_100291520;
  id v44 = v6;
  id v55 = v44;
  id v53 = 0LL;
  [v43 persistAccountChanges:v54 error:&v53];
  id v45 = v53;

  if (v45)
  {
    id v46 = sub_10001267C("SecError");
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v58 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "octagon: unable to persist new account availability: %@",  buf,  0xCu);
    }

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    [v48 handleFlag:@"account_available"];

    if (a4) {
      *a4 = v45;
    }
  }

  else
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    [v49 handleFlag:@"account_available"];
  }

  return v45 == 0LL;
}

- (void)moveToCheckTrustedState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    [v4 recheck];
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v5 handleFlag:@"check_trust_state"];
}

- (BOOL)idmsTrustLevelChanged:(id *)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine", a3));
  [v3 handleFlag:@"idms_level"];

  return 1;
}

- (BOOL)accountNoLongerAvailable
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    [v4 recheck];
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v5 handleFlag:@"apple_account_signed_out"];

  return 1;
}

- (int64_t)getCDPStatus:(id *)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v16 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 loadOrCreateAccountMetadata:&v16]);
  id v6 = v16;

  if (v6)
  {
    id v7 = sub_10001267C("octagon-cdp-status");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "error fetching account metadata: %@",  buf,  0xCu);
    }

    int64_t v9 = 0LL;
    if (a3) {
      *a3 = v6;
    }
  }

  else
  {
    unsigned int v10 = [v5 cdpState];
    if (v10 == 2) {
      int64_t v9 = 2LL;
    }
    else {
      int64_t v9 = v10 == 1;
    }
    v11 = sub_10001267C("octagon-cdp-status");
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = OTCDPStatusToString(v9);
      int v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412290;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "current cdp status is: %@", buf, 0xCu);
    }
  }

  return v9;
}

- (BOOL)setCDPEnabled:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v13 = 0LL;
  [v5 persistAccountChanges:&stru_100284FE8 error:&v13];
  id v6 = v13;

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v7 handleFlag:@"cdp_enabled"];

  if (v6)
  {
    uint64_t v8 = sub_10001267C("SecError");
    int64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "octagon-cdp-status: unable to persist CDP enablement: %@",  buf,  0xCu);
    }

    if (a3) {
      *a3 = v6;
    }
  }

  else
  {
    unsigned int v10 = sub_10001267C("octagon-cdp-status");
    v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Successfully set CDP status bit to 'enabled''",  buf,  2u);
    }
  }

  return v6 == 0LL;
}

- (void)localReset:(id)a3
{
  id v4 = a3;
  v17 = @"LocalReset";
  id v15 = @"LocalResetClearLocalContextState";
  id v13 = @"Initializing";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  int v14 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v16 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  id v18 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v8));

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonAllStates](&OBJC_CLASS___OTStates, "OctagonAllStates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  id v12 =  [v11 doWatchedStateMachineRPC:@"local-reset-watcher" sourceStates:v10 path:v9 reply:v4];
}

- (id)establishStatePathDictionary
{
  v39 = @"EstablishEnableCDPBit";
  unsigned __int8 v37 = @"ReEnactDeviceList";
  v35 = @"ReEnactPrepare";
  id v33 = @"ResetAndEstablishClearLocalContextState";
  v31 = @"ReEnactReadyToEstablish";
  v29[0] = @"EscrowTriggerUpdate";
  id v27 = @"BecomeReady";
  uint64_t v25 = @"Ready";
  id v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v26 = v16;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  v28 = v15;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  v29[1] = @"EstablishCKKSReset";
  v30[0] = v14;
  v23 = @"EstablishAfterCKKSReset";
  v21 = @"EscrowTriggerUpdate";
  v19 = @"BecomeReady";
  v17 = @"Ready";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v18 = v13;
  objc_super v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  v20 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  uint64_t v22 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  v24 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  v30[1] = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v30,  v29,  2LL));
  unsigned __int8 v32 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
  v34 = v7;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  dispatch_queue_t v36 = v8;
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));
  v38 = v9;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
  unsigned int v40 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));

  return v11;
}

- (void)rpcEstablish:(id)a3 reply:(id)a4
{
  id v10 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext establishStatePathDictionary](self, "establishStatePathDictionary"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
  id v9 = [v7 doWatchedStateMachineRPC:@"establish" sourceStates:v8 path:v6 reply:v10];
}

- (void)rpcReset:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5
{
  id v8 = a5;
  self->_isGuitarfish = a4;
  self->_accountType = 1LL;
  self->_resetReason = a3;
  id v27 = @"CuttlefishReset";
  uint64_t v25 = @"CKKSResetAfterOctagonReset";
  v23 = @"LocalReset";
  v21 = @"LocalResetClearLocalContextState";
  v19 = @"Initializing";
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  v20 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
  uint64_t v22 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
  v24 = v11;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  id v26 = v12;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  v28 = v13;
  int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v14));

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
  id v18 = [v16 doWatchedStateMachineRPC:@"rpc-reset" sourceStates:v17 path:v15 reply:v8];
}

- (void)performCKServerUnreadableDataRemoval:(BOOL)a3 altDSID:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *))a5;
  self->_accountType = 2LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v10)
  {
    v11 = sub_10001267C("octagon-perform-ckserver-unreadable-data-removal");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v9[2](v9, v10);
    goto LABEL_12;
  }

  if (v8) {
    goto LABEL_7;
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AKAccountManager sharedInstance](&OBJC_CLASS___AKAccountManager, "sharedInstance"));
  if (v23)
  {
    id v8 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 primaryAuthKitAccount]);
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "aa_altDSID"));

      id v8 = (id)v26;
LABEL_7:
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
      id v34 = 0LL;
      id v14 = [v13 accountIsDemoAccountByAltDSID:v8 error:&v34];
      id v15 = v34;

      if (v15)
      {
        id v18 = sub_10001267C("SecError");
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "octagon-perform-ckserver-unreadable-data-removal: failed to fetch demo account flag: %@",  buf,  0xCu);
        }
      }

      uint64_t IsInternalRelease = SecIsInternalRelease(v16, v17);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = sub_1000C7F44;
      v32[3] = &unk_100285010;
      id v33 = v9;
      [v21 performCKServerUnreadableDataRemovalWithSpecificUser:v22 isGuitarfish:v6 internalAccount:IsInternalRelease demoAccount:v14 reply:v32];

      goto LABEL_12;
    }

    id v29 = sub_10001267C("SecError");
    v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "octagon-perform-ckserver-unreadable-data-removal, Primary Authkit Account is nil",  buf,  2u);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  44LL,  @"Primary Authkit Account is nil"));
    v9[2](v9, v31);
  }

  else
  {
    id v27 = sub_10001267C("SecError");
    v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "octagon-perform-ckserver-unreadable-data-removal, AuthKit Account Manager is nil",  buf,  2u);
    }

    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  77LL,  @"AuthKit Account Manager is nil"));
    v9[2](v9, v8);
  }

- (void)rpcResetAndEstablish:(int64_t)a3 isGuitarfish:(BOOL)a4 reply:(id)a5
{
}

- (id)mergedAccountSettings:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
  BOOL v6 = objc_alloc_init(&OBJC_CLASS___OTAccountSettings);
  else {
    id v7 = v5;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 walrus]);
  -[OTAccountSettings setWalrus:](v6, "setWalrus:", v8);

  else {
    id v9 = v5;
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 webAccess]);
  -[OTAccountSettings setWebAccess:](v6, "setWebAccess:", v10);

  return v6;
}

- (void)rpcResetAndEstablish:(int64_t)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 accountSettings:(id)a7 isGuitarfish:(BOOL)a8 reply:(id)a9
{
  id v15 = (NSString *)a4;
  uint64_t v16 = (NSString *)a5;
  id v17 = a9;
  idmsTargetContext = self->_idmsTargetContext;
  self->_resetReason = a3;
  self->_idmsTargetContext = v15;
  v19 = v15;
  id v20 = a7;

  idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
  self->_idmsCuttlefishPassword = v16;
  uint64_t v22 = v16;

  self->_notifyIdMS = a6;
  self->_isGuitarfish = a8;
  self->_accountType = 2LL;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext mergedAccountSettings:](self, "mergedAccountSettings:", v20));

  -[OTCuttlefishContext setAccountSettings:](self, "setAccountSettings:", v23);
  id v36 = @"ResetBecomeUntrusted";
  id v34 = @"ResetAnyMissingTLKCKKSViews";
  unsigned __int8 v32 = @"ResetAndEstablish";
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext establishStatePathDictionary](self, "establishStatePathDictionary"));
  id v33 = v24;
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
  v35 = v25;
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
  unsigned __int8 v37 = v26;
  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v27));

  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));

  id v31 =  [v29 doWatchedStateMachineRPC:@"rpc-reset-and-establish" sourceStates:v30 path:v28 reply:v17];
}

- (void)rpcLeaveClique:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  unsigned int v6 = [v5 isPaused];

  if (!v6) {
    goto LABEL_6;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonNotInCliqueStates](&OBJC_CLASS___OTStates, "OctagonNotInCliqueStates"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentState]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v9));
  unsigned int v11 = [v7 intersectsSet:v10];

  if (v11)
  {
    id v12 = sub_10001267C("octagon-leave-clique");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "device is not in clique to begin with - returning",  v19,  2u);
    }

    v4[2](v4, 0LL);
  }

  else
  {
LABEL_6:
    id v14 = objc_alloc(&OBJC_CLASS___OTLeaveCliqueOperation);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    uint64_t v16 = -[OTLeaveCliqueOperation initWithDependencies:intendedState:errorState:]( v14,  "initWithDependencies:intendedState:errorState:",  v15,  @"BecomeUntrusted",  @"CheckTrustState");

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
    [v17 doSimpleStateMachineRPC:@"leave-clique" op:v16 sourceStates:v18 reply:v4];
  }
}

- (void)rpcRemoveFriendsInClique:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTRemovePeersOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  id v12 = -[OTRemovePeersOperation initWithDependencies:intendedState:errorState:peerIDs:]( v8,  "initWithDependencies:intendedState:errorState:peerIDs:",  v9,  @"BecomeReady",  @"BecomeReady",  v7);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v11 doSimpleStateMachineRPC:@"remove-friends" op:v12 sourceStates:v10 reply:v6];
}

- (id)prepareInformation
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  unsigned int v4 = [v3 isMachineIDOverridden];

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 getOverriddenMachineID]);

    id v7 = 0LL;
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v8 flowID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceSessionID]);
    id v31 = 0LL;
    uint64_t v6 = objc_claimAutoreleasedReturnValue( objc_msgSend( v9,  "machineID:flowID:deviceSessionID:canSendMetrics:error:",  v11,  v12,  v13,  -[OTCuttlefishContext canSendMetricsUsingAccountState:]( self,  "canSendMetricsUsingAccountState:",  -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon")),  &v31));
    id v7 = v31;
  }

  v30 = (void *)v6;
  if (!v6 || v7)
  {
    id v14 = sub_10001267C("SecError");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "octagon: Unable to fetch machine ID; expect signin to fail: %@",
        buf,
        0xCu);
    }
  }

  uint64_t v26 = objc_alloc(&OBJC_CLASS___OTDeviceInformation);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v29 modelID]);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 deviceName]);
  v28 = v7;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 serialNumber]);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 osVersion]);
  id v27 = -[OTDeviceInformation initForContainerName:contextID:epoch:machineID:modelID:deviceName:serialNumber:osVersion:]( v26,  "initForContainerName:contextID:epoch:machineID:modelID:deviceName:serialNumber:osVersion:",  v16,  v17,  0LL,  v30,  v18,  v20,  v22,  v24);

  return v27;
}

- (id)operationDependencies
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
  uint64_t v22 = objc_alloc(&OBJC_CLASS___OTOperationDependencies);
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext octagonAdapter](self, "octagonAdapter"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountsAdapter](self, "accountsAdapter"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext personaAdapter](self, "personaAdapter"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  id v5 = -[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass");
  uint64_t v6 = -[OTCuttlefishContext notifierClass](self, "notifierClass");
  v21 = v3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 flowID]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 deviceSessionID]);
  LOBYTE(v3) = -[OTCuttlefishContext canSendMetricsUsingAccountState:]( self,  "canSendMetricsUsingAccountState:",  -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext reachabilityTracker](self, "reachabilityTracker"));
  LOBYTE(v11) = (_BYTE)v3;
  id v23 = -[OTOperationDependencies initForContainer:contextID:activeAccount:stateHolder:flagHandler:sosAdapter:octagonAdapter:accountsAdapter:authKitAdapter:personaAdapter:deviceInfoAdapter:ckksAccountSync:lockStateTracker:cuttlefishXPCWrapper:escrowRequestClass:notifierClass:flowID:deviceSessionID:permittedToSendMetrics:reachabilityTracker:]( v22,  "initForContainer:contextID:activeAccount:stateHolder:flagHandler:sosAdapter:octagonAdapter:accountsAdapter:aut hKitAdapter:personaAdapter:deviceInfoAdapter:ckksAccountSync:lockStateTracker:cuttlefishXPCWrapper:escrowReque stClass:notifierClass:flowID:deviceSessionID:permittedToSendMetrics:reachabilityTracker:",  v27,  v26,  v25,  v20,  v19,  v18,  v24,  v14,  v13,  v17,  v12,  v16,  v15,  v4,  v5,  v6,  v7,  v8,  v11,  v9);

  return v23;
}

- (void)startOctagonStateMachine
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v2 startOperation];
}

- (void)handlePairingRestart:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext pairingUUID](self, "pairingUUID"));

  if (!v5)
  {
    uint64_t v6 = sub_10001267C("octagon-pairing");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 pairingUUID]);
      *(_DWORD *)buf = 138412290;
      uint64_t v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "received new pairing UUID (%@)", buf, 0xCu);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 pairingUUID]);
    -[OTCuttlefishContext setPairingUUID:](self, "setPairingUUID:", v9);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext pairingUUID](self, "pairingUUID"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 pairingUUID]);
  unsigned __int8 v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
    id v13 = sub_10001267C("octagon-pairing");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext pairingUUID](self, "pairingUUID"));
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v4 pairingUUID]);
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = v15;
      __int16 v27 = 2112;
      v28 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "current pairing UUID (%@) does not match config UUID (%@)",  buf,  0x16u);
    }

    dispatch_semaphore_t v17 = dispatch_semaphore_create(0LL);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000C7E10;
    v22[3] = &unk_100285038;
    v22[4] = self;
    id v23 = v4;
    id v18 = v17;
    v24 = v18;
    -[OTCuttlefishContext localReset:](self, "localReset:", v22);
    dispatch_time_t v19 = dispatch_time(0LL, 10000000000LL);
    if (dispatch_semaphore_wait(v18, v19))
    {
      id v20 = sub_10001267C("SecError");
      v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "octagon: Timed out waiting for local reset to complete",  buf,  2u);
      }
    }
  }
}

- (void)clearPairingUUID
{
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
  dispatch_assert_queue_V2(v11);

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
  [v12 addEvent:v8];

  if ([v9 _onqueueContains:@"apple_account_signed_out"])
  {
    [v9 _onqueueRemoveFlag:@"apple_account_signed_out"];
    id v13 = sub_10001267C("octagon");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "handling apple account signed out flag",  buf,  2u);
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext appleAccountSignOutOperation](self, "appleAccountSignOutOperation"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"Initializing"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext initializingOperation](self, "initializingOperation"));
LABEL_7:
    uint64_t v16 = (OTPrepareOperation *)v15;
    goto LABEL_8;
  }

  if ([v8 isEqualToString:@"WaitForCDPCapableSecurityLevel"])
  {
    if ([v9 _onqueueContains:@"idms_level"])
    {
      [v9 _onqueueRemoveFlag:@"idms_level"];
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"cdp-capable-check",  @"DetermineiCloudAccountState"));
      goto LABEL_7;
    }

    id v23 = sub_10001267C("octagon");
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting for an CDP Capable account", buf, 2u);
    }

LABEL_31:
    uint64_t v16 = 0LL;
    goto LABEL_8;
  }

  if ([v8 isEqualToString:@"WaitingForCloudKitAccount"])
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
    if (v18)
    {
      dispatch_time_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
      id v20 = [v19 accountStatus];

      if (v20 == (id)1)
      {
        v21 = sub_10001267C("octagon");
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "CloudKit reports an account is available!",  buf,  2u);
        }

        uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"ck-available",  @"CloudKitNewlyAvailable"));
        goto LABEL_7;
      }
    }

    uint64_t v25 = sub_10001267C("octagon");
    uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v27 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
      v28 = (void *)v27;
      id v29 = @"uninitialized";
      if (v27) {
        id v29 = (const __CFString *)v27;
      }
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v29;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Waiting for a CloudKit account; current state is %@",
        buf,
        0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountInfo](self, "cloudKitAccountInfo"));
    BOOL v31 = v30 == 0LL;

    if (v31)
    {
      unsigned __int8 v32 = sub_10001267C("octagon");
      id v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "Asking for a real CK account state",  buf,  2u);
      }

      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountStateTracker](self, "accountStateTracker"));
      [v34 recheckCKAccountStatus];
    }

    goto LABEL_31;
  }

  if ([v8 isEqualToString:@"CloudKitNewlyAvailable"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext cloudKitAccountNewlyAvailableOperation:]( self,  "cloudKitAccountNewlyAvailableOperation:",  @"DetermineCDPState"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"DetermineCDPState"])
  {
    v35 = objc_alloc(&OBJC_CLASS___OTDetermineCDPBitStatusOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    unsigned __int8 v37 = @"CheckForAccountFixups";
LABEL_34:
    v38 = @"WaitForCDP";
LABEL_35:
    v39 = v35;
    unsigned int v40 = v36;
LABEL_36:
    v41 = (OTUpdateTPHOperation *)[v39 initWithDependencies:v40 intendedState:v37 errorState:v38];
LABEL_37:
    uint64_t v16 = (OTPrepareOperation *)v41;
LABEL_38:

    goto LABEL_8;
  }

  if ([v8 isEqualToString:@"WaitForCDP"])
  {
    if ([v9 _onqueueContains:@"cdp_enabled"])
    {
      [v9 _onqueueRemoveFlag:@"cdp_enabled"];
      v42 = sub_10001267C("octagon");
      v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "CDP is newly available!", buf, 2u);
      }

      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"cdp_enabled",  @"DetermineiCloudAccountState"));
      goto LABEL_7;
    }

    if ([v9 _onqueueContains:@"recd_push"])
    {
      [v9 _onqueueRemoveFlag:@"recd_push"];
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"cdp_enabled_push_received",  @"WaitForCDPUpdated"));
      goto LABEL_7;
    }

    if ([v9 _onqueueContains:@"pending_network_availablility"])
    {
      [v9 _onqueueRemoveFlag:@"pending_network_availablility"];
      uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"check_cdp_status_upon_network_availability",  @"WaitForCDPUpdated"));
      goto LABEL_7;
    }

    goto LABEL_31;
  }

  if ([v8 isEqualToString:@"WaitForCDPUpdated"])
  {
    id v44 = objc_alloc(&OBJC_CLASS___OTUpdateTPHOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v41 = -[OTUpdateTPHOperation initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:]( v44,  "initWithDependencies:intendedState:peerUnknownState:determineCDPState:errorState:forceRefetch:retryFlag:",  v36,  @"DetermineCDPState",  0LL,  @"DetermineCDPState",  @"DetermineCDPState",  0LL,  @"recd_push");
    goto LABEL_37;
  }

  if ([v8 isEqualToString:@"CheckForAccountFixups"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext checkForAccountFixupsOperation:]( self,  "checkForAccountFixupsOperation:",  @"PerformAccountFixups"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"PerformAccountFixups"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"fixups-complete",  @"CheckTrustState"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"CheckTrustState"])
  {
    id v45 = objc_alloc(&OBJC_CLASS___OctagonCheckTrustStateOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    unsigned __int8 v37 = @"BecomeUntrusted";
    v39 = v45;
    unsigned int v40 = v36;
    v38 = @"BecomeUntrusted";
    goto LABEL_36;
  }

  if ([v8 isEqualToString:@"CDPHealthCheck"])
  {
    v35 = objc_alloc(&OBJC_CLASS___OTDetermineCDPBitStatusOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    unsigned __int8 v37 = @"SecurityTrustCheck";
    goto LABEL_34;
  }

  if ([v8 isEqualToString:@"SecurityTrustCheck"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext evaluateSecdOctagonTrust](self, "evaluateSecdOctagonTrust"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"TPHTrustCheck"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext evaluateTPHOctagonTrust](self, "evaluateTPHOctagonTrust"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"CuttlefishTrustCheck"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishTrustEvaluation](self, "cuttlefishTrustEvaluation"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"PostRepairCFU"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext postRepairCFUAndBecomeUntrusted](self, "postRepairCFUAndBecomeUntrusted"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"HealthCheckReset"])
  {
    self->_int64_t resetReason = 2LL;
    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"begin-reset",  @"ResetBecomeUntrusted"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"BecomeUntrusted"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext becomeUntrustedOperation:](self, "becomeUntrustedOperation:", @"Untrusted"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"BecomeReady"])
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext becomeReadyOperation](self, "becomeReadyOperation"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"RefetchCKKSPolicy"])
  {
    v35 = objc_alloc(&OBJC_CLASS___OTFetchViewsOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    unsigned __int8 v37 = @"BecomeReady";
    v38 = @"Error";
    goto LABEL_35;
  }

  if ([v8 isEqualToString:@"EnableUserControllableViews"])
  {
    id v46 = objc_alloc(&OBJC_CLASS___OTModifyUserControllableViewStatusOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v47 = v46;
    v48 = v36;
    uint64_t v49 = 2LL;
LABEL_80:
    v41 = -[OTModifyUserControllableViewStatusOperation initWithDependencies:intendedViewStatus:intendedState:peerMissingState:errorState:]( v47,  "initWithDependencies:intendedViewStatus:intendedState:peerMissingState:errorState:",  v48,  v49,  @"BecomeReady",  @"ReadyUpdated",  @"BecomeReady");
    goto LABEL_37;
  }

  if ([v8 isEqualToString:@"DisableUserControllableViews"])
  {
    v50 = objc_alloc(&OBJC_CLASS___OTModifyUserControllableViewStatusOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v47 = v50;
    v48 = v36;
    uint64_t v49 = 1LL;
    goto LABEL_80;
  }

  if ([v8 isEqualToString:@"SetUserControllableViewsToPeerConsensus"])
  {
    id v51 = objc_alloc(&OBJC_CLASS___OTModifyUserControllableViewStatusOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    v47 = v51;
    v48 = v36;
    uint64_t v49 = 3LL;
    goto LABEL_80;
  }

  if ([v8 isEqualToString:@"SetAccountSettings"])
  {
    v52 = objc_alloc(&OBJC_CLASS___OTSetAccountSettingsOperation);
    id v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    id v53 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    uint64_t v16 = -[OTSetAccountSettingsOperation initWithDependencies:intendedState:errorState:settings:]( v52,  "initWithDependencies:intendedState:errorState:settings:",  v36,  @"BecomeReady",  @"CheckTrustState",  v53);

    goto LABEL_38;
  }

  if ([v8 isEqualToString:@"NoAccount"]
    && [v9 _onqueueContains:@"account_available"])
  {
    [v9 _onqueueRemoveFlag:@"account_available"];
    v54 = sub_10001267C("octagon");
    id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "Account is available!  Attempting initializing op!",  buf,  2u);
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"account-probably-present",  @"Initializing"));
    goto LABEL_7;
  }

  if ([v8 isEqualToString:@"Untrusted"])
  {
    if ([v9 _onqueueContains:@"preapproved"])
    {
      [v9 _onqueueRemoveFlag:@"preapproved"];
      id v56 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
      unsigned int v57 = [v56 sosEnabled];

      id v58 = sub_10001267C("octagon");
      __int16 v59 = (os_log_s *)objc_claimAutoreleasedReturnValue(v58);
      BOOL v60 = os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT);
      if (v57)
      {
        if (v60)
        {
          *(_WORD *)buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Preapproved flag is high. Attempt SOS upgrade again!",  buf,  2u);
        }

        uint64_t v15 = objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:entering:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:entering:",  @"ck-available",  @"AttemptSOSUpgrade"));
        goto LABEL_7;
      }

      if (v60)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "We are untrusted, but it seems someone preapproves us now. Unfortunately, this platform doesn't support SOS.",  buf,  2u);
      }
    }

    if ([v9 _onqueueContains:@"attempt_sos_upgrade"])
    {
      [v9 _onqueueRemoveFlag:@"attempt_sos_upgrade"];
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
      unsigned int v62 = [v61 sosEnabled];

      v63 = sub_10001267C("octagon");
      v64 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
      BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
      if (v62)
      {
        if (v65)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Attempt SOS upgrade again!", buf, 2u);
        }

- (void)setMetricsStateToActive
{
  v3 = sub_10001267C("octagon-metrics");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Metrics now switching to ON", v9, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 operationDependencies]);
  [v6 setSendMetric:1];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneChangeFetcher]);
  [v8 setSendMetric:1];

  -[OTCuttlefishContext setShouldSendMetricsForOctagon:](self, "setShouldSendMetricsForOctagon:", 1LL);
}

- (void)setMetricsStateToInactive
{
  v3 = sub_10001267C("octagon-metrics");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Metrics now switching to OFF", v9, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 operationDependencies]);
  [v6 setSendMetric:0];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 zoneChangeFetcher]);
  [v8 setSendMetric:0];

  -[OTCuttlefishContext setShouldSendMetricsForOctagon:](self, "setShouldSendMetricsForOctagon:", 2LL);
}

- (void)setMetricsToState:(int)a3
{
  if (a3 == 2) {
    -[OTCuttlefishContext setMetricsStateToInactive](self, "setMetricsStateToInactive");
  }
  else {
    -[OTCuttlefishContext setMetricsStateToActive](self, "setMetricsStateToActive");
  }
}

- (id)initializingOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C7258;
  v4[3] = &unk_100291A88;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-initializing",  @"NoAccount",  @"Error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)appleAccountSignOutOperation
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C6FF4;
  v3[3] = &unk_1002850A8;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-account-gone",  @"NoAccountDoReset",  @"NoAccountDoReset",  v3));
}

- (id)checkForAccountFixupsOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000C6E48;
  v8[3] = &unk_1002904F0;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-fixup_check",  v5,  @"Error",  v8));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)evaluateSecdOctagonTrust
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C6C54;
  v3[3] = &unk_1002850A8;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-health-securityd-trust-check",  @"TPHTrustCheck",  @"PostRepairCFU",  v3));
}

- (id)evaluateTPHOctagonTrust
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C698C;
  v3[3] = &unk_1002850A8;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-health-tph-trust-check",  @"CuttlefishTrustCheck",  @"PostRepairCFU",  v3));
}

- (id)cuttlefishTrustEvaluation
{
  v3 = objc_alloc(&OBJC_CLASS___OTCheckHealthOperation);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
  LOBYTE(v12) = self->_repair;
  uint64_t v6 = -[OTCheckHealthOperation initWithDependencies:intendedState:errorState:deviceInfo:skipRateLimitedCheck:reportRateLimitingError:repair:]( v3,  "initWithDependencies:intendedState:errorState:deviceInfo:skipRateLimitedCheck:reportRateLimitingError:repair:",  v4,  @"BecomeReady",  @"BecomeReady",  v5,  self->_skipRateLimitingCheck,  self->_reportRateLimitingError,  v12);

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1000C6140;
  v13[3] = &unk_100290FC8;
  objc_copyWeak(&v15, &location);
  id v7 = v6;
  id v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"rpcHealthCheck",  v13));
  [v8 addDependency:v7];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v9 addOperation:v8];

  id v10 = v7;
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  return v10;
}

- (id)postRepairCFUAndBecomeUntrusted
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1000C5F1C;
  v3[3] = &unk_1002850A8;
  v3[4] = self;
  return (id)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-health-post-repair-cfu",  @"Untrusted",  @"Error",  v3));
}

- (id)cloudKitAccountNewlyAvailableOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C5A84;
  v7[3] = &unk_100291A88;
  objc_copyWeak(&v8, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-icloud-account-available",  v4,  @"Error",  v7));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)repairAccountIfTrustedByTPHWithIntendedState:(id)a3
{
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  id v18 = sub_1000BFAF8;
  dispatch_time_t v19 = sub_1000BFB08;
  id v4 = a3;
  id v20 = v4;
  id v5 = sub_10001267C("octagon-health");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "repairAccountIfTrustedByTPHWithIntendedState: calling into TPH for trust status",  buf,  2u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C563C;
  v11[3] = &unk_100285170;
  id v13 = &v15;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  -[OTCuttlefishContext rpcTrustStatus:reply:](self, "rpcTrustStatus:reply:", v7, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)checkForPhonePeerPresence:(id)a3
{
  id v3 = a3;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys", 0));
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    while (2)
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        unsigned __int8 v10 = [v9 hasPrefix:@"iPhone"];
        unsigned int v11 = [v9 hasPrefix:@"iPad"];
        if ((v10 & 1) != 0 || v11)
        {
          id v12 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v9]);
          int v13 = [v12 intValue];

          if (v13 >= 1)
          {
            uint64_t v15 = sub_10001267C("octagon");
            uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109378;
              int v23 = v13;
              __int16 v24 = 2112;
              uint64_t v25 = v9;
              _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Have %d peers with model %@",  buf,  0x12u);
            }

            BOOL v14 = 1;
            goto LABEL_15;
          }
        }
      }

      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  BOOL v14 = 0;
LABEL_15:

  return v14;
}

- (void)checkTrustStatusAndPostRepairCFUIfNecessary:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v5 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C4E84;
  v7[3] = &unk_100285198;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  -[OTCuttlefishContext rpcTrustStatus:reply:](self, "rpcTrustStatus:reply:", v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)becomeUntrustedOperation:(id)a3
{
  id v4 = a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C486C;
  v7[3] = &unk_100291A88;
  objc_copyWeak(&v8, &location);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-become-untrusted",  v4,  @"Error",  v7));
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)becomeInheritedOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C413C;
  v4[3] = &unk_100291A88;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-inherited",  @"Inherited",  @"Error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)becomeReadyOperation
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000C37AC;
  v4[3] = &unk_100291A88;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___OctagonStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"octagon-ready",  @"Ready",  @"Error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)extractStringKey:(id)a3 fromDictionary:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKeyedSubscript:a3]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    id v6 = v4;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)handleTTRRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"s",  v4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"D",  v4));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"a",  v4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"d",  v4));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"R",  v4));
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"n",  v4));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"v",  v4));
  uint64_t v33 = objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"I",  v4));
  if (v5)
  {
    BOOL v31 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
    id v32 = v4;
    int v13 = v10;
    BOOL v14 = v9;
    uint64_t v15 = v8;
    uint64_t v16 = v7;
    uint64_t v17 = v6;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v12 serialNumber]);
    unsigned __int8 v19 = [v18 isEqualToString:v5];

    id v6 = v17;
    uint64_t v7 = v16;
    id v8 = v15;
    id v9 = v14;
    unsigned __int8 v10 = v13;
    id v4 = v32;

    unsigned int v11 = v31;
    if ((v19 & 1) == 0)
    {
      uint64_t v25 = sub_10001267C("octagon");
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "TTR request not for me (sn)", buf, 2u);
      }

      goto LABEL_21;
    }
  }

  if (!v6) {
    goto LABEL_7;
  }
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountStateTracker](self, "accountStateTracker"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 ckdeviceID]);

  if (!v5 || ([v21 isEqualToString:v5] & 1) == 0)
  {
    uint64_t v27 = v11;
    v28 = sub_10001267C("octagon");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "TTR request not for me (deviceId)", buf, 2u);
    }

    unsigned int v11 = v27;
LABEL_21:
    __int16 v24 = (void *)v33;
    goto LABEL_25;
  }

LABEL_7:
  if (v7 && v8 && v9)
  {
    id v22 = [[SecTapToRadar alloc] initTapToRadar:v7 description:v8 radar:v9];
    int v23 = v22;
    __int16 v24 = (void *)v33;
    if (v10 && v11 && v33)
    {
      [v22 setComponentName:v10];
      [v23 setComponentVersion:v11];
      [v23 setComponentID:v33];
    }

    [v23 trigger];
  }

  else
  {
    v30 = sub_10001267C("SecError");
    int v23 = (void *)objc_claimAutoreleasedReturnValue(v30);
    __int16 v24 = (void *)v33;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  OS_LOG_TYPE_DEFAULT,  "octagon: invalid type of TTR requeat: %@",  buf,  0xCu);
    }
  }

LABEL_25:
}

- (void)notifyContainerChange:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  -[OTCuttlefishContext notifyContainerChangeWithUserInfo:](self, "notifyContainerChangeWithUserInfo:", v4);
}

- (void)notifyContainerChangeWithUserInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10001267C("octagonpush");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&_BYTE buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "received a cuttlefish push notification (%@): %@",  buf,  0x16u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"cf"]);
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0
    && (unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext extractStringKey:fromDictionary:]( self,  "extractStringKey:fromDictionary:",  @"k",  v8)),  (v11 = v10) != 0LL))
  {
    if ([v10 isEqualToString:@"r"])
    {
      -[OTCuttlefishContext handleTTRRequest:](self, "handleTTRRequest:", v8);
    }

    else
    {
      __int128 v20 = sub_10001267C("SecError");
      __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "octagon: unknown command: %@", buf, 0xCu);
      }
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext apsRateLimiter](self, "apsRateLimiter"));
    BOOL v13 = v12 == 0LL;

    if (v13)
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 modelID]);
      unsigned __int8 v16 = +[OTDeviceInformation isFullPeer:](&OBJC_CLASS___OTDeviceInformation, "isFullPeer:", v15);

      uint64_t v17 = 2000000000LL;
      uint64_t v18 = 2000000000LL;
      if ((v16 & 1) == 0)
      {
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&uint8_t buf[16] = 0x3032000000LL;
        id v45 = sub_1000BFAF8;
        id v46 = sub_1000BFB08;
        id v47 = 0LL;
        uint64_t v36 = 0LL;
        unsigned __int8 v37 = &v36;
        uint64_t v38 = 0x3032000000LL;
        v39 = sub_1000BFAF8;
        unsigned int v40 = sub_1000BFB08;
        id v41 = 0LL;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472LL;
        v35[2] = sub_1000C3560;
        v35[3] = &unk_100285208;
        v35[4] = buf;
        v35[5] = &v36;
        -[OTCuttlefishContext rpcFetchTotalCountOfTrustedPeers:](self, "rpcFetchTotalCountOfTrustedPeers:", v35);
        else {
          unsigned int v19 = 3 * [v22 unsignedIntValue];
        }
        int v23 = sub_10001267C("octagon");
        __int16 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v42 = 67109120;
          unsigned int v43 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "max splay window seconds for limiter %d",  v42,  8u);
        }

        uint32_t v25 = arc4random_uniform(1000 * v19);
        _Block_object_dispose(&v36, 8);

        _Block_object_dispose(buf, 8);
        uint64_t v18 = 1000000LL * v25 + 2000000000;
      }

      uint64_t v26 = sub_10001267C("octagon");
      uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "creating aps rate limiter with min initial delay of %llu",  buf,  0xCu);
      }

      if (qword_1002DE960 != -1) {
        dispatch_once(&qword_1002DE960, &stru_1002849E8);
      }
      int v28 = byte_1002DE968;
      int v29 = byte_1002DE968;
      *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v30 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
      if (!v29) {
        uint64_t v17 = 30000000000LL;
      }
      if (v28) {
        uint64_t v31 = 200000000LL;
      }
      else {
        uint64_t v31 = v18;
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_1000C3698;
      v33[3] = &unk_100291A38;
      objc_copyWeak(&v34, (id *)buf);
      id v32 = -[CKKSNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v30,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"aps-push-ratelimiter",  v31,  v17,  1LL,  0LL,  v33);
      -[OTCuttlefishContext setApsRateLimiter:](self, "setApsRateLimiter:", v32);

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext apsRateLimiter](self, "apsRateLimiter"));
    [v11 trigger];
  }
}

- (BOOL)waitForReady:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 waitForState:@"Ready" wait:a3]);

  LOBYTE(v4) = [v5 isEqualToString:@"Ready"];
  return (char)v4;
}

- (void)popTooManyPeersDialogWithEgoPeerStatus:(id)a3 accountMeta:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  unsigned int v9 = [v8 shouldPopDialog];

  if (v9)
  {
    if ([v7 warnedTooManyPeers])
    {
      unsigned __int8 v10 = sub_10001267C("octagon");
      id v11 = (id)objc_claimAutoreleasedReturnValue(v10);
      if (!os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_28:

        goto LABEL_29;
      }

      id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
      *(_DWORD *)buf = 138412290;
      unint64_t v43 = (unint64_t)v12;
      BOOL v13 = "popdialog: Already checked this altDSID: %@";
      BOOL v14 = (os_log_s *)v11;
      uint32_t v15 = 12;
      goto LABEL_25;
    }

    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    id v40 = 0LL;
    [v16 persistAccountChanges:&stru_100285228 error:&v40];
    id v11 = v40;

    if (v11)
    {
      uint64_t v17 = sub_10001267C("SecError");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
        *(_DWORD *)buf = 138412546;
        unint64_t v43 = (unint64_t)v19;
        __int16 v44 = 2112;
        id v45 = v11;
        __int128 v20 = "octagon: popdialog: Failed to persist warned-too-many-peers state for %@: %@";
        __int128 v21 = v18;
        uint32_t v22 = 22;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
      }
    }

    else
    {
      int v23 = sub_10001267C("octagon");
      uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v7 altDSID]);
        *(_DWORD *)buf = 138412290;
        unint64_t v43 = (unint64_t)v19;
        __int128 v20 = "popdialog: Successfully persisted warned-too-many-peers state for %@";
        __int128 v21 = v18;
        uint32_t v22 = 12;
        goto LABEL_10;
      }
    }

    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerCountsByMachineID", 0));
    uint32_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 allValues]);

    id v26 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v26)
    {
      id v27 = v26;
      unint64_t v28 = 0LL;
      uint64_t v29 = *(void *)v37;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v25);
          }
          v28 += (unint64_t)[*(id *)(*((void *)&v36 + 1) + 8 * (void)i) longValue];
        }

        id v27 = [v25 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }

      while (v27);
    }

    else
    {
      unint64_t v28 = 0LL;
    }

    uint64_t v31 = sub_10001267C("octagon");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v43 = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "popdialog: ego peer status says peer count is: %lu",  buf,  0xCu);
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tooManyPeersAdapter](self, "tooManyPeersAdapter"));
    id v34 = [v33 getLimit];

    if (v28 >= (unint64_t)v34)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext tooManyPeersAdapter](self, "tooManyPeersAdapter"));
      [v12 popDialogWithCount:v28 limit:v34];
      goto LABEL_27;
    }

    id v35 = sub_10001267C("octagon");
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if (!os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
LABEL_27:

      goto LABEL_28;
    }

    *(_DWORD *)buf = 134218240;
    unint64_t v43 = v28;
    __int16 v44 = 2048;
    id v45 = v34;
    BOOL v13 = "popdialog: not popping dialog, number of peers ok: %lu < %lu";
    BOOL v14 = (os_log_s *)v12;
    uint32_t v15 = 22;
LABEL_25:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_27;
  }

- (void)setMachineIDOverride:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
  [v5 setOverriddenMachineID:v4];
}

- (int)currentMemoizedTrustState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 loadOrCreateAccountMetadata:&v9]);
  id v4 = v9;

  if (v3)
  {
    int v5 = [v3 trustState];
  }

  else
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch account metadata: %@",  buf,  0xCu);
    }

    int v5 = 0;
  }

  return v5;
}

- (int)currentMemoizedAccountState
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 loadOrCreateAccountMetadata:&v9]);
  id v4 = v9;

  if (v3)
  {
    int v5 = [v3 icloudAccountState];
  }

  else
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch account metadata: %@",  buf,  0xCu);
    }

    int v5 = 0;
  }

  return v5;
}

- (id)currentMemoizedLastHealthCheck
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v9 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 loadOrCreateAccountMetadata:&v9]);
  id v4 = v9;

  if (!v3)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to fetch account metadata: %@",  buf,  0xCu);
    }

    goto LABEL_7;
  }

  if (![v3 lastHealthCheckup])
  {
LABEL_7:
    int v5 = 0LL;
    goto LABEL_8;
  }

  int v5 = -[NSDate initWithTimeIntervalSince1970:]( [NSDate alloc],  "initWithTimeIntervalSince1970:",  (double)(unint64_t)[v3 lastHealthCheckup] / 1000.0);
LABEL_8:

  return v5;
}

- (void)requestTrustedDeviceListRefresh
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v2 handleFlag:@"attempt_machine_id_list"];
}

- (void)deviceNameUpdated
{
  id v3 = sub_10001267C("octagon-devicename");
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "device name updated: %@", (uint8_t *)&v8, 0xCu);
  }

  id v6 = -[OctagonPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___OctagonPendingFlag),  "initWithFlag:conditions:",  @"recd_push",  1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  [v7 handlePendingFlag:v6];
}

- (void)trustedPeerSetChanged:(id)a3
{
  id v4 = a3;
  int v5 = sub_10001267C("octagon-sos");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received an update of an SOS trust set change",  buf,  2u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  unsigned __int8 v8 = [v7 sosEnabled];

  if ((v8 & 1) == 0)
  {
    id v9 = sub_10001267C("octagon-sos");
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "This platform doesn't support SOS. This is probably a bug?",  buf,  2u);
    }
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosConsistencyRateLimiter](self, "sosConsistencyRateLimiter"));

  if (!v11)
  {
    id v12 = sub_10001267C("octagon");
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "creating SOS consistency rate limiter",  buf,  2u);
    }

    if (qword_1002DE960 != -1) {
      dispatch_once(&qword_1002DE960, &stru_1002849E8);
    }
    int v14 = byte_1002DE968;
    int v15 = byte_1002DE968;
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000C34E8;
    v22[3] = &unk_100291A38;
    objc_copyWeak(&v23, (id *)buf);
    unsigned __int8 v16 = objc_retainBlock(v22);
    uint64_t v17 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    if (v15) {
      uint64_t v18 = 10000000000LL;
    }
    else {
      uint64_t v18 = 30000000000LL;
    }
    if (v14) {
      uint64_t v19 = 200000000LL;
    }
    else {
      uint64_t v19 = 2000000000LL;
    }
    __int128 v20 = -[CKKSNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v17,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"sos-consistency-ratelimiter",  v19,  v18,  0LL,  1000LL,  v16,  2.0);
    -[OTCuttlefishContext setSosConsistencyRateLimiter:](self, "setSosConsistencyRateLimiter:", v20);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosConsistencyRateLimiter](self, "sosConsistencyRateLimiter"));
  [v21 trigger];
}

- (int64_t)checkForCKAccount:(id)a3
{
  id v4 = a3;
  if ([v4 timeoutWaitForCKAccount])
  {
    unint64_t v5 = (unint64_t)[v4 timeoutWaitForCKAccount];
    if (v5 < 2)
    {
      uint64_t v6 = 0LL;
      goto LABEL_10;
    }

    uint64_t v6 = v5 >> 1;
  }

  else
  {
    uint64_t v6 = 45000000000LL;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cloudKitAccountStateKnown](self, "cloudKitAccountStateKnown"));
  id v8 = [v7 wait:v6];

  if (v8)
  {
    id v9 = sub_10001267C("octagon-ck");
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to determine CloudKit account state?",  buf,  2u);
    }
  }

- (id)errorIfNoCKAccount:(id)a3
{
  int64_t v3 = -[OTCuttlefishContext checkForCKAccount:](self, "checkForCKAccount:", a3);
  if (v3 == 3)
  {
    id v4 = @"User is not signed into iCloud.";
    uint64_t v5 = 25LL;
  }

  else
  {
    if (v3)
    {
      uint64_t v6 = 0LL;
      return v6;
    }

    id v4 = @"Cannot determine iCloud Account state; try again later";
    uint64_t v5 = 56LL;
  }

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  v5,  v4));
  return v6;
}

- (void)rpcEpoch:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  uint64_t v6 = sub_10001267C("rpc-epoch");
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Fetching epoch", buf, 2u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    if (v9)
    {
      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
      [v10 recheck];
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C3290;
    v13[3] = &unk_100285250;
    int v14 = v4;
    [v11 fetchEgoEpochWithSpecificUser:v12 reply:v13];
  }
}

- (void)rpcVoucherWithConfiguration:(id)a3 permanentInfo:(id)a4 permanentInfoSig:(id)a5 stableInfo:(id)a6 stableInfoSig:(id)a7 reply:(id)a8
{
  id v44 = a3;
  id v45 = a4;
  id v46 = a5;
  id v47 = a6;
  id v48 = a7;
  id v49 = a8;
  int v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  int v15 = sub_10001267C("rpc-vouch");
  unsigned __int8 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void *))v49 + 2))(v49, 0LL, 0LL, v14);
  }

  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Creating voucher", buf, 2u);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    if (v18)
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
      [v19 recheck];
    }

    __int128 v20 = objc_alloc(&OBJC_CLASS___OTUpdateTrustedDeviceListOperation);
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    unint64_t v43 = -[OTUpdateTrustedDeviceListOperation initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:]( v20,  "initWithDependencies:intendedState:listUpdatesState:errorState:retryFlag:",  v21,  @"BecomeReady",  @"BecomeReady",  @"BecomeReady",  0LL);

    uint32_t v22 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionRequest);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
    __int16 v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    id v42 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:]( v22,  "init:sourceStates:serialQueue:transitionOp:",  @"updateTDL",  v23,  v24,  v43);

    uint32_t v25 = objc_alloc(&OBJC_CLASS___OTPairingVoucherOperation);
    int64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    unint64_t v28 = -[OTPairingVoucherOperation initWithDependencies:intendedState:errorState:deviceInfo:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:]( v25,  "initWithDependencies:intendedState:errorState:deviceInfo:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:",  v26,  @"BecomeReady",  @"BecomeReady",  v27,  v44,  v45,  v46,  v47,  v48);

    uint64_t v29 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionRequest);
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    id v32 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:]( v29,  "init:sourceStates:serialQueue:transitionOp:",  @"rpcVoucher",  v30,  v31,  v28);

    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472LL;
    v56[2] = sub_1000C2FD4;
    v56[3] = &unk_100291608;
    char v33 = v28;
    unsigned int v57 = v33;
    id v34 = v49;
    id v58 = v34;
    id v35 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"rpcVoucher-callback",  v56));
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_1000C3130;
    v50[3] = &unk_100285278;
    objc_copyWeak(&v55, (id *)buf);
    uint64_t v36 = v43;
    id v51 = v36;
    id v54 = v34;
    id v37 = v35;
    id v52 = v37;
    id v38 = v32;
    id v53 = v38;
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"updateTDL-callback",  v50));
    [v39 addDependency:v36];
    __int16 v40 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    [v40 addOperation:v39];

    -[CKKSGroupOperation addDependency:](v33, "addDependency:", v39);
    [v37 addDependency:v33];
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    [v41 handleExternalRequest:v42 startTimeout:120000000000];

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);
  }
}

- (void)rpcPrepareIdentityAsApplicantWithConfiguration:(id)a3 epoch:(unint64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v10)
  {
    id v11 = sub_10001267C("octagon");
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void, void, void, void *))v9 + 2))( v9,  0LL,  0LL,  0LL,  0LL,  0LL,  v10);
  }

  else
  {
    BOOL v13 = sub_10001267C("otrpc");
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Preparing identity as applicant", buf, 2u);
    }

    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    if (v15)
    {
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
      [v16 recheck];
    }

    BOOL v17 = objc_alloc(&OBJC_CLASS___OTPrepareOperation);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext prepareInformation](self, "prepareInformation"));
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext policyOverride](self, "policyOverride"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
    uint32_t v22 = -[OTPrepareOperation initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:]( v17,  "initWithDependencies:intendedState:errorState:deviceInfo:policyOverride:accountSettings:epoch:",  v18,  @"InitiatorAwaitingVoucher",  @"BecomeUntrusted",  v19,  v20,  v21,  a4);

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
    if ([v23 isWatch])
    {
      unsigned int v24 = 1;
    }

    else
    {
      uint32_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
      if ([v25 isAppleTV])
      {
        unsigned int v24 = 1;
      }

      else
      {
        int64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext deviceAdapter](self, "deviceAdapter"));
        unsigned int v24 = [v26 isHomePod];
      }
    }

    if ([v8 timeout])
    {
      uint64_t v27 = (uint64_t)[v8 timeout];
    }

    else if (v24)
    {
      uint64_t v27 = 240000000000LL;
    }

    else
    {
      uint64_t v27 = 120000000000LL;
    }

    unint64_t v28 = objc_alloc(&OBJC_CLASS___OctagonStateTransitionRequest);
    v40[0] = @"Untrusted";
    v40[1] = @"WaitForCDP";
    v40[2] = @"WaitingForCloudKitAccount";
    v40[3] = @"DetermineiCloudAccountState";
    v40[4] = @"NoAccount";
    v40[5] = @"not_started";
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 6LL));
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v29));
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext queue](self, "queue"));
    id v32 = -[OctagonStateTransitionRequest init:sourceStates:serialQueue:transitionOp:]( v28,  "init:sourceStates:serialQueue:transitionOp:",  @"prepareForApplicant",  v30,  v31,  v22);

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472LL;
    v37[2] = sub_1000C2E44;
    v37[3] = &unk_100291608;
    id v38 = v22;
    id v39 = v9;
    char v33 = v22;
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"rpcPrepare-callback",  v37));
    [v34 addDependency:v33];
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    [v35 addOperation:v34];

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    [v36 handleExternalRequest:v32 startTimeout:v27];
  }
}

- (void)joinWithBottle:(id)a3 entropy:(id)a4 bottleSalt:(id)a5 reply:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  int v14 = (void (**)(id, void *))a6;
  objc_storeStrong((id *)&self->_bottleID, a3);
  objc_storeStrong((id *)&self->_entropy, a4);
  objc_storeStrong((id *)&self->_bottleSalt, a5);
  id v15 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v15));
  if (v16)
  {
    BOOL v17 = sub_10001267C("octagon");
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v14[2](v14, v16);
  }

  else
  {
    uint64_t v31 = @"BottleJoinCreateIdentity";
    uint64_t v29 = @"BottleJoinVouchWithBottle";
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary"));
    uint64_t v30 = v19;
    id v26 = v11;
    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    id v32 = v20;
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    uint32_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v21));

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_1000C2DE4;
    v27[3] = &unk_100285D40;
    v27[4] = self;
    unint64_t v28 = v14;
    id v25 =  [v23 doWatchedStateMachineRPC:@"rpc-join-with-bottle" sourceStates:v24 path:v22 reply:v27];

    id v11 = v26;
  }
}

- (void)joinWithRecoveryKey:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  -[OTCuttlefishContext setRecoveryKey:](self, "setRecoveryKey:", a3);
  id v7 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v7));
  if (v8)
  {
    id v9 = sub_10001267C("octagon");
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }

  else
  {
    uint64_t v23 = @"OctagonStateStashAccountSettingsForRecoveryKey";
    __int128 v21 = @"CreateIdentityForRecoveryKey";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext joinStatePathDictionary]( self,  "joinStatePathDictionary",  @"VouchWithRecoveryKey"));
    __int128 v20 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint32_t v22 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    unsigned int v24 = v13;
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v14));

    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    BOOL v17 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
    id v18 =  [v16 doWatchedStateMachineRPC:@"rpc-join-with-recovery-key" sourceStates:v17 path:v15 reply:v6];
  }
}

- (void)joinWithCustodianRecoveryKey:(id)a3 reply:(id)a4
{
  uint64_t v6 = (void (**)(id, void *))a4;
  -[OTCuttlefishContext setCustodianRecoveryKey:](self, "setCustodianRecoveryKey:", a3);
  id v7 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v7));
  if (v8)
  {
    id v9 = sub_10001267C("octagon");
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }

  else
  {
    __int128 v20 = @"CreateIdentityForCustodianRecoveryKey";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext joinStatePathDictionary]( self,  "joinStatePathDictionary",  @"VouchWithCustodianRecoveryKey"));
    uint64_t v19 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    __int128 v21 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v13));

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
    id v17 =  [v15 doWatchedStateMachineRPC:@"rpc-join-with-custodian-recovery-key" sourceStates:v16 path:v14 reply:v6];
  }
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v8));
  if (v9)
  {
    unsigned __int8 v10 = sub_10001267C("octagon");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 altDSID]);

    if (v13)
    {
      id v14 = v13;
      id v15 = objc_alloc(&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey);
      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 UUIDString]);
      uint64_t v29 = v13;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 recoveryString]);
      uint64_t v19 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:]( v15,  "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:",  v17,  0LL,  0LL,  v18,  v14,  1LL);

      __int128 v20 = objc_alloc(&OBJC_CLASS___OTPreflightVouchWithCustodianRecoveryKeyOperation);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      uint32_t v22 = -[OTPreflightVouchWithCustodianRecoveryKeyOperation initWithDependencies:intendedState:errorState:tphcrk:]( v20,  "initWithDependencies:intendedState:errorState:tphcrk:",  v21,  @"BecomeReady",  @"BecomeReady",  v19);

      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      [v24 doSimpleStateMachineRPC:@"preflight-custodian-recovery-key" op:v22 sourceStates:v23 reply:v7];

      id v13 = v29;
    }

    else
    {
      id v25 = sub_10001267C("authkit");
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        *(_DWORD *)buf = 138412290;
        uint64_t v31 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
      }

      unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
      v7[2](v7, v28);
    }
  }
}

- (void)joinWithInheritanceKey:(id)a3 reply:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  -[OTCuttlefishContext setInheritanceKey:](self, "setInheritanceKey:", a3);
  id v7 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v7));
  if (v8)
  {
    id v9 = sub_10001267C("octagon");
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, v8);
  }

  else
  {
    uint64_t v23 = @"PrepareAndRecoverTLKSharesForInheritancePeer";
    __int128 v21 = @"BecomeInherited";
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPathStep success]( &OBJC_CLASS___OctagonStateTransitionPathStep,  "success",  @"Inherited"));
    __int128 v20 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint32_t v22 = v12;
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    unsigned int v24 = v13;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v14));

    unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonInAccountStates](&OBJC_CLASS___OTStates, "OctagonInAccountStates"));
    id v18 =  [v16 doWatchedStateMachineRPC:@"rpc-join-with-inheritance-key" sourceStates:v17 path:v15 reply:v6];
  }
}

- (void)preflightJoinWithInheritanceKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v8));
  if (v9)
  {
    unsigned __int8 v10 = sub_10001267C("octagon");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, v9);
  }

  else
  {
    id v12 = objc_alloc(&OBJC_CLASS___OTCustodianRecoveryKey);
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 recoveryKeyData]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 base64EncodedStringWithOptions:0]);
    id v31 = 0LL;
    unsigned __int8 v16 = -[OTCustodianRecoveryKey initWithUUID:recoveryString:error:]( v12,  "initWithUUID:recoveryString:error:",  v13,  v15,  &v31);
    id v17 = v31;

    if (v16)
    {
      id v18 = objc_alloc(&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCustodianRecoveryKey uuid](v16, "uuid"));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
      id v30 = v17;
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCustodianRecoveryKey recoveryString](v16, "recoveryString"));
      uint32_t v22 = -[TrustedPeersHelperCustodianRecoveryKey initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:]( v18,  "initWithUUID:encryptionKey:signingKey:recoveryString:salt:kind:",  v20,  0LL,  0LL,  v21,  &stru_100294B48,  2LL);

      uint64_t v23 = objc_alloc(&OBJC_CLASS___OTPreflightVouchWithCustodianRecoveryKeyOperation);
      unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
      id v25 = -[OTPreflightVouchWithCustodianRecoveryKeyOperation initWithDependencies:intendedState:errorState:tphcrk:]( v23,  "initWithDependencies:intendedState:errorState:tphcrk:",  v24,  @"BecomeReady",  @"BecomeReady",  v22);

      id v26 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      [v27 doSimpleStateMachineRPC:@"preflight-inheritance-recovery-key" op:v25 sourceStates:v26 reply:v7];

      id v17 = v30;
    }

    else
    {
      unint64_t v28 = sub_10001267C("SecError");
      uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v17;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "octagon-inheritance: failed to create CRK: %@",  buf,  0xCu);
      }

      v7[2](v7, v17);
    }
  }
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v8)
  {
    id v9 = sub_10001267C("octagon-preflight-rk");
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, 0LL, v8);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);

    if (v12)
    {
      id v13 = v12;
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_1000C2C88;
      v20[3] = &unk_1002852A0;
      __int128 v21 = v7;
      [v14 preflightRecoverOctagonUsingRecoveryKey:v15 recoveryKey:v6 salt:v13 reply:v20];

      unsigned __int8 v16 = v21;
    }

    else
    {
      id v17 = sub_10001267C("octagon-preflight-rk");
      id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        *(_DWORD *)buf = 138412290;
        uint64_t v23 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
      }

      unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
      v7[2](v7, 0LL, v16);
    }
  }
}

- (id)joinStatePathDictionary
{
  __int16 v59 = @"InitiatorSetCDPBit";
  unsigned int v57 = @"InitiatorUpdateDeviceList";
  id v55 = @"InitiatorJoin";
  v53[0] = @"BottlePreloadOctagonKeysInSOS";
  v51[0] = @"JoinSOSAfterCKKSFetch";
  id v49 = @"SetAccountSettings";
  id v47 = @"BecomeReady";
  id v45 = @"Ready";
  unsigned int v24 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v46 = v24;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v46,  &v45,  1LL));
  id v48 = v23;
  uint32_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
  v50 = v22;
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v50,  &v49,  1LL));
  v51[1] = @"SetAccountSettings";
  v52[0] = v21;
  unint64_t v43 = @"BecomeReady";
  id v41 = @"Ready";
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v42 = v20;
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v42,  &v41,  1LL));
  id v44 = v19;
  id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v44,  &v43,  1LL));
  v52[1] = v18;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));
  v53[1] = @"InitiatorJoinCKKSReset";
  v54[0] = v17;
  id v39 = @"InitiatorJoinAfterCKKSReset";
  id v37 = @"BottlePreloadOctagonKeysInSOS";
  v35[0] = @"JoinSOSAfterCKKSFetch";
  id v33 = @"SetAccountSettings";
  id v31 = @"BecomeReady";
  uint64_t v29 = @"Ready";
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v30 = v16;
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
  id v32 = v15;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
  id v34 = v14;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
  v35[1] = @"SetAccountSettings";
  v36[0] = v13;
  uint64_t v27 = @"BecomeReady";
  id v25 = @"Ready";
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v26 = v2;
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  unint64_t v28 = v3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
  v36[1] = v4;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
  id v38 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
  __int16 v40 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v40,  &v39,  1LL));
  v54[1] = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  2LL));
  id v56 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v56,  &v55,  1LL));
  id v58 = v9;
  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
  BOOL v60 = v10;
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));

  return v11;
}

- (void)rpcJoin:(id)a3 vouchSig:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v10 = (void (**)(id, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v11)
  {
    id v12 = sub_10001267C("octagon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v10[2](v10, v11);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000C2B54;
    v26[3] = &unk_1002864C0;
    id v27 = v8;
    id v28 = v9;
    id v25 = 0LL;
    [v14 persistAccountChanges:v26 error:&v25];
    id v15 = v25;

    if (v15)
    {
      unsigned __int8 v16 = sub_10001267C("octagon");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Unable to save voucher for joining: %@",  buf,  0xCu);
      }

      v10[2](v10, v15);
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"InitiatorAwaitingVoucher",  @"Untrusted",  0LL));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext joinStatePathDictionary](self, "joinStatePathDictionary"));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v19));

      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_1000C2B90;
      v23[3] = &unk_100285D40;
      void v23[4] = self;
      unsigned int v24 = v10;
      id v22 = [v21 doWatchedStateMachineRPC:@"rpc-join" sourceStates:v18 path:v20 reply:v23];
    }
  }
}

- (id)ckksPeerStatus:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 peerID]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 peerID]);
    [v4 setObject:v6 forKeyedSubscript:@"peerID"];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 publicSigningKey]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 encodeSubjectPublicKeyInfo]);

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 base64EncodedStringWithOptions:0]);
    [v4 setObject:v9 forKeyedSubscript:@"signingSPKI"];

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPHashBuilder hashWithAlgo:ofData:](&OBJC_CLASS___TPHashBuilder, "hashWithAlgo:ofData:", 1LL, v8));
    [v4 setObject:v10 forKeyedSubscript:@"signingSPKIHash"];
  }

  return v4;
}

- (id)sosTrustedPeersStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  id v19 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchTrustedPeers:&v19]);
  id v5 = v19;

  if (!v4 || v5)
  {
    id v13 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No SOS peers present: %@, skipping in status",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v7 = v4;
    id v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (i = 0LL; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext ckksPeerStatus:]( self,  "ckksPeerStatus:",  *(void *)(*((void *)&v15 + 1) + 8LL * (void)i),  (void)v15));
          if (v12) {
            [v6 addObject:v12];
          }
        }

        id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v15,  v20,  16LL);
      }

      while (v9);
    }
  }

  return v6;
}

- (id)sosSelvesStatus
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  id v24 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 fetchSelfPeers:&v24]);
  id v5 = v24;

  if (!v4 || v5)
  {
    __int128 v18 = sub_10001267C("octagon");
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "No SOS selves present: %@, skipping in status",  buf,  0xCu);
    }

    id v6 = 0LL;
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSelf]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckksPeerStatus:](self, "ckksPeerStatus:", v7));
    [v6 setObject:v8 forKeyedSubscript:@"currentSelf"];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 allSelves]);
    uint64_t v10 = (os_log_s *)[v9 mutableCopy];

    id v11 = (void *)objc_claimAutoreleasedReturnValue([v4 currentSelf]);
    -[os_log_s removeObject:](v10, "removeObject:", v11);

    if (-[os_log_s count](v10, "count"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      __int128 v20 = 0u;
      __int128 v21 = 0u;
      __int128 v22 = 0u;
      __int128 v23 = 0u;
      uint64_t v10 = v10;
      id v13 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          __int128 v16 = 0LL;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v10);
            }
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext ckksPeerStatus:]( self,  "ckksPeerStatus:",  *(void *)(*((void *)&v20 + 1) + 8LL * (void)v16),  (void)v20));
            if (v17) {
              [v12 addObject:v17];
            }

            __int128 v16 = (char *)v16 + 1;
          }

          while (v14 != v16);
          id v14 = -[os_log_s countByEnumeratingWithState:objects:count:]( v10,  "countByEnumeratingWithState:objects:count:",  &v20,  v25,  16LL);
        }

        while (v14);
      }

      [v6 setObject:v12 forKeyedSubscript:@"pastSelves"];
    }
  }

  return v6;
}

- (void)rpcStatus:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  uint64_t v65 = 0LL;
  v66 = &v65;
  uint64_t v67 = 0x3032000000LL;
  v68 = sub_1000BFAF8;
  BOOL v69 = sub_1000BFB08;
  id v70 = (id)0xAAAAAAAAAAAAAAAALL;
  id v70 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
  [(id)v66[5] setObject:v5 forKeyedSubscript:@"containerName"];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
  [(id)v66[5] setObject:v6 forKeyedSubscript:@"contextID"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
  [(id)v66[5] setObject:v8 forKeyedSubscript:@"activeAccount"];

  id v9 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  [v9 setTimeoutWaitForCKAccount:2000000000];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v9));
  if (v10)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v10);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 paused]);
    BOOL v15 = [v14 wait:3000000000] == 0;

    if (!v15)
    {
      __int128 v16 = sub_10001267C("octagon");
      __int128 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
        *(_DWORD *)buf = 138412546;
        v72 = v18;
        __int16 v73 = 2112;
        id v74 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Returning status of unpaused state machine for container (%@) and context (%@)",  buf,  0x16u);
      }

      [(id)v66[5] setObject:&off_1002AD6B0 forKeyedSubscript:@"stateUnpaused"];
    }

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentState]);
    [(id)v66[5] setObject:v21 forKeyedSubscript:@"state"];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 dumpPendingFlags]);
    [(id)v66[5] setObject:v23 forKeyedSubscript:@"statePendingFlags"];

    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 flags]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dumpFlags]);
    [(id)v66[5] setObject:v26 forKeyedSubscript:@"stateFlags"];

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    id v64 = 0LL;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 loadOrCreateAccountMetadata:&v64]);
    id v57 = v64;

    if (v57)
    {
      uint64_t v29 = sub_10001267C("octagon");
      id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
        *(_DWORD *)buf = 138412802;
        v72 = v31;
        __int16 v73 = 2112;
        id v74 = v32;
        __int16 v75 = 2112;
        id v76 = v57;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Failed to load account metaada for container (%@) and context (%@): %@",  buf,  0x20u);
      }
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  objc_msgSend(v28, "trustState", v57)));
    [(id)v66[5] setObject:v33 forKeyedSubscript:@"memoizedTrustState"];

    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v28 icloudAccountState]));
    [(id)v66[5] setObject:v34 forKeyedSubscript:@"memoizedAccountState"];

    id v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v28 cdpState]));
    [(id)v66[5] setObject:v35 forKeyedSubscript:@"memoizedCDPStatus"];

    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext launchSequence](self, "launchSequence"));
    id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 eventsByTime]);
    [(id)v66[5] setObject:v37 forKeyedSubscript:@"octagonLaunchSeqence"];

    uint64_t v38 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext currentMemoizedLastHealthCheck](self, "currentMemoizedLastHealthCheck"));
    id v39 = (void *)v38;
    if (v38) {
      __int16 v40 = (const __CFString *)v38;
    }
    else {
      __int16 v40 = @"Never checked";
    }
    [(id)v66[5] setObject:v40 forKeyedSubscript:@"memoizedlastHealthCheck"];
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    unsigned int v42 = [v41 sosEnabled];

    if (v42)
    {
      unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosTrustedPeersStatus](self, "sosTrustedPeersStatus"));
      [(id)v66[5] setObject:v43 forKeyedSubscript:@"sosTrustedPeersStatus"];

      id v44 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosSelvesStatus](self, "sosSelvesStatus"));
      [(id)v66[5] setObject:v44 forKeyedSubscript:@"sosSelvesStatus"];
    }

    id v63 = 0LL;
    id v45 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class request:]( -[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass"),  "request:",  &v63));
    id v46 = v63;
    id v62 = v46;
    id v47 = (void *)objc_claimAutoreleasedReturnValue([v45 fetchStatuses:&v62]);
    id v48 = v62;

    [(id)v66[5] setObject:v47 forKeyedSubscript:@"escrowRequest"];
    id v49 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v49 sysdiagnoseStatus]);
    [(id)v66[5] setObject:v50 forKeyedSubscript:@"CoreFollowUp"];

    id v51 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 datePropertyForKey:@"lastOctagonPush"]);
    [(id)v66[5] setObject:v52 forKeyedSubscript:@"lastOctagonPush"];

    id v53 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext apsReceiver](self, "apsReceiver"));
    id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 registeredPushEnvironments]);
    [(id)v66[5] setObject:v54 forKeyedSubscript:@"pushEnvironments"];

    id v55 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v56 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472LL;
    v59[2] = sub_1000C2A4C;
    v59[3] = &unk_1002852C8;
    v61 = &v65;
    BOOL v60 = v4;
    [v55 dumpWithSpecificUser:v56 reply:v59];
  }

  _Block_object_dispose(&v65, 8);
}

- (void)rpcFetchEgoPeerID:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v12 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 getEgoPeerID:&v12]);
  id v7 = v12;

  id v8 = sub_10001267C("octagon");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      id v11 = "Returning peer ID: %@";
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
    }
  }

  else if (v10)
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    id v11 = "Unable to fetch peer ID: %@";
    goto LABEL_6;
  }

  v4[2](v4, v6, v7);
}

- (void)fetchTrustedDeviceNamesByPeerID:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C2960;
    v10[3] = &unk_1002852F0;
    id v11 = v4;
    [v8 trustedDeviceNamesByPeerIDWithSpecificUser:v9 reply:v10];
  }
}

- (void)rpcSetRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    [v9 recheck];
  }

  BOOL v10 = objc_alloc(&OBJC_CLASS___OTSetRecoveryKeyOperation);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  id v12 = -[OTSetRecoveryKeyOperation initWithDependencies:recoveryKey:]( v10,  "initWithDependencies:recoveryKey:",  v11,  v7);

  __int128 v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  __int128 v20 = sub_1000C2878;
  __int128 v21 = &unk_100291608;
  __int128 v22 = v12;
  id v23 = v6;
  id v13 = v6;
  id v14 = v12;
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"setRecoveryKey-callback",  &v18));
  objc_msgSend(v15, "addDependency:", v14, v18, v19, v20, v21);
  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v16 addOperation:v15];

  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v17 addOperation:v14];
}

- (void)rpcIsRecoveryKeySet:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C286C;
    v10[3] = &unk_1002852A0;
    id v11 = v4;
    [v8 isRecoveryKeySet:v9 reply:v10];
  }
}

- (void)rpcRemoveRecoveryKey:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C2860;
    v10[3] = &unk_1002852A0;
    id v11 = v4;
    [v8 removeRecoveryKey:v9 reply:v10];
  }
}

- (void)areRecoveryKeysDistrusted:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C2854;
    v10[3] = &unk_1002852A0;
    id v11 = v4;
    [v8 octagonContainsDistrustedRecoveryKeysWithSpecificUser:v9 reply:v10];
  }
}

- (void)rpcCreateCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTCreateCustodianRecoveryKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTCreateCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C2754;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"createCustodianRecoveryKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcRemoveCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTRemoveCustodianRecoveryKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTRemoveCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C266C;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"removeCustodianRecoveryKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcCheckCustodianRecoveryKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTFindCustodianRecoveryKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTFindCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C2514;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"checkCustodianRecoveryKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTCreateInheritanceKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTCreateInheritanceKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C2414;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"createInheritanceKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcGenerateInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v5 = (NSUUID *)a3;
  id v6 = (void (**)(id, OTInheritanceKey *, void))a4;
  if (!v5) {
    id v5 = objc_alloc_init(&OBJC_CLASS___NSUUID);
  }
  id v11 = 0LL;
  id v7 = -[OTInheritanceKey initWithUUID:error:]( objc_alloc(&OBJC_CLASS___OTInheritanceKey),  "initWithUUID:error:",  v5,  &v11);
  id v8 = v11;
  if (v7)
  {
    v6[2](v6, v7, 0LL);
  }

  else
  {
    id v9 = sub_10001267C("SecError");
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "octagon: failed to generate inheritance key: %@",  buf,  0xCu);
    }

    ((void (**)(id, OTInheritanceKey *, id))v6)[2](v6, 0LL, v8);
  }
}

- (void)rpcStoreInheritanceKeyWithIK:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTStoreInheritanceKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTStoreInheritanceKeyOperation initWithIK:dependencies:](v8, "initWithIK:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C232C;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"storeInheritanceKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcRemoveInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTRemoveCustodianRecoveryKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTRemoveCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C2244;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"removeInheritanceKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcCheckInheritanceKeyWithUUID:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc(&OBJC_CLASS___OTFindCustodianRecoveryKeyOperation);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
  BOOL v10 = -[OTFindCustodianRecoveryKeyOperation initWithUUID:dependencies:](v8, "initWithUUID:dependencies:", v7, v9);

  __int128 v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472LL;
  __int128 v18 = sub_1000C20EC;
  uint64_t v19 = &unk_100291608;
  __int128 v20 = v10;
  id v21 = v6;
  id v11 = v6;
  id v12 = v10;
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"checkInheritanceKey-callback",  &v16));
  objc_msgSend(v13, "addDependency:", v12, v16, v17, v18, v19);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v14 addOperation:v13];

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
  [v15 addOperation:v12];
}

- (void)rpcRecreateInheritanceKeyWithUUID:(id)a3 oldIK:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, void, void *))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v11)
  {
    id v12 = sub_10001267C("octagon");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v10[2](v10, 0LL, v11);
  }

  else
  {
    id v14 = objc_alloc(&OBJC_CLASS___OTRecreateInheritanceKeyOperation);
    BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    __int128 v16 = -[OTRecreateInheritanceKeyOperation initWithUUID:oldIK:dependencies:]( v14,  "initWithUUID:oldIK:dependencies:",  v8,  v9,  v15);

    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    id v23 = sub_1000C1FEC;
    id v24 = &unk_100291608;
    id v25 = v16;
    id v26 = v10;
    uint64_t v17 = v16;
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"recreateInheritanceKey-callback",  &v21));
    objc_msgSend(v18, "addDependency:", v17, v21, v22, v23, v24);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    [v19 addOperation:v18];

    __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    [v20 addOperation:v17];
  }
}

- (void)rpcCreateInheritanceKeyWithUUID:(id)a3 claimTokenData:(id)a4 wrappingKeyData:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v14)
  {
    BOOL v15 = sub_10001267C("octagon");
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v13[2](v13, 0LL, v14);
  }

  else
  {
    uint64_t v17 = objc_alloc(&OBJC_CLASS___OTCreateInheritanceKeyWithClaimTokenAndWrappingKey);
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationDependencies](self, "operationDependencies"));
    uint64_t v19 = -[OTCreateInheritanceKeyWithClaimTokenAndWrappingKey initWithUUID:claimTokenData:wrappingKeyData:dependencies:]( v17,  "initWithUUID:claimTokenData:wrappingKeyData:dependencies:",  v10,  v11,  v12,  v18);

    id v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472LL;
    id v26 = sub_1000C1EEC;
    id v27 = &unk_100291608;
    id v28 = v19;
    uint64_t v29 = v13;
    __int128 v20 = v19;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlock:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlock:",  @"createInheritanceKeyWithClaimTokenAndWrappingKey-callback",  &v24));
    objc_msgSend(v21, "addDependency:", v20, v24, v25, v26, v27);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    [v22 addOperation:v21];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
    [v23 addOperation:v20];
  }
}

- (void)rpcTrustStatusCachedStatus:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isInheritedAccount] & 1) != 0
    || [v5 trustState] == 2)
  {
    uint64_t v7 = 0LL;
  }

  else if ([v5 trustState] == 1)
  {
    uint64_t v7 = 1LL;
  }

  else
  {
    uint64_t v7 = 3LL;
  }

  id v8 = sub_10001267C("octagon");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = OTCliqueStatusToString(v7);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int v13 = 138412290;
    id v14 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "returning cached clique status: %@",  (uint8_t *)&v13,  0xCu);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 peerID]);
  (*((void (**)(id, uint64_t, void *, void, void, void, void))v6 + 2))( v6,  v7,  v10,  0LL,  0LL,  0LL,  0LL);
}

- (void)rpcTrustStatus:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v58 = 0LL;
  __int16 v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = sub_1000BFAF8;
  id v62 = sub_1000BFB08;
  id v63 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v9 = v59;
  id v57 = v59[5];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 loadOrCreateAccountMetadata:&v57]);
  objc_storeStrong(v9 + 5, v57);

  if (v59[5])
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext lockStateTracker](self, "lockStateTracker"));
    unsigned int v12 = [v11 isLockedError:v59[5]];

    if (v12)
    {
      int v13 = sub_10001267C("octagon");
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Device is locked! pending initialization on unlock",  (uint8_t *)&buf,  2u);
      }

      id v15 = v59[5];
      uint64_t v16 = -1LL;
LABEL_10:
      (*((void (**)(id, uint64_t, void, void, void, void, id))v7 + 2))( v7,  v16,  0LL,  0LL,  0LL,  0LL,  v15);
      goto LABEL_31;
    }
  }

  if ([v10 icloudAccountState] == 1)
  {
    uint64_t v17 = sub_10001267C("octagon");
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "no account! returning clique status 'no account'",  (uint8_t *)&buf,  2u);
    }

    id v15 = 0LL;
    uint64_t v16 = 4LL;
    goto LABEL_10;
  }

  if ([v6 useCachedAccountStatus])
  {
    -[OTCuttlefishContext rpcTrustStatusCachedStatus:reply:](self, "rpcTrustStatusCachedStatus:reply:", v10, v7);
    goto LABEL_31;
  }

  int64_t v19 = -[OTCuttlefishContext checkForCKAccount:](self, "checkForCKAccount:", v6);
  if (!v19)
  {
    uint64_t v22 = sub_10001267C("octagon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      id v24 = "Unknown cloudkit account status, returning cached trust value";
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&buf, 2u);
    }

- (void)rpcFetchAllViableBottlesFromSource:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    || (uint64_t v7 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL))) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sessionMetrics](self, "sessionMetrics"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v8 flowID]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceSessionID]);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000C19C4;
    v15[3] = &unk_100285340;
    id v16 = v6;
    [v11 fetchViableBottlesWithSpecificUser:v12 source:a3 flowID:v13 deviceSessionID:v14 reply:v15];
  }

  else
  {
    id v8 = (void *)v7;
    id v9 = sub_10001267C("octagon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      __int128 v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void *))v6 + 2))(v6, 0LL, 0LL, v8);
  }
}

- (void)rpcFetchAllViableEscrowRecordsFromSource:(int64_t)a3 reply:(id)a4
{
  id v6 = a4;
  if (a3 == 1
    || (uint64_t v7 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL))) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C1874;
    v13[3] = &unk_100285368;
    id v14 = v6;
    [v11 fetchViableEscrowRecordsWithSpecificUser:v12 source:a3 reply:v13];

    id v8 = v14;
  }

  else
  {
    id v8 = (void *)v7;
    id v9 = sub_10001267C("octagon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void *))v6 + 2))(v6, 0LL, v8);
  }
}

- (void)rpcInvalidateEscrowCache:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      int v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C1748;
    v10[3] = &unk_100285010;
    uint64_t v11 = v4;
    [v8 removeEscrowCacheWithSpecificUser:v9 reply:v10];
  }
}

- (void)fetchEscrowContents:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      int v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void, void, void *))v4 + 2))(v4, 0LL, 0LL, 0LL, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000C15C0;
    v10[3] = &unk_100285390;
    id v11 = v4;
    [v8 fetchEscrowContentsWithSpecificUser:v9 reply:v10];
  }
}

- (void)rpcRefetchCKKSPolicy:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
  uint64_t v17 = @"RefetchCKKSPolicy";
  id v15 = @"BecomeReady";
  int v13 = @"Ready";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
  id v14 = v7;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v14,  &v13,  1LL));
  id v16 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  __int128 v18 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v10));
  id v12 =  [v5 doWatchedStateMachineRPC:@"octagon-refetch-ckks-policy" sourceStates:v6 path:v11 reply:v4];
}

- (void)rpcFetchUserControllableViewsSyncingStatus:(id)a3
{
  id v4 = a3;
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (!v5)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    unsigned int v9 = [v8 isPaused];

    if (v9)
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonNotInCliqueStates](&OBJC_CLASS___OTStates, "OctagonNotInCliqueStates"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentState]);
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
      unsigned int v14 = [v10 intersectsSet:v13];

      if (v14)
      {
        id v15 = sub_10001267C("octagon-ckks");
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          uint64_t v17 = "device is not in clique, returning not syncing";
LABEL_12:
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
          goto LABEL_13;
        }

        goto LABEL_13;
      }

      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      int64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentState]);
      unsigned int v20 = [v19 isEqualToString:@"Error"];

      if (v20)
      {
        id v21 = sub_10001267C("octagon-ckks");
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          uint64_t v17 = "state machine in the error state, cannot service request";
          goto LABEL_12;
        }

- (void)rpcSetUserControllableViewsSyncingStatus:(BOOL)a3 reply:(id)a4
{
  id v4 = (void (**)(id, void, void *))a4;
  id v5 = sub_10001267C("octagon-ckks");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Rejecting set of user-controllable sync status due to platform",  v8,  2u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  29LL,  @"This platform does not support setting the user-controllable view syncing status"));
  v4[2](v4, 0LL, v7);
}

- (void)rpcSetAccountSetting:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (!v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    unsigned int v12 = [v11 isPaused];

    if (v12)
    {
      int v13 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
      unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 currentState]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v15));
      unsigned __int8 v17 = [v13 intersectsSet:v16];

      if ((v17 & 1) == 0)
      {
        __int128 v18 = sub_10001267C("octagon-settings");
        int64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          unsigned int v20 = "device is not in a ready state to set account settings, returning";
LABEL_15:
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 2u);
          goto LABEL_16;
        }

        goto LABEL_16;
      }
    }

    else if (!-[OTCuttlefishContext waitForReady:](self, "waitForReady:", 10000000000LL))
    {
      id v32 = sub_10001267C("octagon-settings");
      int64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        unsigned int v20 = "rpcSetAccountSetting: failed to reach Ready state";
        goto LABEL_15;
      }

- (void)rpcSetLocalSecureElementIdentity:(id)a3 reply:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000C12CC;
  v16[3] = &unk_100291520;
  id v9 = v6;
  id v17 = v9;
  id v15 = 0LL;
  [v8 persistAccountChanges:v16 error:&v15];
  id v10 = v15;

  id v11 = sub_10001267C("octagon-se");
  unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v13)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to persist identity: %@", buf, 0xCu);
    }

    v7[2](v7, v10);
  }

  else
  {
    if (v13)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Successfully persisted new SE identity: %@",  buf,  0xCu);
    }

    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    [v14 handleFlag:@"se_id_changed"];

    v7[2](v7, 0LL);
  }
}

- (void)rpcRemoveLocalSecureElementIdentityPeerID:(id)a3 reply:(id)a4
{
  id v5 = (void (**)(id, id))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v12 = 0LL;
  [v6 persistAccountChanges:&stru_1002853B0 error:&v12];
  id v7 = v12;

  id v8 = sub_10001267C("octagon-se");
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v10)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v14 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Unable to persist removal of identity: %@",  buf,  0xCu);
    }

    v5[2](v5, v7);
  }

  else
  {
    if (v10)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Successfully persisted removal of SE identity",  buf,  2u);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    [v11 handleFlag:@"se_id_changed"];

    v5[2](v5, 0LL);
  }
}

- (void)rpcFetchTrustedSecureElementIdentities:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    id v23 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 loadOrCreateAccountMetadata:&v23]);
    id v10 = v23;

    if (!v9 || v10)
    {
      id v12 = sub_10001267C("octagon");
      BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
        *(_DWORD *)__int128 buf = 138412802;
        *(void *)&uint8_t buf[4] = v14;
        __int16 v25 = 2112;
        id v26 = v15;
        __int16 v27 = 2112;
        id v28 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Unable to load account metadata for (%@,%@): %@",  buf,  0x20u);
      }

      id v11 = 0LL;
    }

    else
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 parsedSecureElementIdentity]);
    }

    *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000C0E44;
    v19[3] = &unk_1002853D8;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = v4;
    id v18 = v11;
    id v20 = v18;
    [v16 fetchTrustStateWithSpecificUser:v17 reply:v19];

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
}

- (void)rpcFetchAccountSettings:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, 0LL, v5);
  }

  else
  {
    id v8 = sub_10001267C("octagon-settings");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Fetching account settings", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000C0D10;
    v14[3] = &unk_100285400;
    id v15 = v4;
    +[OTStashAccountSettingsOperation performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:]( &OBJC_CLASS___OTStashAccountSettingsOperation,  "performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:",  0LL,  0LL,  v10,  v11,  v12,  v13,  v14);
  }
}

- (void)rpcAccountWideSettingsWithForceFetch:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v7)
  {
    id v8 = sub_10001267C("octagon");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v6[2](v6, 0LL, v7);
  }

  else
  {
    id v10 = sub_10001267C("octagon-settings");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v19) = v4;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Fetching account-wide settings with force: %{BOOL}d",  buf,  8u);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext containerName](self, "containerName"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext contextID](self, "contextID"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1000C0BC0;
    v16[3] = &unk_100285400;
    id v17 = v6;
    +[OTStashAccountSettingsOperation performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:]( &OBJC_CLASS___OTStashAccountSettingsOperation,  "performWithAccountWide:forceFetch:cuttlefishXPCWrapper:activeAccount:containerName:contextID:reply:",  1LL,  v4,  v12,  v13,  v14,  v15,  v16);
  }
}

- (void)rpcWaitForPriorityViewKeychainDataRecovery:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v26 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v5);
  }

  else
  {
    id v8 = sub_10001267C("octagon-ckks");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Beginning to wait for CKKS Priority view download",  buf,  2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 waitForState:@"Ready" wait:120000000000]);
    unsigned int v12 = [v11 isEqualToString:@"Ready"];

    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext ckks](self, "ckks"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 rpcWaitForPriorityViewProcessing]);

      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = sub_1000C0714;
      v21[3] = &unk_100285428;
      id v22 = v14;
      id v23 = self;
      id v24 = v4;
      id v15 = v14;
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSResultOperation named:withBlockTakingSelf:]( &OBJC_CLASS___CKKSResultOperation,  "named:withBlockTakingSelf:",  @"wait-for-sync-reply",  v21));
      [v16 addDependency:v15];
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext operationQueue](self, "operationQueue"));
      [v17 addOperation:v16];
    }

    else
    {
      id v18 = sub_10001267C("SecError");
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "octagon-ckks: rpcWaitForPriorityViewKeychainDataRecovery: failed to get to ready after timeout",  buf,  2u);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  76LL,  @"Octagon has not reached a ready state yet"));
      v4[2](v4, v20);
    }
  }
}

- (void)octagonPeerIDGivenBottleID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v8)
  {
    id v9 = sub_10001267C("octagon");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v7[2](v7, 0LL, v8);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000C0628;
    v13[3] = &unk_100285450;
    id v14 = v7;
    [v11 octagonPeerIDGivenBottleIDWithSpecificUser:v12 bottleID:v6 reply:v13];
  }
}

- (void)tlkRecoverabilityInOctagon:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000C01E0;
  v11[3] = &unk_1002854A0;
  BOOL v13 = self;
  id v14 = a5;
  id v12 = v8;
  id v9 = v8;
  id v10 = v14;
  -[OTCuttlefishContext rpcFetchAllViableBottlesFromSource:reply:]( self,  "rpcFetchAllViableBottlesFromSource:reply:",  a4,  v11);
}

- (void)rpcTlkRecoverabilityForEscrowRecordData:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (a4 == 1
    || (uint64_t v10 = objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL))) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000BFFA8;
    v14[3] = &unk_100285368;
    id v15 = v9;
    -[OTCuttlefishContext tlkRecoverabilityInOctagon:source:reply:]( self,  "tlkRecoverabilityInOctagon:source:reply:",  v8,  a4,  v14);
    id v11 = v15;
  }

  else
  {
    id v11 = (void *)v10;
    id v12 = sub_10001267C("octagon-tlk-recoverability");
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    (*((void (**)(id, void, void *))v9 + 2))(v9, 0LL, v11);
  }
}

- (void)rpcFetchTotalCountOfTrustedPeers:(id)a3
{
  BOOL v4 = (void (**)(id, _UNKNOWN **, void *))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      BOOL v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, &off_1002AD6C8, v5);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000BFF9C;
    v10[3] = &unk_1002854C8;
    id v11 = v4;
    [v8 fetchTrustedPeerCountWithSpecificUser:v9 reply:v10];
  }
}

- (void)rerollWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", v5));
  if (v6)
  {
    id v7 = sub_10001267C("octagon");
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v4[2](v4, v6);
  }

  else
  {
    id v21 = @"OctagonStateStashAccountSettingsForReroll";
    id v19 = @"OctagonStateCreateIdentityForReroll";
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[OTCuttlefishContext joinStatePathDictionary]( self,  "joinStatePathDictionary",  @"OctagonStateVouchWithReroll"));
    id v18 = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v18,  &v17,  1LL));
    id v20 = v10;
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    id v22 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v12));

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonReadyStates](&OBJC_CLASS___OTStates, "OctagonReadyStates"));
    id v16 = [v14 doWatchedStateMachineRPC:@"reroll" sourceStates:v15 path:v13 reply:v4];
  }
}

- (BOOL)postRepairCFU:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  id v13 = 0LL;
  [v5 postFollowUp:2 activeAccount:v6 error:&v13];
  id v7 = v13;

  if (v7)
  {
    id v8 = sub_10001267C("SecError");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v15 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "octagon-health: CoreCDP repair failed: %@",  buf,  0xCu);
    }

    if (a3) {
      *a3 = v7;
    }
  }

  else
  {
    uint64_t v10 = sub_10001267C("octagon-health");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CoreCDP post repair success", buf, 2u);
    }
  }

  return v7 == 0LL;
}

- (BOOL)shouldPostConfirmPasscodeCFU:(id *)a3
{
  id v16 = 0LL;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class request:]( -[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass"),  "request:",  &v16));
  id v5 = v16;
  id v6 = v5;
  if (!v4 || v5)
  {
    id v12 = sub_10001267C("octagon-health");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    *(_DWORD *)__int128 buf = 138412290;
    id v18 = v6;
    id v11 = "Unable to acquire a EscrowRequest object: %@";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
LABEL_9:

    if (a3)
    {
      id v6 = v6;
      *a3 = v6;
    }

- (BOOL)recheckCKKSTrustStatus:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  id v6 = sub_10001267C("octagon");
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v32 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    if (a3)
    {
      id v9 = v5;
LABEL_17:
      BOOL v24 = 0;
      *a3 = v9;
      goto LABEL_21;
    }

    goto LABEL_18;
  }

  if (v8)
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to re-check CKKS's trust status", buf, 2u);
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 waitForState:@"Ready" wait:10000000000]);
  unsigned int v12 = [v11 isEqualToString:@"Ready"];

  if (!v12)
  {
    id v22 = sub_10001267C("SecError");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon-ckks: recheckCKKSTrustStatus: failed to get to ready after timeout",  buf,  2u);
    }

    if (a3)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  76LL,  @"Octagon has not reached a ready state yet"));
      goto LABEL_17;
    }

- (BOOL)leaveTrust:(id *)a3
{
  if (-[OTSOSActualAdapter sosEnabled]_0((uint64_t)self, (uint64_t)a2)
    && ((id v10 = 0LL, !sub_1001C8F54((CFTypeRef *)&v10)) || v10))
  {
    unsigned int v7 = sub_10001267C("SecError");
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "failed to leave SOS circle: %@", buf, 0xCu);
    }

    id v9 = v10;
    if (a3)
    {
      *a3 = v10;
    }

    else if (v10)
    {
      id v10 = 0LL;
      CFRelease(v9);
    }

    return 0;
  }

  else
  {
    BOOL v4 = sub_10001267C("octagon-health");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully left SOS", buf, 2u);
    }

    return 1;
  }

- (BOOL)postConfirmPasscodeCFU:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  id v12 = 0LL;
  unsigned __int8 v7 = [v5 postFollowUp:3 activeAccount:v6 error:&v12];
  id v8 = v12;

  if (v8)
  {
    id v9 = sub_10001267C("SecError");
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "octagon-health: CoreCDP confirm existing secret failed: %@",  buf,  0xCu);
    }

    if (a3) {
      *a3 = v8;
    }
  }

  return v7;
}

- (BOOL)processMoveRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v52 = 0LL;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( -[objc_class request:]( -[OTCuttlefishContext escrowRequestClass](self, "escrowRequestClass"),  "request:",  &v52));
  id v8 = (os_log_s *)v52;
  id v9 = v8;
  if (v7 && !v8)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
    id v51 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 loadOrCreateAccountMetadata:&v51]);
    id v12 = (os_log_s *)v51;

    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 altDSID]);
    if (v13) {
      BOOL v14 = v12 == 0LL;
    }
    else {
      BOOL v14 = 0;
    }
    BOOL v15 = v14;
    if (!v14)
    {
      id v23 = sub_10001267C("octagon-health");
      BOOL v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v56 = v12;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to get altDSID: %@", buf, 0xCu);
      }

      if (a4) {
        *a4 = v12;
      }
      goto LABEL_44;
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 intendedFederation]);
    unsigned int v17 = +[SecureBackup moveToFederationAllowed:altDSID:error:]( &OBJC_CLASS___SecureBackup,  "moveToFederationAllowed:altDSID:error:",  v16,  v13,  0LL);

    if (!v17)
    {
      id v48 = v11;
      id v26 = sub_10001267C("octagon-health");
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Secure terms not accepted, posting followup",  buf,  2u);
      }

      id v20 = &off_10028FEA0;
LABEL_29:

      __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
      [v27 logSuccessForEventNamed:*v20];

      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext followupHandler](self, "followupHandler"));
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      id v49 = 0LL;
      unsigned int v30 = [v28 postFollowUp:4 activeAccount:v29 error:&v49];
      id v31 = (os_log_s *)v49;

      if (v30)
      {
        id v32 = sub_10001267C("octagon-health");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          id v34 = "Posted secure terms followup";
          id v35 = v33;
          uint32_t v36 = 2;
LABEL_37:
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v34, buf, v36);
        }
      }

      else
      {
        uint64_t v45 = sub_10001267C("SecError");
        uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v56 = v31;
          id v34 = "octagon-health: Failed to post secure terms followup: %@";
          id v35 = v33;
          uint32_t v36 = 12;
          goto LABEL_37;
        }
      }

      id v11 = v48;
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }

    if ((_os_feature_enabled_impl("Security", "OctagonEscrowMoveUnthrottled") & 1) == 0
      && [v7 escrowCompletedWithinLastSeconds:15552000.0])
    {
      id v48 = v11;
      uint64_t v18 = sub_10001267C("octagon-health");
      id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Skipping escrow move request (rate limited), posting follow up",  buf,  2u);
      }

      id v20 = &off_10028FE98;
      goto LABEL_29;
    }

    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    [v37 logSuccessForEventNamed:@"OctagonEventEscrowMoveTriggered"];

    uint64_t v53 = SecEscrowRequestOptionFederationMove;
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v6 intendedFederation]);
    id v54 = v38;
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v54,  &v53,  1LL));

    id v50 = 0LL;
    unsigned int v39 = [v7 triggerEscrowUpdate:@"octagon-health" options:v31 error:&v50];
    uint64_t v33 = (os_log_s *)v50;
    if (v39)
    {
      id v40 = sub_10001267C("octagon-health");
      __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        char v42 = "Triggered escrow move";
        uint64_t v43 = v41;
        uint32_t v44 = 2;
LABEL_41:
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
      }
    }

    else
    {
      uint64_t v46 = sub_10001267C("SecError");
      __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v56 = v33;
        char v42 = "octagon-health: Unable to trigger escrow move: %@";
        uint64_t v43 = v41;
        uint32_t v44 = 12;
        goto LABEL_41;
      }
    }

    goto LABEL_43;
  }

  id v21 = sub_10001267C("octagon-health");
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412290;
    id v56 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Unable to acquire EscrowRequest object: %@",  buf,  0xCu);
  }

  BOOL v15 = 0;
  if (a4) {
    *a4 = v9;
  }
LABEL_45:

  return v15;
}

- (void)checkOctagonHealth:(BOOL)a3 repair:(BOOL)a4 reply:(id)a5
{
  id v8 = (void (**)(id, void, void *))a5;
  id v9 = sub_10001267C("octagon-health");
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Beginning checking overall Octagon Trust",  buf,  2u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  unsigned int v12 = [v11 isPaused];

  if (!v12) {
    goto LABEL_12;
  }
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 currentState]);
  unsigned int v15 = [v14 isEqualToString:@"WaitForClassCUnlock"];

  if (v15)
  {
    id v16 = sub_10001267C("octagon-health");
    unsigned int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "currently waiting for class C unlock",  buf,  2u);
    }

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  57LL,  @"Not performing health check, waiting for Class C Unlock"));
    v8[2](v8, 0LL, v18);

    goto LABEL_16;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 currentState]);
  unsigned int v21 = [v20 isEqualToString:@"NoAccount"];

  if (!v21)
  {
LABEL_12:
    self->_skipRateLimitingCheck = a3;
    self->_repair = a4;
    self->_reportRateLimitingError = 1;
    *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 currentState]);
    unsigned int v27 = [v26 isEqualToString:@"WaitForCDPCapableSecurityLevel"];

    if (v27)
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      [v28 handleFlag:@"idms_level"];

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  69LL,  @"Unable to perform health check on this account type"));
      v8[2](v8, 0LL, v29);
    }

    else
    {
      unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
      id v40 = (void *)objc_claimAutoreleasedReturnValue(+[OTStates OctagonHealthSourceStates](&OBJC_CLASS___OTStates, "OctagonHealthSourceStates"));
      v61 = @"CDPHealthCheck";
      v59[0] = @"SecurityTrustCheck";
      id v57 = @"TPHTrustCheck";
      v55[0] = @"CuttlefishTrustCheck";
      v53[0] = @"BecomeReady";
      v51[0] = @"Ready";
      uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v51[1] = @"WaitForUnlock";
      v52[0] = v46;
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v52[1] = v45;
      uint32_t v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));
      v54[0] = v44;
      v53[1] = @"HealthCheckReset";
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v54[1] = v43;
      void v53[2] = @"HealthCheckLeaveClique";
      char v42 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      void v54[2] = v42;
      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v54,  v53,  3LL));
      v56[0] = v41;
      v55[1] = @"WaitForUnlock";
      unsigned int v30 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v56[1] = v30;
      v55[2] = @"Untrusted";
      id v31 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v56[2] = v31;
      id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v56,  v55,  3LL));
      uint64_t v58 = v32;
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
      v59[1] = @"WaitForCDP";
      v60[0] = v33;
      id v34 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
      v60[1] = v34;
      id v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
      id v62 = v35;
      uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
      id v37 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v36));
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472LL;
      v47[2] = sub_1000BFE84;
      v47[3] = &unk_1002854F0;
      objc_copyWeak(&v49, (id *)buf);
      id v48 = v8;
      id v38 =  [v39 doWatchedStateMachineRPC:@"octagon-trust-health-check" sourceStates:v40 path:v37 reply:v47];

      objc_destroyWeak(&v49);
    }

    objc_destroyWeak((id *)buf);
    goto LABEL_16;
  }

  id v22 = sub_10001267C("octagon-health");
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Not performing health check, not currently signed in",  buf,  2u);
  }

  BOOL v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"Not performing health check, not currently signed in"));
  v8[2](v8, 0LL, v24);

LABEL_16:
}

- (void)waitForOctagonUpgrade:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  id v5 = sub_10001267C("octagon-sos");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "waitForOctagonUpgrade", buf, 2u);
  }

  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
  unsigned __int8 v8 = [v7 sosEnabled];

  if ((v8 & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
    id v47 = 0LL;
    unsigned int v10 = [v9 circleStatus:&v47];
    id v11 = v47;

    unsigned int v12 = sub_10001267C("octagon-sos");
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v14)
      {
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext sosAdapter](self, "sosAdapter"));
        id v46 = v11;
        unsigned int v16 = [v15 circleStatus:&v46];
        id v17 = v46;

        *(_DWORD *)__int128 buf = 67109120;
        LODWORD(v58) = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SOS circle status: %d, cannot perform sos upgrade",  buf,  8u);

        id v11 = v17;
      }

      if (v11)
      {
        uint64_t v18 = sub_10001267C("SecError");
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v58 = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "octagon-sos: error retrieving circle status: %@",  buf,  0xCu);
        }
      }

      else
      {
        uint64_t v30 = kSOSErrorDomain;
        NSErrorUserInfoKey v59 = NSLocalizedDescriptionKey;
        uint64_t v60 = @"Not in circle";
        id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v60,  &v59,  1LL));
        id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v30,  1037LL,  v19));
      }

      v4[2](v4, v11);
      goto LABEL_27;
    }

    if (v14)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "in sos circle!, attempting upgrade", buf, 2u);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    unsigned int v23 = [v22 isPaused];

    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    __int16 v25 = v24;
    if (v23)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 currentState]);
      unsigned int v27 = [v26 isEqualToString:@"Ready"];

      if (v27)
      {
        id v28 = sub_10001267C("octagon-sos");
        uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "waitForOctagonUpgrade: already ready, returning",  buf,  2u);
        }

LABEL_26:
        v4[2](v4, 0LL);
LABEL_27:

        goto LABEL_28;
      }
    }

    else
    {
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v24 waitForState:@"Ready" wait:10000000000]);
      unsigned int v32 = [v31 isEqualToString:@"Ready"];

      uint64_t v33 = sub_10001267C("octagon-sos");
      id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
      if (v32)
      {
        if (v35)
        {
          *(_WORD *)__int128 buf = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "waitForOctagonUpgrade: in ready (after waiting), returning",  buf,  2u);
        }

        goto LABEL_26;
      }

      if (v35)
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "waitForOctagonUpgrade: fail to get to ready after timeout, attempting upgrade",  buf,  2u);
      }
    }

    v56[0] = @"WaitForCDP";
    v56[1] = @"Untrusted";
    uint32_t v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL));
    id v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v36));

    id v54 = @"AttemptSOSUpgradeDetermineCDPState";
    id v52 = @"AttemptSOSUpgrade";
    id v50 = @"BecomeReady";
    id v48 = @"Ready";
    id v38 = (void *)objc_claimAutoreleasedReturnValue(+[OctagonStateTransitionPathStep success](&OBJC_CLASS___OctagonStateTransitionPathStep, "success"));
    id v49 = v38;
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v49,  &v48,  1LL));
    id v51 = v39;
    id v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v51,  &v50,  1LL));
    uint64_t v53 = v40;
    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v53,  &v52,  1LL));
    id v55 = v41;
    char v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v55,  &v54,  1LL));
    uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue( +[OctagonStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___OctagonStateTransitionPath,  "pathFromDictionary:",  v42));

    uint32_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext stateMachine](self, "stateMachine"));
    id v45 =  [v44 doWatchedStateMachineRPC:@"sos-upgrade-to-ready" sourceStates:v37 path:v43 reply:v4];

    goto LABEL_27;
  }

  id v20 = sub_10001267C("octagon-sos");
  unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "sos not enabled, nothing to do for waitForOctagonUpgrade",  buf,  2u);
  }

  v4[2](v4, 0LL);
LABEL_28:
}

- (BOOL)machineIDOnMemoizedList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v7)
  {
    unsigned __int8 v8 = sub_10001267C("octagon");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "No cloudkit account present: %@",  (uint8_t *)&buf,  0xCu);
    }

    BOOL v10 = 0;
    if (a4) {
      *a4 = v7;
    }
  }

  else
  {
    uint64_t v19 = 0LL;
    id v20 = &v19;
    uint64_t v21 = 0x2020000000LL;
    char v22 = 0;
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v24 = 0x3032000000LL;
    __int16 v25 = sub_1000BFAF8;
    id v26 = sub_1000BFB08;
    id v27 = 0LL;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_1000BFD14;
    v15[3] = &unk_100285518;
    p___int128 buf = &buf;
    id v16 = v6;
    uint64_t v18 = &v19;
    [v11 fetchAllowedMachineIDsWithSpecificUser:v12 reply:v15];

    if (a4)
    {
      BOOL v13 = *(void **)(*((void *)&buf + 1) + 40LL);
      if (v13) {
        *a4 = v13;
      }
    }

    BOOL v10 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

- (id)currentlyEnforcingIDMSTDL_testOnly:(id *)a3
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  uint64_t v11 = 0LL;
  unsigned int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  BOOL v14 = sub_1000BFAF8;
  unsigned int v15 = sub_1000BFB08;
  id v16 = 0LL;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000BFC10;
  v10[3] = &unk_100285540;
  void v10[4] = &v11;
  v10[5] = &v17;
  [v5 honorIDMSListChangesForSpecificUser:v6 reply:v10];

  unsigned __int8 v7 = (void *)v12[5];
  if (v7)
  {
    unsigned __int8 v8 = 0LL;
    if (a3) {
      *a3 = v7;
    }
  }

  else if (*((_BYTE *)v18 + 24))
  {
    unsigned __int8 v8 = &__kCFBooleanTrue;
  }

  else
  {
    unsigned __int8 v8 = &__kCFBooleanFalse;
  }

  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)egoPeerStatus:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v5)
  {
    id v6 = sub_10001267C("octagon");
    unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "No cloudkit account present: %@",  (uint8_t *)&buf,  0xCu);
    }

    id v8 = 0LL;
    if (a3) {
      *a3 = v5;
    }
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000LL;
    char v22 = sub_1000BFAF8;
    unsigned int v23 = sub_1000BFB08;
    id v24 = 0LL;
    uint64_t v14 = 0LL;
    unsigned int v15 = &v14;
    uint64_t v16 = 0x3032000000LL;
    uint64_t v17 = sub_1000BFAF8;
    uint64_t v18 = sub_1000BFB08;
    id v19 = 0LL;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_1000BFB10;
    v13[3] = &unk_100285568;
    void v13[4] = &v14;
    v13[5] = &buf;
    [v9 trustStatusWithSpecificUser:v10 reply:v13];

    if (a3)
    {
      uint64_t v11 = (void *)v15[5];
      if (v11) {
        *a3 = v11;
      }
    }

    id v8 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&v14, 8);

    _Block_object_dispose(&buf, 8);
  }

  return v8;
}

- (void)rpcResetAccountCDPContentsWithIdmsTargetContext:(id)a3 idmsCuttlefishPassword:(id)a4 notifyIdMS:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  unsigned int v12 = (void (**)(id, void *))a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext errorIfNoCKAccount:](self, "errorIfNoCKAccount:", 0LL));
  if (v13)
  {
    uint64_t v14 = sub_10001267C("octagon");
    unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v35 = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No cloudkit account present: %@", buf, 0xCu);
    }

    v12[2](v12, v13);
  }

  else
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 altDSID]);

    if (v17)
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext authKitAdapter](self, "authKitAdapter"));
      id v33 = 0LL;
      unsigned int v30 = [v18 accountIsDemoAccountByAltDSID:v17 error:&v33];
      id v19 = v33;

      if (v19)
      {
        char v22 = sub_10001267C("SecError");
        unsigned int v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v19;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "octagon-authkit: failed to fetch demo account flag: %@",  buf,  0xCu);
        }
      }

      uint64_t IsInternalRelease = SecIsInternalRelease(v20, v21);
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext cuttlefishXPCWrapper](self, "cuttlefishXPCWrapper"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_1000BF9CC;
      v31[3] = &unk_100285010;
      unsigned int v32 = v12;
      [v25 resetAccountCDPContentsWithSpecificUser:v26 idmsTargetContext:v10 idmsCuttlefishPassword:v11 notifyIdMS:v7 internalAccount:IsInternalRelease demoAccount:v30 reply:v31];
    }

    else
    {
      id v27 = sub_10001267C("authkit");
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext activeAccount](self, "activeAccount"));
        *(_DWORD *)__int128 buf = 138412290;
        id v35 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No configured altDSID: %@", buf, 0xCu);
      }

      id v19 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  59LL,  @"No altDSID configured"));
      v12[2](v12, v19);
    }
  }
}

- (void)getAccountMetadataWithReply:(id)a3
{
  BOOL v4 = (void (**)(id, void, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  id v10 = 0LL;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 loadOrCreateAccountMetadata:&v10]);
  id v7 = v10;

  if (!v6 || v7)
  {
    id v8 = sub_10001267C("octagon-account-metadata");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v12 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "error fetching account metadata: %@",  buf,  0xCu);
    }

    v4[2](v4, 0LL, v7);
  }

  else
  {
    ((void (**)(id, void *, id))v4)[2](v4, v6, 0LL);
  }
}

- (void)clearContextState
{
  bottleID = self->_bottleID;
  self->_bottleID = 0LL;

  bottleSalt = self->_bottleSalt;
  self->_bottleSalt = 0LL;

  entropy = self->_entropy;
  self->_entropy = 0LL;

  idmsTargetContext = self->_idmsTargetContext;
  self->_int64_t resetReason = 0LL;
  self->_idmsTargetContext = 0LL;

  idmsCuttlefishPassword = self->_idmsCuttlefishPassword;
  self->_idmsCuttlefishPassword = 0LL;

  self->_BOOL notifyIdMS = 0;
  -[OTCuttlefishContext setAccountSettings:](self, "setAccountSettings:", 0LL);
  *(_WORD *)&self->_skipRateLimitingCheck = 0;
  self->_reportRateLimitingError = 0;
  -[OTCuttlefishContext setRecoveryKey:](self, "setRecoveryKey:", 0LL);
  -[OTCuttlefishContext setInheritanceKey:](self, "setInheritanceKey:", 0LL);
  -[OTCuttlefishContext setCustodianRecoveryKey:](self, "setCustodianRecoveryKey:", 0LL);
  healthCheckResults = self->_healthCheckResults;
  self->_healthCheckResults = 0LL;
}

- (BOOL)checkAllStateCleared
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext inheritanceKey](self, "inheritanceKey"));
  if (v3)
  {
    BOOL v4 = 0;
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext custodianRecoveryKey](self, "custodianRecoveryKey"));
    if (v5)
    {
      BOOL v4 = 0;
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext recoveryKey](self, "recoveryKey"));
      if (v6
        || self->_bottleID
        || self->_bottleSalt
        || self->_entropy
        || self->_resetReason
        || self->_idmsTargetContext
        || self->_idmsCuttlefishPassword
        || self->_notifyIdMS)
      {
        BOOL v4 = 0;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountSettings](self, "accountSettings"));
        BOOL v4 = !v8
          && !self->_skipRateLimitingCheck
          && !self->_repair
          && !self->_reportRateLimitingError
          && self->_healthCheckResults == 0LL;

        id v6 = 0LL;
      }
    }
  }

  return v4;
}

- (BOOL)fetchSendingMetricsPermitted:(id *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  LOBYTE(a3) = -[OTCuttlefishContext canSendMetricsUsingAccountState:]( self,  "canSendMetricsUsingAccountState:",  [v5 fetchSendingMetricsPermitted:a3]);

  return (char)a3;
}

- (BOOL)persistSendingMetricsPermitted:(BOOL)a3 error:(id *)a4
{
  if (a3) {
    -[OTCuttlefishContext setMetricsStateToActive](self, "setMetricsStateToActive");
  }
  else {
    -[OTCuttlefishContext setMetricsStateToInactive](self, "setMetricsStateToInactive");
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[OTCuttlefishContext accountMetadataStore](self, "accountMetadataStore"));
  unsigned __int8 v7 = objc_msgSend( v6,  "persistSendingMetricsPermitted:error:",  -[OTCuttlefishContext shouldSendMetricsForOctagon](self, "shouldSendMetricsForOctagon"),  a4);

  return v7;
}

- (CuttlefishXPCWrapper)cuttlefishXPCWrapper
{
  return (CuttlefishXPCWrapper *)objc_getProperty(self, a2, 96LL, 1);
}

- (OTFollowup)followupHandler
{
  return (OTFollowup *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setFollowupHandler:(id)a3
{
}

- (NSString)containerName
{
  return (NSString *)objc_getProperty(self, a2, 112LL, 1);
}

- (NSString)contextID
{
  return (NSString *)objc_getProperty(self, a2, 120LL, 1);
}

- (TPSpecificUser)activeAccount
{
  return (TPSpecificUser *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setActiveAccount:(id)a3
{
}

- (NSString)pairingUUID
{
  return self->_pairingUUID;
}

- (void)setPairingUUID:(id)a3
{
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (OTCuttlefishAccountStateHolder)accountMetadataStore
{
  return self->_accountMetadataStore;
}

- (void)setAccountMetadataStore:(id)a3
{
}

- (OctagonStateMachine)stateMachine
{
  return (OctagonStateMachine *)objc_getProperty(self, a2, 160LL, 1);
}

- (CKKSNearFutureScheduler)apsRateLimiter
{
  return self->_apsRateLimiter;
}

- (void)setApsRateLimiter:(id)a3
{
}

- (CKKSNearFutureScheduler)sosConsistencyRateLimiter
{
  return self->_sosConsistencyRateLimiter;
}

- (void)setSosConsistencyRateLimiter:(id)a3
{
}

- (CKKSNearFutureScheduler)checkMetricsTrigger
{
  return self->_checkMetricsTrigger;
}

- (void)setCheckMetricsTrigger:(id)a3
{
}

- (OTMetricsSessionData)sessionMetrics
{
  return (OTMetricsSessionData *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setSessionMetrics:(id)a3
{
}

- (int)shouldSendMetricsForOctagon
{
  return self->_shouldSendMetricsForOctagon;
}

- (void)setShouldSendMetricsForOctagon:(int)a3
{
  self->_shouldSendMetricsForOctagon = a3;
}

- (CKKSKeychainView)ckks
{
  return (CKKSKeychainView *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setCkks:(id)a3
{
}

- (CKKSCloudKitAccountStateTrackingProvider)accountStateTracker
{
  return (CKKSCloudKitAccountStateTrackingProvider *)objc_getProperty(self, a2, 208LL, 1);
}

- (OTDeviceInformationAdapter)deviceAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 216LL, 1);
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 224LL, 1);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 232LL, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 240LL, 1);
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 248LL, 1);
}

- (OTTooManyPeersAdapter)tooManyPeersAdapter
{
  return (OTTooManyPeersAdapter *)objc_getProperty(self, a2, 256LL, 1);
}

- (OTTapToRadarAdapter)tapToRadarAdapter
{
  return (OTTapToRadarAdapter *)objc_getProperty(self, a2, 264LL, 1);
}

- (CKKSCondition)pendingEscrowCacheWarmup
{
  return (CKKSCondition *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setPendingEscrowCacheWarmup:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (TPPolicyVersion)policyOverride
{
  return (TPPolicyVersion *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setPolicyOverride:(id)a3
{
}

- (SecLaunchSequence)launchSequence
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setLaunchSequence:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (CKAccountInfo)cloudKitAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setCloudKitAccountInfo:(id)a3
{
}

- (CKKSCondition)cloudKitAccountStateKnown
{
  return (CKKSCondition *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setCloudKitAccountStateKnown:(id)a3
{
}

- (CKKSNearFutureScheduler)suggestTLKUploadNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setSuggestTLKUploadNotifier:(id)a3
{
}

- (CKKSNearFutureScheduler)requestPolicyCheckNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setRequestPolicyCheckNotifier:(id)a3
{
}

- (CKKSNearFutureScheduler)upgradeUserControllableViewsRateLimiter
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setUpgradeUserControllableViewsRateLimiter:(id)a3
{
}

- (CKKSNearFutureScheduler)fixupRetryScheduler
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setFixupRetryScheduler:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
}

- (OTCustodianRecoveryKey)custodianRecoveryKey
{
  return self->_custodianRecoveryKey;
}

- (void)setCustodianRecoveryKey:(id)a3
{
}

- (OTInheritanceKey)inheritanceKey
{
  return self->_inheritanceKey;
}

- (void)setInheritanceKey:(id)a3
{
}

- (OctagonAPSReceiver)apsReceiver
{
  return (OctagonAPSReceiver *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setApsReceiver:(id)a3
{
}

- (CKKSPeerProvider)octagonAdapter
{
  return (CKKSPeerProvider *)objc_getProperty(self, a2, 400LL, 1);
}

- (void)setOctagonAdapter:(id)a3
{
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 408LL, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 416LL, 1);
}

- (BOOL)initialBecomeUntrustedPosted
{
  return self->_initialBecomeUntrustedPosted;
}

- (void)setInitialBecomeUntrustedPosted:(BOOL)a3
{
  self->_initialBecomeUntrustedPosted = a3;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (void)setMachineID:(id)a3
{
}

- (OTAccountSettings)accountSettings
{
  return (OTAccountSettings *)objc_getProperty(self, a2, 432LL, 1);
}

- (void)setAccountSettings:(id)a3
{
}

- (void).cxx_destruct
{
}

@end