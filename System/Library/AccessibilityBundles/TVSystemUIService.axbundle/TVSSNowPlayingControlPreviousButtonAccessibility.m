@interface TVSSNowPlayingControlPreviousButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSSNowPlayingControlPreviousButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSNowPlayingControlPreviousButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"nowPlaying.previous");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end