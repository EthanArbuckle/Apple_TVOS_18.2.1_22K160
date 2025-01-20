@interface TVSMSleepModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMSleepModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMSleepModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"sleep.module.title");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end