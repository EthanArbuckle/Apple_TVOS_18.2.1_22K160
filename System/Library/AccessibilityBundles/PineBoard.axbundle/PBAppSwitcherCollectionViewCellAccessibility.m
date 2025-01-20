@interface PBAppSwitcherCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityCloseAppCustomAction:(id)a3;
- (BOOL)_accessibilityIsHomescreenAppSwitchItem;
- (BOOL)_isAccessibilityExplorerElement;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityCustomActions;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)_accessibilityScanningBehaviorTraits;
- (unint64_t)accessibilityTraits;
@end

@implementation PBAppSwitcherCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBAppSwitcherCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"_PBAppSwitcherCollectionView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherCollectionViewCell",  @"titleView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherCollectionViewCell",  @"appSwitcherItem",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherCollectionViewCell",  @"itemContentView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherItem",  @"itemType",  "q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherTitleView",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"PBAppSwitcherCollectionViewController",  @"upDoubleTapped:",  "v",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"title"]);

  if (![v4 length]
    && -[PBAppSwitcherCollectionViewCellAccessibility _accessibilityIsHomescreenAppSwitchItem]( self,  "_accessibilityIsHomescreenAppSwitchItem"))
  {
    id v5 = accessibilityLocalizedString(@"app.switcher.homescreen.label");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);

    v4 = (void *)v6;
  }

  return v4;
}

- (id)accessibilityIdentifier
{
  return @"AppSwitcherItem";
}

- (BOOL)_isAccessibilityExplorerElement
{
  return 0;
}

- (BOOL)_accessibilityIsHomescreenAppSwitchItem
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[PBAppSwitcherCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"appSwitcherItem"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"itemType"]);
  BOOL v4 = [v3 integerValue] == (char *)&dword_0 + 1;

  return v4;
}

- (BOOL)_accessibilityCloseAppCustomAction:(id)a3
{
  id v4 = a3;
  char v15 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UICollectionView, v5);
  id v7 = -[PBAppSwitcherCollectionViewCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  NSClassFromString(@"_PBAppSwitcherCollectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = __UIAccessibilityCastAsClass(v6, v8, 1LL, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v15) {
    abort();
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __83__PBAppSwitcherCollectionViewCellAccessibility__accessibilityCloseAppCustomAction___block_invoke;
  v13[3] = &unk_82E8;
  id v14 = (id)objc_claimAutoreleasedReturnValue([v10 delegate]);
  id v11 = v14;
  AXPerformSafeBlock(v13);

  return 1;
}

void __83__PBAppSwitcherCollectionViewCellAccessibility__accessibilityCloseAppCustomAction___block_invoke( uint64_t a1)
{
  id v2 = (id)objc_opt_new(&OBJC_CLASS___AXProgramaticUITapGestureRecognizer);
  [v2 setAxProgramaticState:3];
  [*(id *)(a1 + 32) upDoubleTapped:v2];
}

- (id)accessibilityCustomActions
{
  if (-[PBAppSwitcherCollectionViewCellAccessibility _accessibilityIsHomescreenAppSwitchItem]( self,  "_accessibilityIsHomescreenAppSwitchItem"))
  {
    return 0LL;
  }

  id AssociatedObject = objc_getAssociatedObject(self, &_AXCustomActionsKey);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (!v5)
  {
    uint64_t v6 = objc_alloc(&OBJC_CLASS___UIAccessibilityCustomAction);
    id v7 = accessibilityLocalizedString(@"close.app.action");
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = -[UIAccessibilityCustomAction initWithName:target:selector:]( v6,  "initWithName:target:selector:",  v8,  self,  "_accessibilityCloseAppCustomAction:");

    v10 = v9;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    objc_setAssociatedObject(self, &_AXCustomActionsKey, v5, &stru_2E8.segname[9]);
  }

  return v5;
}

- (id)_accessibilityFrameDelegate
{
  return -[PBAppSwitcherCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"itemContentView");
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 5LL;
}

- (id)accessibilityHint
{
  id v3 = accessibilityLocalizedString(@"app.switcher.app.hint");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBAppSwitcherCollectionViewCellAccessibility accessibilityLabel](self, "accessibilityLabel"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v4, v5));

  return v6;
}

@end