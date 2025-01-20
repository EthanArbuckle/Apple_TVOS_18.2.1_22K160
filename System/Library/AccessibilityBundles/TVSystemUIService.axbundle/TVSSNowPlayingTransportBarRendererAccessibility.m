@interface TVSSNowPlayingTransportBarRendererAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSSNowPlayingTransportBarRendererAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSNowPlayingTransportBarRenderer";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSNowPlayingTransportBarRenderer",  @"elapsedTimeLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSNowPlayingTransportBarRenderer",  @"remainingTimeLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSNowPlayingTransportBarRenderer",  @"liveLabel",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSNowPlayingTransportBarRendererAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"elapsedTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSNowPlayingTransportBarRendererAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"remainingTimeLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);

  uint64_t v7 = (uint64_t)AXDurationForDurationString(v4);
  uint64_t v8 = (uint64_t)AXDurationForDurationString(v6);
  id v9 = accessibilityLocalizedString(@"time.of.track.position");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = AXPositionalStyleDurationStringForDuration((double)v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  uint64_t v13 = AXPositionalStyleDurationStringForDuration((double)(v8 + v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v10, v12, v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSNowPlayingTransportBarRendererAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"liveLabel"));
  LODWORD(v10) = [v16 _accessibilityViewIsVisible];

  if ((_DWORD)v10)
  {
    id v17 = accessibilityLocalizedString(@"media.now.playing.live");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v17);
    uint64_t v18 = __UIAXStringForVariables(v15);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

    v15 = (void *)v19;
  }

  return v15;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

@end