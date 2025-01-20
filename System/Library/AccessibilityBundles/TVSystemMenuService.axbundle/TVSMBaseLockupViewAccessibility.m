@interface TVSMBaseLockupViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TVSMBaseLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMBaseLockupView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSUIMonogramVibrantHeaderFooterView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIMonogramVibrantHeaderFooterView",  @"label",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v2 = -[TVSMBaseLockupViewAccessibility _accessibilityDescendantOfType:]( self,  "_accessibilityDescendantOfType:",  AXSafeClassFromString(@"TVSUIMonogramVibrantHeaderFooterView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeUIViewForKey:@"label"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityLabel]);

  return v5;
}

@end