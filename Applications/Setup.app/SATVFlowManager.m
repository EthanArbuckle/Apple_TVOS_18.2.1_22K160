@interface SATVFlowManager
+ (id)_stepExecutionRecordFromDefaultsForStepIdentifier:(id)a3;
+ (void)initialize;
- (BOOL)_handleFlowOptions:(unint64_t)a3;
- (BOOL)_isActiveStep:(id)a3;
- (BOOL)isTouchlessSetupTemporarilyDisabled;
- (NSArray)stepClasses;
- (NSMutableArray)breadcrumbs;
- (NSMutableArray)executedStepClasses;
- (NSMutableDictionary)executedStepByIdentifier;
- (NSMutableDictionary)stepExecutionRecordByIdentifier;
- (SATVFlowManager)initWithNavigationController:(id)a3 completion:(id)a4;
- (SATVFlowProvider)flowProvider;
- (SATVMetricsController)metricsController;
- (SATVRemotePairingController)remotePairingController;
- (SATVTapToSetupController)tapToSetupController;
- (SATVUIFlowController)uiFlowController;
- (TVSKNavigationController)navigationController;
- (TVSKSetupSession)setupSession;
- (TVSKStep)activeStep;
- (TVSStateMachine)stateMachine;
- (id)_nextState;
- (id)_previousState;
- (id)_savedTapToSetupDeviceInfo;
- (id)_stepContextForStepClass:(Class)a3 withUserInfo:(id)a4;
- (id)_stepInstanceForStepClass:(Class)a3;
- (id)completionHandler;
- (void)_clearSavedTapToSetupDeviceInfo;
- (void)_commitStepExecutionRecordsToDefaults;
- (void)_configureAndStartFlow;
- (void)_handleStepResult:(id)a3;
- (void)_notifyPrefetchStepsForTriggersFromSet:(id)a3 context:(id)a4;
- (void)_postFinishEvent;
- (void)_processAndHandleCurrentStepForClass:(Class)a3 withUserInfo:(id)a4;
- (void)_registerStateMachineHandlers;
- (void)_saveTapToSetupDeviceInfo:(id)a3;
- (void)_updateFlowForStep:(Class)a3 withStepContext:(id)a4;
- (void)_updateFlowStepsTillStep:(Class)a3;
- (void)didCancelStep:(id)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)setActiveStep:(id)a3;
- (void)setBreadcrumbs:(id)a3;
- (void)setIsTouchlessSetupTemporarilyDisabled:(BOOL)a3;
- (void)setRemotePairingController:(id)a3;
- (void)setSetupSession:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTapToSetupController:(id)a3;
- (void)step:(id)a3 didCompleteWithResult:(id)a4;
- (void)step:(id)a3 displayViewController:(id)a4;
- (void)step:(id)a3 triggerStatusDidChangeForTriggers:(id)a4 context:(id)a5;
@end

@implementation SATVFlowManager

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___SATVFlowManager, a2) == a1)
  {
    os_log_t v2 = os_log_create("com.apple.purplebuddy.SetupFlow", "SATVFlowManager");
    v3 = (void *)qword_100109A38;
    qword_100109A38 = (uint64_t)v2;
  }

- (SATVFlowManager)initWithNavigationController:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS___SATVFlowManager;
  v9 = -[SATVFlowManager init](&v42, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_navigationController, a3);
    -[TVSKNavigationController setDelegate:](v10->_navigationController, "setDelegate:", v10);
    id v11 = [v8 copy];
    id completionHandler = v10->_completionHandler;
    v10->_id completionHandler = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___SATVFlowProvider);
    flowProvider = v10->_flowProvider;
    v10->_flowProvider = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowProvider stepClasses](v10->_flowProvider, "stepClasses"));
    v16 = (NSArray *)[v15 copy];
    stepClasses = v10->_stepClasses;
    v10->_stepClasses = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    executedStepByIdentifier = v10->_executedStepByIdentifier;
    v10->_executedStepByIdentifier = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    executedStepClasses = v10->_executedStepClasses;
    v10->_executedStepClasses = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    stepExecutionRecordByIdentifier = v10->_stepExecutionRecordByIdentifier;
    v10->_stepExecutionRecordByIdentifier = v22;

    v24 = -[SATVUIFlowController initWithNavigationController:flowStepClasses:]( objc_alloc(&OBJC_CLASS___SATVUIFlowController),  "initWithNavigationController:flowStepClasses:",  v10->_navigationController,  v10->_stepClasses);
    uiFlowController = v10->_uiFlowController;
    v10->_uiFlowController = v24;

    BOOL v26 = -[SATVFlowProvider isUpdateFlow](v10->_flowProvider, "isUpdateFlow");
    v27 = -[SATVMetricsController initWithIsUpdateSetup:]( objc_alloc(&OBJC_CLASS___SATVMetricsController),  "initWithIsUpdateSetup:",  v26);
    metricsController = v10->_metricsController;
    v10->_metricsController = v27;

    v29 = objc_alloc(&OBJC_CLASS___TVSKSetupSession);
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowProvider userInputConfiguration](v10->_flowProvider, "userInputConfiguration"));
    v31 = -[TVSKSetupSession initWithIsUpdate:userInputConfiguration:]( v29,  "initWithIsUpdate:userInputConfiguration:",  v26,  v30);
    setupSession = v10->_setupSession;
    v10->_setupSession = v31;

    +[TVSKStepTriggersContext _registerSetupSession:]( &OBJC_CLASS___TVSKStepTriggersContext,  "_registerSetupSession:",  v10->_setupSession);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[TVSKThemeManager sharedInstance](&OBJC_CLASS___TVSKThemeManager, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowProvider theme](v10->_flowProvider, "theme"));
    [v33 setTheme:v34];

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowProvider overrideStringsFileName](v10->_flowProvider, "overrideStringsFileName"));
    sub_10000D7B0(v35);

    +[TVSNetworkUtilities setupNetworkMonitoring](&OBJC_CLASS___TVSNetworkUtilities, "setupNetworkMonitoring");
    +[TVSWiFiInterface enableNetworkManagement](&OBJC_CLASS___TVSWiFiInterface, "enableNetworkManagement");
    v36 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    breadcrumbs = v10->_breadcrumbs;
    v10->_breadcrumbs = v36;

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472LL;
    v40[2] = sub_10006C3DC;
    v40[3] = &unk_1000CAFA8;
    v38 = v10;
    v41 = v38;
    sub_10002B234(v40);
    -[SATVFlowManager _configureAndStartFlow](v38, "_configureAndStartFlow");
  }

  return v10;
}

- (void)step:(id)a3 displayViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  id v8 = -[SATVUIFlowController viewControllerForStepClass:]( self->_uiFlowController,  "viewControllerForStepClass:",  objc_opt_class(v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (!-[SATVFlowManager _isActiveStep:](self, "_isActiveStep:", v6) || v9)
  {
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR)) {
      sub_100079684();
    }
  }

  else
  {
    -[SATVUIFlowController presentStepViewController:forStep:]( self->_uiFlowController,  "presentStepViewController:forStep:",  v7,  v6);
  }
}

- (void)step:(id)a3 didCompleteWithResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  unsigned int v8 = -[SATVFlowManager _isActiveStep:](self, "_isActiveStep:", v6);
  v9 = (os_log_s *)qword_100109A38;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v25 = v6;
      __int16 v26 = 2114;
      id v27 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Did complete step %{public}@. result=%{public}@",  buf,  0x16u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager breadcrumbs](self, "breadcrumbs"));
    id v11 = [(id)objc_opt_class(v6) stableIdentifier];
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stepResultValue", v12));
    v23 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v23,  &v22,  1LL));
    [v10 addObject:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager metricsController](self, "metricsController"));
    [v15 appendMetricsForCompletedStep:v6 stepResult:v7 completedSynchronously:0];

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    LODWORD(v13) = [v7 didExecutionSucceed];
    v17 = (os_log_s *)qword_100109A38;
    BOOL v18 = os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v13)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Step %{public}@ succeeded", buf, 0xCu);
      }

      if (!-[SATVFlowManager _handleFlowOptions:](self, "_handleFlowOptions:", [v7 flowOptions])) {
        goto LABEL_17;
      }
      v19 = (os_log_s *)qword_100109A38;
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "We are moving forwards from step %{public}@",  buf,  0xCu);
      }

      -[SATVFlowManager _handleStepResult:](self, "_handleStepResult:", v7);
      v20 = @"Next";
      v21 = &off_1000D0DC0;
    }

    else
    {
      if (v18)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Seems like we should not proceed ahead. Navigate backwards...",  buf,  2u);
      }

      v20 = @"Previous";
      v21 = &off_1000D0DD8;
    }

    -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v21, @"SATVNavigationFlowKey");
    -[TVSStateMachine postEvent:withContext:userInfo:]( self->_stateMachine,  "postEvent:withContext:userInfo:",  v20,  0LL,  v16);
LABEL_17:

    goto LABEL_18;
  }

  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR)) {
    sub_1000796E4((uint64_t)v6, v9, self);
  }
LABEL_18:
}

- (void)step:(id)a3 triggerStatusDidChangeForTriggers:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  unsigned int v11 = -[SATVFlowManager _isActiveStep:](self, "_isActiveStep:", v8);
  v12 = (void *)qword_100109A38;
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager activeStep](self, "activeStep"));
      int v15 = 138543362;
      v16 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Trigger status did change for step %{public}@",  (uint8_t *)&v15,  0xCu);
    }

    -[SATVFlowManager _notifyPrefetchStepsForTriggersFromSet:context:]( self,  "_notifyPrefetchStepsForTriggersFromSet:context:",  v9,  v10);
  }

  else if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR))
  {
    sub_100079770((uint64_t)v8, v12, self);
  }
}

- (void)didCancelStep:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  unsigned int v5 = -[SATVFlowManager _isActiveStep:](self, "_isActiveStep:", v4);
  id v6 = (os_log_s *)qword_100109A38;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Menu pressed for this step. Navigate backwards..",  v10,  2u);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager metricsController](self, "metricsController"));
    [v7 appendMetricsForCompletedStep:v4 stepResult:0 completedSynchronously:0];

    stateMachine = self->_stateMachine;
    unsigned int v11 = @"SATVNavigationFlowKey";
    v12 = &off_1000D0DD8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Previous",  0LL,  v9);
  }

  else if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR))
  {
    sub_1000797FC((uint64_t)v4, v6, self);
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    int v34 = 138543362;
    id v35 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Navigation controller did show view controller %{public}@..",  (uint8_t *)&v34,  0xCu);
  }

  uiFlowController = self->_uiFlowController;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager activeStep](self, "activeStep"));
  id v12 = -[SATVUIFlowController viewControllerForStepClass:]( uiFlowController,  "viewControllerForStepClass:",  objc_opt_class(v11));
  id v13 = (id)objc_claimAutoreleasedReturnValue(v12);

  if (v13 == v8)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[BYPreferencesController buddyPreferences]( &OBJC_CLASS___BYPreferencesController,  "buddyPreferences"));
    unsigned int v18 = [v17 BOOLForKey:@"TVIsTouchless"];

    if (v18 && !-[SATVFlowManager isTouchlessSetupTemporarilyDisabled](self, "isTouchlessSetupTemporarilyDisabled"))
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[SATVFlowManager activeStep](self, "activeStep"));
      v30 = (void *)qword_100109A38;
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        v31 = v30;
        v32 = (void *)objc_opt_class(v15);
        int v34 = 138543362;
        id v35 = v32;
        id v33 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "Touchless set up is enabled for the device. Auto advance from the current step %{public}@ to the next one...",  (uint8_t *)&v34,  0xCu);
      }

      id v25 = (id)objc_claimAutoreleasedReturnValue(-[SATVFlowManager metricsController](self, "metricsController"));
      [v25 noteAutoAdvanceForExecutingStep:v15];
    }

    else
    {
      id v15 = (id)objc_claimAutoreleasedReturnValue(-[SATVFlowManager activeStep](self, "activeStep"));
      flowProvider = self->_flowProvider;
      id v20 = [(id)objc_opt_class(v15) stableIdentifier];
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      unsigned int v22 = -[SATVFlowProvider shouldAutoAdvanceStepWithIdentifier:]( flowProvider,  "shouldAutoAdvanceStepWithIdentifier:",  v21);

      v23 = (void *)qword_100109A38;
      BOOL v24 = os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT);
      if (!v22)
      {
        if (!v24) {
          goto LABEL_19;
        }
        v16 = v23;
        v28 = (void *)objc_opt_class(v15);
        int v34 = 138412290;
        id v35 = v28;
        id v29 = v28;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Staying at current step %@",  (uint8_t *)&v34,  0xCu);

LABEL_6:
LABEL_19:

        goto LABEL_20;
      }

      if (!v24)
      {
LABEL_18:
        [v15 autoAdvance];
        goto LABEL_19;
      }

      id v25 = v23;
      __int16 v26 = (void *)objc_opt_class(v15);
      int v34 = 138543362;
      id v35 = v26;
      id v27 = v26;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v25,  OS_LOG_TYPE_DEFAULT,  "Flow provider (probably CLI mode) wants to Auto advance from the current step %{public}@ to the next one...",  (uint8_t *)&v34,  0xCu);
    }

    goto LABEL_18;
  }

  v14 = (void *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = v14;
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager activeStep](self, "activeStep"));
    int v34 = 138543618;
    id v35 = v8;
    __int16 v36 = 2114;
    v37 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "We've already moved forward from the presented view controller %{public}@ {activeStep=%{public}@}",  (uint8_t *)&v34,  0x16u);
    goto LABEL_6;
  }

- (void)_registerStateMachineHandlers
{
  v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  id v4 = (objc_class *)objc_opt_class(self);
  unsigned int v5 = NSStringFromClass(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"SATVFlowDefaultState",  0LL,  &stru_1000CAFE8);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepClasses](self, "stepClasses"));
  id v10 = [v9 objectAtIndex:0];

  unsigned int v11 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v31 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Initial start up step is %{public}@",  buf,  0xCu);
  }

  id v12 = self->_stateMachine;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_10006D26C;
  v27[3] = &unk_1000CB010;
  objc_copyWeak(v28, &location);
  v28[1] = v10;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v12,  "registerHandlerForEvent:onState:withBlock:",  @"Start",  @"SATVFlowDefaultState",  v27);
  id v13 = self->_stateMachine;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10006D370;
  v25[3] = &unk_1000CA3C0;
  objc_copyWeak(&v26, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v13,  "registerDefaultHandlerForEvent:withBlock:",  @"Next",  v25);
  v14 = self->_stateMachine;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10006D4C8;
  v23[3] = &unk_1000CA3C0;
  objc_copyWeak(&v24, &location);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v14,  "registerDefaultHandlerForEvent:withBlock:",  @"Previous",  v23);
  id v15 = self->_stateMachine;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10006D608;
  v21[3] = &unk_1000CB038;
  objc_copyWeak(&v22, &location);
  v21[4] = self;
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v15,  "registerDefaultHandlerForEvent:withBlock:",  @"Finish",  v21);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepClasses](self, "stepClasses"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bs_map:", &stru_1000CB078));

  unsigned int v18 = self->_stateMachine;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10006D970;
  v19[3] = &unk_1000CA3C0;
  objc_copyWeak(&v20, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v18,  "registerHandlerForEvent:onStates:withBlock:",  @"Active",  v17,  v19);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
}

- (void)_configureAndStartFlow
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager setupSession](self, "setupSession"));
  unsigned __int8 v4 = [v3 isUpdate];

  if ((v4 & 1) == 0)
  {
    unsigned int v5 = objc_alloc(&OBJC_CLASS___SATVTapToSetupController);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager navigationController](self, "navigationController"));
    id v7 = -[SATVTapToSetupController initWithPresentingViewController:](v5, "initWithPresentingViewController:", v6);
    -[SATVFlowManager setTapToSetupController:](self, "setTapToSetupController:", v7);

    objc_initWeak(&location, self);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager tapToSetupController](self, "tapToSetupController"));
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    v14 = sub_10006DC48;
    id v15 = &unk_1000CB0A0;
    objc_copyWeak(&v16, &location);
    [v8 setCompletion:&v12];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager setupSession](self, "setupSession", v12, v13, v14, v15));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager _savedTapToSetupDeviceInfo](self, "_savedTapToSetupDeviceInfo"));
    [v9 setTapToSetupDeviceInfo:v10];

    unsigned int v11 = objc_alloc_init(&OBJC_CLASS___SATVRemotePairingController);
    -[SATVFlowManager setRemotePairingController:](self, "setRemotePairingController:", v11);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  -[SATVFlowManager _registerStateMachineHandlers](self, "_registerStateMachineHandlers");
  -[TVSStateMachine setCallsStateChangeHandlerSynchronously:]( self->_stateMachine,  "setCallsStateChangeHandlerSynchronously:",  1LL);
  -[TVSStateMachine setLogObject:](self->_stateMachine, "setLogObject:", qword_100109A38);
  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Start");
}

- (BOOL)_isActiveStep:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SATVFlowManager activeStep](self, "activeStep"));

  return v5 == v4;
}

- (id)_previousState
{
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
  unint64_t v4 = (unint64_t)-[NSMutableArray indexOfObject:]( self->_executedStepClasses,  "indexOfObject:",  NSClassFromString(v3));
  if ((v4 & 0x7FFFFFFFFFFFFFFFLL) != 0
    && (id v5 = (objc_class *)-[NSMutableArray objectAtIndex:](self->_executedStepClasses, "objectAtIndex:", v4 - 1)) != 0LL)
  {
    id v6 = NSStringFromClass(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (id)_nextState
{
  v3 = (NSString *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState"));
  Class v4 = NSClassFromString(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepClasses](self, "stepClasses"));
  id v6 = (char *)[v5 indexOfObject:v4];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepClasses](self, "stepClasses"));
  id v8 = (char *)[v7 count] - 1;

  if (v6 == (char *)0x7FFFFFFFFFFFFFFELL || v6 == v8)
  {
    unsigned int v11 = 0LL;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepClasses](self, "stepClasses"));
    unsigned int v11 = (objc_class *)[v10 objectAtIndex:v6 + 1];

    if (v11)
    {
      id v12 = NSStringFromClass(v11);
      unsigned int v11 = (objc_class *)objc_claimAutoreleasedReturnValue(v12);
    }
  }

  return v11;
}

- (id)_stepInstanceForStepClass:(Class)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class stableIdentifier](a3, "stableIdentifier"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowProvider prefetchStepForIdentifier:](self->_flowProvider, "prefetchStepForIdentifier:", v5));
  if (v6)
  {
    id v7 = (os_log_s *)qword_100109A38;
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      Class v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Step %{public}@ is a prefetch step.",  (uint8_t *)&v13,  0xCu);
    }

    [v6 setStepDelegate:self];
    id v8 = v6;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager executedStepByIdentifier](self, "executedStepByIdentifier"));
    id v8 = (id)objc_claimAutoreleasedReturnValue([v10 objectForKey:v5]);

    unsigned int v11 = (os_log_s *)qword_100109A38;
    BOOL v12 = os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v12)
      {
        int v13 = 138543362;
        Class v14 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We have an existing instance for step %{public}@..",  (uint8_t *)&v13,  0xCu);
      }
    }

    else
    {
      if (v12)
      {
        int v13 = 138543362;
        Class v14 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "We don't have an existing step instance for step %{public}@..",  (uint8_t *)&v13,  0xCu);
      }

      id v8 = objc_alloc_init(a3);
      [v8 setStepDelegate:self];
    }
  }

  return v8;
}

- (void)_updateFlowForStep:(Class)a3 withStepContext:(id)a4
{
  id v6 = a4;
  id v7 = (void *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned int v9 = [v6 isNavigationFlowForward];
    id v10 = @"Backwards";
    if (v9) {
      id v10 = @"Forwards";
    }
    *(_DWORD *)buf = 138543618;
    Class v49 = a3;
    __int16 v50 = 2114;
    v51 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "About to execute step %{public}@. Navigation flow is %{public}@",  buf,  0x16u);
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager _stepInstanceForStepClass:](self, "_stepInstanceForStepClass:", a3));
  -[SATVFlowManager setActiveStep:](self, "setActiveStep:", v11);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class stableIdentifier](a3, "stableIdentifier"));
  if ([v6 isNavigationFlowForward])
  {
    int v13 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager executedStepClasses](self, "executedStepClasses"));
    [v13 addObject:a3];

    Class v14 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager executedStepByIdentifier](self, "executedStepByIdentifier"));
    [v14 setObject:v11 forKey:v12];
  }

  if ((-[TVSKSetupSession isUpdate](self->_setupSession, "isUpdate") & 1) == 0)
  {
    id v15 = (objc_class *)objc_opt_class(&OBJC_CLASS___SATVChooseSetupMethodStep);
    if (v15 == a3 && ([v6 isNavigationFlowForward] & 1) == 0)
    {
      id v16 = (os_log_s *)qword_100109A38;
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Moving to a step before TTSU; clearing session and saved device info.",
          buf,
          2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager setupSession](self, "setupSession"));
      [v17 setTapToSetupDeviceInfo:0];

      -[SATVFlowManager _clearSavedTapToSetupDeviceInfo](self, "_clearSavedTapToSetupDeviceInfo");
    }

    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager _previousState](self, "_previousState"));
    v19 = NSStringFromClass(v15);
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    unsigned int v21 = [v18 isEqualToString:v20];

    if (v21) {
      -[SATVFlowManager _clearSavedTapToSetupDeviceInfo](self, "_clearSavedTapToSetupDeviceInfo");
    }
    id v22 = (void *)objc_claimAutoreleasedReturnValue( -[SATVFlowProvider tapToSetupEnablingStepClasses]( self->_flowProvider,  "tapToSetupEnablingStepClasses"));
    unsigned int v23 = [v22 containsObject:a3];

    if (v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager setupSession](self, "setupSession"));
      if (([v24 isTapToSetupEnabled] & 1) == 0)
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager tapToSetupController](self, "tapToSetupController"));
        unsigned __int8 v26 = [v25 isStarted];

        if ((v26 & 1) != 0) {
          goto LABEL_26;
        }
        id v27 = (os_log_s *)qword_100109A38;
        if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Enabling TTSU.", buf, 2u);
        }

        id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager tapToSetupController](self, "tapToSetupController"));
        [v24 start];
      }
    }

    else
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager tapToSetupController](self, "tapToSetupController"));
      unsigned int v29 = [v28 isStarted];

      if (!v29) {
        goto LABEL_26;
      }
      v30 = (os_log_s *)qword_100109A38;
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Disabling TTSU.", buf, 2u);
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager tapToSetupController](self, "tapToSetupController"));
      [v24 stop];
    }
  }

- (void)_updateFlowStepsTillStep:(Class)a3
{
  Class v4 = (char *)-[NSMutableArray indexOfObjectIdenticalTo:](self->_executedStepClasses, "indexOfObjectIdenticalTo:", a3);
  id v5 = (NSMutableArray *)-[NSMutableArray mutableCopy](self->_executedStepClasses, "mutableCopy");
  id v6 = (char *)-[NSMutableArray count](self->_executedStepClasses, "count");
  id v7 = v4 + 1;
  if (v7 < v6)
  {
    id v8 = v6;
    do
    {
      id v9 = -[NSMutableArray objectAtIndex:](self->_executedStepClasses, "objectAtIndex:", v7);
      -[NSMutableArray removeObject:](v5, "removeObject:", v9);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager executedStepByIdentifier](self, "executedStepByIdentifier"));
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v9 stableIdentifier]);
      [v10 removeObjectForKey:v11];

      ++v7;
    }

    while (v8 != v7);
  }

  executedStepClasses = self->_executedStepClasses;
  self->_executedStepClasses = v5;
}

- (id)_stepContextForStepClass:(Class)a3 withUserInfo:(id)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 objectForKey:@"SATVNavigationFlowKey"]);
  id v7 = [v6 unsignedIntegerValue];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class stableIdentifier](a3, "stableIdentifier"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[SATVFlowProvider stepConfigurationForIdentifier:]( self->_flowProvider,  "stepConfigurationForIdentifier:",  v8));
  id v10 = objc_alloc(&OBJC_CLASS___TVSKStepContext);
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager setupSession](self, "setupSession"));
  id v12 = [v10 initWithSetupSession:v11 stepConfiguration:v9 navigationFlow:v7];

  int v13 = (void *)objc_claimAutoreleasedReturnValue( -[SATVUIFlowController viewControllerForStepClass:]( self->_uiFlowController,  "viewControllerForStepClass:",  a3));
  if (v13)
  {
    Class v14 = (os_log_s *)qword_100109A38;
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      Class v20 = a3;
      __int16 v21 = 2114;
      id v22 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "View controller for step %{public}@ is %{public}@. Navigation flow could be backwards.",  (uint8_t *)&v19,  0x16u);
    }

    [v12 setStepViewController:v13];
  }

  id v15 = [(id)objc_opt_class(self) _stepExecutionRecordFromDefaultsForStepIdentifier:v8];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  if (v16)
  {
    v17 = (os_log_s *)qword_100109A38;
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138543618;
      Class v20 = a3;
      __int16 v21 = 2114;
      id v22 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Step (%{public}@) has a previous execution record. Will be added to the context. %{public}@",  (uint8_t *)&v19,  0x16u);
    }

    [v12 setPreviousExecutionRecord:v16];
  }

  return v12;
}

- (void)_notifyPrefetchStepsForTriggersFromSet:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowProvider prefetchSteps](self->_flowProvider, "prefetchSteps"));
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v21;
    *(void *)&__int128 v10 = 138543874LL;
    __int128 v19 = v10;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v8);
        }
        Class v14 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "triggers", v19));
        id v16 = [v15 mutableCopy];

        [v16 intersectSet:v6];
        if ([v16 count])
        {
          v17 = (os_log_s *)qword_100109A38;
          if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            id v25 = v14;
            __int16 v26 = 2114;
            id v27 = v6;
            __int16 v28 = 2114;
            id v29 = v7;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Prefetch step %{public}@ needs to be notified. firedTriggers=%{public}@, context=%{public}@",  buf,  0x20u);
          }

          id v18 = [v16 copy];
          [v14 triggerStatusDidChangeForTriggers:v18 context:v7];
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v20 objects:v30 count:16];
    }

    while (v11);
  }
}

- (void)_processAndHandleCurrentStepForClass:(Class)a3 withUserInfo:(id)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue( -[SATVFlowManager _stepContextForStepClass:withUserInfo:]( self,  "_stepContextForStepClass:withUserInfo:",  a3,  a4));
  -[SATVFlowManager _updateFlowForStep:withStepContext:](self, "_updateFlowForStep:withStepContext:", a3, v6);
}

- (BOOL)_handleFlowOptions:(unint64_t)a3
{
  char v3 = a3;
  if ((a3 & 1) != 0)
  {
    id v6 = (os_log_s *)qword_100109A38;
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Step has finished and wants to finish setup.",  buf,  2u);
    }

    -[SATVFlowManager _postFinishEvent](self, "_postFinishEvent");
  }

  else if ((a3 & 2) != 0)
  {
    id v5 = (os_log_s *)qword_100109A38;
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Seems like we could NOT successfully fetch the managed config details for the device...",  v8,  2u);
    }

    -[SATVFlowManager setIsTouchlessSetupTemporarilyDisabled:](self, "setIsTouchlessSetupTemporarilyDisabled:", 1LL);
  }

  return (v3 & 1) == 0LL;
}

- (void)_handleStepResult:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___SATVExpressTapToSetupStepResult);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager setupSession](self, "setupSession"));
    id v7 = v4;
    objc_msgSend(v6, "setExpressTapToSetupItemTypes:", objc_msgSend(v7, "itemTypes"));
    id v8 = [v7 didConsent];
    id v9 = (os_log_s *)qword_100109A38;
    BOOL v10 = os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT);
    if (v8 == (id)1)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = 2LL;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup has been consented to.",  buf,  2u);
      }

      else
      {
        uint64_t v11 = 2LL;
      }
    }

    else
    {
      if (v10)
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Express tap-to-setup has been declined.",  v12,  2u);
      }

      uint64_t v11 = 3LL;
    }

    [v6 setExpressTapToSetupState:v11];
  }
}

- (void)_postFinishEvent
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stateMachine](self, "stateMachine"));
  [v2 postEvent:@"Finish"];
}

+ (id)_stepExecutionRecordFromDefaultsForStepIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    if ((objc_opt_isKindOfClass(v7, v6) & 1) != 0) {
      id v9 = v8;
    }
    else {
      id v9 = 0LL;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  id v10 = v9;

  if (v10) {
    id v11 = [[TVSKStepExecutionRecord alloc] initWithSerializedRepresentation:v10];
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

- (void)_commitStepExecutionRecordsToDefaults
{
  id v3 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Commiting step execution records to defaults.",  buf,  2u);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVFlowManager stepExecutionRecordByIdentifier](self, "stepExecutionRecordByIdentifier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10006EFE4;
  v7[3] = &unk_1000CB0F0;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (void)_clearSavedTapToSetupDeviceInfo
{
  id v2 = (os_log_s *)qword_100109A38;
  if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clearing saved device info.", v4, 2u);
  }

  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 removeObjectForKey:@"TapToSetupDeviceInfo"];
  [v3 synchronize];
}

- (void)_saveTapToSetupDeviceInfo:(id)a3
{
  id v8 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a3,  1LL,  &v8));
  id v4 = v8;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR)) {
      sub_1000798E8();
    }
  }

  else
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    [v5 setObject:v3 forKey:@"TapToSetupDeviceInfo"];
    [v5 synchronize];
    id v6 = (os_log_s *)qword_100109A38;
    if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Device info saved.", v7, 2u);
    }
  }
}

- (id)_savedTapToSetupDeviceInfo
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"TapToSetupDeviceInfo"]);
  if (v4)
  {
    id v11 = 0LL;
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___TVSKTapToSetupDeviceInfo),  v4,  &v11);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    id v7 = v11;
    id v8 = (os_log_s *)qword_100109A38;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_ERROR)) {
        sub_100079948();
      }
      -[SATVFlowManager _clearSavedTapToSetupDeviceInfo](self, "_clearSavedTapToSetupDeviceInfo");
      id v9 = 0LL;
    }

    else
    {
      if (os_log_type_enabled((os_log_t)qword_100109A38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int v13 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Loaded device info: %@", buf, 0xCu);
      }

      id v9 = v6;
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (TVSKNavigationController)navigationController
{
  return self->_navigationController;
}

- (SATVUIFlowController)uiFlowController
{
  return self->_uiFlowController;
}

- (SATVFlowProvider)flowProvider
{
  return self->_flowProvider;
}

- (NSMutableArray)executedStepClasses
{
  return self->_executedStepClasses;
}

- (NSMutableDictionary)executedStepByIdentifier
{
  return self->_executedStepByIdentifier;
}

- (NSMutableDictionary)stepExecutionRecordByIdentifier
{
  return self->_stepExecutionRecordByIdentifier;
}

- (SATVMetricsController)metricsController
{
  return self->_metricsController;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (NSArray)stepClasses
{
  return self->_stepClasses;
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (TVSKStep)activeStep
{
  return self->_activeStep;
}

- (void)setActiveStep:(id)a3
{
}

- (BOOL)isTouchlessSetupTemporarilyDisabled
{
  return self->_isTouchlessSetupTemporarilyDisabled;
}

- (void)setIsTouchlessSetupTemporarilyDisabled:(BOOL)a3
{
  self->_isTouchlessSetupTemporarilyDisabled = a3;
}

- (TVSKSetupSession)setupSession
{
  return self->_setupSession;
}

- (void)setSetupSession:(id)a3
{
}

- (NSMutableArray)breadcrumbs
{
  return self->_breadcrumbs;
}

- (void)setBreadcrumbs:(id)a3
{
}

- (SATVTapToSetupController)tapToSetupController
{
  return self->_tapToSetupController;
}

- (void)setTapToSetupController:(id)a3
{
}

- (SATVRemotePairingController)remotePairingController
{
  return self->_remotePairingController;
}

- (void)setRemotePairingController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end