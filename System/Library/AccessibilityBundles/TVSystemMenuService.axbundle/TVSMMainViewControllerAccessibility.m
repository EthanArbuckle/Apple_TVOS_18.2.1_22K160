@interface TVSMMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldSpeakExplorerElementsAfterFocus;
- (BOOL)dismissTeachableMomentIfNeeded;
- (TVSMMainViewControllerAccessibility)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_showTeachableMoment;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation TVSMMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMMainViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSMMainViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMMainViewController",  @"gridContainerViewController",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMMainViewController",  @"_showTeachableMoment",  "v",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMMainViewController",  @"dismissTeachableMomentIfNeeded",  "B",  0);
}

- (BOOL)_accessibilityShouldSpeakExplorerElementsAfterFocus
{
  return 0;
}

- (TVSMMainViewControllerAccessibility)initWithNibName:(id)a3 bundle:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSMMainViewControllerAccessibility;
  v4 = -[TVSMMainViewControllerAccessibility initWithNibName:bundle:](&v6, "initWithNibName:bundle:", a3, a4);
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, &stru_4388);

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSMMainViewControllerAccessibility;
  -[TVSMMainViewControllerAccessibility viewDidAppear:](&v4, "viewDidAppear:", a3);
  dispatch_time_t v3 = dispatch_time(0LL, 600000000LL);
  dispatch_after(v3, &_dispatch_main_q, &__block_literal_global_0);
}

void __53__TVSMMainViewControllerAccessibility_viewDidAppear___block_invoke(id a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[UIWindowScene safeValueForKey:]( &OBJC_CLASS___UIWindowScene,  "safeValueForKey:",  @"focusSystem"));
  char v8 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIFocusSystem, v2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, v1, 1LL, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v8) {
    abort();
  }
  objc_super v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 focusedItem]);

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v7);
}

- (void)_showTeachableMoment
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSMMainViewControllerAccessibility;
  -[TVSMMainViewControllerAccessibility _showTeachableMoment](&v10, "_showTeachableMoment");
  char v9 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIViewController, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSMMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"gridContainerViewController"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v9) {
    abort();
  }
  char v8 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
  [v8 setAccessibilityElementsHidden:1];
}

- (BOOL)dismissTeachableMomentIfNeeded
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVSMMainViewControllerAccessibility;
  BOOL v3 = -[TVSMMainViewControllerAccessibility dismissTeachableMomentIfNeeded](&v12, "dismissTeachableMomentIfNeeded");
  char v11 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIViewController, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVSMMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"gridContainerViewController"));
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v11);
  char v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v11) {
    abort();
  }
  char v9 = (void *)objc_claimAutoreleasedReturnValue([v8 view]);
  [v9 setAccessibilityElementsHidden:0];

  return v3;
}

@end