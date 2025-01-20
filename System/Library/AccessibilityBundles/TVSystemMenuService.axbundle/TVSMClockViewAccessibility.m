@interface TVSMClockViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TVSMClockViewAccessibility)initWithFrame:(CGRect)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVSMClockViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSMClockView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMClockView",  @"dateLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSMClockView",  @"timeLabel",  "@",  0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSMClockViewAccessibility;
  -[TVSMClockViewAccessibility _accessibilityLoadAccessibilityInformation]( &v2,  "_accessibilityLoadAccessibilityInformation");
}

- (TVSMClockViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSMClockViewAccessibility;
  id v3 =  -[TVSMClockViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[TVSMClockViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end