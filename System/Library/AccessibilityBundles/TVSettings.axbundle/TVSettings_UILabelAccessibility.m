@interface TVSettings_UILabelAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation TVSettings_UILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UILabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

@end