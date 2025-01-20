@interface _TVSSMenuBarFadeOutMenuBarTransaction
- (BOOL)_canBeInterrupted;
- (void)_begin;
- (void)_didFinishWork;
- (void)_willFailWithReason:(id)a3;
- (void)_willInterruptWithReason:(id)a3;
@end

@implementation _TVSSMenuBarFadeOutMenuBarTransaction

- (void)_begin
{
  v6 = self;
  SEL v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeOutMenuBarTransaction;
  -[_TVSSMenuBarFadeOutMenuBarTransaction _begin](&v4, "_begin");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v6, "animationContext");
  unint64_t v3 = -[TVSSMenuBarAnimationContext menuMode](v2, "menuMode");

  if (!v3) {
    sub_100006588(v6);
  }
}

- (BOOL)_canBeInterrupted
{
  unint64_t v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](self, "animationContext");
  BOOL v4 = (id)-[TVSSMenuBarAnimationContext menuMode](v3, "menuMode") != (id)4;

  return v4;
}

- (void)_didFinishWork
{
  v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeOutMenuBarTransaction;
  -[_TVSSMenuBarFadeOutMenuBarTransaction _didFinishWork](&v13, "_didFinishWork");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v15, "animationContext");
  v12 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v2, "pillContentViewProvider");

  unint64_t v3 = v12;
  BOOL v4 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v15, "animationContext");
  -[TVSSPillContentViewProvider setMode:](v3, "setMode:", -[TVSSMenuBarAnimationContext menuMode](v4, "menuMode"));

  v11 = -[TVSSPillContentViewProvider contentView](v12, "contentView");
  SEL v5 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v15, "animationContext");
  char HasBackgroundForMode = TVSSMenuBarHasBackgroundForMode(-[TVSSMenuBarAnimationContext menuMode](v5, "menuMode"));

  char v10 = HasBackgroundForMode & 1;
  BOOL v9 = !(HasBackgroundForMode & 1);
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v15, "animationContext");
  v8 = -[TVSSMenuBarAnimationContext pillView](v7, "pillView");

  -[TVSPPillView setContentView:withTransition:](v8, "setContentView:withTransition:", v11, 0LL);
  -[TVSPPillView setContentStylingHidden:](v8, "setContentStylingHidden:", v9);
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
}

- (void)_willInterruptWithReason:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeOutMenuBarTransaction;
  -[_TVSSMenuBarFadeOutMenuBarTransaction _willInterruptWithReason:](&v3, "_willInterruptWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void)_willFailWithReason:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[UIViewPropertyAnimator stopAnimation:](v5->_fadeAnimator, "stopAnimation:", 1LL);
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeOutMenuBarTransaction;
  -[_TVSSMenuBarAbstractAnimationTransaction _willFailWithReason:](&v3, "_willFailWithReason:", location[0]);
  objc_storeStrong(location, 0LL);
}

- (void).cxx_destruct
{
}

@end