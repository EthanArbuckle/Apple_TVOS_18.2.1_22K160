@interface TVSSWaveformVisualContentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TVSSWaveformVisualContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSWaveformVisualContent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"nowPlaying.title");
}

@end