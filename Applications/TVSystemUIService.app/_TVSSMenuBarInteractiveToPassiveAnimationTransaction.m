@interface _TVSSMenuBarInteractiveToPassiveAnimationTransaction
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarInteractiveToPassiveAnimationTransaction

- (void)_begin
{
  v34 = self;
  SEL v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS____TVSSMenuBarInteractiveToPassiveAnimationTransaction;
  -[_TVSSMenuBarInteractiveToPassiveAnimationTransaction _begin](&v32, "_begin");
  v11 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v12 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v2 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v11, "initWithDuration:timingParameters:", 0.3);
  propertyAnimator = v34->_propertyAnimator;
  v34->_propertyAnimator = v2;

  v4 = (TVSPAnimator *) +[TVSPAnimator manualStartAnimatorWithPropertyAnimator:]( &OBJC_CLASS___TVSPAnimator,  "manualStartAnimatorWithPropertyAnimator:",  v34->_propertyAnimator);
  animator = v34->_animator;
  v34->_animator = v4;

  id v31 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v34, "animationContext");
  id v30 = [v31 pillContentViewProvider];
  id v29 = [v30 contentView];
  id v6 = [v29 superview];
  BOOL v13 = v6 != 0LL;

  if (!v13) {
    [v29 layoutIfNeeded];
  }
  id v28 = [v31 pillView];
  [v28 setContentView:v29 withTransition:0];
  [v30 setMode:2 animator:v34->_animator];
  v9 = v34->_animator;
  v22 = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  v25 = sub_10003D9E4;
  v26 = &unk_1001B5A60;
  id v27 = v28;
  -[TVSPAnimator addAnimation:](v9, "addAnimation:", &v22);
  objc_initWeak(&location, v34);
  v10 = v34->_animator;
  v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  v18 = sub_10003DA30;
  v19 = &unk_1001B75D0;
  objc_copyWeak(&v20, &location);
  -[TVSPAnimator addCompletion:](v10, "addCompletion:", &v15);
  -[_TVSSMenuBarInteractiveToPassiveAnimationTransaction addMilestone:]( v34,  "addMilestone:",  @"_TVSSMenuBarInteractiveToPassiveAnimationComplete");
  v8 = objc_alloc(&OBJC_CLASS____TVSSMenuBarDismissPanelTransaction);
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v34, "animationContext");
  id v14 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v8,  "initWithAnimationContext:animated:",  v7,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v34, "animated"));

  -[_TVSSMenuBarInteractiveToPassiveAnimationTransaction addChildTransaction:withSchedulingPolicy:]( v34,  "addChildTransaction:withSchedulingPolicy:",  v14,  0LL);
  -[TVSPAnimator startAnimations](v34->_animator, "startAnimations");
  objc_storeStrong(&v14, 0LL);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_propertyAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarInteractiveToPassiveAnimationTransaction;
  -[_TVSSMenuBarInteractiveToPassiveAnimationTransaction _willInterruptWithReason:]( &v3,  "_willInterruptWithReason:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_propertyAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarInteractiveToPassiveAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end