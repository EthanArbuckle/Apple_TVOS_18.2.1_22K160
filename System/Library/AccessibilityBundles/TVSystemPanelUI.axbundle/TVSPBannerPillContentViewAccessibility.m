@interface TVSPBannerPillContentViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_accessibilityAttachmentAXLabel:(id)a3;
- (id)_accessibilityConvertAttachmentsInAttributedStringToAXLabel:(id)a3;
- (id)accessibilityContentViewLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSPBannerPillContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSPBannerPillContentView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"TVSPBannerPillContentView" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"TVSPBannerPillContentView" hasInstanceVariable:@"_subtitleLabel" withType:"UILabel"];
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIImageAsset",  @"assetName",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSPBannerPillContentViewAccessibility;
  return UIAccessibilityTraitHeader | -[TVSPBannerPillContentViewAccessibility accessibilityTraits]( &v3,  "accessibilityTraits");
}

- (id)_accessibilityAttachmentAXLabel:(id)a3
{
  id v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessibilityLabel]);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UIImage, v5);
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
  {
    char v17 = 0;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIImage, v7);
    uint64_t v9 = __UIAccessibilityCastAsClass(v8, v3, 1LL, &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v17) {
      abort();
    }
    v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"_imageAsset"]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"assetName"]);

    if ([v13 isEqualToString:@"tv.circle.fill"])
    {
      id v14 = accessibilityLocalizedString(@"tv.button");
      uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);

      v4 = (void *)v15;
    }
  }

  return v4;
}

- (id)_accessibilityConvertAttachmentsInAttributedStringToAXLabel:(id)a3
{
  id v4 = a3;
  id v5 = [v4 mutableCopy];
  v14[0] = 0LL;
  v14[1] = v14;
  v14[2] = 0x2020000000LL;
  v14[3] = 0LL;
  uint64_t v6 = UIAccessibilityTokenAttachment;
  id v7 = [v4 length];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __102__TVSPBannerPillContentViewAccessibility__accessibilityConvertAttachmentsInAttributedStringToAXLabel___block_invoke;
  v11[3] = &unk_81F8;
  v11[4] = self;
  id v8 = v5;
  id v12 = v8;
  v13 = v14;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v11);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 string]);

  _Block_object_dispose(v14, 8);
  return v9;
}

void __102__TVSPBannerPillContentViewAccessibility__accessibilityConvertAttachmentsInAttributedStringToAXLabel___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  if (a2)
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) _accessibilityAttachmentAXLabel:a2]);
    if ([v7 length])
    {
      objc_msgSend( *(id *)(a1 + 40),  "replaceCharactersInRange:withString:",  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + a3,  a4,  v7);
      *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += (char *)[v7 length] - a4;
    }
  }

- (id)accessibilityContentViewLabel
{
  char v20 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UILabel, a2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPBannerPillContentViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"titleLabel"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v20);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v20
    || (char v19 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UILabel, v7),
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPBannerPillContentViewAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"subtitleLabel")),  v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v19),  v11 = (void *)objc_claimAutoreleasedReturnValue(v10),  v9,  v19))
  {
    abort();
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 accessibilityLabel]);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v11 accessibilityLabel]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 accessibilityAttributedLabel]);
  if (v14)
  {
    uint64_t v15 = objc_claimAutoreleasedReturnValue( -[TVSPBannerPillContentViewAccessibility _accessibilityConvertAttachmentsInAttributedStringToAXLabel:]( self,  "_accessibilityConvertAttachmentsInAttributedStringToAXLabel:",  v14));

    v13 = (void *)v15;
  }

  uint64_t v16 = __UIAXStringForVariables(v12);
  char v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  return v17;
}

@end