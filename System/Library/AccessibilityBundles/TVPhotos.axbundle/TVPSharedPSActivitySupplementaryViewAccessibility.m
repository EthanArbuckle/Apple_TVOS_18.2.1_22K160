@interface TVPSharedPSActivitySupplementaryViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVPSharedPSActivitySupplementaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPSharedPSActivitySupplementaryView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSActivitySupplementaryView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSActivitySupplementaryView",  @"descriptionLabel",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSActivitySupplementaryViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSActivitySupplementaryViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"descriptionLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);
  uint64_t v6 = __UIAXStringForVariables(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

@end