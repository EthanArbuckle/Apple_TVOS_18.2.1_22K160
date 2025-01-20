@interface TVMusicLibraryButtonFactoryAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)normalMoreButton;
+ (id)safeCategoryTargetClassName;
+ (id)wideGoToArtistButton;
+ (void)_accessibilityPerformValidations:(id)a3;
@end

@implementation TVMusicLibraryButtonFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicLibraryButtonFactory";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVMusicLibraryButtonFactory",  @"normalMoreButton",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasClassMethod:withFullSignature:",  @"TVMusicLibraryButtonFactory",  @"wideGoToArtistButton",  "@",  0);
}

+ (id)normalMoreButton
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TVMusicLibraryButtonFactoryAccessibility;
  id v2 = objc_msgSendSuper2(&v7, "normalMoreButton");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = accessibilityLocalizedString(@"more.button.label");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 _accessibilitySetRetainedValue:v5 forKey:@"AX_TVMusicLibraryActionButton_FallbackLabelKey"];

  return v3;
}

+ (id)wideGoToArtistButton
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TVMusicLibraryButtonFactoryAccessibility;
  id v2 = objc_msgSendSuper2(&v7, "wideGoToArtistButton");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = accessibilityLocalizedString(@"go.to.artist.button.label");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 _accessibilitySetRetainedValue:v5 forKey:@"AX_TVMusicLibraryActionButton_FallbackLabelKey"];

  return v3;
}

@end