@interface _TVSSMenuBarPresentPanelTransaction
- (void)_begin;
- (void)_didFinishWork;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarPresentPanelTransaction

- (void)_begin
{
  v44 = self;
  SEL v43 = a2;
  v42.receiver = self;
  v42.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPresentPanelTransaction;
  -[_TVSSMenuBarPresentPanelTransaction _begin](&v42, "_begin");
  v17 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v44, "animationContext");
  BOOL v18 = (id)-[TVSSMenuBarAnimationContext menuMode](v17, "menuMode") != (id)3;

  if (v18)
  {
    v16 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v16,  "handleFailureInMethod:object:file:lineNumber:description:",  v43,  v44,  @"_TVSSMenuBarPresentPanelTransaction.m",  32LL,  @"_TVSSMenuBarPresentPanelTransaction should only be used to enter the hidden or privacy state");
  }

  v8 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  id v9 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v2 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v8, "initWithDuration:timingParameters:", 0.3);
  scaleAndFadeAnimator = v44->_scaleAndFadeAnimator;
  v44->_scaleAndFadeAnimator = v2;

  v10 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v44, "animationContext");
  id v41 = -[TVSSMenuBarAnimationContext panelHostingViewController](v10, "panelHostingViewController");

  id v40 = [v41 view];
  id v4 = [v40 effectiveUserInterfaceLayoutDirection];
  BOOL v39 = v4 == (id)1;
  double v5 = -1.0;
  if (v4 != (id)1) {
    double v5 = 1.0;
  }
  double v38 = v5;
  [v41 beginAppearanceTransition:1 animated:1];
  CGAffineTransformMakeScale(&v37, 0.5, 0.5);
  [v40 bounds];
  CGRect v36 = v45;
  double v11 = v38;
  double tx = v11 * CGRectGetWidth(v45) / 2.0;
  CGFloat ty = -CGRectGetHeight(v36) / 2.0;
  memcpy(&__dst, &v37, sizeof(__dst));
  CGAffineTransformTranslate(&v35, &__dst, tx, ty);
  memcpy(&v37, &v35, sizeof(v37));
  memcpy(v33, &v37, sizeof(v33));
  [v40 setTransform:v33];
  [v40 setAlpha:0.0];
  v14 = v44->_scaleAndFadeAnimator;
  v27 = _NSConcreteStackBlock;
  int v28 = -1073741824;
  int v29 = 0;
  v30 = sub_10012ED3C;
  v31 = &unk_1001B5A60;
  id v32 = v40;
  -[UIViewPropertyAnimator addAnimations:](v14, "addAnimations:", &v27);
  objc_initWeak(&location, v44);
  v15 = v44->_scaleAndFadeAnimator;
  v20 = _NSConcreteStackBlock;
  int v21 = -1073741824;
  int v22 = 0;
  v23 = sub_10012EDAC;
  v24 = &unk_1001B5A88;
  objc_copyWeak(&v25, &location);
  -[UIViewPropertyAnimator addCompletion:](v15, "addCompletion:", &v20);
  -[_TVSSMenuBarPresentPanelTransaction addMilestone:]( v44,  "addMilestone:",  @"_TVSSMenuBarPresentPanelAnimationComplete");
  v7 = objc_alloc(&OBJC_CLASS____TVSSMenuBarDimmingOverlayFadeInTransaction);
  v6 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v44, "animationContext");
  id v19 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v7,  "initWithAnimationContext:animated:",  v6,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v44, "animated"));

  -[_TVSSMenuBarPresentPanelTransaction addChildTransaction:withSchedulingPolicy:]( v44,  "addChildTransaction:withSchedulingPolicy:",  v19,  0LL);
  -[UIViewPropertyAnimator startAnimation](v44->_scaleAndFadeAnimator, "startAnimation");
  objc_storeStrong(&v19, 0LL);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_storeStrong(&v41, 0LL);
}

- (void)_didFinishWork
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPresentPanelTransaction;
  -[_TVSSMenuBarPresentPanelTransaction _didFinishWork](&v4, "_didFinishWork");
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
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPresentPanelTransaction;
  -[_TVSSMenuBarPresentPanelTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
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
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPresentPanelTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end