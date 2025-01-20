@interface SATVRemoteViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_startProximityPairing;
@end

@implementation SATVRemoteViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVRemoteViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_startProximityPairing
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SATVRemoteViewControllerAccessibility;
  -[SATVRemoteViewControllerAccessibility _startProximityPairing](&v2, "_startProximityPairing");
  AXPerformBlockOnMainThreadAfterDelay(&__block_literal_global, 0.3);
}

@end