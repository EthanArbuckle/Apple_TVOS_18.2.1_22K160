@interface AerialScreenSaverViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
+ (void)videoPlayerViewOnAppear;
@end

@implementation AerialScreenSaverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"IdleScreenUI.AccessibilityAerialScreenSaverView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

+ (void)videoPlayerViewOnAppear
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AerialScreenSaverViewAccessibility;
  objc_msgSendSuper2(&v5, "videoPlayerViewOnAppear");
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  id v3 = accessibilityLocalizedString(@"screen.saver.announcement");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  UIAccessibilityPostNotification(v2, v4);
}

@end