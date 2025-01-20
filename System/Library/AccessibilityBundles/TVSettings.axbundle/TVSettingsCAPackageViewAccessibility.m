@interface TVSettingsCAPackageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_axRootLayer;
- (id)accessibilityLabel;
- (unint64_t)_axCurrentState;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSettingsCAPackageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsCAPackageView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSettingsCAPackageView" isKindOfClass:@"UIView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsColorCalibrationView",  @"currentState",  "Q",  0);
  [v3 validateClass:@"TVSettingsCAPackageView" hasInstanceVariable:@"_rootLayer" withType:"CALayer"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"CATextLayer",  @"string",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  unint64_t v3 = -[TVSettingsCAPackageViewAccessibility _axCurrentState](self, "_axCurrentState");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCAPackageViewAccessibility _axRootLayer](self, "_axRootLayer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sublayers]);

  v6 = 0LL;
  switch(v3)
  {
    case 1uLL:
    case 0xAuLL:
      v7 = (void *)objc_claimAutoreleasedReturnValue([v5 axSafeObjectAtIndex:1]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sublayers]);
      v6 = (void *)objc_claimAutoreleasedReturnValue([v8 axSafeObjectAtIndex:0]);

      break;
    case 2uLL:
      v9 = v5;
      uint64_t v10 = 2LL;
      goto LABEL_6;
    case 3uLL:
      v9 = v5;
      uint64_t v10 = 3LL;
      goto LABEL_6;
    case 8uLL:
      v9 = v5;
      uint64_t v10 = 4LL;
LABEL_6:
      v6 = (void *)objc_claimAutoreleasedReturnValue([v9 axSafeObjectAtIndex:v10]);
      break;
    default:
      break;
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v6 sublayers]);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ax_flatMappedArrayUsingBlock:", &__block_literal_global));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "componentsJoinedByString:", @", "));
  return v13;
}

id __58__TVSettingsCAPackageViewAccessibility_accessibilityLabel__block_invoke(id a1, CALayer *a2)
{
  v2 = a2;
  uint64_t v3 = AXSafeClassFromString(@"CATextLayer");
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CALayer safeValueForKey:](v2, "safeValueForKey:", @"string"));
  }
  else {
    v4 = 0LL;
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (id)_axRootLayer
{
  return -[TVSettingsCAPackageViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"rootLayer");
}

- (unint64_t)_axCurrentState
{
  char v10 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIView, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsCAPackageViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"superview"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v10) {
    abort();
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 safeValueForKey:@"_currentState"]);
  id v8 = [v7 integerValue];

  return (unint64_t)v8;
}

@end