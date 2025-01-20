@interface SATVLoginViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SATVLoginViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SATVLoginViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVLoginView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVLoginView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVLoginView",  @"subtitleLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SATVLoginViewAccessibility;
  -[SATVLoginViewAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleLabel"));
  UIAccessibilityTraits v4 = UIAccessibilityTraitHeader;
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"subtitleLabel"));
  [v5 setAccessibilityTraits:v4];
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleLabel"));
  UIAccessibilityTraits v4 = (void *)objc_claimAutoreleasedReturnValue(-[SATVLoginViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"subtitleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v3,  v4));

  return v5;
}

- (SATVLoginViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVLoginViewAccessibility;
  id v3 =  -[SATVLoginViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[SATVLoginViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end