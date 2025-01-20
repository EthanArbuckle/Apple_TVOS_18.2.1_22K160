@interface TSKSettingItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_axItemLocalizedDescriptionIsValid:(id)a3;
@end

@implementation TSKSettingItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TSKSettingItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)_axItemLocalizedDescriptionIsValid:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@"-"]);
    BOOL v5 = [v4 count] != (char *)&dword_4 + 1;
  }

  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end