@interface TVSUIProfilePictureMonogramViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSUIProfilePictureMonogramViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSUIProfilePictureMonogramView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIProfilePictureMonogramView",  @"vibrantFooterView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSUIMonogramVibrantHeaderFooterView",  @"label",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSUIProfilePictureMonogramViewAccessibility safeValueForKeyPath:]( self,  "safeValueForKeyPath:",  @"vibrantFooterView.label"));
  uint64_t v3 = __UIAXStringForVariables(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  return v4;
}

- (unint64_t)accessibilityTraits
{
  UIAccessibilityTraits v2 = UIAccessibilityTraitButton;
  unsigned int v3 = -[TVSUIProfilePictureMonogramViewAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"showSelection");
  UIAccessibilityTraits v4 = UIAccessibilityTraitSelected;
  if (!v3) {
    UIAccessibilityTraits v4 = 0LL;
  }
  return v4 | v2;
}

@end