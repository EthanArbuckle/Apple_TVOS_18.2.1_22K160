@interface TVPPhotoLibraryTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (TVPPhotoLibraryTitleViewAccessibility)initWithFrame:(CGRect)a3;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation TVPPhotoLibraryTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPPhotoLibraryTitleView";
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
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitHeader;
}

- (id)accessibilityLabel
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryTitleViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 accessibilityLabel]);

  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTitleViewAccessibility;
  -[TVPPhotoLibraryTitleViewAccessibility _accessibilityLoadAccessibilityInformation]( &v4,  "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVPPhotoLibraryTitleViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  [v3 setIsAccessibilityElement:0];
}

- (TVPPhotoLibraryTitleViewAccessibility)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVPPhotoLibraryTitleViewAccessibility;
  v3 = -[TVPPhotoLibraryTitleViewAccessibility initWithFrame:]( &v5,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  -[TVPPhotoLibraryTitleViewAccessibility _accessibilityLoadAccessibilityInformation]( v3,  "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end