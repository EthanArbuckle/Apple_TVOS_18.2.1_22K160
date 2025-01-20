@interface TVSKPlatterlessNonScalingButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSKPlatterlessNonScalingButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSKPlatterlessNonScalingButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return -[TVSKPlatterlessNonScalingButtonAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"isEnabled");
}

- (unint64_t)accessibilityTraits
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVSKPlatterlessNonScalingButtonAccessibility;
  unint64_t v3 = -[TVSKPlatterlessNonScalingButtonAccessibility accessibilityTraits](&v8, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSKPlatterlessNonScalingButtonAccessibility accessibilityIdentifier]( self,  "accessibilityIdentifier"));
  unsigned int v5 = [v4 isEqualToString:@"ChoiceHeaderButton"];

  if (v5) {
    UIAccessibilityTraits v6 = ~UIAccessibilityTraitButton;
  }
  else {
    UIAccessibilityTraits v6 = -1LL;
  }
  return v6 & v3;
}

- (id)accessibilityHint
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSKPlatterlessNonScalingButtonAccessibility accessibilityIdentifier]( self,  "accessibilityIdentifier"));
  unsigned int v4 = [v3 isEqualToString:@"ChoiceHeaderButton"];

  if (v4)
  {
    id v5 = accessibilityLocalizedString(@"choice.header.button.hint");
    UIAccessibilityTraits v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___TVSKPlatterlessNonScalingButtonAccessibility;
    id v7 = -[TVSKPlatterlessNonScalingButtonAccessibility accessibilityHint](&v9, "accessibilityHint");
    UIAccessibilityTraits v6 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }

  return v6;
}

@end