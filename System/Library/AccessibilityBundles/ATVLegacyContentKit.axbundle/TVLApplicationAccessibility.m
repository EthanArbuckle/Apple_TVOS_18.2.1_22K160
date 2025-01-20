@interface TVLApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_atvaccessibilitySemanticContextCustomActions;
- (id)_atvaccessibilityTabBarViewController;
@end

@implementation TVLApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  uint64_t v3 = AXValidationClientSiriSemanticContext;
  id v4 = a3;
  [v4 client:v3 validateClass:@"TVLAppDelegate"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"TVLAppDelegate",  @"window",  "@",  0);
  [v4 validateClass:@"TVLApplication" isKindOfClass:@"TVApplication"];
}

- (id)_atvaccessibilitySemanticContextCustomActions
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( -[TVLApplicationAccessibility _atvaccessibilityTabBarViewController]( self,  "_atvaccessibilityTabBarViewController"));
  uint64_t v3 = (void *)v2;
  if (v2 && (objc_opt_respondsToSelector(v2, "_atvaccessibilityTabBarCustomActions") & 1) != 0) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 _atvaccessibilityTabBarCustomActions]);
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (id)_atvaccessibilityTabBarViewController
{
  char v15 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIWindow, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVLApplicationAccessibility safeValueForKey:](self, "safeValueForKey:", @"delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"window"]);
  uint64_t v6 = __UIAccessibilityCastAsClass(v3, v5, 1LL, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v15) {
    abort();
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 rootViewController]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 childViewControllers]);
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 firstObject]);

  uint64_t v12 = objc_opt_class(&OBJC_CLASS___UITabBarController, v11);
  if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0) {
    id v13 = v10;
  }
  else {
    id v13 = 0LL;
  }

  return v13;
}

@end