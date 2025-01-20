@interface TVPhotoLibraryGridViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityHeaderElements;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVPhotoLibraryGridViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPhotoLibraryGridViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPhotoLibraryGridViewCell",  @"assetType",  "Q",  0);
  [v3 validateClass:@"TVPPhotoLibraryTitleView"];
  [v3 validateClass:@"TVPhotoLibraryGridViewCell" isKindOfClass:@"UICollectionViewCell"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitImage | UIAccessibilityTraitButton;
}

- (id)accessibilityValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPhotoLibraryGridViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"assetType"));
  id v4 = [v3 unsignedIntegerValue];

  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVPhotoLibraryGridViewCellAccessibility;
  id v5 = -[TVPhotoLibraryGridViewCellAccessibility accessibilityValue](&v12, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = accessibilityLocalizedStringForAssetType((uint64_t)v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v8 = __UIAXStringForVariables(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPhotoLibraryGridViewCellAccessibility _accessibilityHeaderViewsForCommonTVPhotosCells]( self,  "_accessibilityHeaderViewsForCommonTVPhotosCells"));
  uint64_t v4 = AXGuaranteedMutableArray();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  char v25 = 0;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UICollectionView, v6);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVPhotoLibraryGridViewCellAccessibility superview](self, "superview"));
  uint64_t v9 = __UIAccessibilityCastAsClass(v7, v8, 1LL, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v25) {
    abort();
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 indexPathForCell:self]);
  id v12 = [v11 section];

  v13 = (void *)objc_claimAutoreleasedReturnValue( [v10 indexPathsForVisibleSupplementaryElementsOfKind:UICollectionElementKindSectionHeader]);
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v14 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
        if ([v18 section] == v12)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue( [v10 supplementaryViewForElementKind:UICollectionElementKindSectionHeader atIndexPath:v18]);
          [v5 axSafelyAddObject:v19];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }

    while (v15);
  }

  return v5;
}

@end