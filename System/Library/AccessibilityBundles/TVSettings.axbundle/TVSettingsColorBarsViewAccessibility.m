@interface TVSettingsColorBarsViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSettingsColorBarsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsColorBarsView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitImage;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"tv.color.bars.description");
}

@end