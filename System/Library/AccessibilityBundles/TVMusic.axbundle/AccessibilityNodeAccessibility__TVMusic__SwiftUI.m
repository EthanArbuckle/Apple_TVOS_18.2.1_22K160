@interface AccessibilityNodeAccessibility__TVMusic__SwiftUI
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityAncestorFocusParcel;
- (id)_axHeaderElementsForPosterOrSquareLockup;
- (id)accessibilityHeaderElements;
- (void)_accessibilityGetIDsFromAccessibilityIdentifier:(id)a3 identifier:(id *)a4 parentIdentifier:(id *)a5;
@end

@implementation AccessibilityNodeAccessibility__TVMusic__SwiftUI

+ (id)safeCategoryTargetClassName
{
  return @"SwiftUI.AccessibilityNode";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (void)_accessibilityGetIDsFromAccessibilityIdentifier:(id)a3 identifier:(id *)a4 parentIdentifier:(id *)a5
{
  id v7 = a3;
  if (_accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier__onceToken != -1)
  {
    id v19 = v7;
    dispatch_once( &_accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier__onceToken,  &__block_literal_global_0);
    id v7 = v19;
  }

  if (_accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier__regex)
  {
    v18 = v7;
    v8 = (char *)[v7 length];
    v9 = (char *)[v18 length];
    id v7 = v18;
    if (v18)
    {
      if (v8 && v9 <= v8)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( (id)_accessibilityGetIDsFromAccessibilityIdentifier_identifier_parentIdentifier__regex,  "matchesInString:options:range:"));
        v11 = (void *)objc_claimAutoreleasedReturnValue([v10 firstObject]);

        if ([v11 numberOfRanges] == (char *)&dword_0 + 3)
        {
          v12 = (char *)[v11 rangeAtIndex:1];
          v14 = 0LL;
          v15 = (char *)[v11 rangeAtIndex:2];
          v17 = 0LL;
          if (a4 && v14) {
            *a4 = v14;
          }
          if (a5 && v17) {
            *a5 = v17;
          }
        }

        id v7 = v18;
      }
    }
  }
}

- (id)_accessibilityAncestorFocusParcel
{
  return 0LL;
}

- (id)accessibilityHeaderElements
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[AccessibilityNodeAccessibility__TVMusic__SwiftUI accessibilityIdentifier]( self,  "accessibilityIdentifier"));
  if (([v3 hasPrefix:@"TVMusic.shelfItem.PosterLockup"] & 1) != 0
    || [v3 hasPrefix:@"TVMusic.shelfItem.SquareLockup"])
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue( -[AccessibilityNodeAccessibility__TVMusic__SwiftUI _axHeaderElementsForPosterOrSquareLockup]( self,  "_axHeaderElementsForPosterOrSquareLockup"));
  }

  else
  {
    if ([v3 hasPrefix:@"TVMusic.shelfItem.SocialProfileDetailHeaderLockup"])
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( -[AccessibilityNodeAccessibility__TVMusic__SwiftUI _accessibilityParentView]( self,  "_accessibilityParentView"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityElements]);
      v8 = (void *)objc_claimAutoreleasedReturnValue([v7 firstObject]);

      uint64_t v9 = AXSafeClassFromString(@"SwiftUI.AccessibilityIncrementalLayoutNode");
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 safeSwiftArrayForKey:@"children"]);
        id v11 = [v10 indexOfObject:self];
        id v12 = v11;
        if (v11 && v11 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "subarrayWithRange:", 0, v11));
          v5 = (void *)objc_claimAutoreleasedReturnValue([v13 axFilterObjectsUsingBlock:&__block_literal_global_199]);
        }

        if (v12 != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if (v12)
          {

            goto LABEL_5;
          }
        }
      }
    }

    else if ([v3 hasPrefix:@"TVMusic.productPage.ContainerDetailInfoView.interactiveElements"])
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[AccessibilityNodeAccessibility__TVMusic__SwiftUI _accessibilityParentView]( self,  "_accessibilityParentView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 accessibilityElements]);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "ax_filteredArrayUsingBlock:", &__block_literal_global_203));

      goto LABEL_5;
    }

    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___AccessibilityNodeAccessibility__TVMusic__SwiftUI;
    id v16 = -[AccessibilityNodeAccessibility__TVMusic__SwiftUI accessibilityHeaderElements]( &v17,  "accessibilityHeaderElements");
    uint64_t v4 = objc_claimAutoreleasedReturnValue(v16);
  }

  v5 = (void *)v4;
LABEL_5:

  return v5;
}

- (id)_axHeaderElementsForPosterOrSquareLockup
{
  v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableSet, a2);
  v26 = self;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", self));
  do
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 anyObject]);
    [v4 removeObject:v5];
    [v3 addObject:v5];
    v6 = (void *)objc_claimAutoreleasedReturnValue([v5 safeSwiftValueForKey:@"parent"]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 safeSwiftArrayForKey:@"children"]);
    v8 = v7;
    if (v7) {
      id v9 = v7;
    }
    else {
      id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    }
    v10 = v9;

    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v33;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v32 + 1) + 8LL * (void)i);
        }

        id v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }

      while (v12);
    }
  }

  while ([v4 count]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v3 allObjects]);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sortedArrayUsingComparator:&__block_literal_global_212]);

  id v18 = [v17 indexOfObject:v26];
  v20 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v19);
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  char v31 = 0;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subarrayWithRange:", 0, v18));
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472LL;
  v27[2] = __92__AccessibilityNodeAccessibility__TVMusic__SwiftUI__axHeaderElementsForPosterOrSquareLockup__block_invoke_2;
  v27[3] = &unk_8370;
  v29 = v30;
  id v22 = v20;
  id v28 = v22;
  [v21 enumerateObjectsWithOptions:2 usingBlock:v27];

  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 reverseObjectEnumerator]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 allObjects]);

  _Block_object_dispose(v30, 8);
  return v24;
}

@end