@interface HB_UICollectionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityScrollingEnabled;
- (BOOL)_accessibilityTreatCollectionViewRowsAsScannerGroups;
- (int64_t)_accessibilityCollectionViewItemsPerRow;
@end

@implementation HB_UICollectionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UICollectionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityTreatCollectionViewRowsAsScannerGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HB_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  unsigned __int8 v4 = [v3 isEqualToString:@"GridCollectionView"];

  if ((v4 & 1) != 0) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HB_UICollectionViewAccessibility;
  return -[HB_UICollectionViewAccessibility _accessibilityTreatCollectionViewRowsAsScannerGroups]( &v6,  "_accessibilityTreatCollectionViewRowsAsScannerGroups");
}

- (int64_t)_accessibilityCollectionViewItemsPerRow
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HB_UICollectionViewAccessibility accessibilityIdentifier](self, "accessibilityIdentifier"));
  unsigned int v4 = [v3 isEqualToString:@"GridCollectionView"];

  if (v4)
  {
    if (_os_feature_enabled_impl("PineBoard", "Coolport"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      id v6 = [v5 appleTVAppGridItemsPerLine];

      return (int64_t)v6;
    }

    else
    {
      return 6LL;
    }
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___HB_UICollectionViewAccessibility;
    return -[HB_UICollectionViewAccessibility _accessibilityCollectionViewItemsPerRow]( &v8,  "_accessibilityCollectionViewItemsPerRow");
  }

- (BOOL)_accessibilityScrollingEnabled
{
  uint64_t v3 = AXSafeClassFromString(@"HBAppGridView");
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[HB_UICollectionViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"delegate"));
  LOBYTE(v3) = objc_opt_isKindOfClass(v4, v3);

  if ((v3 & 1) != 0) {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HB_UICollectionViewAccessibility;
  return -[HB_UICollectionViewAccessibility _accessibilityScrollingEnabled](&v6, "_accessibilityScrollingEnabled");
}

@end