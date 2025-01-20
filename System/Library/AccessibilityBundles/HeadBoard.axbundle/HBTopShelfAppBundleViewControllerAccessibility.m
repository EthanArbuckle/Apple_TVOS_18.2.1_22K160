@interface HBTopShelfAppBundleViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_axMarkupView;
- (void)viewDidLoad;
@end

@implementation HBTopShelfAppBundleViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBTopShelfAppBundleViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HBTopShelfAppBundleViewController" isKindOfClass:@"UIViewController"];
  [v3 validateProtocol:@"HBUITopShelfContentViewController" hasMethod:@"isContentOccluded" isInstanceMethod:1 isRequired:1];
  [v3 validateClass:@"HBTopShelfAppBundleViewController" conformsToProtocol:@"HBUITopShelfContentViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBTopShelfAppBundleViewControllerAccessibility;
  -[HBTopShelfAppBundleViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v3,  "_accessibilityLoadAccessibilityInformation");
  -[HBTopShelfAppBundleViewControllerAccessibility _axMarkupView](self, "_axMarkupView");
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBTopShelfAppBundleViewControllerAccessibility;
  -[HBTopShelfAppBundleViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[HBTopShelfAppBundleViewControllerAccessibility _axMarkupView](self, "_axMarkupView");
}

- (void)_axMarkupView
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue( -[HBTopShelfAppBundleViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"view"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __63__HBTopShelfAppBundleViewControllerAccessibility__axMarkupView__block_invoke;
  v4[3] = &unk_C4C8;
  objc_copyWeak(&v5, &location);
  [v3 _setAccessibilityElementsHiddenBlock:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

id __63__HBTopShelfAppBundleViewControllerAccessibility__axMarkupView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained safeBoolForKey:@"isContentOccluded"];

  return v2;
}

@end