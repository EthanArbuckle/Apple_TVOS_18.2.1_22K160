@interface TVSSImageContentAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilityImage;
- (id)_accessibilityImageAssetName;
- (id)accessibilityLabel;
@end

@implementation TVSSImageContentAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVSSImageContent";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSSImageContent",  @"image",  "@",  0);
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIImageAsset",  @"assetName",  "@",  0);
}

- (id)_accessibilityImage
{
  char v8 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIImage, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSImageContentAccessibility safeValueForKey:](self, "safeValueForKey:", @"image"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8) {
    abort();
  }
  return v6;
}

- (id)_accessibilityImageAssetName
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSImageContentAccessibility _accessibilityImage](self, "_accessibilityImage"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"_imageAsset"]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeStringForKey:@"assetName"]);

  return v4;
}

- (id)accessibilityLabel
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSImageContentAccessibility _accessibilityImageAssetName](self, "_accessibilityImageAssetName"));
  unsigned int v4 = [v3 isEqualToString:@"camera"];

  if (v4
    || (uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSImageContentAccessibility _accessibilityImageAssetName]( self,  "_accessibilityImageAssetName")),  v6 = [v5 isEqualToString:@"mic.fill"],  v5,  v6)
    || (v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSSImageContentAccessibility _accessibilityImageAssetName]( self,  "_accessibilityImageAssetName")),  unsigned int v8 = [v7 isEqualToString:@"rectangle.inset.filled.and.camera"],  v7,  v8))
  {
    v9 = @"control.camera";
  }

  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSImageContentAccessibility _accessibilityImageAssetName](self, "_accessibilityImageAssetName"));
    unsigned int v14 = [v13 isEqualToString:@"network.badge.shield.half.filled"];

    if (!v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVSSImageContentAccessibility _accessibilityImage](self, "_accessibilityImage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue([v15 accessibilityLabel]);

      return v11;
    }

    v9 = @"control.vpn";
  }

  id v10 = accessibilityLocalizedString(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  return v11;
}

@end