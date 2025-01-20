@interface TVNPBaseRoutingDestinationCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TVNPBaseRoutingDestinationCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVNPBaseRoutingDestinationCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRoutingDestinationCollectionViewCell",  @"musicBarState",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRoutingDestinationCollectionViewCell",  @"deviceType",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRoutingDestinationCollectionViewCell",  @"titleText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPBaseRoutingDestinationCollectionViewCell",  @"subtitleText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingDestinationCollectionViewCell",  @"destination",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingDestination",  @"destinationName",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRoutingDestinationCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"destination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"destinationName"]);

  v5 = accessibilityLocalizedStringForRouteDeviceType((unint64_t)-[TVNPBaseRoutingDestinationCollectionViewCellAccessibility safeUnsignedIntegerForKey:]( self,  "safeUnsignedIntegerForKey:",  @"deviceType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = accessibilityLocalizedString(@"destination.cell.type");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRoutingDestinationCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPBaseRoutingDestinationCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleText"));
  uint64_t v10 = __UIAXStringForVariables(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  return v11;
}

- (id)accessibilityValue
{
  v2 = (char *)-[TVNPBaseRoutingDestinationCollectionViewCellAccessibility safeUnsignedIntegerForKey:]( self,  "safeUnsignedIntegerForKey:",  @"musicBarState");
  if (v2 == (_BYTE *)&dword_0 + 1)
  {
    id v3 = @"music.bar.state.playing";
  }

  else
  {
    if (v2 != (_BYTE *)&dword_0 + 2)
    {
      v5 = 0LL;
      return v5;
    }

    id v3 = @"music.bar.state.paused";
  }

  id v4 = accessibilityLocalizedString(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  return v5;
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(@"destination.cell.hint");
}

@end