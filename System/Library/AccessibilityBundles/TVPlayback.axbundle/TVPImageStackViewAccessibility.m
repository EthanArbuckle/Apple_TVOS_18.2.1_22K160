@interface TVPImageStackViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFrameDelegate;
@end

@implementation TVPImageStackViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPImageStackView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilityFrameDelegate
{
  return -[TVPImageStackViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"_imageStackLayer");
}

@end