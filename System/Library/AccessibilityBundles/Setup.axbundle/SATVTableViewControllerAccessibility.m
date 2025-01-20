@interface SATVTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation SATVTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SATVLanguageHeaderView"];
  [v3 validateClass:@"SATVTableViewController" hasProperty:@"bannerView" withType:"@"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVLanguageHeaderView",  @"visibleHeaderView",  "@",  0);
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  uint64_t v4 = AXSafeClassFromString(@"SATVHeaderView");
  uint64_t v5 = AXSafeClassFromString(@"SATVLanguageHeaderView");
  char v14 = 0;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___UIView, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVTableViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", @"bannerView"));
  uint64_t v9 = __UIAccessibilityCastAsClass(v7, v8, 1LL, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v14) {
    abort();
  }
  if ((objc_opt_isKindOfClass(v10, v4) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"titleLabel"]);
    [v3 axSafelyAddObject:v11];
LABEL_6:

    goto LABEL_7;
  }

  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"visibleHeaderView"]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"titleLabel"]);
    [v3 axSafelyAddObject:v12];

    goto LABEL_6;
  }

@end