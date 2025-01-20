@interface TVLHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_setSubtitle:(id)a3;
- (void)_setTitle:(id)a3;
@end

@implementation TVLHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVLHeaderView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"TVLHeaderView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHeaderView",  @"_setSubtitle:",  "v",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLHeaderView",  @"_setTitle:",  "v",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (id)accessibilityLabel
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVLHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_subtitleLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v5 accessibilityLabel]);
  uint64_t v6 = __UIAXStringForVariables(v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVLHeaderViewAccessibility;
  -[TVLHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( &v5,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_subtitleLabel"));
  [v3 setIsAccessibilityElement:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVLHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_titleLabel"));
  [v4 setIsAccessibilityElement:0];
}

- (void)_setSubtitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVLHeaderViewAccessibility;
  -[TVLHeaderViewAccessibility _setSubtitle:](&v4, "_setSubtitle:", a3);
  -[TVLHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

- (void)_setTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVLHeaderViewAccessibility;
  -[TVLHeaderViewAccessibility _setTitle:](&v4, "_setTitle:", a3);
  -[TVLHeaderViewAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end