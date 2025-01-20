@interface TVSSTextContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TVSSTextContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSTextContentView";
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSTextContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

@end