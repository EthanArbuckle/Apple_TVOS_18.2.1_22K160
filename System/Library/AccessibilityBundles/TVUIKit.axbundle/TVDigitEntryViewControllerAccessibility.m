@interface TVDigitEntryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_axPromptLabel;
- (id)_axTitleLabel;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVDigitEntryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVDigitEntryViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVDigitEntryViewController",  @"_titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVDigitEntryViewController",  @"_promptLabel",  "@",  0);
}

- (id)_axTitleLabel
{
  return -[TVDigitEntryViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", @"_titleLabel");
}

- (id)_axPromptLabel
{
  return -[TVDigitEntryViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", @"_promptLabel");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVDigitEntryViewControllerAccessibility;
  -[TVDigitEntryViewControllerAccessibility _accessibilityLoadAccessibilityInformation]( &v6,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVDigitEntryViewControllerAccessibility _axTitleLabel](self, "_axTitleLabel"));
  UIAccessibilityTraits v4 = UIAccessibilityTraitHeader;
  [v3 setAccessibilityTraits:UIAccessibilityTraitHeader];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVDigitEntryViewControllerAccessibility _axPromptLabel](self, "_axPromptLabel"));
  [v5 setAccessibilityTraits:v4];
}

- (id)accessibilityHeaderElements
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVDigitEntryViewControllerAccessibility _axTitleLabel](self, "_axTitleLabel"));
  UIAccessibilityTraits v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVDigitEntryViewControllerAccessibility _axPromptLabel](self, "_axPromptLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  2LL,  v3,  v4));

  return v5;
}

@end