@interface _PBScreenSaverDismissalAnimationTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (BOOL)shouldApplyStartValues;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (UIViewPropertyAnimator)alphaAnimator;
- (UIViewPropertyAnimator)springAnimator;
- (void)_begin;
- (void)setAnimated:(BOOL)a3;
- (void)setScreenSaverViewController:(id)a3;
- (void)setShouldApplyStartValues:(BOOL)a3;
@end

@implementation _PBScreenSaverDismissalAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (void)_begin
{
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS____PBScreenSaverDismissalAnimationTransaction;
  -[_PBScreenSaverDismissalAnimationTransaction _begin](&v59, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 windowForLayoutLevel:1]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

  v40 = v4;
  [v4 setHidden:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 windowForLayoutLevel:6]);

  v39 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootViewController]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 windowForLayoutLevel:5]);

  v38 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 rootViewController]);
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);

  if (self->_shouldApplyStartValues)
  {
    CGAffineTransformMakeScale(&v58, 0.7, 0.7);
    [v6 setTransform:&v58];
    [v6 setAlpha:0.0];
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 layer]);
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[CAMeshTransform tvsui_meshTransformWithEdges:mirrorPercentage:]( &OBJC_CLASS___CAMeshTransform,  "tvsui_meshTransformWithEdges:mirrorPercentage:",  15LL,  0.3));
    [v15 setMeshTransform:v16];

    [v14 setAlpha:0.0];
  }

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_100129594;
  v55[3] = &unk_1003CFEB8;
  id v17 = v6;
  id v56 = v17;
  id v18 = v10;
  id v57 = v18;
  v19 = objc_retainBlock(v55);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100129600;
  v52[3] = &unk_1003CFEB8;
  id v20 = v17;
  id v53 = v20;
  id v21 = v14;
  id v54 = v21;
  v22 = objc_retainBlock(v52);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472LL;
  v51[2] = sub_100129658;
  v51[3] = &unk_1003CFF08;
  v51[4] = self;
  v23 = objc_retainBlock(v51);
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472LL;
  v49[2] = sub_10012968C;
  v49[3] = &unk_1003CFF08;
  id v24 = v20;
  id v50 = v24;
  v25 = objc_retainBlock(v49);
  if (self->_animated)
  {
    v37 = v19;
    objc_initWeak(&location, self);
    +[UIWindow _synchronizeDrawing](&OBJC_CLASS___UIWindow, "_synchronizeDrawing");
    id v36 = v21;
    v26 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  100.0,  25.0,  0.0,  0.0);
    v27 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v26,  0.5);
    springAnimator = self->_springAnimator;
    self->_springAnimator = v27;

    -[UIViewPropertyAnimator addAnimations:](self->_springAnimator, "addAnimations:", v19);
    v35 = v26;
    v29 = self->_springAnimator;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472LL;
    v45[2] = sub_1001296C0;
    v45[3] = &unk_1003D87E0;
    v46 = v25;
    objc_copyWeak(&v47, &location);
    -[UIViewPropertyAnimator addCompletion:](v29, "addCompletion:", v45);
    -[_PBScreenSaverDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Spring Animation Complete");
    v30 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.33,  0.0,  0.67,  1.0);
    v31 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v30,  0.33);
    alphaAnimator = self->_alphaAnimator;
    self->_alphaAnimator = v31;

    -[UIViewPropertyAnimator addAnimations:](self->_alphaAnimator, "addAnimations:", v22);
    v33 = self->_alphaAnimator;
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472LL;
    v43[2] = sub_100129730;
    v43[3] = &unk_1003D8808;
    objc_copyWeak(&v44, &location);
    -[UIViewPropertyAnimator addCompletion:](v33, "addCompletion:", v43);
    -[_PBScreenSaverDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Alpha Animation Complete");
    dispatch_time_t v34 = dispatch_time(0LL, 250000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10012978C;
    block[3] = &unk_1003D2560;
    block[4] = self;
    v42 = v23;
    dispatch_after(v34, &_dispatch_main_q, block);
    -[_PBScreenSaverDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Event consuming timer complete");
    -[UIViewPropertyAnimator startAnimation](self->_springAnimator, "startAnimation");
    -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");

    objc_destroyWeak(&v44);
    objc_destroyWeak(&v47);

    objc_destroyWeak(&location);
    v19 = v37;
    id v21 = v36;
  }

  else
  {
    ((void (*)(void *))v19[2])(v19);
    ((void (*)(void *))v22[2])(v22);
    ((void (*)(void *))v23[2])(v23);
    ((void (*)(void *))v25[2])(v25);
  }
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
}

@end