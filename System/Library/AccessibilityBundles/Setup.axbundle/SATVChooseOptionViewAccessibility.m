@interface SATVChooseOptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SATVChooseOptionViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SATVChooseOptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVChooseOptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVChooseOptionViewAccessibility;
  -[SATVChooseOptionViewAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerView"));
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChooseOptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (SATVChooseOptionViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVChooseOptionViewAccessibility;
  v3 =  -[SATVChooseOptionViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[SATVChooseOptionViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end