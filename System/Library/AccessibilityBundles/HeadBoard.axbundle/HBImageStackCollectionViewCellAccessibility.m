@interface HBImageStackCollectionViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityFrameDelegate;
- (id)accessibilityLabel;
@end

@implementation HBImageStackCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBImageStackCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBImageStackCollectionViewCell",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBImageStackCollectionViewCell",  @"layeredImageView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBImageStackCollectionViewCell",  @"imageStackView",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return -[HBImageStackCollectionViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"title");
}

- (id)_accessibilityFrameDelegate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[HBImageStackCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"layeredImageView"));
  if (!v3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue( -[HBImageStackCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"imageStackView"));
    if (!v3)
    {
      v6.receiver = self;
      v6.super_class = (Class)&OBJC_CLASS___HBImageStackCollectionViewCellAccessibility;
      id v4 = -[HBImageStackCollectionViewCellAccessibility _accessibilityFrameDelegate]( &v6,  "_accessibilityFrameDelegate");
      id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
    }
  }

  return v3;
}

@end