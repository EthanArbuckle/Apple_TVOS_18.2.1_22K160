@interface TSKTableViewTextCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_atvaccessibilityIsTVResolutionCell;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityLinkedUIElements;
- (id)_accessibilitySettingGroupForCell;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)accessibilityValue_TSKTableViewTextCell;
- (unint64_t)accessibilityTraits;
@end

@implementation TSKTableViewTextCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKTableViewTextCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKTableViewTextCell",  @"rightText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKTableViewTextCell",  @"accessories",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKTableViewTextCell",  @"item",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility accessibilityUserDefinedLabel]( self,  "accessibilityUserDefinedLabel"));

  if (v3) {
    return (id)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility accessibilityUserDefinedLabel]( self,  "accessibilityUserDefinedLabel"));
  }
  char v41 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKSettingItem, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v41);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v41) {
    abort();
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityLabel]);
  if (![v10 length])
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"text"));

    if (!-[TSKTableViewTextCellAccessibility _atvaccessibilityIsTVResolutionCell]( self,  "_atvaccessibilityIsTVResolutionCell")) {
      goto LABEL_20;
    }
    if (accessibilityLabel_onceToken != -1) {
      dispatch_once(&accessibilityLabel_onceToken, &__block_literal_global);
    }
    id v12 = [v11 length];
    id v13 = [v11 length];
    if (!v11) {
      goto LABEL_20;
    }
    if (!v12) {
      goto LABEL_20;
    }
    id v14 = v13;
    if (v13 > v12) {
      goto LABEL_20;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)accessibilityLabel_R1, "matchesInString:options:range:", v11, 0, 0, v13));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 firstObject]);

    if ((unint64_t)[v16 numberOfRanges] < 3)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)accessibilityLabel_R2, "matchesInString:options:range:", v11, 0, 0, v14));
      v26 = (void *)objc_claimAutoreleasedReturnValue([v25 firstObject]);

      if ([v26 numberOfRanges] != &dword_4)
      {
LABEL_19:

LABEL_20:
        v10 = v11;
        goto LABEL_21;
      }

      id v27 = [v26 rangeAtIndex:1];
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v27, v28));
      id v29 = [v26 rangeAtIndex:2];
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v29, v30));
      id v31 = [v26 rangeAtIndex:3];
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v31, v32));
      id v34 = accessibilityLocalizedString(@"tv.resolution.pixels");
      uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
      uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v35, v20, v23, v33));

      v11 = (void *)v35;
      v16 = v26;
    }

    else
    {
      v17 = (char *)[v16 numberOfRanges];
      id v18 = [v16 rangeAtIndex:1];
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v18, v19));
      if (v17 == (_BYTE *)&dword_0 + 3)
      {
        id v21 = [v16 rangeAtIndex:2];
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v21, v22));
        v24 = @"tv.resolution.scan.no.hd";
      }

      else
      {
        id v37 = [v16 rangeAtIndex:3];
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringWithRange:", v37, v38));
        v24 = @"tv.resolution.scan.hd";
      }

      id v39 = accessibilityLocalizedString(v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue(v39);
      uint64_t v36 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v33, v20, v23));
    }

    v26 = v16;
    v11 = (void *)v36;
    goto LABEL_19;
  }

void __55__TSKTableViewTextCellAccessibility_accessibilityLabel__block_invoke(id a1)
{
  id v10 = 0LL;
  uint64_t v1 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(\\d*)p (HD)?- (\\d*)Hz",  0LL,  &v10));
  id v2 = v10;
  id v3 = (void *)accessibilityLabel_R1;
  accessibilityLabel_R1 = v1;

  if (v2)
  {
    char v8 = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v8,  @"Could not make regular expression: %@",  v2);
  }

  id v9 = 0LL;
  uint64_t v4 = objc_claimAutoreleasedReturnValue( +[NSRegularExpression regularExpressionWithPattern:options:error:]( &OBJC_CLASS___NSRegularExpression,  "regularExpressionWithPattern:options:error:",  @"(\\d*) x (\\d*) - (\\d*)Hz",  0LL,  &v9));
  id v5 = v9;
  uint64_t v6 = (void *)accessibilityLabel_R2;
  accessibilityLabel_R2 = v4;

  if (v5)
  {
    LOBYTE(v7) = 1;
    _AXLogWithFacility( 0LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v7,  @"Could not make regular expression: %@",  v5);
  }

- (id)accessibilityValue
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility accessibilityUserDefinedValue]( self,  "accessibilityUserDefinedValue"));

  if (v3) {
    return (id)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility accessibilityUserDefinedValue]( self,  "accessibilityUserDefinedValue"));
  }
  char v17 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKSettingItem, v4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v17) {
    abort();
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityValue]);
  if (![v10 length])
  {
    uint64_t v11 = objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility accessibilityValue_TSKTableViewTextCell]( self,  "accessibilityValue_TSKTableViewTextCell"));

    id v10 = (void *)v11;
  }

  if (AXRequestingClient() == 15)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v9 localizedDescription]);
    if (![v12 length])
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 attributedLocalizedDescription]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v13 string]);

      id v12 = (void *)v14;
    }

    uint64_t v15 = __UIAXStringForVariables(v10);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);

    id v10 = (void *)v16;
  }

  return v10;
}

- (id)accessibilityHint
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint"));

  if (v3) {
    return (id)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility accessibilityUserDefinedHint]( self,  "accessibilityUserDefinedHint"));
  }
  char v17 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKSettingItem, v4);
  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v17);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v17) {
    abort();
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityHint]);
  if ([v10 length])
  {
    id v11 = v10;
    id v12 = v11;
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility _accessibilitySettingGroupForCell]( self,  "_accessibilitySettingGroupForCell"));
    id v11 = (id)objc_claimAutoreleasedReturnValue([v13 accessibilityHint]);

    if ([v11 length])
    {
      id v14 = v11;
    }

    else
    {
      v16.receiver = self;
      v16.super_class = (Class)&OBJC_CLASS___TSKTableViewTextCellAccessibility;
      id v15 = -[TSKTableViewTextCellAccessibility accessibilityHint](&v16, "accessibilityHint");
      id v14 = (id)objc_claimAutoreleasedReturnValue(v15);
    }

    id v12 = v14;
  }

  return v12;
}

- (id)_accessibilitySettingGroupForCell
{
  id v3 = -[TSKTableViewTextCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UITableView, a2));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  char v32 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TSKViewController, v5);
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"delegate"]);
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v32);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v32
    || (char v32 = 0,
        uint64_t v11 = objc_opt_class(&OBJC_CLASS___TSKSettingItem, v10),
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"item")),
        uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v32),
        id v14 = (void *)objc_claimAutoreleasedReturnValue(v13),
        v12,
        v32))
  {
    abort();
  }

  id v27 = v4;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v9 visibleSettingGroups]);
  id v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v16)
  {
    id v17 = v16;
    id v18 = 0LL;
    uint64_t v19 = *(void *)v29;
    do
    {
      for (i = 0LL; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v15);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)i);
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 settingItems]);
        unsigned int v23 = [v22 containsObject:v14];

        if (v23)
        {
          id v24 = v21;

          id v18 = v24;
        }
      }

      id v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }

    while (v17);
  }

  else
  {
    id v18 = 0LL;
  }

  id v25 = v18;
  return v25;
}

- (id)accessibilityValue_TSKTableViewTextCell
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"accessories"));
  unsigned __int8 v4 = [v3 unsignedIntegerValue];

  if ((v4 & 4) != 0)
  {
    id v6 = accessibilityLocalizedString(@"tv.in.progress");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v6);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  int v7 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"rightText"));
  if (!v7)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"detailTextLabel"));
    int v7 = (void *)objc_claimAutoreleasedReturnValue([v8 accessibilityLabel]);
  }

  uint64_t v9 = __UIAXStringForVariables(v7);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (unint64_t)accessibilityTraits
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___TSKTableViewTextCellAccessibility;
  unint64_t v3 = -[TSKTableViewTextCellAccessibility accessibilityTraits](&v14, "accessibilityTraits");
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSKTableViewTextCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"accessories"));
  unsigned __int8 v5 = [v4 unsignedIntegerValue];

  if ((v5 & 2) != 0) {
    UIAccessibilityTraits v6 = UIAccessibilityTraitSelected | v3;
  }
  else {
    UIAccessibilityTraits v6 = v3 & ~UIAccessibilityTraitSelected;
  }
  id v7 = -[TSKTableViewTextCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  AXSafeClassFromString(@"TVTableView"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 safeValueForKey:@"delegate"]);
  Class v10 = NSClassFromString(@"AXTVVoiceOverVoiceViewController");
  char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

  UIAccessibilityTraits v12 = UIAccessibilityTraitUpdatesFrequently;
  if ((isKindOfClass & 1) == 0) {
    UIAccessibilityTraits v12 = 0LL;
  }
  return v12 | v6;
}

- (BOOL)_atvaccessibilityIsTVResolutionCell
{
  id v2 = -[TSKTableViewTextCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UITableView, a2));
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"delegate"]);
  Class v5 = NSClassFromString(@"TVSettingsResolutionViewController");
  char isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  return isKindOfClass & 1;
}

- (id)_accessibilityLinkedUIElements
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = __67__TSKTableViewTextCellAccessibility__accessibilityLinkedUIElements__block_invoke;
  v19[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v19[4] = AXSafeClassFromString(@"_TSKSplitViewController");
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TSKTableViewTextCellAccessibility _accessibilityFindAncestor:startWithSelf:]( self,  "_accessibilityFindAncestor:startWithSelf:",  v19,  0LL));
  char v18 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UIViewController, v4);
  UIAccessibilityTraits v6 = (void *)objc_claimAutoreleasedReturnValue([v3 _accessibilityViewController]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v18);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v18
    || (char v18 = 0,
        uint64_t v10 = objc_opt_class(&OBJC_CLASS___UIViewController, v9),
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 safeValueForKey:@"previewViewController"]),
        uint64_t v12 = __UIAccessibilityCastAsClass(v10, v11, 1LL, &v18),
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12),
        v11,
        v18))
  {
    abort();
  }

  if ([v13 isViewLoaded])
  {
    objc_super v14 = (void *)objc_claimAutoreleasedReturnValue( +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions]( &OBJC_CLASS___UIAccessibilityElementTraversalOptions,  "defaultVoiceOverOptions"));
    [v14 setLeafNodePredicate:&__block_literal_global_235];
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 view]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 _accessibilityLeafDescendantsWithCount:1 options:v14]);
  }

  else
  {
    id v16 = 0LL;
  }

  return v16;
}

uint64_t __67__TSKTableViewTextCellAccessibility__accessibilityLinkedUIElements__block_invoke( uint64_t a1,  void *a2)
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 _accessibilityViewController]);
  LOBYTE(a1) = objc_opt_isKindOfClass(v3, *(void *)(a1 + 32));

  return a1 & 1;
}

BOOL __67__TSKTableViewTextCellAccessibility__accessibilityLinkedUIElements__block_invoke_2(id a1, id a2)
{
  return [a2 isAccessibilityElement];
}

@end