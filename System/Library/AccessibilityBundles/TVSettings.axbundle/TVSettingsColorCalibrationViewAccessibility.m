@interface TVSettingsColorCalibrationViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPlayerView;
- (id)accessibilityHeaderElements;
- (void)setCalibrationProgress:(double)a3;
- (void)setCalibrationState:(unint64_t)a3;
@end

@implementation TVSettingsColorCalibrationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsColorCalibrationView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsColorCalibrationView",  @"playerView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsColorCalibrationView",  @"setCalibrationState:",  "v",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSettingsColorCalibrationView",  @"setCalibrationProgress:",  "v",  "d",  0);
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsColorCalibrationViewAccessibility _axPlayerView](self, "_axPlayerView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (id)_axPlayerView
{
  return -[TVSettingsColorCalibrationViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"playerView");
}

- (void)setCalibrationState:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewAccessibility;
  -[TVSettingsColorCalibrationViewAccessibility setCalibrationState:](&v3, "setCalibrationState:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

- (void)setCalibrationProgress:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVSettingsColorCalibrationViewAccessibility;
  -[TVSettingsColorCalibrationViewAccessibility setCalibrationProgress:](&v10, "setCalibrationProgress:");
  id v4 = accessibilityLocalizedString(@"progress.format");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  float v6 = a3;
  uint64_t v7 = AXFormatFloatWithPercentage(0LL, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v8));

  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v9);
}

@end