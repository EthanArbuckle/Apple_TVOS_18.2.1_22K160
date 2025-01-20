@interface HBRootCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityAppGridInEditingMode;
- (BOOL)_accessibilityCellIsBeingEdited;
- (BOOL)_accessibilityIsGuideElement;
- (BOOL)_accessibilityIsHBAppCell;
- (BOOL)_accessibilityIsHBFolderCell;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityAppDisplayedNameLabel;
- (id)_accessibilityAppGridView;
- (id)_accessibilityAppSpokenNameLabel;
- (id)_accessibilityAssociatedTopShelfContentDescription;
- (id)_accessibilityBadgeValue;
- (id)_accessibilityGuideElementHeaderText;
- (id)_accessibilityHeadBoardLabel;
- (id)_accessibilitySpecificDescriptionForBadgeValue:(id)a3;
- (id)_accessibilityTopShelfModelController;
- (id)_atvaccessibilityGeometricNearestHeader;
- (id)_axAppIdentifier;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityScanningBehaviorTraits;
- (unint64_t)accessibilityTraits;
- (void)prepareForReuse;
@end

@implementation HBRootCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBRootCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HBAppCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HBRootCell", @"item", "@", 0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBRootCell",  @"delegate",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBRootItem",  @"displayName",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBRootItem",  @"badgeValue",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBSBadgeValue",  @"badgeString",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBSBadgeValue",  @"badgeNumber",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBAppGridView",  @"gridView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBAppGridView",  @"_editingCell",  "@",  0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HBAppCell", @"app", "@", 0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBApp",  @"applicationIdentifier",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBApp",  @"localizedAppName",  "@",  0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HBApp", @"dotStyle", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"HBFolder", @"items", "@", 0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBRootCell",  @"prepareForReuse",  "v",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBMainViewController",  @"topShelfManager",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfManager",  @"modelControllerForApplicationIdentifier:",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfModelController",  @"model",  "@",  0);
  [v3 validateClass:@"HBTopShelfBannerModel"];
  [v3 validateClass:@"HBTopShelfSectionedModel"];
  [v3 validateClass:@"HBTopShelfParadeModel"];
  [v3 validateClass:@"HBTopShelfStaticImageModel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilityGuideElementHeaderText
{
  return accessibilityLocalizedString(@"apps.guide.element");
}

- (BOOL)_accessibilityIsGuideElement
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityIndexPath](self, "_accessibilityIndexPath"));
  if (v2)
  {
    if (_os_feature_enabled_impl("PineBoard", "Coolport"))
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
      unint64_t v4 = (unint64_t)[v3 appleTVAppGridItemsPerLine];

      BOOL v5 = (unint64_t)[v2 item] % v4 == 0;
    }

    else
    {
      BOOL v5 = __ROR8__(0xAAAAAAAAAAAAAAABLL * (void)[v2 item] + 0x2AAAAAAAAAAAAAAALL, 1) < 0x2AAAAAAAAAAAAAABuLL;
    }
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityAppSpokenNameLabel](self, "_accessibilityAppSpokenNameLabel"));
  if (!v3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( -[HBRootCellAccessibility _accessibilityAppDisplayedNameLabel]( self,  "_accessibilityAppDisplayedNameLabel"));
    if (!v3) {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityHeadBoardLabel](self, "_accessibilityHeadBoardLabel"));
    }
  }

  if (-[HBRootCellAccessibility _accessibilityIsHBFolderCell](self, "_accessibilityIsHBFolderCell"))
  {
    id v4 = accessibilityLocalizedString(@"folder.label");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v5, v3));

    id v3 = (void *)v6;
  }

  return v3;
}

- (id)_accessibilityHeadBoardLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"displayName"]);

  return v3;
}

- (id)_accessibilityAppDisplayedNameLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v3 = AXSafeClassFromString(@"HBApp");
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"localizedAppName"]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_accessibilityAppSpokenNameLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v3 = AXSafeClassFromString(@"HBApp");
  if ((objc_opt_isKindOfClass(v2, v3) & 1) == 0) {
    goto LABEL_5;
  }
  char v13 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSURL, v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"bundleURL"]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v13) {
    abort();
  }
  if (v8)
  {
    id v9 = [[BSCFBundle alloc] initWithURL:v8];
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedInfoDictionary]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"CFBundleSpokenName"]);
  }

  else
  {
LABEL_5:
    v11 = 0LL;
  }

  return v11;
}

- (id)accessibilityValue
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v4 = AXSafeClassFromString(@"HBApp");
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityHeadBoardLabel](self, "_accessibilityHeadBoardLabel"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility accessibilityLabel](self, "accessibilityLabel"));
    else {
      id v7 = v5;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"dotStyle"]);
    v16 = (char *)[v15 integerValue];

    if (v16 == (_BYTE *)&dword_0 + 1)
    {
      v17 = @"app.in.beta.value";
      goto LABEL_15;
    }

    if (v16 == (_BYTE *)&dword_0 + 2)
    {
      v17 = @"app.recently.updated.value";
LABEL_15:
      id v18 = accessibilityLocalizedString(v17);
      v37 = (void *)objc_claimAutoreleasedReturnValue(v18);
      v39 = @"__AXStringForVariablesSentinel";
      uint64_t v19 = __UIAXStringForVariables(v7);
      uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);

      id v7 = (id)v20;
    }
  }

  else
  {
    uint64_t v8 = AXSafeClassFromString(@"HBFolder");
    uint64_t isKindOfClass = objc_opt_isKindOfClass(v3, v8);
    if ((isKindOfClass & 1) == 0)
    {
      id v7 = 0LL;
      goto LABEL_18;
    }

    char v41 = 0;
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"items"]);
    uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v41);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v41) {
      goto LABEL_24;
    }
    if (!v5)
    {
      id v7 = 0LL;
      goto LABEL_17;
    }

    id v14 = accessibilityLocalizedString(@"folder.items");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, [v5 count]));
  }

LABEL_17:
LABEL_18:
  if (AXRequestingClient(isKindOfClass, v10) != 3)
  {
    v33 = 0LL;
    id v32 = 0LL;
    goto LABEL_22;
  }

  id v21 = -[HBRootCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  AXSafeClassFromString(@"HBAppGridView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  char v40 = 0;
  uint64_t v24 = objc_opt_class(&OBJC_CLASS___UICollectionView, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v22 safeValueForKey:@"gridView"]);
  uint64_t v26 = __UIAccessibilityCastAsClass(v24, v25, 1LL, &v40);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  if (v40) {
LABEL_24:
  }
    abort();
  v28 = (void *)objc_claimAutoreleasedReturnValue([v27 indexPathForCell:self]);
  id v29 = objc_alloc(&OBJC_CLASS___AXAttributedString);
  id v30 = appCellGridString(v22, v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  id v32 = [v29 initWithStringOrAttributedString:v31];

  v33 = (void *)objc_claimAutoreleasedReturnValue( -[HBRootCellAccessibility _accessibilityAssociatedTopShelfContentDescription]( self,  "_accessibilityAssociatedTopShelfContentDescription"));
LABEL_22:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityBadgeValue](self, "_accessibilityBadgeValue", v37, v39));
  uint64_t v34 = __UIAXStringForVariables(v7);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  return v35;
}

- (id)accessibilityHint
{
  if (-[HBRootCellAccessibility _accessibilityCellIsBeingEdited](self, "_accessibilityCellIsBeingEdited"))
  {
    id v3 = accessibilityLocalizedString(@"app.options.hint");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___HBRootCellAccessibility;
    id v5 = -[HBRootCellAccessibility accessibilityHint](&v7, "accessibilityHint");
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v5);
  }

  return v4;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBRootCellAccessibility;
  return (kAXLaunchIconTrait | -[HBRootCellAccessibility accessibilityTraits](&v3, "accessibilityTraits")) & ~(UIAccessibilityTraitSelected | UIAccessibilityTraitButton);
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2 = 0x7FFFFFFFLL;
  NSUInteger v3 = 0LL;
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)_accessibilityAppGridInEditingMode
{
  NSUInteger v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityAppGridView](self, "_accessibilityAppGridView"));
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"delegate"]);
  unsigned __int8 v4 = [v3 safeBoolForKey:@"isEditing"];

  return v4;
}

- (BOOL)_accessibilityCellIsBeingEdited
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _accessibilityAppGridView](self, "_accessibilityAppGridView"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"_editingCell"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility accessibilityLabel](self, "accessibilityLabel"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityLabel]);
  unsigned __int8 v7 = [v5 isEqualToString:v6];

  return v7;
}

- (id)_accessibilityAppGridView
{
  if (_accessibilityAppGridView_onceToken != -1) {
    dispatch_once(&_accessibilityAppGridView_onceToken, &__block_literal_global);
  }
  return -[HBRootCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  _accessibilityAppGridView_HBAppGridViewClass);
}

void __52__HBRootCellAccessibility__accessibilityAppGridView__block_invoke(id a1)
{
  _accessibilityAppGridView_HBAppGridViewClass = (uint64_t)NSClassFromString(@"HBAppGridView");
}

- (id)_accessibilityBadgeValue
{
  NSUInteger v3 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"badgeValue"]);
  char v17 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSString, v5);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"badgeString"]);
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v17) {
    goto LABEL_8;
  }
  if (v9) {
    goto LABEL_7;
  }
  char v16 = 0;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSNumber, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"badgeNumber"]);
  uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v16);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v16) {
LABEL_8:
  }
    abort();
  if (v14)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[HBRootCellAccessibility _accessibilitySpecificDescriptionForBadgeValue:]( self,  "_accessibilitySpecificDescriptionForBadgeValue:",  v14));
  }

  else
  {
    id v9 = 0LL;
  }

- (id)_axAppIdentifier
{
  NSUInteger v2 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v3 = AXSafeClassFromString(@"HBApp");
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0) {
    unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v2 safeStringForKey:@"applicationIdentifier"]);
  }
  else {
    unsigned __int8 v4 = 0LL;
  }

  return v4;
}

- (id)_accessibilitySpecificDescriptionForBadgeValue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _axAppIdentifier](self, "_axAppIdentifier"));
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_6;
  }
  if (([v5 isEqualToString:@"com.apple.podcasts"] & 1) != 0
    || [v6 isEqualToString:@"com.apple.TVShows"])
  {
    unsigned __int8 v7 = @"app.badge.numeric.value.episode";
  }

  else if ([v6 isEqualToString:@"com.apple.TVAppStore"])
  {
    unsigned __int8 v7 = @"app.badge.numeric.value.app";
  }

  else if ([v6 isEqualToString:@"com.apple.TVMovies"])
  {
    unsigned __int8 v7 = @"app.badge.numeric.value.movie";
  }

  else
  {
    unsigned __int8 v7 = @"app.badge.numeric.value.update";
  }

  id v8 = accessibilityLocalizedString(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  v9,  [v4 integerValue]));

  if (!v10)
  {
LABEL_6:
    id v11 = accessibilityLocalizedString(@"app.badge.numeric.value.generic");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  v12,  [v4 integerValue]));
  }

  return v10;
}

- (id)_accessibilityAssociatedTopShelfContentDescription
{
  NSUInteger v2 = (void *)objc_claimAutoreleasedReturnValue( -[HBRootCellAccessibility _accessibilityTopShelfModelController]( self,  "_accessibilityTopShelfModelController"));
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"model"]);
    uint64_t v5 = AXSafeClassFromString(@"HBTopShelfStaticImageModel");
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      uint64_t v6 = @"no.top.shelf.content.available";
    }

    else
    {
      uint64_t v8 = AXSafeClassFromString(@"HBTopShelfSectionedModel");
      if ((objc_opt_isKindOfClass(v4, v8) & 1) == 0)
      {
        uint64_t v9 = AXSafeClassFromString(@"HBTopShelfParadeModel");
        if ((objc_opt_isKindOfClass(v4, v9) & 1) == 0)
        {
          uint64_t v10 = AXSafeClassFromString(@"HBTopShelfBannerModel");
          if ((objc_opt_isKindOfClass(v4, v10) & 1) == 0)
          {
            unsigned __int8 v7 = 0LL;
            goto LABEL_10;
          }
        }
      }

      uint64_t v6 = @"top.shelf.content.available";
    }

    id v11 = accessibilityLocalizedString(v6);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_10:

    goto LABEL_11;
  }

  unsigned __int8 v7 = 0LL;
LABEL_11:

  return v7;
}

- (id)_atvaccessibilityGeometricNearestHeader
{
  if (-[HBRootCellAccessibility _accessibilityIsHBAppCell](self, "_accessibilityIsHBAppCell")) {
    return 0LL;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HBRootCellAccessibility;
  id v4 = -[HBRootCellAccessibility _atvaccessibilityGeometricNearestHeader]( &v5,  "_atvaccessibilityGeometricNearestHeader");
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (BOOL)_accessibilityIsHBAppCell
{
  if (_accessibilityIsHBAppCell_onceToken != -1) {
    dispatch_once(&_accessibilityIsHBAppCell_onceToken, &__block_literal_global_305);
  }
  return objc_opt_isKindOfClass(self, _accessibilityIsHBAppCell_HBAppCell_Class) & 1;
}

void __52__HBRootCellAccessibility__accessibilityIsHBAppCell__block_invoke(id a1)
{
  _accessibilityIsHBAppCell_HBAppCell_Class = (uint64_t)NSClassFromString(@"HBAppCell");
}

- (BOOL)_accessibilityIsHBFolderCell
{
  if (_accessibilityIsHBFolderCell_onceToken != -1) {
    dispatch_once(&_accessibilityIsHBFolderCell_onceToken, &__block_literal_global_306);
  }
  return objc_opt_isKindOfClass(self, _accessibilityIsHBFolderCell_HBFolderCell_Class) & 1;
}

void __55__HBRootCellAccessibility__accessibilityIsHBFolderCell__block_invoke(id a1)
{
  _accessibilityIsHBFolderCell_HBFolderCell_Class = (uint64_t)NSClassFromString(@"HBFolderCell");
}

- (id)_accessibilityTopShelfModelController
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility _axAppIdentifier](self, "_axAppIdentifier"));
  if (v4)
  {
    LOBYTE(v18) = 0;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIWindow, v3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[HBRootCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"window"));
    uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v18);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if ((_BYTE)v18) {
      abort();
    }
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 rootViewController]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 safeValueForKey:@"topShelfManager"]);
    uint64_t v18 = 0LL;
    uint64_t v19 = &v18;
    uint64_t v20 = 0x3032000000LL;
    id v21 = __Block_byref_object_copy_;
    v22 = __Block_byref_object_dispose_;
    id v23 = 0LL;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __64__HBRootCellAccessibility__accessibilityTopShelfModelController__block_invoke;
    v14[3] = &unk_C3B8;
    char v17 = &v18;
    id v11 = v10;
    id v15 = v11;
    id v16 = v4;
    AXPerformSafeBlock(v14);
    id v12 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

void __64__HBRootCellAccessibility__accessibilityTopShelfModelController__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) modelControllerForApplicationIdentifier:*(void *)(a1 + 40)]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 8LL;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HBRootCellAccessibility;
  -[HBRootCellAccessibility prepareForReuse](&v3, "prepareForReuse");
  -[HBRootCellAccessibility _accessibilityRemoveValueForKey:]( self,  "_accessibilityRemoveValueForKey:",  @"_accessibilityAppDisplayedNameLabel");
  -[HBRootCellAccessibility _accessibilityRemoveValueForKey:]( self,  "_accessibilityRemoveValueForKey:",  @"_accessibilityAppSpokenNameLabel");
}

@end