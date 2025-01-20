@interface TVMusicLyricsLineLabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation TVMusicLyricsLineLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicLyricsLineLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end