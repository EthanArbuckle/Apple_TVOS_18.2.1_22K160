@interface PBSystemOverlaySession
- (BOOL)isActive;
- (NSString)identifier;
- (OS_os_log)signpostLog;
- (PBSystemOverlaySession)init;
- (PBSystemOverlaySession)initWithIdentifier:(id)a3 layoutLevel:(int64_t)a4 sceneDeactivationReasons:(unint64_t)a5 presentationHandler:(id)a6 delegate:(id)a7 signpostLog:(id)a8;
- (PBSystemOverlaySessionDelegate)delegate;
- (PBSystemUIPresenting)presentationHandler;
- (int64_t)layoutLevel;
- (int64_t)state;
- (unint64_t)sceneDeactivationReasons;
- (void)_initializeStateMachine;
- (void)_machineAddPendingPresentationRequest:(id)a3;
- (void)_machineCleanup;
- (void)_machineDismissUIWithRequest:(id)a3;
- (void)_machineNotifyDidCancelWithContext:(id)a3;
- (void)_machineNotifyDidDismiss;
- (void)_machineNotifyDidInvalidate;
- (void)_machineNotifyDidPresent;
- (void)_machineNotifyWillDismissWithContext:(id)a3;
- (void)_machineNotifyWillPresent;
- (void)_machinePrepareUIWithProvider:(id)a3;
- (void)_machinePresentUIWithRequest:(id)a3;
- (void)contentPresenting:(id)a3 willDismissContentWithResult:(id)a4 error:(id)a5;
- (void)contentPresentingDidDismissContent:(id)a3;
- (void)dismissWithRequest:(id)a3;
- (void)makeActive;
- (void)presentWithRequest:(id)a3;
@end

@implementation PBSystemOverlaySession

- (PBSystemOverlaySession)init
{
  return 0LL;
}

- (PBSystemOverlaySession)initWithIdentifier:(id)a3 layoutLevel:(int64_t)a4 sceneDeactivationReasons:(unint64_t)a5 presentationHandler:(id)a6 delegate:(id)a7 signpostLog:(id)a8
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___PBSystemOverlaySession;
  v18 = -[PBSystemOverlaySession init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    v18->_layoutLevel = a4;
    v20 = (NSString *)[v14 copy];
    identifier = v19->_identifier;
    v19->_identifier = v20;

    objc_storeStrong((id *)&v19->_presentationHandler, a6);
    v19->_sceneDeactivationReasons = a5;
    objc_storeWeak((id *)&v19->_delegate, v16);
    objc_storeStrong((id *)&v19->_signpostLog, a8);
    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingPresentationRequests = v19->_pendingPresentationRequests;
    v19->_pendingPresentationRequests = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    pendingDismissalRequests = v19->_pendingDismissalRequests;
    v19->_pendingDismissalRequests = v24;

    -[PBSystemOverlaySession _initializeStateMachine](v19, "_initializeStateMachine");
  }

  return v19;
}

- (void)presentWithRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  stateMachine = self->_stateMachine;
  v7 = @"PresentationRequest";
  id v8 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v8,  &v7,  1LL));
  -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Present",  0LL,  v6);
}

- (void)dismissWithRequest:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(&_dispatch_main_q);
  v5 = -[PBSystemOverlaySessionDismissalContext initWithResult:error:dismissedByClient:]( objc_alloc(&OBJC_CLASS___PBSystemOverlaySessionDismissalContext),  "initWithResult:error:dismissedByClient:",  0LL,  0LL,  0LL);
  stateMachine = self->_stateMachine;
  v8[0] = @"DismissalRequest";
  v8[1] = @"DismissalContext";
  v9[0] = v4;
  v9[1] = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v9,  v8,  2LL));
  -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Dismiss",  0LL,  v7);
}

- (void)makeActive
{
  if (!self->_active)
  {
    self->_active = 1;
    -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Activate");
  }

- (void)contentPresenting:(id)a3 willDismissContentWithResult:(id)a4 error:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = sub_100084158();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v15 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PBSystemOverlayContentPresenting willDismissContent - begin dismissal",  v15,  2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  self));
  [v11 setAnimated:v7 == 0];
  [v11 _setClientInitiated:1];
  v12 = -[PBSystemOverlaySessionDismissalContext initWithResult:error:dismissedByClient:]( objc_alloc(&OBJC_CLASS___PBSystemOverlaySessionDismissalContext),  "initWithResult:error:dismissedByClient:",  v8,  v7,  1LL);

  stateMachine = self->_stateMachine;
  v16[0] = @"DismissalRequest";
  v16[1] = @"DismissalContext";
  v17[0] = v11;
  v17[1] = v12;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  2LL));
  -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Client Dismissing",  0LL,  v14);
}

- (void)contentPresentingDidDismissContent:(id)a3
{
  id v4 = a3;
  id v5 = sub_100084158();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "PBSystemOverlayContentPresenting didDismissContent - completed dismissal",  (uint8_t *)buf,  2u);
  }

  objc_initWeak(buf, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001908C;
  v15[3] = &unk_1003D0890;
  objc_copyWeak(&v16, buf);
  id v7 = objc_retainBlock(v15);
  dismissalTransaction = self->_dismissalTransaction;
  if (dismissalTransaction
    && !-[PBSystemOverlayDismissalTransaction hasStarted](dismissalTransaction, "hasStarted"))
  {
    id v9 = self->_dismissalTransaction;
    v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472LL;
    v12 = sub_1000190D0;
    v13 = &unk_1003D08E0;
    id v14 = v7;
    -[PBSystemOverlayDismissalTransaction registerBlockObserver:](v9, "registerBlockObserver:", &v10);
    -[PBSystemOverlayDismissalTransaction begin](self->_dismissalTransaction, "begin", v10, v11, v12, v13);
  }

  else
  {
    ((void (*)(void *))v7[2])(v7);
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

- (void)_initializeStateMachine
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (objc_class *)objc_opt_class(self);
  id v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v39 = -[NSString initWithFormat:](v3, "initWithFormat:", @"%@-%@", v6, self->_identifier);

  id v7 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  v90[0] = _NSConcreteStackBlock;
  v90[1] = 3221225472LL;
  v90[2] = sub_100019E10;
  v90[3] = &unk_1003D0928;
  objc_copyWeak(&v91, &location);
  id v8 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v7,  "initWithName:initialState:mode:stateChangeHandler:",  v39,  @"Initial",  0LL,  v90);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v8;

  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( self->_stateMachine,  "registerDefaultHandlerForEvent:withBlock:",  @"Prepare",  &stru_1003D0968);
  v10 = self->_stateMachine;
  v93[0] = @"Initial";
  v93[1] = @"Dismissed";
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v93, 2LL));
  v88[0] = _NSConcreteStackBlock;
  v88[1] = 3221225472LL;
  v88[2] = sub_10001A0AC;
  v88[3] = &unk_1003D0990;
  objc_copyWeak(&v89, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v10,  "registerHandlerForEvent:onStates:withBlock:",  @"Present",  v11,  v88);

  v12 = self->_stateMachine;
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472LL;
  v86[2] = sub_10001A1C4;
  v86[3] = &unk_1003D0990;
  objc_copyWeak(&v87, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v12,  "registerHandlerForEvent:onState:withBlock:",  @"Prepare",  @"Initial",  v86);
  v13 = self->_stateMachine;
  v84[0] = _NSConcreteStackBlock;
  v84[1] = 3221225472LL;
  v84[2] = sub_10001A2D4;
  v84[3] = &unk_1003D0990;
  objc_copyWeak(&v85, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v13,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Initial",  v84);
  id v14 = self->_stateMachine;
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_10001A424;
  v82[3] = &unk_1003D0990;
  objc_copyWeak(&v83, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v14,  "registerHandlerForEvent:onState:withBlock:",  @"Success",  @"Preparing",  v82);
  id v15 = self->_stateMachine;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472LL;
  v80[2] = sub_10001A5D8;
  v80[3] = &unk_1003D0990;
  objc_copyWeak(&v81, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v15,  "registerHandlerForEvent:onState:withBlock:",  @"Failure",  @"Preparing",  v80);
  id v16 = self->_stateMachine;
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472LL;
  v78[2] = sub_10001A828;
  v78[3] = &unk_1003D0990;
  objc_copyWeak(&v79, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v16,  "registerHandlerForEvent:onState:withBlock:",  @"Present",  @"Preparing",  v78);
  id v17 = self->_stateMachine;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472LL;
  v76[2] = sub_10001A898;
  v76[3] = &unk_1003D0990;
  objc_copyWeak(&v77, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v17,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Preparing",  v76);
  v18 = self->_stateMachine;
  v74[0] = _NSConcreteStackBlock;
  v74[1] = 3221225472LL;
  v74[2] = sub_10001A9B8;
  v74[3] = &unk_1003D0990;
  objc_copyWeak(&v75, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v18,  "registerHandlerForEvent:onState:withBlock:",  @"Interrupted",  @"Preparing",  v74);
  v19 = self->_stateMachine;
  v72[0] = _NSConcreteStackBlock;
  v72[1] = 3221225472LL;
  v72[2] = sub_10001AABC;
  v72[3] = &unk_1003D0990;
  objc_copyWeak(&v73, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v19,  "registerHandlerForEvent:onState:withBlock:",  @"Present",  @"Prepared",  v72);
  v20 = self->_stateMachine;
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10001ABD0;
  v70[3] = &unk_1003D0990;
  objc_copyWeak(&v71, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v20,  "registerHandlerForEvent:onState:withBlock:",  @"Activate",  @"Prepared",  v70);
  v21 = self->_stateMachine;
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10001ACE0;
  v68[3] = &unk_1003D0990;
  objc_copyWeak(&v69, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v21,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Prepared",  v68);
  v22 = self->_stateMachine;
  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_10001ADE4;
  v66[3] = &unk_1003D0990;
  objc_copyWeak(&v67, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v22,  "registerHandlerForEvent:onState:withBlock:",  @"Client Dismissing",  @"Prepared",  v66);
  v23 = self->_stateMachine;
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_10001AEE8;
  v64[3] = &unk_1003D0990;
  objc_copyWeak(&v65, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v23,  "registerHandlerForEvent:onState:withBlock:",  @"Success",  @"Presenting",  v64);
  v24 = self->_stateMachine;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_10001B050;
  v62[3] = &unk_1003D0990;
  objc_copyWeak(&v63, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v24,  "registerHandlerForEvent:onState:withBlock:",  @"Failure",  @"Presenting",  v62);
  v25 = self->_stateMachine;
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_10001B0EC;
  v60[3] = &unk_1003D0990;
  objc_copyWeak(&v61, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v25,  "registerHandlerForEvent:onState:withBlock:",  @"Interrupted",  @"Presenting",  v60);
  v26 = self->_stateMachine;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_10001B220;
  v58[3] = &unk_1003D0990;
  objc_copyWeak(&v59, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v26,  "registerHandlerForEvent:onState:withBlock:",  @"Present",  @"Presenting",  v58);
  objc_super v27 = self->_stateMachine;
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_10001B308;
  v56[3] = &unk_1003D0990;
  objc_copyWeak(&v57, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v27,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Presenting",  v56);
  v28 = self->_stateMachine;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10001B3E8;
  v54[3] = &unk_1003D0990;
  objc_copyWeak(&v55, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v28,  "registerHandlerForEvent:onState:withBlock:",  @"Client Dismissing",  @"Presenting",  v54);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( self->_stateMachine,  "registerHandlerForEvent:onState:withBlock:",  @"Present",  @"Presented",  &stru_1003D09D8);
  v29 = self->_stateMachine;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_10001B574;
  v52[3] = &unk_1003D0990;
  objc_copyWeak(&v53, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v29,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Presented",  v52);
  v30 = self->_stateMachine;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_10001B698;
  v50[3] = &unk_1003D0990;
  objc_copyWeak(&v51, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v30,  "registerHandlerForEvent:onState:withBlock:",  @"Client Dismissing",  @"Presented",  v50);
  v31 = self->_stateMachine;
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10001B7BC;
  v48[3] = &unk_1003D0990;
  objc_copyWeak(&v49, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v31,  "registerHandlerForEvent:onState:withBlock:",  @"Success",  @"Dismissing",  v48);
  v32 = self->_stateMachine;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10001B954;
  v46[3] = &unk_1003D0990;
  objc_copyWeak(&v47, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v32,  "registerHandlerForEvent:onState:withBlock:",  @"Failure",  @"Dismissing",  v46);
  v33 = self->_stateMachine;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10001BA4C;
  v44[3] = &unk_1003D0990;
  objc_copyWeak(&v45, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v33,  "registerHandlerForEvent:onState:withBlock:",  @"Dismiss",  @"Dismissing",  v44);
  v34 = self->_stateMachine;
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472LL;
  v42[2] = sub_10001BAB0;
  v42[3] = &unk_1003D0990;
  objc_copyWeak(&v43, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v34,  "registerHandlerForEvent:onState:withBlock:",  @"Present",  @"Dismissing",  v42);
  v35 = self->_stateMachine;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_10001BB40;
  v40[3] = &unk_1003D0990;
  objc_copyWeak(&v41, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v35,  "registerHandlerForEvent:onState:withBlock:",  @"Invalidate",  @"Dismissed",  v40);
  -[TVSStateMachine setCallsStateChangeHandlerSynchronously:]( self->_stateMachine,  "setCallsStateChangeHandlerSynchronously:",  1LL);
  v36 = self->_stateMachine;
  id v37 = sub_100084158();
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  -[TVSStateMachine setLogObject:](v36, "setLogObject:", v38);

  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v41);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);
  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&v67);
  objc_destroyWeak(&v69);
  objc_destroyWeak(&v71);
  objc_destroyWeak(&v73);
  objc_destroyWeak(&v75);
  objc_destroyWeak(&v77);
  objc_destroyWeak(&v79);
  objc_destroyWeak(&v81);
  objc_destroyWeak(&v83);
  objc_destroyWeak(&v85);
  objc_destroyWeak(&v87);
  objc_destroyWeak(&v89);
  objc_destroyWeak(&v91);

  objc_destroyWeak(&location);
}

- (void)_machinePrepareUIWithProvider:(id)a3
{
  id v4 = a3;
  id v5 = -[PBSystemOverlayPreparationTransaction initWithUIProvider:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayPreparationTransaction),  "initWithUIProvider:",  v4);
  preparationTransaction = self->_preparationTransaction;
  self->_preparationTransaction = v5;

  objc_initWeak(&location, self);
  id v7 = self->_preparationTransaction;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10001BD38;
  uint64_t v11 = &unk_1003D0A28;
  objc_copyWeak(&v12, &location);
  -[PBSystemOverlayPreparationTransaction registerBlockObserver:](v7, "registerBlockObserver:", &v8);
  -[PBSystemOverlayPreparationTransaction begin](self->_preparationTransaction, "begin", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_machinePresentUIWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = -[PBSystemOverlayPresentationTransaction initWithRequest:viewController:layoutLevel:presentationDelegate:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayPresentationTransaction),  "initWithRequest:viewController:layoutLevel:presentationDelegate:",  v4,  self->_viewController,  self->_layoutLevel,  self->_presentationHandler);
  if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 coordinatedTransitionToken]);
    -[PBCoordinatedTransition setCoordinatedTransitionToken:](v5, "setCoordinatedTransitionToken:", v6);
  }

  objc_storeStrong((id *)&self->_presentationTransaction, v5);
  objc_initWeak(&location, self);
  presentationTransaction = self->_presentationTransaction;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  v10 = sub_10001C0EC;
  uint64_t v11 = &unk_1003D0A28;
  objc_copyWeak(&v12, &location);
  -[PBSystemOverlayPresentationTransaction registerBlockObserver:]( presentationTransaction,  "registerBlockObserver:",  &v8);
  -[PBSystemOverlayPresentationTransaction begin](self->_presentationTransaction, "begin", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_machineDismissUIWithRequest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 _clientInitiated];
  id v6 = sub_100084158();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client initiated dismissal, waiting for completion",  (uint8_t *)buf,  2u);
    }

    uint64_t v9 = -[PBSystemOverlayDismissalTransaction initWithPresentationDelegate:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayDismissalTransaction),  "initWithPresentationDelegate:layoutLevel:",  self->_presentationHandler,  self->_layoutLevel);
    dismissalTransaction = self->_dismissalTransaction;
    self->_dismissalTransaction = v9;
  }

  else
  {
    if (v8)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "System initiated dismissal, running transaction",  (uint8_t *)buf,  2u);
    }

    uint64_t v11 = -[PBSystemOverlayDismissalTransaction initWithRequest:viewController:layoutLevel:deactivationReasons:presentationDelegate:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayDismissalTransaction),  "initWithRequest:viewController:layoutLevel:deactivationReasons:presentationDelegate:",  v4,  self->_viewController,  self->_layoutLevel,  self->_sceneDeactivationReasons,  self->_presentationHandler);
    id v12 = self->_dismissalTransaction;
    self->_dismissalTransaction = v11;

    objc_initWeak(buf, self);
    v13 = self->_dismissalTransaction;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_10001C518;
    v14[3] = &unk_1003D0A28;
    objc_copyWeak(&v15, buf);
    -[PBSystemOverlayDismissalTransaction registerBlockObserver:](v13, "registerBlockObserver:", v14);
    -[PBSystemOverlayDismissalTransaction begin](self->_dismissalTransaction, "begin");
    objc_destroyWeak(&v15);
    objc_destroyWeak(buf);
  }
}

- (void)_machineAddPendingPresentationRequest:(id)a3
{
}

- (void)_machineCleanup
{
  viewController = self->_viewController;
  self->_viewController = 0LL;

  -[NSMutableArray removeAllObjects](self->_pendingDismissalRequests, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_pendingPresentationRequests, "removeAllObjects");
  -[TVSStateMachine postEvent:](self->_stateMachine, "postEvent:", @"Invalidate");
}

- (void)_machineNotifyWillPresent
{
  signpostLog = self->_signpostLog;
  if (signpostLog)
  {
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(signpostLog, self);
    unsigned int v5 = self->_signpostLog;
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_BEGIN,  v4,  "Present",  " isAnimation=YES",  v8,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlaySession delegate](self, "delegate"));
  [v7 systemOverlaySessionWillPresent:self];
}

- (void)_machineNotifyDidPresent
{
  signpostLog = self->_signpostLog;
  if (signpostLog)
  {
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(signpostLog, self);
    unsigned int v5 = self->_signpostLog;
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  v4,  "Present",  "",  v8,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlaySession delegate](self, "delegate"));
  [v7 systemOverlaySessionDidPresent:self];
}

- (void)_machineNotifyWillDismissWithContext:(id)a3
{
  id v4 = a3;
  signpostLog = self->_signpostLog;
  if (signpostLog)
  {
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(signpostLog, self);
    id v7 = self->_signpostLog;
    BOOL v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v8,  OS_SIGNPOST_INTERVAL_BEGIN,  v6,  "Dismiss",  " isAnimation=YES",  v10,  2u);
    }
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlaySession delegate](self, "delegate"));
  [v9 systemOverlaySessionWillDismiss:self withContext:v4];
}

- (void)_machineNotifyDidDismiss
{
  signpostLog = self->_signpostLog;
  if (signpostLog)
  {
    os_signpost_id_t v4 = os_signpost_id_make_with_pointer(signpostLog, self);
    unsigned int v5 = self->_signpostLog;
    os_signpost_id_t v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_signpost_emit_with_name_impl( (void *)&_mh_execute_header,  v6,  OS_SIGNPOST_INTERVAL_END,  v4,  "Dismiss",  "",  v8,  2u);
    }
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlaySession delegate](self, "delegate"));
  [v7 systemOverlaySessionDidDismiss:self];
}

- (void)_machineNotifyDidCancelWithContext:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlaySession delegate](self, "delegate"));
  [v5 systemOverlaySessionDidCancel:self withContext:v4];
}

- (void)_machineNotifyDidInvalidate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlaySession delegate](self, "delegate"));
  [v3 systemOverlaySessionDidInvalidate:self];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)state
{
  return self->_state;
}

- (OS_os_log)signpostLog
{
  return self->_signpostLog;
}

- (PBSystemUIPresenting)presentationHandler
{
  return self->_presentationHandler;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (PBSystemOverlaySessionDelegate)delegate
{
  return (PBSystemOverlaySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)sceneDeactivationReasons
{
  return self->_sceneDeactivationReasons;
}

- (void).cxx_destruct
{
}

@end