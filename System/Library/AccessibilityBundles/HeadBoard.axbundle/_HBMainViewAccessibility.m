@interface _HBMainViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityNativeFocusPreferredElementIsValid;
@end

@implementation _HBMainViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_HBMainView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityNativeFocusPreferredElementIsValid
{
  return 0;
}

@end