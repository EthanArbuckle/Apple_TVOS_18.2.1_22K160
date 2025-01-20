@interface HBAppDeleteHintViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (HBAppDeleteHintViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation HBAppDeleteHintViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBAppDeleteHintView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"HBAppDeleteHintView" hasInstanceVariable:@"_leftLabel" withType:"UILabel"];
  [v3 validateClass:@"HBAppDeleteHintView" hasInstanceVariable:@"_rightLabel" withType:"UILabel"];
  [v3 validateClass:@"HBAppDeleteHintView" hasInstanceVariable:@"_playPauseGlyphView" withType:"UIImageView"];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___HBAppDeleteHintViewAccessibility;
  -[HBAppDeleteHintViewAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[HBAppDeleteHintViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_playPauseGlyphView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HBAppDeleteHintViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_leftLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HBAppDeleteHintViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_rightLabel"));
  [v3 setIsAccessibilityElement:0];
  [v4 setIsAccessibilityElement:0];
  [v5 setIsAccessibilityElement:0];
}

- (HBAppDeleteHintViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___HBAppDeleteHintViewAccessibility;
  id v3 = -[HBAppDeleteHintViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[HBAppDeleteHintViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end