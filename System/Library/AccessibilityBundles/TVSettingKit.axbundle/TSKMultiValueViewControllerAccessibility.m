@interface TSKMultiValueViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_updateAppearance;
@end

@implementation TSKMultiValueViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKMultiValueViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKMultiValueViewController",  @"_updateAppearance",  "v",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKMultiValueViewController",  @"editingItem",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKSettingItem",  @"availableValues",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TSKSettingItem",  @"keyPath",  "@",  0);
}

- (void)_updateAppearance
{
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TSKMultiValueViewControllerAccessibility;
  -[TSKMultiValueViewControllerAccessibility _updateAppearance](&v26, "_updateAppearance");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TSKMultiValueViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"editingItem"));
  char v25 = 0;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"keyPath"]);
  uint64_t v7 = __UIAccessibilityCastAsClass(v5, v6, 1LL, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v25) {
    goto LABEL_8;
  }
  char v25 = 0;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSArray, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[TSKMultiValueViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"actions"));
  uint64_t v12 = __UIAccessibilityCastAsClass(v10, v11, 1LL, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v25
    || (char v25 = 0,
        uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSArray, v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"availableValues"]),
        uint64_t v17 = __UIAccessibilityCastAsClass(v15, v16, 1LL, &v25),
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17),
        v16,
        v25))
  {
LABEL_8:
    abort();
  }

  if ([v8 isEqualToString:@"systemLanguage"])
  {
    id v19 = [v13 count];
    BOOL v20 = v19 == [v18 count];
  }

  else
  {
    BOOL v20 = 0;
  }

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = __61__TSKMultiValueViewControllerAccessibility__updateAppearance__block_invoke;
  v22[3] = &unk_8350;
  BOOL v24 = v20;
  id v23 = v18;
  id v21 = v18;
  [v13 enumerateObjectsUsingBlock:v22];
}

void __61__TSKMultiValueViewControllerAccessibility__updateAppearance__block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v8 safeValueForKey:@"title"]);
  if ([v5 length] == (char *)&dword_0 + 1)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 lowercaseString]);

    uint64_t v5 = (void *)v6;
  }

  [v8 setAccessibilityLabel:v5];
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectAtIndexedSubscript:a3]);
    [v8 setAccessibilityLanguage:v7];
  }
}

@end