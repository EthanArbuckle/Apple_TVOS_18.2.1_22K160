@interface _PBScreenSaverReducedMotionPresentationAnimationTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (UIViewPropertyAnimator)alphaAnimator;
- (void)_begin;
- (void)_didComplete;
- (void)_willInterruptWithReason:(id)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setScreenSaverViewController:(id)a3;
@end

@implementation _PBScreenSaverReducedMotionPresentationAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS____PBScreenSaverReducedMotionPresentationAnimationTransaction;
  -[_PBScreenSaverReducedMotionPresentationAnimationTransaction _begin](&v30, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[_PBScreenSaverReducedMotionPresentationAnimationTransaction screenSaverViewController]( self,  "screenSaverViewController"));
  [v3 screenSaverTransitionUpdatedAcceptEvents:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 windowForLayoutLevel:1]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rootViewController]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 view]);

  [v5 setHidden:0];
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 windowForLayoutLevel:5]);

  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 rootViewController]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 view]);

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_1001610B4;
  v27[3] = &unk_1003CFEB8;
  id v12 = v7;
  id v28 = v12;
  id v13 = v11;
  id v29 = v13;
  v14 = objc_retainBlock(v27);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_1001610E8;
  v25[3] = &unk_1003CFF08;
  id v15 = v5;
  id v26 = v15;
  v16 = objc_retainBlock(v25);
  if (self->_animated)
  {
    v21 = v9;
    objc_initWeak(&location, self);
    v17 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.4,  1.0);
    v18 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v17,  0.4);
    alphaAnimator = self->_alphaAnimator;
    self->_alphaAnimator = v18;

    -[UIViewPropertyAnimator addAnimations:](self->_alphaAnimator, "addAnimations:", v14);
    v20 = self->_alphaAnimator;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100161104;
    v22[3] = &unk_1003D8808;
    objc_copyWeak(&v23, &location);
    -[UIViewPropertyAnimator addCompletion:](v20, "addCompletion:", v22);
    -[_PBScreenSaverReducedMotionPresentationAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Alpha Animation Complete");
    v9 = v21;
    -[_PBScreenSaverReducedMotionPresentationAnimationTransaction listenForSatisfiedMilestone:withBlock:]( self,  "listenForSatisfiedMilestone:withBlock:",  @"Alpha Animation Complete",  v16);
    -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");
    objc_destroyWeak(&v23);

    objc_destroyWeak(&location);
  }

  else
  {
    ((void (*)(void *))v14[2])(v14);
    ((void (*)(void *))v16[2])(v16);
  }
}

- (void)_willInterruptWithReason:(id)a3
{
  alphaAnimator = self->_alphaAnimator;
  id v5 = a3;
  -[UIViewPropertyAnimator stopAnimation:](alphaAnimator, "stopAnimation:", 1LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____PBScreenSaverReducedMotionPresentationAnimationTransaction;
  -[_PBScreenSaverReducedMotionPresentationAnimationTransaction _willInterruptWithReason:]( &v6,  "_willInterruptWithReason:",  v5);
}

- (void)_didComplete
{
  if ((-[_PBScreenSaverReducedMotionPresentationAnimationTransaction isInterrupted]( self,  "isInterrupted") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 windowForLayoutLevel:1]);

    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

    [v6 setAlpha:1.0];
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PBScreenSaverReducedMotionPresentationAnimationTransaction;
  -[_PBScreenSaverReducedMotionPresentationAnimationTransaction _didComplete](&v7, "_didComplete");
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

- (UIViewPropertyAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void).cxx_destruct
{
}

@end