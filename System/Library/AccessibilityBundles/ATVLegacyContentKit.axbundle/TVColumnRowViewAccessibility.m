@interface TVColumnRowViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation TVColumnRowViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVColumnRowView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVColumnRowView",  @"headerViews",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVColumnRowView",  @"columnViews",  "@",  0);
}

- (id)accessibilityElements
{
  char v23 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSArray, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVColumnRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerViews"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v23
    || (char v22 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray, v7),
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVColumnRowViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"columnViews")),
        uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v22),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10),
        v9,
        v22))
  {
    abort();
  }

  v12 = (char *)[v6 count];
  v13 = (char *)[v11 count];
  if (v12 == v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    if ((uint64_t)v12 >= 1)
    {
      for (i = 0LL; i != v12; ++i)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndex:i]);
        v17 = (void *)objc_claimAutoreleasedReturnValue([v11 objectAtIndex:i]);
        [v17 setShouldGroupAccessibilityChildren:1];
        [v14 axSafelyAddObject:v16];
        [v14 axSafelyAddObject:v17];
      }
    }
  }

  else
  {
    v18 = v13;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v12));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", v18));
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/bundles/ATVLegacyContentKitAccessibility/source/TVColumnRow ViewAccessibility.m",  38LL,  "-[TVColumnRowViewAccessibility accessibilityElements]",  @"Expected headerViews count:%@ to same as columnViews count:%@");

    v14 = 0LL;
  }

  return v14;
}

@end