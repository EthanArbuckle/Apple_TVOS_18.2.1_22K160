@interface HBUITopShelfParadeButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HBUITopShelfParadeButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBUITopShelfParadeButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBUITopShelfParadeButtonAccessibility;
  return UIAccessibilityTraitButton | -[HBUITopShelfParadeButtonAccessibility accessibilityTraits]( &v3,  "accessibilityTraits");
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[HBUITopShelfParadeButtonAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

@end