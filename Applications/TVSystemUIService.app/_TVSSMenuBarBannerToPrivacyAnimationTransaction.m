@interface _TVSSMenuBarBannerToPrivacyAnimationTransaction
- (void)_begin;
@end

@implementation _TVSSMenuBarBannerToPrivacyAnimationTransaction

- (void)_begin
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____TVSSMenuBarBannerToPrivacyAnimationTransaction;
  -[_TVSSMenuBarBannerToPrivacyAnimationTransaction _begin](&v8, "_begin");
  v5 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v4 = -[TVSSMenuBarAnimationContext currentBannerContext](v5, "currentBannerContext");
  id v7 = -[TVSSMenuModeBannerContext transitioningBannerPresentable](v4, "transitioningBannerPresentable");

  if (TVSSBannerPresentableAppearsInsidePillView(v7))
  {
    sub_100131A28(v10);
  }

  else
  {
    v2 = objc_alloc(&OBJC_CLASS____TVSSBannerDismissToastFadeInMenuTransaction);
    v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
    v6 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v2,  "initWithAnimationContext:animated:",  v3,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v10, "animated"));

    -[_TVSSMenuBarBannerToPrivacyAnimationTransaction addChildTransaction:](v10, "addChildTransaction:", v6);
    objc_storeStrong((id *)&v6, 0LL);
  }

  objc_storeStrong(&v7, 0LL);
}

@end