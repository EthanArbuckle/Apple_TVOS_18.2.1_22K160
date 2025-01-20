@interface SATVChoiceViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (SATVChoiceViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityHeaderElements;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)_didSelectButton:(id)a3;
@end

@implementation SATVChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SATVChoiceView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVChoiceView",  @"headerView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVChoiceView",  @"choiceHeaderButton",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"SATVChoiceView",  @"_didSelectButton:",  "v",  "@",  0);
}

- (id)accessibilityHeaderElements
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"headerView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"titleLabel"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray axArrayByIgnoringNilElementsWithCount:]( &OBJC_CLASS___NSArray,  "axArrayByIgnoringNilElementsWithCount:",  1LL,  v3));

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SATVChoiceViewAccessibility;
  -[SATVChoiceViewAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SATVChoiceViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"choiceHeaderButton"));
  [v3 setAccessibilityIdentifier:@"ChoiceHeaderButton"];
}

- (void)_didSelectButton:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SATVChoiceViewAccessibility;
  -[SATVChoiceViewAccessibility _didSelectButton:](&v3, "_didSelectButton:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

- (SATVChoiceViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVChoiceViewAccessibility;
  objc_super v3 =  -[SATVChoiceViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[SATVChoiceViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end