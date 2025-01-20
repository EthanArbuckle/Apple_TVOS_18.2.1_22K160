@interface _TVSSBannerPresentToastFadeOutMenuTransaction
- (UIViewPropertyAnimator)fadeOutAnimator;
- (UIViewPropertyAnimator)scaleDownAnimator;
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSBannerPresentToastFadeOutMenuTransaction

- (void)_begin
{
  v60 = self;
  SEL v59 = a2;
  v58.receiver = self;
  v58.super_class = (Class)&OBJC_CLASS____TVSSBannerPresentToastFadeOutMenuTransaction;
  -[_TVSSBannerPresentToastFadeOutMenuTransaction _begin](&v58, "_begin");
  v11 = objc_alloc(&OBJC_CLASS____TVSSBannerPresentToastSubTransaction);
  v12 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v60, "animationContext");
  id v57 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v11,  "initWithAnimationContext:animated:",  v12,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v60, "animated"));

  -[_TVSSBannerPresentToastFadeOutMenuTransaction addChildTransaction:](v60, "addChildTransaction:", v57);
  v13 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v60, "animationContext");
  id v56 = -[TVSSMenuBarAnimationContext pillView](v13, "pillView");

  objc_msgSend(v56, "setAlpha:");
  v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_1000D3E4C();
  double v54 = v2;
  double v55 = v3;
  sub_1000D3E4C();
  double v52 = v4;
  double v53 = v5;
  v46 = _NSConcreteStackBlock;
  int v47 = -1073741824;
  int v48 = 0;
  v49 = sub_1000D3E78;
  v50 = &unk_1001B5A60;
  id v51 = v56;
  v6 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v14,  "initWithDuration:controlPoint1:controlPoint2:animations:",  &v46,  0.1,  v54,  v55,  v52,  v53);
  fadeOutAnimator = v60->_fadeOutAnimator;
  v60->_fadeOutAnimator = v6;

  -[_TVSSBannerPresentToastFadeOutMenuTransaction addMilestone:](v60, "addMilestone:", @"FadeMilestone");
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v56 setTransform:__dst];
  id v44 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v15 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  [v44 settlingDuration];
  v8 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v15, "initWithDuration:timingParameters:", v44);
  scaleDownAnimator = v60->_scaleDownAnimator;
  v60->_scaleDownAnimator = v8;

  v16 = v60->_scaleDownAnimator;
  v38 = _NSConcreteStackBlock;
  int v39 = -1073741824;
  int v40 = 0;
  v41 = sub_1000D3EAC;
  v42 = &unk_1001B5A60;
  id v43 = v56;
  -[UIViewPropertyAnimator addAnimations:](v16, "addAnimations:", &v38);
  -[_TVSSBannerPresentToastFadeOutMenuTransaction addMilestone:](v60, "addMilestone:", @"ScaleMilestone");
  objc_initWeak(&location, v60);
  v30 = _NSConcreteStackBlock;
  int v31 = -1073741824;
  int v32 = 0;
  v33 = sub_1000D3F04;
  v34 = &unk_1001BA468;
  objc_copyWeak(&v35, &location);
  id v36 = objc_retainBlock(&v30);
  v17 = v60->_fadeOutAnimator;
  v24 = _NSConcreteStackBlock;
  int v25 = -1073741824;
  int v26 = 0;
  v27 = sub_1000D3FA8;
  v28 = &unk_1001B98F8;
  id v29 = v36;
  -[UIViewPropertyAnimator addCompletion:](v17, "addCompletion:", &v24);
  v10 = v60->_scaleDownAnimator;
  v18 = _NSConcreteStackBlock;
  int v19 = -1073741824;
  int v20 = 0;
  v21 = sub_1000D3FEC;
  v22 = &unk_1001B98F8;
  id v23 = v36;
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", &v18);
  -[UIViewPropertyAnimator startAnimation](v60->_fadeOutAnimator, "startAnimation");
  -[UIViewPropertyAnimator startAnimation](v60->_scaleDownAnimator, "startAnimation");
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v44, 0LL);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&v56, 0LL);
  objc_storeStrong(&v57, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeOutAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleDownAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerPresentToastFadeOutMenuTransaction;
  -[_TVSSBannerPresentToastFadeOutMenuTransaction _willInterruptWithReason:]( &v3,  "_willInterruptWithReason:",  location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeOutAnimator, "stopAnimation:", 0LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_fadeOutAnimator, "finishAnimationAtPosition:");
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleDownAnimator, "stopAnimation:", 0LL);
  -[UIViewPropertyAnimator finishAnimationAtPosition:](v5->_scaleDownAnimator, "finishAnimationAtPosition:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerPresentToastFadeOutMenuTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (UIViewPropertyAnimator)fadeOutAnimator
{
  return self->_fadeOutAnimator;
}

- (UIViewPropertyAnimator)scaleDownAnimator
{
  return self->_scaleDownAnimator;
}

- (void).cxx_destruct
{
}

@end