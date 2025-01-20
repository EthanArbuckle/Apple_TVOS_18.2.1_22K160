@interface TVPSharedPSAlbumDescriptionViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVPSharedPSAlbumDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPSharedPSAlbumDescriptionView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVPSharedPSAlbumDescriptionView" isKindOfClass:@"TVPPhotoCollectionGridViewCell"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoCollectionGridViewCell",  @"title",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return -[TVPSharedPSAlbumDescriptionViewAccessibility _accessibilityStringForLabelKeyValues:]( self,  "_accessibilityStringForLabelKeyValues:",  @"title");
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

@end