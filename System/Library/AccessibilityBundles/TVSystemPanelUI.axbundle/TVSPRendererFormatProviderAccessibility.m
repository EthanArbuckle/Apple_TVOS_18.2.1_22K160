@interface TVSPRendererFormatProviderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityIsFocusForFocusEverywhereRunningForFocusItem;
- (int64_t)_accessibilityFormat;
@end

@implementation TVSPRendererFormatProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSPRendererFormatProvider";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPRendererFormatProvider",  @"textColorForInterfaceStyle:state:",  "@",  "q",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPRendererFormatProvider",  @"imageTintColorForInterfaceStyle:state:",  "@",  "q",  "Q",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPRendererFormatProvider",  @"format",  "q",  0);
}

- (int64_t)_accessibilityFormat
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSPRendererFormatProviderAccessibility safeValueForKey:](self, "safeValueForKey:", @"format"));
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (BOOL)_accessibilityIsFocusForFocusEverywhereRunningForFocusItem
{
  return 0;
}

@end