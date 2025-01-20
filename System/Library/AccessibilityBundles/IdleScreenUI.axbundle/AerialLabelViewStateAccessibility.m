@interface AerialLabelViewStateAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)accessibilityShow:(id)a3;
@end

@implementation AerialLabelViewStateAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IdleScreenUI.AccessibilityAerialLabelViewState";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (void)accessibilityShow:(id)a3
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___AerialLabelViewStateAccessibility;
  id v3 = a3;
  objc_msgSendSuper2(&v4, "accessibilityShow:", v3);
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v3);
}

@end