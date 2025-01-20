@interface TVSSMenuBarViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)presentBannerWithPresentable:(id)a3 completion:(id)a4;
@end

@implementation TVSSMenuBarViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSMenuBarViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)presentBannerWithPresentable:(id)a3 completion:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSSMenuBarViewControllerAccessibility;
  id v5 = a3;
  -[TVSSMenuBarViewControllerAccessibility presentBannerWithPresentable:completion:]( &v8,  "presentBannerWithPresentable:completion:",  v5,  a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "safeUIViewForKey:", @"pillContentView", v8.receiver, v8.super_class));

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);
  if (v7) {
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v7);
  }
}

@end