@interface _TVSSMenuBarPassiveToInteractiveAnimationTransaction
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarPassiveToInteractiveAnimationTransaction

- (void)_begin
{
  v35 = self;
  SEL v34 = a2;
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPassiveToInteractiveAnimationTransaction;
  -[_TVSSMenuBarPassiveToInteractiveAnimationTransaction _begin](&v33, "_begin");
  v12 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v13 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v2 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v12, "initWithDuration:timingParameters:", 0.3);
  propertyAnimator = v35->_propertyAnimator;
  v35->_propertyAnimator = v2;

  v4 = (TVSPAnimator *) +[TVSPAnimator manualStartAnimatorWithPropertyAnimator:]( &OBJC_CLASS___TVSPAnimator,  "manualStartAnimatorWithPropertyAnimator:",  v35->_propertyAnimator);
  animator = v35->_animator;
  v35->_animator = v4;

  id v32 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v35, "animationContext");
  id v31 = [v32 pillContentViewProvider];
  id v30 = [v31 contentView];
  id v29 = [v32 pillView];
  id v6 = [v30 superview];
  BOOL v14 = v6 != 0LL;

  if (!v14) {
    [v30 layoutIfNeeded];
  }
  [v29 setContentView:v30 withTransition:0];
  id v9 = [v29 superview];
  [v9 layoutIfNeeded];

  [v31 setMode:3 animator:v35->_animator];
  v10 = v35->_animator;
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_10003D34C;
  v27 = &unk_1001B5A60;
  id v28 = v29;
  -[TVSPAnimator addAnimation:](v10, "addAnimation:", &v23);
  objc_initWeak(&location, v35);
  v11 = v35->_propertyAnimator;
  v16 = _NSConcreteStackBlock;
  int v17 = -1073741824;
  int v18 = 0;
  v19 = sub_10003D3B0;
  v20 = &unk_1001B5A88;
  objc_copyWeak(&v21, &location);
  -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", &v16);
  -[_TVSSMenuBarPassiveToInteractiveAnimationTransaction addMilestone:]( v35,  "addMilestone:",  @"_TVSSMenuBarPassiveToInteractiveAnimationComplete");
  v8 = objc_alloc(&OBJC_CLASS____TVSSMenuBarPresentPanelTransaction);
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v35, "animationContext");
  id v15 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v8,  "initWithAnimationContext:animated:",  v7,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v35, "animated"));

  -[_TVSSMenuBarPassiveToInteractiveAnimationTransaction addChildTransaction:withSchedulingPolicy:]( v35,  "addChildTransaction:withSchedulingPolicy:",  v15,  0LL);
  -[TVSPAnimator startAnimations](v35->_animator, "startAnimations");
  objc_storeStrong(&v15, 0LL);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&v32, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_propertyAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPassiveToInteractiveAnimationTransaction;
  -[_TVSSMenuBarPassiveToInteractiveAnimationTransaction _willInterruptWithReason:]( &v3,  "_willInterruptWithReason:",  location[0]);
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
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPassiveToInteractiveAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end