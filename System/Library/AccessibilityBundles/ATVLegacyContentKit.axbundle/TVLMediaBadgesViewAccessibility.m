@interface TVLMediaBadgesViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (TVLMediaBadgesViewAccessibility)initWithMediaBadgesElement:(id)a3;
@end

@implementation TVLMediaBadgesViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVLMediaBadgesView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMediaBadgesView",  @"initWithMediaBadgesElement:",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMediaBadgesView",  @"videoFormatImageView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMediaBadgesView",  @"audioFormatImageView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMediaBadgesView",  @"closeCaptionView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMediaBadgesElement",  @"videoFormat",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVLMediaBadgesElement",  @"audioFormat",  "@",  0);
}

- (TVLMediaBadgesViewAccessibility)initWithMediaBadgesElement:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVLMediaBadgesViewAccessibility;
  v5 = -[TVLMediaBadgesViewAccessibility initWithMediaBadgesElement:](&v18, "initWithMediaBadgesElement:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVLMediaBadgesViewAccessibility safeValueForKey:]( v5,  "safeValueForKey:",  @"videoFormatImageView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVLMediaBadgesViewAccessibility safeValueForKey:]( v5,  "safeValueForKey:",  @"audioFormatImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVLMediaBadgesViewAccessibility safeValueForKey:](v5, "safeValueForKey:", @"closeCaptionView"));
  if (v6)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"videoFormat"]);
    id v10 = accessibilityLocalizedString(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v6 setAccessibilityLabel:v11];

    [v6 setIsAccessibilityElement:1];
    [v6 setAccessibilityIdentifier:@"exlorerElementImage"];
    [v6 setAccessibilityTraits:UIAccessibilityTraitNone];
  }

  if (v7)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v4 safeValueForKey:@"audioFormat"]);
    id v13 = accessibilityLocalizedString(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v7 setAccessibilityLabel:v14];

    [v7 setIsAccessibilityElement:1];
    [v7 setAccessibilityIdentifier:@"exlorerElementImage"];
    [v7 setAccessibilityTraits:UIAccessibilityTraitNone];
  }

  if (v8)
  {
    id v15 = accessibilityLocalizedString(@"closed.captions.label");
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    [v8 setAccessibilityLabel:v16];

    [v8 setIsAccessibilityElement:1];
    [v8 setAccessibilityIdentifier:@"exlorerElementImage"];
    [v8 setAccessibilityTraits:UIAccessibilityTraitNone];
  }

  return v5;
}

@end