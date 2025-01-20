@interface TVStackingPosterViewAccessibility__SiriViewService__TVMLKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldBeExplorerElementWithoutSystemFocus;
@end

@implementation TVStackingPosterViewAccessibility__SiriViewService__TVMLKit

+ (id)safeCategoryTargetClassName
{
  return @"_TVStackingPosterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityShouldBeExplorerElementWithoutSystemFocus
{
  return 0;
}

@end