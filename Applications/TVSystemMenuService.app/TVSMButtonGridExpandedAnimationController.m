@interface TVSMButtonGridExpandedAnimationController
+ (id)_cubicTimingFunction;
+ (id)_cubicTimingParameters;
+ (id)_springTimingParameters;
+ (id)animationSettingsForOperation:(int64_t)a3;
- (BOOL)isPresenting;
- (CGAffineTransform)_transformFromRect:(SEL)a3 toRect:(CGRect)a4;
- (CGRect)originatingFrame;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setOriginatingFrame:(CGRect)a3;
- (void)setPresenting:(BOOL)a3;
@end

@implementation TVSMButtonGridExpandedAnimationController

+ (id)animationSettingsForOperation:(int64_t)a3
{
  id v17 = a1;
  v16[2] = (id)a2;
  v16[1] = (id)a3;
  v16[0] = 0LL;
  if (a3)
  {
    if (a3 == 1)
    {
      id v15 = [v17 _springTimingParameters];
      [v15 mass];
      double v13 = v3;
      [v15 stiffness];
      double v12 = v4;
      [v15 damping];
      v6 =  +[BSSpringAnimationSettings settingsWithMass:stiffness:damping:]( &OBJC_CLASS___BSSpringAnimationSettings,  "settingsWithMass:stiffness:damping:",  v13,  v12,  v5);
      id v7 = v16[0];
      v16[0] = v6;

      objc_storeStrong(&v15, 0LL);
    }

    else if (a3 == 2)
    {
      id v14 = [v17 _cubicTimingFunction];
      v8 =  +[BSAnimationSettings settingsWithDuration:timingFunction:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:timingFunction:",  v14,  0.2);
      id v9 = v16[0];
      v16[0] = v8;

      objc_storeStrong(&v14, 0LL);
    }
  }

  id v11 = v16[0];
  objc_storeStrong(v16, 0LL);
  return v11;
}

+ (id)_cubicTimingFunction
{
  LODWORD(v2) = 0.25;
  LODWORD(v3) = 0;
  LODWORD(v4) = 0.75;
  LODWORD(v5) = 1.0;
  return +[CAMediaTimingFunction functionWithControlPoints::::]( &OBJC_CLASS___CAMediaTimingFunction,  "functionWithControlPoints::::",  v2,  v3,  v4,  v5,  a2,  a1);
}

+ (id)_cubicTimingParameters
{
  v5[2] = a1;
  v5[1] = (id)a2;
  v5[0] = [a1 _cubicTimingFunction];
  double v2 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
  double v4 = -[UICubicTimingParameters initWithCustomCurve:](v2, "initWithCustomCurve:", v5[0]);
  objc_storeStrong(v5, 0LL);
  return v4;
}

+ (id)_springTimingParameters
{
  double v5 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  sub_10002A314();
  return  -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v5,  "initWithMass:stiffness:damping:initialVelocity:",  1.0,  180.0,  22.4,  v2,  v3);
}

  ;
}

- (double)transitionDuration:(id)a3
{
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 0.2;
}

- (void)animateTransition:(id)a3
{
  v94 = (double *)self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v92 = [location[0] containerView];
  if ([v94 isPresenting])
  {
    dispatch_group_t v91 = dispatch_group_create();
    id v90 = [location[0] viewForKey:UITransitionContextFromViewKey];
    id v89 = [location[0] viewForKey:UITransitionContextToViewKey];
    objc_msgSend(v89, "setAlpha:");
    id v19 = v89;
    [v92 bounds];
    double v85 = v3;
    double v86 = v4;
    double v87 = v5;
    double v88 = v6;
    objc_msgSend(v19, "setFrame:", v3, v4, v5, v6);
    id v21 = v89;
    v20 = v94;
    [v89 frame];
    v83[1] = v7;
    v83[2] = v8;
    v83[3] = v9;
    v83[4] = v10;
    objc_msgSend( v20,  "_transformFromRect:toRect:",  *(double *)&v7,  *(double *)&v8,  *(double *)&v9,  *(double *)&v10,  v94[3],  v94[4],  v94[5],  v94[6]);
    [v21 setTransform:v84];
    [v92 addSubview:v89];
    v83[0] = [(id)objc_opt_class(v94) _cubicTimingParameters];
    id v11 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    v82 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v11,  "initWithDuration:timingParameters:",  v83[0],  0.2);
    v22 = v82;
    v75 = _NSConcreteStackBlock;
    int v76 = -1073741824;
    int v77 = 0;
    v78 = sub_10002AC10;
    v79 = &unk_100049578;
    id v80 = v90;
    id v81 = v89;
    -[UIViewPropertyAnimator addAnimations:](v22, "addAnimations:", &v75);
    v23 = v82;
    v69 = _NSConcreteStackBlock;
    int v70 = -1073741824;
    int v71 = 0;
    v72 = sub_10002AC94;
    v73 = &unk_100049618;
    v74 = v91;
    -[UIViewPropertyAnimator addCompletion:](v23, "addCompletion:", &v69);
    id v68 = [(id)objc_opt_class(v94) _springTimingParameters];
    double v12 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
    v67 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( v12,  "initWithDuration:timingParameters:",  v68,  0.0);
    v24 = v67;
    v61 = _NSConcreteStackBlock;
    int v62 = -1073741824;
    int v63 = 0;
    v64 = sub_10002ACC8;
    v65 = &unk_100048E50;
    id v66 = v89;
    -[UIViewPropertyAnimator addAnimations:](v24, "addAnimations:", &v61);
    v25 = v67;
    v55 = _NSConcreteStackBlock;
    int v56 = -1073741824;
    int v57 = 0;
    v58 = sub_10002AD20;
    v59 = &unk_100049618;
    v60 = v91;
    -[UIViewPropertyAnimator addCompletion:](v25, "addCompletion:", &v55);
    dispatch_group_enter(v91);
    dispatch_group_enter(v91);
    -[UIViewPropertyAnimator startAnimation](v82, "startAnimation");
    -[UIViewPropertyAnimator startAnimation](v67, "startAnimation");
    group = v91;
    queue = &_dispatch_main_q;
    v49 = _NSConcreteStackBlock;
    int v50 = -1073741824;
    int v51 = 0;
    v52 = sub_10002AD54;
    v53 = &unk_100048E50;
    id v54 = location[0];
    dispatch_group_notify(group, queue, &v49);

    objc_storeStrong(&v54, 0LL);
    objc_storeStrong((id *)&v60, 0LL);
    objc_storeStrong(&v66, 0LL);
    objc_storeStrong((id *)&v67, 0LL);
    objc_storeStrong(&v68, 0LL);
    objc_storeStrong((id *)&v74, 0LL);
    objc_storeStrong(&v81, 0LL);
    objc_storeStrong(&v80, 0LL);
    objc_storeStrong((id *)&v82, 0LL);
    objc_storeStrong(v83, 0LL);
    objc_storeStrong(&v89, 0LL);
    objc_storeStrong(&v90, 0LL);
    objc_storeStrong((id *)&v91, 0LL);
  }

  else
  {
    id v48 = [location[0] viewForKey:UITransitionContextFromViewKey];
    id v47 = [location[0] viewForKey:UITransitionContextToViewKey];
    [v92 bounds];
    v46[1] = v13;
    v46[2] = v14;
    v46[3] = v15;
    v46[4] = v16;
    objc_msgSend(v47, "setBounds:", *(double *)&v13, *(double *)&v14, *(double *)&v15, *(double *)&v16);
    [v92 insertSubview:v47 belowSubview:v48];
    v46[0] = [(id)objc_opt_class(v94) _cubicTimingParameters];
    id v45 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]( objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator),  "initWithDuration:timingParameters:",  v46[0],  0.2);
    objc_initWeak(&v44, v94);
    id v18 = v45;
    v35 = _NSConcreteStackBlock;
    int v36 = -1073741824;
    int v37 = 0;
    v38 = sub_10002AD8C;
    v39 = &unk_100049B88;
    id v40 = v48;
    v41 = v94;
    objc_copyWeak(&v43, &v44);
    id v42 = v47;
    [v18 addAnimations:&v35];
    id v17 = v45;
    v28 = _NSConcreteStackBlock;
    int v29 = -1073741824;
    int v30 = 0;
    v31 = sub_10002AEE0;
    v32 = &unk_100049BB0;
    id v33 = v48;
    id v34 = location[0];
    [v17 addCompletion:&v28];
    [v45 startAnimation];
    objc_storeStrong(&v34, 0LL);
    objc_storeStrong(&v33, 0LL);
    objc_storeStrong(&v42, 0LL);
    objc_destroyWeak(&v43);
    objc_storeStrong((id *)&v41, 0LL);
    objc_storeStrong(&v40, 0LL);
    objc_destroyWeak(&v44);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(v46, 0LL);
    objc_storeStrong(&v47, 0LL);
    objc_storeStrong(&v48, 0LL);
  }

  objc_storeStrong(&v92, 0LL);
  objc_storeStrong(location, 0LL);
}

- (CGAffineTransform)_transformFromRect:(SEL)a3 toRect:(CGRect)a4
{
  CGRect v18 = a4;
  CGRect v17 = a5;
  v16 = self;
  SEL v15 = a3;
  memcpy(retstr, &CGAffineTransformIdentity, sizeof(CGAffineTransform));
  double MidX = CGRectGetMidX(v18);
  double tx = -(MidX - CGRectGetMidX(v17));
  double MidY = CGRectGetMidY(v18);
  double ty = -(MidY - CGRectGetMidY(v17));
  memcpy(&v13, retstr, sizeof(v13));
  CGAffineTransformTranslate(&v14, &v13, tx, ty);
  memcpy(retstr, &v14, sizeof(CGAffineTransform));
  memcpy(&v11, retstr, sizeof(v11));
  CGAffineTransformScale(&v12, &v11, v17.size.width / v18.size.width, v17.size.height / v18.size.height);
  return (CGAffineTransform *)memcpy(retstr, &v12, sizeof(CGAffineTransform));
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (CGRect)originatingFrame
{
  double y = self->_originatingFrame.origin.y;
  double x = self->_originatingFrame.origin.x;
  double height = self->_originatingFrame.size.height;
  double width = self->_originatingFrame.size.width;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginatingFrame:(CGRect)a3
{
  self->_originatingFrame = a3;
}

- (void).cxx_destruct
{
}

@end