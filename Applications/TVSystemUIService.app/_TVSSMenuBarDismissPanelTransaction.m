@interface _TVSSMenuBarDismissPanelTransaction
- (void)_begin;
- (void)_didFinishWork;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarDismissPanelTransaction

- (void)_begin
{
  v36 = self;
  SEL v35 = a2;
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS____TVSSMenuBarDismissPanelTransaction;
  -[_TVSSMenuBarDismissPanelTransaction _begin](&v34, "_begin");
  v14 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v36, "animationContext");
  BOOL v15 = (id)-[TVSSMenuBarAnimationContext previousMenuMode](v14, "previousMenuMode") != (id)3;

  if (v15)
  {
    v13 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v13,  "handleFailureInMethod:object:file:lineNumber:description:",  v35,  v36,  @"_TVSSMenuBarPresentPanelTransaction.m",  108LL,  @"_TVSSMenuBarDismissPanelTransaction should only be used to exit the interactive state");
  }

  v8 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v9 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v2 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", 0.3);
  scaleAndFadeAnimator = v36->_scaleAndFadeAnimator;
  v36->_scaleAndFadeAnimator = v2;

  v10 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v36, "animationContext");
  id v33 = -[TVSSMenuBarAnimationContext panelHostingViewController](v10, "panelHostingViewController");

  id v32 = [v33 view];
  id v4 = [v32 effectiveUserInterfaceLayoutDirection];
  BOOL v31 = v4 == (id)1;
  double v5 = -1.0;
  if (v4 != (id)1) {
    double v5 = 1.0;
  }
  double v30 = v5;
  [v33 beginAppearanceTransition:0 animated:1];
  v11 = v36->_scaleAndFadeAnimator;
  v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  v27 = sub_10012F4B4;
  v28 = &unk_1001B99A8;
  v29[1] = *(id *)&v30;
  v29[0] = v32;
  -[UIViewPropertyAnimator addAnimations:](v11, "addAnimations:", &v24);
  objc_initWeak(&location, v36);
  v12 = v36->_scaleAndFadeAnimator;
  v17 = _NSConcreteStackBlock;
  int v18 = -1073741824;
  int v19 = 0;
  v20 = sub_10012F618;
  v21 = &unk_1001B5A88;
  objc_copyWeak(&v22, &location);
  -[UIViewPropertyAnimator addCompletion:](v12, "addCompletion:", &v17);
  -[_TVSSMenuBarDismissPanelTransaction addMilestone:]( v36,  "addMilestone:",  @"_TVSSMenuBarDismissPanelAnimationComplete");
  v7 = objc_alloc(&OBJC_CLASS____TVSSMenuBarDimmingOverlayFadeOutTransaction);
  v6 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v36, "animationContext");
  id v16 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v7,  "initWithAnimationContext:animated:",  v6,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v36, "animated"));

  -[_TVSSMenuBarDismissPanelTransaction addChildTransaction:withSchedulingPolicy:]( v36,  "addChildTransaction:withSchedulingPolicy:",  v16,  0LL);
  -[UIViewPropertyAnimator startAnimation](v36->_scaleAndFadeAnimator, "startAnimation");
  objc_storeStrong(&v16, 0LL);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
  objc_storeStrong(v29, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
}

- (void)_didFinishWork
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVSSMenuBarDismissPanelTransaction;
  -[_TVSSMenuBarDismissPanelTransaction _didFinishWork](&v4, "_didFinishWork");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v6, "animationContext");
  v3 = -[TVSSMenuBarAnimationContext panelHostingViewController](v2, "panelHostingViewController");

  -[TVSSMenuItemPanelHostingViewController endAppearanceTransition](v3, "endAppearanceTransition");
  objc_storeStrong((id *)&v3, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleAndFadeAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_scaleAndFadeAnimator, "finishAnimationAtPosition:", 2LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarDismissPanelTransaction;
  -[_TVSSMenuBarDismissPanelTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleAndFadeAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_scaleAndFadeAnimator, "finishAnimationAtPosition:", 2LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarDismissPanelTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end