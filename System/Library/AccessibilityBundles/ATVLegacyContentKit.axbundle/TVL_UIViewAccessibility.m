@interface TVL_UIViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)tvl_setSubviews:(id)a3;
@end

@implementation TVL_UIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)tvl_setSubviews:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVL_UIViewAccessibility;
  -[TVL_UIViewAccessibility tvl_setSubviews:](&v3, "tvl_setSubviews:", a3);
  UIAccessibilityPostNotification(UIAccessibilityScreenChangedNotification, 0LL);
}

@end