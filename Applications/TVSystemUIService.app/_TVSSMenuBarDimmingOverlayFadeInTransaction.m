@interface _TVSSMenuBarDimmingOverlayFadeInTransaction
- (void)_begin;
@end

@implementation _TVSSMenuBarDimmingOverlayFadeInTransaction

- (void)_begin
{
  v42 = self;
  SEL v41 = a2;
  v40.receiver = self;
  v40.super_class = (Class)&OBJC_CLASS____TVSSMenuBarDimmingOverlayFadeInTransaction;
  -[_TVSSMenuBarDimmingOverlayFadeInTransaction _begin](&v40, "_begin");
  BOOL v23 = 1;
  if (+[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") != (id)4) {
    BOOL v23 = +[PBSSystemStatus systemAttentionState](&OBJC_CLASS___PBSSystemStatus, "systemAttentionState") == (id)5;
  }
  BOOL v39 = v23;
  v15 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v42, "animationContext");
  v14 = -[TVSSMenuBarAnimationContext menuModeState](v15, "menuModeState");
  BOOL v16 = -[TVSSMenuModeState playbackControlsState](v14, "playbackControlsState") != 0;

  BOOL v38 = v16;
  v20 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v42, "animationContext");
  v19 = -[TVSSMenuBarAnimationContext menuModeState](v20, "menuModeState");
  v18 = -[TVSSMenuModeState focusedApp](v19, "focusedApp");
  id v17 = -[FBSDisplayLayoutElement bundleIdentifier](v18, "bundleIdentifier");
  unsigned __int8 v21 = [v17 isEqual:@"com.apple.HeadBoard"];

  char v37 = v21 & 1;
  BOOL v22 = 0;
  if (!v23)
  {
    BOOL v22 = 0;
    if (!v38) {
      BOOL v22 = (v37 & 1) == 0;
    }
  }

  BOOL v36 = v22;
  double v2 = 1.0;
  if (!v22) {
    double v2 = 0.0;
  }
  double v35 = v2;
  v13 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v42, "animationContext");
  id v34 = -[TVSSMenuBarAnimationContext dimmingView](v13, "dimmingView");

  id v3 = [v34 alpha];
  if ((BSFloatEqualToFloat(v3, v4, v35) & 1) != 0)
  {
    int v33 = 1;
  }

  else
  {
    v10 = objc_alloc(&OBJC_CLASS___TVSSPropertyAnimatorTransaction);
    v9 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
    sub_10012E53C();
    double v30 = v5;
    double v31 = v6;
    sub_10012E53C();
    v29[2] = v7;
    v29[3] = v8;
    v11 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( v9,  "initWithControlPoint1:controlPoint2:",  v30,  v31,  *(double *)&v7,  *(double *)&v8);
    v32 = -[TVSSPropertyAnimatorTransaction initWithTimingParameters:duration:]( v10,  "initWithTimingParameters:duration:",  0.1);

    v12 = v32;
    v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    v27 = sub_10012E568;
    v28 = &unk_1001B99A8;
    v29[0] = v34;
    v29[1] = *(id *)&v35;
    -[TVSSPropertyAnimatorTransaction addAnimations:](v12, "addAnimations:", &v24);
    -[_TVSSMenuBarDimmingOverlayFadeInTransaction addChildTransaction:](v42, "addChildTransaction:", v32);
    objc_storeStrong(v29, 0LL);
    objc_storeStrong((id *)&v32, 0LL);
    int v33 = 0;
  }

  objc_storeStrong(&v34, 0LL);
}

  ;
}

@end