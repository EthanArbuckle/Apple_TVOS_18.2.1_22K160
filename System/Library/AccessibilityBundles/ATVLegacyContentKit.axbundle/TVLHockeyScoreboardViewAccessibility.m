@interface TVLHockeyScoreboardViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation TVLHockeyScoreboardViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLHockeyScoreboardView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHockeyScoreboardView",  @"homeScoreboardLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHockeyScoreboardView",  @"awayScoreboardLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHockeyScoreboardView",  @"scoreboardTableView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHockeyScoreboardView",  @"scoreboardHeaderTitles",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHockeyScoreboardView",  @"scoreboardHomeRowValues",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHockeyScoreboardView",  @"scoreboardAwayRowValues",  "@",  0);
}

- (id)accessibilityElements
{
  v56.receiver = self;
  v56.super_class = (Class)&OBJC_CLASS___TVLHockeyScoreboardViewAccessibility;
  id v3 = -[TVLHockeyScoreboardViewAccessibility accessibilityElements](&v56, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v6 = v4;
  if (!v4)
  {
    char v55 = 0;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIView, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVLHockeyScoreboardViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"scoreboardTableView"));
    uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v55);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (!v55)
    {
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = __61__TVLHockeyScoreboardViewAccessibility_accessibilityElements__block_invoke;
      v53[3] = &unk_8250;
      id v12 = v11;
      id v54 = v12;
      v51 = (void *)objc_claimAutoreleasedReturnValue([v12 _accessibilityFindSubviewDescendantsPassingTest:v53]);
      if (![v51 count])
      {
        id v7 = 0LL;
LABEL_19:

        goto LABEL_20;
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVLHockeyScoreboardViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"homeScoreboardLabel"));
      v50 = (void *)objc_claimAutoreleasedReturnValue([v13 accessibilityLabel]);

      v14 = (void *)objc_claimAutoreleasedReturnValue( -[TVLHockeyScoreboardViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"awayScoreboardLabel"));
      v49 = (void *)objc_claimAutoreleasedReturnValue([v14 accessibilityLabel]);

      char v55 = 0;
      uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVLHockeyScoreboardViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"scoreboardHeaderTitles"));
      uint64_t v18 = __UIAccessibilityCastAsClass(v16, v17, 1LL, &v55);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (!v55)
      {
        char v55 = 0;
        uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSArray, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVLHockeyScoreboardViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"scoreboardHomeRowValues"));
        uint64_t v23 = __UIAccessibilityCastAsClass(v21, v22, 1LL, &v55);
        v52 = (void *)objc_claimAutoreleasedReturnValue(v23);

        if (!v55)
        {
          id v48 = v12;
          char v55 = 0;
          uint64_t v25 = objc_opt_class(&OBJC_CLASS___NSArray, v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue( -[TVLHockeyScoreboardViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"scoreboardAwayRowValues"));
          uint64_t v27 = __UIAccessibilityCastAsClass(v25, v26, 1LL, &v55);
          v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

          if (!v55)
          {
            id v29 = [v19 count];
            if (v29 != [v52 count]
              || (id v30 = [v19 count], v30 != objc_msgSend(v28, "count")))
            {
              _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/ATVAccessibility/bundles/ATVLegacyContentKitAccessibility/source/T VLHockeyScoreboardViewAccessibility.m",  53LL,  "-[TVLHockeyScoreboardViewAccessibility accessibilityElements]",  @"Expected these arrays to have equal counts");
            }

            id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            if ([v19 count])
            {
              unint64_t v31 = 0LL;
              do
              {
                v32 = (void *)objc_claimAutoreleasedReturnValue([v19 objectAtIndex:v31]);
                v33 = (void *)objc_claimAutoreleasedReturnValue([v52 objectAtIndex:v31]);
                v34 = (void *)objc_claimAutoreleasedReturnValue([v28 objectAtIndex:v31]);
                if ([v34 length] || objc_msgSend(v33, "length"))
                {
                  v35 = -[UIAccessibilityElement initWithAccessibilityContainer:]( objc_alloc(&OBJC_CLASS___UIAccessibilityElement),  "initWithAccessibilityContainer:",  self);
                  uint64_t v36 = __UIAXStringForVariables(v32);
                  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
                  -[UIAccessibilityElement setAccessibilityLabel:]( v35,  "setAccessibilityLabel:",  v37,  v50,  v33,  v49,  v34,  @"__AXStringForVariablesSentinel");

                  v38 = (void *)objc_claimAutoreleasedReturnValue([v51 objectAtIndex:v31]);
                  [v38 accessibilityFrame];
                  double v40 = v39;
                  double v42 = v41;
                  double v44 = v43;
                  double v46 = v45;

                  -[UIAccessibilityElement setAccessibilityFrame:]( v35,  "setAccessibilityFrame:",  v40,  v42,  v44,  v46 * 3.0);
                  [v7 addObject:v35];
                }

                ++v31;
              }

              while (v31 < (unint64_t)[v19 count]);
            }

            -[TVLHockeyScoreboardViewAccessibility setAccessibilityElements:](self, "setAccessibilityElements:", v7);

            id v12 = v48;
            v6 = 0LL;
            goto LABEL_19;
          }
        }
      }
    }

    abort();
  }

  id v7 = v4;
LABEL_20:

  return v7;
}

BOOL __61__TVLHockeyScoreboardViewAccessibility_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___UILabel, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
    BOOL v7 = v6 == *(void **)(a1 + 32);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  return v7;
}

@end