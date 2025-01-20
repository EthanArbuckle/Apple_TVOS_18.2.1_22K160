@interface PBConferenceRoomDisplayManager
+ (PBConferenceRoomDisplayManager)sharedInstance;
+ (PBDependencyDescription)dependencyDescription;
- (BOOL)dismissCRDWaitingScreen;
- (BOOL)isPresenting;
- (BOOL)shouldLaunchCRD;
- (BOOL)startCRDWithReason:(unint64_t)a3;
- (NSString)lastFocusedAppBundleIdentifier;
- (PBConferenceRoomDisplayManager)init;
- (PBSystemGestureHandle)dismissCRDInstructionsGesture;
- (PBSystemGestureHandle)dismissCRDLoadingGesture;
- (PBSystemOverlayController)instructionsOverlayController;
- (PBSystemOverlayController)loadingOverlayController;
- (TVSStateMachine)stateMachine;
- (id)_dismissCRDInstructionsGestureCreatingIfNeeded;
- (id)_dismissCRDLoadingGestureCreatingIfNeeded;
- (id)_dismissGestureHandleForOverlayController:(id)a3;
- (id)_init;
- (id)_launchCRDApp;
- (id)_showCRDWaitingScreen;
- (void)_dismissCRDInstructions;
- (void)_dismissCRDLoading;
- (void)_handleLoadingTimeout;
- (void)_handleSettingsChanged;
- (void)_initializeStateMachine;
- (void)_presentCRDInsructions;
- (void)_presentCRDLoading;
- (void)_updateIfCRDDisabledWhileActive;
- (void)_updateIfCRDForcedOnWhileIdle;
- (void)appTransitioner:(id)a3 didCompleteAppTransition:(id)a4;
- (void)appTransitioner:(id)a3 didInterruptAppTransition:(id)a4 becauseOfOtherAppTransition:(id)a5;
- (void)beginStopCRD;
- (void)canStopCRDWithResult:(id)a3;
- (void)dealloc;
- (void)endStopCRD;
- (void)exitCRDApp;
- (void)handleTermination;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)screenSaverManagerDidDismissScreenSaver:(id)a3;
- (void)screenSaverManagerDidPresentScreenSaver:(id)a3;
- (void)screenSaverManagerWillDismissScreenSaver:(id)a3;
- (void)screenSaverManagerWillPresentScreenSaver:(id)a3;
- (void)setLastFocusedAppBundleIdentifier:(id)a3;
- (void)setPresenting:(BOOL)a3;
@end

@implementation PBConferenceRoomDisplayManager

+ (PBDependencyDescription)dependencyDescription
{
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001E7950;
  v14[3] = &unk_1003CFF78;
  v14[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v14);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDefaultOpenAppTransitioner, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v15[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v15[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBScreenSaverManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v15[2] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 3LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v12);

  return v2;
}

+ (PBConferenceRoomDisplayManager)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001E79E8;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471428 != -1) {
    dispatch_once(&qword_100471428, block);
  }
  return (PBConferenceRoomDisplayManager *)(id)qword_100471420;
}

- (PBConferenceRoomDisplayManager)init
{
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"Unimplemented",  @"-[PBConferenceRoomDisplayManager init] not supported, use +sharedInstance instead",  0LL));
  objc_exception_throw(v2);
  return (PBConferenceRoomDisplayManager *)-[PBConferenceRoomDisplayManager _init](v3, v4);
}

- (id)_init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBConferenceRoomDisplayManager;
  id v2 = -[PBConferenceRoomDisplayManager init](&v9, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    -[PBConferenceRoomDisplayManager _initializeStateMachine](v2, "_initializeStateMachine");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1001E7B2C;
    v7[3] = &unk_1003D0FA8;
    SEL v4 = v3;
    v8 = v4;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v4,  v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
    [v5 addObserver:v4 forKeyPath:@"mode" options:0 context:off_10046DBC0];
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v3 removeObserver:self];

  SEL v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"mode" context:off_10046DBC0];
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  [v5 removeObserver:self];

  -[PBSystemGestureHandle invalidate](self->_dismissCRDInstructionsGesture, "invalidate");
  -[PBSystemGestureHandle invalidate](self->_dismissCRDLoadingGesture, "invalidate");

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBConferenceRoomDisplayManager;
  -[PBConferenceRoomDisplayManager dealloc](&v6, "dealloc");
}

- (BOOL)shouldLaunchCRD
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  BOOL v3 = [v2 mode] != 0;

  return v3;
}

- (BOOL)startCRDWithReason:(unint64_t)a3
{
  BOOL v5 = -[PBConferenceRoomDisplayManager shouldLaunchCRD](self, "shouldLaunchCRD");
  if (v5)
  {
    stateMachine = self->_stateMachine;
    uint64_t v10 = @"Launch Reason";
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v11,  &v10,  1LL));
    -[TVSStateMachine postEvent:withContext:userInfo:]( stateMachine,  "postEvent:withContext:userInfo:",  @"Start",  0LL,  v8);
  }

  return v5;
}

- (void)beginStopCRD
{
}

- (void)endStopCRD
{
}

- (void)canStopCRDWithResult:(id)a3
{
  SEL v4 = (void (**)(id, void))a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  id v6 = [v5 mode];

  if (v6 == (id)3)
  {
    v4[2](v4, 0LL);
  }

  else if (v6 == (id)2 {
         && (uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSStateMachine currentState](self->_stateMachine, "currentState")),
  }
             unsigned int v8 = [v7 isEqualToString:@"Resigning App"],
             v7,
             !v8))
  {
    objc_super v9 = objc_alloc(&OBJC_CLASS___PBRestrictionServiceRequest);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v11 = -[PBRestrictionServiceRequest initWithToken:requestType:](v9, "initWithToken:requestType:", v10, 3LL);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBRestrictionPINManager sharedInstance](&OBJC_CLASS___PBRestrictionPINManager, "sharedInstance"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001E8030;
    v16[3] = &unk_1003D5930;
    v17 = v4;
    [v12 presentWithRequest:v11 resultBlock:v16];

    id v13 = sub_100082934();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "PIN required to perform CRD action",  (uint8_t *)&v15,  2u);
    }
  }

  else
  {
    v4[2](v4, 1LL);
  }
}

- (void)handleTermination
{
}

- (BOOL)dismissCRDWaitingScreen
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBConferenceRoomDisplayManager stateMachine](self, "stateMachine"));
  SEL v4 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 currentState]);

  if (v4 == @"Showing Waiting Screen")
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBConferenceRoomDisplayManager stateMachine](self, "stateMachine"));
    [v5 postEvent:@"Waiting Screen Cancelled"];
  }

  return v4 == @"Showing Waiting Screen";
}

- (void)screenSaverManagerWillPresentScreenSaver:(id)a3
{
}

- (void)screenSaverManagerDidPresentScreenSaver:(id)a3
{
}

- (void)screenSaverManagerWillDismissScreenSaver:(id)a3
{
}

- (void)screenSaverManagerDidDismissScreenSaver:(id)a3
{
}

- (void)appTransitioner:(id)a3 didCompleteAppTransition:(id)a4
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "openRequest", a3));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 toAppInfo]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleIdentifier]);

  if ([v7 isEqualToString:@"com.apple.TVConferenceRoomDisplay"])
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBConferenceRoomDisplayManager stateMachine](self, "stateMachine"));
    [v8 postEvent:@"App Launched"];
  }
}

- (void)appTransitioner:(id)a3 didInterruptAppTransition:(id)a4 becauseOfOtherAppTransition:(id)a5
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "openRequest", a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 toAppInfo]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);

  if ([v8 isEqualToString:@"com.apple.TVConferenceRoomDisplay"])
  {
    objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBConferenceRoomDisplayManager stateMachine](self, "stateMachine"));
    [v9 postEvent:@"App Launch Failed"];
  }
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBConferenceRoomDisplayManager _dismissGestureHandleForOverlayController:]( self,  "_dismissGestureHandleForOverlayController:",  a3,  a4));
  [v4 acquire];
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  SEL v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBConferenceRoomDisplayManager _dismissGestureHandleForOverlayController:]( self,  "_dismissGestureHandleForOverlayController:",  a3,  a4));
  [v4 relinquish];
}

- (id)_dismissGestureHandleForOverlayController:(id)a3
{
  BOOL v5 = (PBSystemOverlayController *)a3;
  id v6 = v5;
  if (self->_instructionsOverlayController == v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[PBConferenceRoomDisplayManager _dismissCRDInstructionsGestureCreatingIfNeeded]( self,  "_dismissCRDInstructionsGestureCreatingIfNeeded"));
    goto LABEL_5;
  }

  if (self->_loadingOverlayController == v5)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue( -[PBConferenceRoomDisplayManager _dismissCRDLoadingGestureCreatingIfNeeded]( self,  "_dismissCRDLoadingGestureCreatingIfNeeded"));
LABEL_5:
    unsigned int v8 = (void *)v7;

    return v8;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected overlayController: %@",  v5));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_1002911C8(a2, (uint64_t)self, (uint64_t)v10);
  }
  id result = (id) _bs_set_crash_log_message([v10 UTF8String]);
  __break(0);
  return result;
}

- (id)_dismissCRDInstructionsGestureCreatingIfNeeded
{
  dismissCRDInstructionsGesture = self->_dismissCRDInstructionsGesture;
  if (!dismissCRDInstructionsGesture)
  {
    objc_initWeak(&location, self);
    objc_super v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_1001E84B4;
    v12 = &unk_1003D1020;
    objc_copyWeak(&v13, &location);
    SEL v4 = objc_retainBlock(&v9);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureManager sharedInstance]( &OBJC_CLASS___PBSystemGestureManager,  "sharedInstance",  v9,  v10,  v11,  v12));
    id v6 = (PBSystemGestureHandle *)[v5 newHandleForSystemGesture:47 actionHandler:v4];
    uint64_t v7 = self->_dismissCRDInstructionsGesture;
    self->_dismissCRDInstructionsGesture = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    dismissCRDInstructionsGesture = self->_dismissCRDInstructionsGesture;
  }

  return dismissCRDInstructionsGesture;
}

- (id)_dismissCRDLoadingGestureCreatingIfNeeded
{
  dismissCRDLoadingGesture = self->_dismissCRDLoadingGesture;
  if (!dismissCRDLoadingGesture)
  {
    objc_initWeak(&location, self);
    objc_super v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472LL;
    v11 = sub_1001E868C;
    v12 = &unk_1003D1020;
    objc_copyWeak(&v13, &location);
    SEL v4 = objc_retainBlock(&v9);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureManager sharedInstance]( &OBJC_CLASS___PBSystemGestureManager,  "sharedInstance",  v9,  v10,  v11,  v12));
    id v6 = (PBSystemGestureHandle *)[v5 newHandleForSystemGesture:48 actionHandler:v4];
    uint64_t v7 = self->_dismissCRDLoadingGesture;
    self->_dismissCRDLoadingGesture = v6;

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    dismissCRDLoadingGesture = self->_dismissCRDLoadingGesture;
  }

  return dismissCRDLoadingGesture;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_10046DBC0 == a6)
  {
    -[PBConferenceRoomDisplayManager performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleSettingsChanged",  0LL,  a5,  0.5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBConferenceRoomDisplayManager;
    -[PBConferenceRoomDisplayManager observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_handleSettingsChanged
{
}

- (void)_initializeStateMachine
{
  BOOL v3 = objc_alloc(&OBJC_CLASS___TVSStateMachine);
  SEL v4 = (objc_class *)objc_opt_class(self);
  BOOL v5 = NSStringFromClass(v4);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = -[TVSStateMachine initWithName:initialState:mode:stateChangeHandler:]( v3,  "initWithName:initialState:mode:stateChangeHandler:",  v6,  @"Idle",  0LL,  0LL);
  stateMachine = self->_stateMachine;
  self->_stateMachine = v7;

  objc_initWeak(&location, self);
  objc_super v9 = self->_stateMachine;
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472LL;
  v61[2] = sub_1001E8F5C;
  v61[3] = &unk_1003D0990;
  objc_copyWeak(&v62, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v9,  "registerHandlerForEvent:onState:withBlock:",  @"Start",  @"Idle",  v61);
  uint64_t v10 = self->_stateMachine;
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472LL;
  v59[2] = sub_1001E90A8;
  v59[3] = &unk_1003D0990;
  objc_copyWeak(&v60, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v10,  "registerHandlerForEvent:onState:withBlock:",  @"Timer Expired",  @"Showing Waiting Screen",  v59);
  v11 = self->_stateMachine;
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472LL;
  v57[2] = sub_1001E9118;
  v57[3] = &unk_1003D0990;
  objc_copyWeak(&v58, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v11,  "registerHandlerForEvent:onState:withBlock:",  @"Waiting Screen Cancelled",  @"Showing Waiting Screen",  v57);
  v12 = self->_stateMachine;
  v66[0] = @"Showing App";
  v66[1] = @"Showing Screen Saver";
  v66[2] = @"Launching App";
  v66[3] = @"Resigning App";
  id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v66, 4LL));
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1001E91A4;
  v55[3] = &unk_1003D0990;
  objc_copyWeak(&v56, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v12,  "registerHandlerForEvent:onStates:withBlock:",  @"Exited Unexpectedly",  v13,  v55);

  v14 = self->_stateMachine;
  v65[0] = @"Idle";
  v65[1] = @"Showing App";
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v65, 2LL));
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472LL;
  v53[2] = sub_1001E9294;
  v53[3] = &unk_1003D0990;
  objc_copyWeak(&v54, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v14,  "registerHandlerForEvent:onStates:withBlock:",  @"Settings Changed",  v15,  v53);

  v16 = self->_stateMachine;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_1001E9300;
  v51[3] = &unk_1003D0990;
  objc_copyWeak(&v52, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v16,  "registerHandlerForEvent:onState:withBlock:",  @"Settings Changed",  @"Showing Screen Saver",  v51);
  v17 = self->_stateMachine;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_1001E9364;
  v49[3] = &unk_1003D0990;
  objc_copyWeak(&v50, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v17,  "registerHandlerForEvent:onState:withBlock:",  @"App Launched",  @"Launching App",  v49);
  v18 = self->_stateMachine;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1001E93A8;
  v47[3] = &unk_1003D0990;
  objc_copyWeak(&v48, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v18,  "registerHandlerForEvent:onState:withBlock:",  @"App Launch Failed",  @"Launching App",  v47);
  v19 = self->_stateMachine;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472LL;
  v45[2] = sub_1001E9418;
  v45[3] = &unk_1003D0990;
  objc_copyWeak(&v46, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v19,  "registerHandlerForEvent:onState:withBlock:",  @"Begin Resign App",  @"Launching App",  v45);
  v20 = self->_stateMachine;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_1001E9450;
  v43[3] = &unk_1003D0990;
  objc_copyWeak(&v44, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v20,  "registerHandlerForEvent:onState:withBlock:",  @"Begin Resign App",  @"Showing App",  v43);
  v21 = self->_stateMachine;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1001E9498;
  v41[3] = &unk_1003D0990;
  objc_copyWeak(&v42, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v21,  "registerHandlerForEvent:onState:withBlock:",  @"Begin Resign App",  @"Showing Screen Saver",  v41);
  v22 = self->_stateMachine;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_1001E94E0;
  v39[3] = &unk_1003D0990;
  objc_copyWeak(&v40, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v22,  "registerHandlerForEvent:onState:withBlock:",  @"Complete Resign App",  @"Resigning App",  v39);
  v23 = self->_stateMachine;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = sub_1001E951C;
  v37[3] = &unk_1003D0990;
  objc_copyWeak(&v38, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v23,  "registerHandlerForEvent:onState:withBlock:",  @"Will Present Screen Saver",  @"Showing App",  v37);
  v24 = self->_stateMachine;
  v64[0] = @"Idle";
  v64[1] = @"Showing App";
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v64, 2LL));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472LL;
  v35[2] = sub_1001E9570;
  v35[3] = &unk_1003D0990;
  objc_copyWeak(&v36, &location);
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v24,  "registerHandlerForEvent:onStates:withBlock:",  @"Did Present Screen Saver",  v25,  v35);

  v26 = self->_stateMachine;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1001E9600;
  v33[3] = &unk_1003D0990;
  objc_copyWeak(&v34, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v26,  "registerHandlerForEvent:onState:withBlock:",  @"Will Dismiss Screen Saver",  @"Showing Screen Saver",  v33);
  v27 = self->_stateMachine;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_1001E965C;
  v31[3] = &unk_1003D0990;
  objc_copyWeak(&v32, &location);
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v27,  "registerHandlerForEvent:onState:withBlock:",  @"Did Dismiss Screen Saver",  @"Showing Screen Saver",  v31);
  v28 = self->_stateMachine;
  id v29 = sub_100082934();
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  -[TVSStateMachine setLogObject:](v28, "setLogObject:", v30);

  -[TVSStateMachine setShouldAcceptEvents:](self->_stateMachine, "setShouldAcceptEvents:", 1LL);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v48);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&v56);
  objc_destroyWeak(&v58);
  objc_destroyWeak(&v60);
  objc_destroyWeak(&v62);
  objc_destroyWeak(&location);
}

- (id)_launchCRDApp
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPowerManager sharedInstance](&OBJC_CLASS___PBPowerManager, "sharedInstance"));
  id v4 = [v3 powerState];

  if (v4 == (id)3) {
    return @"Idle";
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1001E97C8;
  v7[3] = &unk_1003D0868;
  void v7[4] = self;
  [v6 openApplication:@"com.apple.TVConferenceRoomDisplay" launchURL:0 options:0 suspended:0 completion:v7];

  -[PBConferenceRoomDisplayManager setPresenting:](self, "setPresenting:", 1LL);
  return @"Launching App";
}

- (void)exitCRDApp
{
  BOOL v3 = self->_lastFocusedAppBundleIdentifier;
  lastFocusedAppBundleIdentifier = self->_lastFocusedAppBundleIdentifier;
  self->_lastFocusedAppBundleIdentifier = 0LL;

  objc_initWeak(&location, self);
  -[PBConferenceRoomDisplayManager beginStopCRD](self, "beginStopCRD");
  if (v3)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_1001E9A98;
    v11[3] = &unk_1003DB658;
    objc_copyWeak(&v12, &location);
    [v5 openApplication:v3 launchURL:0 options:0 suspended:0 completion:v11];

    objc_destroyWeak(&v12);
  }

  else
  {
    objc_initWeak(&from, self);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppDelegate sharedApplicationDelegate](&OBJC_CLASS___PBAppDelegate, "sharedApplicationDelegate"));
    uint64_t v14 = PBAppLaunchOptionDeactivation;
    __int16 v15 = &__kCFBooleanTrue;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v15,  &v14,  1LL));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1001E9C40;
    v8[3] = &unk_1003DB658;
    objc_copyWeak(&v9, &from);
    [v6 openKioskApplicationWithReason:@"Exit CRD" options:v7 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&location);
}

- (id)_showCRDWaitingScreen
{
  return @"Showing Waiting Screen";
}

- (void)_handleLoadingTimeout
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBConferenceRoomDisplayManager stateMachine](self, "stateMachine"));
  [v2 postEvent:@"Timer Expired"];
}

- (void)_updateIfCRDForcedOnWhileIdle
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  id v4 = [v3 mode];

  if (v4 == (id)3)
  {
    if ((sub_1001C9BFC() & 1) != 0)
    {
      id v5 = sub_100082934();
      objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Skipping forced CRD - Purple Buddy not finished",  v7,  2u);
      }
    }

    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472LL;
      v8[2] = sub_1001E9DE4;
      v8[3] = &unk_1003CFF08;
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[PBConferenceRoomDisplayManager stateMachine](self, "stateMachine"));
      objc_super v6 = (os_log_s *)v9;
      -[os_log_s executeBlockAfterCurrentStateTransition:](v6, "executeBlockAfterCurrentStateTransition:", v8);
    }
  }

- (void)_updateIfCRDDisabledWhileActive
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBSConferenceRoomDisplaySettings sharedInstance]( &OBJC_CLASS___PBSConferenceRoomDisplaySettings,  "sharedInstance"));
  id v4 = [v3 mode];

  if (!v4)
  {
    if (-[PBConferenceRoomDisplayManager isPresenting](self, "isPresenting")) {
      -[PBConferenceRoomDisplayManager exitCRDApp](self, "exitCRDApp");
    }
  }

- (void)_presentCRDInsructions
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v3, "setIdentifier:", @"CRD-Insructions");
  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v3, "setAnimated:", 1LL);
  id v4 = objc_alloc_init(&OBJC_CLASS____PBConferenceRoomDisplayInstructionUIProvider);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v3, "setProvider:", v4);

  uint64_t v8 = PBSViewServiceOptionsAnimateKey;
  id v9 = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
  -[PBMutableSystemOverlayPresentationRequest setClientOptions:](v3, "setClientOptions:", v5);

  instructionsOverlayController = self->_instructionsOverlayController;
  id v7 = -[PBMutableSystemOverlayPresentationRequest copy](v3, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( instructionsOverlayController,  "presentWithRequest:completion:",  v7,  0LL);
}

- (void)_dismissCRDInstructions
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_instructionsOverlayController, "activeSession"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v3));
    [v4 setAnimated:1];
    instructionsOverlayController = self->_instructionsOverlayController;
    id v6 = [v4 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( instructionsOverlayController,  "dismissWithRequest:completion:",  v6,  0LL);
  }
}

- (void)_presentCRDLoading
{
  BOOL v3 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v3, "setIdentifier:", @"CRD-Loading");
  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v3, "setAnimated:", 1LL);
  id v4 = objc_alloc_init(&OBJC_CLASS____PBConferenceRoomDisplayLoadingUIProvider);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v3, "setProvider:", v4);

  loadingOverlayController = self->_loadingOverlayController;
  id v6 = -[PBMutableSystemOverlayPresentationRequest copy](v3, "copy");
  -[PBSystemOverlayController presentWithRequest:completion:]( loadingOverlayController,  "presentWithRequest:completion:",  v6,  0LL);
}

- (void)_dismissCRDLoading
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_loadingOverlayController, "activeSession"));
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v3));
    [v4 setAnimated:1];
    loadingOverlayController = self->_loadingOverlayController;
    id v6 = [v4 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( loadingOverlayController,  "dismissWithRequest:completion:",  v6,  0LL);
  }
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (PBSystemOverlayController)instructionsOverlayController
{
  return self->_instructionsOverlayController;
}

- (PBSystemOverlayController)loadingOverlayController
{
  return self->_loadingOverlayController;
}

- (NSString)lastFocusedAppBundleIdentifier
{
  return self->_lastFocusedAppBundleIdentifier;
}

- (void)setLastFocusedAppBundleIdentifier:(id)a3
{
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (PBSystemGestureHandle)dismissCRDInstructionsGesture
{
  return self->_dismissCRDInstructionsGesture;
}

- (PBSystemGestureHandle)dismissCRDLoadingGesture
{
  return self->_dismissCRDLoadingGesture;
}

- (void).cxx_destruct
{
}

@end