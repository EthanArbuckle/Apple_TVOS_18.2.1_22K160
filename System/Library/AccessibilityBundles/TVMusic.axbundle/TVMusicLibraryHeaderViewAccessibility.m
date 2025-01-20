@interface TVMusicLibraryHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldTreatHeaderAsAccessibilityElement;
- (id)_accessibilitySupplementaryFooterViews;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVMusicLibraryHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicLibraryHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVMusicLibraryHeaderView" hasInstanceVariable:@"_titleLabel" withType:"TVLabel"];
  [v3 validateClass:@"TVMusicLibraryHeaderView" hasInstanceVariable:@"_subtitleLabel" withType:"TVLabel"];
  [v3 validateClass:@"TVMusicLibraryHeaderView" hasInstanceVariable:@"_rightViews" withType:"NSArray"];
}

- (BOOL)_accessibilityShouldTreatHeaderAsAccessibilityElement
{
  char v19 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryHeaderViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v19
    || (char v18 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UILabel, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryHeaderViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleLabel")),  uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v18),  v11 = (void *)objc_claimAutoreleasedReturnValue(v10),  v9,  v18))
  {
    abort();
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue([v6 text]);
  if (v12)
  {
    char v13 = 1;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v6 attributedText]);
    if (v14)
    {
      char v13 = 1;
    }

    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue([v11 text]);
      if (v15)
      {
        char v13 = 1;
      }

      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v11 attributedText]);
        char v13 = v16 != 0LL;
      }
    }
  }

  return v13;
}

- (unint64_t)accessibilityTraits
{
  if (-[TVMusicLibraryHeaderViewAccessibility _accessibilityShouldTreatHeaderAsAccessibilityElement]( self,  "_accessibilityShouldTreatHeaderAsAccessibilityElement"))
  {
    return UIAccessibilityTraitHeader;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicLibraryHeaderViewAccessibility;
  return -[TVMusicLibraryHeaderViewAccessibility accessibilityTraits](&v4, "accessibilityTraits");
}

- (id)accessibilityLabel
{
  if (-[TVMusicLibraryHeaderViewAccessibility _accessibilityShouldTreatHeaderAsAccessibilityElement]( self,  "_accessibilityShouldTreatHeaderAsAccessibilityElement"))
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicLibraryHeaderViewAccessibility _accessibilityStringForLabelKeyValues:]( self,  "_accessibilityStringForLabelKeyValues:",  @"_titleLabel, _subtitleLabel"));
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___TVMusicLibraryHeaderViewAccessibility;
    id v4 = -[TVMusicLibraryHeaderViewAccessibility accessibilityLabel](&v6, "accessibilityLabel");
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  return -[TVMusicLibraryHeaderViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", @"_rightViews");
}

@end