@interface TVLGridCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (int64_t)_accessibilityTVLGridCollectionViewCellType;
- (unint64_t)accessibilityTraits;
@end

@implementation TVLGridCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLGridCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return (char *)-[TVLGridCollectionViewCellAccessibility _accessibilityTVLGridCollectionViewCellType]( self,  "_accessibilityTVLGridCollectionViewCellType") != (char *)&dword_0 + 2;
}

- (unint64_t)accessibilityTraits
{
  unint64_t result = -[TVLGridCollectionViewCellAccessibility _accessibilityTVLGridCollectionViewCellType]( self,  "_accessibilityTVLGridCollectionViewCellType");
  if (result)
  {
    if (result == 1)
    {
      v3 = &UIAccessibilityTraitHeader;
    }

    else
    {
      if (result != 2) {
        return result;
      }
      v3 = &UIAccessibilityTraitNone;
    }
  }

  else
  {
    v3 = &UIAccessibilityTraitButton;
  }

  return *v3;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVLGridCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"hostedView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (id)_accessibilityFrameDelegate
{
  return -[TVLGridCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"hostedView");
}

- (id)accessibilityHeaderElements
{
  if (-[TVLGridCollectionViewCellAccessibility _accessibilityTVLGridCollectionViewCellType]( self,  "_accessibilityTVLGridCollectionViewCellType"))
  {
    return 0LL;
  }

  Class v4 = NSClassFromString(@"TVLGridCollectionViewCell");
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVLGridCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  v4));
  char v18 = 0;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 safeValueForKey:@"superview"]);
  uint64_t v9 = __UIAccessibilityCastAsClass(v7, v8, 1LL, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v18) {
    abort();
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathForCell:v5]);
  v12 = v11;
  if (v11 && (v13 = (char *)[v11 section], (uint64_t)v13 >= 1))
  {
    v14 = v13 + 1;
    while (1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  v14 - 2));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v10 cellForItemAtIndexPath:v15]);

      if ((objc_opt_isKindOfClass(v16, v4) & 1) != 0
        && [v16 _accessibilityTVLGridCollectionViewCellType] == (char *)&dword_0 + 1)
      {
        break;
      }
    }

    v19 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  }

  else
  {
LABEL_10:
    v17 = 0LL;
  }

  return v17;
}

- (int64_t)_accessibilityTVLGridCollectionViewCellType
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVLGridCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"hostedView"));
  Class v4 = NSClassFromString(@"TVLShelfView");
  Class v5 = NSClassFromString(@"TVLImageStackPosterView");
  Class v6 = NSClassFromString(@"TVLDividerView");
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    int64_t v7 = 2LL;
  }

  else if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    int64_t v7 = 0LL;
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass(v3, v6);
    int64_t v7 = 1LL;
    if ((isKindOfClass & 1) == 0)
    {
      _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Cell type should have been handled by now. Investigate this class: %@",  v3);
      if (-[TVLGridCollectionViewCellAccessibility safeBoolForKey:]( self,  "safeBoolForKey:",  @"acceptsFocus")) {
        int64_t v7 = 0LL;
      }
      else {
        int64_t v7 = 2LL;
      }
    }
  }

  return v7;
}

@end