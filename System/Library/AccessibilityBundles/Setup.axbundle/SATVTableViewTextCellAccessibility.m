@interface SATVTableViewTextCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLanguage;
- (unint64_t)accessibilityTraits;
@end

@implementation SATVTableViewTextCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVTableViewTextCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SATVLanguageViewController"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVLanguageViewController",  @"internationalUtility",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVInternationalUtility",  @"orderedLanguageCodes",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SATVTableViewTextCellAccessibility;
  unint64_t v3 = -[SATVTableViewTextCellAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  unsigned int v4 = -[SATVTableViewTextCellAccessibility _accessibilityCanBecomeNativeFocused]( self,  "_accessibilityCanBecomeNativeFocused");
  UIAccessibilityTraits v5 = UIAccessibilityTraitButton;
  if (!v4) {
    UIAccessibilityTraits v5 = 0LL;
  }
  return v5 | v3;
}

- (id)accessibilityLanguage
{
  id v3 = -[SATVTableViewTextCellAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UITableView, a2));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  UIAccessibilityTraits v5 = (void *)objc_claimAutoreleasedReturnValue([v4 delegate]);
  uint64_t v6 = AXSafeClassFromString(@"SATVLanguageViewController");
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 indexPathForCell:self]);
  if (!v7) {
    goto LABEL_5;
  }
  v8 = (void *)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 safeValueForKey:@"internationalUtility"]);
  LOBYTE(v25) = 0;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSArray, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 safeValueForKey:@"orderedLanguageCodes"]);
  uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v25);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if ((_BYTE)v25) {
    abort();
  }
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  id v30 = 0LL;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = __59__SATVTableViewTextCellAccessibility_accessibilityLanguage__block_invoke;
  v21[3] = &unk_8220;
  v24 = &v25;
  id v15 = v14;
  id v22 = v15;
  id v16 = v8;
  id v23 = v16;
  AXPerformSafeBlock(v21);
  id v17 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  if (!v17)
  {
LABEL_5:
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___SATVTableViewTextCellAccessibility;
    id v18 = -[SATVTableViewTextCellAccessibility accessibilityLanguage](&v20, "accessibilityLanguage");
    id v17 = (id)objc_claimAutoreleasedReturnValue(v18);
  }

  return v17;
}

void __59__SATVTableViewTextCellAccessibility_accessibilityLanguage__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row")));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  unsigned int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end