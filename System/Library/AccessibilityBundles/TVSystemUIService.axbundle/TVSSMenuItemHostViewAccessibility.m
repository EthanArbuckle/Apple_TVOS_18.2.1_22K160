@interface TVSSMenuItemHostViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityContent;
- (id)_accessibilityParentStackView;
- (id)_accessibilityVisualContent;
- (id)accessibilityHeaderElements;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVSSMenuItemHostViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSMenuItemHostView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSMenuItemHostView",  @"item",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSMenuItemHostView",  @"contentView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSMenuItem",  @"hasFocusableContent",  "B",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSMenuItem",  @"visualContent",  "@",  0);
}

- (id)_accessibilityVisualContent
{
  return -[TVSSMenuItemHostViewAccessibility safeValueForKeyPath:]( self,  "safeValueForKeyPath:",  @"item.visualContent");
}

- (id)_accessibilityContent
{
  return -[TVSSMenuItemHostViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", @"contentView");
}

- (id)_accessibilityParentStackView
{
  char v14 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIView, a2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, self, 1LL, &v14);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v14
    || (v7 = (void *)v5,
        char v13 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIStackView, v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 superview]),
        uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v13),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10),
        v9,
        v13))
  {
    abort();
  }

  return v11;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostViewAccessibility;
  -[TVSSMenuItemHostViewAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __79__TVSSMenuItemHostViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v3[3] = &unk_8278;
  objc_copyWeak(&v4, &location);
  -[TVSSMenuItemHostViewAccessibility _setAccessibilityLabelBlock:](self, "_setAccessibilityLabelBlock:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

id __79__TVSSMenuItemHostViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke( uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _accessibilityVisualContent]);
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }

  else
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained _accessibilityContent]);
    id v5 = (id)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);
  }

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMenuItemHostViewAccessibility _accessibilityVisualContent](self, "_accessibilityVisualContent"));
  unint64_t v4 = (unint64_t)[v3 accessibilityTraits];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMenuItemHostViewAccessibility _accessibilityContent](self, "_accessibilityContent"));
  unint64_t v6 = (unint64_t)[v5 accessibilityTraits] | v4;

  if (v6 == UIAccessibilityTraitNone)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSMenuItemHostViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"item"));
    uint64_t v8 = v7;
    if (v7 && [v7 safeBoolForKey:@"hasFocusableContent"])
    {
      unint64_t v6 = UIAccessibilityTraitButton;
    }

    else
    {
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostViewAccessibility;
      unint64_t v6 = -[TVSSMenuItemHostViewAccessibility accessibilityTraits](&v10, "accessibilityTraits");
    }
  }

  return v6;
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSMenuItemHostViewAccessibility _accessibilityParentStackView]( self,  "_accessibilityParentStackView"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 subviews]);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 axFilterObjectsUsingBlock:&__block_literal_global_0]);

  return v4;
}

BOOL __64__TVSSMenuItemHostViewAccessibility_accessibilityHeaderElements__block_invoke( id a1,  id a2,  unint64_t a3)
{
  unint64_t v3 = (unint64_t)objc_msgSend(a2, "accessibilityTraits", a3);
  return (UIAccessibilityTraitHeader & v3) != 0;
}

- (_NSRange)accessibilityRowRange
{
  unint64_t v3 = -[TVSSMenuItemHostViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((UIAccessibilityTraitHeader & v3) != 0)
  {
    v30.receiver = self;
    v30.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostViewAccessibility;
    id v4 = -[TVSSMenuItemHostViewAccessibility accessibilityRowRange](&v30, "accessibilityRowRange");
    id v6 = v5;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSMenuItemHostViewAccessibility _accessibilityParentStackView]( self,  "_accessibilityParentStackView"));
    char v29 = 0;
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray, v8);
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v7 safeValueForKey:@"superview"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _accessibilitySubviews]);
    uint64_t v12 = __UIAccessibilityCastAsClass(v9, v11, 1LL, &v29);
    char v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

    if (v29) {
      abort();
    }
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___TVSSMenuItemHostViewAccessibility;
    -[TVSSMenuItemHostViewAccessibility accessibilityRowRange](&v28, "accessibilityRowRange");
    char v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v25;
      do
      {
        v19 = 0LL;
        do
        {
          if (*(void *)v25 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * (void)v19), "subviews", (void)v24));
          v21 = (void *)objc_claimAutoreleasedReturnValue([v20 axFilterObjectsUsingBlock:&__block_literal_global_209]);
          [v14 axSafelyAddObjectsFromArray:v21];

          v19 = (char *)v19 + 1;
        }

        while (v17 != v19);
        id v17 = [v15 countByEnumeratingWithState:&v24 objects:v31 count:16];
      }

      while (v17);
    }

    id v6 = [v14 count];
    id v4 = [v14 indexOfObject:self];
  }

  NSUInteger v22 = (NSUInteger)v4;
  NSUInteger v23 = (NSUInteger)v6;
  result.length = v23;
  result.id location = v22;
  return result;
}

BOOL __58__TVSSMenuItemHostViewAccessibility_accessibilityRowRange__block_invoke( id a1,  id a2,  unint64_t a3)
{
  unint64_t v3 = (unint64_t)objc_msgSend(a2, "accessibilityTraits", a3);
  return (UIAccessibilityTraitHeader & v3) == 0;
}

- (BOOL)_accessibilityShouldIncludeRowRangeInElementDescription
{
  unint64_t v2 = -[TVSSMenuItemHostViewAccessibility accessibilityTraits](self, "accessibilityTraits");
  return (UIAccessibilityTraitHeader & v2) == 0;
}

@end