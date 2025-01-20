@interface _TVSSMenuBarBaseBannerAnimationTransaction
- (BOOL)_canBeInterrupted;
- (void)_begin;
- (void)_willBegin;
@end

@implementation _TVSSMenuBarBaseBannerAnimationTransaction

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction;
  -[_TVSSMenuBarBaseBannerAnimationTransaction _begin](&v2, "_begin");
  if (-[_TVSSMenuBarAbstractAnimationTransaction isBannerTransaction](v4, "isBannerTransaction")) {
    sub_1000488A0(v4);
  }
  else {
    sub_100048B10(v4);
  }
}

- (void)_willBegin
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____TVSSMenuBarBaseBannerAnimationTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willBegin](&v8, "_willBegin");
  v6 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v5 = -[TVSSMenuBarAnimationContext currentBannerContext](v6, "currentBannerContext");
  id location = -[TVSSMenuModeBannerContext transitioningBannerPresentable](v5, "transitioningBannerPresentable");

  if (-[_TVSSMenuBarAbstractAnimationTransaction isBannerTransaction](v10, "isBannerTransaction")
    && TVSSBannerPresentableAppearsInsidePillView(location))
  {
    if (sub_100048BC8(v10))
    {
      if ((objc_opt_respondsToSelector(location, "presentableWillAppearAsBanner:") & 1) != 0) {
        [location presentableWillAppearAsBanner:location];
      }
    }

    else if (sub_100048CB0(v10) {
           && (objc_opt_respondsToSelector(location, "presentableWillDisappearAsBanner:withReason:") & 1) != 0)
    }
    {
      v4 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
      SEL v3 = -[TVSSMenuBarAnimationContext currentBannerContext](v4, "currentBannerContext");
      objc_super v2 = -[TVSSMenuModeBannerContext dismissalReason](v3, "dismissalReason");
      objc_msgSend(location, "presentableWillDisappearAsBanner:withReason:", location);
    }
  }

  objc_storeStrong(&location, 0LL);
}

@end