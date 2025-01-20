@interface HBTopShelfBannerViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)_accessibilityScrollingEnabled;
@end

@implementation HBTopShelfBannerViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBTopShelfBannerViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (BOOL)_accessibilityScrollingEnabled
{
  return 0;
}

@end