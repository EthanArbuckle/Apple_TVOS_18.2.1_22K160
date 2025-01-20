@interface TVPRoundButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVPRoundButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPRoundButton";
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
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVPRoundButtonAccessibility;
  return (UIAccessibilityTraitButton | -[TVPRoundButtonAccessibility accessibilityTraits](&v3, "accessibilityTraits")) & ~UIAccessibilityTraitSelected;
}

- (id)accessibilityValue
{
  else {
    return accessibilityLocalizedString(@"button.off.value");
  }
}

@end