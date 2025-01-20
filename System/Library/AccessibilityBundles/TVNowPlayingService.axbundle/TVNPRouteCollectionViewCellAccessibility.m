@interface TVNPRouteCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_axVolumeSliderIsVisible;
- (id)accessibilityValue;
@end

@implementation TVNPRouteCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVNPRouteCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRouteCollectionViewCell",  @"route",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoute",  @"canBeGrouped",  "B",  0);
}

- (id)accessibilityValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVNPRouteCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"route"));
  if ([v3 safeBoolForKey:@"canBeGrouped"])
  {
    unsigned __int8 v4 = -[TVNPRouteCollectionViewCellAccessibility _axVolumeSliderIsVisible](self, "_axVolumeSliderIsVisible");

    if ((v4 & 1) == 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)&OBJC_CLASS___TVNPRouteCollectionViewCellAccessibility;
      id v5 = -[TVNPRouteCollectionViewCellAccessibility accessibilityValue](&v14, "accessibilityValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      id v7 = accessibilityLocalizedString(@"audio.route.is.multiroute");
      v12 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v8 = __UIAXStringForVariables(v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

      return v9;
    }
  }

  else
  {
  }

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVNPRouteCollectionViewCellAccessibility;
  id v11 = -[TVNPRouteCollectionViewCellAccessibility accessibilityValue](&v13, "accessibilityValue");
  return (id)objc_claimAutoreleasedReturnValue(v11);
}

- (BOOL)_axVolumeSliderIsVisible
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPRouteCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"volumeSliderView"));
  unsigned __int8 v3 = [v2 _accessibilityViewIsVisible];

  return v3;
}

@end