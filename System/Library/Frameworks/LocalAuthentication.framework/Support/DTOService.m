@interface DTOService
- (DTOService)initWithWorkQueue:(id)a3 notificationCenter:(id)a4 ui:(id)a5;
- (LACDTOEnvironmentProviding)environmentProvider;
- (LACDTOFeatureControlling)featureController;
- (LACDTOPendingPolicyEvaluationController)pendingPolicyEvaluationController;
- (LACDTORatchetStateProvider)ratchetStateProvider;
- (LACDTOServiceXPC)xpcController;
- (id)processor;
- (void)startServices;
@end

@implementation DTOService

- (DTOService)initWithWorkQueue:(id)a3 notificationCenter:(id)a4 ui:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (objc_opt_class(&OBJC_CLASS___LACDTOPolicyEvaluationController))
  {
    v114.receiver = self;
    v114.super_class = (Class)&OBJC_CLASS___DTOService;
    v12 = -[DTOService init](&v114, "init");
    v13 = v12;
    if (v12)
    {
      objc_storeStrong((id *)&v12->_workQueue, a3);
      objc_storeStrong((id *)&v13->_uiController, a5);
      id v89 = v11;
      v14 = objc_alloc_init(&OBJC_CLASS___DTOPolicyEvaluationIdentifierFactory);
      v15 = -[DTOKVStore initWithWorkQueue:](objc_alloc(&OBJC_CLASS___DTOKVStore), "initWithWorkQueue:", v9);
      kvStore = v13->_kvStore;
      v13->_kvStore = (LACDTOKVStore *)v15;

      v17 = objc_alloc(&OBJC_CLASS___DTORatchetHandler);
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedInstance](&OBJC_CLASS___Daemon, "sharedInstance"));
      v19 = -[DTORatchetHandler initWithContextProvider:kvstore:]( v17,  "initWithContextProvider:kvstore:",  v18,  v13->_kvStore);

      v20 = objc_alloc(&OBJC_CLASS___LACDTOKVStoreMigrationController);
      v21 = v13->_kvStore;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[LACGlobalDomain sharedInstance](&OBJC_CLASS___LACGlobalDomain, "sharedInstance"));
      v23 = -[LACDTOKVStoreMigrationController initWithKVStore:defaults:workQueue:]( v20,  "initWithKVStore:defaults:workQueue:",  v21,  v22,  v13->_workQueue);
      kvsMigrationController = v13->_kvsMigrationController;
      v13->_kvsMigrationController = v23;

      uint64_t v25 = objc_claimAutoreleasedReturnValue( +[LACPersistentStoreFactory makePersistentStoreWithSuiteName:]( &OBJC_CLASS___LACPersistentStoreFactory,  "makePersistentStoreWithSuiteName:",  0LL));
      persistentStore = v13->_persistentStore;
      v13->_persistentStore = (LACPersistentStore *)v25;

      v27 = objc_alloc_init(&OBJC_CLASS___DTODeviceInfoProvider);
      deviceInfo = v13->_deviceInfo;
      v13->_deviceInfo = (LACDTODeviceInfoProvider *)v27;

      v29 = objc_alloc_init(&OBJC_CLASS___LACDTOEventBus);
      eventBus = v13->_eventBus;
      v13->_eventBus = v29;

      id v91 = v10;
      v111[0] = _NSConcreteStackBlock;
      v111[1] = 3221225472LL;
      v111[2] = sub_1000038DC;
      v111[3] = &unk_1000308E0;
      v31 = v13;
      v112 = v31;
      id v32 = v9;
      id v113 = v32;
      v33 = sub_1000038DC((uint64_t)v111);
      uint64_t v34 = objc_claimAutoreleasedReturnValue(v33);
      featureController = v31->_featureController;
      v31->_featureController = (LACDTOFeatureController *)v34;

      uint64_t v36 = objc_claimAutoreleasedReturnValue( +[LACDTOLocationControllerFactory controllerWithStore:featureController:eventBus:workQueue:]( &OBJC_CLASS___LACDTOLocationControllerFactory,  "controllerWithStore:featureController:eventBus:workQueue:",  v13->_kvStore,  v31->_featureController,  v13->_eventBus,  v32));
      locationProvider = v31->_locationProvider;
      v31->_locationProvider = (LACDTOLocationController *)v36;

      v108[0] = _NSConcreteStackBlock;
      v108[1] = 3221225472LL;
      v108[2] = sub_100003988;
      v108[3] = &unk_100030930;
      id v38 = v32;
      id v109 = v38;
      v39 = v31;
      v110 = v39;
      v40 = sub_100003988((uint64_t)v108);
      uint64_t v41 = objc_claimAutoreleasedReturnValue(v40);
      lostMode = v39->_lostMode;
      v39->_lostMode = (LACDTOLostModeController *)v41;

      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472LL;
      v104[2] = sub_100003AA0;
      v104[3] = &unk_100030958;
      v43 = v19;
      v105 = v43;
      id v44 = v38;
      id v106 = v44;
      v45 = v39;
      v107 = v45;
      v46 = sub_100003AA0(v104);
      uint64_t v47 = objc_claimAutoreleasedReturnValue(v46);
      ratchetStateProvider = v45->_ratchetStateProvider;
      v45->_ratchetStateProvider = (LACDTORatchetStateMonitor *)v47;

      v99[0] = _NSConcreteStackBlock;
      v99[1] = 3221225472LL;
      v99[2] = sub_100003AF4;
      v99[3] = &unk_100030980;
      id v90 = v9;
      v49 = v45;
      v100 = v49;
      v101 = v43;
      v102 = v14;
      id v50 = v44;
      id v103 = v50;
      v87 = v14;
      v88 = v43;
      v51 = sub_100003AF4(v99);
      uint64_t v52 = objc_claimAutoreleasedReturnValue(v51);
      pendingEvaluationsController = v49->_pendingEvaluationsController;
      v49->_pendingEvaluationsController = (LACDTOPendingPolicyEvaluationController *)v52;

      uint64_t v54 = objc_claimAutoreleasedReturnValue( +[LACDTOEnvironmentProviderFactory environmentProviderWithLocationProvider:featureController:ratchetStateProvider:lostModeController:]( &OBJC_CLASS___LACDTOEnvironmentProviderFactory,  "environmentProviderWithLocationProvider:featureController:ratchetStateProvider:lostModeController:",  v31->_locationProvider,  v31->_featureController,  v45->_ratchetStateProvider,  v39->_lostMode));
      environmentProvider = v49->_environmentProvider;
      v49->_environmentProvider = (LACDTOEnvironmentProviding *)v54;

      v96[0] = _NSConcreteStackBlock;
      v96[1] = 3221225472LL;
      v96[2] = sub_100003B4C;
      v96[3] = &unk_1000309A8;
      id v56 = v10;
      id v97 = v56;
      v57 = v49;
      v98 = v57;
      v58 = sub_100003B4C((uint64_t)v96);
      uint64_t v59 = objc_claimAutoreleasedReturnValue(v58);
      id v60 = v57[17];
      v57[17] = (id)v59;

      v61 = -[LACDTOPolicyEvaluationController initWithEnvironment:evaluationIdentifierFactory:device:]( objc_alloc(&OBJC_CLASS___LACDTOPolicyEvaluationController),  "initWithEnvironment:evaluationIdentifierFactory:device:",  v49->_environmentProvider,  v87,  v13->_deviceInfo);
      id v62 = v57[1];
      v57[1] = v61;

      [v57[1] addObserver:v49->_pendingEvaluationsController];
      [v57[1] addObserver:v45->_ratchetStateProvider];
      -[LACDTOPendingPolicyEvaluationController addObserver:]( v49->_pendingEvaluationsController,  "addObserver:",  v31->_locationProvider);
      v94[0] = _NSConcreteStackBlock;
      v94[1] = 3221225472LL;
      v94[2] = sub_100003B94;
      v94[3] = &unk_1000309D0;
      v63 = v57;
      v95 = v63;
      v64 = sub_100003B94((uint64_t)v94);
      uint64_t v65 = objc_claimAutoreleasedReturnValue(v64);
      id v66 = v63[2];
      v63[2] = (id)v65;

      v67 = -[LACDTOSensorTrustService initWithReplyQueue:uiController:store:featureStateProvider:]( objc_alloc(&OBJC_CLASS___LACDTOSensorTrustService),  "initWithReplyQueue:uiController:store:featureStateProvider:",  v50,  v13->_uiController,  v13->_kvStore,  v31->_featureController);
      id v68 = v63[3];
      v63[3] = v67;

      v69 = objc_alloc(&OBJC_CLASS___LACDTOLocationPrewarmController);
      v70 = v31->_locationProvider;
      v92[0] = _NSConcreteStackBlock;
      v92[1] = 3221225472LL;
      v92[2] = sub_100003BE8;
      v92[3] = &unk_1000309F8;
      v71 = v63;
      v93 = v71;
      id v72 = sub_100003BE8((uint64_t)v92);
      v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
      v74 = v69;
      id v11 = v89;
      id v75 = [v74 initWithLocationProvider:v70 strategy:v73 workQueue:v13->_workQueue];
      id v76 = v71[9];
      v71[9] = v75;

      [v56 addObserver:v71[9]];
      v77 = objc_alloc(&OBJC_CLASS___LACDTOServiceXPCHost);
      v78 = v31->_featureController;
      uint64_t v79 = (uint64_t)v45->_ratchetStateProvider;
      v80 = (void *)objc_claimAutoreleasedReturnValue([v63[3] trustStateProvider]);
      uint64_t v81 = (uint64_t)v49->_pendingEvaluationsController;
      v82 = v77;
      id v9 = v90;
      id v10 = v91;
      id v83 = [v82 initWithFeatureController:v78 ratchetStateProvider:v79 trustStateProvider:v80 pendingEvaluationController:v81];
      id v84 = v71[14];
      v71[14] = v83;
    }

    self = v13;
    v85 = self;
  }

  else
  {
    v85 = 0LL;
  }

  return v85;
}

- (void)startServices
{
  workQueue = (dispatch_queue_s *)self->_workQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100003D24;
  v4[3] = &unk_100030A20;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (id)processor
{
  id v3 = objc_alloc(&OBJC_CLASS___LACDTOServiceProcessor);
  id v4 = objc_alloc(&OBJC_CLASS___LACDTOFailureProcessor);
  workQueue = self->_workQueue;
  id v6 = [[LACUserInterfacePresenter alloc] initWithReplyQueue:workQueue uiController:self->_uiController];
  id v7 = [v4 initWithReplyQueue:workQueue ui:v6];
  v14[0] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LACDTOSensorTrustService evaluationProcessor](self->_sensorTrust, "evaluationProcessor"));
  policyController = self->_policyController;
  emptyPasscodeProcessor = self->_emptyPasscodeProcessor;
  v14[1] = v8;
  v14[2] = emptyPasscodeProcessor;
  v14[3] = policyController;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 4LL));
  id v12 = [v3 initWithSubprocessors:v11];

  return v12;
}

- (LACDTOEnvironmentProviding)environmentProvider
{
  return self->_environmentProvider;
}

- (LACDTOServiceXPC)xpcController
{
  return self->_xpcController;
}

- (LACDTORatchetStateProvider)ratchetStateProvider
{
  return self->_ratchetStateProvider;
}

- (LACDTOPendingPolicyEvaluationController)pendingPolicyEvaluationController
{
  return self->_pendingEvaluationsController;
}

- (LACDTOFeatureControlling)featureController
{
  return self->_featureController;
}

- (void).cxx_destruct
{
}

@end