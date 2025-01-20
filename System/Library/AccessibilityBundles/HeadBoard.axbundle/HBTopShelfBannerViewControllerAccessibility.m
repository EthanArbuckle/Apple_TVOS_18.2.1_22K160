@interface HBTopShelfBannerViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4;
@end

@implementation HBTopShelfBannerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBTopShelfBannerViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___HBTopShelfBannerViewControllerAccessibility;
  id v4 = -[HBTopShelfBannerViewControllerAccessibility carouselView:cellForItemAtIndex:]( &v7,  "carouselView:cellForItemAtIndex:",  a3,  a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v5 setAccessibilityIdentifier:@"BannerTopShelfCell"];
  return v5;
}

@end