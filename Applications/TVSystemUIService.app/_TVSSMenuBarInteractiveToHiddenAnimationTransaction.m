@interface _TVSSMenuBarInteractiveToHiddenAnimationTransaction
- (void)_begin;
@end

@implementation _TVSSMenuBarInteractiveToHiddenAnimationTransaction

- (void)_begin
{
  v10 = self;
  SEL v9 = a2;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____TVSSMenuBarInteractiveToHiddenAnimationTransaction;
  -[_TVSSMenuBarInteractiveToHiddenAnimationTransaction _begin](&v8, "_begin");
  v2 = objc_alloc(&OBJC_CLASS____TVSSMenuBarFadeOutMenuBarTransaction);
  v3 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v7 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v2,  "initWithAnimationContext:animated:",  v3,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v10, "animated"));

  -[_TVSSMenuBarInteractiveToHiddenAnimationTransaction addChildTransaction:withSchedulingPolicy:]( v10,  "addChildTransaction:withSchedulingPolicy:",  v7);
  v4 = objc_alloc(&OBJC_CLASS____TVSSMenuBarDismissPanelTransaction);
  v5 = -[_TVSSMenuBarAbstractAnimationTransaction animationContext](v10, "animationContext");
  v6 = -[_TVSSMenuBarAbstractAnimationTransaction initWithAnimationContext:animated:]( v4,  "initWithAnimationContext:animated:",  v5,  -[_TVSSMenuBarAbstractAnimationTransaction animated](v10, "animated"));

  -[_TVSSMenuBarInteractiveToHiddenAnimationTransaction addChildTransaction:withSchedulingPolicy:]( v10,  "addChildTransaction:withSchedulingPolicy:",  v6,  0LL);
  objc_storeStrong((id *)&v6, 0LL);
  objc_storeStrong((id *)&v7, 0LL);
}

@end