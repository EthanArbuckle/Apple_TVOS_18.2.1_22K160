@interface TVPPhotoLibraryMomentsHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVPPhotoLibraryMomentsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPPhotoLibraryMomentsHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoLibraryMomentsHeaderView",  @"titleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoLibraryMomentsHeaderView",  @"subtitleLabel",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoLibraryMomentsHeaderView",  @"dateLabel",  "@",  0);
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
  return -[TVPPhotoLibraryMomentsHeaderViewAccessibility _accessibilityStringForLabelKeyValues:]( self,  "_accessibilityStringForLabelKeyValues:",  @"titleLabel, subtitleLabel, dateLabel");
}

@end