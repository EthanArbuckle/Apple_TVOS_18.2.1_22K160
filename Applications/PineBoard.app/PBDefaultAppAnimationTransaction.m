@interface PBDefaultAppAnimationTransaction
- ($137AD2D114688D2628E2522F2DC658D4)context;
- (BOOL)_canBeInterrupted;
- (PBAppCrossFadeAnimationTransaction)crossFadeTransaction;
- (PBDefaultAppAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5 isResigning:(BOOL)a6;
- (UIViewPropertyAnimator)fadePropertyAnimator;
- (UIViewPropertyAnimator)scalePropertyAnimator;
- (void)_begin;
- (void)_didComplete;
- (void)_startCoordinatedAnimation;
- (void)_startFadeAnimation;
- (void)_startReduceMotionAnimation;
- (void)_startScaleAnimation;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation PBDefaultAppAnimationTransaction

- (PBDefaultAppAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5 isResigning:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___PBDefaultAppAnimationTransaction;
  v14 = -[PBDefaultAppAnimationTransaction init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_context.sceneLayoutViewController, a3);
    objc_storeStrong((id *)&v15->_context.fromViewController, a4);
    objc_storeStrong((id *)&v15->_context.toViewController, a5);
    v15->_context.isResigning = a6;
  }

  return v15;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBDefaultAppAnimationTransaction;
  -[PBDefaultAppAnimationTransaction _begin](&v8, "_begin");
  if (self->_context.fromViewController != self->_context.toViewController)
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    id v4 = sub_100083CA8();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (IsReduceMotionEnabled)
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Begin default app animation in reduced motion mode",  v7,  2u);
      }

      -[PBDefaultAppAnimationTransaction _startReduceMotionAnimation](self, "_startReduceMotionAnimation");
    }

    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Begin default app animation", v7, 2u);
      }

      -[PBDefaultAppAnimationTransaction _startCoordinatedAnimation](self, "_startCoordinatedAnimation");
    }
  }

- (void)_willInterruptWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083CA8();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Interrupted default app animation with reason %{public}@",  buf,  0xCu);
  }

  -[UIViewPropertyAnimator stopAnimation:](self->_scalePropertyAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](self->_fadePropertyAnimator, "stopAnimation:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBDefaultAppAnimationTransaction;
  -[PBDefaultAppAnimationTransaction _willInterruptWithReason:](&v7, "_willInterruptWithReason:", v4);
}

- (void)_willFailWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083CA8();
  BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Failed default app animation with reason %{public}@",  buf,  0xCu);
  }

  -[UIViewPropertyAnimator stopAnimation:](self->_scalePropertyAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](self->_fadePropertyAnimator, "stopAnimation:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBDefaultAppAnimationTransaction;
  -[PBDefaultAppAnimationTransaction _willFailWithReason:](&v7, "_willFailWithReason:", v4);
}

- (void)_didComplete
{
  id v3 = sub_100083CA8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Completed default app animation", buf, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);
  [v6 setMeshTransform:0];

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBDefaultAppAnimationTransaction;
  -[PBDefaultAppAnimationTransaction _didComplete](&v7, "_didComplete");
}

- (void)_startReduceMotionAnimation
{
  id v3 = -[PBAppCrossFadeAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:]( objc_alloc(&OBJC_CLASS___PBAppCrossFadeAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:",  self->_context.sceneLayoutViewController,  self->_context.fromViewController,  self->_context.toViewController);
  crossFadeTransaction = self->_crossFadeTransaction;
  self->_crossFadeTransaction = v3;

  -[PBDefaultAppAnimationTransaction addChildTransaction:](self, "addChildTransaction:", self->_crossFadeTransaction);
}

- (void)_startCoordinatedAnimation
{
  uint64_t v3 = 8LL;
  if (!self->_context.isResigning) {
    uint64_t v3 = 16LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_context.sceneLayoutViewController
                                                                    + v3), "view"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);

  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue( +[CAMeshTransform tvsui_meshTransformWithEdges:mirrorPercentage:]( &OBJC_CLASS___CAMeshTransform,  "tvsui_meshTransformWithEdges:mirrorPercentage:",  15LL,  0.3));
  [v5 setMeshTransform:v6];

  -[PBDefaultAppAnimationTransaction _startScaleAnimation](self, "_startScaleAnimation");
  -[PBDefaultAppAnimationTransaction _startFadeAnimation](self, "_startFadeAnimation");
}

- (void)_startScaleAnimation
{
  BOOL isResigning = self->_context.isResigning;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
  if (isResigning)
  {
    CGFloat v5 = 1.3;
    BOOL v6 = (CGAffineTransform *)v19;
    objc_super v7 = (CGAffineTransform *)v19;
  }

  else
  {
    CGFloat v5 = 0.7;
    BOOL v6 = &v18;
    objc_super v7 = &v18;
  }

  CGAffineTransformMakeScale(v7, v5, v5);
  [v4 setTransform:v6];

  objc_super v8 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( objc_alloc(&OBJC_CLASS___UISpringTimingParameters),  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  80.0,  20.0,  0.0,  0.0);
  id v9 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v8,  0.0);
  scalePropertyAnimator = self->_scalePropertyAnimator;
  self->_scalePropertyAnimator = v9;

  objc_initWeak(&location, self);
  id v11 = self->_scalePropertyAnimator;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001762B4;
  v15[3] = &unk_1003D0890;
  objc_copyWeak(&v16, &location);
  -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", v15);
  id v12 = self->_scalePropertyAnimator;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100176384;
  v13[3] = &unk_1003D8808;
  objc_copyWeak(&v14, &location);
  -[UIViewPropertyAnimator addCompletion:](v12, "addCompletion:", v13);
  -[PBDefaultAppAnimationTransaction addMilestone:](self, "addMilestone:", @"PBDefaultScaleAnimationMilestone");
  -[UIViewPropertyAnimator startAnimation](self->_scalePropertyAnimator, "startAnimation");
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_startFadeAnimation
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
  [v3 setAlpha:0.0];

  id v4 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.4,  1.0);
  CGFloat v5 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v4,  0.25);
  fadePropertyAnimator = self->_fadePropertyAnimator;
  self->_fadePropertyAnimator = v5;

  objc_initWeak(&location, self);
  objc_super v7 = self->_fadePropertyAnimator;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_100176578;
  v11[3] = &unk_1003D0890;
  objc_copyWeak(&v12, &location);
  -[UIViewPropertyAnimator addAnimations:](v7, "addAnimations:", v11);
  objc_super v8 = self->_fadePropertyAnimator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1001765F0;
  v9[3] = &unk_1003D8808;
  objc_copyWeak(&v10, &location);
  -[UIViewPropertyAnimator addCompletion:](v8, "addCompletion:", v9);
  -[PBDefaultAppAnimationTransaction addMilestone:](self, "addMilestone:", @"PBDefaultFadeAnimationMilestone");
  -[UIViewPropertyAnimator startAnimation](self->_fadePropertyAnimator, "startAnimation");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- ($137AD2D114688D2628E2522F2DC658D4)context
{
  return ($137AD2D114688D2628E2522F2DC658D4 *)sub_100176648((uint64_t)retstr, (uint64_t)&self->_context);
}

- (UIViewPropertyAnimator)scalePropertyAnimator
{
  return self->_scalePropertyAnimator;
}

- (UIViewPropertyAnimator)fadePropertyAnimator
{
  return self->_fadePropertyAnimator;
}

- (PBAppCrossFadeAnimationTransaction)crossFadeTransaction
{
  return self->_crossFadeTransaction;
}

- (void).cxx_destruct
{
}

@end