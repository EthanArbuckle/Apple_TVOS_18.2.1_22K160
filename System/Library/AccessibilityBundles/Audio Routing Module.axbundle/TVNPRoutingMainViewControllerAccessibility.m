@interface TVNPRoutingMainViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidLoad;
@end

@implementation TVNPRoutingMainViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVNPRoutingMainViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingMainViewController",  @"viewDidLoad",  "v",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingMainViewController",  @"titleView",  "@",  0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"MPRouteLabel", @"text", "@", 0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingMainViewController",  @"hintView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingMainViewController",  @"routingController",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingMainViewController",  @"routesCollectionViewController",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingMainViewController",  @"editingVolume",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingRoutesCollectionViewController",  @"focusedRoute",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoute",  @"selectionState",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoute",  @"volumeLevel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingDestination",  @"routeNames",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVNPRoutingDestination",  @"volumeLevel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewControllerAccessibility;
  -[TVNPRoutingMainViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v13,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPRoutingMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleView"));
  [v3 setIsAccessibilityElement:1];
  objc_initWeak(&location, v3);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __88__TVNPRoutingMainViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v10[3] = &unk_41C0;
  objc_copyWeak(&v11, &location);
  [v3 _setAccessibilityLabelBlock:v10];
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];
  [v3 _accessibilitySetUserDefinedIsGuideElement:0];
  [v3 _setAccessibilityServesAsFirstElement:0];
  objc_initWeak(&from, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPRoutingMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"hintView"));
  objc_initWeak(&v8, v4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __88__TVNPRoutingMainViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v5[3] = &unk_41E8;
  objc_copyWeak(&v6, &from);
  objc_copyWeak(&v7, &v8);
  [v4 _setAccessibilityLabelBlock:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);

  objc_destroyWeak(&from);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

id __88__TVNPRoutingMainViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained safeValueForKey:@"text"]);

  return v2;
}

id __88__TVNPRoutingMainViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained safeValueForKey:@"routingController"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"currentDestination"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"volumeLevel"]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained safeValueForKey:@"routesCollectionViewController"]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 safeValueForKey:@"focusedRoute"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 safeValueForKey:@"volumeLevel"]);

  v9 = (char *)[v7 safeIntegerForKey:@"selectionState"];
  unsigned __int8 v10 = [WeakRetained safeBoolForKey:@"editingVolume"];
  if (v5 && !v7)
  {
    id v11 = (id)objc_claimAutoreleasedReturnValue([v4 safeArrayForKey:@"routeNames"]);
    if ([v11 count])
    {
      id v12 = accessibilityLocalizedString(@"master.volume.button.hint");
      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSListFormatter localizedStringByJoiningStrings:]( &OBJC_CLASS___NSListFormatter,  "localizedStringByJoiningStrings:",  v11));
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  v13,  v14));

LABEL_15:
      goto LABEL_16;
    }

LABEL_14:
    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"text"]);
    goto LABEL_15;
  }

  if (v8) {
    BOOL v16 = v9 == (_BYTE *)&dword_0 + 2;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16) {
    char v17 = v10;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) != 0) {
    goto LABEL_14;
  }
  id v18 = accessibilityLocalizedString(@"route.supports.volume.button.adjustments.hint");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v18);
LABEL_16:

  return v15;
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVNPRoutingMainViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVNPRoutingMainViewControllerAccessibility;
  -[TVNPRoutingMainViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[TVNPRoutingMainViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end