@interface SATVPrivacyViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SATVPrivacyViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVPrivacyViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SATVPrivacyViewController" isKindOfClass:@"UIViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVPrivacyViewController",  @"viewDidAppear:",  "v",  "B",  0);
  [v3 validateClass:@"TVSKViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSKViewController",  @"animationStateView",  "@",  0);
  [v3 validateClass:@"TVSKAnimationStateView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSKAnimationStateView",  @"animationStateLayer",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v31.receiver = self;
  v31.super_class = (Class)&OBJC_CLASS___SATVPrivacyViewControllerAccessibility;
  -[SATVPrivacyViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v31,  "_accessibilityLoadAccessibilityInformation");
  LOBYTE(v25) = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIViewController, v3);
  uint64_t v5 = __UIAccessibilityCastAsClass(v4, self, 1LL, &v25);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(v5);
  if ((_BYTE)v25) {
    goto LABEL_11;
  }
  v7 = (void *)v6;
  uint64_t v8 = AXSafeClassFromString(@"TVSKViewController");
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0) {
    goto LABEL_10;
  }
  LOBYTE(v25) = 0;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___CALayer, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v7 safeValueForKey:@"animationStateView"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"animationStateLayer"]);
  uint64_t v13 = __UIAccessibilityCastAsClass(v10, v12, 1LL, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if ((_BYTE)v25) {
LABEL_11:
  }
    abort();
  if (v7 && v14)
  {
    uint64_t v25 = 0LL;
    v26 = &v25;
    uint64_t v27 = 0x3032000000LL;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    id v30 = 0LL;
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sublayers]);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = __84__SATVPrivacyViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v24[3] = &unk_82B0;
    v24[4] = &v25;
    [v15 enumerateObjectsUsingBlock:v24];

    v16 = (void *)v26[5];
    if (v16)
    {
      [v16 setIsAccessibilityElement:1];
      v17 = (void *)v26[5];
      [v17 frame];
      objc_msgSend(v17, "setAccessibilityFrame:");
      [(id)v26[5] setAccessibilityTraits:kAXProminentIconTrait];
      v18 = (void *)v26[5];
      id v19 = accessibilityLocalizedString(@"privacy.icon");
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      [v18 setAccessibilityLabel:v20];

      v21 = (void *)objc_claimAutoreleasedReturnValue([v7 view]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 subviews]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v22));

      [v23 axSafelyAddObject:v26[5]];
      [v21 setAccessibilityElements:v23];
    }

    _Block_object_dispose(&v25, 8);
  }

LABEL_10:
}

void __84__SATVPrivacyViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v9 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
  unsigned int v8 = [v7 isEqualToString:@"GDPR"];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), a2);
    *a4 = 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVPrivacyViewControllerAccessibility;
  -[SATVPrivacyViewControllerAccessibility viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[SATVPrivacyViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end