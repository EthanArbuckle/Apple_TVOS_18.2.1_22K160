@interface TVSSUserImageContentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)accessibilityLabel;
@end

@implementation TVSSUserImageContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSUserImageContent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"control.user");
}

@end