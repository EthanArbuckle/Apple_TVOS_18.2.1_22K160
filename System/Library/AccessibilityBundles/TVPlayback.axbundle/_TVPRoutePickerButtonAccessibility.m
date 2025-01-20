@interface _TVPRoutePickerButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation _TVPRoutePickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVPRoutePickerButton";
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
  return 0;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[_TVPRoutePickerButtonAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"avRoutePickerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"_routePickerButton"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  return v4;
}

- (id)accessibilityValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[_TVPRoutePickerButtonAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"avRoutePickerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"_routePickerButton"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityValue]);

  return v4;
}

@end