@interface TVLMenuItemListCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVLMenuItemListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLMenuItemListCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemListCell",  @"menuItemView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"subtitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"rightTitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"ordinal",  "q",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVLMenuItemListCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"menuItemView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"title"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"subtitle"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"ordinal"]);
  id v6 = [v5 unsignedIntegerValue];

  if (v6)
  {
    uint64_t v7 = AXFormatInteger(v6);
    id v6 = (id)objc_claimAutoreleasedReturnValue(v7);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue([v2 _accessibilityAccessoryDescriptions]);
  uint64_t v8 = __UIAXStringForVariables(v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (id)accessibilityValue
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVLMenuItemListCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"menuItemView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"rightTitle"]);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVLMenuItemListCellAccessibility;
  unint64_t v3 = -[TVLMenuItemListCellAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVLMenuItemListCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"menuItemView"));
  unint64_t v5 = (unint64_t)[v4 accessibilityTraits] | v3;

  return v5;
}

- (id)accessibilityHeaderElements
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVLMenuItemListCellAccessibility;
  id v3 = -[TVLMenuItemListCellAccessibility accessibilityHeaderElements](&v25, "accessibilityHeaderElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  id v5 = [v4 mutableCopy];

  if (!v5) {
    id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  }
  Class v6 = NSClassFromString(@"TVLHeaderView");
  char v24 = 0;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UITableView, v7);
  id v9 = -[TVLMenuItemListCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  NSClassFromString(@"TVTableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = __UIAccessibilityCastAsClass(v8, v10, 1LL, &v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v24) {
    abort();
  }
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subviews", 0));
  id v14 = [v13 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v20 + 1) + 8LL * (void)i);
        if ((objc_opt_isKindOfClass(v18, v6) & 1) != 0) {
          [v5 addObject:v18];
        }
      }

      id v15 = [v13 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }

    while (v15);
  }

  return v5;
}

- (_NSRange)accessibilityRowRange
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___TVLMenuItemListCellAccessibility;
  id v3 = -[TVLMenuItemListCellAccessibility accessibilityRowRange](&v15, "accessibilityRowRange");
  if (v4 == 1 && v3 == 0LL)
  {
    id v8 = -[TVLMenuItemListCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UITableView, v4));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    id v10 = [v9 numberOfSections];
    if ((uint64_t)v10 < 2)
    {
      id v6 = 0LL;
      uint64_t v7 = 1LL;
    }

    else
    {
      uint64_t v7 = (uint64_t)v10;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 indexPathForCell:self]);
      v12 = v11;
      if (v11)
      {
        id v6 = [v11 section];
      }

      else
      {
        id v6 = 0LL;
        uint64_t v7 = 1LL;
      }
    }
  }

  else
  {
    id v6 = v3;
    uint64_t v7 = v4;
  }

  NSUInteger v13 = (NSUInteger)v6;
  NSUInteger v14 = v7;
  result.length = v14;
  result.location = v13;
  return result;
}

@end