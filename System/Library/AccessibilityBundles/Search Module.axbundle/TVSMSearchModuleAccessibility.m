@interface TVSMSearchModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMSearchModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMSearchModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"search.module.title");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end