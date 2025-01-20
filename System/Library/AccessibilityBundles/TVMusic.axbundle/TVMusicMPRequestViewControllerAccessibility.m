@interface TVMusicMPRequestViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
@end

@implementation TVMusicMPRequestViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVMusicMPRequestViewController";
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
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicMPRequestViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_headerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

@end