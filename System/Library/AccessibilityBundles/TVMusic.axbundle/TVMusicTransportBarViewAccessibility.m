@interface TVMusicTransportBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldBeIgnored;
- (BOOL)_isAccessibilityExplorerElement;
- (BOOL)accessibilityRespondsToUserInteraction;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TVMusicTransportBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicTransportBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicTransportBarView",  @"elapsedTimeTitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicTransportBarView",  @"rightEdgeTitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicTransportBarView",  @"leftEdgeTitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicTransportBarView",  @"bottomTitle",  "@",  0);
}

- (BOOL)_accessibilityShouldBeIgnored
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  if (-[TVMusicTransportBarViewAccessibility _accessibilityShouldBeIgnored](self, "_accessibilityShouldBeIgnored")) {
    return 0LL;
  }
  id v3 = accessibilityLocalizedString(@"transport.bar.label");
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (id)accessibilityValue
{
  if (-[TVMusicTransportBarViewAccessibility _accessibilityShouldBeIgnored](self, "_accessibilityShouldBeIgnored"))
  {
    id v3 = 0LL;
  }

  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicTransportBarViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"elapsedTimeTitle"));
    if ([v4 length])
    {
      id v5 = accessibilityLocalizedString(@"media.time.elapsed");
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v6, v4));
    }

    else
    {
      v7 = 0LL;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicTransportBarViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"rightEdgeTitle"));
    if ([v8 length])
    {
      id v9 = accessibilityLocalizedString(@"media.time.remaining");
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v8));
    }

    else
    {
      v11 = 0LL;
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicTransportBarViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"leftEdgeTitle"));
    v15 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicTransportBarViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"bottomTitle"));
    uint64_t v13 = __UIAXStringForVariables(v12);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v3;
}

- (BOOL)_isAccessibilityExplorerElement
{
  return 0;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

@end