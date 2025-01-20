@interface TVSSNowPlayingControlNextButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSSNowPlayingControlNextButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSNowPlayingControlNextButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"nowPlaying.next");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end