@interface PBVolumeHUDManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)dismissalInterrupted;
- (BOOL)dismissalStarted;
- (BOOL)isPresenting;
- (BOOL)volumeDownButtonIsDown;
- (BOOL)volumeUpButtonIsDown;
- (NSNumber)preferredVolumeLevel;
- (OS_dispatch_source)dismissalTimer;
- (OS_dispatch_source)indeterminateVolumeDismissalTimer;
- (OS_dispatch_source)indeterminateVolumePresentationTimer;
- (PBSystemOverlayController)overlayController;
- (PBVolumeHUDManager)init;
- (PBVolumeHUDViewController)volumeHUDViewController;
- (TVSStateMachine)stateMachine;
- (id)glyphNameForRouteType:(int64_t)a3;
- (void)_cancelIndeterminateVolumeDismissalTimer;
- (void)_cancelIndeterminateVolumePresentationTimer;
- (void)_startIndeterminateVolumeDismissalTimerWithDuration:(double)a3;
- (void)_startIndeterminateVolumePresentationTimerWithDuration:(double)a3 headingUp:(BOOL)a4;
- (void)cancelDismissalTimer;
- (void)configureStateMachine;
- (void)didBecomeIneligibleForIndeterminateState;
- (void)dismissVolumeHUD;
- (void)noteMuteWasToggledWithCurrentVolumeLevel:(id)a3 eligibleForIndeterminateState:(BOOL)a4;
- (void)notePreferredVolumeLevelChanged:(id)a3;
- (void)noteVolumeDownWasHit:(BOOL)a3 eligibleForIndeterminateState:(BOOL)a4 currentVolumeLevel:(id)a5;
- (void)noteVolumeUpWasHit:(BOOL)a3 eligibleForIndeterminateState:(BOOL)a4 currentVolumeLevel:(id)a5;
- (void)setDismissalInterrupted:(BOOL)a3;
- (void)setDismissalStarted:(BOOL)a3;
- (void)setDismissalTimer:(id)a3;
- (void)setIndeterminateVolumeDismissalTimer:(id)a3;
- (void)setIndeterminateVolumePresentationTimer:(id)a3;
- (void)setPreferredVolumeLevel:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setVolumeDownButtonIsDown:(BOOL)a3;
- (void)setVolumeUpButtonIsDown:(BOOL)a3;
- (void)showIndeterminateVolumeHUDHeadingUp:(BOOL)a3;
- (void)showVolumeHUDForRouteType:(int64_t)a3 withLevel:(id)a4;
- (void)showVolumeHUDWithImage:(id)a3 level:(id)a4;
- (void)showVolumeHUDWithImageName:(id)a3 level:(id)a4;
- (void)startDismissalTimer;
@end

@implementation PBVolumeHUDManager

+ (PBDependencyDescription)dependencyDescription
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10018336C;
  v8[3] = &unk_1003CFF78;
  v8[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v8);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v9 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v6);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100183404;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471200 != -1) {
    dispatch_once(&qword_100471200, block);
  }
  return (id)qword_1004711F8;
}

- (PBVolumeHUDManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBVolumeHUDManager;
  v2 = -[PBVolumeHUDManager init](&v8, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_1001834DC;
    v6[3] = &unk_1003D0FA8;
    uint64_t v4 = v2;
    v7 = v4;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v4,  v6);
    -[PBVolumeHUDManager configureStateMachine](v4, "configureStateMachine");
  }

  return v3;
}

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (void)noteVolumeUpWasHit:(BOOL)a3 eligibleForIndeterminateState:(BOOL)a4 currentVolumeLevel:(id)a5
{
  BOOL v5 = a3;
  if (a4)
  {
    -[PBVolumeHUDManager setPreferredVolumeLevel:](self, "setPreferredVolumeLevel:", a5);
    id v7 = sub_1000F799C();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager preferredVolumeLevel](self, "preferredVolumeLevel"));
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Volume up pressed, saving preferred volume level %@",  (uint8_t *)&v13,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager stateMachine](self, "stateMachine"));
    v11 = v10;
    if (v5) {
      v12 = @"VolumeUpButtonPressed";
    }
    else {
      v12 = @"VolumeUpButtonReleased";
    }
    [v10 postEvent:v12];
  }

  else
  {
    -[PBVolumeHUDManager setVolumeUpButtonIsDown:](self, "setVolumeUpButtonIsDown:", a3, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager volumeHUDViewController](self, "volumeHUDViewController"));
    [v11 noteVolumeUpWasHit:v5];
  }
}

- (void)noteVolumeDownWasHit:(BOOL)a3 eligibleForIndeterminateState:(BOOL)a4 currentVolumeLevel:(id)a5
{
  BOOL v5 = a3;
  if (a4)
  {
    -[PBVolumeHUDManager setPreferredVolumeLevel:](self, "setPreferredVolumeLevel:", a5);
    id v7 = sub_1000F799C();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager preferredVolumeLevel](self, "preferredVolumeLevel"));
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Volume down pressed, saving preferred volume level %@",  (uint8_t *)&v13,  0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager stateMachine](self, "stateMachine"));
    v11 = v10;
    if (v5) {
      v12 = @"VolumeDownButtonPressed";
    }
    else {
      v12 = @"VolumeDownButtonReleased";
    }
    [v10 postEvent:v12];
  }

  else
  {
    -[PBVolumeHUDManager setVolumeDownButtonIsDown:](self, "setVolumeDownButtonIsDown:", a3, a4, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager volumeHUDViewController](self, "volumeHUDViewController"));
    [v11 noteVolumeDownWasHit:v5];
  }
}

- (void)notePreferredVolumeLevelChanged:(id)a3
{
  id v4 = sub_1000F799C();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager preferredVolumeLevel](self, "preferredVolumeLevel"));
    int v8 = 138412290;
    v9 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "Volume level changed, saving preferred level %@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager stateMachine](self, "stateMachine"));
  [v7 postEvent:@"PreferredVolumeLevelChanged"];
}

- (void)noteMuteWasToggledWithCurrentVolumeLevel:(id)a3 eligibleForIndeterminateState:(BOOL)a4
{
  if (a4)
  {
    -[PBVolumeHUDManager setPreferredVolumeLevel:](self, "setPreferredVolumeLevel:", a3);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager stateMachine](self, "stateMachine"));
    [v5 postEvent:@"MuteToggled"];
  }

- (void)didBecomeIneligibleForIndeterminateState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager stateMachine](self, "stateMachine"));
  [v2 postEvent:@"DidBecomeIneligibleForIndeterminateState"];
}

- (void)showVolumeHUDWithImage:(id)a3 level:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[PBVolumeHUDManager isPresenting](self, "isPresenting") || self->_volumeHUDViewController)
  {
    if (self->_dismissalStarted) {
      *(_WORD *)&self->_dismissalStarted = 256;
    }
    id v8 = sub_1000F799C();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating volume HUD with level %@", buf, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager volumeHUDViewController](self, "volumeHUDViewController"));
    [v10 updateVolumeHUDWithLevel:v7 completion:0];

    -[PBVolumeHUDManager startDismissalTimer](self, "startDismissalTimer");
  }

  else
  {
    id v11 = sub_1000F799C();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Creating volume HUD with level %@", buf, 0xCu);
    }

    int v13 = objc_alloc_init(&OBJC_CLASS___PBVolumeHUDViewController);
    volumeHUDViewController = self->_volumeHUDViewController;
    self->_volumeHUDViewController = v13;

    v15 = self->_volumeHUDViewController;
    -[PBVolumeHUDViewController initializeVolumeHUDWithImage:level:](v15, "initializeVolumeHUDWithImage:level:", v6, v7);
    -[PBVolumeHUDViewController setVolumeDownButtonIsDown:]( v15,  "setVolumeDownButtonIsDown:",  -[PBVolumeHUDManager volumeDownButtonIsDown](self, "volumeDownButtonIsDown"));
    -[PBVolumeHUDViewController setVolumeUpButtonIsDown:]( v15,  "setVolumeUpButtonIsDown:",  -[PBVolumeHUDManager volumeUpButtonIsDown](self, "volumeUpButtonIsDown"));
    v16 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 UUIDString]);
    -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v16, "setIdentifier:", v18);

    -[PBMutableSystemOverlayPresentationRequest setAnimated:](v16, "setAnimated:", 0LL);
    v19 = objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100183BF4;
    v22[3] = &unk_1003D2108;
    v23 = v15;
    v20 = v15;
    v21 = -[PBBlockSystemOverlayUIProvider initWithBlock:](v19, "initWithBlock:", v22);
    -[PBMutableSystemOverlayPresentationRequest setProvider:](v16, "setProvider:", v21);

    -[PBSystemOverlayController presentWithRequest:completion:]( self->_overlayController,  "presentWithRequest:completion:",  v16,  0LL);
    -[PBVolumeHUDManager startDismissalTimer](self, "startDismissalTimer");
  }
}

- (void)showVolumeHUDWithImageName:(id)a3 level:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](&OBJC_CLASS___UIImage, "_systemImageNamed:", a3));
  -[PBVolumeHUDManager showVolumeHUDWithImage:level:](self, "showVolumeHUDWithImage:level:", v7, v6);
}

- (void)showVolumeHUDForRouteType:(int64_t)a3 withLevel:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager glyphNameForRouteType:](self, "glyphNameForRouteType:", a3));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 imageWithRenderingMode:2]);
  -[PBVolumeHUDManager showVolumeHUDWithImage:level:](self, "showVolumeHUDWithImage:level:", v9, v6);
}

- (void)dismissVolumeHUD
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  id v4 = v3;
  if (v3)
  {
    self->_dismissalStarted = 1;
    volumeHUDViewController = self->_volumeHUDViewController;
    id v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    id v8 = sub_100183DE0;
    v9 = &unk_1003D63D8;
    v10 = self;
    id v11 = v3;
    -[PBVolumeHUDViewController dismissVolumeHUDWithCompletion:]( volumeHUDViewController,  "dismissVolumeHUDWithCompletion:",  &v6);
  }

  -[PBVolumeHUDManager cancelDismissalTimer](self, "cancelDismissalTimer", v6, v7, v8, v9, v10);
}

- (void)showIndeterminateVolumeHUDHeadingUp:(BOOL)a3
{
  BOOL v3 = a3;
  -[PBVolumeHUDManager cancelDismissalTimer](self, "cancelDismissalTimer");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBVolumeHUDManager volumeHUDViewController](self, "volumeHUDViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100183F58;
  v6[3] = &unk_1003CFF08;
  void v6[4] = self;
  [v5 showIndeterminateVolumeHUDHeadingUp:v3 completion:v6];
}

- (void)startDismissalTimer
{
  BOOL v3 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  dismissalTimer = self->_dismissalTimer;
  self->_dismissalTimer = v3;

  BOOL v5 = self->_dismissalTimer;
  dispatch_time_t v6 = dispatch_time(0LL, llround(1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  uint64_t v7 = self->_dismissalTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100184054;
  handler[3] = &unk_1003CFF08;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v7, handler);
  dispatch_resume((dispatch_object_t)self->_dismissalTimer);
}

- (void)cancelDismissalTimer
{
  dismissalTimer = self->_dismissalTimer;
  if (dismissalTimer)
  {
    dispatch_source_cancel((dispatch_source_t)dismissalTimer);
    id v4 = self->_dismissalTimer;
    self->_dismissalTimer = 0LL;
  }

- (id)glyphNameForRouteType:(int64_t)a3
{
  else {
    return *(&off_1003DA750 + a3);
  }
}

- (void)configureStateMachine
{
  BOOL v3 = -[TVSStateMachine initWithName:initialState:mode:]( objc_alloc(&OBJC_CLASS___TVSStateMachine),  "initWithName:initialState:mode:",  @"IndeterminateVolumeHUDStateMachine",  @"Idle",  0LL);
  id v4 = sub_1000F799C();
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSStateMachine setLogObject:](v3, "setLogObject:", v5);

  -[TVSStateMachine logUnhandledEvents](v3, "logUnhandledEvents");
  -[PBVolumeHUDManager setStateMachine:](self, "setStateMachine:", v3);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"VolumeUpButtonPressed",  &stru_1003DA590);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"VolumeUpButtonReleased",  &stru_1003DA5B0);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"VolumeDownButtonPressed",  &stru_1003DA5D0);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"VolumeDownButtonReleased",  &stru_1003DA5F0);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"MuteToggled",  &stru_1003DA610);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"PreferredVolumeLevelChanged",  &stru_1003DA630);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"IndeterminateAnimationFinished",  &stru_1003DA650);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"IndeterminatePresentationTimerFired",  &stru_1003DA670);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"IndeterminateDismissalTimerFired",  &stru_1003DA690);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"DidBecomeIneligibleForIndeterminateState",  &stru_1003DA6B0);
  -[TVSStateMachine registerDefaultHandlerForEvent:withBlock:]( v3,  "registerDefaultHandlerForEvent:withBlock:",  @"DidDismiss",  &stru_1003DA6D0);
  v47[0] = @"VolumeUpButtonPressed";
  v47[1] = @"VolumeDownButtonPressed";
  dispatch_time_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  v46 = @"Idle";
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100184898;
  v31[3] = &unk_1003D1AD8;
  v31[4] = self;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v3,  "registerHandlerForEvents:onStates:withBlock:",  v6,  v7,  v31);

  v45 = @"Idle";
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = sub_100184A10;
  v30[3] = &unk_1003D1AD8;
  v30[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v3,  "registerHandlerForEvent:onStates:withBlock:",  @"MuteToggled",  v8,  v30);

  v44[0] = @"VolumeUpButtonPressed";
  v44[1] = @"VolumeDownButtonPressed";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v44, 2LL));
  v43[0] = @"WaitingForButtonRelease";
  v43[1] = @"WaitingForVolumeLevel";
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v43, 2LL));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472LL;
  v29[2] = sub_100184B00;
  v29[3] = &unk_1003D1AD8;
  v29[4] = self;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v3,  "registerHandlerForEvents:onStates:withBlock:",  v9,  v10,  v29);

  v42[0] = @"VolumeUpButtonPressed";
  v42[1] = @"VolumeDownButtonPressed";
  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v42, 2LL));
  v41[0] = @"IndeterminateUp";
  v41[1] = @"IndeterminateDown";
  v41[2] = @"StoppingIndeterminateAnimation";
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v41, 3LL));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = sub_100184B64;
  v28[3] = &unk_1003D1AD8;
  v28[4] = self;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v3,  "registerHandlerForEvents:onStates:withBlock:",  v11,  v12,  v28);

  v40[0] = @"VolumeUpButtonReleased";
  v40[1] = @"VolumeDownButtonReleased";
  int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v40, 2LL));
  v39 = @"WaitingForButtonRelease";
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v39, 1LL));
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v3,  "registerHandlerForEvents:onStates:withBlock:",  v13,  v14,  &stru_1003DA6F0);

  v38[0] = @"VolumeUpButtonReleased";
  v38[1] = @"VolumeDownButtonReleased";
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v38, 2LL));
  v37[0] = @"IndeterminateUp";
  v37[1] = @"IndeterminateDown";
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v37, 2LL));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100184BBC;
  v27[3] = &unk_1003D1AD8;
  v27[4] = self;
  -[TVSStateMachine registerHandlerForEvents:onStates:withBlock:]( v3,  "registerHandlerForEvents:onStates:withBlock:",  v15,  v16,  v27);

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100184C08;
  v26[3] = &unk_1003D1AD8;
  v26[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v3,  "registerHandlerForEvent:onState:withBlock:",  @"PreferredVolumeLevelChanged",  @"WaitingForVolumeLevel",  v26);
  v36[0] = @"IndeterminateUp";
  v36[1] = @"IndeterminateDown";
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v36, 2LL));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_100184D00;
  v25[3] = &unk_1003D1AD8;
  v25[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v3,  "registerHandlerForEvent:onStates:withBlock:",  @"PreferredVolumeLevelChanged",  v17,  v25);

  v35 = @"WaitingForButtonRelease";
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100184E3C;
  v24[3] = &unk_1003D1AD8;
  v24[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v3,  "registerHandlerForEvent:onStates:withBlock:",  @"IndeterminatePresentationTimerFired",  v18,  v24);

  v34[0] = @"IndeterminateUp";
  v34[1] = @"IndeterminateDown";
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v3,  "registerHandlerForEvent:onStates:withBlock:",  @"IndeterminateDismissalTimerFired",  v19,  &stru_1003DA710);

  v33[0] = @"IndeterminateUp";
  v33[1] = @"IndeterminateDown";
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_100184ED4;
  v23[3] = &unk_1003D1AD8;
  v23[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v3,  "registerHandlerForEvent:onStates:withBlock:",  @"IndeterminateAnimationFinished",  v20,  v23);

  v32[0] = @"IndeterminateUp";
  v32[1] = @"IndeterminateDown";
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v32, 2LL));
  -[TVSStateMachine registerHandlerForEvent:onStates:withBlock:]( v3,  "registerHandlerForEvent:onStates:withBlock:",  @"DidBecomeIneligibleForIndeterminateState",  v21,  &stru_1003DA730);

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100184F50;
  v22[3] = &unk_1003D1AD8;
  void v22[4] = self;
  -[TVSStateMachine registerHandlerForEvent:onState:withBlock:]( v3,  "registerHandlerForEvent:onState:withBlock:",  @"IndeterminateAnimationFinished",  @"StoppingIndeterminateAnimation",  v22);
  -[TVSStateMachine setShouldAcceptEvents:](v3, "setShouldAcceptEvents:", 1LL);
}

- (void)_startIndeterminateVolumePresentationTimerWithDuration:(double)a3 headingUp:(BOOL)a4
{
  uint64_t v7 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  indeterminateVolumePresentationTimer = self->_indeterminateVolumePresentationTimer;
  self->_indeterminateVolumePresentationTimer = v7;

  v9 = self->_indeterminateVolumePresentationTimer;
  dispatch_time_t v10 = dispatch_time(0LL, llround(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  id v11 = self->_indeterminateVolumePresentationTimer;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10018517C;
  v12[3] = &unk_1003D2008;
  v12[4] = self;
  BOOL v13 = a4;
  dispatch_source_set_event_handler((dispatch_source_t)v11, v12);
  dispatch_resume((dispatch_object_t)self->_indeterminateVolumePresentationTimer);
}

- (void)_cancelIndeterminateVolumePresentationTimer
{
  indeterminateVolumePresentationTimer = self->_indeterminateVolumePresentationTimer;
  if (indeterminateVolumePresentationTimer)
  {
    dispatch_source_cancel((dispatch_source_t)indeterminateVolumePresentationTimer);
    id v4 = self->_indeterminateVolumePresentationTimer;
    self->_indeterminateVolumePresentationTimer = 0LL;
  }

- (void)_startIndeterminateVolumeDismissalTimerWithDuration:(double)a3
{
  BOOL v5 = (OS_dispatch_source *)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_timer,  0LL,  0LL,  &_dispatch_main_q);
  indeterminateVolumeDismissalTimer = self->_indeterminateVolumeDismissalTimer;
  self->_indeterminateVolumeDismissalTimer = v5;

  uint64_t v7 = self->_indeterminateVolumeDismissalTimer;
  dispatch_time_t v8 = dispatch_time(0LL, llround(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  v9 = self->_indeterminateVolumeDismissalTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100185358;
  handler[3] = &unk_1003CFF08;
  handler[4] = self;
  dispatch_source_set_event_handler((dispatch_source_t)v9, handler);
  dispatch_resume((dispatch_object_t)self->_indeterminateVolumeDismissalTimer);
}

- (void)_cancelIndeterminateVolumeDismissalTimer
{
  indeterminateVolumeDismissalTimer = self->_indeterminateVolumeDismissalTimer;
  if (indeterminateVolumeDismissalTimer)
  {
    dispatch_source_cancel((dispatch_source_t)indeterminateVolumeDismissalTimer);
    id v4 = self->_indeterminateVolumeDismissalTimer;
    self->_indeterminateVolumeDismissalTimer = 0LL;
  }

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBVolumeHUDViewController)volumeHUDViewController
{
  return self->_volumeHUDViewController;
}

- (OS_dispatch_source)dismissalTimer
{
  return self->_dismissalTimer;
}

- (void)setDismissalTimer:(id)a3
{
}

- (BOOL)dismissalStarted
{
  return self->_dismissalStarted;
}

- (void)setDismissalStarted:(BOOL)a3
{
  self->_dismissalStarted = a3;
}

- (BOOL)dismissalInterrupted
{
  return self->_dismissalInterrupted;
}

- (void)setDismissalInterrupted:(BOOL)a3
{
  self->_dismissalInterrupted = a3;
}

- (BOOL)volumeUpButtonIsDown
{
  return self->_volumeUpButtonIsDown;
}

- (void)setVolumeUpButtonIsDown:(BOOL)a3
{
  self->_volumeUpButtonIsDown = a3;
}

- (BOOL)volumeDownButtonIsDown
{
  return self->_volumeDownButtonIsDown;
}

- (void)setVolumeDownButtonIsDown:(BOOL)a3
{
  self->_volumeDownButtonIsDown = a3;
}

- (TVSStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (NSNumber)preferredVolumeLevel
{
  return self->_preferredVolumeLevel;
}

- (void)setPreferredVolumeLevel:(id)a3
{
}

- (OS_dispatch_source)indeterminateVolumePresentationTimer
{
  return self->_indeterminateVolumePresentationTimer;
}

- (void)setIndeterminateVolumePresentationTimer:(id)a3
{
}

- (OS_dispatch_source)indeterminateVolumeDismissalTimer
{
  return self->_indeterminateVolumeDismissalTimer;
}

- (void)setIndeterminateVolumeDismissalTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end