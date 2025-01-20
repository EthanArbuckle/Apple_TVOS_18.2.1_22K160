@interface TVSystemMenu_UIApplicationAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)_accessibilityExplorerElements;
@end

@implementation TVSystemMenu_UIApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIApplication";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)_accessibilityExplorerElements
{
  return 0LL;
}

@end