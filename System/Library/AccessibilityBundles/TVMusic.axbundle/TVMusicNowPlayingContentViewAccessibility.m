@interface TVMusicNowPlayingContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation TVMusicNowPlayingContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicNowPlayingContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVMusic.NowPlayingContentView" hasSwiftField:@"titleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"TVMusic.NowPlayingContentView" hasSwiftField:@"subtitleLabel" withSwiftType:"UILabel"];
  [v3 validateClass:@"TVMusic.NowPlayingContentView" hasSwiftField:@"explicitTag" withSwiftType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
  char v24 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIView, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingContentViewAccessibility safeSwiftValueForKey:]( self,  "safeSwiftValueForKey:",  @"titleLabel"));
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v24) {
    goto LABEL_10;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 accessibilityLabel]);

  if ([v9 length]) {
    -[NSMutableOrderedSet addObject:](v3, "addObject:", v9);
  }
  char v23 = 0;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UIView, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingContentViewAccessibility safeSwiftValueForKey:]( self,  "safeSwiftValueForKey:",  @"subtitleLabel"));
  uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v23) {
LABEL_10:
  }
    abort();
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accessibilityLabel]);

  if ([v15 length]) {
    -[NSMutableOrderedSet addObject:](v3, "addObject:", v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicNowPlayingContentViewAccessibility safeSwiftValueForKey:]( self,  "safeSwiftValueForKey:",  @"explicitTag"));
  if ([v16 _accessibilityViewIsVisible])
  {
    id v17 = accessibilityLocalizedString(@"explicit.attribute.label");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSMutableOrderedSet addObject:](v3, "addObject:", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v3, "array"));
  uint64_t v20 = UIAXLabelForElements();
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  return v21;
}

@end