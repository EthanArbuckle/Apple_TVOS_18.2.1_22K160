@interface TVSSNowPlayingControlBackward15ButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSSNowPlayingControlBackward15ButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSNowPlayingControlBackward15Button";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"nowPlaying.skip15.backward");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end