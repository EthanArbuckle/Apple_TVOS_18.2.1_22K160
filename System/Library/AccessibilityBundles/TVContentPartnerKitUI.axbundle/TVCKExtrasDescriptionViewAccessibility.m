@interface TVCKExtrasDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityFrameDelegate;
@end

@implementation TVCKExtrasDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVCKExtrasDescriptionView";
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
  return -[TVCKExtrasDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"descriptionView");
}

@end