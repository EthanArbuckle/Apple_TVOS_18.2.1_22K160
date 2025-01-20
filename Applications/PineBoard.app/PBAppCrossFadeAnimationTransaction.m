@interface PBAppCrossFadeAnimationTransaction
- ($D1BD78C04396328640866C86DE8AF7CF)context;
- (BOOL)_canBeInterrupted;
- (PBAppCrossFadeAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5;
- (UIViewPropertyAnimator)fadePropertyAnimator;
- (void)_begin;
- (void)_startFadeAnimation;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation PBAppCrossFadeAnimationTransaction

- (PBAppCrossFadeAnimationTransaction)initWithSceneLayoutViewController:(id)a3 fromViewController:(id)a4 toViewController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBAppCrossFadeAnimationTransaction;
  v12 = -[PBAppCrossFadeAnimationTransaction init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context.sceneLayoutViewController, a3);
    objc_storeStrong((id *)&v13->_context.fromViewController, a4);
    objc_storeStrong((id *)&v13->_context.toViewController, a5);
  }

  return v13;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBAppCrossFadeAnimationTransaction;
  -[PBAppCrossFadeAnimationTransaction _begin](&v6, "_begin");
  if (self->_context.fromViewController != self->_context.toViewController)
  {
    id v3 = sub_100083CA8();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Begin cross fade app animation in reduced motion mode",  v5,  2u);
    }

    -[PBAppCrossFadeAnimationTransaction _startFadeAnimation](self, "_startFadeAnimation");
  }

- (void)_willInterruptWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083CA8();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Interrupted cross fade animation with reason %{public}@",  buf,  0xCu);
  }

  -[UIViewPropertyAnimator stopAnimation:](self->_fadePropertyAnimator, "stopAnimation:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBAppCrossFadeAnimationTransaction;
  -[PBAppCrossFadeAnimationTransaction _willInterruptWithReason:](&v7, "_willInterruptWithReason:", v4);
}

- (void)_willFailWithReason:(id)a3
{
  id v4 = a3;
  id v5 = sub_100083CA8();
  objc_super v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Failed cross fade animation with reason %{public}@",  buf,  0xCu);
  }

  -[UIViewPropertyAnimator stopAnimation:](self->_fadePropertyAnimator, "stopAnimation:", 1LL);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBAppCrossFadeAnimationTransaction;
  -[PBAppCrossFadeAnimationTransaction _willFailWithReason:](&v7, "_willFailWithReason:", v4);
}

- (void)_startFadeAnimation
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneLayoutElement view](self->_context.toViewController, "view"));
  [v3 setAlpha:0.0];

  id v4 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( objc_alloc(&OBJC_CLASS___UICubicTimingParameters),  "initWithControlPoint1:controlPoint2:",  0.25,  0.0,  0.4,  1.0);
  id v5 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v4,  0.4);
  fadePropertyAnimator = self->_fadePropertyAnimator;
  self->_fadePropertyAnimator = v5;

  objc_initWeak(&location, self);
  objc_super v7 = self->_fadePropertyAnimator;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1001784A0;
  v11[3] = &unk_1003D0890;
  objc_copyWeak(&v12, &location);
  -[UIViewPropertyAnimator addAnimations:](v7, "addAnimations:", v11);
  v8 = self->_fadePropertyAnimator;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100178518;
  v9[3] = &unk_1003D8808;
  objc_copyWeak(&v10, &location);
  -[UIViewPropertyAnimator addCompletion:](v8, "addCompletion:", v9);
  -[PBAppCrossFadeAnimationTransaction addMilestone:](self, "addMilestone:", @"PBAppCrossFadeAnimationMilestone");
  -[UIViewPropertyAnimator startAnimation](self->_fadePropertyAnimator, "startAnimation");
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- ($D1BD78C04396328640866C86DE8AF7CF)context
{
  return ($D1BD78C04396328640866C86DE8AF7CF *)sub_1001336E4(retstr, (id *)&self->_context.sceneLayoutViewController);
}

- (UIViewPropertyAnimator)fadePropertyAnimator
{
  return self->_fadePropertyAnimator;
}

- (void).cxx_destruct
{
}

@end