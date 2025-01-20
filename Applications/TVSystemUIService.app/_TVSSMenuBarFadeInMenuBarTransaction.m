@interface _TVSSMenuBarFadeInMenuBarTransaction
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarFadeInMenuBarTransaction

- (void)_begin
{
  v29 = self;
  SEL v28 = a2;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeInMenuBarTransaction;
  -[_TVSSMenuBarFadeInMenuBarTransaction _begin](&v27, "_begin");
  v4 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v5 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v2 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v4, "initWithDuration:timingParameters:", 0.3);
  fadeAnimator = v29->_fadeAnimator;
  v29->_fadeAnimator = v2;

  v6 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v29, "animationContext");
  id v26 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v6, "pillContentViewProvider");

  [v26 setMode:2];
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v29, "animationContext");
  objc_msgSend(v26, "setMode:", -[TVSSMenuBarAnimationContext menuMode](v7, "menuMode"));

  id v25 = [v26 contentView];
  objc_msgSend(v25, "setContentLayoutMode:");
  v8 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v29, "animationContext");
  id v24 = -[TVSSMenuBarAnimationContext pillView](v8, "pillView");

  [v24 setContentView:v25 withTransition:0];
  [v24 setContentStylingHidden:0];
  [v24 layoutIfNeeded];
  v9 = v29->_fadeAnimator;
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_10000629C;
  v22 = &unk_1001B5A60;
  id v23 = v24;
  -[UIViewPropertyAnimator addAnimations:](v9, "addAnimations:", &v18);
  objc_initWeak(&location, v29);
  v10 = v29->_fadeAnimator;
  v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  v14 = sub_100006308;
  v15 = &unk_1001B5A88;
  objc_copyWeak(&v16, &location);
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", &v11);
  -[_TVSSMenuBarFadeInMenuBarTransaction addMilestone:]( v29,  "addMilestone:",  @"_TVSSMenuBarFadeInMenuBarAnimationComplete");
  -[UIViewPropertyAnimator startAnimation](v29->_fadeAnimator, "startAnimation");
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeInMenuBarTransaction;
  -[_TVSSMenuBarFadeInMenuBarTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  id v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeInMenuBarTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end