@interface _TVSSBannerFadeOutBulletinTransaction
- (void)_begin;
- (void)_didFinishWork;
@end

@implementation _TVSSBannerFadeOutBulletinTransaction

- (void)_begin
{
  v16 = self;
  SEL v15 = a2;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS____TVSSBannerFadeOutBulletinTransaction;
  -[_TVSSBannerFadeOutBulletinTransaction _begin](&v14, "_begin");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v16, "animationContext");
  v13 = -[TVSSMenuBarAnimationContext pillView](v2, "pillView");

  v3 = objc_alloc(&OBJC_CLASS___TVSSPropertyAnimatorTransaction);
  id v4 =  +[UISpringTimingParameters tvss_defaultSpringParameters]( &OBJC_CLASS___UISpringTimingParameters,  "tvss_defaultSpringParameters");
  v12 = -[TVSSPropertyAnimatorTransaction initWithSpringTimingParameters:](v3, "initWithSpringTimingParameters:");

  v5 = v12;
  v6 = _NSConcreteStackBlock;
  int v7 = -1073741824;
  int v8 = 0;
  v9 = sub_1001157FC;
  v10 = &unk_1001B5A60;
  v11 = v13;
  -[TVSSPropertyAnimatorTransaction addAnimations:](v5, "addAnimations:");
  -[_TVSSBannerFadeOutBulletinTransaction addChildTransaction:](v16, "addChildTransaction:", v12);
  objc_storeStrong((id *)&v11, 0LL);
  objc_storeStrong((id *)&v12, 0LL);
  objc_storeStrong((id *)&v13, 0LL);
}

- (void)_didFinishWork
{
  int v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVSSBannerFadeOutBulletinTransaction;
  -[_TVSSBannerFadeOutBulletinTransaction _didFinishWork](&v5, "_didFinishWork");
  v2 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v7, "animationContext");
  id v4 = -[TVSSMenuBarAnimationContext pillView](v2, "pillView");

  memcpy(__dst, &CGAffineTransformIdentity, sizeof(__dst));
  -[TVSPPillView setTransform:](v4, "setTransform:", __dst);
  objc_storeStrong((id *)&v4, 0LL);
}

@end