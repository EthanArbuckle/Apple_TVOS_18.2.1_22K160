@interface _TVSSBannerDismissToastSubTransaction
- (UIViewPropertyAnimator)fadeAnimator;
- (UIViewPropertyAnimator)scaleAnimator;
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSBannerDismissToastSubTransaction

- (void)_begin
{
  v73 = self;
  SEL v72 = a2;
  v71.receiver = self;
  v71.super_class = (Class)&OBJC_CLASS____TVSSBannerDismissToastSubTransaction;
  -[_TVSSBannerDismissToastSubTransaction _begin](&v71, "_begin");
  v21 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v73, "animationContext");
  id v70 = -[TVSSMenuBarAnimationContext currentBannerContext](v21, "currentBannerContext");

  id v69 = [v70 transitioningBannerPresentable];
  id v2 = [v69 bannerContentView];
  BOOL v20 = v2 == 0LL;

  if (v20)
  {
    id v68 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[presentable bannerContentView] != nil");
    id v67 = &_os_log_default;
    os_log_type_t v66 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_ERROR))
    {
      v18 = NSStringFromSelector(v72);
      id v65 = v18;
      aClass = (objc_class *)objc_opt_class(v73);
      v17 = NSStringFromClass(aClass);
      id location = v17;
      sub_10000583C( (uint64_t)v74,  (uint64_t)v65,  (uint64_t)location,  (uint64_t)v73,  (uint64_t)@"_TVSSBannerDismissToastSubTransaction.m",  41,  (uint64_t)v68);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v67,  v66,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v74,  0x3Au);

      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v65, 0LL);
    }

    objc_storeStrong(&v67, 0LL);
    _bs_set_crash_log_message([v68 UTF8String]);
    __break(0);
    JUMPOUT(0x100132910LL);
  }

  id v63 = [v69 bannerContentView];
  id v62 = objc_alloc_init(&OBJC_CLASS_____TVSSMenuBarToastRemoveFromSuperviewTransaction);
  [v62 setToastView:v63];
  -[_TVSSBannerDismissToastSubTransaction addChildTransaction:withSchedulingPolicy:]( v73,  "addChildTransaction:withSchedulingPolicy:",  v62,  1LL);
  [v63 setAlpha:1.0];
  v16 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_100132F44();
  double v60 = v3;
  double v61 = v4;
  sub_100132F44();
  double v58 = v5;
  double v59 = v6;
  v52 = _NSConcreteStackBlock;
  int v53 = -1073741824;
  int v54 = 0;
  v55 = sub_100132F70;
  v56 = &unk_1001B5A60;
  id v57 = v63;
  v15 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v16,  "initWithDuration:controlPoint1:controlPoint2:animations:",  &v52,  0.1,  v60,  v61,  v58,  v59);
  fadeAnimator = v73->_fadeAnimator;
  v73->_fadeAnimator = v15;

  -[_TVSSBannerDismissToastSubTransaction addMilestone:]( v73,  "addMilestone:",  @"_TVSSMenuBarDismissToastTransactionFade");
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  [v63 setTransform:__dst];
  id v50 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  [v50 settlingDuration];
  v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v14, "initWithDuration:timingParameters:", v50, v8);
  scaleAnimator = v73->_scaleAnimator;
  v73->_scaleAnimator = v13;

  v12 = v73->_scaleAnimator;
  v42 = _NSConcreteStackBlock;
  int v43 = -1073741824;
  int v44 = 0;
  v45 = sub_100132FA4;
  v46 = &unk_1001B60D0;
  id v47 = v63;
  id v48 = v69;
  id v49 = v70;
  -[UIViewPropertyAnimator addAnimations:](v12, "addAnimations:", &v42);
  -[_TVSSBannerDismissToastSubTransaction addMilestone:]( v73,  "addMilestone:",  @"_TVSSMenuBarDismissToastTransactionScale");
  objc_initWeak(&from, v73);
  v34 = _NSConcreteStackBlock;
  int v35 = -1073741824;
  int v36 = 0;
  v37 = sub_100133068;
  v38 = &unk_1001B7990;
  objc_copyWeak(&v39, &from);
  id v40 = objc_retainBlock(&v34);
  v11 = v73->_fadeAnimator;
  v28 = _NSConcreteStackBlock;
  int v29 = -1073741824;
  int v30 = 0;
  v31 = sub_1001330EC;
  v32 = &unk_1001B98F8;
  id v33 = v40;
  -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", &v28);
  v10 = v73->_scaleAnimator;
  v22 = _NSConcreteStackBlock;
  int v23 = -1073741824;
  int v24 = 0;
  v25 = sub_10013312C;
  v26 = &unk_1001B98F8;
  id v27 = v40;
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", &v22);
  -[UIViewPropertyAnimator startAnimation](v73->_fadeAnimator, "startAnimation");
  -[UIViewPropertyAnimator startAnimation](v73->_scaleAnimator, "startAnimation");
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v40, 0LL);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&from);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v57, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(&v63, 0LL);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(&v70, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerDismissToastSubTransaction;
  -[_TVSSBannerDismissToastSubTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  double v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeAnimator, "stopAnimation:", 1LL);
  -[UIViewPropertyAnimator stopAnimation:](v5->_scaleAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerDismissToastSubTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (UIViewPropertyAnimator)fadeAnimator
{
  return self->_fadeAnimator;
}

- (UIViewPropertyAnimator)scaleAnimator
{
  return self->_scaleAnimator;
}

- (void).cxx_destruct
{
}

@end