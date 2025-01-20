@interface SATVCyclingHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)didFinishAnimationPulsingAnimation:(id)a3;
@end

@implementation SATVCyclingHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVCyclingHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)didFinishAnimationPulsingAnimation:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVCyclingHeaderViewAccessibility;
  -[SATVCyclingHeaderViewAccessibility didFinishAnimationPulsingAnimation:]( &v3,  "didFinishAnimationPulsingAnimation:",  a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

@end