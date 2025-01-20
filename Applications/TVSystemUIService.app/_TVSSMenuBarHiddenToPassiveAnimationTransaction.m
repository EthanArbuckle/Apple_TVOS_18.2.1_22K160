@interface _TVSSMenuBarHiddenToPassiveAnimationTransaction
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarHiddenToPassiveAnimationTransaction

- (void)_begin
{
  v40 = self;
  SEL v39 = a2;
  v38.receiver = self;
  v38.super_class = (Class)&OBJC_CLASS____TVSSMenuBarHiddenToPassiveAnimationTransaction;
  -[_TVSSMenuBarHiddenToPassiveAnimationTransaction _begin](&v38, "_begin");
  v4 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v5 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v2 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v4, "initWithDuration:timingParameters:", 0.3);
  translateAndFadeAnimator = v40->_translateAndFadeAnimator;
  v40->_translateAndFadeAnimator = v2;

  v6 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v40, "animationContext");
  id v37 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v6, "pillContentViewProvider");

  [v37 setMode:2];
  id v36 = [v37 contentView];
  v30 = _NSConcreteStackBlock;
  int v31 = -1073741824;
  int v32 = 0;
  v33 = sub_10011D1A4;
  v34 = &unk_1001B5A60;
  id v35 = v36;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v30);
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v40, "animationContext");
  id v29 = -[TVSSMenuBarAnimationContext pillView](v7, "pillView");

  objc_msgSend(v29, "setContentView:withTransition:", v36);
  [v29 setContentStylingHidden:0];
  v23 = _NSConcreteStackBlock;
  int v24 = -1073741824;
  int v25 = 0;
  v26 = sub_10011D1D8;
  v27 = &unk_1001B5A60;
  id v28 = v29;
  +[UIView performWithoutAnimation:](&OBJC_CLASS___UIView, "performWithoutAnimation:", &v23);
  [v36 setContentLayoutMode:0];
  v8 = v40->_translateAndFadeAnimator;
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_10011D224;
  v21 = &unk_1001B5A60;
  id v22 = v29;
  -[UIViewPropertyAnimator addAnimations:](v8, "addAnimations:", &v17);
  objc_initWeak(&location, v40);
  v9 = v40->_translateAndFadeAnimator;
  v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  v13 = sub_10011D2C0;
  v14 = &unk_1001B5A88;
  objc_copyWeak(&v15, &location);
  -[UIViewPropertyAnimator addCompletion:](v9, "addCompletion:", &v10);
  -[_TVSSMenuBarHiddenToPassiveAnimationTransaction addMilestone:]( v40,  "addMilestone:",  @"_TVSSMenuBarHiddenToPassiveAnimationComplete");
  -[UIViewPropertyAnimator startAnimation](v40->_translateAndFadeAnimator, "startAnimation");
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v35, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v37, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_translateAndFadeAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarHiddenToPassiveAnimationTransaction;
  -[_TVSSMenuBarHiddenToPassiveAnimationTransaction _willInterruptWithReason:]( &v3,  "_willInterruptWithReason:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_translateAndFadeAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarHiddenToPassiveAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end