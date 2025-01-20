@interface TVSSNowPlayingControlPlayPauseButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)setPackageState:(unint64_t)a3;
@end

@implementation TVSSNowPlayingControlPlayPauseButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSNowPlayingControlPlayPauseButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSNowPlayingControlPlayPauseButton",  @"packageState",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSNowPlayingControlPlayPauseButton",  @"setPackageState:",  "v",  "Q",  0);
}

- (id)accessibilityLabel
{
  v2 = (char *)-[TVSSNowPlayingControlPlayPauseButtonAccessibility safeIntegerForKey:]( self,  "safeIntegerForKey:",  @"_packageState");
  id v3 = @"nowPlaying.stop";
  if (v2 == (_BYTE *)&dword_0 + 1) {
    id v3 = @"nowPlaying.pause";
  }
  if (v2) {
    v4 = (__CFString *)v3;
  }
  else {
    v4 = @"nowPlaying.play";
  }
  id v5 = accessibilityLocalizedString(v4);
  return (id)objc_claimAutoreleasedReturnValue(v5);
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setPackageState:(unint64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSSNowPlayingControlPlayPauseButtonAccessibility;
  -[TVSSNowPlayingControlPlayPauseButtonAccessibility setPackageState:](&v3, "setPackageState:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

@end