@interface __TVSSMenuBarSetPrivacyModeTransaction
- (void)_begin;
@end

@implementation __TVSSMenuBarSetPrivacyModeTransaction

- (void)_begin
{
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____TVSSMenuBarSetPrivacyModeTransaction;
  -[__TVSSMenuBarSetPrivacyModeTransaction _begin](&v7, "_begin");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v9, "animationContext");
  v6 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v2, "pillContentViewProvider");

  -[TVSSPillContentViewProvider setMode:](v6, "setMode:", 4LL);
  v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v9, "animationContext");
  v5 = -[TVSSMenuBarAnimationContext pillView](v3, "pillView");

  v4 = -[TVSSPillContentViewProvider contentView](v6, "contentView");
  -[TVSPPillView setContentView:withTransition:](v5, "setContentView:withTransition:", v4, 0LL);
  -[TVSPPillView setContentStylingHidden:](v5, "setContentStylingHidden:", 1LL);
  -[TVSPPillView setAlpha:](v5, "setAlpha:", 1.0);
  objc_storeStrong((id *)&v4, 0LL);
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
}

@end