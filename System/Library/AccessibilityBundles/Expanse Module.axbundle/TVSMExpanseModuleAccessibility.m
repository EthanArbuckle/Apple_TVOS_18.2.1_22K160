@interface TVSMExpanseModuleAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSMExpanseModuleAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMExpanseModule";
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
  [v3 validateClass:@"TVCSExpanseContext"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCSExpanseContext",  @"currentActiveConversation",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TUConversation",  @"displayName",  "@",  0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"expanse.module.title");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSMExpanseModuleAccessibility safeValueForKey:](self, "safeValueForKey:", @"buttonVC"));
  id v3 = [(id)AXSafeClassFromString(@"TVCSExpanseContext") safeValueForKeyPath:@"sharedContext.currentActiveConversation"];
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"displayName"]);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if ([v5 length])
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"titleText"]);
    [v6 axSafelyAddObject:v7];
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"secondaryText"]);
  [v6 axSafelyAddObject:v8];

  uint64_t v9 = UIAXLabelForElements(v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

@end