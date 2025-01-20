@interface TVLItemTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (TVLItemTitleViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVLItemTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLItemTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLItemTitleView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLItemTitleView",  @"subtitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLItemTitleView",  @"rightTitleLabel",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"subtitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"rightTitleLabel"));
  uint64_t v5 = __UIAXStringForVariables(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (unint64_t)accessibilityTraits
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility accessibilityUserDefinedTraits](self, "accessibilityUserDefinedTraits"));

  if (!v3) {
    return UIAccessibilityTraitHeader;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVLItemTitleViewAccessibility;
  return -[TVLItemTitleViewAccessibility accessibilityTraits](&v5, "accessibilityTraits");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVLItemTitleViewAccessibility;
  -[TVLItemTitleViewAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleLabel"));
  [v3 setIsAccessibilityElement:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"subtitleLabel"));
  [v4 setIsAccessibilityElement:0];

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLItemTitleViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"rightTitleLabel"));
  [v5 setIsAccessibilityElement:0];
}

- (TVLItemTitleViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVLItemTitleViewAccessibility;
  id v3 =  -[TVLItemTitleViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[TVLItemTitleViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end