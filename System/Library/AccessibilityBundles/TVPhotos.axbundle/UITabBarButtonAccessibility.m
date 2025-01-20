@interface UITabBarButtonAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (unint64_t)accessibilityTraits;
@end

@implementation UITabBarButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBarButton";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UITabBarButtonAccessibility;
  return UIAccessibilityTraitTabButton | -[UITabBarButtonAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

@end