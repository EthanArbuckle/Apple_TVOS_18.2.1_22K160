@interface TVLActionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (_NSRange)accessibilityRowRange;
@end

@implementation TVLActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLActionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVLItemDetailView"];
  [v3 validateClass:@"TVLHeaderWithCountAndButtonsView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLItemDetailView",  @"toolbarView",  "@",  0);
}

- (_NSRange)accessibilityRowRange
{
  id v3 = -[TVLActionButtonAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  NSClassFromString(@"TVLItemDetailView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v5) {
    goto LABEL_4;
  }
  char v23 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIView, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 safeValueForKey:@"toolbarView"]);
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v23) {
    abort();
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 subviews]);
  id v11 = [v10 count];

  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 subviews]);
  id v13 = [v12 indexOfObject:self];

  if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_4:
    id v14 = -[TVLActionButtonAccessibility _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  NSClassFromString(@"TVLHeaderWithCountAndButtonsView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = v15;
    if (!v15
      || (v17 = (void *)objc_claimAutoreleasedReturnValue([v15 subviews]),
          v18 = (void *)objc_claimAutoreleasedReturnValue([v17 axFilterObjectsUsingBlock:&__block_literal_global_0]),
          v17,
          id v11 = [v18 count],
          id v13 = [v18 indexOfObject:self],
          v18,
          v13 == (id)0x7FFFFFFFFFFFFFFFLL))
    {
      v22.receiver = self;
      v22.super_class = (Class)&OBJC_CLASS___TVLActionButtonAccessibility;
      id v13 = -[TVLActionButtonAccessibility accessibilityRowRange](&v22, "accessibilityRowRange");
      id v11 = v19;
    }
  }

  NSUInteger v20 = (NSUInteger)v13;
  NSUInteger v21 = (NSUInteger)v11;
  result.length = v21;
  result.location = v20;
  return result;
}

BOOL __53__TVLActionButtonAccessibility_accessibilityRowRange__block_invoke(id a1, id a2, unint64_t a3)
{
  id v3 = a2;
  Class v4 = NSClassFromString(@"TVLActionButton");
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return isKindOfClass & 1;
}

@end