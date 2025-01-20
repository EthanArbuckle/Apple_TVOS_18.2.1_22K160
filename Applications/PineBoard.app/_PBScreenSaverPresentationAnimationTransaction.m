@interface _PBScreenSaverPresentationAnimationTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (UIViewPropertyAnimator)alphaAnimator;
- (UIViewPropertyAnimator)springAnimator;
- (void)_begin;
- (void)_didComplete;
- (void)_willInterruptWithReason:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setScreenSaverViewController:(id)a3;
@end

@implementation _PBScreenSaverPresentationAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v47.receiver = self;
  v47.super_class = (Class)&OBJC_CLASS____PBScreenSaverPresentationAnimationTransaction;
  -[_PBScreenSaverPresentationAnimationTransaction _begin](&v47, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_PBScreenSaverPresentationAnimationTransaction screenSaverViewController]( self,  "screenSaverViewController"));
  [v3 screenSaverTransitionUpdatedAcceptEvents:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowForLayoutLevel:1]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rootViewController]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 layer]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[CAMeshTransform tvsui_meshTransformWithEdges:mirrorPercentage:]( &OBJC_CLASS___CAMeshTransform,  "tvsui_meshTransformWithEdges:mirrorPercentage:",  15LL,  0.3));
  [v8 setMeshTransform:v9];

  [v5 setHidden:0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 windowForLayoutLevel:6]);

  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 rootViewController]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 view]);

  CGAffineTransformMakeScale(&v46, 1.3, 1.3);
  [v13 setTransform:&v46];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_10016099C;
  v43[3] = &unk_1003CFEB8;
  id v14 = v13;
  id v44 = v14;
  id v15 = v7;
  id v45 = v15;
  v16 = objc_retainBlock(v43);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100160A08;
  v41[3] = &unk_1003CFF08;
  id v17 = v15;
  id v42 = v17;
  v18 = objc_retainBlock(v41);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472LL;
  v38[2] = sub_100160A24;
  v38[3] = &unk_1003CFEB8;
  id v32 = v5;
  id v39 = v32;
  id v19 = v17;
  id v40 = v19;
  v20 = objc_retainBlock(v38);
  if (self->_animated)
  {
    id v30 = v19;
    v31 = v11;
    objc_initWeak(&location, self);
    v21 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  100.0,  25.0,  0.0,  0.0);
    v22 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v21,  0.5);
    springAnimator = self->_springAnimator;
    self->_springAnimator = v22;

    -[UIViewPropertyAnimator addAnimations:](self->_springAnimator, "addAnimations:", v16);
    v29 = v21;
    v24 = self->_springAnimator;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472LL;
    v35[2] = sub_100160A68;
    v35[3] = &unk_1003D8808;
    objc_copyWeak(&v36, &location);
    -[UIViewPropertyAnimator addCompletion:](v24, "addCompletion:", v35);
    -[_PBScreenSaverPresentationAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Spring Animation Complete");
    v25 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.4,  1.0);
    v26 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v25,  0.25);
    alphaAnimator = self->_alphaAnimator;
    self->_alphaAnimator = v26;

    -[UIViewPropertyAnimator addAnimations:](self->_alphaAnimator, "addAnimations:", v18);
    v28 = self->_alphaAnimator;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472LL;
    v33[2] = sub_100160AEC;
    v33[3] = &unk_1003D8808;
    objc_copyWeak(&v34, &location);
    -[UIViewPropertyAnimator addCompletion:](v28, "addCompletion:", v33);
    -[_PBScreenSaverPresentationAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Alpha Animation Complete");
    -[_PBScreenSaverPresentationAnimationTransaction listenForSatisfiedMilestone:withBlock:]( self,  "listenForSatisfiedMilestone:withBlock:",  @"Alpha Animation Complete",  v20);
    -[UIViewPropertyAnimator startAnimation](self->_springAnimator, "startAnimation");
    -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    v11 = v31;
    id v19 = v30;
  }

  else
  {
    ((void (*)(void *))v16[2])(v16);
    ((void (*)(void *))v18[2])(v18);
    ((void (*)(void *))v20[2])(v20);
  }
}

- (void)_willInterruptWithReason:(id)a3
{
  springAnimator = self->_springAnimator;
  id v5 = a3;
  -[UIViewPropertyAnimator stopAnimation:](springAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](self->_alphaAnimator, "stopAnimation:", 1LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBScreenSaverPresentationAnimationTransaction;
  -[_PBScreenSaverPresentationAnimationTransaction _willInterruptWithReason:](&v6, "_willInterruptWithReason:", v5);
}

- (void)_didComplete
{
  if ((-[_PBScreenSaverPresentationAnimationTransaction isInterrupted](self, "isInterrupted") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 windowForLayoutLevel:1]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

    __int128 v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v9[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v9[1] = v7;
    v9[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v6 setTransform:v9];
    [v6 setAlpha:1.0];
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____PBScreenSaverPresentationAnimationTransaction;
  -[_PBScreenSaverPresentationAnimationTransaction _didComplete](&v8, "_didComplete");
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