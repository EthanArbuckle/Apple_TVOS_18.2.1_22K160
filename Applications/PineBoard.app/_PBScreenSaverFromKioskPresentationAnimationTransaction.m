@interface _PBScreenSaverFromKioskPresentationAnimationTransaction
- ($307AF99ED8495AD501ABB6C009BFDA17)context;
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (UIViewPropertyAnimator)alphaAnimator;
- (UIViewPropertyAnimator)springAnimator;
- (void)_begin;
- (void)_willInterruptWithReason:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setScreenSaverViewController:(id)a3;
@end

@implementation _PBScreenSaverFromKioskPresentationAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v50.receiver = self;
  v50.super_class = (Class)&OBJC_CLASS____PBScreenSaverFromKioskPresentationAnimationTransaction;
  -[_PBScreenSaverFromKioskPresentationAnimationTransaction _begin](&v50, "_begin");
  -[_PBScreenSaverFromKioskPresentationAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Kiosk Animation Completed");
  objc_initWeak(&location, self);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472LL;
  v47[2] = sub_1001618D0;
  v47[3] = &unk_1003D8830;
  objc_copyWeak(&v48, &location);
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  v47));
  v4 = &_dispatch_main_q;
  [v3 setQueue:&_dispatch_main_q];

  id v5 = [[PBSPerformKioskAnimationAction alloc] initWithInfo:0 responder:v3];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence"));
  defaultKioskScene = self->_context.defaultKioskScene;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_10016198C;
  v44[3] = &unk_1003D8858;
  id v8 = v6;
  id v45 = v8;
  id v9 = v5;
  id v46 = v9;
  -[FBScene updateSettingsWithTransitionBlock:](defaultKioskScene, "updateSettingsWithTransitionBlock:", v44);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[_PBScreenSaverFromKioskPresentationAnimationTransaction screenSaverViewController]( self,  "screenSaverViewController"));
  [v10 screenSaverTransitionUpdatedAcceptEvents:1];

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 windowForLayoutLevel:1]);

  [v12 setHidden:0];
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 windowForLayoutLevel:6]);
  v33 = v3;

  v32 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 rootViewController]);
  v16 = (void *)objc_claimAutoreleasedReturnValue([v15 view]);

  CGAffineTransformMakeScale(&v43, 1.3, 1.3);
  [v16 setTransform:&v43];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1001619F4;
  v41[3] = &unk_1003CFF08;
  id v31 = v16;
  id v42 = v31;
  v17 = objc_retainBlock(v41);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472LL;
  v39[2] = sub_100161A6C;
  v39[3] = &unk_1003CFF08;
  id v18 = v12;
  id v40 = v18;
  v19 = objc_retainBlock(v39);
  if (self->_animated)
  {
    id v30 = v18;
    objc_initWeak(&from, self);
    v20 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  20.0,  0.0,  0.0);
    v21 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    -[UISpringTimingParameters settlingDuration](v20, "settlingDuration");
    v22 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v21, "initWithDuration:timingParameters:", v20);
    springAnimator = self->_springAnimator;
    self->_springAnimator = v22;

    -[UIViewPropertyAnimator addAnimations:](self->_springAnimator, "addAnimations:", v17);
    v24 = self->_springAnimator;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472LL;
    v36[2] = sub_100161A88;
    v36[3] = &unk_1003D8808;
    objc_copyWeak(&v37, &from);
    -[UIViewPropertyAnimator addCompletion:](v24, "addCompletion:", v36);
    -[_PBScreenSaverFromKioskPresentationAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Spring Animation Complete");
    v25 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.4,  1.0);
    v26 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v25,  0.25);
    alphaAnimator = self->_alphaAnimator;
    self->_alphaAnimator = v26;

    -[UIViewPropertyAnimator addAnimations:](self->_alphaAnimator, "addAnimations:", &stru_1003D9A80);
    v28 = self->_alphaAnimator;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472LL;
    v34[2] = sub_100161B0C;
    v34[3] = &unk_1003D8808;
    objc_copyWeak(&v35, &from);
    -[UIViewPropertyAnimator addCompletion:](v28, "addCompletion:", v34);
    -[_PBScreenSaverFromKioskPresentationAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Alpha Animation Complete");
    -[_PBScreenSaverFromKioskPresentationAnimationTransaction listenForSatisfiedMilestone:withBlock:]( self,  "listenForSatisfiedMilestone:withBlock:",  @"Kiosk Animation Completed",  v19);
    -[UIViewPropertyAnimator startAnimation](self->_springAnimator, "startAnimation");
    -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");
    objc_destroyWeak(&v35);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&from);
    id v18 = v30;
  }

  else
  {
    v29 = (void *)((uint64_t (*)(void *))v17[2])(v17);
    sub_100161A30(v29);
    ((void (*)(void *))v19[2])(v19);
  }

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);
}

- (void)_willInterruptWithReason:(id)a3
{
  springAnimator = self->_springAnimator;
  id v5 = a3;
  -[UIViewPropertyAnimator stopAnimation:](springAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](self->_alphaAnimator, "stopAnimation:", 1LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBScreenSaverFromKioskPresentationAnimationTransaction;
  -[_PBScreenSaverFromKioskPresentationAnimationTransaction _willInterruptWithReason:]( &v6,  "_willInterruptWithReason:",  v5);
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