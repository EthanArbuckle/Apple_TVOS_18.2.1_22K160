@interface TVNPNowPlayingSliderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_panUpdated:(id)a3;
@end

@implementation TVNPNowPlayingSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVNPNowPlayingSliderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPNowPlayingSliderView",  @"_panUpdated:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPNowPlayingSliderView",  @"value",  "f",  0);
}

- (void)_panUpdated:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVNPNowPlayingSliderViewAccessibility;
  id v4 = a3;
  -[TVNPNowPlayingSliderViewAccessibility _panUpdated:](&v13, "_panUpdated:", v4);
  v5 = (char *)[v4 state];

  if (v5 == (_BYTE *)&dword_0 + 3)
  {
    -[TVNPNowPlayingSliderViewAccessibility safeFloatForKey:](self, "safeFloatForKey:", @"value");
    float v7 = v6;
    id v8 = accessibilityLocalizedString(@"volume.level.description");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    uint64_t v10 = AXFormatFloatWithPercentage(0LL, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v9, v11));

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v12);
  }

@end