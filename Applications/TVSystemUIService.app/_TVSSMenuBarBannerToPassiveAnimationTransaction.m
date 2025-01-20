@interface _TVSSMenuBarBannerToPassiveAnimationTransaction
- (void)_begin;
@end

@implementation _TVSSMenuBarBannerToPassiveAnimationTransaction

- (void)_begin
{
  v13 = self;
  SEL v12 = a2;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS____TVSSMenuBarBannerToPassiveAnimationTransaction;
  -[_TVSSMenuBarBannerToPassiveAnimationTransaction _begin](&v11, "_begin");
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v13, "animationContext");
  v6 = -[TVSSMenuBarAnimationContext currentBannerContext](v7, "currentBannerContext");
  id v10 = -[TVSSMenuModeBannerContext transitioningBannerPresentable](v6, "transitioningBannerPresentable");

  if (TVSSBannerPresentableAppearsInsidePillView(v10))
  {
    v4 = objc_alloc(&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction);
    v5 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v13, "animationContext");
    v9 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v4,  "initWithAnimationContext:animated:",  v5,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v13, "animated"));

    -[_TVSSMenuBarBannerToPassiveAnimationTransaction addChildTransaction:](v13, "addChildTransaction:", v9);
    objc_storeStrong((id *)&v9, 0LL);
  }

  else
  {
    v2 = objc_alloc(&OBJC_CLASS____TVSSBannerDismissToastFadeInMenuTransaction);
    v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v13, "animationContext");
    v8 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v2,  "initWithAnimationContext:animated:",  v3,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v13, "animated"));

    -[_TVSSMenuBarBannerToPassiveAnimationTransaction addChildTransaction:](v13, "addChildTransaction:", v8);
    objc_storeStrong((id *)&v8, 0LL);
  }

  objc_storeStrong(&v10, 0LL);
}

@end