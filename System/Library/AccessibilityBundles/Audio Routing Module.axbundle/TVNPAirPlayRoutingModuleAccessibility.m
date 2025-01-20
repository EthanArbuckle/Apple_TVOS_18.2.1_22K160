@interface TVNPAirPlayRoutingModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVNPAirPlayRoutingModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVNPAirPlayRoutingModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPAirPlayRoutingModule",  @"routingController",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPGroupableRoutingController",  @"systemOutputRouteName",  "@",  0);
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPAirPlayRoutingModuleAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_routingController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"_systemOutputRouteName"]);

  id v4 = accessibilityLocalizedString(@"airplay.routing.module.title");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v3));

  return v6;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end