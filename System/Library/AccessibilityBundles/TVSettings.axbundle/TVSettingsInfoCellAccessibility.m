@interface TVSettingsInfoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation TVSettingsInfoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSettingsInfoCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end