@interface TVSettingsSignalStrengthCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TVSettingsSignalStrengthCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsSignalStrengthCell";
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
  return accessibilityLocalizedString(@"wifi.signal.strength.title");
}

- (id)accessibilityValue
{
  unint64_t v3 = (uint64_t)v2 - 1;
  if (v3 > 4) {
    v4 = @"wifi.signal.strength.zero.bars";
  }
  else {
    v4 = *(&off_81F0 + v3);
  }
  id v5 = accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

@end