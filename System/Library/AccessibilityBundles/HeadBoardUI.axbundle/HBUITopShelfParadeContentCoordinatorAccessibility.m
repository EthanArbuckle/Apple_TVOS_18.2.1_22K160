@interface HBUITopShelfParadeContentCoordinatorAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateActionsDetailsViewAlpha;
@end

@implementation HBUITopShelfParadeContentCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBUITopShelfParadeContentCoordinator";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_updateActionsDetailsViewAlpha
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___HBUITopShelfParadeContentCoordinatorAccessibility;
  -[HBUITopShelfParadeContentCoordinatorAccessibility _updateActionsDetailsViewAlpha]( &v2,  "_updateActionsDetailsViewAlpha");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

@end