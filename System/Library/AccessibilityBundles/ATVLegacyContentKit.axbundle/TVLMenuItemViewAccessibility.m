@interface TVLMenuItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityAccessoryDescriptions;
- (unint64_t)accessibilityTraits;
- (void)configureWithMenuItemElement:(id)a3;
@end

@implementation TVLMenuItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLMenuItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"configureWithMenuItemElement:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"dimmed",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemView",  @"rightAccessoryViews",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMenuItemElement",  @"accessories",  "@",  0);
}

- (unint64_t)accessibilityTraits
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLMenuItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"dimmed"));
  unsigned int v4 = [v3 BOOLValue];

  if (v4) {
    UIAccessibilityTraits v5 = UIAccessibilityTraitNotEnabled;
  }
  else {
    UIAccessibilityTraits v5 = 0LL;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVLMenuItemViewAccessibility _accessibilityValueForKey:]( self,  "_accessibilityValueForKey:",  @"ax_menuItem"));
  if (v7)
  {
    char v13 = 0;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v7 safeValueForKey:@"accessories"]);
    uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v13) {
      abort();
    }
    if (([v11 containsObject:@"rightCheckMark"] & 1) != 0
      || [v11 containsObject:@"checkMark"])
    {
      v5 |= UIAccessibilityTraitSelected;
    }
  }

  return v5;
}

- (id)_accessibilityAccessoryDescriptions
{
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVLMenuItemViewAccessibility _accessibilityValueForKey:]( self,  "_accessibilityValueForKey:",  @"ax_menuItem"));
  if (v4)
  {
    char v42 = 0;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSArray, v3);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"accessories"]);
    uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v42);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    if (v42) {
      goto LABEL_23;
    }
    if ([v8 containsObject:@"partiallyPlayedDot"])
    {
      id v9 = accessibilityLocalizedString(@"partially.played");
      v34 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v36 = @"__AXStringForVariablesSentinel";
      uint64_t v10 = __UIAXStringForVariables(0LL);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    }

    else
    {
      v11 = 0LL;
    }

    if (objc_msgSend(v8, "containsObject:", @"unplayedDot", v34, v36))
    {
      id v12 = accessibilityLocalizedString(@"unplayed");
      v35 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v37 = @"__AXStringForVariablesSentinel";
      uint64_t v13 = __UIAXStringForVariables(v11);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);

      v11 = (void *)v14;
    }

    if (objc_msgSend(v8, "containsObject:", @"HD", v35, v37))
    {
      id v15 = accessibilityLocalizedString(@"HD");
      v34 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v36 = @"__AXStringForVariablesSentinel";
      uint64_t v16 = __UIAXStringForVariables(v11);
      uint64_t v17 = objc_claimAutoreleasedReturnValue(v16);

      v11 = (void *)v17;
    }
  }

  else
  {
    v11 = 0LL;
  }

  char v42 = 0;
  uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSArray, v3);
  v19 = (void *)objc_claimAutoreleasedReturnValue( -[TVLMenuItemViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"rightAccessoryViews"));
  uint64_t v20 = __UIAccessibilityCastAsClass(v18, v19, 1LL, &v42);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v42) {
LABEL_23:
  }
    abort();
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v39;
    do
    {
      for (i = 0LL; i != v24; i = (char *)i + 1)
      {
        if (*(void *)v39 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v38 + 1) + 8LL * (void)i);
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "accessibilityLabel", v34, v36, (void)v38));
        id v29 = [v28 length];

        if (v29)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue([v27 accessibilityLabel]);
          v36 = @"__AXStringForVariablesSentinel";
          uint64_t v30 = __UIAXStringForVariables(v11);
          uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);

          v11 = (void *)v31;
        }
      }

      id v24 = [v22 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }

    while (v24);
  }

  id v32 = v11;
  return v32;
}

- (void)configureWithMenuItemElement:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVLMenuItemViewAccessibility;
  id v4 = a3;
  -[TVLMenuItemViewAccessibility configureWithMenuItemElement:](&v5, "configureWithMenuItemElement:", v4);
  -[TVLMenuItemViewAccessibility _accessibilitySetRetainedValue:forKey:]( self,  "_accessibilitySetRetainedValue:forKey:",  v4,  @"ax_menuItem",  v5.receiver,  v5.super_class);
}

@end