@interface TVHighlightingLabelAccessibility__TVSettings__TVKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
@end

@implementation TVHighlightingLabelAccessibility__TVSettings__TVKit

+ (id)safeCategoryTargetClassName
{
  return @"TVHighlightingLabel";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  id v3 = -[TVHighlightingLabelAccessibility__TVSettings__TVKit _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  NSClassFromString(@"TVSettingsInfoCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v4) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVHighlightingLabelAccessibility__TVSettings__TVKit;
  return -[TVHighlightingLabelAccessibility__TVSettings__TVKit isAccessibilityElement](&v6, "isAccessibilityElement");
}

@end