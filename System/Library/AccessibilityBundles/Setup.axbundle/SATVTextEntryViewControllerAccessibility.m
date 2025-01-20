@interface SATVTextEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SATVTextEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVTextEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

@end