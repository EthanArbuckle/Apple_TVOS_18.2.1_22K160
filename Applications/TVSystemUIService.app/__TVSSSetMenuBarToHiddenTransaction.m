@interface __TVSSSetMenuBarToHiddenTransaction
- (void)_begin;
@end

@implementation __TVSSSetMenuBarToHiddenTransaction

- (void)_begin
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS_____TVSSSetMenuBarToHiddenTransaction;
  -[__TVSSSetMenuBarToHiddenTransaction _begin](&v8, "_begin");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v7 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v2, "pillContentViewProvider");

  -[TVSSPillContentViewProvider setMode:](v7, "setMode:");
  v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v6 = -[TVSSMenuBarAnimationContext pillView](v3, "pillView");

  v5 = -[TVSSPillContentViewProvider contentView](v7, "contentView");
  -[TVSPPillView setContentView:withTransition:](v6, "setContentView:withTransition:", v5, 0LL);
  -[TVSPPillView setContentStylingHidden:](v6, "setContentStylingHidden:", 1LL);
  id v4 = -[TVSPPillView superview](v6, "superview");
  [v4 layoutIfNeeded];

  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
}

@end