@interface SATVHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SATVHeaderViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SATVHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"SATVCyclingHeaderView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVHeaderView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVHeaderView",  @"subtitleLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___SATVHeaderViewAccessibility;
  -[SATVHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( &v15,  "_accessibilityLoadAccessibilityInformation");
  char v14 = 0;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___UIView, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleLabel"));
  uint64_t v6 = __UIAccessibilityCastAsClass(v4, v5, 1LL, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v14
    || (char v14 = 0,
        uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIView, v8),
        v10 = (void *)objc_claimAutoreleasedReturnValue( -[SATVHeaderViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleLabel")),  uint64_t v11 = __UIAccessibilityCastAsClass(v9, v10, 1LL, &v14),  v12 = (void *)objc_claimAutoreleasedReturnValue(v11),  v10,  v14))
  {
    abort();
  }

  [v7 setAccessibilityTraits:UIAccessibilityTraitHeader];
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v7));
  [v12 setAccessibilityHeaderElements:v13];
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleLabel"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (SATVHeaderViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVHeaderViewAccessibility;
  uint64_t v3 =  -[SATVHeaderViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[SATVHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end