@interface TVSUIConferenceRoomDisplaySmallViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (TVSUIConferenceRoomDisplaySmallViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVSUIConferenceRoomDisplaySmallViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSUIConferenceRoomDisplaySmallView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSUIConferenceRoomDisplaySmallView" hasInstanceVariable:@"_baseMessageTextLabel" withType:"UILabel"];
  [v3 validateClass:@"TVSUIConferenceRoomDisplaySmallView" hasInstanceVariable:@"_instructions1Title" withType:"UILabel"];
  [v3 validateClass:@"TVSUIConferenceRoomDisplaySmallView" hasInstanceVariable:@"_instructions1Detail" withType:"UILabel"];
  [v3 validateClass:@"TVSUIConferenceRoomDisplaySmallView" hasInstanceVariable:@"_instructions2Title" withType:"UILabel"];
  [v3 validateClass:@"TVSUIConferenceRoomDisplaySmallView" hasInstanceVariable:@"_instructions2Detail" withType:"UILabel"];
  [v3 validateClass:@"TVSUIConferenceRoomDisplaySmallView" hasInstanceVariable:@"_customMessageText" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return -[TVSUIConferenceRoomDisplaySmallViewAccessibility _accessibilityStringForLabelKeyValues:]( self,  "_accessibilityStringForLabelKeyValues:",  @"_baseMessageTextLabel, _instructions1Title, _instructions1Detail, _instructions2Title, _instructions2Detail, _customMessageText");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVSUIConferenceRoomDisplaySmallViewAccessibility;
  -[TVSUIConferenceRoomDisplaySmallViewAccessibility _accessibilityLoadAccessibilityInformation]( &v2,  "_accessibilityLoadAccessibilityInformation");
}

- (TVSUIConferenceRoomDisplaySmallViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSUIConferenceRoomDisplaySmallViewAccessibility;
  id v3 =  -[TVSUIConferenceRoomDisplaySmallViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[TVSUIConferenceRoomDisplaySmallViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end