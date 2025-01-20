@interface HBUITopShelfHostViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setViewController:(id)a3 withAnimationDirection:(int64_t)a4;
@end

@implementation HBUITopShelfHostViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBUITopShelfHostViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)setViewController:(id)a3 withAnimationDirection:(int64_t)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HBUITopShelfHostViewControllerAccessibility;
  -[HBUITopShelfHostViewControllerAccessibility setViewController:withAnimationDirection:]( &v4,  "setViewController:withAnimationDirection:",  a3,  a4);
  AXPerformBlockOnMainThreadAfterDelay(&__block_literal_global, 0.5);
}

void __88__HBUITopShelfHostViewControllerAccessibility_setViewController_withAnimationDirection___block_invoke( id a1)
{
}

@end