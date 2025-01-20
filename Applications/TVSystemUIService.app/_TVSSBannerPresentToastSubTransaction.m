@interface _TVSSBannerPresentToastSubTransaction
- (UIViewPropertyAnimator)fadeAnimator;
- (UIViewPropertyAnimator)scaleAnimator;
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSBannerPresentToastSubTransaction

- (void)_begin
{
  v75 = self;
  SEL v74 = a2;
  v73.receiver = self;
  v73.super_class = (Class)&OBJC_CLASS____TVSSBannerPresentToastSubTransaction;
  -[_TVSSBannerPresentToastSubTransaction _begin](&v73, "_begin");
  v24 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v75, "animationContext");
  v23 = -[TVSSMenuBarAnimationContext currentBannerContext](v24, "currentBannerContext");
  id v72 = -[TVSSMenuModeBannerContext transitioningBannerPresentable](v23, "transitioningBannerPresentable");

  id v2 = [v72 bannerContentView];
  BOOL v22 = v2 == 0LL;

  if (v22)
  {
    id v71 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[presentable bannerContentView] != nil");
    id v70 = &_os_log_default;
    os_log_type_t v69 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v70, OS_LOG_TYPE_ERROR))
    {
      v20 = NSStringFromSelector(v74);
      id v68 = v20;
      aClass = (objc_class *)objc_opt_class(v75);
      v19 = NSStringFromClass(aClass);
      id location = v19;
      sub_10000583C( (uint64_t)v76,  (uint64_t)v68,  (uint64_t)location,  (uint64_t)v75,  (uint64_t)@"_TVSSBannerPresentToastSubTransaction.m",  36,  (uint64_t)v71);
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v70,  v69,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v76,  0x3Au);

      objc_storeStrong(&location, 0LL);
      objc_storeStrong(&v68, 0LL);
    }

    objc_storeStrong(&v70, 0LL);
    _bs_set_crash_log_message([v71 UTF8String]);
    __break(0);
    JUMPOUT(0x1000A3314LL);
  }

  v18 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v75, "animationContext");
  id v66 = -[TVSSMenuBarAnimationContext bannerContainerViewController](v18, "bannerContainerViewController");

  id v65 = [v66 view];
  id v64 = [v72 bannerContentView];
  sub_1000A3978((uint64_t)v75, v64, v65);
  [v64 setAlpha:0.0];
  v17 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_1000A3CE4();
  double v62 = v3;
  double v63 = v4;
  sub_1000A3CE4();
  double v60 = v5;
  double v61 = v6;
  v54 = _NSConcreteStackBlock;
  int v55 = -1073741824;
  int v56 = 0;
  v57 = sub_1000A3D10;
  v58 = &unk_1001B5A60;
  id v59 = v64;
  v16 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v17,  "initWithDuration:controlPoint1:controlPoint2:animations:",  &v54,  0.1,  v62,  v63,  v60,  v61);
  fadeAnimator = v75->_fadeAnimator;
  v75->_fadeAnimator = v16;

  -[_TVSSBannerPresentToastSubTransaction addMilestone:]( v75,  "addMilestone:",  @"_TVSSMenuBarPresentToastTransactionFadeIn");
  id v15 = v64;
  CGAffineTransformMakeScale(&v53, 0.8, 0.8);
  [v15 setTransform:&v53];
  id v52 =  +[UISpringTimingParameters tvss_appearingSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_appearingSpringParameters");
  v14 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  [v52 settlingDuration];
  v13 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v14, "initWithDuration:timingParameters:", v52, v8);
  scaleAnimator = v75->_scaleAnimator;
  v75->_scaleAnimator = v13;

  v12 = v75->_scaleAnimator;
  v45 = _NSConcreteStackBlock;
  int v46 = -1073741824;
  int v47 = 0;
  v48 = sub_1000A3D44;
  v49 = &unk_1001B61C0;
  id v50 = v64;
  id v51 = v72;
  -[UIViewPropertyAnimator addAnimations:](v12, "addAnimations:", &v45);
  -[_TVSSBannerPresentToastSubTransaction addMilestone:]( v75,  "addMilestone:",  @"_TVSSMenuBarPresentToastTransactionScale");
  objc_initWeak(&from, v75);
  v37 = _NSConcreteStackBlock;
  int v38 = -1073741824;
  int v39 = 0;
  v40 = sub_1000A3DD4;
  v41 = &unk_1001B7990;
  objc_copyWeak(&v42, &from);
  id v43 = objc_retainBlock(&v37);
  v11 = v75->_fadeAnimator;
  v31 = _NSConcreteStackBlock;
  int v32 = -1073741824;
  int v33 = 0;
  v34 = sub_1000A3E58;
  v35 = &unk_1001B98F8;
  id v36 = v43;
  -[UIViewPropertyAnimator addCompletion:](v11, "addCompletion:", &v31);
  v10 = v75->_scaleAnimator;
  v25 = _NSConcreteStackBlock;
  int v26 = -1073741824;
  int v27 = 0;
  v28 = sub_1000A3E98;
  v29 = &unk_1001B98F8;
  id v30 = v43;
  -[UIViewPropertyAnimator addCompletion:](v10, "addCompletion:", &v25);
  -[UIViewPropertyAnimator startAnimationAfterDelay:](v75->_fadeAnimator, "startAnimationAfterDelay:", 0.166);
  -[UIViewPropertyAnimator startAnimation](v75->_scaleAnimator, "startAnimation");
  objc_storeStrong(&v30, 0LL);
  objc_storeStrong(&v36, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&from);
  objc_storeStrong(&v51, 0LL);
  objc_storeStrong(&v50, 0LL);
  objc_storeStrong(&v52, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v64, 0LL);
  objc_storeStrong(&v65, 0LL);
  objc_storeStrong(&v66, 0LL);
  objc_storeStrong(&v72, 0LL);
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
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerPresentToastSubTransaction;
  -[_TVSSBannerPresentToastSubTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
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
  v3.super_class = (Class)&OBJC_CLASS____TVSSBannerPresentToastSubTransaction;
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