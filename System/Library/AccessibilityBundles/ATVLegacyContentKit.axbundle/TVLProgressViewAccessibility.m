@interface TVLProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TVLProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLProgressView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVLProgressViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"progress"));
  [v2 floatValue];
  float v4 = v3;

  id v5 = accessibilityLocalizedString(@"progress.format");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = AXFormatFloatWithPercentage(0LL, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v8));

  return v9;
}

@end