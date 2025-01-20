@interface PBWindowAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
@end

@implementation PBWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PBWindow";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityIdentifier
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBWindowAccessibility;
  id v3 = -[PBWindowAccessibility accessibilityIdentifier](&v6, "accessibilityIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBWindowAccessibility safeValueForKey:](self, "safeValueForKey:", @"name"));
  }
  return v4;
}

@end