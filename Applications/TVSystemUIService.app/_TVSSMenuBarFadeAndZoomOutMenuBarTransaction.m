@interface _TVSSMenuBarFadeAndZoomOutMenuBarTransaction
- (void)_begin;
- (void)_didFinishWork;
@end

@implementation _TVSSMenuBarFadeAndZoomOutMenuBarTransaction

- (void)_begin
{
  v21 = self;
  SEL v20 = a2;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeAndZoomOutMenuBarTransaction;
  -[_TVSSMenuBarFadeAndZoomOutMenuBarTransaction _begin](&v19, "_begin");
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v21, "animationContext");
  char v17 = 0;
  BOOL v8 = 1;
  if (-[TVSSMenuBarAnimationContext menuMode](v7, "menuMode"))
  {
    v18 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v21, "animationContext");
    char v17 = 1;
    BOOL v8 = (id)-[TVSSMenuBarAnimationContext menuMode](v18, "menuMode") == (id)4;
  }

  if ((v17 & 1) != 0) {

  }
  if (!v8)
  {
    v6 = +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler");
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( v6,  "handleFailureInMethod:object:file:lineNumber:description:",  v20,  v21,  @"_TVSSMenuBarFadeAndZoomMenuBarTransaction.m",  27LL,  @"_TVSSMenuBarFadeAndZoomOutMenuBarTransaction should only be used to enter the hidden or privacy state");
  }

  v2 = objc_alloc(&OBJC_CLASS___TVSSPropertyAnimatorTransaction);
  id v3 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v16 = -[TVSSPropertyAnimatorTransaction initWithSpringTimingParameters:](v2, "initWithSpringTimingParameters:");

  v4 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v21, "animationContext");
  v15 = -[TVSSMenuBarAnimationContext pillView](v4, "pillView");

  v5 = v16;
  v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  v12 = sub_100091114;
  v13 = &unk_1001B5A60;
  v14 = v15;
  -[TVSSPropertyAnimatorTransaction addAnimations:](v5, "addAnimations:", &v9);
  -[_TVSSMenuBarFadeAndZoomOutMenuBarTransaction addChildTransaction:](v21, "addChildTransaction:", v16);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong((id *)&v15, 0LL);
  objc_storeStrong((id *)&v16, 0LL);
}

- (void)_didFinishWork
{
  int v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____TVSSMenuBarFadeAndZoomOutMenuBarTransaction;
  -[_TVSSMenuBarFadeAndZoomOutMenuBarTransaction _didFinishWork](&v8, "_didFinishWork");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v7 = -[TVSSMenuBarAnimationContext pillContentViewProvider](v2, "pillContentViewProvider");

  -[TVSSPillContentViewProvider setMode:](v7, "setMode:");
  id v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v6 = -[TVSSMenuBarAnimationContext pillView](v3, "pillView");

  v5 = -[TVSSPillContentViewProvider contentView](v7, "contentView");
  -[TVSPPillView setContentView:withTransition:](v6, "setContentView:withTransition:", v5, 0LL);
  -[TVSPPillView setContentStylingHidden:](v6, "setContentStylingHidden:", 1LL);
  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  -[TVSPPillView setTransform:](v6, "setTransform:", __dst);
  objc_storeStrong((id *)&v5, 0LL);
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
}

@end