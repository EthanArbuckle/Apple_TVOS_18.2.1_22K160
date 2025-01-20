@interface TVLScrollerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation TVLScrollerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLScrollerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityHeaderElements
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVLScrollerViewControllerAccessibility;
  id v3 = -[TVLScrollerViewControllerAccessibility accessibilityHeaderElements](&v10, "accessibilityHeaderElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVLScrollerViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_headerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v5));

  if (v6) {
    id v7 = (id)objc_claimAutoreleasedReturnValue([v6 arrayByAddingObjectsFromArray:v4]);
  }
  else {
    id v7 = v4;
  }
  v8 = v7;

  return v8;
}

@end