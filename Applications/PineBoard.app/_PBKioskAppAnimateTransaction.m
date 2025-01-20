@interface _PBKioskAppAnimateTransaction
- ($2A030BD80B7F288DDA25BD4C9E9B0355)context;
- (BOOL)_canBeInterrupted;
- (PBAppCrossFadeAnimationTransaction)crossFadeTransaction;
- (UIViewPropertyAnimator)fadePropertyAnimator;
- (UIViewPropertyAnimator)scalePropertyAnimator;
- (_PBKioskAppAnimateTransaction)initWithAnimationContext:(id *)a3;
- (id)_animatingView;
- (void)_begin;
- (void)_didComplete;
- (void)_startCoordinatedAnimation;
- (void)_startFadeAnimation;
- (void)_startReduceMotionAnimation;
- (void)_startScaleAnimation;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _PBKioskAppAnimateTransaction

- (_PBKioskAppAnimateTransaction)initWithAnimationContext:(id *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PBKioskAppAnimateTransaction;
  v4 = -[_PBKioskAppAnimateTransaction init](&v7, "init");
  v5 = v4;
  if (v4) {
    sub_1001CFF94((uint64_t)&v4->_context, (uint64_t)a3);
  }
  sub_1001CFB40(&a3->var0);
  return v5;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____PBKioskAppAnimateTransaction;
  -[_PBKioskAppAnimateTransaction _begin](&v13, "_begin");
  if (-[FBScene contentState](self->_context.defaultKioskScene, "contentState") == (id)2)
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    id v4 = sub_100083CA8();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (IsReduceMotionEnabled)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Begin kiosk<->app animation in reduced motion mode",  buf,  2u);
      }

      -[_PBKioskAppAnimateTransaction _startReduceMotionAnimation](self, "_startReduceMotionAnimation");
    }

    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Begin kiosk<->app animation", buf, 2u);
      }

      -[_PBKioskAppAnimateTransaction _startCoordinatedAnimation](self, "_startCoordinatedAnimation");
    }
  }

  else
  {
    id v7 = sub_100083CA8();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_10028FB70(v8);
    }

    sub_1001CFAE0((uint64_t)v11, (uint64_t)&self->_context);
    v9 = sub_1001CFC40(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[_PBKioskAppAnimateTransaction addChildTransaction:](self, "addChildTransaction:", v10);
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Interrupted kiosk<->app animation with reason %{public}@",  buf,  0xCu);
  }

  -[UIViewPropertyAnimator stopAnimation:](self->_scalePropertyAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](self->_fadePropertyAnimator, "stopAnimation:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PBKioskAppAnimateTransaction;
  -[_PBKioskAppAnimateTransaction _willInterruptWithReason:](&v7, "_willInterruptWithReason:", v4);
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
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Failed kiosk<->app animation with reason %{public}@",  buf,  0xCu);
  }

  -[UIViewPropertyAnimator stopAnimation:](self->_scalePropertyAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](self->_fadePropertyAnimator, "stopAnimation:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS____PBKioskAppAnimateTransaction;
  -[_PBKioskAppAnimateTransaction _willFailWithReason:](&v7, "_willFailWithReason:", v4);
}

- (void)_didComplete
{
  id v3 = sub_100083CA8();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Completed kiosk<->app animation", buf, 2u);
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____PBKioskAppAnimateTransaction;
  -[_PBKioskAppAnimateTransaction _didComplete](&v5, "_didComplete");
}

- (id)_animatingView
{
  uint64_t v2 = 16LL;
  if (!self->_context.isLaunchingFromKiosk) {
    uint64_t v2 = 8LL;
  }
  return (id)objc_claimAutoreleasedReturnValue( [*(id *)((char *)&self->_context.sceneLayoutViewController + v2) view]);
}

- (void)_startReduceMotionAnimation
{
  id v3 = -[PBAppCrossFadeAnimationTransaction initWithSceneLayoutViewController:fromViewController:toViewController:]( objc_alloc(&OBJC_CLASS___PBAppCrossFadeAnimationTransaction),  "initWithSceneLayoutViewController:fromViewController:toViewController:",  self->_context.sceneLayoutViewController,  self->_context.fromViewController,  self->_context.toViewController);
  crossFadeTransaction = self->_crossFadeTransaction;
  self->_crossFadeTransaction = v3;

  -[_PBKioskAppAnimateTransaction addChildTransaction:](self, "addChildTransaction:", self->_crossFadeTransaction);
}

- (void)_startCoordinatedAnimation
{
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001D061C;
  v15[3] = &unk_1003D8830;
  objc_copyWeak(&v16, &location);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  v15));
  id v4 = [[PBSPerformKioskAnimationAction alloc] initWithInfo:0 responder:v3];
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScene _synchronizedDrawingFence](&OBJC_CLASS___UIScene, "_synchronizedDrawingFence"));
  defaultKioskScene = self->_context.defaultKioskScene;
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  v11 = sub_1001D06EC;
  v12 = &unk_1003D8858;
  id v7 = v5;
  id v13 = v7;
  id v8 = v4;
  id v14 = v8;
  -[FBScene updateSettingsWithTransitionBlock:](defaultKioskScene, "updateSettingsWithTransitionBlock:", &v9);
  -[_PBKioskAppAnimateTransaction _startScaleAnimation](self, "_startScaleAnimation", v9, v10, v11, v12);
  -[_PBKioskAppAnimateTransaction _startFadeAnimation](self, "_startFadeAnimation");
  if (self->_context.shouldPlaySound)
  {
    if (self->_context.isLaunchingFromKiosk) {
      sub_1001C8F14(0LL);
    }
    else {
      sub_1001C906C(0LL);
    }
  }

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_startScaleAnimation
{
  p_context = &self->_context;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutViewController view](self->_context.sceneLayoutViewController, "view"));
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double Width = CGRectGetWidth(p_context->appIconFrame);
  v44.origin.x = v6;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  CGFloat v14 = Width / CGRectGetWidth(v44);
  double Height = CGRectGetHeight(p_context->appIconFrame);
  v45.origin.x = v6;
  v45.origin.y = v8;
  v45.size.width = v10;
  v45.size.height = v12;
  CGFloat v16 = Height / CGRectGetHeight(v45);
  CGAffineTransformMakeScale(&v43, v14, v16);
  TVSUIAppIconAttributesForVariant(v41, 0LL);
  double v17 = *(double *)&v41[4];
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[_PBKioskAppAnimateTransaction _animatingView](self, "_animatingView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 layer]);
  [v19 setMasksToBounds:1];
  double v20 = v17 / ((v14 + v16) * 0.5);

  if (!p_context->isLaunchingFromKiosk) {
    goto LABEL_4;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](p_context->toViewController, "view"));
  objc_msgSend( v21,  "setCenter:",  UIRectGetCenter( v21,  p_context->appIconFrame.origin.x,  p_context->appIconFrame.origin.y,  p_context->appIconFrame.size.width,  p_context->appIconFrame.size.height));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](p_context->toViewController, "view"));
  CGAffineTransform location = v43;
  [v22 setTransform:&location];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](p_context->toViewController, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 layer]);
  [v24 setCornerCurve:v42];

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](p_context->toViewController, "view"));
  v26 = (void *)objc_claimAutoreleasedReturnValue([v25 layer]);
  [v26 setCornerRadius:v20];

  if (p_context->isLaunchingFromKiosk)
  {
    v27 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
    double v28 = 30.0;
  }

  else
  {
LABEL_4:
    v27 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
    double v28 = 21.0;
  }

  v29 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v27,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  150.0,  v28,  0.0,  0.0);
  v30 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v29,  0.0);
  scalePropertyAnimator = self->_scalePropertyAnimator;
  self->_scalePropertyAnimator = v30;

  objc_initWeak((id *)&location, self);
  v32 = self->_scalePropertyAnimator;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472LL;
  v36[2] = sub_1001D0AEC;
  v36[3] = &unk_1003DBF58;
  objc_copyWeak(&v37, (id *)&location);
  CGAffineTransform v38 = v43;
  double v39 = v20;
  -[UIViewPropertyAnimator addAnimations:](v32, "addAnimations:", v36);
  v33 = self->_scalePropertyAnimator;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472LL;
  v34[2] = sub_1001D0BF8;
  v34[3] = &unk_1003D8808;
  objc_copyWeak(&v35, (id *)&location);
  -[UIViewPropertyAnimator addCompletion:](v33, "addCompletion:", v34);
  -[_PBKioskAppAnimateTransaction addMilestone:](self, "addMilestone:", @"PBKioskAppScaleAnimationMilestone");
  -[UIViewPropertyAnimator startAnimation](self->_scalePropertyAnimator, "startAnimation");
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)&location);
}

- (void)_startFadeAnimation
{
  p_context = &self->_context;
  if (self->_context.isLaunchingFromKiosk)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
    [v4 setAlpha:0.0];
  }

  double v5 = 0.25;
  CGFloat v6 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.25,  1.0);
  if (p_context->isLaunchingFromKiosk) {
    double v5 = 0.17;
  }
  double v7 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v6,  v5);
  fadePropertyAnimator = self->_fadePropertyAnimator;
  self->_fadePropertyAnimator = v7;

  objc_initWeak(&location, self);
  double v9 = self->_fadePropertyAnimator;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1001D0E60;
  v13[3] = &unk_1003D0890;
  objc_copyWeak(&v14, &location);
  -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", v13);
  CGFloat v10 = self->_fadePropertyAnimator;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001D0ED0;
  v11[3] = &unk_1003D8808;
  objc_copyWeak(&v12, &location);
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", v11);
  -[_PBKioskAppAnimateTransaction addMilestone:](self, "addMilestone:", @"PBKioskAppFadeAnimationMilestone");
  -[UIViewPropertyAnimator startAnimation](self->_fadePropertyAnimator, "startAnimation");
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- ($2A030BD80B7F288DDA25BD4C9E9B0355)context
{
  return result;
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