@interface TVMusicAudioTransportBarViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityValue;
@end

@implementation TVMusicAudioTransportBarViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicAudioTransportBarView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicAudioTransportBarView",  @"audioElapsedTimeLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicTransportBarView",  @"rightEdgeTitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicTransportBarView",  @"isLive",  "B",  0);
  [v3 validateClass:@"TVMusicAudioTransportBarView" isKindOfClass:@"TVMusicTransportBarView"];
}

- (id)accessibilityValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicAudioTransportBarViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"audioElapsedTimeLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicAudioTransportBarViewAccessibility safeStringForKey:]( self,  "safeStringForKey:",  @"rightEdgeTitle"));
  if (AXDoesRequestingClientDeserveAutomation())
  {
    uint64_t v6 = (uint64_t)AXDurationForDurationString(v4);
    uint64_t v7 = (uint64_t)AXDurationForDurationString(v5);
    id v8 = accessibilityLocalizedString(@"time.of.track.position");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = AXPositionalStyleDurationStringForDuration((double)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    uint64_t v12 = AXPositionalStyleDurationStringForDuration((double)(v7 + v6));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v11, v13));

LABEL_10:
    goto LABEL_11;
  }

  if (-[TVMusicAudioTransportBarViewAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"isLive"))
  {
    id v15 = accessibilityLocalizedString(@"media.now.playing.live");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
    uint64_t v16 = __UIAXStringForVariables(0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_10;
  }

  if ([v4 length])
  {
    id v17 = accessibilityLocalizedString(@"media.time.elapsed");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v18, v4));

    v27 = v19;
    v28 = @"__AXStringForVariablesSentinel";
    uint64_t v20 = __UIAXStringForVariables(0LL);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v20);
  }

  else
  {
    v14 = 0LL;
  }

  if (objc_msgSend(v5, "length", v27, v28))
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v5 stringByReplacingOccurrencesOfString:@"-" withString:&stru_8CB8]);

    id v22 = accessibilityLocalizedString(@"media.time.remaining");
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v23, v21));

    uint64_t v24 = __UIAXStringForVariables(v14);
    uint64_t v25 = objc_claimAutoreleasedReturnValue(v24);

    v5 = (void *)v21;
    v14 = (void *)v25;
    goto LABEL_10;
  }

@end