@interface MTTVEpisodePodcastCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityPlayStatusString;
- (id)accessibilityLabel;
@end

@implementation MTTVEpisodePodcastCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTTVEpisodePodcastCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"MTTVEpisodeGenericCell",  @"episode",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"MTTVEpisodeGenericCell",  @"isPlaying",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"MTEpisode",  @"playState",  "q",  0);
}

- (id)_accessibilityPlayStatusString
{
  if (-[MTTVEpisodePodcastCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", @"isPlaying"))
  {
    id v3 = accessibilityLocalizedString(@"now.playing");
    id v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePodcastCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"episode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 safeValueForKey:@"playState"]);
    v7 = (char *)[v6 integerValue];

    if (v7 == (_BYTE *)&dword_0 + 2) {
      v8 = @"unplayed";
    }
    else {
      v8 = @"partially.played";
    }
    id v9 = accessibilityLocalizedString(v8);
    id v4 = (id)objc_claimAutoreleasedReturnValue(v9);
  }

  return v4;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVEpisodePodcastCellAccessibility _accessibilityPlayStatusString]( self,  "_accessibilityPlayStatusString"));
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVEpisodePodcastCellAccessibility;
  id v4 = -[MTTVEpisodePodcastCellAccessibility accessibilityLabel](&v9, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v5 = __UIAXStringForVariables(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end