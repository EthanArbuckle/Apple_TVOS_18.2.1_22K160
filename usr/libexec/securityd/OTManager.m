@interface OTManager
+ (id)makeCKContainer:(id)a3;
+ (id)manager;
+ (id)resetManager:(BOOL)a3 to:(id)a4;
- (BOOL)allContextsPause:(unint64_t)a3;
- (BOOL)fetchSendingMetricsPermitted:(id)a3 error:(id *)a4;
- (BOOL)ghostbustByAgeEnabled;
- (BOOL)ghostbustByMidEnabled;
- (BOOL)ghostbustBySerialEnabled;
- (BOOL)isFullPeer;
- (BOOL)persistSendingMetricsPermitted:(id)a3 sendingMetricsPermitted:(BOOL)a4 error:(id *)a5;
- (BOOL)sosEnabledForPlatform;
- (BOOL)waitForReady:(id)a3 wait:(int64_t)a4;
- (CKContainer)cloudKitContainer;
- (CKKSAccountStateTracker)accountStateTracker;
- (CKKSCloudKitClassDependencies)cloudKitClassDependencies;
- (CKKSLockStateTracker)lockStateTracker;
- (CKKSNearFutureScheduler)savedTLKNotifier;
- (CKKSReachabilityTracker)reachabilityTracker;
- (CKKSViewManager)viewManager;
- (Class)apsConnectionClass;
- (Class)escrowRequestClass;
- (Class)loggerClass;
- (Class)notifierClass;
- (NSMutableDictionary)contexts;
- (NSXPCListener)listener;
- (NSXPCProxyCreating)cuttlefishXPCConnection;
- (OS_dispatch_queue)queue;
- (OTAccountsAdapter)accountsAdapter;
- (OTAuthKitAdapter)authKitAdapter;
- (OTDeviceInformationAdapter)deviceInformationAdapter;
- (OTManager)init;
- (OTManager)initWithSOSAdapter:(id)a3 accountsAdapter:(id)a4 authKitAdapter:(id)a5 tooManyPeersAdapter:(id)a6 tapToRadarAdapter:(id)a7 deviceInformationAdapter:(id)a8 personaAdapter:(id)a9 apsConnectionClass:(Class)a10 escrowRequestClass:(Class)a11 notifierClass:(Class)a12 loggerClass:(Class)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 cloudKitClassDependencies:(id)a16 cuttlefishXPCConnection:(id)a17 cdpd:(id)a18;
- (OTManager)initWithSOSAdapter:(id)a3 lockStateTracker:(id)a4 personaAdapter:(id)a5 cloudKitClassDependencies:(id)a6;
- (OTPersonaAdapter)personaAdapter;
- (OTRamp)gbAgeRamp;
- (OTRamp)gbmidRamp;
- (OTRamp)gbserialRamp;
- (OTSOSAdapter)sosAdapter;
- (OTTapToRadarAdapter)tapToRadarAdapter;
- (OTTooManyPeersAdapter)tooManyPeersAdapter;
- (OctagonFollowUpControllerProtocol)cdpd;
- (id)cdpContextTypes;
- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4 possibleAccount:(id)a5;
- (id)ckksForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6;
- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6;
- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5;
- (id)contextForClientRPC:(id)a3 error:(id *)a4;
- (id)contextForClientRPCWithActiveAccount:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6;
- (id)contextForContainerName:(id)a3 contextID:(id)a4;
- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5;
- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5 createIfMissing:(BOOL)a6 sosAdapter:(id)a7 accountsAdapter:(id)a8 authKitAdapter:(id)a9 tooManyPeersAdapter:(id)a10 tapToRadarAdapter:(id)a11 lockStateTracker:(id)a12 deviceInformationAdapter:(id)a13;
- (id)contextForContainerName:(id)a3 contextID:(id)a4 sosAdapter:(id)a5 accountsAdapter:(id)a6 authKitAdapter:(id)a7 tooManyPeersAdapter:(id)a8 tapToRadarAdapter:(id)a9 lockStateTracker:(id)a10 deviceInformationAdapter:(id)a11;
- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3;
- (id)restartOctagonContext:(id)a3;
- (void)allContextsDisablePendingFlags;
- (void)allContextsHalt;
- (void)appleAccountSignedIn:(id)a3 reply:(id)a4;
- (void)appleAccountSignedOut:(id)a3 reply:(id)a4;
- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4;
- (void)cancelPendingOperations;
- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)clearAllContexts;
- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6;
- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7;
- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)dropAllActors;
- (void)ensureRampsInitialized;
- (void)establish:(id)a3 reply:(id)a4;
- (void)fetchAccountSettings:(id)a3 reply:(id)a4;
- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5;
- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchEgoPeerID:(id)a3 reply:(id)a4;
- (void)fetchEscrowContents:(id)a3 reply:(id)a4;
- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5;
- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4;
- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4;
- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)getAccountMetadata:(id)a3 reply:(id)a4;
- (void)getCDPStatus:(id)a3 reply:(id)a4;
- (void)haltAll;
- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6;
- (void)initializeOctagon;
- (void)invalidateEscrowCache:(id)a3 reply:(id)a4;
- (void)isRecoveryKeySet:(id)a3 reply:(id)a4;
- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)leaveClique:(id)a3 reply:(id)a4;
- (void)moveToCheckTrustedStateForArguments:(id)a3;
- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4;
- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4;
- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6;
- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7;
- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5;
- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5;
- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5;
- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6;
- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4;
- (void)registerForCircleChangedNotifications;
- (void)removeContextForContainerName:(id)a3 contextID:(id)a4;
- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5;
- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5;
- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5;
- (void)removeRecoveryKey:(id)a3 reply:(id)a4;
- (void)reroll:(id)a3 reply:(id)a4;
- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7;
- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10;
- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6;
- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6;
- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7;
- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5;
- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11;
- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5;
- (void)setAccountStateTracker:(id)a3;
- (void)setCDPEnabled:(id)a3 reply:(id)a4;
- (void)setCdpd:(id)a3;
- (void)setContexts:(id)a3;
- (void)setCuttlefishXPCConnection:(id)a3;
- (void)setGbAgeRamp:(id)a3;
- (void)setGbmidRamp:(id)a3;
- (void)setGbserialRamp:(id)a3;
- (void)setListener:(id)a3;
- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5;
- (void)setLockStateTracker:(id)a3;
- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5;
- (void)setQueue:(id)a3;
- (void)setReachabilityTracker:(id)a3;
- (void)setSOSEnabledForPlatformFlag:(BOOL)a3;
- (void)setSavedTLKNotifier:(id)a3;
- (void)setSosEnabledForPlatform:(BOOL)a3;
- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5;
- (void)setViewManager:(id)a3;
- (void)setupAnalytics;
- (void)simulateReceivePush:(id)a3 reply:(id)a4;
- (void)startOctagonStateMachine:(id)a3 reply:(id)a4;
- (void)status:(id)a3 reply:(id)a4;
- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5;
- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6;
- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6;
- (void)totalTrustedPeers:(id)a3 reply:(id)a4;
- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4;
- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4;
- (void)xpc24HrNotification;
@end

@implementation OTManager

- (OTManager)init
{
  if (qword_1002DEB60 != -1) {
    dispatch_once(&qword_1002DEB60, &stru_10028EF88);
  }
  if (byte_1002DDD08) {
    v2 = -[OTSOSActualAdapter initAsEssential:](objc_alloc(&OBJC_CLASS___OTSOSActualAdapter), "initAsEssential:", 0LL);
  }
  else {
    v2 = objc_alloc_init(&OBJC_CLASS___OTSOSMissingAdapter);
  }
  v24 = v2;
  v18 = objc_alloc_init(&OBJC_CLASS___OTAccountsActualAdapter);
  v3 = objc_alloc_init(&OBJC_CLASS___OTAuthKitActualAdapter);
  v21 = objc_alloc_init(&OBJC_CLASS___OTTooManyPeersActualAdapter);
  v20 = objc_alloc_init(&OBJC_CLASS___OTTapToRadarActualAdapter);
  v19 = objc_alloc_init(&OBJC_CLASS___OTDeviceInformationActualAdapter);
  v4 = objc_alloc_init(&OBJC_CLASS___OTPersonaActualAdapter);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___APSConnection, v5);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___EscrowRequestServer, v7);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___CKKSNotifyPostNotifier, v9);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___CKKSAnalytics, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSLockStateTracker globalTracker](&OBJC_CLASS___CKKSLockStateTracker, "globalTracker"));
  v13 = objc_alloc_init(&OBJC_CLASS___CKKSReachabilityTracker);
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[CKKSCloudKitClassDependencies forLiveCloudKit]( &OBJC_CLASS___CKKSCloudKitClassDependencies,  "forLiveCloudKit"));
  id v15 = objc_alloc_init(&OBJC_CLASS___CDPFollowUpController);
  v23 = -[OTManager initWithSOSAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:deviceInformationAdapter:personaAdapter:apsConnectionClass:escrowRequestClass:notifierClass:loggerClass:lockStateTracker:reachabilityTracker:cloudKitClassDependencies:cuttlefishXPCConnection:cdpd:]( self,  "initWithSOSAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:deviceInformationAdapt er:personaAdapter:apsConnectionClass:escrowRequestClass:notifierClass:loggerClass:lockStateTracker:reachabilit yTracker:cloudKitClassDependencies:cuttlefishXPCConnection:cdpd:",  v24,  v18,  v3,  v21,  v20,  v19,  v4,  v6,  v8,  v10,  v12,  v17,  v13,  v14,  0LL,  v15);

  return v23;
}

- (OTManager)initWithSOSAdapter:(id)a3 accountsAdapter:(id)a4 authKitAdapter:(id)a5 tooManyPeersAdapter:(id)a6 tapToRadarAdapter:(id)a7 deviceInformationAdapter:(id)a8 personaAdapter:(id)a9 apsConnectionClass:(Class)a10 escrowRequestClass:(Class)a11 notifierClass:(Class)a12 loggerClass:(Class)a13 lockStateTracker:(id)a14 reachabilityTracker:(id)a15 cloudKitClassDependencies:(id)a16 cuttlefishXPCConnection:(id)a17 cdpd:(id)a18
{
  id v56 = a3;
  id v55 = a4;
  id v44 = a5;
  id v52 = a5;
  id v51 = a6;
  id v50 = a7;
  id v49 = a8;
  id v48 = a9;
  id v54 = a14;
  id v47 = a15;
  id v23 = a16;
  id v46 = a17;
  id v45 = a18;
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___OTManager;
  v24 = -[OTManager init](&v61, "init");
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_sosAdapter, a3);
    objc_storeStrong((id *)&v25->_accountsAdapter, a4);
    objc_storeStrong((id *)&v25->_authKitAdapter, v44);
    objc_storeStrong((id *)&v25->_tooManyPeersAdapter, a6);
    objc_storeStrong((id *)&v25->_tapToRadarAdapter, a7);
    objc_storeStrong((id *)&v25->_deviceInformationAdapter, a8);
    objc_storeStrong((id *)&v25->_personaAdapter, a9);
    objc_storeStrong((id *)&v25->_loggerClass, a13);
    objc_storeStrong((id *)&v25->_lockStateTracker, a14);
    objc_storeStrong((id *)&v25->_reachabilityTracker, a15);
    objc_storeStrong((id *)&v25->_cuttlefishXPCConnection, a17);
    uint64_t v26 = objc_claimAutoreleasedReturnValue( +[OTManager makeCKContainer:]( &OBJC_CLASS___OTManager,  "makeCKContainer:",  @"com.apple.security.keychain"));
    cloudKitContainer = v25->_cloudKitContainer;
    v25->_cloudKitContainer = (CKContainer *)v26;

    v28 = -[CKKSAccountStateTracker init:nsnotificationCenterClass:]( [CKKSAccountStateTracker alloc],  "init:nsnotificationCenterClass:",  v25->_cloudKitContainer,  [v23 nsnotificationCenterClass]);
    accountStateTracker = v25->_accountStateTracker;
    v25->_accountStateTracker = v28;

    objc_storeStrong((id *)&v25->_cloudKitClassDependencies, a16);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    contexts = v25->_contexts;
    v25->_contexts = (NSMutableDictionary *)v30;

    dispatch_queue_t v32 = dispatch_queue_create("otmanager", 0LL);
    queue = v25->_queue;
    v25->_queue = (OS_dispatch_queue *)v32;

    objc_storeStrong((id *)&v25->_apsConnectionClass, a10);
    objc_storeStrong((id *)&v25->_escrowRequestClass, a11);
    objc_storeStrong((id *)&v25->_notifierClass, a12);
    objc_storeStrong((id *)&v25->_cdpd, a18);
    v34 = -[CKKSViewManager initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKitClassDependencies:accountsAdapter:]( objc_alloc(&OBJC_CLASS___CKKSViewManager),  "initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKi tClassDependencies:accountsAdapter:",  v25->_cloudKitContainer,  v56,  v25->_accountStateTracker,  v54,  v25->_reachabilityTracker,  v25->_personaAdapter,  v23,  v55);
    viewManager = v25->_viewManager;
    v25->_viewManager = v34;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v25);
    v36 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472LL;
    v58[2] = sub_10004F780;
    v58[3] = &unk_100291A38;
    objc_copyWeak(&v59, &location);
    v37 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v36,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  @"newtlks",  5000000000LL,  1LL,  0LL,  v58);
    savedTLKNotifier = v25->_savedTLKNotifier;
    v25->_savedTLKNotifier = v37;

    id v39 =  -[OTManager contextForContainerName:contextID:]( v25,  "contextForContainerName:contextID:",  @"com.apple.security.keychain",  @"defaultContext");
    v40 = sub_10001267C("octagon");
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "otmanager init", buf, 2u);
    }

    objc_destroyWeak(&v59);
    objc_destroyWeak(&location);
  }

  return v25;
}

- (OTManager)initWithSOSAdapter:(id)a3 lockStateTracker:(id)a4 personaAdapter:(id)a5 cloudKitClassDependencies:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v45.receiver = self;
  v45.super_class = (Class)&OBJC_CLASS___OTManager;
  id v15 = -[OTManager init](&v45, "init");
  v16 = v15;
  if (v15)
  {
    id v41 = v13;
    objc_storeStrong((id *)&v15->_sosAdapter, a3);
    objc_storeStrong((id *)&v16->_lockStateTracker, a4);
    objc_storeStrong((id *)&v16->_personaAdapter, a5);
    objc_storeStrong((id *)&v16->_cloudKitClassDependencies, a6);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    contexts = v16->_contexts;
    v16->_contexts = (NSMutableDictionary *)v17;

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[OTManager makeCKContainer:]( &OBJC_CLASS___OTManager,  "makeCKContainer:",  @"com.apple.security.keychain"));
    cloudKitContainer = v16->_cloudKitContainer;
    v16->_cloudKitContainer = (CKContainer *)v19;

    v21 = -[CKKSAccountStateTracker init:nsnotificationCenterClass:]( [CKKSAccountStateTracker alloc],  "init:nsnotificationCenterClass:",  v16->_cloudKitContainer,  [v14 nsnotificationCenterClass]);
    accountStateTracker = v16->_accountStateTracker;
    v16->_accountStateTracker = v21;

    id v23 = objc_alloc_init(&OBJC_CLASS___CKKSReachabilityTracker);
    reachabilityTracker = v16->_reachabilityTracker;
    v16->_reachabilityTracker = v23;

    uint64_t v25 = objc_claimAutoreleasedReturnValue([v14 notifierClass]);
    Class notifierClass = v16->_notifierClass;
    v16->_Class notifierClass = (Class)v25;

    v27 = objc_alloc(&OBJC_CLASS___CKKSViewManager);
    v29 = v16->_reachabilityTracker;
    v28 = v16->_cloudKitContainer;
    uint64_t v30 = v16->_accountStateTracker;
    personaAdapter = v16->_personaAdapter;
    dispatch_queue_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](v16, "accountsAdapter"));
    v33 = -[CKKSViewManager initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKitClassDependencies:accountsAdapter:]( v27,  "initWithContainer:sosAdapter:accountStateTracker:lockStateTracker:reachabilityTracker:personaAdapter:cloudKi tClassDependencies:accountsAdapter:",  v28,  v11,  v30,  v12,  v29,  personaAdapter,  v14,  v32);
    viewManager = v16->_viewManager;
    v16->_viewManager = v33;

    dispatch_queue_t v35 = dispatch_queue_create("otmanager", 0LL);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v35;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v16);
    v37 = objc_alloc(&OBJC_CLASS___CKKSNearFutureScheduler);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472LL;
    v42[2] = sub_10004F73C;
    v42[3] = &unk_100291A38;
    objc_copyWeak(&v43, &location);
    v38 = -[CKKSNearFutureScheduler initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:]( v37,  "initWithName:delay:keepProcessAlive:dependencyDescriptionCode:block:",  @"newtlks",  5000000000LL,  1LL,  0LL,  v42);
    savedTLKNotifier = v16->_savedTLKNotifier;
    v16->_savedTLKNotifier = v38;

    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
    id v13 = v41;
  }

  return v16;
}

- (void)initializeOctagon
{
  v3 = sub_10001267C("octagon");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing Octagon...", buf, 2u);
  }

  uint64_t v5 = sub_10001267C("octagon");
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "starting default state machine...", buf, 2u);
  }

  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 inflateAllTPSpecificUsers:@"com.apple.security.keychain" octagonContextID:@"defaultContext"]);

    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v10)
    {
      id v12 = v10;
      uint64_t v13 = *(void *)v26;
      *(void *)&__int128 v11 = 138412290LL;
      __int128 v23 = v11;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)i);
          id v24 = 0LL;
          v16 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:]( self,  "contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:",  v15,  1LL,  1LL,  &v24,  v23));
          id v17 = v24;
          v18 = sub_10001267C("octagon");
          uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          if (v16) {
            BOOL v21 = v17 == 0LL;
          }
          else {
            BOOL v21 = 0;
          }
          if (v21)
          {
            if (v20)
            {
              *(_DWORD *)buf = v23;
              uint64_t v30 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "kicking off state machine for active account: %@",  buf,  0xCu);
            }

            [v16 startOctagonStateMachine];
          }

          else
          {
            if (v20)
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v30 = v15;
              __int16 v31 = 2112;
              id v32 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "failed to get context for active account: %@, error:%@",  buf,  0x16u);
            }
          }
        }

        id v12 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }

      while (v12);
    }
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForContainerName:contextID:]( self,  "contextForContainerName:contextID:",  @"com.apple.security.keychain",  @"defaultContext"));
  [v22 startOctagonStateMachine];
  -[OTManager registerForCircleChangedNotifications](self, "registerForCircleChangedNotifications");
}

- (BOOL)waitForReady:(id)a3 wait:(int64_t)a4
{
  id v11 = 0LL;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPC:createIfMissing:error:]( self,  "contextForClientRPC:createIfMissing:error:",  a3,  0LL,  &v11));
  id v6 = v11;
  if (v5)
  {
    unsigned __int8 v7 = [v5 waitForReady:a4];
  }

  else
  {
    uint64_t v8 = sub_10001267C("octagon");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cannot wait for ready: %@", buf, 0xCu);
    }

    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)moveToCheckTrustedStateForArguments:(id)a3
{
  id v7 = 0LL;
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPC:createIfMissing:error:]( self,  "contextForClientRPC:createIfMissing:error:",  a3,  0LL,  &v7));
  id v4 = v7;
  if (v4)
  {
    uint64_t v5 = sub_10001267C("octagon");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Cannot move to check trusted state: %@",  buf,  0xCu);
    }
  }

  [v3 startOctagonStateMachine];
  [v3 moveToCheckTrustedState];
}

- (void)registerForCircleChangedNotifications
{
  if (-[OTSOSActualAdapter sosEnabled]_0((uint64_t)self, (uint64_t)a2))
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    int out_token = -1;
    v3 = (const char *)kSOSCCCircleChangedNotification;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(17LL, 0LL);
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_10004F69C;
    handler[3] = &unk_1002913A0;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch(v3, &out_token, v5, handler);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }

- (void)ensureRampsInitialized
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  id v24 = (id)objc_claimAutoreleasedReturnValue([v3 container]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v24 privateCloudDatabase]);
  uint64_t v5 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"metadata_zone",  CKCurrentUserDefaultName);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accountTracker]);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 reachabilityTracker]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSViewManager manager](&OBJC_CLASS___CKKSViewManager, "manager"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 lockStateTracker]);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbmidRamp](self, "gbmidRamp"));
  if (!v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___OTRamp);
    uint64_t v15 = -[OTRamp initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:]( v13,  "initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTr acker:fetchRecordRecordsOperationClass:",  @"metadata_rampstate_ghostBustMID",  @"ghostBustMID",  v24,  v4,  v5,  v7,  v11,  v9,  objc_opt_class(&OBJC_CLASS___CKFetchRecordsOperation, v14));
    -[OTManager setGbmidRamp:](self, "setGbmidRamp:", v15);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbserialRamp](self, "gbserialRamp"));

  if (!v16)
  {
    id v17 = objc_alloc(&OBJC_CLASS___OTRamp);
    uint64_t v19 = -[OTRamp initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:]( v17,  "initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTr acker:fetchRecordRecordsOperationClass:",  @"metadata_rampstate_ghostBustSerial",  @"ghostBustSerial",  v24,  v4,  v5,  v7,  v11,  v9,  objc_opt_class(&OBJC_CLASS___CKFetchRecordsOperation, v18));
    -[OTManager setGbserialRamp:](self, "setGbserialRamp:", v19);
  }

  BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbAgeRamp](self, "gbAgeRamp"));

  if (!v20)
  {
    BOOL v21 = objc_alloc(&OBJC_CLASS___OTRamp);
    __int128 v23 = -[OTRamp initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTracker:fetchRecordRecordsOperationClass:]( v21,  "initWithRecordName:localSettingName:container:database:zoneID:accountTracker:lockStateTracker:reachabilityTr acker:fetchRecordRecordsOperationClass:",  @"metadata_rampstate_ghostBustAge",  @"ghostBustAge",  v24,  v4,  v5,  v7,  v11,  v9,  objc_opt_class(&OBJC_CLASS___CKFetchRecordsOperation, v22));
    -[OTManager setGbAgeRamp:](self, "setGbAgeRamp:", v23);
  }
}

- (void)appleAccountSignedIn:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v21 = 0LL;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v21));
  id v9 = v21;
  id v10 = v9;
  if (!v8 || v9)
  {
    uint64_t v18 = sub_10001267C("octagon");
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      __int128 v25 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Rejecting a signin RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityAccountAvailable"]);

    id v13 = sub_10001267C("octagon");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
      *(_DWORD *)buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      __int128 v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "signing in %@ for altDSID: %@", buf, 0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    id v20 = 0LL;
    [v8 accountAvailable:v16 error:&v20];
    id v17 = v20;

    [v12 stopWithEvent:@"OctagonEventSignIn" result:v17];
    v7[2](v7, v17);

    id v7 = (void (**)(id, void *))v12;
  }
}

- (void)appleAccountSignedOut:(id)a3 reply:(id)a4
{
  id v5 = a3;
  uint64_t v30 = (void (**)(id, void))a4;
  id v32 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);

  if (v6)
  {
    id v7 = sub_10001267C("octagon");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "signing out of octagon trust: %@",  (uint8_t *)&buf,  0xCu);
    }

    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000LL;
    id v43 = sub_10004EF38;
    id v44 = sub_10004EF48;
    id v45 = 0LL;
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004F648;
    block[3] = &unk_1002916D0;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync(v9, block);

    __int128 v35 = 0u;
    __int128 v36 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    id v10 = *(id *)(*((void *)&buf + 1) + 40LL);
    id v11 = [v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v11)
    {
      char v12 = 0;
      uint64_t v13 = *(void *)v34;
      do
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v32 altDSID]);
          id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 activeAccount]);
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 altDSID]);
          unsigned int v19 = [v16 isEqualToString:v18];

          if (v19)
          {
            id v20 = sub_10001267C("octagon");
            id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v38 = 138412290;
              id v39 = v15;
              _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "signing out of octagon trust for context: %@",  v38,  0xCu);
            }

            uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
            id v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 startLogSystemMetricsForActivityNamed:@"OctagonActivityAccountNotAvailable"]);

            [v15 accountNoLongerAvailable];
            [v23 stopWithEvent:@"OctagonEventSignOut" result:0];

            char v12 = 1;
          }
        }

        id v11 = [v10 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }

      while (v11);

      if ((v12 & 1) != 0)
      {
        v30[2](v30, 0LL);
LABEL_24:
        _Block_object_dispose(&buf, 8);

        goto LABEL_25;
      }
    }

    else
    {
    }

    __int128 v27 = sub_10001267C("octagon");
    __int128 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v38 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Failed to find a context to sign out.",  v38,  2u);
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  31LL,  @"Couldn't find a context with this altDSID"));
    ((void (**)(id, void *))v30)[2](v30, v29);

    goto LABEL_24;
  }

  __int16 v24 = sub_10001267C("octagon-account");
  __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "rejecting a signout RPC due to missing altDSID: %@",  (uint8_t *)&buf,  0xCu);
  }

  __int128 v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  29LL,  @"Must provide an altDSID to sign out"));
  ((void (**)(id, void *))v30)[2](v30, v26);

LABEL_25:
}

- (void)notifyIDMSTrustLevelChangeForAltDSID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v15 = 0LL;
  id v7 = (void (**)(id, id))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  id v9 = v15;
  id v10 = sub_10001267C("octagon");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rejecting a IDMS trust level change RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v9);
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "received a notification of IDMS trust level change in %@",  buf,  0xCu);
    }

    id v14 = 0LL;
    [v8 idmsTrustLevelChanged:&v14];
    id v13 = v14;
    v7[2](v7, v13);

    id v7 = (void (**)(id, id))v13;
  }
}

- (void)setCuttlefishXPCConnection:(id)a3
{
}

- (NSXPCProxyCreating)cuttlefishXPCConnection
{
  cuttlefishXPCConnection = self->_cuttlefishXPCConnection;
  if (!cuttlefishXPCConnection)
  {
    id v44 = self;
    id v43 = -[NSXPCConnection initWithServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithServiceName:",  @"com.apple.TrustedPeersHelper");
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TrustedPeersHelperProtocol));
    if (qword_1002DED10 != -1) {
      dispatch_once(&qword_1002DED10, &stru_100291260);
    }
    v64[0] = objc_opt_class(&OBJC_CLASS___NSArray, v4);
    v64[1] = objc_opt_class(&OBJC_CLASS___CKKSKeychainBackedKeySet, v6);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 2LL));
    id v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));

    v63[0] = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    v63[1] = objc_opt_class(&OBJC_CLASS___CKKSTLKShare, v9);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v63, 2LL));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v10));

    v62[0] = objc_opt_class(&OBJC_CLASS___NSArray, v12);
    v62[1] = objc_opt_class(&OBJC_CLASS___CKRecord, v13);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v62, 2LL));
    id v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v14));

    v16 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___TrustedPeersHelperPeerState, v15));
    id v52 = (void *)objc_claimAutoreleasedReturnValue(v16);
    __int16 v18 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___TrustedPeersHelperCustodianRecoveryKey, v17));
    v53 = (void *)objc_claimAutoreleasedReturnValue(v18);
    id v20 = +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  objc_opt_class(&OBJC_CLASS___TrustedPeersHelperHealthCheckResult, v19));
    id v50 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v61[0] = objc_opt_class(&OBJC_CLASS___NSArray, v21);
    v61[1] = objc_opt_class(&OBJC_CLASS___TrustedPeersHelperPeer, v22);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v61, 2LL));
    id v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v23));

    v60[0] = objc_opt_class(&OBJC_CLASS___NSArray, v24);
    v60[1] = objc_opt_class(&OBJC_CLASS___NSDictionary, v25);
    v60[2] = objc_opt_class(&OBJC_CLASS___NSString, v26);
    v60[3] = objc_opt_class(&OBJC_CLASS___TPPBPeerStableInfoSetting, v27);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v60, 4LL));
    id v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));

    v59[0] = objc_opt_class(&OBJC_CLASS___NSArray, v29);
    v59[1] = objc_opt_class(&OBJC_CLASS___CuttlefishPCSServiceIdentifier, v30);
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v59, 2LL));
    id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v31));

    v58[0] = objc_opt_class(&OBJC_CLASS___NSArray, v32);
    v58[1] = objc_opt_class(&OBJC_CLASS___CuttlefishPCSIdentity, v33);
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v58, 2LL));
    id v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v34));

    v57[0] = objc_opt_class(&OBJC_CLASS___NSArray, v35);
    v57[1] = objc_opt_class(&OBJC_CLASS___CuttlefishCurrentItemSpecifier, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v57, 2LL));
    id v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v37));

    v56[0] = objc_opt_class(&OBJC_CLASS___NSArray, v38);
    v56[1] = objc_opt_class(&OBJC_CLASS___CuttlefishCurrentItem, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v56, 2LL));
    id v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v40));

    [v5 setClasses:qword_1002DED08 forSelector:"honorIDMSListChangesForSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"dumpWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"octagonPeerIDGivenBottleIDWithSpecificUser:bottleID:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"trustedDeviceNamesByPeerIDWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"departByDistrustingSelfWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"distrustPeerIDsWithSpecificUser:peerIDs:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"dropPeerIDsWithSpecificUser:peerIDs:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"trustStatusWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"resetWithSpecificUser:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount: isGuitarfish:accountType:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"localResetWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"setAllowedMachineIDsWithSpecificUser:allowedMachineIDs:userInitiatedRemovals:evictedRemovals:unknownReasonRemovals :honorIDMSListChanges:version:flowID:deviceSessionID:canSendMetrics:altDSID:trustedDeviceHash:deletedDeviceHash:tr ustedDevicesUpdateTimestamp:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"markTrustedDeviceListFetchFailed:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchAllowedMachineIDsWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchEgoEpochWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"prepareWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersion:policyVersio n:policySecrets:syncUserControllableViews:secureElementIdentity:setting:signingPrivKeyPersistentRef:encPrivKeyPers istentRef:reply:" argumentIndex:6 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:3 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"preflightVouchWithBottleWithSpecificUser:bottleID:reply:" argumentIndex:3 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"preflightVouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:reply:" argumentIndex:2 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:3 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"preflightPreapprovedJoinWithSpecificUser:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:3 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"setPreapprovedKeysWithSpecificUser:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"fetchViableBottlesWithSpecificUser:source:flowID:deviceSessionID:reply:" argumentIndex:2 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchViableEscrowRecordsWithSpecificUser:source:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchEscrowContentsWithSpecificUser:reply:" argumentIndex:3 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchPolicyDocumentsWithSpecificUser:versions:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchCurrentPolicyWithSpecificUser:modelIDOverride:isInheritedAccount:reply:" argumentIndex:2 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:2 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"removeCustodianRecoveryKeyWithSpecificUser:uuid:reply:" argumentIndex:0 ofReply:1];
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", qword_1002DED08);
    [v5 setClasses:qword_1002DED08 forSelector:"getSupportAppInfoWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"resetAccountCDPContentsWithSpecificUser:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:internalAccount:demoAccount:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"removeEscrowCacheWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"fetchAccountSettingsWithSpecificUser:forceFetch:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"isRecoveryKeySet:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:qword_1002DED08 forSelector:"testSemaphoreWithSpecificUser:arg:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v51 forSelector:"fetchAccountSettingsWithSpecificUser:forceFetch:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v55 forSelector:"fetchRecoverableTLKSharesWithSpecificUser:peerID:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v54 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v11 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:2 ofReply:0];
    [v5 setClasses:v55 forSelector:"establishWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:v54 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:3 ofReply:0];
    [v5 setClasses:v11 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:4 ofReply:0];
    [v5 setClasses:v55 forSelector:"joinWithSpecificUser:voucherData:voucherSig:ckksKeys:tlkShares:preapprovedKeys:flowID:deviceSessionID:canSendMetrics:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:v54 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v11 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:2 ofReply:0];
    [v5 setClasses:v55 forSelector:"attemptPreapprovedJoinWithSpecificUser:ckksKeys:tlkShares:preapprovedKeys:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:v54 forSelector:"vouchWithSpecificUser:peerID:permanentInfo:permanentInfoSig:stableInfo:stableInfoSig:ckksKeys:flowID:deviceSession ID:canSendMetrics:reply:" argumentIndex:6 ofReply:0];
    [v5 setClasses:v11 forSelector:"vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:" argumentIndex:4 ofReply:0];
    [v5 setClasses:v11 forSelector:"vouchWithBottleWithSpecificUser:bottleID:entropy:bottleSalt:tlkShares:reply:" argumentIndex:2 ofReply:1];
    [v5 setClasses:v54 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:3 ofReply:0];
    [v5 setClasses:v55 forSelector:"setRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v54 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:3 ofReply:0];
    [v5 setClasses:v55 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v11 forSelector:"vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:" argumentIndex:3 ofReply:0];
    [v5 setClasses:v11 forSelector:"vouchWithRecoveryKeyWithSpecificUser:recoveryKey:salt:tlkShares:reply:" argumentIndex:2 ofReply:1];
    [v5 setClasses:v11 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v5 setClasses:v11 forSelector:"vouchWithRerollWithSpecificUser:oldPeerID:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v5 setClasses:v55 forSelector:"prepareInheritancePeerWithSpecificUser:epoch:machineID:bottleSalt:bottleID:modelID:deviceName:serialNumber:osVersi on:policyVersion:policySecrets:syncUserControllableViews:secureElementIdentity:signingPrivKeyPersistentRef:encPriv KeyPersistentRef:crk:reply:" argumentIndex:7 ofReply:1];
    [v5 setClasses:v11 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:1];
    [v5 setClasses:v11 forSelector:"recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v5 setClasses:v11 forSelector:"recoverTLKSharesForInheritorWithSpecificUser:crk:tlkShares:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v53 forSelector:"createCustodianRecoveryKeyWithSpecificUser:recoveryKey:salt:ckksKeys:uuid:kind:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:v53 forSelector:"preflightVouchWithCustodianRecoveryKeyWithSpecificUser:crk:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v53 forSelector:"vouchWithCustodianRecoveryKeyWithSpecificUser:crk:tlkShares:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v53 forSelector:"findCustodianRecoveryKeyWithSpecificUser:uuid:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v50 forSelector:"requestHealthCheckWithSpecificUser:requiresEscrowCheck:repair:knownFederations:flowID:deviceSessionID:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v52 forSelector:"updateWithSpecificUser:forceRefetch:deviceName:serialNumber:osVersion:policyVersion:policySecrets:syncUserControll ableViews:secureElementIdentity:walrusSetting:webAccess:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v52 forSelector:"fetchTrustStateWithSpecificUser:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v49 forSelector:"fetchTrustStateWithSpecificUser:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:v54 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v11 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:2 ofReply:0];
    [v5 setClasses:v55 forSelector:"updateTLKsWithSpecificUser:ckksKeys:tlkShares:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v46 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v45 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v55 forSelector:"fetchCurrentItemWithSpecificUser:items:reply:" argumentIndex:1 ofReply:1];
    [v5 setClasses:v48 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:1 ofReply:0];
    [v5 setClasses:v47 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:0 ofReply:1];
    [v5 setClasses:v55 forSelector:"fetchPCSIdentityByPublicKeyWithSpecificUser:pcsservices:reply:" argumentIndex:1 ofReply:1];

    -[NSXPCConnection setRemoteObjectInterface:](v43, "setRemoteObjectInterface:", v5);
    -[NSXPCConnection resume](v43, "resume");
    id v41 = v44->_cuttlefishXPCConnection;
    v44->_cuttlefishXPCConnection = (NSXPCProxyCreating *)v43;

    cuttlefishXPCConnection = v44->_cuttlefishXPCConnection;
  }

  return cuttlefishXPCConnection;
}

- (void)removeContextForContainerName:(id)a3 contextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F578;
  block[3] = &unk_100290578;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (id)ckksAccountSyncForContainer:(id)a3 contextID:(id)a4 possibleAccount:(id)a5
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForContainerName:contextID:possibleAccount:]( self,  "contextForContainerName:contextID:possibleAccount:",  a3,  a4,  a5));
  if (!v5)
  {
    id v6 = sub_10001267C("octagon");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No context for container/contextID", v10, 2u);
    }
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v5 ckks]);

  return v8;
}

- (id)restartOctagonContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 ckks]);
  id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 viewAllowList]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 containerName]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v4 contextID]);

  uint64_t v21 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 operationDependencies]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 activeAccount]);

  -[OTManager removeContextForContainerName:contextID:](self, "removeContextForContainerName:contextID:", v6, v19);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager sosAdapter](self, "sosAdapter"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager authKitAdapter](self, "authKitAdapter"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tapToRadarAdapter](self, "tapToRadarAdapter"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager lockStateTracker](self, "lockStateTracker"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:]( self,  "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKit Adapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:",  v6,  v19,  v8,  1LL,  v9,  v10,  v11,  v12,  v13,  v14,  v15));

  if (v20)
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 ckks]);
    [v17 setSyncingViewsAllowList:v20];
  }

  return v16;
}

- (id)restartCKKSAccountSyncWithoutSettingPolicy:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0LL;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  uint64_t v17 = sub_10004EF38;
  __int16 v18 = sub_10004EF48;
  id v19 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004F360;
  block[3] = &unk_1002912B8;
  void block[4] = self;
  id v6 = v4;
  id v12 = v6;
  id v13 = &v14;
  dispatch_sync(v5, block);

  if (v15[5])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager restartOctagonContext:](self, "restartOctagonContext:"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 ckks]);
  }

  else
  {
    id v9 = sub_1000AA6AC(@"ckkstests", 0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "Could not find a parent OTCuttlefishContext for view: %@",  buf,  0xCu);
    }

    uint64_t v8 = 0LL;
  }

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)haltAll
{
}

- (void)dropAllActors
{
}

- (void)cancelPendingOperations
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[OTManager savedTLKNotifier](self, "savedTLKNotifier"));
  [v2 cancel];
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 sosAdapter:(id)a5 accountsAdapter:(id)a6 authKitAdapter:(id)a7 tooManyPeersAdapter:(id)a8 tapToRadarAdapter:(id)a9 lockStateTracker:(id)a10 deviceInformationAdapter:(id)a11
{
  return -[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:]( self,  "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:t ooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:",  a3,  a4,  0LL,  1LL,  a5,  a6,  a7,  a8,  a9,  a10,  a11);
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5 createIfMissing:(BOOL)a6 sosAdapter:(id)a7 accountsAdapter:(id)a8 authKitAdapter:(id)a9 tooManyPeersAdapter:(id)a10 tapToRadarAdapter:(id)a11 lockStateTracker:(id)a12 deviceInformationAdapter:(id)a13
{
  __int16 v18 = (__CFString *)a3;
  id v41 = a4;
  id v40 = a5;
  id v39 = a7;
  id v19 = a8;
  id v35 = a9;
  id v33 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  uint64_t v57 = 0LL;
  v58 = &v57;
  uint64_t v59 = 0x3032000000LL;
  v60 = sub_10004EF38;
  objc_super v61 = sub_10004EF48;
  id v62 = 0LL;
  if (!v18)
  {
    __int16 v18 = @"com.apple.security.keychain";
    id v23 = @"com.apple.security.keychain";
  }

  queue = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004EF50;
  block[3] = &unk_100283EB0;
  id v44 = v18;
  id v45 = v41;
  BOOL v56 = a6;
  id v46 = self;
  id v47 = v40;
  id v48 = v19;
  id v49 = v39;
  id v50 = v35;
  id v51 = v33;
  id v52 = v20;
  id v53 = v21;
  id v54 = v22;
  id v55 = &v57;
  id v38 = v22;
  id v32 = v21;
  id v31 = v20;
  id v34 = v33;
  id v36 = v35;
  id v24 = v39;
  id v25 = v19;
  id v26 = v40;
  id v27 = v41;
  __int128 v28 = v18;
  dispatch_sync(queue, block);

  id v29 = (id)v58[5];
  _Block_object_dispose(&v57, 8);

  return v29;
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4 possibleAccount:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager sosAdapter](self, "sosAdapter"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager authKitAdapter](self, "authKitAdapter"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tapToRadarAdapter](self, "tapToRadarAdapter"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager lockStateTracker](self, "lockStateTracker"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:]( self,  "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKit Adapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:",  v10,  v9,  v8,  1LL,  v19,  v18,  v11,  v12,  v13,  v14,  v15));

  return v16;
}

- (id)contextForContainerName:(id)a3 contextID:(id)a4
{
  return -[OTManager contextForContainerName:contextID:possibleAccount:]( self,  "contextForContainerName:contextID:possibleAccount:",  a3,  a4,  0LL);
}

- (id)contextForClientRPC:(id)a3 error:(id *)a4
{
  return -[OTManager contextForClientRPC:createIfMissing:error:]( self,  "contextForClientRPC:createIfMissing:error:",  a3,  1LL,  a4);
}

- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  unsigned __int8 v10 = [v9 currentThreadIsForPrimaryiCloudAccount];

  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68) {
    char v11 = 1;
  }
  else {
    char v11 = v10;
  }
  if ((v11 & 1) != 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:]( self,  "contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:",  v8,  v6,  byte_1002DEB68 != 0,  a5));
  }

  else
  {
    id v13 = sub_10001267C("octagon");
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting client RPC for non-primary persona",  v16,  2u);
    }

    id v12 = 0LL;
    if (a5) {
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  29LL,  @"Octagon APIs do not support non-primary users"));
    }
  }

  return v12;
}

- (id)contextForClientRPCWithActiveAccount:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  BOOL v29 = a4;
  id v7 = a3;
  if (qword_1002DEB70 != -1) {
    dispatch_once(&qword_1002DEB70, &stru_10028EFA8);
  }
  if (byte_1002DEB68 || ([v7 isPrimaryAccount] & 1) == 0)
  {
    id v8 = sub_10001267C("octagon-account");
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Finding a context for user: %@", buf, 0xCu);
    }
  }

  __int128 v28 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudkitContainerName]);
  id v10 = v7;
  char v11 = (void *)objc_claimAutoreleasedReturnValue([v7 octagonContextID]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager sosAdapter](self, "sosAdapter"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager authKitAdapter](self, "authKitAdapter"));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tooManyPeersAdapter](self, "tooManyPeersAdapter"));
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager tapToRadarAdapter](self, "tapToRadarAdapter"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager lockStateTracker](self, "lockStateTracker"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  id v31 = v10;
  id v19 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKitAdapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:]( self,  "contextForContainerName:contextID:possibleAccount:createIfMissing:sosAdapter:accountsAdapter:authKit Adapter:tooManyPeersAdapter:tapToRadarAdapter:lockStateTracker:deviceInformationAdapter:",  v28,  v11,  v10,  v29,  v12,  v13,  v14,  v15,  v16,  v17,  v18));

  if (a6 && !v19) {
    *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  31LL,  @"Context does not exist"));
  }
  uint64_t v20 = objc_claimAutoreleasedReturnValue([v19 activeAccount]);
  if (v20)
  {
    id v21 = (void *)v20;
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v19 activeAccount]);
    unsigned __int8 v23 = [v22 isEqual:v31];

    if ((v23 & 1) == 0)
    {
      id v24 = sub_10001267C("octagon-account");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v19 activeAccount]);
        *(_DWORD *)__int128 buf = 138412546;
        id v33 = v31;
        __int16 v34 = 2112;
        id v35 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Context for user(%@) is for user(%@) instead",  buf,  0x16u);
      }
    }
  }

  return v19;
}

- (id)contextForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  unsigned int v12 = [v11 currentThreadIsForPrimaryiCloudAccount];

  if (MGGetSInt32Answer(@"DeviceClassNumber", 0xFFFFFFFFLL) != 7)
  {
    BOOL v40 = v8;
    BOOL v41 = v7;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager accountsAdapter](self, "accountsAdapter"));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 containerName]);
    uint64_t v42 = v10;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v10 contextID]);
    id v43 = 0LL;
    id v21 = (void *)objc_claimAutoreleasedReturnValue( [v16 findAccountForCurrentThread:v17 optionalAltDSID:v18 cloudkitContainerName:v19 octagonContextID:v20 error:&v43]);
    id v22 = v43;

    unsigned __int8 v23 = v21;
    if (v21 && !v22)
    {
      if (v41 || ([v21 isPrimaryAccount] & 1) != 0)
      {
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:]( self,  "contextForClientRPCWithActiveAccount:createIfMissing:allowNonPrimaryAccounts:error:",  v21,  v40,  v41,  a6));
        id v10 = v42;
LABEL_34:

        goto LABEL_35;
      }

      id v33 = sub_10001267C("octagon-account");
      __int16 v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      id v10 = v42;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "Rejecting finding a OTCuttlefishContext for non-primary account (on primary persona)",  buf,  2u);
      }

      if (a6)
      {
        uint64_t v15 = 0LL;
        *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  29LL,  @"Octagon APIs do not support non-primary accounts"));
        goto LABEL_34;
      }

- (id)ckksForClientRPC:(id)a3 createIfMissing:(BOOL)a4 allowNonPrimaryAccounts:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager personaAdapter](self, "personaAdapter"));
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue([v11 currentThreadPersonaUniqueString]);

  id v13 = sub_10001267C("ckkspersona");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    int v25 = 138412290;
    id v26 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "ckksForClientRPC: thread persona is %@",  (uint8_t *)&v25,  0xCu);
  }

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:]( self,  "contextForClientRPC:createIfMissing:allowNonPrimaryAccounts:error:",  v10,  v8,  v7,  a6));
  if (!v15)
  {
    if (a6)
    {
      __int16 v18 = @"Context does not exist";
      uint64_t v19 = 31LL;
LABEL_10:
      uint64_t v17 = 0LL;
      *a6 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  v19,  v18));
      goto LABEL_17;
    }

    uint64_t v20 = sub_10001267C("ckkspersona");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = 138412290;
      id v26 = v12;
      id v22 = "ckksForClientRPC: no OTCuttlefishContext found for persona %@";
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0xCu);
    }

- (void)clearAllContexts
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts"));

  if (v3)
  {
    id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[OTManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004EF08;
    block[3] = &unk_1002927F0;
    void block[4] = self;
    dispatch_sync(v4, block);
  }

- (void)fetchEgoPeerID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, id))a4;
  id v15 = 0LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  id v9 = v15;
  id v10 = sub_10001267C("octagon");
  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchEgoPeerID RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v9);
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v17 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received a fetch peer ID for arguments (%@)",  buf,  0xCu);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004EEA4;
    v13[3] = &unk_100285450;
    uint64_t v14 = v7;
    [v8 rpcFetchEgoPeerID:v13];
  }
}

- (void)fetchTrustStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v18 = 0LL;
  char v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v18));
  id v12 = v18;
  id v13 = sub_10001267C("octagon");
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if (!v11 || v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchTrustStatus RPC for arguments (%@): %@",  buf,  0x16u);
    }

    (*((void (**)(id, uint64_t, void, void, void, id))v10 + 2))(v10, -1LL, 0LL, 0LL, 0LL, v12);
  }

  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v20 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "Received a trust status for arguments (%@)",  buf,  0xCu);
    }

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004ED28;
    v16[3] = &unk_100283ED8;
    id v17 = v10;
    [v11 rpcTrustStatus:v9 reply:v16];
  }
}

- (void)fetchCliqueStatus:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void *))a5;
  id v18 = 0LL;
  char v11 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPC:createIfMissing:error:]( self,  "contextForClientRPC:createIfMissing:error:",  v8,  0LL,  &v18));
  id v12 = v18;
  id v13 = v12;
  if (!v11 || v12)
  {
    uint64_t v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchCliqueStatus RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, -1LL, v13);
  }

  else
  {
    if (!v9) {
      id v9 = objc_alloc_init(&OBJC_CLASS___OTOperationConfiguration);
    }
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004ED18;
    v16[3] = &unk_100283ED8;
    id v17 = v10;
    [v11 rpcTrustStatus:v9 reply:v16];
  }
}

- (void)status:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v13 = 0LL;
  BOOL v7 = (void (**)(id, void, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[OTManager contextForClientRPC:createIfMissing:error:]( self,  "contextForClientRPC:createIfMissing:error:",  v6,  0LL,  &v13));
  id v9 = v13;
  id v10 = sub_10001267C("octagon");
  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v11;
  if (!v8 || v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a status RPC for arguments(%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v9);
  }

  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "Received a status RPC for arguments (%@): %@",  buf,  0x16u);
    }

    [v8 rpcStatus:v7];
  }
}

- (void)startOctagonStateMachine:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v14 = 0LL;
  BOOL v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v14));
  id v9 = v14;
  id v10 = sub_10001267C("octagon");
  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rejecting a startOctagonStateMachine RPC for arguments (%@): %@",  buf,  0x16u);
    }

    id v13 = v9;
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Received a start-state-machine RPC for arguments (%@)",  buf,  0xCu);
    }

    [v8 startOctagonStateMachine];
    id v13 = 0LL;
  }

  ((void (**)(id, id))v7)[2](v7, v13);
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6
{
  LOBYTE(v6) = a5;
  -[OTManager resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:reply:]( self,  "resetAndEstablish:resetReason:idmsTargetContext:idmsCuttlefishPassword:notifyIdMS:accountSettings:isGuitarfish:reply:",  a3,  a4,  0LL,  0LL,  0LL,  0LL,  v6,  a6);
}

- (void)resetAndEstablish:(id)a3 resetReason:(int64_t)a4 idmsTargetContext:(id)a5 idmsCuttlefishPassword:(id)a6 notifyIdMS:(BOOL)a7 accountSettings:(id)a8 isGuitarfish:(BOOL)a9 reply:(id)a10
{
  BOOL v11 = a7;
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = (void (**)(id, void *))a10;
  id v34 = 0LL;
  __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v16, &v34));
  id v22 = v34;
  unsigned __int8 v23 = v22;
  if (!v21 || v22)
  {
    unsigned int v28 = sub_10001267C("octagon");
    BOOL v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v36 = v16;
      __int16 v37 = 2112;
      id v38 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Rejecting a resetAndEstablish RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v20[2](v20, v23);
  }

  else
  {
    BOOL v30 = v11;
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    int64_t v25 = a4;
    id v26 = (void *)objc_claimAutoreleasedReturnValue( [v24 startLogSystemMetricsForActivityNamed:@"OctagonActivityResetAndEstablish"]);

    [v21 startOctagonStateMachine];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10004ECC0;
    v31[3] = &unk_100285D40;
    id v32 = v26;
    id v33 = v20;
    id v27 = v26;
    [v21 rpcResetAndEstablish:v25 idmsTargetContext:v17 idmsCuttlefishPassword:v18 notifyIdMS:v30 accountSettings:v19 isGuitarfish:a9 reply:v31];
  }
}

- (void)clearCliqueFromAccount:(id)a3 resetReason:(int64_t)a4 isGuitarfish:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v17 = 0LL;
  BOOL v11 = (void (**)(id, void *))a6;
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v17));
  id v13 = v17;
  id v14 = v13;
  if (!v12 || v13)
  {
    id v15 = sub_10001267C("octagon");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v10;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Rejecting a resetAndEstablish RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v11[2](v11, v14);
  }

  else
  {
    [v12 startOctagonStateMachine];
    [v12 rpcReset:a4 isGuitarfish:v7 reply:v11];
  }
}

- (void)performCKServerUnreadableDataRemoval:(id)a3 isGuitarfish:(BOOL)a4 altDSID:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  BOOL v12 = (void (**)(id, void *))a6;
  id v20 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v20));
  id v14 = v20;
  id v15 = v14;
  if (!v13 || v14)
  {
    id v16 = sub_10001267C("octagon");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Rejecting a performCKServerUnreadableDataRemoval RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v12[2](v12, v15);
  }

  else
  {
    [v13 startOctagonStateMachine];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004ECB4;
    v18[3] = &unk_100285010;
    id v19 = v12;
    [v13 performCKServerUnreadableDataRemoval:v8 altDSID:v11 reply:v18];
  }
}

- (void)establish:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  id v20 = 0LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v20));
  id v9 = v20;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v15 = sub_10001267C("octagon");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Rejecting a establish RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityEstablish"]);

    [v8 startOctagonStateMachine];
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 altDSID]);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10004EC5C;
    v17[3] = &unk_100285D40;
    id v18 = v12;
    id v19 = v7;
    id v14 = v12;
    [v8 rpcEstablish:v13 reply:v17];
  }
}

- (void)leaveClique:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  id v19 = 0LL;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v19));
  id v9 = v19;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      __int16 v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a leaveClique RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityLeaveClique"]);

    [v8 startOctagonStateMachine];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004EC04;
    v16[3] = &unk_100285D40;
    id v17 = v12;
    id v18 = v7;
    id v13 = v12;
    [v8 rpcLeaveClique:v16];
  }
}

- (void)removeFriendsInClique:(id)a3 peerIDs:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v22 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v22));
  id v12 = v22;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v17 = sub_10001267C("octagon");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      id v26 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Rejecting a removeFriendsInClique RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( [v14 startLogSystemMetricsForActivityNamed:@"OctagonActivityRemoveFriendsInClique"]);

    [v11 startOctagonStateMachine];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10004EBAC;
    v19[3] = &unk_100285D40;
    id v20 = v15;
    id v21 = v10;
    id v16 = v15;
    [v11 rpcRemoveFriendsInClique:v9 reply:v19];
  }
}

- (void)peerDeviceNamesByPeerID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a peerDeviceNamesByPeerID RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 fetchTrustedDeviceNamesByPeerID:v7];
  }
}

- (void)fetchAllViableBottles:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v21 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v21));
  id v11 = v21;
  id v12 = v11;
  if (!v10 || v11)
  {
    __int16 v16 = sub_10001267C("octagon");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      __int16 v25 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchAllViableBottles RPC for arguments (%@): %@",  buf,  0x16u);
    }

    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0LL, 0LL, v12);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 startLogSystemMetricsForActivityNamed:@"OctagonActivityFetchAllViableBottles"]);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10004EB1C;
    v18[3] = &unk_100283F00;
    id v19 = v14;
    id v20 = v9;
    id v15 = v14;
    [v10 rpcFetchAllViableBottlesFromSource:a4 reply:v18];
  }
}

- (void)fetchEscrowContents:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v19 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v19));
  id v9 = v19;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchEscrowContents RPC for arguments (%@): %@",  buf,  0x16u);
    }

    (*((void (**)(id, void, void, void, void *))v7 + 2))(v7, 0LL, 0LL, 0LL, v10);
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 startLogSystemMetricsForActivityNamed:@"OctagonActivityFetchEscrowContents"]);

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004EA78;
    v16[3] = &unk_100283F28;
    id v17 = v12;
    id v18 = v7;
    id v13 = v12;
    [v8 fetchEscrowContents:v16];
  }
}

- (void)totalTrustedPeers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a totalTrustedPeers RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 rpcFetchTotalCountOfTrustedPeers:v7];
  }
}

- (void)rpcPrepareIdentityAsApplicantWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v39 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v39));
  id v12 = v39;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v31 = sub_10001267C("octagon");
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Rejecting a rpcPrepareIdentityAsApplicant RPC for arguments (%@): %@",  buf,  0x16u);
    }

    (*((void (**)(id, void, void, void, void, void, void *))v10 + 2))( v10,  0LL,  0LL,  0LL,  0LL,  0LL,  v13);
  }

  else
  {
    [v11 handlePairingRestart:v9];
    uint64_t v14 = _OctagonSignpostLogSystem([v11 startOctagonStateMachine]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    os_signpost_id_t v16 = _OctagonSignpostCreate();
    uint64_t v18 = v17;

    uint64_t v20 = _OctagonSignpostLogSystem(v19);
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    __int16 v22 = v21;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v22,  OS_SIGNPOST_INTERVAL_BEGIN,  v16,  "PairingChannelInitiatorPrepare",  " enableTelemetry=YES ",  buf,  2u);
    }

    uint64_t v24 = _OctagonSignpostLogSystem(v23);
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorPrepare  enableTelemetry=YES ",  buf,  0xCu);
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v41 = 0;
    id v26 = objc_alloc(&OBJC_CLASS___OTMetricsSessionData);
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v8 flowID]);
    unsigned int v28 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceSessionID]);
    BOOL v29 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v26, "initWithFlowID:deviceSessionID:", v27, v28);
    [v11 setSessionMetrics:v29];

    [v11 setShouldSendMetricsForOctagon:1];
    id v30 = [v9 epoch];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_10004E85C;
    v33[3] = &unk_100283F50;
    id v36 = buf;
    id v34 = v11;
    os_signpost_id_t v37 = v16;
    uint64_t v38 = v18;
    id v35 = v10;
    [v34 rpcPrepareIdentityAsApplicantWithConfiguration:v9 epoch:v30 reply:v33];

    _Block_object_dispose(buf, 8);
  }
}

- (void)rpcJoinWithArguments:(id)a3 configuration:(id)a4 vouchData:(id)a5 vouchSig:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  os_signpost_id_t v16 = (void (**)(id, void *))a7;
  id v45 = 0LL;
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v12, &v45));
  id v18 = v45;
  uint64_t v19 = v18;
  if (!v17 || v18)
  {
    id v36 = sub_10001267C("octagon");
    os_signpost_id_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Rejecting a rpcJoinWithArguments RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v16[2](v16, v19);
  }

  else
  {
    [v17 handlePairingRestart:v13];
    [v17 startOctagonStateMachine];
    uint64_t v20 = objc_alloc(&OBJC_CLASS___OTMetricsSessionData);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v12 flowID]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v12 deviceSessionID]);
    uint64_t v23 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v20, "initWithFlowID:deviceSessionID:", v21, v22);
    [v17 setSessionMetrics:v23];

    uint64_t v24 = _OctagonSignpostLogSystem([v17 setShouldSendMetricsForOctagon:1]);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = _OctagonSignpostCreate();
    uint64_t v38 = v27;
    os_signpost_id_t v28 = v26;

    uint64_t v30 = _OctagonSignpostLogSystem(v29);
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    id v32 = v31;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v32,  OS_SIGNPOST_INTERVAL_BEGIN,  v28,  "PairingChannelInitiatorJoinOctagon",  " enableTelemetry=YES ",  buf,  2u);
    }

    uint64_t v34 = _OctagonSignpostLogSystem(v33);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelInitiatorJoinOctagon  enableTelemetry=YES ",  buf,  0xCu);
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10004E6B0;
    v39[3] = &unk_100283F78;
    id v40 = v17;
    uint64_t v42 = buf;
    os_signpost_id_t v43 = v28;
    uint64_t v44 = v38;
    char v41 = v16;
    [v40 rpcJoin:v14 vouchSig:v15 reply:v39];

    _Block_object_dispose(buf, 8);
  }
}

- (void)rpcEpochWithArguments:(id)a3 configuration:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v38 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v38));
  id v12 = v38;
  id v13 = v12;
  if (!v11 || v12)
  {
    uint64_t v30 = sub_10001267C("octagon");
    id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Rejecting a rpcEpoch RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    [v11 startOctagonStateMachine];
    id v14 = objc_alloc(&OBJC_CLASS___OTMetricsSessionData);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v8 flowID]);
    os_signpost_id_t v16 = (void *)objc_claimAutoreleasedReturnValue([v8 deviceSessionID]);
    uint64_t v17 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:](v14, "initWithFlowID:deviceSessionID:", v15, v16);
    [v11 setSessionMetrics:v17];

    uint64_t v18 = _OctagonSignpostLogSystem([v11 setShouldSendMetricsForOctagon:1]);
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    os_signpost_id_t v20 = _OctagonSignpostCreate();
    uint64_t v22 = v21;

    uint64_t v24 = _OctagonSignpostLogSystem(v23);
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    uint64_t v26 = v25;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)__int128 buf = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v26,  OS_SIGNPOST_INTERVAL_BEGIN,  v20,  "PairingChannelAcceptorEpoch",  " enableTelemetry=YES ",  buf,  2u);
    }

    uint64_t v28 = _OctagonSignpostLogSystem(v27);
    uint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134217984;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "BEGIN [%lld]: PairingChannelAcceptorEpoch  enableTelemetry=YES ",  buf,  0xCu);
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    char v40 = 0;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_10004E500;
    v32[3] = &unk_100283FA0;
    id v35 = buf;
    id v33 = v11;
    os_signpost_id_t v36 = v20;
    uint64_t v37 = v22;
    uint64_t v34 = v10;
    [v33 rpcEpoch:v32];

    _Block_object_dispose(buf, 8);
  }
}

- (void)rpcVoucherWithArguments:(id)a3 configuration:(id)a4 peerID:(id)a5 permanentInfo:(id)a6 permanentInfoSig:(id)a7 stableInfo:(id)a8 stableInfoSig:(id)a9 maxCapability:(id)a10 reply:(id)a11
{
  id v17 = a3;
  id v60 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v61 = a8;
  id v62 = a9;
  id v21 = a10;
  id v22 = a11;
  id v69 = 0LL;
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v17, &v69));
  id v24 = v69;
  __int16 v25 = v24;
  if (v23 && !v24)
  {
    id v26 = objc_alloc_init(&OBJC_CLASS___TPECPublicKeyFactory);
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue( +[TPPeerPermanentInfo permanentInfoWithPeerID:data:sig:keyFactory:]( &OBJC_CLASS___TPPeerPermanentInfo,  "permanentInfoWithPeerID:data:sig:keyFactory:",  v18,  v19,  v20,  v26));

    if (!v59)
    {
      id v53 = sub_10001267C("SecError");
      id v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "octagon-rpc-voucher: aborting pairing: unable to validate provided permanentInfo with peerID!",  buf,  2u);
      }

      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  74LL,  @"Unable to validate peerID with provided permanentInfo"));
      (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0LL, 0LL, v25);
      goto LABEL_32;
    }

    if (!qword_1002DE880)
    {
      *(_OWORD *)__int128 buf = off_100284138;
      *(void *)&buf[16] = 0LL;
      qword_1002DE880 = _sl_dlopen(buf, 0LL);
    }

    if (!qword_1002DE880) {
      goto LABEL_23;
    }
    if (!v21)
    {
      *(void *)__int128 buf = 0LL;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      uint64_t v27 = (id *)qword_1002DE888;
      uint64_t v71 = qword_1002DE888;
      if (!qword_1002DE888)
      {
        uint64_t v28 = sub_10004E224();
        uint64_t v27 = (id *)dlsym(v28, "KCPairingIntent_Capability_FullPeer");
        *(void *)(*(void *)&buf[8] + 24LL) = v27;
        qword_1002DE888 = (uint64_t)v27;
      }

      _Block_object_dispose(buf, 8);
      if (!v27)
      {
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "NSString *getKCPairingIntent_Capability_FullPeer(void)"));
        objc_msgSend( v57,  "handleFailureInFunction:file:lineNumber:description:",  v58,  @"OTManager.m",  111,  @"%s",  dlerror());

        goto LABEL_36;
      }

      id v21 = *v27;
    }

    *(void *)__int128 buf = 0LL;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000LL;
    uint64_t v29 = (void *)qword_1002DE890;
    uint64_t v71 = qword_1002DE890;
    if (!qword_1002DE890)
    {
      uint64_t v30 = sub_10004E224();
      uint64_t v29 = dlsym(v30, "KCPairingIntent_Capability_LimitedPeer");
      *(void *)(*(void *)&buf[8] + 24LL) = v29;
      qword_1002DE890 = (uint64_t)v29;
    }

    _Block_object_dispose(buf, 8);
    if (v29)
    {
      if ([v21 isEqualToString:*v29])
      {
        id v31 = (void *)objc_claimAutoreleasedReturnValue([v59 modelID]);
        unsigned int v32 = +[OTDeviceInformation isFullPeer:](&OBJC_CLASS___OTDeviceInformation, "isFullPeer:", v31);

        if (v32)
        {
          id v33 = sub_10001267C("SecError");
          uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int128 buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "octagon-rpc-voucher: aborting pairing: full peer is attempting to get a voucher on a limited capability pairing context!",  buf,  2u);
          }

          __int16 v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:description:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:description:",  @"com.apple.security.octagon",  75LL,  @"full peer attempting to join limited capability pairing context"));
          (*((void (**)(id, void, void, void *))v22 + 2))(v22, 0LL, 0LL, v25);
LABEL_32:

          goto LABEL_33;
        }
      }

- (void)restoreFromBottle:(id)a3 entropy:(id)a4 bottleID:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  id v28 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v28));
  id v15 = v28;
  os_signpost_id_t v16 = v15;
  if (!v14 || v15)
  {
    uint64_t v23 = sub_10001267C("octagon");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      unsigned int v32 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Rejecting a restoreFromBottle RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v13[2](v13, v16);
  }

  else
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( [v17 startLogSystemMetricsForActivityNamed:@"OctagonActivityBottledPeerRestore"]);

    id v19 = sub_10001267C("octagon");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v30 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "restore via bottle invoked for arguments (%@)",  buf,  0xCu);
    }

    [v14 startOctagonStateMachine];
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10004E1CC;
    v25[3] = &unk_100285D40;
    id v26 = v18;
    uint64_t v27 = v13;
    id v22 = v18;
    [v14 joinWithBottle:v12 entropy:v11 bottleSalt:v21 reply:v25];
  }
}

- (BOOL)ghostbustByMidEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbmidRamp](self, "gbmidRamp"));
  unsigned __int8 v4 = [v3 checkRampStateWithError:0];

  return v4;
}

- (BOOL)ghostbustBySerialEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbserialRamp](self, "gbserialRamp"));
  unsigned __int8 v4 = [v3 checkRampStateWithError:0];

  return v4;
}

- (BOOL)ghostbustByAgeEnabled
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager gbAgeRamp](self, "gbAgeRamp"));
  unsigned __int8 v4 = [v3 checkRampStateWithError:0];

  return v4;
}

- (BOOL)fetchSendingMetricsPermitted:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v14 = 0LL;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v14));
  id v8 = v14;
  id v9 = v8;
  if (!v7 || v8)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchSendingMetricsPermitted for arguments (%@): %@",  buf,  0x16u);
    }

    unsigned __int8 v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }

  else
  {
    unsigned __int8 v10 = [v7 fetchSendingMetricsPermitted:a4];
  }

  return v10;
}

- (BOOL)persistSendingMetricsPermitted:(id)a3 sendingMetricsPermitted:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v16 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  id v10 = v16;
  id v11 = v10;
  if (!v9 || v10)
  {
    id v13 = sub_10001267C("octagon");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchSendingMetricsPermitted for arguments (%@): %@",  buf,  0x16u);
    }

    unsigned __int8 v12 = 0;
    if (a5) {
      *a5 = v11;
    }
  }

  else
  {
    unsigned __int8 v12 = [v9 persistSendingMetricsPermitted:v6 error:a5];
  }

  return v12;
}

- (void)setupAnalytics
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
  double v4 = SFAnalyticsSamplerIntervalOncePerReport;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004CD54;
  v9[3] = &unk_100285C68;
  objc_copyWeak(&v10, &location);
  id v5 = [v3 AddMultiSamplerForName:@"Octagon-healthSummary" withTimeInterval:v9 block:v4];

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004DFCC;
  v8[3] = &unk_100283FF0;
  v8[4] = self;
  id v7 = [v6 AddMultiSamplerForName:@"CFU-healthSummary" withTimeInterval:v8 block:v4];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)cdpContextTypes
{
  if (qword_1002DE878 != -1) {
    dispatch_once(&qword_1002DE878, &stru_100284010);
  }
  return (id)qword_1002DE870;
}

- (BOOL)isFullPeer
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager deviceInformationAdapter](self, "deviceInformationAdapter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 modelID]);
  BOOL v4 = +[OTDeviceInformation isFullPeer:](&OBJC_CLASS___OTDeviceInformation, "isFullPeer:", v3);

  return v4;
}

- (void)createRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v31 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v31));
  id v12 = v31;
  id v13 = sub_10001267C("octagon");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v35 = v8;
      __int16 v36 = 2112;
      id v37 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a createRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v12);
  }

  else
  {
    if (v15)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v35 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Setting recovery key for arguments (%@)",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 startLogSystemMetricsForActivityNamed:@"OctagonActivitySetRecoveryKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      id v30 = 0LL;
      if ((SecPasswordValidatePasswordFormat(4LL, v9, &v30) & 1) != 0)
      {
        [v11 startOctagonStateMachine];
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472LL;
        v27[2] = sub_10004CC3C;
        v27[3] = &unk_100285D40;
        id v28 = v17;
        uint64_t v29 = v10;
        [v11 rpcSetRecoveryKey:v9 reply:v27];

        id v18 = v28;
      }

      else
      {
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
        [v23 setObject:@"malformed recovery key" forKeyedSubscript:NSLocalizedDescriptionKey];
        id v24 = v30;
        if (v30)
        {
          [v23 setObject:v30 forKeyedSubscript:NSUnderlyingErrorKey];
        }

        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  41LL,  v23));
        __int16 v25 = sub_10001267C("SecError");
        id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v35 = v18;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "recovery failed validation with error:%@",  buf,  0xCu);
        }

        [v17 stopWithEvent:@"OctagonEventSetRecoveryKeyValidationFailed" result:v18];
        v10[2](v10, v18);
      }
    }

    else
    {
      __int16 v19 = sub_10001267C("octagon-recovery");
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      id v33 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v21));

      [v17 stopWithEvent:@"OctagonEventRecoveryKey" result:v22];
      v10[2](v10, v22);
    }
  }
}

- (void)joinWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v30 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v30));
  id v12 = v30;
  id v13 = sub_10001267C("octagon");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v32 = v8;
      __int16 v33 = 2112;
      id v34 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a joinWithRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v12);
  }

  else
  {
    if (v15)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v32 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "join with recovery key invoked for arguments (%@)",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 startLogSystemMetricsForActivityNamed:@"OctagonActivityJoinWithRecoveryKey"]);

    uint64_t v29 = 0LL;
    if ((SecPasswordValidatePasswordFormat(4LL, v9, &v29) & 1) != 0)
    {
      [v11 startOctagonStateMachine];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472LL;
      v23[2] = sub_10004C664;
      v23[3] = &unk_100284060;
      v23[4] = self;
      id v24 = v17;
      id v28 = v10;
      id v25 = v11;
      id v26 = v8;
      id v27 = v9;
      [v25 joinWithRecoveryKey:v27 reply:v23];
    }

    else
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      [v18 setObject:@"malformed recovery key" forKeyedSubscript:NSLocalizedDescriptionKey];
      __int16 v19 = v29;
      if (v29)
      {
        [v18 setObject:v29 forKeyedSubscript:NSUnderlyingErrorKey];
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  41LL,  v18));
      id v21 = sub_10001267C("SecError");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v32 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "recovery failed validation with error:%@",  buf,  0xCu);
      }

      [v17 stopWithEvent:@"OctagonEventJoinRecoveryKeyValidationFailed" result:v20];
      v10[2](v10, v20);
    }
  }
}

- (void)createCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v27 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    __int16 v19 = sub_10001267C("octagon");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      __int16 v33 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting a createCustodianRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-custodian-recovery");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating Custodian Recovery Key for arguments (%@)",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 startLogSystemMetricsForActivityNamed:@"OctagonActivityCreateCustodianRecoveryKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      [v11 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10004C5F0;
      v24[3] = &unk_100284088;
      id v25 = v17;
      id v26 = v10;
      [v11 rpcCreateCustodianRecoveryKeyWithUUID:v9 reply:v24];

      id v18 = v25;
    }

    else
    {
      id v21 = sub_10001267C("octagon-custodian-recovery");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      uint64_t v29 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v23));

      [v17 stopWithEvent:@"OctagonEventCreateCustodianRecoveryKey2" result:v18];
      v10[2](v10, 0LL, v18);
    }
  }
}

- (void)joinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v25 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v25));
  id v12 = v25;
  id v13 = sub_10001267C("octagon");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a joinWithCustodianRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v12);
  }

  else
  {
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "join with custodian recovery key %@ invoked for container: %@, context: %@",  buf,  0x20u);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 startLogSystemMetricsForActivityNamed:@"OctagonActivityJoinWithCustodianRecoveryKey"]);

    [v11 startOctagonStateMachine];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10004C4C4;
    v22[3] = &unk_100285D40;
    id v23 = v20;
    id v24 = v10;
    id v21 = v20;
    [v11 joinWithCustodianRecoveryKey:v9 reply:v22];
  }
}

- (void)preflightJoinWithCustodianRecoveryKey:(id)a3 custodianRecoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  id v25 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v25));
  id v12 = v25;
  id v13 = sub_10001267C("octagon");
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (!v11 || v12)
  {
    if (v15)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v27 = v8;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a preflightJoinWithCustodianRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v12);
  }

  else
  {
    if (v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v17;
      __int16 v30 = 2112;
      id v31 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "preflight join with custodian recovery key %@ invoked for container: %@, context: %@",  buf,  0x20u);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 startLogSystemMetricsForActivityNamed:@"OctagonActivityPreflightJoinWithCustodianRecoveryKey"]);

    [v11 startOctagonStateMachine];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10004C398;
    v22[3] = &unk_100285D40;
    id v23 = v20;
    id v24 = v10;
    id v21 = v20;
    [v11 preflightJoinWithCustodianRecoveryKey:v9 reply:v22];
  }
}

- (void)removeCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v30 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v30));
  id v12 = v30;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v22 = sub_10001267C("octagon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v34 = v8;
      __int16 v35 = 2112;
      __int16 v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Rejecting a removeCustodianRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-custodian-recovery");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v34 = v9;
      __int16 v35 = 2112;
      __int16 v36 = v16;
      __int16 v37 = 2112;
      id v38 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Remove Custodian Recovery Key %@ for container: %@, context: %@",  buf,  0x20u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityRemoveCustodianRecoveryKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      if (_os_feature_enabled_impl("Security", "TTROnCRKRemoval"))
      {
        id v20 = [[SecTapToRadar alloc] initTapToRadar:@"Custodian key removal" description:@"Please TTR unless you were just removing a recovery contact" radar:@"114829039"];
        [v20 trigger];
      }

      [v11 startOctagonStateMachine];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10004C340;
      v27[3] = &unk_100285D40;
      id v28 = v19;
      id v29 = v10;
      [v11 rpcRemoveCustodianRecoveryKeyWithUUID:v9 reply:v27];

      id v21 = v28;
    }

    else
    {
      id v24 = sub_10001267C("octagon-custodian-recovery");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot remove recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      __int16 v32 = @"Device is considered a limited peer, cannot remove recovery key in Octagon";
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v26));

      [v19 stopWithEvent:@"OctagonEventRemoveCustodianRecoveryKey" result:v21];
      v10[2](v10, v21);
    }
  }
}

- (void)checkCustodianRecoveryKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v26 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v26));
  id v12 = v26;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v21 = sub_10001267C("octagon");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Rejecting a checkCustodianRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-custodian-recovery");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      __int16 v32 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Check Custodian Recovery Key %@ for container: %@, context: %@",  buf,  0x20u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityCheckCustodianRecoveryKey"]);

    [v11 startOctagonStateMachine];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10004C2D8;
    v23[3] = &unk_1002840B0;
    id v24 = v19;
    id v25 = v10;
    id v20 = v19;
    [v11 rpcCheckCustodianRecoveryKeyWithUUID:v9 reply:v23];
  }
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v27 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    __int16 v19 = sub_10001267C("octagon");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      __int16 v33 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting a createInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-inheritance");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Creating Inheritance Key for arguments (%@)",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 startLogSystemMetricsForActivityNamed:@"OctagonActivityCreateInheritanceKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      [v11 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10004C264;
      v24[3] = &unk_1002840D8;
      id v25 = v17;
      id v26 = v10;
      [v11 rpcCreateInheritanceKeyWithUUID:v9 reply:v24];

      id v18 = v25;
    }

    else
    {
      id v21 = sub_10001267C("octagon-inheritance");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      __int16 v29 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v23));

      [v17 stopWithEvent:@"OctagonEventCreateInheritanceKey" result:v18];
      v10[2](v10, 0LL, v18);
    }
  }
}

- (void)generateInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v27 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    __int16 v19 = sub_10001267C("octagon");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      __int16 v33 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting a generateInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-inheritance");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Generating Inheritance Key for arguments (%@)",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 startLogSystemMetricsForActivityNamed:@"OctagonActivityGenerateInheritanceKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      [v11 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10004C1F0;
      v24[3] = &unk_1002840D8;
      id v25 = v17;
      id v26 = v10;
      [v11 rpcGenerateInheritanceKeyWithUUID:v9 reply:v24];

      id v18 = v25;
    }

    else
    {
      id v21 = sub_10001267C("octagon-inheritance");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      __int16 v29 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v23));

      [v17 stopWithEvent:@"OctagonEventGenerateInheritanceKey" result:v18];
      v10[2](v10, 0LL, v18);
    }
  }
}

- (void)storeInheritanceKey:(id)a3 ik:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v27 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    __int16 v19 = sub_10001267C("octagon");
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v31 = v8;
      __int16 v32 = 2112;
      __int16 v33 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting a storeInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-inheritance");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v31 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Storing Inheritance Key for arguments (%@)",  buf,  0xCu);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 startLogSystemMetricsForActivityNamed:@"OctagonActivityStoreInheritanceKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      [v11 startOctagonStateMachine];
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10004C198;
      v24[3] = &unk_100285D40;
      id v25 = v17;
      id v26 = v10;
      [v11 rpcStoreInheritanceKeyWithIK:v9 reply:v24];

      id v18 = v25;
    }

    else
    {
      id v21 = sub_10001267C("octagon-inheritance");
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      __int16 v29 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v23));

      [v17 stopWithEvent:@"OctagonEventStoreInheritanceKey" result:v18];
      v10[2](v10, v18);
    }
  }
}

- (void)joinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v27 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v22 = sub_10001267C("octagon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Rejecting a joinWithInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-inheritance");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      __int16 v33 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "join with inheritance key %@ invoked for container: %@, context: %@",  buf,  0x20u);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 startLogSystemMetricsForActivityNamed:@"OctagonActivityJoinWithInheritanceKey"]);

    [v11 startOctagonStateMachine];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004C06C;
    v24[3] = &unk_100285D40;
    id v25 = v20;
    id v26 = v10;
    id v21 = v20;
    [v11 joinWithInheritanceKey:v9 reply:v24];
  }
}

- (void)preflightJoinWithInheritanceKey:(id)a3 inheritanceKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v27 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v27));
  id v12 = v27;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v22 = sub_10001267C("octagon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Rejecting a preflightJoinWithInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-inheritance");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v9 uuid]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      __int16 v33 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "preflight join with inheritance key %@ invoked for container: %@, context: %@",  buf,  0x20u);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 startLogSystemMetricsForActivityNamed:@"OctagonActivityPreflightJoinWithInheritanceKey"]);

    [v11 startOctagonStateMachine];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10004BF40;
    v24[3] = &unk_100285D40;
    id v25 = v20;
    id v26 = v10;
    id v21 = v20;
    [v11 preflightJoinWithInheritanceKey:v9 reply:v24];
  }
}

- (void)removeInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v30 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v30));
  id v12 = v30;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v22 = sub_10001267C("octagon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v34 = v8;
      __int16 v35 = 2112;
      __int16 v36 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Rejecting a removeInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-inheritance");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v34 = v9;
      __int16 v35 = 2112;
      __int16 v36 = v16;
      __int16 v37 = 2112;
      id v38 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Remove Inheritance Key %@ for container: %@, context: %@",  buf,  0x20u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityRemoveInheritanceKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      if (_os_feature_enabled_impl("Security", "TTROnCRKRemoval"))
      {
        id v20 = [[SecTapToRadar alloc] initTapToRadar:@"Inheritance key removal" description:@"Please TTR unless you were just removing a legacy contact" radar:@"114829039"];
        [v20 trigger];
      }

      [v11 startOctagonStateMachine];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10004BEE8;
      v27[3] = &unk_100285D40;
      id v28 = v19;
      id v29 = v10;
      [v11 rpcRemoveInheritanceKeyWithUUID:v9 reply:v27];

      id v21 = v28;
    }

    else
    {
      id v24 = sub_10001267C("octagon-custodian-recovery");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot remove inheritance key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      __int16 v32 = @"Device is considered a limited peer, cannot remove inheritance key in Octagon";
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v26));

      [v19 stopWithEvent:@"OctagonEventRemoveInheritanceKey" result:v21];
      v10[2](v10, v21);
    }
  }
}

- (void)checkInheritanceKey:(id)a3 uuid:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v26 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v26));
  id v12 = v26;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v21 = sub_10001267C("octagon");
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Rejecting a checkInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    id v14 = sub_10001267C("octagon-custodian-recovery");
    BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v8 containerName]);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
      *(_DWORD *)__int128 buf = 138412802;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2112;
      __int16 v32 = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Check Custodian Recovery Key %@ for container: %@, context: %@",  buf,  0x20u);
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 startLogSystemMetricsForActivityNamed:@"OctagonActivityCheckInheritanceKey"]);

    [v11 startOctagonStateMachine];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_10004BE80;
    v23[3] = &unk_1002840B0;
    id v24 = v19;
    id v25 = v10;
    id v20 = v19;
    [v11 rpcCheckInheritanceKeyWithUUID:v9 reply:v23];
  }
}

- (void)recreateInheritanceKey:(id)a3 uuid:(id)a4 oldIK:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void, void *))a6;
  id v30 = 0LL;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v30));
  id v15 = v30;
  id v16 = v15;
  if (!v14 || v15)
  {
    id v22 = sub_10001267C("octagon");
    id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v34 = v10;
      __int16 v35 = 2112;
      __int16 v36 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Rejecting a recreateInheritanceKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v13[2](v13, 0LL, v16);
  }

  else
  {
    __int16 v17 = sub_10001267C("octagon-inheritance");
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v34 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Recreating Inheritance Key for arguments (%@)",  buf,  0xCu);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 startLogSystemMetricsForActivityNamed:@"OctagonActivityRecreateInheritanceKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      [v14 startOctagonStateMachine];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_10004BE0C;
      v27[3] = &unk_1002840D8;
      id v28 = v20;
      __int16 v29 = v13;
      [v14 rpcRecreateInheritanceKeyWithUUID:v11 oldIK:v12 reply:v27];

      id v21 = v28;
    }

    else
    {
      id v24 = sub_10001267C("octagon-inheritance");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
      __int16 v32 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
      id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v26));

      [v20 stopWithEvent:@"OctagonEventRecreateInheritanceKey" result:v21];
      v13[2](v13, 0LL, v21);
    }
  }
}

- (void)createInheritanceKey:(id)a3 uuid:(id)a4 claimTokenData:(id)a5 wrappingKeyData:(id)a6 reply:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void (**)(id, void, void *))a7;
  id v33 = 0LL;
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v12, &v33));
  id v18 = v33;
  __int16 v19 = v18;
  if (!v17 || v18)
  {
    id v25 = sub_10001267C("octagon");
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v37 = v12;
      __int16 v38 = 2112;
      id v39 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Rejecting a createInheritanceKey (w/claimToken+wrappingKey) RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v16[2](v16, 0LL, v19);
  }

  else
  {
    id v20 = sub_10001267C("octagon-inheritance");
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v37 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Creating Inheritance Key given claimToken+wrappingKey for arguments (%@)",  buf,  0xCu);
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v23 = (void *)objc_claimAutoreleasedReturnValue( [v22 startLogSystemMetricsForActivityNamed:@"OctagonEventCreateInheritanceKeyWithClaimTokenAndWrappingKey"]);

    if (-[OTManager isFullPeer](self, "isFullPeer"))
    {
      [v17 startOctagonStateMachine];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_10004BD98;
      v30[3] = &unk_1002840D8;
      id v31 = v23;
      __int16 v32 = v16;
      [v17 rpcCreateInheritanceKeyWithUUID:v13 claimTokenData:v14 wrappingKeyData:v15 reply:v30];

      id v24 = v31;
    }

    else
    {
      id v27 = sub_10001267C("octagon-inheritance");
      id v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Device is not a full peer; cannot enroll recovery key in Octagon",
          buf,
          2u);
      }

      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      __int16 v35 = @"Device is considered a limited peer, cannot enroll recovery key in Octagon";
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.security.octagon",  35LL,  v29));

      [v23 stopWithEvent:@"OctagonActivityRecreateInheritanceKey" result:v24];
      v16[2](v16, 0LL, v24);
    }
  }
}

- (void)xpc24HrNotification
{
  v3 = sub_10001267C("octagon-health");
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received 24hr xpc notification", v6, 2u);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___OTControlArguments);
  -[OTManager healthCheck:skipRateLimitingCheck:repair:reply:]( self,  "healthCheck:skipRateLimitingCheck:repair:reply:",  v5,  0LL,  0LL,  &stru_100284118);
}

- (void)healthCheck:(id)a3 skipRateLimitingCheck:(BOOL)a4 repair:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v25 = 0LL;
  id v11 = (void (**)(id, void, void *))a6;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v25));
  id v13 = v25;
  id v14 = v13;
  if (!v12 || v13)
  {
    id v18 = sub_10001267C("octagon");
    __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v27 = v10;
      __int16 v28 = 2112;
      __int16 v29 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Rejecting a healthCheck RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v11[2](v11, 0LL, v14);
  }

  else
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 flowID]);

    if (v15) {
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 flowID]);
    }
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceSessionID]);

    if (v16)
    {
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue([v10 deviceSessionID]);
    }

    else
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v10 altDSID]);
      id v21 =  +[AAFAnalyticsEventSecurity fetchDeviceSessionIDFromAuthKit:]( &OBJC_CLASS___AAFAnalyticsEventSecurity,  "fetchDeviceSessionIDFromAuthKit:",  v20);

      __int16 v17 = 0LL;
    }

    id v22 = -[OTMetricsSessionData initWithFlowID:deviceSessionID:]( objc_alloc(&OBJC_CLASS___OTMetricsSessionData),  "initWithFlowID:deviceSessionID:",  v15,  v17);
    [v12 setSessionMetrics:v22];

    id v23 = sub_10001267C("octagon");
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "notifying container of change", buf, 2u);
    }

    [v12 notifyContainerChange:0];
    [v12 checkOctagonHealth:v8 repair:v7 reply:v11];

    id v11 = (void (**)(id, void, void *))v15;
  }
}

- (void)simulateReceivePush:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v16 = 0LL;
  BOOL v7 = (void (**)(id, void))a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v16));
  id v9 = v16;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting updateOctagon for arguments (%@): %@",  buf,  0x16u);
    }

    id v13 = v10;
  }

  else
  {
    id v11 = sub_10001267C("octagon-push");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "notifying container of change (simulated)",  buf,  2u);
    }

    [v8 notifyContainerChange:0];
    id v13 = 0LL;
  }

  ((void (**)(id, void *))v7)[2](v7, v13);
}

- (void)setSOSEnabledForPlatformFlag:(BOOL)a3
{
}

- (void)allContextsHalt
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stateMachine]);
        [v9 haltOperation];

        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 ckks]);
        [v10 halt];
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }
}

- (void)allContextsDisablePendingFlags
{
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts", 0LL));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 allValues]);

  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      BOOL v7 = 0LL;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) stateMachine]);
        [v8 disablePendingFlags];

        BOOL v7 = (char *)v7 + 1;
      }

      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }

    while (v5);
  }
}

- (BOOL)allContextsPause:(unint64_t)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contexts](self, "contexts", 0LL));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allValues]);

  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        __int128 v10 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 stateMachine]);
        __int128 v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 currentState]);

        if (v12 != @"not_started")
        {
          __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 stateMachine]);
          __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 paused]);
          id v15 = [v14 wait:a3];

          if (v15) {
            goto LABEL_14;
          }
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v10 pendingEscrowCacheWarmup]);
        __int16 v17 = v16;
        if (v16 && [v16 wait:a3])
        {

LABEL_14:
          BOOL v18 = 0;
          goto LABEL_15;
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 1;
LABEL_15:

  return v18;
}

- (void)waitForOctagonUpgrade:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v17 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  id v9 = v17;
  __int128 v10 = v9;
  if (!v8 || v9)
  {
    __int128 v13 = sub_10001267C("octagon");
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      __int128 v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a waitForOctagonUpgrade RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    __int128 v11 = sub_10001267C("octagon-sos");
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting wait for octagon upgrade",  buf,  2u);
    }

    [v8 startOctagonStateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004BC90;
    v15[3] = &unk_100285010;
    id v16 = v7;
    [v8 waitForOctagonUpgrade:v15];
  }
}

- (void)waitForPriorityViewKeychainDataRecovery:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v17 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  id v9 = v17;
  __int128 v10 = v9;
  if (!v8 || v9)
  {
    __int128 v13 = sub_10001267C("octagon");
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      __int128 v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a waitForPriorityViewKeychainDataRecovery RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    __int128 v11 = sub_10001267C("octagon-ckks");
    __int128 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Attempting wait for priority view processing",  buf,  2u);
    }

    [v8 startOctagonStateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004BC84;
    v15[3] = &unk_100285010;
    id v16 = v7;
    [v8 rpcWaitForPriorityViewKeychainDataRecovery:v15];
  }
}

- (void)postCDPFollowupResult:(id)a3 success:(BOOL)a4 type:(id)a5 error:(id)a6 reply:(id)a7
{
  id v9 = (void (**)(id, void))a7;
  id v10 = a6;
  id v11 = a5;
  id v18 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@",  @"OACDPStateRun",  v11));
  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@%@Tries",  @"OACDPStateRun",  v11));

  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
  [v13 logResultForEvent:v18 hardFailure:0 result:v10];

  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
  id v15 = v14;
  if (v10)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v15 setDateProperty:v16 forKey:v18];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    [v17 incrementIntegerPropertyForKey:v12];
  }

  else
  {
    [v14 setDateProperty:0 forKey:v18];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(+[CKKSAnalytics logger](&OBJC_CLASS___CKKSAnalytics, "logger"));
    [v17 setNumberProperty:0 forKey:v12];
  }

  v9[2](v9, 0LL);
}

- (void)tapToRadar:(id)a3 description:(id)a4 radar:(id)a5 reply:(id)a6
{
  id v9 = (void (**)(id, void))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[SecTapToRadar alloc] initTapToRadar:v12 description:v11 radar:v10];

  [v13 trigger];
  v9[2](v9, 0LL);
}

- (void)refetchCKKSPolicy:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v17 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  id v9 = v17;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v13 = sub_10001267C("octagon");
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      __int128 v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a refetchCKKSPolicy RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    id v11 = sub_10001267C("octagon-ckks");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "refetch-ckks-policy", buf, 2u);
    }

    [v8 startOctagonStateMachine];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004BBA8;
    v15[3] = &unk_100285010;
    id v16 = v7;
    [v8 rpcRefetchCKKSPolicy:v15];
  }
}

- (void)getCDPStatus:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v18 = 0LL;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v18));
  id v9 = v18;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v15 = sub_10001267C("octagon");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      __int128 v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Rejecting a getCDPStatus RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    id v11 = sub_10001267C("octagon-cdp");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "get-cdp-status", buf, 2u);
    }

    id v17 = 0LL;
    id v13 = [v8 getCDPStatus:&v17];
    id v14 = v17;
    ((void (**)(id, id, void *))v7)[2](v7, v13, v14);

    id v7 = (void (**)(id, void, void *))v14;
  }
}

- (void)setCDPEnabled:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v17 = 0LL;
  id v7 = (void (**)(id, void *))a4;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  id v9 = v17;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      __int16 v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a setCDPEnabled RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    id v11 = sub_10001267C("octagon-cdp");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "set-cdp-enabled", buf, 2u);
    }

    id v16 = 0LL;
    [v8 setCDPEnabled:&v16];
    id v13 = v16;
    v7[2](v7, v13);

    id v7 = (void (**)(id, void *))v13;
  }
}

- (void)fetchEscrowRecords:(id)a3 source:(int64_t)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v19 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v19));
  id v11 = v19;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v15 = sub_10001267C("octagon");
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      __int128 v23 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchEscrowRecords RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v9[2](v9, 0LL, v12);
  }

  else
  {
    id v13 = sub_10001267C("octagon-fetch-escrow-records");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "fetching records", buf, 2u);
    }

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10004BA64;
    v17[3] = &unk_100285368;
    id v18 = v9;
    [v10 rpcFetchAllViableEscrowRecordsFromSource:a4 reply:v17];
  }
}

- (void)invalidateEscrowCache:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v17 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v17));
  id v9 = v17;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v13 = sub_10001267C("octagon");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a invalidateEscrowCache RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    id v11 = sub_10001267C("octagon-remove-escrow-cache");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "beginning removing escrow cache!", buf, 2u);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004B938;
    v15[3] = &unk_100285010;
    id v16 = v7;
    [v8 rpcInvalidateEscrowCache:v15];
  }
}

- (void)setUserControllableViewsSyncStatus:(id)a3 enabled:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void (**)(id, void, void *))a5;
  id v17 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v17));
  id v11 = v17;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v13 = sub_10001267C("octagon");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a setUserControllableViewsSyncStatus RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v9[2](v9, 0LL, v12);
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004B7DC;
    v15[3] = &unk_1002852A0;
    id v16 = v9;
    [v10 rpcSetUserControllableViewsSyncingStatus:v6 reply:v15];
  }
}

- (void)fetchUserControllableViewsSyncStatus:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v15 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchUserControllableViewsSyncStatus RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004B680;
    v13[3] = &unk_1002852A0;
    id v14 = v7;
    [v8 rpcFetchUserControllableViewsSyncingStatus:v13];
  }
}

- (void)resetAccountCDPContents:(id)a3 idmsTargetContext:(id)a4 idmsCuttlefishPassword:(id)a5 notifyIdMS:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void (**)(id, void *))a7;
  id v23 = 0LL;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v12, &v23));
  id v17 = v23;
  __int16 v18 = v17;
  if (!v16 || v17)
  {
    id v19 = sub_10001267C("octagon");
    __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting a resetAccountCDPContents RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v15[2](v15, v18);
  }

  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_10004B554;
    v21[3] = &unk_100285010;
    __int16 v22 = v15;
    [v16 rpcResetAccountCDPContentsWithIdmsTargetContext:v13 idmsCuttlefishPassword:v14 notifyIdMS:v8 reply:v21];
  }
}

- (void)setLocalSecureElementIdentity:(id)a3 secureElementIdentity:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v16 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  id v12 = v16;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a setLocalSecureElementIdentity RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    [v11 rpcSetLocalSecureElementIdentity:v9 reply:v10];
  }
}

- (void)removeLocalSecureElementIdentityPeerID:(id)a3 secureElementIdentityPeerID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v16 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  id v12 = v16;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a removeLocalSecureElementIdentityPeerID RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    [v11 rpcRemoveLocalSecureElementIdentityPeerID:v9 reply:v10];
  }
}

- (void)fetchTrustedSecureElementIdentities:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchTrustedSecureElementIdentities RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 rpcFetchTrustedSecureElementIdentities:v7];
  }
}

- (void)setAccountSetting:(id)a3 setting:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v16 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  id v12 = v16;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a setAccountSetting RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    [v11 rpcSetAccountSetting:v9 reply:v10];
  }
}

- (void)fetchAccountSettings:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchAccountSettings RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 rpcFetchAccountSettings:v7];
  }
}

- (void)fetchAccountWideSettingsWithForceFetch:(BOOL)a3 arguments:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  id v15 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v15));
  id v11 = v15;
  id v12 = v11;
  if (!v10 || v11)
  {
    id v13 = sub_10001267C("octagon");
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      __int16 v19 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Rejecting a fetchAccountWideSettings RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v9[2](v9, 0LL, v12);
  }

  else
  {
    [v10 rpcAccountWideSettingsWithForceFetch:v6 reply:v9];
  }
}

- (void)tlkRecoverabilityForEscrowRecordData:(id)a3 recordData:(id)a4 source:(int64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(id, void, void *))a6;
  id v18 = 0LL;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v10, &v18));
  id v14 = v18;
  id v15 = v14;
  if (!v13 || v14)
  {
    __int16 v16 = sub_10001267C("octagon");
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      __int16 v22 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Rejecting a tlkRecoverabilityForEscrowRecordData RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v12[2](v12, 0LL, v15);
  }

  else
  {
    [v13 rpcTlkRecoverabilityForEscrowRecordData:v11 source:a5 reply:v12];
  }
}

- (void)isRecoveryKeySet:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a isRecoveryKeySet RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 rpcIsRecoveryKeySet:v7];
  }
}

- (void)recoverWithRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v18 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v18));
  id v12 = v18;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10001267C("octagon-recover-with-recovery-key");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      __int16 v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a recoverWithRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, v13);
  }

  else
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004B428;
    v16[3] = &unk_100285010;
    id v17 = v10;
    [v11 joinWithRecoveryKey:v9 reply:v16];
  }
}

- (void)removeRecoveryKey:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v15 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v15));
  id v9 = v15;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon-remove-recovery-key");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      __int16 v19 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a removeRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v10);
  }

  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004B308;
    v13[3] = &unk_1002852A0;
    id v14 = v7;
    [v8 rpcRemoveRecoveryKey:v13];
  }
}

- (void)setMachineIDOverride:(id)a3 machineID:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v17 = 0LL;
  id v10 = (void (**)(id, void))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v17));
  id v12 = v17;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v15 = sub_10001267C("octagon");
    __int16 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v19 = v8;
      __int16 v20 = 2112;
      __int16 v21 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Rejecting a setMachineIDOverride RPC for arguments (%@): %@",  buf,  0x16u);
    }

    id v14 = v13;
  }

  else
  {
    [v11 setMachineIDOverride:v9];
    id v14 = 0LL;
  }

  ((void (**)(id, void *))v10)[2](v10, v14);
}

- (void)preflightRecoverOctagonUsingRecoveryKey:(id)a3 recoveryKey:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void, void *))a5;
  id v16 = 0LL;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v8, &v16));
  id v12 = v16;
  id v13 = v12;
  if (!v11 || v12)
  {
    id v14 = sub_10001267C("octagon");
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      __int16 v20 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Rejecting a preflightRecoverOctagonUsingRecoveryKey RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v10[2](v10, 0LL, v13);
  }

  else
  {
    [v11 preflightRecoverOctagonUsingRecoveryKey:v9 reply:v10];
  }
}

- (void)getAccountMetadata:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a getAccountMetadata RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 getAccountMetadataWithReply:v7];
  }
}

- (void)areRecoveryKeysDistrusted:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v13 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v13));
  id v9 = v13;
  id v10 = v9;
  if (!v8 || v9)
  {
    id v11 = sub_10001267C("octagon");
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Rejecting a areRecoveryKeysDistrusted RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, 0LL, v10);
  }

  else
  {
    [v8 areRecoveryKeysDistrusted:v7];
  }
}

- (void)reroll:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  id v19 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[OTManager contextForClientRPC:error:](self, "contextForClientRPC:error:", v6, &v19));
  id v9 = v19;
  id v10 = sub_10001267C("octagon");
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v8 || v9)
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412546;
      id v21 = v6;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Rejecting a reroll RPC for arguments (%@): %@",  buf,  0x16u);
    }

    v7[2](v7, v9);
  }

  else
  {
    if (v12)
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v21 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "reroll invoked for arguments (%@)",  buf,  0xCu);
    }

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class logger](-[OTManager loggerClass](self, "loggerClass"), "logger"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 startLogSystemMetricsForActivityNamed:@"OctagonActivityReroll"]);

    [v8 startOctagonStateMachine];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10004B2B0;
    v16[3] = &unk_100285D40;
    id v17 = v14;
    id v18 = v7;
    id v15 = v14;
    [v8 rerollWithReply:v16];
  }
}

- (OTSOSAdapter)sosAdapter
{
  return (OTSOSAdapter *)objc_getProperty(self, a2, 24LL, 1);
}

- (OTAuthKitAdapter)authKitAdapter
{
  return (OTAuthKitAdapter *)objc_getProperty(self, a2, 32LL, 1);
}

- (OTDeviceInformationAdapter)deviceInformationAdapter
{
  return (OTDeviceInformationAdapter *)objc_getProperty(self, a2, 40LL, 1);
}

- (CKKSLockStateTracker)lockStateTracker
{
  return self->_lockStateTracker;
}

- (void)setLockStateTracker:(id)a3
{
}

- (CKKSAccountStateTracker)accountStateTracker
{
  return (CKKSAccountStateTracker *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setAccountStateTracker:(id)a3
{
}

- (CKKSReachabilityTracker)reachabilityTracker
{
  return (CKKSReachabilityTracker *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setReachabilityTracker:(id)a3
{
}

- (CKContainer)cloudKitContainer
{
  return (CKContainer *)objc_getProperty(self, a2, 72LL, 1);
}

- (CKKSViewManager)viewManager
{
  return (CKKSViewManager *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setViewManager:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setListener:(id)a3
{
}

- (OTRamp)gbmidRamp
{
  return self->_gbmidRamp;
}

- (void)setGbmidRamp:(id)a3
{
}

- (OTRamp)gbserialRamp
{
  return self->_gbserialRamp;
}

- (void)setGbserialRamp:(id)a3
{
}

- (OTRamp)gbAgeRamp
{
  return self->_gbAgeRamp;
}

- (void)setGbAgeRamp:(id)a3
{
}

- (OctagonFollowUpControllerProtocol)cdpd
{
  return self->_cdpd;
}

- (void)setCdpd:(id)a3
{
}

- (NSMutableDictionary)contexts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setContexts:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (OTAccountsAdapter)accountsAdapter
{
  return (OTAccountsAdapter *)objc_getProperty(self, a2, 144LL, 1);
}

- (OTTooManyPeersAdapter)tooManyPeersAdapter
{
  return (OTTooManyPeersAdapter *)objc_getProperty(self, a2, 152LL, 1);
}

- (OTTapToRadarAdapter)tapToRadarAdapter
{
  return (OTTapToRadarAdapter *)objc_getProperty(self, a2, 160LL, 1);
}

- (OTPersonaAdapter)personaAdapter
{
  return (OTPersonaAdapter *)objc_getProperty(self, a2, 168LL, 1);
}

- (Class)apsConnectionClass
{
  return (Class)objc_getProperty(self, a2, 176LL, 1);
}

- (Class)escrowRequestClass
{
  return (Class)objc_getProperty(self, a2, 184LL, 1);
}

- (Class)notifierClass
{
  return (Class)objc_getProperty(self, a2, 192LL, 1);
}

- (Class)loggerClass
{
  return (Class)objc_getProperty(self, a2, 200LL, 1);
}

- (BOOL)sosEnabledForPlatform
{
  return self->_sosEnabledForPlatform;
}

- (void)setSosEnabledForPlatform:(BOOL)a3
{
  self->_sosEnabledForPlatform = a3;
}

- (CKKSNearFutureScheduler)savedTLKNotifier
{
  return (CKKSNearFutureScheduler *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setSavedTLKNotifier:(id)a3
{
}

- (CKKSCloudKitClassDependencies)cloudKitClassDependencies
{
  return (CKKSCloudKitClassDependencies *)objc_getProperty(self, a2, 216LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)manager
{
  if (objc_opt_class(&OBJC_CLASS___CKDatabase, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue([a1 resetManager:0 to:0]);
  }

  else
  {
    id v4 = sub_10001267C("SecError");
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Octagon: CloudKit.framework appears to not be linked. Cannot create an Octagon manager (on pain of crash).",  v7,  2u);
    }

    v3 = 0LL;
  }

  return v3;
}

+ (id)resetManager:(BOOL)a3 to:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  if (v7 || ((id v8 = (void *)qword_1002DE868) != 0LL ? (v9 = !v4) : (v9 = 0), !v9))
  {
    uint64_t v10 = objc_opt_class(a1, v6);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_sync_enter(v11);
    if (v7)
    {
      BOOL v12 = (OTManager *)v7;
    }

    else
    {
      id v13 = (void *)qword_1002DE868;
      if (v4)
      {
        BOOL v12 = 0LL;
        goto LABEL_11;
      }

      if (qword_1002DE868) {
        goto LABEL_12;
      }
      BOOL v12 = objc_alloc_init(&OBJC_CLASS___OTManager);
    }

    id v13 = (void *)qword_1002DE868;
LABEL_11:
    qword_1002DE868 = (uint64_t)v12;

LABEL_12:
    objc_sync_exit(v11);

    id v8 = (void *)qword_1002DE868;
  }

  id v14 = v8;

  return v14;
}

+ (id)makeCKContainer:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___CKContainerOptions);
  [v4 setBypassPCSEncryption:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[CKContainer containerIDForContainerIdentifier:]( &OBJC_CLASS___CKContainer,  "containerIDForContainerIdentifier:",  v3));

  uint64_t v6 = -[CKContainer initWithContainerID:options:]( objc_alloc(&OBJC_CLASS___CKContainer),  "initWithContainerID:options:",  v5,  v4);
  return v6;
}

@end