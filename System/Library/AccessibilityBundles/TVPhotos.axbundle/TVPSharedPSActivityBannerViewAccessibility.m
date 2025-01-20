@interface TVPSharedPSActivityBannerViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)setBannerTitle:(id)a3;
@end

@implementation TVPSharedPSActivityBannerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPSharedPSActivityBannerView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSActivityBannerView",  @"bannerTitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSActivityBannerView",  @"imageStackView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPSharedPSActivityBannerView",  @"bannerTitle",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSActivityBannerViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"bannerTitleLabel"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)_accessibilityFrameDelegate
{
  return -[TVPSharedPSActivityBannerViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"imageStackView");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerViewAccessibility;
  -[TVPSharedPSActivityBannerViewAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPSharedPSActivityBannerViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"bannerTitleLabel"));
  [v3 setIsAccessibilityElement:0];
}

- (void)setBannerTitle:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPSharedPSActivityBannerViewAccessibility;
  -[TVPSharedPSActivityBannerViewAccessibility setBannerTitle:](&v4, "setBannerTitle:", a3);
  -[TVPSharedPSActivityBannerViewAccessibility _accessibilityLoadAccessibilityInformation]( self,  "_accessibilityLoadAccessibilityInformation");
}

@end