@interface _PBScreenSaverReducedMotionDismissalAnimationTransaction
- (BOOL)_canBeInterrupted;
- (BOOL)animated;
- (BOOL)shouldApplyStartValues;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (UIViewPropertyAnimator)alphaAnimator;
- (void)_begin;
- (void)setAnimated:(BOOL)a3;
- (void)setScreenSaverViewController:(id)a3;
- (void)setShouldApplyStartValues:(BOOL)a3;
@end

@implementation _PBScreenSaverReducedMotionDismissalAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (void)_begin
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS____PBScreenSaverReducedMotionDismissalAnimationTransaction;
  -[_PBScreenSaverReducedMotionDismissalAnimationTransaction _begin](&v33, "_begin");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 windowForLayoutLevel:1]);

  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 rootViewController]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 view]);

  [v4 setHidden:0];
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 windowForLayoutLevel:5]);

  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootViewController]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 view]);

  __int128 v11 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)location = *(_OWORD *)&CGAffineTransformIdentity.a;
  __int128 v31 = v11;
  __int128 v32 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v6 setTransform:location];
  if (self->_shouldApplyStartValues)
  {
    [v6 setAlpha:0.0];
    [v10 setAlpha:0.0];
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = sub_100129C58;
  v27[3] = &unk_1003CFEB8;
  id v12 = v6;
  id v28 = v12;
  id v13 = v10;
  id v29 = v13;
  v14 = objc_retainBlock(v27);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472LL;
  v26[2] = sub_100129CB0;
  v26[3] = &unk_1003CFF08;
  v26[4] = self;
  v15 = objc_retainBlock(v26);
  if (self->_animated)
  {
    objc_initWeak(location, self);
    +[UIWindow _synchronizeDrawing](&OBJC_CLASS___UIWindow, "_synchronizeDrawing");
    v21 = v4;
    v16 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.4,  1.0);
    v17 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v16,  0.4);
    alphaAnimator = self->_alphaAnimator;
    self->_alphaAnimator = v17;

    -[UIViewPropertyAnimator addAnimations:](self->_alphaAnimator, "addAnimations:", v14);
    v19 = self->_alphaAnimator;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100129CE4;
    v24[3] = &unk_1003D8808;
    objc_copyWeak(&v25, location);
    -[UIViewPropertyAnimator addCompletion:](v19, "addCompletion:", v24);
    -[_PBScreenSaverReducedMotionDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Alpha Animation Complete");
    dispatch_time_t v20 = dispatch_time(0LL, 250000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100129D40;
    block[3] = &unk_1003D2560;
    block[4] = self;
    v23 = v15;
    dispatch_after(v20, &_dispatch_main_q, block);
    -[_PBScreenSaverReducedMotionDismissalAnimationTransaction addMilestone:]( self,  "addMilestone:",  @"Event consuming timer complete");
    -[UIViewPropertyAnimator startAnimation](self->_alphaAnimator, "startAnimation");

    objc_destroyWeak(&v25);
    objc_destroyWeak(location);
    v4 = v21;
  }

  else
  {
    ((void (*)(void *))v14[2])(v14);
    ((void (*)(void *))v15[2])(v15);
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

- (UIViewPropertyAnimator)alphaAnimator
{
  return self->_alphaAnimator;
}

- (void).cxx_destruct
{
}

@end