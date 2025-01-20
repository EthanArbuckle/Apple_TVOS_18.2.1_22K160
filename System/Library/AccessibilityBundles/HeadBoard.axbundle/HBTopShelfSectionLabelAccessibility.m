@interface HBTopShelfSectionLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation HBTopShelfSectionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBTopShelfSectionLabel";
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

- (id)accessibilityLabel
{
  char v9 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HBTopShelfSectionLabelAccessibility safeValueForKey:](self, "safeValueForKey:", @"textLabel"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v9) {
    abort();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);

  return v7;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

@end