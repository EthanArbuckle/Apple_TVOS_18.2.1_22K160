@interface UITabBarAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (unint64_t)accessibilityTraits;
@end

@implementation UITabBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITabBar";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UITabBarAccessibility;
  return UIAccessibilityTraitTabBar | -[UITabBarAccessibility accessibilityTraits](&v3, "accessibilityTraits");
}

@end