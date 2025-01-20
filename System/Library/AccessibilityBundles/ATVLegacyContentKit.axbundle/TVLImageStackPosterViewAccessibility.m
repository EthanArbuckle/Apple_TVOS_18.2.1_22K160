@interface TVLImageStackPosterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
@end

@implementation TVLImageStackPosterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLImageStackPosterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVLImageStackPosterView" hasInstanceVariable:@"_titleLabel" withType:"TVAnimatedLabel"];
  [v3 validateClass:@"TVLImageStackPosterView" hasInstanceVariable:@"_subtitleLabel" withType:"TVAnimatedLabel"];
  [v3 validateClass:@"TVLImageStackPosterView" hasInstanceVariable:@"_imageStackView" withType:"TVImageStackView"];
  [v3 validateClass:@"TVLImageStackPosterView" hasInstanceVariable:@"_posterElement" withType:"TVLPosterElement"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVLImageStackPosterViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVLImageStackPosterViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);

  char v15 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVLImageStackPosterViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_posterElement"));
  uint64_t v8 = __UIAccessibilitySafeClass(@"TVLPosterElement", v7, 1LL, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v15) {
    abort();
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityLabel]);

  if ([v10 length])
  {
    id v11 = v10;

    v6 = v11;
  }

  uint64_t v12 = __UIAXStringForVariables(v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  return v13;
}

- (id)_accessibilityFrameDelegate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVLImageStackPosterViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_imageStackView"));
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVLImageStackPosterViewAccessibility;
    id v6 = -[TVLImageStackPosterViewAccessibility _accessibilityFrameDelegate](&v9, "_accessibilityFrameDelegate");
    id v5 = (id)objc_claimAutoreleasedReturnValue(v6);
  }

  v7 = v5;

  return v7;
}

@end