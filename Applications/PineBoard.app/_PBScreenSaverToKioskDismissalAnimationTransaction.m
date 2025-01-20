@interface _PBScreenSaverToKioskDismissalAnimationTransaction
- ($307AF99ED8495AD501ABB6C009BFDA17)context;
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (BOOL)shouldApplyStartValues;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (UIViewPropertyAnimator)alphaAnimator;
- (UIViewPropertyAnimator)springAnimator;
- (void)_begin;
- (void)setAnimated:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setScreenSaverViewController:(id)a3;
- (void)setShouldApplyStartValues:(BOOL)a3;
@end

@implementation _PBScreenSaverToKioskDismissalAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (void)_begin
{
  v57.receiver = self;
  v57.super_class = (Class)&OBJC_CLASS____PBScreenSaverToKioskDismissalAnimationTransaction;
  -[_PBScreenSaverToKioskDismissalAnimationTransaction _begin](&v57, "_begin");
  -[_PBScreenSaverToKioskDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Kiosk Animation Completed");
  objc_initWeak(&location, self);
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_10012A454;
  v54[3] = &unk_1003D8830;
  objc_copyWeak(&v55, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  v54));
  v4 = &_dispatch_main_q;
  [v3 setQueue:&_dispatch_main_q];

  id v5 = [[PBSPerformKioskAnimationAction alloc] initWithInfo:0 responder:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence"));
  defaultKioskScene = self->_context.defaultKioskScene;
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_10012A510;
  v51[3] = &unk_1003D8858;
  id v8 = v6;
  id v52 = v8;
  id v9 = v5;
  id v53 = v9;
  -[FBScene updateSettingsWithTransitionBlock:](defaultKioskScene, "updateSettingsWithTransitionBlock:", v51);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 windowForLayoutLevel:1]);

  [v11 setHidden:0];
  v37 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 rootViewController]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);

  if (self->_shouldApplyStartValues) {
    [v13 setAlpha:0.0];
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 windowForLayoutLevel:6]);

  v36 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 rootViewController]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 view]);

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_10012A578;
  v48[3] = &unk_1003CFEB8;
  id v18 = v17;
  id v49 = v18;
  id v19 = v13;
  id v50 = v19;
  v38 = objc_retainBlock(v48);
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_10012A5E4;
  v46[3] = &unk_1003CFF08;
  id v35 = v19;
  id v47 = v35;
  v20 = objc_retainBlock(v46);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10012A630;
  v44[3] = &unk_1003CFF08;
  id v34 = v18;
  id v45 = v34;
  v21 = objc_retainBlock(v44);
  v22 = (void *)objc_claimAutoreleasedReturnValue( -[_PBScreenSaverToKioskDismissalAnimationTransaction screenSaverViewController]( self,  "screenSaverViewController"));
  [v22 screenSaverTransitionUpdatedAcceptEvents:0];

  if (self->_animated)
  {
    objc_initWeak(&from, self);
    +[UIWindow _synchronizeDrawing](&OBJC_CLASS___UIWindow, "_synchronizeDrawing");
    id v32 = v8;
    v33 = v3;
    v23 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  100.0,  25.0,  0.0,  0.0);
    v24 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    -[UISpringTimingParameters settlingDuration](v23, "settlingDuration");
    v25 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v24, "initWithDuration:timingParameters:", v23);
    springAnimator = self->_springAnimator;
    self->_springAnimator = v25;

    -[UIViewPropertyAnimator addAnimations:](self->_springAnimator, "addAnimations:", v38);
    v27 = self->_springAnimator;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10012A66C;
    v41[3] = &unk_1003D8808;
    objc_copyWeak(&v42, &from);
    -[UIViewPropertyAnimator addCompletion:](v27, "addCompletion:", v41);
    -[_PBScreenSaverToKioskDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Spring Animation Complete");
    v28 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.33,  0.0,  0.67,  1.0);
    v29 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v28,  0.33);
    alphaAnimator = self->_alphaAnimator;
    self->_alphaAnimator = v29;

    -[UIViewPropertyAnimator addAnimations:](self->_alphaAnimator, "addAnimations:", v20);
    v31 = self->_alphaAnimator;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472LL;
    v39[2] = sub_10012A6C8;
    v39[3] = &unk_1003D8808;
    objc_copyWeak(&v40, &from);
    -[UIViewPropertyAnimator addCompletion:](v31, "addCompletion:", v39);
    -[_PBScreenSaverToKioskDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Alpha Animation Complete");
    -[_PBScreenSaverToKioskDismissalAnimationTransaction listenForSatisfiedMilestone:withBlock:]( self,  "listenForSatisfiedMilestone:withBlock:",  @"Kiosk Animation Completed",  v21);
    -[UIViewPropertyAnimator startAnimation](self->_springAnimator, "startAnimation");
    -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");
    objc_destroyWeak(&v40);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&from);
    v3 = v33;
    id v8 = v32;
  }

  else
  {
    ((void (*)(void))v38[2])();
    ((void (*)(void *))v20[2])(v20);
    ((void (*)(void *))v21[2])(v21);
  }

  objc_destroyWeak(&v55);
  objc_destroyWeak(&location);
}

- (PBScreenSaverContentPresentingViewController)screenSaverViewController
{
  return self->_screenSaverViewController;
}

- (void)setScreenSaverViewController:(id)a3
{
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)shouldApplyStartValues
{
  return self->_shouldApplyStartValues;
}

- (void)setShouldApplyStartValues:(BOOL)a3
{
  self->_shouldApplyStartValues = a3;
}

- ($307AF99ED8495AD501ABB6C009BFDA17)context
{
  return ($307AF99ED8495AD501ABB6C009BFDA17)self->_context.defaultKioskScene;
}

- (void)setContext:(id)a3
{
  defaultKioskScene = self->_context.defaultKioskScene;
  self->_context.defaultKioskScene = (FBScene *)a3.var0;
}

- (UIViewPropertyAnimator)springAnimator
{
  return self->_springAnimator;
}

- (UIViewPropertyAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenSaverViewController, 0LL);
}

@end