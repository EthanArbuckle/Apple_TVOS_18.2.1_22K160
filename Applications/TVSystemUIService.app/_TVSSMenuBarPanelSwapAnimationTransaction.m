@interface _TVSSMenuBarPanelSwapAnimationTransaction
- (UIView)fromView;
- (UIView)toView;
- (_TVSSMenuBarPanelSwapAnimationTransaction)initWithFromView:(id)a3 toView:(id)a4 focusHeading:(unint64_t)a5;
- (unint64_t)focusHeading;
- (void)_begin;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarPanelSwapAnimationTransaction

- (_TVSSMenuBarPanelSwapAnimationTransaction)initWithFromView:(id)a3 toView:(id)a4 focusHeading:(unint64_t)a5
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = 0LL;
  objc_storeStrong(&v12, a4);
  unint64_t v11 = a5;
  v5 = v14;
  v14 = 0LL;
  v10.receiver = v5;
  v10.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPanelSwapAnimationTransaction;
  v14 = -[_TVSSMenuBarPanelSwapAnimationTransaction init](&v10, "init");
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromView, location[0]);
    objc_storeStrong((id *)&v14->_toView, v12);
    v14->_focusHeading = v11;
  }

  v7 = v14;
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  return v7;
}

- (void)_begin
{
  v77 = self;
  SEL v76 = a2;
  v75.receiver = self;
  v75.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPanelSwapAnimationTransaction;
  -[_TVSSMenuBarPanelSwapAnimationTransaction _begin](&v75, "_begin");
  v20 = objc_alloc(&OBJC_CLASS___UISpringTimingParameters);
  sub_1000E4F54();
  uint64_t v71 = v2;
  uint64_t v72 = v3;
  v73 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]( v20,  "initWithMass:stiffness:damping:initialVelocity:");
  v21 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  -[UISpringTimingParameters settlingDuration](v73, "settlingDuration");
  v70 = -[UIViewPropertyAnimator initWithDuration:timingParameters:](v21, "initWithDuration:timingParameters:", v73);
  objc_storeStrong((id *)&v73, 0LL);
  id v74 = v70;
  v22 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_1000E4F80();
  v68[3] = v4;
  v68[4] = v5;
  sub_1000E4F80();
  v68[1] = v6;
  v68[2] = v7;
  id v69 = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v22,  "initWithDuration:controlPoint1:controlPoint2:animations:",  0LL);
  v23 = objc_alloc(&OBJC_CLASS___UIViewPropertyAnimator);
  sub_1000E4F80();
  double v66 = v8;
  double v67 = v9;
  sub_1000E4F80();
  double v64 = v10;
  double v65 = v11;
  v68[0] = -[UIViewPropertyAnimator initWithDuration:controlPoint1:controlPoint2:animations:]( v23,  "initWithDuration:controlPoint1:controlPoint2:animations:",  0LL,  0.06,  v66,  v67,  v10,  v11);
  id v12 = -[_TVSSMenuBarPanelSwapAnimationTransaction focusHeading](v77, "focusHeading");
  double v13 = 1.0;
  if (v12 != (id)8) {
    double v13 = -1.0;
  }
  double v63 = v13;
  CGFloat tx = 40.0 * v13;
  double v61 = 0.0;
  id v60 = -[_TVSSMenuBarPanelSwapAnimationTransaction toView](v77, "toView");
  id v59 = -[_TVSSMenuBarPanelSwapAnimationTransaction fromView](v77, "fromView");
  CGAffineTransformMakeTranslation(&v58, tx, 0.0);
  memcpy(__dst, &v58, sizeof(__dst));
  [v60 setTransform:__dst];
  [v60 setAlpha:v61];
  id v24 = v74;
  v50 = _NSConcreteStackBlock;
  int v51 = -1073741824;
  int v52 = 0;
  v53 = sub_1000E4FAC;
  v54 = &unk_1001BA828;
  id v55 = v60;
  v56[0] = v59;
  v56[1] = *(id *)&tx;
  [v24 addAnimations:&v50];
  id v25 = v68[0];
  v44 = _NSConcreteStackBlock;
  int v45 = -1073741824;
  int v46 = 0;
  v47 = sub_1000E5074;
  v48 = &unk_1001B5A60;
  id v49 = v59;
  [v25 addAnimations:&v44];
  id v26 = v69;
  v38 = _NSConcreteStackBlock;
  int v39 = -1073741824;
  int v40 = 0;
  v41 = sub_1000E50B0;
  v42 = &unk_1001B5A60;
  id v43 = v60;
  [v26 addAnimations:&v38];
  id v27 = v74;
  v32 = _NSConcreteStackBlock;
  int v33 = -1073741824;
  int v34 = 0;
  v35 = sub_1000E50E4;
  v36 = &unk_1001BA850;
  v37 = v77;
  [v27 addCompletion:&v32];
  -[_TVSSMenuBarPanelSwapAnimationTransaction addMilestone:]( v77,  "addMilestone:",  @"_TVSSMenuBarPanelSwapAnimationComplete");
  v79[0] = v74;
  v79[1] = v69;
  v79[2] = v68[0];
  v14 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v79, 3LL);
  propertyAnimators = v77->_propertyAnimators;
  v77->_propertyAnimators = v14;

  memset(__b, 0, sizeof(__b));
  obj = v77->_propertyAnimators;
  id v29 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v78,  16LL);
  if (v29)
  {
    uint64_t v17 = *(void *)__b[2];
    uint64_t v18 = 0LL;
    id v19 = v29;
    while (1)
    {
      uint64_t v16 = v18;
      if (*(void *)__b[2] != v17) {
        objc_enumerationMutation(obj);
      }
      id v31 = *(id *)(__b[1] + 8 * v18);
      [v31 startAnimation];
      ++v18;
      if (v16 + 1 >= (unint64_t)v19)
      {
        uint64_t v18 = 0LL;
        id v19 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  __b,  v78,  16LL);
        if (!v19) {
          break;
        }
      }
    }
  }

  objc_storeStrong((id *)&v37, 0LL);
  objc_storeStrong(&v43, 0LL);
  objc_storeStrong(&v49, 0LL);
  objc_storeStrong(v56, 0LL);
  objc_storeStrong(&v55, 0LL);
  objc_storeStrong(&v59, 0LL);
  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(v68, 0LL);
  objc_storeStrong(&v69, 0LL);
  objc_storeStrong(&v74, 0LL);
}

  ;
}

  ;
}

- (void)_willInterruptWithReason:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  sub_1000E51A0((uint64_t)v5);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPanelSwapAnimationTransaction;
  -[_TVSSMenuBarPanelSwapAnimationTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  sub_1000E51A0((uint64_t)v5);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPanelSwapAnimationTransaction;
  -[_TVSSMenuBarPanelSwapAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (UIView)fromView
{
  return self->_fromView;
}

- (UIView)toView
{
  return self->_toView;
}

- (unint64_t)focusHeading
{
  return self->_focusHeading;
}

- (void).cxx_destruct
{
}

@end