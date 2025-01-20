@interface TVActionButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)accessibilityTraits;
@end

@implementation TVActionButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVActionButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVActionButton",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVActionButton",  @"headline",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVActionButtonAccessibility;
  return UIAccessibilityTraitButton | -[TVActionButtonAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

- (id)accessibilityLabel
{
  return -[TVActionButtonAccessibility safeValueForKey:](self, "safeValueForKey:", @"title");
}

- (id)accessibilityValue
{
  return -[TVActionButtonAccessibility safeValueForKey:](self, "safeValueForKey:", @"headline");
}

@end