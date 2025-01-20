@interface TSKPreviewViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySelectedTVSettingCell;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation TSKPreviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKPreviewViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKPreviewViewController",  @"descriptionLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UITableView",  @"_focusedCell",  "@",  0);
  [v3 validateClass:@"_TSKSplitViewController"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TSKPreviewViewControllerAccessibility;
  -[TSKPreviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v21,  "_accessibilityLoadAccessibilityInformation");
  LOBYTE(location) = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSKPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"view"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &location);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if ((_BYTE)location) {
    abort();
  }
  [v7 setAccessibilityIdentifier:@"PreviewRootView"];
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 _accessibilityFindSubviewDescendantsPassingTest:&__block_literal_global_0]);
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)i) _accessibilitySetRetainedValue:@"•" forKey:kUIAXLabelStringDelimiterReplacement];
      }

      id v10 = [v9 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }

    while (v10);
  }

  objc_initWeak(&location, self);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TSKPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"view"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = __83__TSKPreviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v14[3] = &unk_8308;
  objc_copyWeak(&v15, &location);
  [v13 _setAccessibilityLinkedUIElementsBlock:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

BOOL __83__TSKPreviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( id a1,  UIView *a2,  BOOL *a3)
{
  uint64_t v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UILabel, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  return isKindOfClass & 1;
}

id __83__TSKPreviewViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _accessibilitySelectedTVSettingCell]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (id)_accessibilitySelectedTVSettingCell
{
  uint64_t v3 = AXSafeClassFromString(@"_TSKSplitViewController");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[TSKPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"view"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __76__TSKPreviewViewControllerAccessibility__accessibilitySelectedTVSettingCell__block_invoke;
  v28[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v28[4] = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 _accessibilityFindAncestor:v28 startWithSelf:0]);

  char v27 = 0;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIViewController, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 _accessibilityViewController]);
  uint64_t v9 = __UIAccessibilityCastAsClass(v7, v8, 1LL, &v27);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v27) {
    goto LABEL_5;
  }
  char v27 = 0;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___UINavigationController, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"navigationController"]);
  uint64_t v14 = __UIAccessibilityCastAsClass(v12, v13, 1LL, &v27);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if (v27
    || (char v27 = 0,
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___UITableViewController, v16),
        __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v15 topViewController]),
        uint64_t v19 = __UIAccessibilityCastAsClass(v17, v18, 1LL, &v27),
        __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(v19),
        v18,
        v27))
  {
LABEL_5:
    abort();
  }

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v20 tableView]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 safeValueForKey:@"_focusedCell"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions]( &OBJC_CLASS___UIAccessibilityElementTraversalOptions,  "defaultVoiceOverOptions"));
  [v23 setLeafNodePredicate:&__block_literal_global_211];
  v24 = (void *)objc_claimAutoreleasedReturnValue([v22 _accessibilityLeafDescendantsWithCount:1 options:v23]);
  v25 = (void *)objc_claimAutoreleasedReturnValue([v24 firstObject]);

  return v25;
}

uint64_t __76__TSKPreviewViewControllerAccessibility__accessibilitySelectedTVSettingCell__block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 _accessibilityViewController]);
  LOBYTE(a1) = objc_opt_isKindOfClass(v3, *(void *)(a1 + 32));

  return a1 & 1;
}

BOOL __76__TSKPreviewViewControllerAccessibility__accessibilitySelectedTVSettingCell__block_invoke_2( id a1,  id a2)
{
  return [a2 isAccessibilityElement];
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TSKPreviewViewControllerAccessibility;
  -[TSKPreviewViewControllerAccessibility loadView](&v3, "loadView");
  -[TSKPreviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end