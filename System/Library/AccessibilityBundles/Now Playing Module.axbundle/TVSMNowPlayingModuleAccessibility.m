@interface TVSMNowPlayingModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMNowPlayingModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMNowPlayingModule";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMNowPlayingModule",  @"buttonViewController",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMButtonViewController",  @"titleText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMButtonViewController",  @"secondaryText",  "@",  0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"now.playing.module.title");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSMNowPlayingModuleAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"buttonViewController"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"titleText"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"secondaryText"]);
  uint64_t v4 = __UIAXStringForVariables(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return v5;
}

@end