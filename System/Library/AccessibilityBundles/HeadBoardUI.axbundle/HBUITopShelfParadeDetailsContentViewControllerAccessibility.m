@interface HBUITopShelfParadeDetailsContentViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation HBUITopShelfParadeDetailsContentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBUITopShelfParadeDetailsContentViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___HBUITopShelfParadeDetailsContentViewControllerAccessibility;
  -[HBUITopShelfParadeDetailsContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[HBUITopShelfParadeDetailsContentViewControllerAccessibility safeUIViewForKey:]( self,  "safeUIViewForKey:",  @"view"));
  [v3 setAccessibilityViewIsModal:1];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBUITopShelfParadeDetailsContentViewControllerAccessibility;
  -[HBUITopShelfParadeDetailsContentViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[HBUITopShelfParadeDetailsContentViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end