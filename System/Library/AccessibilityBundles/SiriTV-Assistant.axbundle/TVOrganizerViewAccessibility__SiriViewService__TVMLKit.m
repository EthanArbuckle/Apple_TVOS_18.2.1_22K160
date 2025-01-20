@interface TVOrganizerViewAccessibility__SiriViewService__TVMLKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityShouldBeExplorerElementWithoutSystemFocus;
@end

@implementation TVOrganizerViewAccessibility__SiriViewService__TVMLKit

+ (id)safeCategoryTargetClassName
{
  return @"_TVOrganizerView";
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