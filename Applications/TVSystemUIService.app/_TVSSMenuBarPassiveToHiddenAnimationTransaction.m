@interface _TVSSMenuBarPassiveToHiddenAnimationTransaction
- (void)_begin;
@end

@implementation _TVSSMenuBarPassiveToHiddenAnimationTransaction

- (void)_begin
{
  v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____TVSSMenuBarPassiveToHiddenAnimationTransaction;
  -[_TVSSMenuBarPassiveToHiddenAnimationTransaction _begin](&v5, "_begin");
  v2 = objc_alloc(&OBJC_CLASS____TVSSMenuBarFadeAndZoomOutMenuBarTransaction);
  v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v7, "animationContext");
  v4 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v2,  "initWithAnimationContext:animated:",  v3,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v7, "animated"));

  -[_TVSSMenuBarPassiveToHiddenAnimationTransaction addChildTransaction:withSchedulingPolicy:]( v7,  "addChildTransaction:withSchedulingPolicy:",  v4,  0LL);
  objc_storeStrong((id *)&v4, 0LL);
}

@end