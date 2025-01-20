@interface KTSMManager
- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7;
- (BOOL)changeOptInState:(unint64_t)a3 application:(id)a4 loggableData:(id *)a5 error:(id *)a6;
- (BOOL)idsServerReportedWrong;
- (BOOL)isCloudKitManateeAcountAvailable;
- (BOOL)isKTDisabled;
- (BOOL)isKTKeyDifferent:(id)a3;
- (BOOL)maybeUpdateMonitorState:(double)a3;
- (BOOL)newCKRequests;
- (BOOL)optOutWhenNotEligble:(id)a3 error:(id *)a4;
- (BOOL)shouldPokeIDSUponSigning;
- (BOOL)triggerCKFetchCLI:(id *)a3;
- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 error:(id *)a5;
- (CKAccountInfo)cloudKitAccountInfo;
- (KTBackgroundSystemValidationOperation)lastDutyCycle;
- (KTCheckIDSRegistrationOperation)lastCheckIDSRegistration;
- (KTCondition)initializedComplete;
- (KTCondition)pendingValidationsComplete;
- (KTCondition)readyComplete;
- (KTCondition)signaturesComplete;
- (KTCondition)successfulIDSRegistrationCheck;
- (KTEnrollmentRegistrationSignature)lastRegistration;
- (KTFetchCloudOperation)currentCKFetch;
- (KTFetchIDMSOperation)lastFetchIDMS;
- (KTFetchIDSSelfOperation)lastFetchIDSSelf;
- (KTFetchKTSelfOperation)lastFetchKTSelf;
- (KTFetchServerOptInStatus)currentServerOptInFetch;
- (KTForceSyncKVSOperation)lastForceSyncKVS;
- (KTNearFutureScheduler)checkIDSRegistration;
- (KTNearFutureScheduler)checkKTAccountKeyScheduler;
- (KTNearFutureScheduler)checkKTSignatureScheduler;
- (KTNearFutureScheduler)ckFetchScheduler;
- (KTNearFutureScheduler)manateeViewChangedScheduler;
- (KTNearFutureScheduler)pokeIDS;
- (KTNearFutureScheduler)publicKeyFetcher;
- (KTNearFutureScheduler)retryEnsureIdentity;
- (KTNearFutureScheduler)retryGetPrimaryAccount;
- (KTNearFutureScheduler)retryPendingValidations;
- (KTNearFutureScheduler)serverOptInScheduler;
- (KTOperationDependencies)deps;
- (KTOptInStateHolder)optInStates;
- (KTPCSOperationDependency)pcsOperation;
- (KTPublicKeyStoreRefresh)lastPublicKeyRefresh;
- (KTSMManager)initWithDependencies:(id)a3;
- (KTSMSelfValidationResult)selfValidationResult;
- (KTSignalIDSOperation)lastSignalIDS;
- (KTSpecificUser)specificUser;
- (KTStateMachine)stateMachine;
- (KTValidateSelfOperation)lastValidateSelf;
- (KTValidateSelfOperation)lastValidateSelfOptIn;
- (KTZoneFetchDependencyOperation)successfulCKFetchDependency;
- (NSData)idsServerReportedWrongPublicKey;
- (NSDate)lastPush;
- (NSMutableDictionary)selfVerificationInfo;
- (NSMutableSet)ckFetchReasons;
- (NSMutableSet)inflightCKFetchDependencies;
- (NSMutableSet)serverOptInFetchReasons;
- (NSNumber)smState;
- (NSOperation)lastCKFetch;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)metricsQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)signatureQueue;
- (OS_dispatch_queue)stateMachineQueue;
- (OS_dispatch_source)checkIDSTimer;
- (OS_dispatch_source)timer;
- (SecLaunchSequence)launch;
- (_TtC13transparencyd10KTWatchdog)watchdog;
- (_TtC13transparencyd28KTEligibilityStatusReporting)statusReporting;
- (id)_onqueueCreateNewServerOptInFetch;
- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5;
- (id)accountFirstSeenDate;
- (id)createSuccesfulCKFetchDependency;
- (id)idsKTData:(id)a3;
- (id)initializingOperation;
- (id)lastSelfValidate;
- (id)metricsRegistration_idsView;
- (id)metricsRegistration_ktView;
- (id)missingValidateSelfFallbackDiagnostics;
- (id)newCKFetch:(id)a3;
- (id)optInStateForKeyStore:(id)a3 error:(id *)a4;
- (id)recheckAccount;
- (id)requestSuccessfulCKFetchForManyReasons:(id)a3;
- (id)validateSelfDiagnostics:(id)a3;
- (int)checkAccountKeyChanged;
- (int)manateeViewToken;
- (os_unfair_lock_s)metricsLock;
- (void)_onQueueMaybeCreateNewServerOptInFetch;
- (void)_onqueueCreateNewCKFetch;
- (void)_waitForIDSRegistration:(id)a3;
- (void)accountChanged:(id)a3 to:(id)a4;
- (void)addEvent:(id)a3;
- (void)checkIDSHealth:(id)a3;
- (void)checkKTAccountKey:(id)a3 complete:(id)a4;
- (void)clearAccountMetrics;
- (void)clearAllFollowups:(id)a3;
- (void)clearEligibilityOverrides:(id)a3;
- (void)clearIDSCacheForUri:(id)a3 application:(id)a4;
- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5;
- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4;
- (void)dealloc;
- (void)getAggregateResult:(int64_t)a3 element:(id)a4 complete:(id)a5;
- (void)getAllOptInStates:(id)a3;
- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5;
- (void)getOptInStateForAccount:(id)a3 complete:(id)a4;
- (void)getOptInStateForApplication:(id)a3 complete:(id)a4;
- (void)getStatus:(id)a3;
- (void)haltStateMachine;
- (void)idsServerBagUpdate;
- (void)idsServerReportKTKeyWrong:(id)a3;
- (void)insertResultForElement:(id)a3 samplesAgo:(id)a4 success:(BOOL)a5 complete:(id)a6;
- (void)inspectErrorForRetryAfter:(id)a3 trigger:(id)a4;
- (void)mapHeadUpdated:(id)a3 populating:(BOOL)a4;
- (void)maybeCreateNewCKFetch;
- (void)maybeCreateNewCKFetchOnQueue;
- (void)maybeCreateServerOptInFetch;
- (void)newServerOptInFetch:(id)a3;
- (void)notifyBackgroundValidationFailure:(id)a3 data:(id)a4 type:(id)a5 serverHint:(id)a6 failure:(id)a7;
- (void)notifyIDSRegistrationCorrect;
- (void)notifyPushChange:(id)a3 userInfo:(id)a4;
- (void)performAndWaitForSelfValidate:(id)a3;
- (void)performRegistrationSignatures:(id)a3;
- (void)postKTDisabledFollowup;
- (void)refreshDeviceList:(id)a3;
- (void)reportEligibility:(id)a3 complete:(id)a4;
- (void)requestServerOptInFetchForManyReasons:(id)a3 delayInSeconds:(double)a4;
- (void)resetLastAccountOperations;
- (void)resetLocalCloudDataState;
- (void)retryPendingValidations:(id)a3;
- (void)setCheckIDSRegistration:(id)a3;
- (void)setCheckIDSTimer:(id)a3;
- (void)setCheckKTAccountKeyScheduler:(id)a3;
- (void)setCheckKTSignatureScheduler:(id)a3;
- (void)setCkFetchReasons:(id)a3;
- (void)setCkFetchScheduler:(id)a3;
- (void)setCloudKitAccountInfo:(id)a3;
- (void)setCloudKitOutgoingFlag;
- (void)setCurrentCKFetch:(id)a3;
- (void)setCurrentServerOptInFetch:(id)a3;
- (void)setDeps:(id)a3;
- (void)setIdsServerReportedWrong:(BOOL)a3;
- (void)setIdsServerReportedWrongPublicKey:(id)a3;
- (void)setInflightCKFetchDependencies:(id)a3;
- (void)setInitializedComplete:(id)a3;
- (void)setLastCKFetch:(id)a3;
- (void)setLastCheckIDSRegistration:(id)a3;
- (void)setLastDutyCycle:(id)a3;
- (void)setLastFetchIDMS:(id)a3;
- (void)setLastFetchIDSSelf:(id)a3;
- (void)setLastFetchKTSelf:(id)a3;
- (void)setLastForceSyncKVS:(id)a3;
- (void)setLastPublicKeyRefresh:(id)a3;
- (void)setLastPush:(id)a3;
- (void)setLastRegistration:(id)a3;
- (void)setLastSelfValidate:(id)a3;
- (void)setLastSignalIDS:(id)a3;
- (void)setLastValidateSelf:(id)a3;
- (void)setLastValidateSelfOptIn:(id)a3;
- (void)setLaunch:(id)a3;
- (void)setManateeViewChangedScheduler:(id)a3;
- (void)setManateeViewToken:(int)a3;
- (void)setMetricsLock:(os_unfair_lock_s)a3;
- (void)setMetricsQueue:(id)a3;
- (void)setNewCKRequests:(BOOL)a3;
- (void)setOSUpdate:(BOOL)a3 complete:(id)a4;
- (void)setOperationQueue:(id)a3;
- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7;
- (void)setOptInStates:(id)a3;
- (void)setOverrideTimeBetweenReports:(double)a3 completion:(id)a4;
- (void)setPcsOperation:(id)a3;
- (void)setPendingValidationsComplete:(id)a3;
- (void)setPokeIDS:(id)a3;
- (void)setPublicKeyFetcher:(id)a3;
- (void)setQueue:(id)a3;
- (void)setReadyComplete:(id)a3;
- (void)setRetryEnsureIdentity:(id)a3;
- (void)setRetryGetPrimaryAccount:(id)a3;
- (void)setRetryPendingValidations:(id)a3;
- (void)setSelfValidationResult:(id)a3;
- (void)setSelfVerificationInfo:(id)a3;
- (void)setServerOptInFetchReasons:(id)a3;
- (void)setServerOptInScheduler:(id)a3;
- (void)setShouldPokeIDSUponSigning:(BOOL)a3;
- (void)setSignatureQueue:(id)a3;
- (void)setSignaturesComplete:(id)a3;
- (void)setSpecificUser:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setStateMachineQueue:(id)a3;
- (void)setStatusReporting:(id)a3;
- (void)setSuccessfulCKFetchDependency:(id)a3;
- (void)setSuccessfulIDSRegistrationCheck:(id)a3;
- (void)setTimer:(id)a3;
- (void)setWatchdog:(id)a3;
- (void)startMetrics;
- (void)startStateMachine;
- (void)storeEligiblilityFailure:(id)a3 error:(id)a4;
- (void)storeEligiblilitySuccess:(id)a3;
- (void)storeNeedsUpdate:(id)a3;
- (void)sysdiagnoseInfo:(id)a3;
- (void)timeout:(unint64_t)a3 block:(id)a4;
- (void)transparencyClearKTRegistrationData:(id)a3;
- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5;
- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5;
- (void)transparencyCloudDevices:(id)a3;
- (void)transparencyDumpKTRegistrationData:(id)a3;
- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4;
- (void)transparencyPerformRegistrationSignature:(id)a3;
- (void)triggerBAACertFetcher;
- (void)triggerBackgroundSystemValidate:(id)a3 completionHandler:(id)a4;
- (void)triggerCKFetch24h;
- (void)triggerCheckAccountIdentityChanged;
- (void)triggerCheckCKKSOctagonEligibility;
- (void)triggerCheckExpiredPublicKeyStores;
- (void)triggerCheckIDSRegistration;
- (void)triggerCheckKTAccountKey;
- (void)triggerCloudKitStaticKeyRemoteUpdateNotification;
- (void)triggerConfigBagFetch:(double)a3;
- (void)triggerEnsureIdentity;
- (void)triggerFetchSelf:(double)a3;
- (void)triggerGetPrimaryAccount;
- (void)triggerIDMSFetch:(double)a3;
- (void)triggerIDMSFetchBackstop:(id)a3;
- (void)triggerIDSRepair:(double)a3 selfValidationResult:(id)a4;
- (void)triggerIDSServerBagNotification;
- (void)triggerKTAccountKeySignature:(double)a3;
- (void)triggerMaybeReportEligibilityWithCompletion:(id)a3;
- (void)triggerOptInStateChange;
- (void)triggerPublicKeyFetch;
- (void)triggerRegistrationDataNeedsUpdate:(id)a3;
- (void)triggerSelfValidate:(double)a3;
- (void)triggerSelfValidateFromEnrollment;
- (void)triggerServerOptInFetch4h;
- (void)triggerStatusUpdate:(id)a3;
- (void)updateIDSRecommendation:(BOOL)a3 complete:(id)a4;
- (void)updateKTDisabledForIDS:(BOOL)a3;
- (void)uriNeedsUpdate:(id)a3 forApplication:(id)a4;
- (void)validatePendingURIsAndRequests;
- (void)waitForIDSRegistration:(id)a3;
- (void)xpc24HrNotification:(id)a3;
@end

@implementation KTSMManager

- (KTSMManager)initWithDependencies:(id)a3
{
  id v4 = a3;
  v125.receiver = self;
  v125.super_class = (Class)&OBJC_CLASS___KTSMManager;
  v5 = -[KTSMManager init](&v125, "init");
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("KTSMManager", 0LL);
    -[KTSMManager setQueue:](v5, "setQueue:", v6);

    dispatch_queue_t v7 = dispatch_queue_create("KT-statemachine", 0LL);
    -[KTSMManager setStateMachineQueue:](v5, "setStateMachineQueue:", v7);

    dispatch_queue_t v8 = dispatch_queue_create("KT-metrics", 0LL);
    -[KTSMManager setMetricsQueue:](v5, "setMetricsQueue:", v8);

    -[KTSMManager setDeps:](v5, "setDeps:", v4);
    v9 = objc_alloc_init(&OBJC_CLASS___KTOptInStateHolder);
    -[KTSMManager setOptInStates:](v5, "setOptInStates:", v9);

    v10 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    -[KTSMManager setOperationQueue:](v5, "setOperationQueue:", v10);

    v11 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    -[KTSMManager setInitializedComplete:](v5, "setInitializedComplete:", v11);

    v12 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    -[KTSMManager setReadyComplete:](v5, "setReadyComplete:", v12);

    v13 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    -[KTSMManager setSignaturesComplete:](v5, "setSignaturesComplete:", v13);

    -[KTSMManager setShouldPokeIDSUponSigning:](v5, "setShouldPokeIDSUponSigning:", 1LL);
    dispatch_queue_t v14 = dispatch_queue_create("signatures", 0LL);
    -[KTSMManager setSignatureQueue:](v5, "setSignatureQueue:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[KTSMManager setCkFetchReasons:](v5, "setCkFetchReasons:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    -[KTSMManager setInflightCKFetchDependencies:](v5, "setInflightCKFetchDependencies:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager createSuccesfulCKFetchDependency](v5, "createSuccesfulCKFetchDependency"));
    -[KTSMManager setSuccessfulCKFetchDependency:](v5, "setSuccessfulCKFetchDependency:", v17);

    -[KTSMManager setMetricsLock:](v5, "setMetricsLock:", 0LL);
    v18 = -[SecLaunchSequence initWithRocketName:]( objc_alloc(&OBJC_CLASS___SecLaunchSequence),  "initWithRocketName:",  @"com.apple.sear.KTSMManager");
    -[KTSMManager setLaunch:](v5, "setLaunch:", v18);

    v19 = objc_alloc(&OBJC_CLASS____TtC13transparencyd10KTWatchdog);
    v20 = objc_alloc(&OBJC_CLASS___KTManagerWatchdogControl);
    id v88 = v4;
    v21 = (void *)objc_claimAutoreleasedReturnValue([v4 dew]);
    v22 = -[KTManagerWatchdogControl initWithDew:](v20, "initWithDew:", v21);
    v23 = -[KTWatchdog initWithControl:](v19, "initWithControl:", v22);
    -[KTSMManager setWatchdog:](v5, "setWatchdog:", v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v24 idsConfigBag]);

    if (!v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyIDSConfigBag sharedInstance]( &OBJC_CLASS___TransparencyIDSConfigBag,  "sharedInstance"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
      [v27 setIdsConfigBag:v26];
    }

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v28 addObserver:v5 selector:"idsServerBagUpdate" name:IDSServerBagFinishedLoadingNotification object:0];

    v29 = objc_alloc(&OBJC_CLASS___KTStateMachine);
    v91 = (id *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](&OBJC_CLASS___KTStates, "KTStateMap"));
    v90 = (id *)objc_claimAutoreleasedReturnValue([v91 allKeys]);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v90));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates AllKTFlags](&OBJC_CLASS___KTStates, "AllKTFlags"));
    uint64_t v32 = objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](v5, "stateMachineQueue"));
    v89 = (id *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v89 lockStateTracker]);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 reachabilityTracker]);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v37 = (void *)objc_claimAutoreleasedReturnValue([v36 idsConfigBag]);
    v38 = v29;
    v39 = (void *)v32;
    v40 = -[KTStateMachine initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:]( v38,  "initWithName:states:flags:initialState:queue:stateEngine:lockStateTracker:reachabilityTracker:idsConfigBag:",  @"KTStateMachine",  v30,  v31,  @"PublicKeysInitialFetch",  v32,  v5,  v33,  v35,  v37);
    -[KTSMManager setStateMachine:](v5, "setStateMachine:", v40);

    -[KTSMManager setManateeViewToken:](v5, "setManateeViewToken:", 0xFFFFFFFFLL);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](v5, "stateMachine"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    [v42 setFlagHandler:v41];

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v43 cloudKitAccountTracker]);
    id v45 = [v44 registerForNotificationsOfCloudKitAccountStatusChange:v5];

    id location = 0LL;
    objc_initWeak(&location, v5);
    v122[0] = _NSConcreteStackBlock;
    v122[1] = 3221225472LL;
    v122[2] = sub_10003187C;
    v122[3] = &unk_1002791C0;
    objc_copyWeak(&v123, &location);
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v46 octagonOperations]);
    [v47 setOctagonObserver:v122];

    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472LL;
    v120[2] = sub_1000319AC;
    v120[3] = &unk_100279208;
    objc_copyWeak(&v121, &location);
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v48 octagonOperations]);
    [v49 setCkksViewObserver:v120];

    v118[0] = _NSConcreteStackBlock;
    v118[1] = 3221225472LL;
    v118[2] = sub_100031B40;
    v118[3] = &unk_100279250;
    objc_copyWeak(&v119, &location);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v50 idsAccountTracker]);
    [v51 setIdsObserver:v118];

    v52 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472LL;
    v116[2] = sub_100031C8C;
    v116[3] = &unk_100276D20;
    objc_copyWeak(&v117, &location);
    v53 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v52,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"publicKeyFetch",  5000000000LL,  7200000000000LL,  0LL,  0LL,  v116,  2.0);
    -[KTSMManager setPublicKeyFetcher:](v5, "setPublicKeyFetcher:", v53);

    v54 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v114[0] = _NSConcreteStackBlock;
    v114[1] = 3221225472LL;
    v114[2] = sub_100031CB8;
    v114[3] = &unk_100276D20;
    objc_copyWeak(&v115, &location);
    v55 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v54,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"retryEnsureIdentity",  5000000000LL,  3600000000000LL,  0LL,  0LL,  v114,  1.2);
    -[KTSMManager setRetryEnsureIdentity:](v5, "setRetryEnsureIdentity:", v55);

    v56 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472LL;
    v112[2] = sub_100031CE4;
    v112[3] = &unk_100276D20;
    objc_copyWeak(&v113, &location);
    v57 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v56,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"retryGetPrimaryAccount",  5000000000LL,  7200000000000LL,  0LL,  0LL,  v112,  2.0);
    -[KTSMManager setRetryGetPrimaryAccount:](v5, "setRetryGetPrimaryAccount:", v57);

    v58 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v110[0] = _NSConcreteStackBlock;
    v110[1] = 3221225472LL;
    v110[2] = sub_100031D10;
    v110[3] = &unk_100276D20;
    objc_copyWeak(&v111, &location);
    v59 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v58,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"ck-zone-fetcher",  2000000000LL,  3600000000000LL,  0LL,  0LL,  v110,  1.2);
    -[KTSMManager setCkFetchScheduler:](v5, "setCkFetchScheduler:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](v5, "deps"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v60 logger]);
    uint64_t v62 = objc_opt_self(v5);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v64 = (void *)objc_claimAutoreleasedReturnValue([v63 ckFetchScheduler]);
    [v61 addNFSReporting:v64];

    v65 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472LL;
    v108[2] = sub_100031D3C;
    v108[3] = &unk_100276D20;
    objc_copyWeak(&v109, &location);
    v66 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v65,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"checkKTAccountKey",  1000000000LL,  86400000000000LL,  0LL,  0LL,  v108,  2.0);
    -[KTSMManager setCheckKTAccountKeyScheduler:](v5, "setCheckKTAccountKeyScheduler:", v66);

    v67 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v106[0] = _NSConcreteStackBlock;
    v106[1] = 3221225472LL;
    v106[2] = sub_100031D68;
    v106[3] = &unk_100276D20;
    objc_copyWeak(&v107, &location);
    v68 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v67,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"checkIDSRegistration",  1200000000000LL,  43200000000000LL,  0LL,  0LL,  v106,  2.0);
    -[KTSMManager setCheckIDSRegistration:](v5, "setCheckIDSRegistration:", v68);

    v69 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472LL;
    v104[2] = sub_100031D94;
    v104[3] = &unk_100276D20;
    objc_copyWeak(&v105, &location);
    v70 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v69,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"checkKTSignatures",  2000000000LL,  43200000000000LL,  0LL,  0LL,  v104,  2.0);
    -[KTSMManager setCheckKTSignatureScheduler:](v5, "setCheckKTSignatureScheduler:", v70);

    v71 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v102[0] = _NSConcreteStackBlock;
    v102[1] = 3221225472LL;
    v102[2] = sub_100031DC4;
    v102[3] = &unk_100276740;
    v72 = v5;
    v103 = v72;
    v73 = -[KTNearFutureScheduler initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v71,  "initWithName:initialDelay:continuingDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"manateeViewChanged",  5000000000LL,  90000000000LL,  0LL,  0LL,  v102);
    [v72 setManateeViewChangedScheduler:v73];

    v74 = (void *)objc_claimAutoreleasedReturnValue([v72 deps]);
    v75 = (void *)objc_claimAutoreleasedReturnValue([v74 logger]);
    v76 = (void *)objc_claimAutoreleasedReturnValue([v72 manateeViewChangedScheduler]);
    [v75 addNFSReporting:v76];

    v77 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472LL;
    v100[2] = sub_100031DCC;
    v100[3] = &unk_100276D20;
    objc_copyWeak(&v101, &location);
    v78 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v77,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"fillServerOptInStatus",  2000000000LL,  3600000000000LL,  0LL,  0LL,  v100,  1.5);
    [v72 setServerOptInScheduler:v78];

    v79 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472LL;
    v98[2] = sub_100031DF8;
    v98[3] = &unk_100276D20;
    objc_copyWeak(&v99, &location);
    v80 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v79,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"retryPendingValidations",  10000000LL,  300000000000LL,  0LL,  0LL,  v98,  2.0);
    [v72 setRetryPendingValidations:v80];

    v81 = objc_alloc(&OBJC_CLASS___KTNearFutureScheduler);
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472LL;
    v96[2] = sub_100031E24;
    v96[3] = &unk_100276D20;
    objc_copyWeak(&v97, &location);
    v82 = -[KTNearFutureScheduler initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:]( v81,  "initWithName:initialDelay:exponentialBackoff:maximumDelay:keepProcessAlive:dependencyDescriptionCode:block:",  @"pokeIDS",  2000000000LL,  2000000000000LL,  0LL,  0LL,  v96,  10.0);
    [v72 setPokeIDS:v82];

    v83 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v72 queue]);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = sub_100031F44;
    handler[3] = &unk_100279278;
    objc_copyWeak(&v95, &location);
    notify_register_dispatch("com.apple.security.view-change.Manatee", v72 + 4, v83, handler);

    v84 = (void *)objc_claimAutoreleasedReturnValue([v72 watchdog]);
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472LL;
    v92[2] = sub_100031F88;
    v92[3] = &unk_1002792C0;
    objc_copyWeak(&v93, &location);
    [v84 addWithNamed:@"stateMachineQueue" watcher:v92];

    v85 = (void *)objc_claimAutoreleasedReturnValue([v72 watchdog]);
    [v85 resume];

    [v72 startMetrics];
    v86 = v72;
    objc_destroyWeak(&v93);
    objc_destroyWeak(&v95);
    objc_destroyWeak(&v97);
    objc_destroyWeak(&v99);
    objc_destroyWeak(&v101);

    objc_destroyWeak(&v105);
    objc_destroyWeak(&v107);
    objc_destroyWeak(&v109);
    objc_destroyWeak(&v111);
    objc_destroyWeak(&v113);
    objc_destroyWeak(&v115);
    objc_destroyWeak(&v117);
    objc_destroyWeak(&v119);
    objc_destroyWeak(&v121);
    objc_destroyWeak(&v123);
    objc_destroyWeak(&location);
    id v4 = v88;
  }

  return v5;
}

- (void)dealloc
{
  int manateeViewToken = self->_manateeViewToken;
  if (manateeViewToken != -1) {
    notify_cancel(manateeViewToken);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___KTSMManager;
  -[KTSMManager dealloc](&v4, "dealloc");
}

- (NSNumber)smState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](&OBJC_CLASS___KTStates, "KTStateMap"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentState]);
  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:v5]);

  return (NSNumber *)v6;
}

- (void)startStateMachine
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v2 startOperation];
}

- (void)haltStateMachine
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager publicKeyFetcher](self, "publicKeyFetcher"));
  [v3 cancel];

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager retryEnsureIdentity](self, "retryEnsureIdentity"));
  [v4 cancel];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager retryGetPrimaryAccount](self, "retryGetPrimaryAccount"));
  [v5 cancel];

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkKTAccountKeyScheduler](self, "checkKTAccountKeyScheduler"));
  [v6 cancel];

  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkKTSignatureScheduler](self, "checkKTSignatureScheduler"));
  [v7 cancel];

  dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInScheduler](self, "serverOptInScheduler"));
  [v8 cancel];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager ckFetchScheduler](self, "ckFetchScheduler"));
  [v9 cancel];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSRegistration](self, "checkIDSRegistration"));
  [v10 cancel];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager manateeViewChangedScheduler](self, "manateeViewChangedScheduler"));
  [v11 cancel];

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager retryPendingValidations](self, "retryPendingValidations"));
  [v12 cancel];

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager pokeIDS](self, "pokeIDS"));
  [v13 cancel];

  dispatch_queue_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
  if (v14)
  {
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100032334;
    v22[3] = &unk_100279308;
    v17 = v15;
    v23 = v17;
    [v16 closeDatabaseWithCompletionHandler:v22];

    dispatch_time_t v18 = dispatch_time(0LL, 2000000000LL);
    if (dispatch_semaphore_wait(v17, v18))
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_100279328);
      }
      v19 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Timeout closing eligibility db", v21, 2u);
      }
    }

    -[KTSMManager setStatusReporting:](self, "setStatusReporting:", 0LL);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v20 haltOperation];
}

- (void)startMetrics
{
  id location = 0LL;
  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 logger]);
  double v5 = SFAnalyticsSamplerIntervalOncePerReport;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100032600;
  v10[3] = &unk_100279378;
  objc_copyWeak(&v11, &location);
  [v4 addMultiSamplerForName:@"transparencydEligibilityMultiSampler" withTimeInterval:v10 block:v5];

  dispatch_queue_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  dispatch_queue_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 logger]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100032A2C;
  v8[3] = &unk_100279378;
  objc_copyWeak(&v9, &location);
  [v7 addMultiSamplerForName:@"transparencydMultiSampler" withTimeInterval:v8 block:v5];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)cloudkitAccountStateChange:(id)a3 to:(id)a4
{
  id v5 = a4;
  dispatch_queue_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000331EC;
  v8[3] = &unk_1002777A0;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

- (void)accountChanged:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_1002793B8);
  }
  dispatch_queue_t v8 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "account %@ state changed to: %@",  (uint8_t *)&v11,  0x16u);
  }

  id v9 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"AccountChanged",  0LL,  0.1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v10 handlePendingFlag:v9];
}

- (void)triggerPublicKeyFetch
{
  objc_super v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"FetchPublicKeys",  2LL,  0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerEnsureIdentity
{
  objc_super v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"EnsureIdentity",  3LL,  0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerGetPrimaryAccount
{
  objc_super v4 = -[KTPendingFlag initWithFlag:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:delayInSeconds:",  @"AccountChanged",  0.1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)storeNeedsUpdate:(id)a3
{
  id v4 = a3;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_1002793D8);
  }
  id v5 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "public key store request update: %@",  (uint8_t *)&v6,  0xCu);
  }

  -[KTSMManager triggerPublicKeyFetch](self, "triggerPublicKeyFetch");
}

- (void)triggerCheckIDSRegistration
{
  id v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CheckIDSRegistration",  2LL,  0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerCheckAccountIdentityChanged
{
  id v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CheckKTAccountKeyChanged",  2LL,  0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerOptInStateChange
{
  id v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"ChangeOptInState",  2LL,  0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerConfigBagFetch:(double)a3
{
  id v5 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"ConfigBagFetch",  2LL,  a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v4 handlePendingFlag:v5];
}

- (void)triggerKTAccountKeySignature:(double)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100033914;
  v6[3] = &unk_100279400;
  *(double *)&v6[5] = a3;
  v6[4] = self;
  dispatch_async(v5, v6);
}

- (void)performRegistrationSignatures:(id)a3
{
  id v4 = a3;
  id v17 = 0LL;
  unsigned __int8 v5 = -[KTSMManager waitUntilReadyForRPCForOperation:fast:error:]( self,  "waitUntilReadyForRPCForOperation:fast:error:",  @"performRegistrationSignatures",  0LL,  &v17);
  id v6 = v17;
  if ((v5 & 1) != 0)
  {
    v21 = @"SignRegistrationData";
    v19 = @"Ready";
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep success](&OBJC_CLASS___KTStateTransitionPathStep, "success"));
    v20 = v7;
    dispatch_queue_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    v22 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___KTStateTransitionPath,  "pathFromDictionary:",  v9));

    dispatch_time_t v18 = @"Ready";
    int v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100033B98;
    v15[3] = &unk_100279428;
    id v16 = v4;
    id v14 =  [v13 doWatchedStateMachineRPC:@"sign-registration-data" sourceStates:v12 path:v10 reply:v15];
  }

  else
  {
    (*((void (**)(id, id))v4 + 2))(v4, v6);
  }
}

- (BOOL)waitUntilReadyForRPCForOperation:(id)a3 fast:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager initializedComplete](self, "initializedComplete"));
  id v10 = [v9 wait:5000000000];

  if (v10)
  {
    uint64_t v11 = kTransparencyErrorInternal;
    v39[0] = @"state";
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v12 currentState]);
    id v14 = (void *)v13;
    dispatch_semaphore_t v15 = @"-";
    if (v13) {
      dispatch_semaphore_t v15 = (const __CFString *)v13;
    }
    v39[1] = @"opName";
    v40[0] = v15;
    v40[1] = v8;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  2LL));
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  v11,  -367LL,  0LL,  v16,  @"not ready yet"));

    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_100279448);
    }
    dispatch_time_t v18 = (os_log_s *)qword_1002E64C8;
    if (!os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    id v38 = v17;
    v19 = "Haven't yet initialized State machine; expect failure: %@";
    goto LABEL_23;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 lockStateTracker]);
  unsigned __int8 v22 = [v21 hasBeenUnlocked];

  if ((v22 & 1) == 0)
  {
    id v17 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -345LL,  @"not unlocked yet"));
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_100279468);
    }
    dispatch_time_t v18 = (os_log_s *)qword_1002E64C8;
    if (!os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR)) {
      goto LABEL_24;
    }
    *(_DWORD *)buf = 138412290;
    id v38 = v17;
    v19 = "Haven't yet unlocked: %@";
    goto LABEL_23;
  }

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
  v24 = v23;
  if (v6) {
    uint64_t v25 = 500000000LL;
  }
  else {
    uint64_t v25 = 2000000000LL;
  }
  id v26 = [v23 wait:v25];

  if (!v26)
  {
    id v17 = 0LL;
    BOOL v33 = 1;
    goto LABEL_27;
  }

  uint64_t v27 = kTransparencyErrorInternal;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine", @"state"));
  uint64_t v29 = objc_claimAutoreleasedReturnValue([v28 currentState]);
  v30 = (void *)v29;
  v31 = @"-";
  if (v29) {
    v31 = (const __CFString *)v29;
  }
  v35[1] = @"opName";
  v36[0] = v31;
  v36[1] = v8;
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
  id v17 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:userinfo:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:userinfo:description:",  v27,  -368LL,  0LL,  v32,  @"not ready yet"));

  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_100279488);
  }
  dispatch_time_t v18 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v38 = v17;
    v19 = "Haven't yet reached ready: %@";
LABEL_23:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
  }

- (void)triggerIDSRepair:(double)a3 selfValidationResult:(id)a4
{
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003412C;
  block[3] = &unk_1002794B0;
  block[4] = self;
  id v10 = v6;
  double v11 = a3;
  id v8 = v6;
  dispatch_async(v7, block);
}

- (BOOL)maybeUpdateMonitorState:(double)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stateMonitor]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 ktStatus]);
  id v8 = [v7 selfStatus];

  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_1002794D0);
  }
  id v9 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109376;
    v11[1] = (_DWORD)v8;
    __int16 v12 = 1024;
    BOOL v13 = v8 != 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Maybe update monitor selfStatus: %d: %d",  (uint8_t *)v11,  0xEu);
  }

  if (v8) {
    -[KTSMManager triggerSelfValidate:](self, "triggerSelfValidate:", a3);
  }
  return v8 != 0LL;
}

- (id)createSuccesfulCKFetchDependency
{
  id v2 = objc_alloc_init(&OBJC_CLASS___KTZoneFetchDependencyOperation);
  -[KTZoneFetchDependencyOperation setName:](v2, "setName:", @"successful-fetch-dependency");
  return v2;
}

- (void)maybeCreateNewCKFetch
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100034434;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)maybeCreateNewCKFetchOnQueue
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  if (-[KTSMManager newCKRequests](self, "newCKRequests"))
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
    if (!v4
      || (unsigned __int8 v5 = (void *)v4,
          id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch")),
          unsigned int v7 = [v6 isFinished],
          v6,
          v5,
          v7))
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_1002794F0);
      }
      id v8 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Creating a new CK fetch", v9, 2u);
      }

      -[KTSMManager _onqueueCreateNewCKFetch](self, "_onqueueCreateNewCKFetch");
    }
  }

- (void)_onqueueCreateNewCKFetch
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  uint64_t v4 = objc_claimAutoreleasedReturnValue(-[KTSMManager successfulCKFetchDependency](self, "successfulCKFetchDependency"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager createSuccesfulCKFetchDependency](self, "createSuccesfulCKFetchDependency"));
  -[KTSMManager setSuccessfulCKFetchDependency:](self, "setSuccessfulCKFetchDependency:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager inflightCKFetchDependencies](self, "inflightCKFetchDependencies"));
  v36 = (void *)v4;
  [v6 addObject:v4];

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager ckFetchReasons](self, "ckFetchReasons"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  -[KTSMManager setCkFetchReasons:](self, "setCkFetchReasons:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v34 allObjects]);
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 componentsJoinedByString:@","]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 fetchCloudStorage]);
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 dataStore]);
  dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 controller]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 backgroundContext]);
  v35 = (void *)v9;
  id v17 = (void *)objc_claimAutoreleasedReturnValue( [v11 cloudFetchOperationWithDeps:v12 initialFetch:0 userInteractive:0 reason:v9 context:v16]);

  -[KTSMManager setCurrentCKFetch:](self, "setCurrentCKFetch:", v17);
  -[KTSMManager setNewCKRequests:](self, "setNewCKRequests:", 0LL);
  if ([v34 containsObject:off_1002DE2F8])
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_100279510);
    }
    dispatch_time_t v18 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "blocking fetch on network reachability/network timeout",  buf,  2u);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 reachabilityTracker]);
    unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 reachabilityDependency]);
    [v19 addNullableDependency:v22];

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v24 networkTimeout]);
    id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 networkTimeoutOperation]);
    [v23 addNullableDependency:v26];
  }

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_100034978;
  v37[3] = &unk_100279558;
  v37[4] = self;
  id v38 = v17;
  id v39 = v34;
  id v27 = v34;
  id v28 = v17;
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v37));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
  [v29 addNullableDependency:v30];

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentCKFetch](self, "currentCKFetch"));
  [v31 addOperation:v32];

  BOOL v33 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  [v33 addOperation:v29];
}

- (id)requestSuccessfulCKFetchForManyReasons:(id)a3
{
  id v4 = a3;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_100279578);
  }
  unsigned __int8 v5 = (void *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 componentsJoinedByString:@","]);
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "triggering a new CK fetch because of reason: %@",  (uint8_t *)&buf,  0xCu);
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cloudRecords]);
  BOOL v11 = v10 == 0LL;

  if (v11
    || !-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable")
    || (__int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser")),
        BOOL v13 = v12 == 0LL,
        v12,
        v13))
  {
    id v15 = 0LL;
  }

  else
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x3032000000LL;
    unsigned __int8 v22 = sub_100035018;
    v23 = sub_100035028;
    id v24 = 0LL;
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100035030;
    block[3] = &unk_100278EC8;
    p___int128 buf = &buf;
    block[4] = self;
    id v18 = v4;
    dispatch_sync(v14, block);

    id v15 = *(id *)(*((void *)&buf + 1) + 40LL);
    _Block_object_dispose(&buf, 8);
  }

  return v15;
}

- (id)newCKFetch:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMManager requestSuccessfulCKFetchForManyReasons:]( self,  "requestSuccessfulCKFetchForManyReasons:",  v4));

  return v5;
}

- (void)notifyPushChange:(id)a3 userInfo:(id)a4
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", a3, a4));
  -[KTSMManager setLastPush:](self, "setLastPush:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 networkTimeout]);
  [v7 networkWithFeedback:2];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));
  if (v8)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"apns"));
    -[KTSMManager requestServerOptInFetchForManyReasons:delayInSeconds:]( self,  "requestServerOptInFetchForManyReasons:delayInSeconds:",  v9,  10.0);

    if (-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable")) {
  }
    }

- (BOOL)triggerCKFetchCLI:(id *)a3
{
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", @"cli"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[KTSMManager requestSuccessfulCKFetchForManyReasons:]( self,  "requestSuccessfulCKFetchForManyReasons:",  v5));

  if (v6)
  {
    unsigned int v7 = -[KTPendingFlag initWithFlag:after:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:after:",  @"CloudKitOutgoing",  v6);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 flagHandler]);
    [v9 handlePendingFlag:v7];

    [v6 waitUntilFinishedOrTimeout:20.0];
    if ([v6 isFinished])
    {
      id v10 = 0LL;
    }

    else
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  kTransparencyErrorInternal,  -380LL,  0LL));
      if (v10)
      {
        if (qword_1002E64C0 != -1) {
          dispatch_once(&qword_1002E64C0, &stru_100279598);
        }
        __int16 v12 = (os_log_s *)qword_1002E64C8;
        if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
        {
          int v14 = 138412290;
          id v15 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "triggerCKFetchCLI failed: %@",  (uint8_t *)&v14,  0xCu);
        }

        if (a3)
        {
          id v10 = v10;
          BOOL v11 = 0;
          *a3 = v10;
        }

        else
        {
          BOOL v11 = 0;
        }

        goto LABEL_13;
      }
    }

    BOOL v11 = 1;
LABEL_13:

    goto LABEL_14;
  }

  BOOL v11 = 1;
LABEL_14:

  return v11;
}

- (void)triggerCKFetch24h
{
  if (-[KTSMManager isCloudKitManateeAcountAvailable](self, "isCloudKitManateeAcountAvailable"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));

    if (v3) {
  }
    }

- (void)triggerCheckKTAccountKey
{
  id v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CheckKTAccountKey",  2LL,  0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v3 handlePendingFlag:v4];
}

- (void)triggerIDMSFetchBackstop:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 0;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 logClient]);
  [v6 idmsFetchTime];
  double v8 = v7;

  if (v8 < 604800.0) {
    double v8 = 604800.0;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 smDataStore]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100035654;
  v14[3] = &unk_1002795C0;
  double v17 = v8;
  id v11 = v4;
  id v15 = v11;
  id v16 = &v18;
  [v10 fetchIDMSDeviceList:v14];

  if (*((_BYTE *)v19 + 24))
  {
    __int16 v12 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"FetchIDMS",  2LL,  0.1);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    [v13 handlePendingFlag:v12];
  }

  _Block_object_dispose(&v18, 8);
}

- (void)triggerIDMSFetch:(double)a3
{
  unsigned __int8 v5 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"FetchIDMS",  2LL,  a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v4 handlePendingFlag:v5];
}

- (void)triggerSelfValidate:(double)a3
{
  id v4 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"ValidateSelf",  2LL,  a3);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v5 handlePendingFlag:v4];

  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_1002795E0);
  }
  id v6 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "scheduling server opt-in check due to self validate xpc activity",  v7,  2u);
  }
}

- (void)triggerSelfValidateFromEnrollment
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 dew]);
  [v4 selfValidationEnrollment];
  double v6 = v5;

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stateMonitor]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ktStatus]);

  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_100279600);
  }
  id v10 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    float v11 = v6;
    int v14 = 134218242;
    double v15 = v11;
    __int16 v16 = 2112;
    double v17 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "triggerSelfValidateFromEnrollment: delay: %f current state: %@",  (uint8_t *)&v14,  0x16u);
  }

  if ([v9 selfStatus] == (id)2)
  {
    __int16 v12 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"ValidateSelf",  2LL,  v6);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    [v13 handlePendingFlag:v12];
  }
}

- (void)triggerFetchSelf:(double)a3
{
  double v5 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"FetchSelf",  2LL,  a3);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v4 handlePendingFlag:v5];
}

- (void)triggerCheckExpiredPublicKeyStores
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 publicKeyStore]);
  unsigned int v5 = [v4 anyStoreExpired];

  if (v5)
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager publicKeyFetcher](self, "publicKeyFetcher"));
    [v6 trigger];
  }

- (void)triggerBackgroundSystemValidate:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0LL;
  double v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_100035018;
  uint64_t v20 = sub_100035028;
  id v21 = 0LL;
  id v8 = v6;
  id v21 = v8;
  if (!v17[5])
  {
    uint64_t v9 = os_transaction_create("com.apple.transparencyd.background-validation");
    id v10 = (void *)v17[5];
    v17[5] = v9;
  }

  float v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100035C44;
  block[3] = &unk_100279698;
  block[4] = self;
  id v14 = v7;
  double v15 = &v16;
  id v12 = v7;
  dispatch_async(v11, block);

  _Block_object_dispose(&v16, 8);
}

- (void)notifyBackgroundValidationFailure:(id)a3 data:(id)a4 type:(id)a5 serverHint:(id)a6 failure:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  double v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 smDataStore]);
  v19 = (void *)objc_claimAutoreleasedReturnValue([v15 base64EncodedStringWithOptions:0]);

  +[KTBackgroundSystemValidationOperation addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:]( &OBJC_CLASS___KTBackgroundSystemValidationOperation,  "addErrorToBackgroundOp:smDataStore:failureDataString:type:serverHint:failure:",  v16,  v18,  v19,  v14,  v13,  v12);
  -[KTSMManager triggerStatusUpdate:](self, "triggerStatusUpdate:", kKTApplicationIdentifierIDS);
}

- (void)triggerStatusUpdate:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps", a3));
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 stateMonitor]);
  [v5 setPendingChanges:1];

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036258;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_async(v6, block);
}

- (id)optInStateForKeyStore:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudRecords]);

  if (v8)
  {
    id v14 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 getAggregateOptInStateForApplication:v6 error:&v14]);
    id v10 = v14;
    if (!v9)
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_1002796D8);
      }
      float v11 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "getAggregateOptInStateForApplication failed for %@: %@",  buf,  0x16u);
      }

      if (a4) {
        *a4 = v10;
      }
    }
  }

  else
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_1002796B8);
    }
    id v12 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "no cloud records", buf, 2u);
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (void)validatePendingURIsAndRequests
{
  v5[0] = 0LL;
  v5[1] = v5;
  v5[2] = 0x3032000000LL;
  v5[3] = sub_100035018;
  v5[4] = sub_100035028;
  id v6 = 0LL;
  id v6 = (id)os_transaction_create("com.apple.transparencyd.retry-pending");
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000365CC;
  v4[3] = &unk_100279700;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
}

- (void)retryPendingValidations:(id)a3
{
  if ([a3 isEqual:kKTApplicationIdentifierIDS])
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___KTCondition);
    -[KTSMManager setPendingValidationsComplete:](self, "setPendingValidationsComplete:", v4);

    id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager retryPendingValidations](self, "retryPendingValidations"));
    [v5 trigger];
  }

- (void)triggerRegistrationDataNeedsUpdate:(id)a3
{
  id v4 = a3;
  -[KTSMManager addEvent:](self, "addEvent:", @"PokeIDSWithUpdatedRegData");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stateMonitor]);
  [v6 setSystemStatus:2];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsOperations]);
  [v8 registrationDataNeedsUpdate:v4];

  id v11 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v11 logger]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v9 setDateProperty:v10 forKey:off_1002DE268];
}

- (void)notifyIDSRegistrationCorrect
{
  id location = 0LL;
  objc_initWeak(&location, self);
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100036B38;
  v4[3] = &unk_100276D20;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (BOOL)isKTKeyDifferent:(id)a3
{
  id v4 = a3;
  if (!-[KTSMManager idsServerReportedWrong](self, "idsServerReportedWrong")
    || (uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager idsServerReportedWrongPublicKey](self, "idsServerReportedWrongPublicKey"))) != 0
    && (id v6 = (void *)v5,
        id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager idsServerReportedWrongPublicKey](self, "idsServerReportedWrongPublicKey")),
        unsigned __int8 v8 = [v7 isEqual:v4],
        v7,
        v6,
        (v8 & 1) != 0))
  {
    BOOL v9 = 0;
  }

  else
  {
    -[KTSMManager setIdsServerReportedWrong:](self, "setIdsServerReportedWrong:", 0LL);
    -[KTSMManager setIdsServerReportedWrongPublicKey:](self, "setIdsServerReportedWrongPublicKey:", 0LL);
    BOOL v9 = 1;
  }

  return v9;
}

- (void)idsServerReportKTKeyWrong:(id)a3
{
  id v4 = a3;
  -[KTSMManager setIdsServerReportedWrong:](self, "setIdsServerReportedWrong:", 1LL);
  -[KTSMManager setIdsServerReportedWrongPublicKey:](self, "setIdsServerReportedWrongPublicKey:", v4);
}

- (void)resetLastAccountOperations
{
}

- (void)clearAllFollowups:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 followup]);
  id v10 = 0LL;
  unsigned __int8 v7 = [v6 clearAllFollowups:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_100279720);
    }
    BOOL v9 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138543618;
      id v12 = v4;
      __int16 v13 = 2114;
      id v14 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "clearAllFollowups failed: %{public}@ %{public}@",  buf,  0x16u);
    }
  }
}

- (void)performAndWaitForSelfValidate:(id)a3
{
  id v4 = a3;
  id v17 = 0LL;
  unsigned __int8 v5 = -[KTSMManager waitUntilReadyForRPCForOperation:fast:error:]( self,  "waitUntilReadyForRPCForOperation:fast:error:",  @"performAndWaitForSelfValidate",  0LL,  &v17);
  id v6 = v17;
  if ((v5 & 1) != 0)
  {
    id v21 = @"ValidateSelf";
    v19 = @"Ready";
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[KTStateTransitionPathStep success](&OBJC_CLASS___KTStateTransitionPathStep, "success"));
    uint64_t v20 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    unsigned __int8 v22 = v8;
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionPath pathFromDictionary:]( &OBJC_CLASS___KTStateTransitionPath,  "pathFromDictionary:",  v9));

    id v18 = @"Ready";
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v11));

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100037108;
    v15[3] = &unk_100279748;
    void v15[4] = self;
    id v16 = v4;
    id v14 =  [v13 doWatchedStateMachineRPC:@"validate-self" sourceStates:v12 path:v10 reply:v15];
  }

  else
  {
    (*((void (**)(id, uint64_t, void, void, id))v4 + 2))(v4, 2LL, 0LL, 0LL, v6);
  }
}

- (id)validateSelfDiagnostics:(id)a3
{
  id v3 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100037288;
  v6[3] = &unk_100279770;
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v7 = v4;
  [v3 handleOperationResults:v6];

  return v4;
}

- (id)missingValidateSelfFallbackDiagnostics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 smDataStore]);
  uint64_t v6 = kKTApplicationIdentifierIDS;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10003741C;
  v9[3] = &unk_1002797E0;
  id v7 = v3;
  id v10 = v7;
  [v5 fetchSelfVerificationInfoForApplication:v6 complete:v9];

  return v7;
}

- (id)idsKTData:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v3 ktDataForRegistration]);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "kt_hexString"));
    [v4 setObject:v6 forKeyedSubscript:@"tbs"];

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 ktPublicAccountKey]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "kt_hexString"));
    [v4 setObject:v8 forKeyedSubscript:@"pub"];

    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v3 ktDataSignature]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "kt_hexString"));
    [v4 setObject:v10 forKeyedSubscript:@"sig"];

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v3 uploadedToKVS]));
    [v4 setObject:v11 forKeyedSubscript:@"kvs"];

    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v3 ktOptInStatus]));
    [v4 setObject:v12 forKeyedSubscript:@"optin"];

    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v3 registeredTime]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 description]);
    [v4 setObject:v14 forKeyedSubscript:@"regTS"];

    id v15 = (void *)objc_claimAutoreleasedReturnValue([v3 ktAccountKeyTimestamp]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
    [v4 setObject:v16 forKeyedSubscript:@"accTS"];

    id v17 = (void *)objc_claimAutoreleasedReturnValue([v3 ktOptInTimestamp]);
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
    [v4 setObject:v18 forKeyedSubscript:@"optTS"];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v3 ktAccountKeyErrorCode]);
    [v4 setObject:v19 forKeyedSubscript:@"accErr"];

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v3 ktOptInErrorCode]);
    [v4 setObject:v20 forKeyedSubscript:@"optErr"];

    if ([v4 count]) {
      id v21 = v4;
    }
    else {
      id v21 = 0LL;
    }
  }

  else
  {
    id v21 = 0LL;
  }

  return v21;
}

- (void)sysdiagnoseInfo:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dumpPendingFlags]);

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037C20;
  block[3] = &unk_100279880;
  block[4] = self;
  id v11 = v6;
  id v12 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async(v7, block);
}

- (void)getStatus:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100039448;
  v7[3] = &unk_1002798C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)mapHeadUpdated:(id)a3 populating:(BOOL)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 stateMonitor]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 ktStatus]);
  id v10 = [v9 systemStatus];

  if (v10 == (id)3 && !a4)
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_1002798E8);
    }
    id v11 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v18 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Detected tree reset populating->non-populating edge for %{public}@",  buf,  0xCu);
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 followup]);
    id v16 = 0LL;
    [v13 clearFollowupsByType:v6 type:3 error:&v16];
    id v14 = v16;

    if (v14)
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_100279908);
      }
      id v15 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)__int128 buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Error clearing tree reset followups for %@: %@",  buf,  0x16u);
      }
    }

    -[KTSMManager triggerStatusUpdate:](self, "triggerStatusUpdate:", v6);
  }
}

- (id)metricsRegistration_ktView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 smDataStore]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100039964;
  v8[3] = &unk_100279930;
  id v6 = v3;
  id v9 = v6;
  [v5 fetchDeviceSignature:0 complete:v8];

  return v6;
}

- (id)metricsRegistration_idsView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsOperations]);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_100039DD0;
  v34[3] = &unk_100279830;
  id v8 = v4;
  id v35 = v8;
  v36 = self;
  id v9 = v5;
  v37 = v9;
  [v7 fetchKTRegistrationStatus:v34];

  dispatch_time_t v10 = dispatch_time(0LL, 1000000000LL);
  if (!dispatch_semaphore_wait(v9, v10))
  {
    id v27 = v9;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue( +[TransparencyAnalytics analyticsApplications]( &OBJC_CLASS___TransparencyAnalytics,  "analyticsApplications"));
    id v11 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v29 = *(void *)v31;
      __int16 v13 = &off_100299B40;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v31 != v29) {
            objc_enumerationMutation(obj);
          }
          uint64_t v15 = *(void *)(*((void *)&v30 + 1) + 8LL * (void)i);
          id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"reg-%@",  v15));
          id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"unreg-%@",  v15));
          id v18 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v16]);

          if (v18)
          {
            __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v16]);
            id v20 = v13;
            id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:@"sig"]);

            BOOL v22 = v21 == 0LL;
            __int16 v13 = v20;
            if (v22) {
              v23 = v20;
            }
            else {
              v23 = &off_100299B28;
            }
          }

          else
          {
            v23 = &off_100299B58;
          }

          [v3 setObject:v23 forKeyedSubscript:v16];
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v17]);

          if (v24) {
            uint64_t v25 = v13;
          }
          else {
            uint64_t v25 = &off_100299B28;
          }
          [v3 setObject:v25 forKeyedSubscript:v17];
        }

        id v12 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }

      while (v12);
    }

    id v9 = v27;
  }

  return v3;
}

- (int)checkAccountKeyChanged
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager pcsOperation](self, "pcsOperation"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getCurrentKTPCSIdentity:off_1002E5928 error:0]);

  if (v4)
  {
    uint64_t PublicKey = PCSIdentityGetPublicKey([v4 identity]);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(PublicKey);
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 stateMonitor]);
      dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 ktStatus]);
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountKey]);

      if (v11 && ([v11 isEqual:v7] & 1) != 0)
      {
        int v12 = 1;
      }

      else
      {
        __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 stateMonitor]);
        [v14 setKTAccountKey:v7];

        int v12 = 3;
      }
    }

    else
    {
      int v12 = 1;
    }
  }

  else
  {
    int v12 = 2;
  }

  return v12;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager launch](self, "launch"));
  [v5 addEvent:v4];
}

- (BOOL)isCloudKitManateeAcountAvailable
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager cloudKitAccountInfo](self, "cloudKitAccountInfo"));
  unint64_t v3 = ((unint64_t)[v2 deviceToDeviceEncryptionAvailability] >> 1) & 1;

  return v3;
}

- (id)_onqueueNextStateMachineTransition:(id)a3 flags:(id)a4 pendingFlags:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[KTSMManager addEvent:](self, "addEvent:", v8);
  if (![v8 isEqual:@"PublicKeysInitialFetch"])
  {
    if ([v8 isEqual:@"PublicKeysWait"])
    {
      if ([v9 _onqueueContains:@"FetchPublicKeys"])
      {
        [v9 _onqueueRemoveFlag:@"FetchPublicKeys"];
        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"need-to-fetch-public-keys",  @"PublicKeysInitialFetch"));
LABEL_9:
        id v18 = (KTSetOptInStateOperation *)v19;
        goto LABEL_24;
      }

      id v20 = (KTPendingFlag *)objc_claimAutoreleasedReturnValue(-[KTSMManager publicKeyFetcher](self, "publicKeyFetcher"));
      -[KTPendingFlag trigger](v20, "trigger");
      goto LABEL_11;
    }

    if ([v8 isEqual:@"Initializing"])
    {
      [v9 _onqueueRemoveFlag:@"CKAccountChanged"];
      [v9 _onqueueRemoveFlag:@"AccountChanged"];
      [v9 _onqueueRemoveFlag:@"OctagonTrustChanged"];
      [v9 _onqueueRemoveFlag:@"ManateeViewChanged"];
      [v9 _onqueueRemoveFlag:@"EnsureIdentity"];
      [v9 _onqueueRemoveFlag:@"FetchSelf"];
      [v9 _onqueueRemoveFlag:@"CloudKitOutgoing"];
      [v9 _onqueueRemoveFlag:@"CheckAccountSignatures"];
      [v9 _onqueueRemoveFlag:@"CloudKitZoneRecreate"];
      [v9 _onqueueRemoveFlag:@"CheckKTAccountKey"];
      [v9 _onqueueRemoveFlag:@"CheckKTAccountKeyChanged"];
      [v9 _onqueueRemoveFlag:@"IDSStatusChanged"];
      uint64_t v19 = objc_claimAutoreleasedReturnValue(-[KTSMManager initializingOperation](self, "initializingOperation"));
      goto LABEL_9;
    }

    if ([v8 isEqual:@"KTDisabled"])
    {
      if (-[KTSMManager isKTDisabled](self, "isKTDisabled"))
      {
        if ([v9 _onqueueContains:@"ChangeOptInState"])
        {
          [v9 _onqueueRemoveFlag:@"ChangeOptInState"];
          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 targetOptInStates]);
          v23 = (void *)objc_claimAutoreleasedReturnValue([v22 allKeys]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 firstObject]);
          uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          [v25 setCurrentTarget:v24];

          id v26 = objc_alloc(&OBJC_CLASS___KTSetOptInStateOperation);
          id v27 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager optInStates](self, "optInStates"));
          id v18 = -[KTSetOptInStateOperation initWithDependenics:intendedState:errorState:optinStates:]( v26,  "initWithDependenics:intendedState:errorState:optinStates:",  v27,  @"KTDisabled",  @"KTDisabled",  v28);

LABEL_17:
          goto LABEL_24;
        }

        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue([v32 stateMonitor]);
        v34 = (void *)objc_claimAutoreleasedReturnValue([v33 ktStatus]);
        id v35 = [v34 optIn];

        if (v35 != (id)2) {
          goto LABEL_12;
        }
        v36 = objc_alloc(&OBJC_CLASS___KTFillStatusOperation);
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        uint64_t v38 = kKTApplicationIdentifierIDS;
        id v39 = v36;
        uint64_t v40 = 1LL;
        v41 = v37;
        v42 = @"KTDisabled";
        v43 = @"KTDisabled";
        goto LABEL_30;
      }

      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"initializing-after-disable"));
      __int128 v30 = (KTConfigBagFetchOperation *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  v29,  @"Initializing"));
      goto LABEL_22;
    }

    if ([v8 isEqual:@"WaitForUnlock"])
    {
      if (![v9 _onqueueContains:@"Unlocked"])
      {
        id v20 = -[KTPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:",  @"Unlocked",  1LL);
        [v10 _onqueueHandlePendingFlagLater:v20];
LABEL_11:

        goto LABEL_12;
      }

      [v9 _onqueueRemoveFlag:@"Unlocked"];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@",  @"initializing-after-unlock"));
      __int128 v30 = (KTConfigBagFetchOperation *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  v29,  @"Initializing"));
      goto LABEL_22;
    }

    if ([v8 isEqual:@"NoAccount"])
    {
      if ([v9 _onqueueContains:@"AccountChanged"])
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"account-probably-changed",  @"Initializing"));
        goto LABEL_9;
      }

      if ([v9 _onqueueContains:@"CKAccountChanged"])
      {
        uint64_t v19 = objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"account-probably-changed-ck",  @"Initializing"));
        goto LABEL_9;
      }

- (void)maybeCreateServerOptInFetch
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003F60C;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)_onQueueMaybeCreateNewServerOptInFetch
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v12 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v12 stateMonitor]);
  if (([v4 newServerOptInRequests] & 1) == 0)
  {

    return;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  if (v5)
  {
    uint64_t v6 = (void *)v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
    unsigned int v8 = [v7 isFinished];

    if (!v8) {
      return;
    }
  }

  else
  {
  }

  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_100279D70);
  }
  id v9 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Creating new ServerOptIn fetch", buf, 2u);
  }

  id v10 = -[KTSMManager _onqueueCreateNewServerOptInFetch](self, "_onqueueCreateNewServerOptInFetch");
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  [v11 cancelPendingFlag:@"CheckServerOptIn"];
}

- (id)_onqueueCreateNewServerOptInFetch
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInFetchReasons](self, "serverOptInFetchReasons"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  -[KTSMManager setServerOptInFetchReasons:](self, "setServerOptInFetchReasons:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 allObjects]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsJoinedByString:@","]);

  unsigned int v8 = objc_alloc(&OBJC_CLASS___KTFetchServerOptInStatus);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInScheduler](self, "serverOptInScheduler"));
  id v11 = -[KTFetchServerOptInStatus initWithDependencies:reason:retryScheduler:]( v8,  "initWithDependencies:reason:retryScheduler:",  v9,  v7,  v10);

  -[KTSMManager setCurrentServerOptInFetch:](self, "setCurrentServerOptInFetch:", v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 stateMonitor]);
  [v13 setNewServerOptInRequests:0];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10003FA18;
  v24[3] = &unk_100276740;
  v24[4] = self;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v24));
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  [v14 addNullableDependency:v15];

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 reachabilityTracker]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 reachabilityDependency]);
  [v16 addNullableDependency:v19];

  id v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager currentServerOptInFetch](self, "currentServerOptInFetch"));
  [v20 addOperation:v21];

  BOOL v22 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager operationQueue](self, "operationQueue"));
  [v22 addOperation:v14];

  return v11;
}

- (void)requestServerOptInFetchForManyReasons:(id)a3 delayInSeconds:(double)a4
{
  id v6 = a3;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_100279D90);
  }
  id v7 = (void *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = v7;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 componentsJoinedByString:@","]);
    *(_DWORD *)__int128 buf = 138412290;
    id v24 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "triggering a new server opt-in state fetch because of reason: %@",  buf,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 stateMonitor]);
  [v12 setNewServerOptInRequests:1];

  __int16 v13 = objc_alloc(&OBJC_CLASS___KTPendingFlag);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager serverOptInScheduler](self, "serverOptInScheduler"));
  uint64_t v15 = -[KTPendingFlag initWithFlag:conditions:scheduler:]( v13,  "initWithFlag:conditions:scheduler:",  @"CheckServerOptIn",  2LL,  v14);

  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 flagHandler]);
  [v17 handlePendingFlag:v15];

  id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FCF4;
  block[3] = &unk_1002794B0;
  block[4] = self;
  id v21 = v6;
  double v22 = a4;
  id v19 = v6;
  dispatch_async(v18, block);
}

- (void)newServerOptInFetch:(id)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  -[KTSMManager requestServerOptInFetchForManyReasons:delayInSeconds:]( self,  "requestServerOptInFetchForManyReasons:delayInSeconds:",  v4,  0.0);
}

- (void)triggerServerOptInFetch4h
{
}

- (void)triggerBAACertFetcher
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v3 certFetcher]);
  [v2 getDeviceCertWithForcedFetch:1 completionHandler:&stru_100279DD0];
}

- (void)postKTDisabledFollowup
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10003FFC0;
  v2[3] = &unk_100279E38;
  v2[4] = self;
  -[KTSMManager getOptInStateForApplication:complete:]( self,  "getOptInStateForApplication:complete:",  kKTApplicationIdentifierIDS,  v2);
}

- (void)updateKTDisabledForIDS:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataStore]);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100040220;
  v7[3] = &unk_100279E60;
  BOOL v8 = a3;
  v7[4] = self;
  [v6 peers:v7];
}

- (id)initializingOperation
{
  id location = 0LL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100040528;
  v4[3] = &unk_10027A150;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"transparency-initializing",  @"NoAccount",  @"Error",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)recheckAccount
{
  id location = 0LL;
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004219C;
  v4[3] = &unk_10027A150;
  objc_copyWeak(&v5, &location);
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"transparency-recheck-account",  @"Ready",  @"Initializing",  v4));
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)accountFirstSeenDate
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 logger]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 datePropertyForKey:off_1002DE280]);

  return v4;
}

- (void)clearAccountMetrics
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 logger]);
  [v4 setDateProperty:0 forKey:off_1002DE280];

  -[KTSMManager setLastSelfValidate:](self, "setLastSelfValidate:", 0LL);
}

- (id)lastSelfValidate
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 smDataStore]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 getSettingsDate:off_1002DE288]);

  return v4;
}

- (void)setLastSelfValidate:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v6 smDataStore]);
  [v5 setSettingsDate:off_1002DE288 date:v4];
}

- (BOOL)optOutWhenNotEligble:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(&OBJC_CLASS___KTIDSOpsOptInOutData);
  -[KTIDSOpsOptInOutData setOptInStatus:](v6, "setOptInStatus:", &__kCFBooleanFalse);
  id v16 = v5;
  uint64_t v17 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsOperations]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100042710;
  v14[3] = &unk_10027A198;
  void v14[4] = self;
  dispatch_semaphore_t v15 = v8;
  id v11 = v8;
  [v10 sendOptInUpdateRequest:v7 withCompletion:v14];

  dispatch_time_t v12 = dispatch_time(0LL, 2000000000LL);
  dispatch_semaphore_wait(v11, v12);

  return 1;
}

- (BOOL)changeOptInState:(unint64_t)a3 application:(id)a4 loggableData:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  unsigned __int8 v11 = -[KTSMManager isKTDisabled](self, "isKTDisabled");
  if (!a3 || (v11 & 1) == 0)
  {
    v54 = a5;
    v55 = a6;
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 accountOperations]);
    id v62 = 0LL;
    dispatch_semaphore_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 primaryAccount:&v62]);
    id v16 = v62;

    if (!v15)
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_10027A1B8);
      }
      uint64_t v17 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "no primary account: %{public}@",  (uint8_t *)&buf,  0xCu);
      }
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 accountOperations]);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 idsAccountTracker]);
    id v61 = v16;
    double v22 = (char *)[v19 ktAccountStatus:v15 idsAccountsTracker:v21 error:&v61];
    id v56 = v61;

    if ((unint64_t)(v22 - 4) >= 2)
    {
      if (v22)
      {
        BOOL v29 = 0;
        unint64_t v28 = 0LL;
        if (a3) {
          goto LABEL_11;
        }
      }

      else
      {
        __int128 v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
        +[TransparencySettings uiBlockingNetworkTimeout](&OBJC_CLASS___TransparencySettings, "uiBlockingNetworkTimeout");
        [v32 wait:(uint64_t)(v33 * 1000000000.0)];

        v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
        id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 stateMonitor]);
        v36 = (void *)objc_claimAutoreleasedReturnValue([v35 ktStatus]);
        unint64_t v28 = (unint64_t)[v36 accountStatus];

        BOOL v29 = (v28 & 0xFFFFFFFFFFFFFFFELL) != 2;
        if ((v28 & 0xFFFFFFFFFFFFFFFELL) == 2 && a3 != 0) {
          goto LABEL_11;
        }
      }
    }

    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager readyComplete](self, "readyComplete"));
      +[TransparencySettings uiBlockingNetworkTimeout](&OBJC_CLASS___TransparencySettings, "uiBlockingNetworkTimeout");
      [v23 wait:(uint64_t)(v24 * 1000000000.0)];

      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stateMonitor]);
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 ktStatus]);
      unint64_t v28 = (unint64_t)[v27 accountStatus];

      BOOL v29 = (v28 & 0xFFFFFFFFFFFFFFFELL) != 2;
      if (a3)
      {
LABEL_11:
        id v30 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorInternal,  -160LL,  v56,  @"Opt-in not allowed, account state: %d cdpState: %d",  v22,  v28));
        if (qword_1002E64C0 != -1) {
          dispatch_once(&qword_1002E64C0, &stru_10027A1D8);
        }
        __int128 v31 = (os_log_s *)qword_1002E64C8;
        if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = v30;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Opt-in not allowed: %{public}@",  (uint8_t *)&buf,  0xCu);
        }

        if (v55)
        {
          id v30 = v30;
          BOOL v12 = 0;
          id *v55 = v30;
        }

        else
        {
          BOOL v12 = 0;
        }

        goto LABEL_44;
      }
    }

    v66[0] = @"cdp";
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v28));
    v66[1] = @"newState";
    v67[0] = v38;
    id v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    v67[1] = v39;
    id v30 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  2LL));

    if (!v29)
    {
      v44 = (KTOptInWatcher *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorAccount,  -400LL,  @"No CloudKit, can't opt out"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
      [v47 logResultForEvent:kTransparencyAnalyticsEventOptIn hardFailure:1 result:v44 withAttributes:v30];

      BOOL v12 = -[KTSMManager optOutWhenNotEligble:error:](self, "optOutWhenNotEligble:error:", v10, v55);
LABEL_43:

LABEL_44:
      goto LABEL_45;
    }

    uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
    uint64_t v41 = kTransparencyAnalyticsEventOptIn;
    [v40 logResultForEvent:kTransparencyAnalyticsEventOptIn hardFailure:0 result:0 withAttributes:v30];

    v42 = -[KTOptInWatcher initWithTargetState:](objc_alloc(&OBJC_CLASS___KTOptInWatcher), "initWithTargetState:", a3);
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v64 = 0x2020000000LL;
    char v65 = 0;
    v43 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachineQueue](self, "stateMachineQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100042F40;
    block[3] = &unk_10027A200;
    block[4] = self;
    id v58 = v10;
    p___int128 buf = &buf;
    v44 = v42;
    v59 = v44;
    dispatch_sync(v43, block);

    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      id v45 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorInternal,  -342LL,  0LL,  @"opt-in pending"));
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
      [v46 logResultForEvent:v41 hardFailure:1 result:v45 withAttributes:v30];
    }

    else
    {
      -[KTSMManager triggerOptInStateChange](self, "triggerOptInStateChange");
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher targetResolved](v44, "targetResolved"));
      BOOL v49 = [v48 wait:120000000000] == 0;

      if (v49)
      {
        v51 = (void *)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher error](v44, "error"));

        if (!v51)
        {
          id v45 = 0LL;
          BOOL v12 = 1;
LABEL_37:
          if (v54) {
            id *v54 = (id)objc_claimAutoreleasedReturnValue(-[KTOptInWatcher loggableData](v44, "loggableData"));
          }
          if ((_DWORD)v51)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
            [v52 logResultForEvent:v41 hardFailure:1 result:v45 withAttributes:v30];
          }

          else
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](&OBJC_CLASS___TransparencyAnalytics, "logger"));
            [v52 logResultForEvent:v41 hardFailure:0 result:0 withAttributes:v30];
          }

          _Block_object_dispose(&buf, 8);
          goto LABEL_43;
        }

        uint64_t v50 = objc_claimAutoreleasedReturnValue(-[KTOptInWatcher error](v44, "error"));
      }

      else
      {
        uint64_t v50 = objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:underlyingError:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:underlyingError:description:",  kTransparencyErrorInternal,  -343LL,  0LL,  @"timeout setting opt-in"));
      }

      id v45 = (id)v50;
    }

    BOOL v12 = 0;
    LODWORD(v51) = v45 != 0LL;
    if (v55 && v45)
    {
      id v45 = v45;
      BOOL v12 = 0;
      id *v55 = v45;
      LODWORD(v51) = 1;
    }

    goto LABEL_37;
  }

  BOOL v12 = 0;
LABEL_45:

  return v12;
}

- (void)timeout:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_10027A220);
  }
  id v7 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)__int128 buf = 134217984;
    unint64_t v22 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Setting a timer to watch for IDS registration timeouts - timeout %llu",  buf,  0xCu);
  }

  dispatch_semaphore_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_source_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v8);
  -[KTSMManager setTimer:](self, "setTimer:", v9);

  id v10 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager timer](self, "timer"));
  dispatch_semaphore_t v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  uint64_t v17 = sub_100043208;
  id v18 = &unk_1002798C8;
  id v19 = self;
  id v20 = v6;
  id v11 = v6;
  dispatch_source_set_event_handler(v10, &v15);

  BOOL v12 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager timer](self, "timer", v15, v16, v17, v18, v19));
  dispatch_time_t v13 = dispatch_time(0LL, a3);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);

  id v14 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager timer](self, "timer"));
  dispatch_resume(v14);
}

- (void)waitForIDSRegistration:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 idsAccountTracker]);
  [v7 setTimeOfLastUpsell:v5];

  BOOL v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  id v14 = sub_100043448;
  dispatch_semaphore_t v15 = &unk_100279748;
  uint64_t v16 = self;
  id v17 = v4;
  id v8 = v4;
  -[KTSMManager _waitForIDSRegistration:](self, "_waitForIDSRegistration:", &v12);
  dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps", v12, v13, v14, v15, v16));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 idsOperations]);
  [v10 checkIDSTimeoutSeconds];
  -[KTSMManager timeout:block:](self, "timeout:block:", (unint64_t)(v11 * 1000000000.0), v8);
}

- (void)_waitForIDSRegistration:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager queue](self, "queue"));
  dispatch_source_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v5);
  -[KTSMManager setCheckIDSTimer:](self, "setCheckIDSTimer:", v6);

  id v7 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSTimer](self, "checkIDSTimer"));
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  uint64_t v16 = sub_100043614;
  id v17 = &unk_1002798C8;
  id v18 = self;
  id v19 = v4;
  id v8 = v4;
  dispatch_source_set_event_handler(v7, &v14);

  dispatch_source_t v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSTimer](self, "checkIDSTimer", v14, v15, v16, v17, v18));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v10 idsOperations]);
  [v11 sleepTimeBetweenIDSCheckups];
  dispatch_source_set_timer(v9, 0LL, (unint64_t)(v12 * 1000000000.0), 0x2FAF080uLL);

  uint64_t v13 = (dispatch_object_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkIDSTimer](self, "checkIDSTimer"));
  dispatch_resume(v13);
}

- (void)checkIDSHealth:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(&OBJC_CLASS___CheckIDSRegistrationMonitor);
  id location = 0LL;
  objc_initWeak(&location, self);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100043A24;
  v16[3] = &unk_10027A2B0;
  objc_copyWeak(&v18, &location);
  dispatch_source_t v6 = v5;
  id v17 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionGroupOperation named:intending:errorState:withBlockTakingSelf:]( &OBJC_CLASS___KTStateTransitionGroupOperation,  "named:intending:errorState:withBlockTakingSelf:",  @"check-ids-health",  @"Ready",  @"Ready",  v16));
  id v20 = @"Ready";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v8));

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100043AE8;
  v13[3] = &unk_10027A2F8;
  id v11 = v4;
  id v15 = v11;
  double v12 = v6;
  id v14 = v12;
  [v10 doSimpleStateMachineRPC:@"check-ids" op:v7 sourceStates:v9 reply:v13];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)checkKTAccountKey:(id)a3 complete:(id)a4
{
  id v7 = (void (**)(id, void))a4;
  -[KTSMManager idsServerReportKTKeyWrong:](self, "idsServerReportKTKeyWrong:", a3);
  dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager checkKTAccountKeyScheduler](self, "checkKTAccountKeyScheduler"));
  [v6 trigger];

  v7[2](v7, 0LL);
}

- (void)refreshDeviceList:(id)a3
{
  id v10 = (void (**)(id, void, void *))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager specificUser](self, "specificUser"));
  id v5 = v4;
  if (v4 && (dispatch_source_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 altDSID]), v6, v6))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idmsOperations]);
    dispatch_source_t v9 = (void *)objc_claimAutoreleasedReturnValue([v5 altDSID]);
    [v8 refreshDeviceList:v9 complete:v10];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -339LL,  @"No specific user available yet"));
    v10[2](v10, 0LL, v7);
  }
}

- (void)clearIDSCacheForUri:(id)a3 application:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication stripApplicationPrefixForIdentifier:uri:]( &OBJC_CLASS___TransparencyApplication,  "stripApplicationPrefixForIdentifier:uri:",  v6,  a3));
  id v8 = [[IDSURI alloc] initWithPrefixedURI:v7];
  id v9 = objc_alloc_init(&OBJC_CLASS___IDSCacheClearRequestContext);
  id v17 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  [v9 setUris:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyApplication idsServiceForIdentifier:]( &OBJC_CLASS___TransparencyApplication,  "idsServiceForIdentifier:",  v6));
  [v9 setService:v11];

  id v12 = objc_alloc_init(&OBJC_CLASS___IDSCacheClearRequest);
  id v16 = v9;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v12 setRequestContexts:v13];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 idsOperations]);
  [v15 cacheClearRequest:v12];
}

- (void)transparencyGetKTSignatures:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x3032000000LL;
  v20[3] = sub_100035018;
  v20[4] = sub_100035028;
  id v21 = 0LL;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_10027A318);
  }
  id v8 = (os_log_s *)(id)qword_1002E64C8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 requests]);
    unsigned int v10 = [v9 count];
    *(_DWORD *)__int128 buf = 67109120;
    unsigned int v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Getting signature request: %d", buf, 8u);
  }

  -[KTSMManager addEvent:](self, "addEvent:", @"GettingSignatureRequest");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[KTSMManager signatureQueue](self, "signatureQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000441CC;
  block[3] = &unk_100276740;
  block[4] = self;
  dispatch_async(v11, block);

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1000441D8;
  v15[3] = &unk_10027A450;
  id v18 = v20;
  void v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = v7;
  id v17 = v14;
  +[KTEnrollmentSignatureSupport updateClientData:deps:complete:]( &OBJC_CLASS___KTEnrollmentSignatureSupport,  "updateClientData:deps:complete:",  v13,  v12,  v15);

  _Block_object_dispose(v20, 8);
}

- (void)transparencyDumpKTRegistrationData:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 smDataStore]);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100044E6C;
  v8[3] = &unk_100276DF8;
  id v9 = v4;
  id v7 = v4;
  [v6 fetchDeviceSignature:0 complete:v8];
}

- (void)transparencyClearKTRegistrationData:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 smDataStore]);
  id v8 = 0LL;
  [v6 clearDeviceSignatures:&v8];
  id v7 = v8;

  v4[2](v4, v7);
}

- (void)transparencyPerformRegistrationSignature:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100044FEC;
  v4[3] = &unk_10027A2F8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  -[KTSMManager performRegistrationSignatures:](v5, "performRegistrationSignatures:", v4);
}

- (void)transparencyCloudDevices:(id)a3
{
  id v9 = (void (**)(id, void *, void))a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cloudRecords]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudRecords]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cloudDevices]);

    v9[2](v9, v8, 0LL);
  }

  else
  {
    v9[2](v9, 0LL, 0LL);
  }
}

- (void)setCloudKitOutgoingFlag
{
  id v5 = -[KTPendingFlag initWithFlag:conditions:delayInSeconds:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:delayInSeconds:",  @"CloudKitOutgoing",  2LL,  0.1);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 flagHandler]);
  [v4 handlePendingFlag:v5];
}

- (void)transparencyCloudDeviceAdd:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudRecords]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cloudRecords]);
    id v16 = 0LL;
    [v14 addDevice:v8 clientData:v9 error:&v16];
    id v15 = v16;

    -[KTSMManager setCloudKitOutgoingFlag](self, "setCloudKitOutgoingFlag");
    v10[2](v10, v15);
  }

  else
  {
    v10[2](v10, 0LL);
  }
}

- (void)transparencyCloudDeviceRemove:(id)a3 clientData:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudRecords]);

  if (v12)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 cloudRecords]);
    id v16 = 0LL;
    [v14 removeDevice:v8 clientData:v9 error:&v16];
    id v15 = v16;

    -[KTSMManager setCloudKitOutgoingFlag](self, "setCloudKitOutgoingFlag");
    v10[2](v10, v15);
  }

  else
  {
    v10[2](v10, 0LL);
  }
}

- (void)getOptInStateForAccount:(id)a3 complete:(id)a4
{
  id v5 = (void (**)(id, void *, id))a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cloudRecords]);

  if (v7)
  {
    id v14 = 0LL;
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 getAllOptInStatesAndReturnError:&v14]);
    id v9 = v14;
    if (v8)
    {
      unsigned int v10 = -[KTOptIOValidator initWithOptInRecords:uriToSMT:]( objc_alloc(&OBJC_CLASS____TtC13transparencyd16KTOptIOValidator),  "initWithOptInRecords:uriToSMT:",  v8,  &__NSDictionary0__struct);
      id v13 = v9;
      id v11 = (void *)objc_claimAutoreleasedReturnValue( -[KTOptIOValidator evaluateCloudDataWithApplication:error:]( v10,  "evaluateCloudDataWithApplication:error:",  @"IDS",  &v13));
      id v12 = v13;

      v5[2](v5, v11, v12);
      id v9 = v12;
    }

    else
    {
      v5[2](v5, 0LL, v9);
    }
  }

  else
  {
    v5[2](v5, 0LL, 0LL);
  }
}

- (void)getOptInForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, void *, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudRecords]);

  if (v12)
  {
    id v15 = 0LL;
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 getOptInStateWithUri:v8 application:v9 error:&v15]);
    id v14 = v15;
    v10[2](v10, v13, v14);
  }

  else
  {
    v10[2](v10, 0LL, 0LL);
  }
}

- (BOOL)addOptInStateWithURI:(id)a3 smtTimestamp:(id)a4 application:(id)a5 state:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 cloudRecords]);

  if (v16) {
    unsigned __int8 v17 = [v16 addOptInStateWithURI:v12 smtTimestamp:v13 application:v14 state:v8 error:a7];
  }
  else {
    unsigned __int8 v17 = 0;
  }

  return v17;
}

- (void)setOptInForURI:(id)a3 application:(id)a4 state:(BOOL)a5 smtTimestamp:(id)a6 complete:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = (void (**)(id, id, id))a7;
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  unsigned __int8 v17 = (void *)objc_claimAutoreleasedReturnValue([v16 cloudRecords]);

  if (v17)
  {
    if (!v14)
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_10027A470);
      }
      id v18 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_ERROR,  "using SMT timestamp now 'now', will lead to sadness",  buf,  2u);
      }

      id v14 = (id)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    }

    id v31 = v12;
    id v32 = v14;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
    id v29 = 0LL;
    id v20 = [v17 setOptInStateWithURIs:v19 application:v13 state:v9 error:&v29];
    id v21 = v29;
    if ((_DWORD)v20)
    {
      unint64_t v22 = -[KTPendingFlag initWithFlag:conditions:]( objc_alloc(&OBJC_CLASS___KTPendingFlag),  "initWithFlag:conditions:",  @"CloudKitOutgoing",  2LL);
      unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
      unint64_t v28 = v15;
      double v24 = v17;
      id v25 = v13;
      id v26 = v12;
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v23 flagHandler]);
      [v27 handlePendingFlag:v22];

      id v12 = v26;
      id v13 = v25;
      unsigned __int8 v17 = v24;
      id v15 = v28;
    }

    v15[2](v15, v20, v21);
  }

  else
  {
    v15[2](v15, 0LL, 0LL);
  }
}

- (void)getAllOptInStates:(id)a3
{
  id v4 = (void (**)(id, void *, id))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudRecords]);

  if (v6)
  {
    id v9 = 0LL;
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 getAllOptInStatesAndReturnError:&v9]);
    id v8 = v9;
    v4[2](v4, v7, v8);
  }

  else
  {
    v4[2](v4, 0LL, 0LL);
  }
}

- (void)getOptInStateForApplication:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudRecords]);

  if (v9)
  {
    id v12 = 0LL;
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 getAggregateOptInStateForApplication:v6 error:&v12]);
    id v11 = v12;
    v7[2](v7, v10, v11);
  }

  else
  {
    v7[2](v7, 0LL, 0LL);
  }
}

- (void)clearOptInStateForURI:(id)a3 application:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = (void (**)(id, id, id))a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudRecords]);

  if (v12)
  {
    id v15 = 0LL;
    id v13 = [v12 clearOptInStateForURI:v8 application:v9 error:&v15];
    id v14 = v15;
    v10[2](v10, v13, v14);
  }

  else
  {
    v10[2](v10, 0LL, 0LL);
  }
}

- (void)resetLocalCloudDataState
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"cloud-data-reset",  @"ResetLocalCloudState"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](&OBJC_CLASS___KTStates, "KTStateMap"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v5));
  [v3 doSimpleStateMachineRPC:@"cloud-data-reset" op:v7 sourceStates:v6 reply:&stru_10027A4B0];
}

- (void)uriNeedsUpdate:(id)a3 forApplication:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_10027A4F0);
  }
  id v7 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "uriNeedsUpdate: %@[%@]", (uint8_t *)&v8, 0x16u);
  }
}

- (void)inspectErrorForRetryAfter:(id)a3 trigger:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = CKRetryAfterSecondsForError(v5);
  if (v7 != 0.0)
  {
    double v8 = v7;
    unint64_t v9 = 1000000000 * (unint64_t)v7;
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A510);
    }
    __int16 v10 = (void *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v10;
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 name]);
      int v13 = 138412802;
      id v14 = v12;
      __int16 v15 = 2048;
      double v16 = v8;
      __int16 v17 = 2112;
      id v18 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "CK operation failed, scheduling %@ delay for %.1f seconds: %@",  (uint8_t *)&v13,  0x20u);
    }

    [v6 waitUntil:v9];
  }
}

- (BOOL)isKTDisabled
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 idsConfigBag]);
  unsigned __int8 v4 = [v3 ktDisable];

  return v4;
}

- (void)idsServerBagUpdate
{
  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_10027A530);
  }
  id v3 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "IDS server bag update", buf, 2u);
  }

  if (_os_feature_enabled_impl("Transparency", "KTEnableKillSwitch"))
  {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue( +[KTStateTransitionOperation named:entering:]( &OBJC_CLASS___KTStateTransitionOperation,  "named:entering:",  @"ids-server-bag-update",  @"Initializing"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager stateMachine](self, "stateMachine"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[KTStates KTStateMap](&OBJC_CLASS___KTStates, "KTStateMap"));
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allKeys]);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v7));
    [v5 doSimpleStateMachineRPC:@"ids-server-bag-update" op:v4 sourceStates:v8 reply:&stru_10027A550];
  }

  else
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A590);
    }
    unint64_t v9 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "An IDS server bag update happened but 'KTEnableKillSwitch' feature flag is not enabled",  v10,  2u);
    }
  }

- (void)triggerCheckCKKSOctagonEligibility
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 octagonOperations]);
  unsigned __int8 v5 = [v4 ckksViewReady:@"Manatee" error:0];

  if ((v5 & 1) == 0) {
    -[KTSMManager storeEligiblilitySuccess:](self, "storeEligiblilitySuccess:", @"ckks");
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 octagonOperations]);
  unsigned __int8 v8 = [v7 getCachedOctagonStatus];

  if ((v8 & 1) != 0)
  {
    -[KTSMManager storeEligiblilitySuccess:](self, "storeEligiblilitySuccess:", @"octagon");
  }

  else
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorEligibility,  -395LL,  @"octagon status is pending or untrusted"));
    -[KTSMManager storeEligiblilityFailure:error:](self, "storeEligiblilityFailure:error:", @"octagon", v9);
  }

- (void)storeEligiblilitySuccess:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl("Transparency", "KTEligibilityMetrics"))
  {
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

    if (v5)
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue( +[KTEligibilityStatusResult statusResultWithSuccessWithElement:]( &OBJC_CLASS____TtC13transparencyd25KTEligibilityStatusResult,  "statusResultWithSuccessWithElement:",  v4));
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
      [v7 storeWithStatus:v6 completionHandler:&stru_10027A5F0];
    }

    else
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_10027A5B0);
      }
      unsigned __int8 v8 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "Did not store eligiblity result, status reporting object is nil",  v9,  2u);
      }
    }
  }
}

- (void)storeEligiblilityFailure:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl("Transparency", "KTEligibilityMetrics"))
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue( +[KTEligibilityStatusResult statusResultWithFailureWithElement:error:]( &OBJC_CLASS____TtC13transparencyd25KTEligibilityStatusResult,  "statusResultWithFailureWithElement:error:",  v6,  v7));
      __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
      [v10 storeWithStatus:v9 completionHandler:&stru_10027A650];
    }

    else
    {
      if (qword_1002E64C0 != -1) {
        dispatch_once(&qword_1002E64C0, &stru_10027A630);
      }
      id v11 = (os_log_s *)qword_1002E64C8;
      if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "Did not store eligiblity result, status reporting object is nil",  v12,  2u);
      }
    }
  }
}

- (void)triggerMaybeReportEligibilityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((_os_feature_enabled_impl("Transparency", "KTEligibilityServerReporting") & 1) == 0)
  {
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A690);
    }
    id v7 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEBUG,  "KTEligibilityServerReporting feature not enabled",  buf,  2u);
    }

    unsigned __int8 v8 = @"transparencyd.KTEligibilityError";
    id v9 = @"Feature flag not enabled";
    uint64_t v10 = 9LL;
    goto LABEL_10;
  }

  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (!v5)
  {
    unsigned __int8 v8 = (const __CFString *)kTransparencyErrorInternal;
    id v9 = @"State Machine not initialized yet, can't run eligibility commands";
    uint64_t v10 = -367LL;
LABEL_10:
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v8,  v10,  v9));
    v4[2](v4, 0LL, v11);

    goto LABEL_11;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100046A8C;
  v12[3] = &unk_10027A788;
  v12[4] = self;
  int v13 = v4;
  [v6 cachedTimeOfLastReportWithCompletionHandler:v12];

LABEL_11:
}

- (void)updateIDSRecommendation:(BOOL)a3 complete:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, void *))a4;
  if ((_os_feature_enabled_impl("Transparency", "KTEligibilityServerReporting") & 1) == 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorEligibility,  9LL,  @"KTEligibilityServerReporting feature not enabled"));
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A7A8);
    }
    uint64_t v10 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "KTEligibilityServerReporting feature not enabled",  buf,  2u);
    }

    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (!v7)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -367LL,  @"State Machine not initialized yet, can't run eligibility commands"));
LABEL_9:
    v6[2](v6, v9);

    goto LABEL_10;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  _DWORD v11[2] = sub_1000471D0;
  v11[3] = &unk_10027A7D0;
  id v12 = v6;
  [v8 setLastIDSRecWithRecommendation:v4 completionHandler:v11];

LABEL_10:
}

- (void)setOSUpdate:(BOOL)a3 complete:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (v7)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000472D8;
    v10[3] = &unk_10027A7D0;
    id v11 = v6;
    [v8 setHasDoneOSUpdateWithValue:v4 completionHandler:v10];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -367LL,  @"State Machine not initialized yet, can't run eligibility commands"));
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }
}

- (void)clearEligibilityOverrides:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000473D8;
    v8[3] = &unk_10027A7D0;
    id v9 = v4;
    [v6 clearEligibilityOverridesWithCompletionHandler:v8];
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -367LL,  @"State Machine not initialized yet, can't run eligibility commands"));
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

- (void)setOverrideTimeBetweenReports:(double)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (v7)
  {
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1000474E8;
    v10[3] = &unk_10027A7D0;
    id v11 = v6;
    [v8 setOverrideTimeBetweenReportsWithValue:v10 completionHandler:a3];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -367LL,  @"State Machine not initialized yet, can't run eligibility commands"));
    (*((void (**)(id, void *))v6 + 2))(v6, v9);
  }
}

- (void)reportEligibility:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if ((_os_feature_enabled_impl("Transparency", "KTEligibilityServerReporting") & 1) == 0)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorEligibility,  9LL,  @"KTEligibilityServerReporting feature not enabled"));
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A7F0);
    }
    id v12 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "KTEligibilityServerReporting feature not enabled",  (uint8_t *)location,  2u);
    }

    goto LABEL_9;
  }

  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (!v8)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -367LL,  @"State Machine not initialized yet, can't run eligibility commands"));
LABEL_9:
    v7[2](v7, 0LL, v11);

    goto LABEL_10;
  }

  location[0] = 0LL;
  objc_initWeak(location, self);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
  id v10 = [v6 BOOLValue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10004774C;
  v13[3] = &unk_10027A860;
  objc_copyWeak(&v15, location);
  id v14 = v7;
  [v9 setOverrideReportValueWithReportValue:v10 completionHandler:v13];

  objc_destroyWeak(&v15);
  objc_destroyWeak(location);
LABEL_10:
}

- (void)getAggregateResult:(int64_t)a3 element:(id)a4 complete:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void, void *))a5;
  if ((_os_feature_enabled_impl("Transparency", "KTEligibilityMetrics") & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorEligibility,  9LL,  @"KTEligibilityMetrics feature not enabled"));
    if (qword_1002E64C0 != -1) {
      dispatch_once(&qword_1002E64C0, &stru_10027A880);
    }
    int v13 = (os_log_s *)qword_1002E64C8;
    if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "KTEligibilityMetrics feature not enabled",  buf,  2u);
    }

    goto LABEL_9;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

  if (!v10)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -367LL,  @"State Machine not initialized yet, can't run eligibility commands"));
LABEL_9:
    v9[2](v9, 0LL, v12);

    goto LABEL_10;
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100047A38;
  v14[3] = &unk_10027A8A8;
  id v15 = v9;
  [v11 aggregateResultWithSamples:a3 element:v8 completionHandler:v14];

LABEL_10:
}

- (void)insertResultForElement:(id)a3 samplesAgo:(id)a4 success:(BOOL)a5 complete:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ((_os_feature_enabled_impl("Transparency", "KTEligibilityMetrics") & 1) != 0)
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));

    if (v13)
    {
      if ([v11 count] == (id)1)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
        uint64_t v16 = (int)[v15 intValue];
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472LL;
        v46[2] = sub_100047F54;
        v46[3] = &unk_100279428;
        id v47 = v12;
        [v14 insertResultWithElement:v10 samplesAgo:v16 success:v7 completionHandler:v46];

        goto LABEL_21;
      }

      if ([v11 count] == (id)2)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:0]);
        id v32 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndexedSubscript:1]);
        if (objc_msgSend(v21, "compare:") == (id)1)
        {
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  kTransparencyErrorInternal,  -399LL,  @"Invalid sample range"));
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanseErrorForXPC:", v22));
          (*((void (**)(id, void *))v12 + 2))(v12, v23);
        }

        else
        {
          dispatch_queue_attr_t v26 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          id v27 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v26);
          dispatch_queue_t v28 = dispatch_queue_create("com.apple.transparency.eligibilityCLIQueue", v27);

          *(void *)__int128 buf = 0LL;
          uint64_t v41 = buf;
          uint64_t v42 = 0x3032000000LL;
          v43 = sub_100035018;
          v44 = sub_100035028;
          id v45 = 0LL;
          id v29 = dispatch_group_create();
          for (uint64_t i = (int)[v21 intValue]; i <= (int)objc_msgSend(v32, "intValue"); ++i)
          {
            dispatch_group_enter(v29);
            id v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager statusReporting](self, "statusReporting"));
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472LL;
            void v36[2] = sub_100047FA4;
            v36[3] = &unk_10027A8F0;
            v37 = v28;
            id v39 = buf;
            uint64_t v38 = v29;
            [v31 insertResultWithElement:v10 samplesAgo:i success:v7 completionHandler:v36];
          }

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100048088;
          block[3] = &unk_10027A918;
          id v34 = v12;
          id v35 = buf;
          dispatch_group_notify(v29, v28, block);

          _Block_object_dispose(buf, 8);
        }

        goto LABEL_21;
      }

      uint64_t v18 = kTransparencyErrorInternal;
      id v19 = @"Invalid sample range";
      uint64_t v20 = -399LL;
    }

    else
    {
      uint64_t v18 = kTransparencyErrorInternal;
      id v19 = @"State Machine not initialized yet, can't run eligibility commands";
      uint64_t v20 = -367LL;
    }

    double v24 = (void *)objc_claimAutoreleasedReturnValue( +[TransparencyError errorWithDomain:code:description:]( &OBJC_CLASS___TransparencyError,  "errorWithDomain:code:description:",  v18,  v20,  v19));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(+[SecXPCHelper cleanseErrorForXPC:](&OBJC_CLASS___SecXPCHelper, "cleanseErrorForXPC:", v24));
    (*((void (**)(id, void *))v12 + 2))(v12, v25);

    goto LABEL_21;
  }

  if (qword_1002E64C0 != -1) {
    dispatch_once(&qword_1002E64C0, &stru_10027A8C8);
  }
  __int16 v17 = (os_log_s *)qword_1002E64C8;
  if (os_log_type_enabled((os_log_t)qword_1002E64C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "KTEligibilityMetrics feature not enabled",  buf,  2u);
  }

  (*((void (**)(id, void))v12 + 2))(v12, 0LL);
LABEL_21:
}

- (void)triggerIDSServerBagNotification
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 postNotificationName:IDSServerBagFinishedLoadingNotification object:self];
}

- (void)triggerCloudKitStaticKeyRemoteUpdateNotification
{
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTSMManager deps](self, "deps"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 staticKeyStore]);
  [v5 postNotificationName:NSPersistentStoreRemoteChangeNotification object:v4];
}

- (void)xpc24HrNotification:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date", a3));
  -[KTSMManager triggerIDMSFetchBackstop:](self, "triggerIDMSFetchBackstop:", v4);

  -[KTSMManager triggerKTAccountKeySignature:](self, "triggerKTAccountKeySignature:", 10.0);
  -[KTSMManager triggerCheckIDSRegistration](self, "triggerCheckIDSRegistration");
  -[KTSMManager triggerCheckExpiredPublicKeyStores](self, "triggerCheckExpiredPublicKeyStores");
  -[KTSMManager triggerCKFetch24h](self, "triggerCKFetch24h");
  -[KTSMManager triggerMaybeReportEligibilityWithCompletion:]( self,  "triggerMaybeReportEligibilityWithCompletion:",  &stru_10027A938);
}

- (BOOL)shouldPokeIDSUponSigning
{
  return self->shouldPokeIDSUponSigning;
}

- (void)setShouldPokeIDSUponSigning:(BOOL)a3
{
  self->shouldPokeIDSUponSigning = a3;
}

- (KTCondition)signaturesComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSignaturesComplete:(id)a3
{
}

- (OS_dispatch_queue)signatureQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setSignatureQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setQueue:(id)a3
{
}

- (KTSpecificUser)specificUser
{
  return (KTSpecificUser *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSpecificUser:(id)a3
{
}

- (KTStateMachine)stateMachine
{
  return (KTStateMachine *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setStateMachine:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (OS_dispatch_queue)stateMachineQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setStateMachineQueue:(id)a3
{
}

- (KTPCSOperationDependency)pcsOperation
{
  return (KTPCSOperationDependency *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setPcsOperation:(id)a3
{
}

- (KTNearFutureScheduler)checkIDSRegistration
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setCheckIDSRegistration:(id)a3
{
}

- (KTNearFutureScheduler)pokeIDS
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 96LL, 1);
}

- (void)setPokeIDS:(id)a3
{
}

- (KTCondition)successfulIDSRegistrationCheck
{
  return (KTCondition *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setSuccessfulIDSRegistrationCheck:(id)a3
{
}

- (BOOL)idsServerReportedWrong
{
  return self->_idsServerReportedWrong;
}

- (void)setIdsServerReportedWrong:(BOOL)a3
{
  self->_idsServerReportedWrong = a3;
}

- (NSData)idsServerReportedWrongPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 112LL, 1);
}

- (void)setIdsServerReportedWrongPublicKey:(id)a3
{
}

- (KTNearFutureScheduler)manateeViewChangedScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setManateeViewChangedScheduler:(id)a3
{
}

- (KTFetchIDMSOperation)lastFetchIDMS
{
  return (KTFetchIDMSOperation *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setLastFetchIDMS:(id)a3
{
}

- (KTSignalIDSOperation)lastSignalIDS
{
  return (KTSignalIDSOperation *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setLastSignalIDS:(id)a3
{
}

- (KTFetchIDSSelfOperation)lastFetchIDSSelf
{
  return (KTFetchIDSSelfOperation *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setLastFetchIDSSelf:(id)a3
{
}

- (KTFetchKTSelfOperation)lastFetchKTSelf
{
  return (KTFetchKTSelfOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setLastFetchKTSelf:(id)a3
{
}

- (KTValidateSelfOperation)lastValidateSelf
{
  return (KTValidateSelfOperation *)objc_getProperty(self, a2, 160LL, 1);
}

- (void)setLastValidateSelf:(id)a3
{
}

- (KTValidateSelfOperation)lastValidateSelfOptIn
{
  return (KTValidateSelfOperation *)objc_getProperty(self, a2, 168LL, 1);
}

- (void)setLastValidateSelfOptIn:(id)a3
{
}

- (KTEnrollmentRegistrationSignature)lastRegistration
{
  return (KTEnrollmentRegistrationSignature *)objc_getProperty(self, a2, 176LL, 1);
}

- (void)setLastRegistration:(id)a3
{
}

- (KTForceSyncKVSOperation)lastForceSyncKVS
{
  return (KTForceSyncKVSOperation *)objc_getProperty(self, a2, 184LL, 1);
}

- (void)setLastForceSyncKVS:(id)a3
{
}

- (NSOperation)lastCKFetch
{
  return (NSOperation *)objc_getProperty(self, a2, 192LL, 1);
}

- (void)setLastCKFetch:(id)a3
{
}

- (KTPublicKeyStoreRefresh)lastPublicKeyRefresh
{
  return (KTPublicKeyStoreRefresh *)objc_getProperty(self, a2, 200LL, 1);
}

- (void)setLastPublicKeyRefresh:(id)a3
{
}

- (KTCheckIDSRegistrationOperation)lastCheckIDSRegistration
{
  return (KTCheckIDSRegistrationOperation *)objc_getProperty(self, a2, 208LL, 1);
}

- (void)setLastCheckIDSRegistration:(id)a3
{
}

- (KTBackgroundSystemValidationOperation)lastDutyCycle
{
  return (KTBackgroundSystemValidationOperation *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setLastDutyCycle:(id)a3
{
}

- (KTNearFutureScheduler)ckFetchScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 224LL, 1);
}

- (void)setCkFetchScheduler:(id)a3
{
}

- (KTNearFutureScheduler)serverOptInScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 232LL, 1);
}

- (void)setServerOptInScheduler:(id)a3
{
}

- (_TtC13transparencyd28KTEligibilityStatusReporting)statusReporting
{
  return (_TtC13transparencyd28KTEligibilityStatusReporting *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setStatusReporting:(id)a3
{
}

- (KTCondition)pendingValidationsComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 248LL, 1);
}

- (void)setPendingValidationsComplete:(id)a3
{
}

- (OS_dispatch_queue)metricsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setMetricsQueue:(id)a3
{
}

- (CKAccountInfo)cloudKitAccountInfo
{
  return (CKAccountInfo *)objc_getProperty(self, a2, 264LL, 1);
}

- (void)setCloudKitAccountInfo:(id)a3
{
}

- (NSDate)lastPush
{
  return (NSDate *)objc_getProperty(self, a2, 272LL, 1);
}

- (void)setLastPush:(id)a3
{
}

- (os_unfair_lock_s)metricsLock
{
  return self->_metricsLock;
}

- (void)setMetricsLock:(os_unfair_lock_s)a3
{
  self->_metricsLock = a3;
}

- (KTOptInStateHolder)optInStates
{
  return (KTOptInStateHolder *)objc_getProperty(self, a2, 280LL, 1);
}

- (void)setOptInStates:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 288LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 296LL, 1);
}

- (void)setTimer:(id)a3
{
}

- (OS_dispatch_source)checkIDSTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 304LL, 1);
}

- (void)setCheckIDSTimer:(id)a3
{
}

- (NSMutableDictionary)selfVerificationInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 312LL, 1);
}

- (void)setSelfVerificationInfo:(id)a3
{
}

- (KTSMSelfValidationResult)selfValidationResult
{
  return (KTSMSelfValidationResult *)objc_getProperty(self, a2, 320LL, 1);
}

- (void)setSelfValidationResult:(id)a3
{
}

- (KTNearFutureScheduler)publicKeyFetcher
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 328LL, 1);
}

- (void)setPublicKeyFetcher:(id)a3
{
}

- (KTNearFutureScheduler)retryEnsureIdentity
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 336LL, 1);
}

- (void)setRetryEnsureIdentity:(id)a3
{
}

- (KTNearFutureScheduler)retryGetPrimaryAccount
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 344LL, 1);
}

- (void)setRetryGetPrimaryAccount:(id)a3
{
}

- (KTNearFutureScheduler)checkKTAccountKeyScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 352LL, 1);
}

- (void)setCheckKTAccountKeyScheduler:(id)a3
{
}

- (KTNearFutureScheduler)checkKTSignatureScheduler
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 360LL, 1);
}

- (void)setCheckKTSignatureScheduler:(id)a3
{
}

- (KTNearFutureScheduler)retryPendingValidations
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 368LL, 1);
}

- (void)setRetryPendingValidations:(id)a3
{
}

- (int)manateeViewToken
{
  return self->_manateeViewToken;
}

- (void)setManateeViewToken:(int)a3
{
  self->_int manateeViewToken = a3;
}

- (KTFetchCloudOperation)currentCKFetch
{
  return (KTFetchCloudOperation *)objc_getProperty(self, a2, 376LL, 1);
}

- (void)setCurrentCKFetch:(id)a3
{
}

- (BOOL)newCKRequests
{
  return self->_newCKRequests;
}

- (void)setNewCKRequests:(BOOL)a3
{
  self->_newCKRequests = a3;
}

- (NSMutableSet)ckFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 384LL, 1);
}

- (void)setCkFetchReasons:(id)a3
{
}

- (KTZoneFetchDependencyOperation)successfulCKFetchDependency
{
  return (KTZoneFetchDependencyOperation *)objc_getProperty(self, a2, 392LL, 1);
}

- (void)setSuccessfulCKFetchDependency:(id)a3
{
}

- (NSMutableSet)inflightCKFetchDependencies
{
  return (NSMutableSet *)objc_getProperty(self, a2, 400LL, 1);
}

- (void)setInflightCKFetchDependencies:(id)a3
{
}

- (KTFetchServerOptInStatus)currentServerOptInFetch
{
  return (KTFetchServerOptInStatus *)objc_getProperty(self, a2, 408LL, 1);
}

- (void)setCurrentServerOptInFetch:(id)a3
{
}

- (NSMutableSet)serverOptInFetchReasons
{
  return (NSMutableSet *)objc_getProperty(self, a2, 416LL, 1);
}

- (void)setServerOptInFetchReasons:(id)a3
{
}

- (KTCondition)initializedComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 424LL, 1);
}

- (void)setInitializedComplete:(id)a3
{
}

- (KTCondition)readyComplete
{
  return (KTCondition *)objc_getProperty(self, a2, 432LL, 1);
}

- (void)setReadyComplete:(id)a3
{
}

- (SecLaunchSequence)launch
{
  return (SecLaunchSequence *)objc_getProperty(self, a2, 440LL, 1);
}

- (void)setLaunch:(id)a3
{
}

- (_TtC13transparencyd10KTWatchdog)watchdog
{
  return (_TtC13transparencyd10KTWatchdog *)objc_getProperty(self, a2, 448LL, 1);
}

- (void)setWatchdog:(id)a3
{
}

- (void).cxx_destruct
{
}

@end