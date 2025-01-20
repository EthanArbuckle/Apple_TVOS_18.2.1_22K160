@interface _TVSSMenuBarBasicAnimationTransaction
- (void)_begin;
@end

@implementation _TVSSMenuBarBasicAnimationTransaction

- (void)_begin
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____TVSSMenuBarBasicAnimationTransaction;
  -[_TVSSMenuBarBasicAnimationTransaction _begin](&v14, "_begin");
  v4 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v16, "animationContext");
  v13 = -[TVSSMenuBarAnimationContext pillView](v4, "pillView");

  v5 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v16, "animationContext");
  id v12 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v5, "pillContentViewProvider");

  v6 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v16, "animationContext");
  objc_msgSend(v12, "setMode:", -[TVSSMenuBarAnimationContext menuMode](v6, "menuMode"));

  id location = [v12 contentView];
  -[TVSPPillView setContentView:withTransition:](v13, "setContentView:withTransition:", location, 1LL);
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v16, "animationContext");
  char HasBackgroundForMode = TVSSMenuBarHasBackgroundForMode(-[TVSSMenuBarAnimationContext menuMode](v7, "menuMode"));

  -[TVSPPillView setContentStylingHidden:](v13, "setContentStylingHidden:", !(HasBackgroundForMode & 1));
  v9 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v16, "animationContext");
  BOOL v10 = (id)-[TVSSMenuBarAnimationContext menuMode](v9, "menuMode") != (id)4;

  if (v10)
  {
    double v2 = 0.0;
    if ((HasBackgroundForMode & 1) != 0) {
      double v2 = 1.0;
    }
    -[TVSPPillView setAlpha:](v13, "setAlpha:", v2);
  }

  else
  {
    -[TVSPPillView setAlpha:](v13, "setAlpha:", 1.0);
  }

  -[TVSPPillView layoutIfNeeded](v13, "layoutIfNeeded", &v13);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(v3, 0LL);
}

@end