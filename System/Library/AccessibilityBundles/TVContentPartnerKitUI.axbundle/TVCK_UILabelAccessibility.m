@interface TVCK_UILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityHasLabelSiblings;
- (id)_accessibilityAncestorFocusParcel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVCK_UILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (unint64_t)accessibilityTraits
{
  if (accessibilityTraits_onceToken != -1) {
    dispatch_once(&accessibilityTraits_onceToken, &__block_literal_global_0);
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVCK_UILabelAccessibility;
  unint64_t v3 = -[TVCK_UILabelAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVCK_UILabelAccessibility _accessibilityNativeFocusAncestor]( self,  "_accessibilityNativeFocusAncestor"));
  if (v4)
  {
  }

  else if (!-[TVCK_UILabelAccessibility _accessibilityHasLabelSiblings](self, "_accessibilityHasLabelSiblings"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVCK_UILabelAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  accessibilityTraits_class_TVOrganizerCellView));

    if (v5) {
      v3 |= UIAccessibilityTraitHeader;
    }
  }

  return v3;
}

- (BOOL)_accessibilityHasLabelSiblings
{
  char v23 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVCK_UILabelAccessibility safeValueForKey:](self, "safeValueForKey:", @"superview"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _accessibilitySubviews]);
  uint64_t v6 = __UIAccessibilityCastAsClass(v3, v5, 1LL, &v23);
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v23) {
    abort();
  }
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = 0LL;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___UILabel, v10);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          BOOL v17 = 1;
          if (v12) {
            goto LABEL_13;
          }
          uint64_t v12 = 1LL;
        }
      }

      id v11 = [v8 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }

    while (v11);
  }

  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (id)_accessibilityAncestorFocusParcel
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXATVUtils sharedInstance](&OBJC_CLASS___AXATVUtils, "sharedInstance"));
  unsigned __int8 v4 = [v3 isProcessTVAppStore];

  if ((v4 & 1) != 0) {
    return 0LL;
  }
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVCK_UILabelAccessibility;
  id v6 = -[TVCK_UILabelAccessibility _accessibilityAncestorFocusParcel](&v7, "_accessibilityAncestorFocusParcel");
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

@end