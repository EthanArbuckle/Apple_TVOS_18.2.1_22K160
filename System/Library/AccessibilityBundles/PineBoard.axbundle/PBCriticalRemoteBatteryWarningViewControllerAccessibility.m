@interface PBCriticalRemoteBatteryWarningViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PBCriticalRemoteBatteryWarningViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBCriticalRemoteBatteryWarningViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PBCriticalRemoteBatteryWarningViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"PBCriticalRemoteBatteryWarningViewController" hasInstanceVariable:@"_alertController" withType:"UIAlertController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewControllerAccessibility;
  -[PBCriticalRemoteBatteryWarningViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v10,  "_accessibilityLoadAccessibilityInformation");
  char v9 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIViewController, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBCriticalRemoteBatteryWarningViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_alertController"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v9) {
    abort();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);

  [v8 setAccessibilityViewIsModal:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBCriticalRemoteBatteryWarningViewControllerAccessibility;
  -[PBCriticalRemoteBatteryWarningViewControllerAccessibility viewDidAppear:](&v6, "viewDidAppear:", a3);
  UIAccessibilityNotifications v3 = UIAccessibilityScreenChangedNotification;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 focusedView]);
  UIAccessibilityPostNotification(v3, v5);
}

@end