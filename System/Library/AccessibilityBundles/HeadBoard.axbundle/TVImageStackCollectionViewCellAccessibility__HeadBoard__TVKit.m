@interface TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_ATVAccessibilityItemWithBannerModel:(id)a3 atIndex:(unint64_t)a4;
- (id)_ATVAccessibilityItemWithModel:(id)a3 atIndexPath:(id)a4;
- (id)_ATVAccessibilitySemanticContextWithModelItem:(id)a3;
- (id)_atvaccessibilityAppCellSemanticContext;
- (id)_atvaccessibilityBannerTopShelfCellSemanticContext;
- (id)_atvaccessibilityCollectionViewCellSemanticContext;
- (id)_atvaccessibilityLabeledContentTopShelfCellSemanticContext;
@end

@implementation TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit

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
  uint64_t v3 = AXValidationClientSiriSemanticContext;
  id v4 = a3;
  [v4 client:v3 validateClass:@"HBApp"];
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBFolder"];
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBRootItem"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBAppGridViewController",  @"_appGridViewItemAtIndexPath:",  "@",  "@",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBRootItem",  @"displayName",  "@",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"TVContentItem",  @"playURL",  "@",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"TVContentItem",  @"title",  "@",  0);
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"TVContentItem",  @"topShelfItems",  "@",  0);
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfSectionedModelViewController"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBTopShelfSectionedModelViewController",  @"model",  "@",  0);
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfSectionedModel"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBTopShelfSectionedModel",  @"sections",  "@",  0);
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfSection"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBTopShelfSection",  @"items",  "@",  0);
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfSectionedItem"];
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfSectionedItem" isKindOfClass:@"HBTopShelfObject"];
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfObject"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBTopShelfObject",  @"title",  "@",  0);
  [v4 client:AXValidationClientSiriSemanticContext validateClass:@"HBTopShelfBannerModel"];
  objc_msgSend( v4,  "client:validateClass:hasInstanceMethod:withFullSignature:",  AXValidationClientSiriSemanticContext,  @"HBTopShelfBannerModel",  @"items",  "@",  0);
}

- (id)_atvaccessibilityCollectionViewCellSemanticContext
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit accessibilityIdentifier]( self,  "accessibilityIdentifier"));
  unsigned int v4 = [v3 isEqualToString:@"AppCell"];

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _atvaccessibilityAppCellSemanticContext]( self,  "_atvaccessibilityAppCellSemanticContext"));
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit accessibilityIdentifier]( self,  "accessibilityIdentifier"));
    unsigned int v7 = [v6 isEqualToString:@"BannerTopShelfCell"];

    if (v7)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _atvaccessibilityBannerTopShelfCellSemanticContext]( self,  "_atvaccessibilityBannerTopShelfCellSemanticContext"));
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit accessibilityIdentifier]( self,  "accessibilityIdentifier"));
      unsigned int v9 = [v8 isEqualToString:@"LabeledContentTopShelfCell"];

      if (v9) {
        v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _atvaccessibilityLabeledContentTopShelfCellSemanticContext]( self,  "_atvaccessibilityLabeledContentTopShelfCellSemanticContext"));
      }
      else {
        v5 = 0LL;
      }
    }
  }

  return v5;
}

- (id)_atvaccessibilityAppCellSemanticContext
{
  LOBYTE(v36) = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, a2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, self, 1LL, &v36);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if ((_BYTE)v36) {
    goto LABEL_17;
  }
  unsigned int v7 = (void *)v5;
  id v8 = -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UICollectionView, v6));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  LOBYTE(v36) = 0;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___UIView, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 dataSource]);
  uint64_t v13 = __UIAccessibilityCastAsClass(v11, v12, 1LL, &v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if ((_BYTE)v36) {
    goto LABEL_17;
  }
  Class v15 = NSClassFromString(@"HBAppGridView");
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    LOBYTE(v36) = 0;
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___UIViewController, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v14 safeValueForKey:@"dataSource"]);
    uint64_t v19 = __UIAccessibilityCastAsClass(v17, v18, 1LL, &v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (!(_BYTE)v36)
    {
      Class v21 = NSClassFromString(@"HBAppGridViewController");
      if ((objc_opt_isKindOfClass(v20, v21) & 1) == 0)
      {
        v28 = 0LL;
LABEL_15:

        goto LABEL_16;
      }

      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 indexPathForCell:v7]);
      uint64_t v36 = 0LL;
      v37 = &v36;
      uint64_t v38 = 0x3032000000LL;
      v39 = __Block_byref_object_copy__1;
      v40 = __Block_byref_object_dispose__1;
      id v41 = 0LL;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472LL;
      v32[2] = __104__TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit__atvaccessibilityAppCellSemanticContext__block_invoke;
      v32[3] = &unk_C3B8;
      v35 = &v36;
      id v33 = v20;
      id v23 = v22;
      id v34 = v23;
      AXPerformSafeBlock(v32);
      id v24 = (id)v37[5];

      _Block_object_dispose(&v36, 8);
      v25 = (void *)objc_claimAutoreleasedReturnValue([v24 safeValueForKey:@"displayName"]);
      if (v25)
      {
        Class v26 = NSClassFromString(@"HBApp");
        if ((objc_opt_isKindOfClass(v24, v26) & 1) != 0)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v24 safeValueForKey:@"applicationIdentifier"]);
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCSemanticContextFactory applicationSemanticContextWithName:bundleIdentifier:]( &OBJC_CLASS___TVSCSemanticContextFactory,  "applicationSemanticContextWithName:bundleIdentifier:",  v25,  v27));

LABEL_14:
          goto LABEL_15;
        }

        Class v29 = NSClassFromString(@"HBFolder");
        if ((objc_opt_isKindOfClass(v24, v29) & 1) != 0)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCSemanticContextFactory applicationCollectionSemanticContextWithName:]( &OBJC_CLASS___TVSCSemanticContextFactory,  "applicationCollectionSemanticContextWithName:",  v25));
          goto LABEL_14;
        }
      }

      v28 = 0LL;
      goto LABEL_14;
    }

- (id)_atvaccessibilityBannerTopShelfCellSemanticContext
{
  char v26 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, a2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, self, 1LL, &v26);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v26) {
    goto LABEL_11;
  }
  unsigned int v7 = (void *)v5;
  char v25 = 0;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIView, v6);
  id v9 = -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  AXSafeClassFromString(@"TVCarouselView"));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = __UIAccessibilityCastAsClass(v8, v10, 1LL, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v25
    || (char v24 = 0,
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___UIViewController, v13),
        Class v15 = (void *)objc_claimAutoreleasedReturnValue([v12 safeValueForKey:@"dataSource"]),
        uint64_t v16 = __UIAccessibilityCastAsClass(v14, v15, 1LL, &v24),
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16),
        v15,
        v24))
  {
LABEL_11:
    abort();
  }

  Class v18 = NSClassFromString(@"HBTopShelfBannerViewController");
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    id v19 = [v12 indexForCell:v7];
    v20 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit safeValueForKey:]( self,  "safeValueForKey:",  @"model"));
    if (v20)
    {
      Class v21 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _ATVAccessibilityItemWithBannerModel:atIndex:]( self,  "_ATVAccessibilityItemWithBannerModel:atIndex:",  v20,  v19));
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _ATVAccessibilitySemanticContextWithModelItem:]( self,  "_ATVAccessibilitySemanticContextWithModelItem:",  v21));
    }

    else
    {
      v22 = 0LL;
    }
  }

  else
  {
    v22 = 0LL;
  }

  return v22;
}

- (id)_atvaccessibilityLabeledContentTopShelfCellSemanticContext
{
  char v34 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, a2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, self, 1LL, &v34);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v34) {
    goto LABEL_15;
  }
  unsigned int v7 = (void *)v5;
  char v33 = 0;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___UICollectionView, v6);
  id v10 = -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _accessibilityAncestorIsKindOf:]( self,  "_accessibilityAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UICollectionView, v9));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = __UIAccessibilityCastAsClass(v8, v11, 1LL, &v33);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v33) {
    goto LABEL_15;
  }
  char v32 = 0;
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___UIView, v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v13 dataSource]);
  uint64_t v17 = __UIAccessibilityCastAsClass(v15, v16, 1LL, &v32);
  Class v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  if (v32) {
    goto LABEL_15;
  }
  Class v19 = NSClassFromString(@"HBTopShelfLabeledContentView");
  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    Class v29 = 0LL;
    goto LABEL_14;
  }

  char v31 = 0;
  uint64_t v21 = objc_opt_class(&OBJC_CLASS___UIViewController, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v18 safeValueForKey:@"dataSource"]);
  uint64_t v23 = __UIAccessibilityCastAsClass(v21, v22, 1LL, &v31);
  char v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  if (v31) {
LABEL_15:
  }
    abort();
  Class v25 = NSClassFromString(@"HBTopShelfSectionedModelViewController");
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
  {
    char v26 = (void *)objc_claimAutoreleasedReturnValue([v13 indexPathForCell:v7]);
    v27 = (void *)objc_claimAutoreleasedReturnValue([v24 safeValueForKey:@"model"]);
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _ATVAccessibilityItemWithModel:atIndexPath:]( self,  "_ATVAccessibilityItemWithModel:atIndexPath:",  v27,  v26));
      Class v29 = (void *)objc_claimAutoreleasedReturnValue( -[TVImageStackCollectionViewCellAccessibility__HeadBoard__TVKit _ATVAccessibilitySemanticContextWithModelItem:]( self,  "_ATVAccessibilitySemanticContextWithModelItem:",  v28));
    }

    else
    {
      Class v29 = 0LL;
    }
  }

  else
  {
    Class v29 = 0LL;
  }

LABEL_14:
  return v29;
}

- (id)_ATVAccessibilityItemWithBannerModel:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a3 safeArrayForKey:@"items"]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 axSafeObjectAtIndex:a4]);

  return v6;
}

- (id)_ATVAccessibilityItemWithModel:(id)a3 atIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a3 safeArrayForKey:@"sections"]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "axSafeObjectAtIndex:", objc_msgSend(v5, "section")));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 safeArrayForKey:@"items"]);
  id v9 = [v5 item];

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 axSafeObjectAtIndex:v9]);
  return v10;
}

- (id)_ATVAccessibilitySemanticContextWithModelItem:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 safeValueForKey:@"title"]);
  if (v3) {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSCSemanticContextFactory buttonSemanticContextWithName:]( &OBJC_CLASS___TVSCSemanticContextFactory,  "buttonSemanticContextWithName:",  v3));
  }
  else {
    uint64_t v4 = 0LL;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 linkedDataDictionary]);

  return v5;
}

@end