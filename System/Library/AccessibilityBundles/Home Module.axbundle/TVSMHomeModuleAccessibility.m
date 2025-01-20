@interface TVSMHomeModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMHomeModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMHomeModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"home.module.title");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end