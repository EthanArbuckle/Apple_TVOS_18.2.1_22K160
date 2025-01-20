@interface TVPVideoViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation TVPVideoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPVideoView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end