@interface TVScrollingTextViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)loadView;
@end

@implementation TVScrollingTextViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVScrollingTextViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVScrollingTextViewControllerAccessibility;
  -[TVScrollingTextViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVScrollingTextViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_titleLabel"));
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];
  [v3 setIsAccessibilityElement:1];
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVScrollingTextViewControllerAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v2));

  return v3;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVScrollingTextViewControllerAccessibility;
  -[TVScrollingTextViewControllerAccessibility loadView](&v3, "loadView");
  -[TVScrollingTextViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end