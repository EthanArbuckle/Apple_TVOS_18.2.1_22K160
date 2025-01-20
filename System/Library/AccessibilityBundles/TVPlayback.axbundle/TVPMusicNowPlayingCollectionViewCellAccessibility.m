@interface TVPMusicNowPlayingCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_replaceControlItems:(id)a3;
@end

@implementation TVPMusicNowPlayingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPMusicNowPlayingCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVPMusicNowPlayingCollectionViewCell" hasInstanceVariable:@"_songTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"TVPMusicNowPlayingCollectionViewCell" hasInstanceVariable:@"_artistNameLabel" withType:"UILabel"];
  [v3 validateClass:@"TVPMusicNowPlayingCollectionViewCell" hasInstanceVariable:@"_imageView" withType:"_UIStackedImageContainerView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMusicNowPlayingCollectionViewCell",  @"controlItems",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMusicNowPlayingCollectionViewCell",  @"_replaceControlItems:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPMusicNowPlayingControlItem",  @"buttonView",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVPMusicNowPlayingCollectionViewCellAccessibility;
  -[TVPMusicNowPlayingCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation]( &v15,  "_accessibilityLoadAccessibilityInformation");
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMusicNowPlayingCollectionViewCellAccessibility safeArrayForKey:]( self,  "safeArrayForKey:",  @"controlItems",  0LL));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue([v8 safeValueForKey:@"buttonView"]);
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accessibilityLabel]);
        [v9 setAccessibilityLabel:v10];
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }

    while (v5);
  }
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMusicNowPlayingCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_artistNameLabel"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityLabel]);

  if ([v5 length]) {
    -[NSMutableOrderedSet addObject:](v3, "addObject:", v5);
  }
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVPMusicNowPlayingCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_songTitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);

  if ([v7 length]) {
    -[NSMutableOrderedSet addObject:](v3, "addObject:", v7);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v3, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "componentsJoinedByString:", @", "));

  return v9;
}

- (id)_accessibilityFrameDelegate
{
  return -[TVPMusicNowPlayingCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_imageView");
}

- (void)_replaceControlItems:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPMusicNowPlayingCollectionViewCellAccessibility;
  -[TVPMusicNowPlayingCollectionViewCellAccessibility _replaceControlItems:](&v4, "_replaceControlItems:", a3);
  -[TVPMusicNowPlayingCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end