@interface TVLMetadataPreviewViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)layoutSubviews;
@end

@implementation TVLMetadataPreviewViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLMetadataPreviewView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMetadataPreviewView",  @"layoutSubviews",  "v",  0);
  [v3 validateClass:@"TVLMetadataPreviewView" isKindOfClass:@"TVMetadataView"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVMetadataView",  @"titleView",  "@",  0);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVLMetadataPreviewViewAccessibility;
  -[TVLMetadataPreviewViewAccessibility layoutSubviews](&v4, "layoutSubviews");
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLMetadataPreviewViewAccessibility safeValueForKey:](self, "safeValueForKey:", @"titleView"));
  [v3 setAccessibilityTraits:0];
}

@end