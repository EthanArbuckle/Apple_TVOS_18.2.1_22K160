@interface _TVSSMenuBarDimmingOverlayFadeOutTransaction
- (BOOL)_canBeInterrupted;
- (void)_begin;
@end

@implementation _TVSSMenuBarDimmingOverlayFadeOutTransaction

- (void)_begin
{
  v24 = self;
  SEL v23 = a2;
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS____TVSSMenuBarDimmingOverlayFadeOutTransaction;
  -[_TVSSMenuBarDimmingOverlayFadeOutTransaction _begin](&v22, "_begin");
  v10 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v24, "animationContext");
  id v21 = -[TVSSMenuBarAnimationContext dimmingView](v10, "dimmingView");

  if (BSFloatIsZero([v21 alpha]))
  {
    int v20 = 1;
  }

  else
  {
    v7 = objc_alloc(&OBJC_CLASS___TVSSPropertyAnimatorTransaction);
    v6 = objc_alloc(&OBJC_CLASS___UICubicTimingParameters);
    sub_10012E53C();
    double v17 = v2;
    double v18 = v3;
    sub_10012E53C();
    v16[1] = v4;
    v16[2] = v5;
    v8 = -[UICubicTimingParameters initWithControlPoint1:controlPoint2:]( v6,  "initWithControlPoint1:controlPoint2:",  v17,  v18,  *(double *)&v4,  *(double *)&v5);
    v19 = -[TVSSPropertyAnimatorTransaction initWithTimingParameters:duration:]( v7,  "initWithTimingParameters:duration:",  0.1);

    v9 = v19;
    v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = sub_10012E78C;
    v15 = &unk_1001B5A60;
    v16[0] = v21;
    -[TVSSPropertyAnimatorTransaction addAnimations:](v9, "addAnimations:", &v11);
    -[_TVSSMenuBarDimmingOverlayFadeOutTransaction addChildTransaction:](v24, "addChildTransaction:", v19);
    objc_storeStrong(v16, 0LL);
    objc_storeStrong((id *)&v19, 0LL);
    int v20 = 0;
  }

  objc_storeStrong(&v21, 0LL);
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

@end