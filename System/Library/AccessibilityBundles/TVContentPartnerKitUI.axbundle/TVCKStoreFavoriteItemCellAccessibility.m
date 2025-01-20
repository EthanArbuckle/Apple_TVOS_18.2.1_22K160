@interface TVCKStoreFavoriteItemCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation TVCKStoreFavoriteItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVCKStoreFavoriteItemCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCKStoreFavoriteItemCell",  @"badgeCount",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCKImageStackCollectionViewCell",  @"title",  "@",  0);
  [v3 validateClass:@"TVCKStoreFavoriteItemCell" isKindOfClass:@"TVCKImageStackCollectionViewCell"];
}

- (id)accessibilityLabel
{
  return -[TVCKStoreFavoriteItemCellAccessibility _accessibilityStringForLabelKeyValues:]( self,  "_accessibilityStringForLabelKeyValues:",  @"title");
}

- (id)accessibilityValue
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___TVCKStoreFavoriteItemCellAccessibility;
  id v3 = -[TVCKStoreFavoriteItemCellAccessibility accessibilityValue](&v17, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  char v16 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVCKStoreFavoriteItemCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"badgeCount"));
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v16) {
    abort();
  }
  if ((uint64_t)[v9 integerValue] >= 1)
  {
    id v10 = accessibilityLocalizedString(@"item.badge.numeric.value.generic");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  v11,  [v9 integerValue]));

    uint64_t v13 = __UIAXStringForVariables(v4);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

    v4 = (void *)v14;
  }

  return v4;
}

@end