@interface TVMusicNowPlayingCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCanBecomeNativeFocused;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityImageView;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVMusicNowPlayingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicNowPlayingCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVMusicNowPlayingCollectionViewCell" hasInstanceVariable:@"_songTitleLabel" withType:"UILabel"];
  [v3 validateClass:@"TVMusicNowPlayingCollectionViewCell" hasInstanceVariable:@"_detailDescriptionLabel" withType:"UILabel"];
  [v3 validateClass:@"TVMusicNowPlayingCollectionViewCell" hasInstanceVariable:@"_imageView" withType:"_UIStackedImageContainerView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMusicNowPlayingCollectionViewCell",  @"explicitIndicatorLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVMusicNowPlayingCollectionViewCellAccessibility;
  -[TVMusicNowPlayingCollectionViewCellAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingCollectionViewCellAccessibility _accessibilityImageView]( self,  "_accessibilityImageView"));
  [v3 setIsAccessibilityElement:1];

  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingCollectionViewCellAccessibility _accessibilityImageView]( self,  "_accessibilityImageView"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __94__TVMusicNowPlayingCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_8398;
  v5[4] = self;
  [v4 _setAccessibilityLabelBlock:v5];
}

id __94__TVMusicNowPlayingCollectionViewCellAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) safeValueForKey:@"_songTitleLabel"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);

  if ([v4 length]) {
    -[NSMutableOrderedSet addObject:](v2, "addObject:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) safeValueForKey:@"_detailDescriptionLabel"]);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);

  if ([v6 length]) {
    -[NSMutableOrderedSet addObject:](v2, "addObject:", v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) safeUIViewForKey:@"_explicitIndicatorLabel"]);
  if ([v7 _accessibilityViewIsVisible])
  {
    id v8 = accessibilityLocalizedString(@"explicit.attribute.label");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSMutableOrderedSet addObject:](v2, "addObject:", v9);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v2, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsJoinedByString:", @", "));

  return v11;
}

- (id)_accessibilityImageView
{
  return -[TVMusicNowPlayingCollectionViewCellAccessibility safeUIViewForKey:]( self,  "safeUIViewForKey:",  @"_imageView");
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end