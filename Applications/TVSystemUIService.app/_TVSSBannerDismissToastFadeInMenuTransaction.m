@interface _TVSSBannerDismissToastFadeInMenuTransaction
- (UIViewPropertyAnimator)fadeInAnimator;
- (UIViewPropertyAnimator)scaleUpAnimator;
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSBannerDismissToastFadeInMenuTransaction

- (void)_begin
{
  v61 = self;
  SEL v60 = a2;
  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS____TVSSBannerDismissToastFadeInMenuTransaction;
  -[_TVSSBannerDismissToastFadeInMenuTransaction _begin](&v59, "_begin");
  v11 = objc_alloc(&OBJC_CLASS____TVSSBannerDismissToastSubTransaction);
  v12 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v61, "animationContext");
  id v58 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v11,  "initWithAnimationContext:animated:",  v12,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v61, "animated"));

  -[_TVSSBannerDismissToastFadeInMenuTransaction addChildTransaction:](v61, "addChildTransaction:", v58);
  v13 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v61, "animationContext");
  id v57 = -[TVSSMenuBarAnimationContext pillView](v13, "pillView");

  objc_msgSend(v57, "setAlpha:");
  v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_100127A14();
  double v55 = v2;
  double v56 = v3;
  sub_100127A14();
  double v53 = v4;
  double v54 = v5;
  v47 = _NSConcreteStackBlock;
  int v48 = -1073741824;
  int v49 = 0;
  v50 = sub_100127A40;
  v51 = &unk_1001B5A60;
  id v52 = v57;
  v6 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v14,  "initWithDuration:controlPoint1:controlPoint2:animations:",  &v47,  0.1,  v55,  v56,  v53,  v54);
  fadeInAnimator = v61->_fadeInAnimator;
  v61->_fadeInAnimator = v6;

  -[_TVSSBannerDismissToastFadeInMenuTransaction addMilestone:](v61, "addMilestone:", @"FadeMilestone");
  id v15 = v57;
  CGAffineTransformMakeScale(&v46, 0.8, 0.8);
  [v15 setTransform:&v46];
  id v45 =  +[UISpringTimingParameters tvss_appearingSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_appearingSpringParameters");
  v16 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  [v45 settlingDuration];
  v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v16, "initWithDuration:timingParameters:", v45);
  scaleUpAnimator = v61->_scaleUpAnimator;
  v61->_scaleUpAnimator = v8;

  v17 = v61->_scaleUpAnimator;
  v39 = _NSConcreteStackBlock;
  int v40 = -1073741824;
  int v41 = 0;
  v42 = sub_100127A74;
  v43 = &unk_1001B5A60;
  id v44 = v57;
  -[UIViewPropertyAnimator addAnimations:](v17, "addAnimations:", &v39);
  -[_TVSSBannerDismissToastFadeInMenuTransaction addMilestone:](v61, "addMilestone:", @"ScaleMilestone");
  objc_initWeak(&location, v61);
  v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  v34 = sub_100127ACC;
  v35 = &unk_1001B7990;
  objc_copyWeak(&v36, &location);
  id v37 = objc_retainBlock(&v31);
  v18 = v61->_fadeInAnimator;
  v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  v28 = sub_100127B50;
  v29 = &unk_1001B98F8;
  id v30 = v37;
  -[UIViewPropertyAnimator addCompletion:](v18, "addCompletion:", &v25);
  v10 = v61->_scaleUpAnimator;
  v19 = _NSConcreteStackBlock;
  int v20 = -1073741824;
  int v21 = 0;
  v22 = sub_100127B90;
  v23 = &unk_1001B98F8;
  id v24 = v37;
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", &v19);
  -[UIViewPropertyAnimator startAnimationAfterDelay:](v61->_fadeInAnimator, "startAnimationAfterDelay:", 0.166);
  -[UIViewPropertyAnimator startAnimation](v61->_scaleUpAnimator, "startAnimation");
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v37, 0LL);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v58, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeInAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleUpAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerDismissToastFadeInMenuTransaction;
  -[_TVSSBannerDismissToastFadeInMenuTransaction _willInterruptWithReason:]( &v3,  "_willInterruptWithReason:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeInAnimator, "stopAnimation:", 0LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_fadeInAnimator, "finishAnimationAtPosition:");
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleUpAnimator, "stopAnimation:", 0LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_scaleUpAnimator, "finishAnimationAtPosition:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerDismissToastFadeInMenuTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (UIViewPropertyAnimator)fadeInAnimator
{
  return self->_fadeInAnimator;
}

- (UIViewPropertyAnimator)scaleUpAnimator
{
  return self->_scaleUpAnimator;
}

- (void).cxx_destruct
{
}

@end