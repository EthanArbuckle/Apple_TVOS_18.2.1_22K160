@interface TVPPhotoCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (void)_updateImageView;
@end

@implementation TVPPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TVPPhotoCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoCell",  @"imageView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVImageStackView",  @"imageStack",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoCell",  @"imageProxy",  "@",  0);
  [v3 validateClass:@"TVImageStack" hasInstanceVariable:@"_imageRepresentations" withType:"NSArray"];
  [v3 validateClass:@"_TVUIImageRepresentation" hasInstanceVariable:@"_image" withType:"UIImage"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVImageProxy",  @"object",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVCKDataItem",  @"valueForProperty:",  "@",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoCell",  @"_updateImageView",  "v",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVPPhotoCell",  @"placeholderImage",  "@",  0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  id v3 = (char *)-[TVPPhotoCellAccessibility accessibilityRowRange](self, "accessibilityRowRange");
  if (v3 == (char *)0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0LL;
  }

  else
  {
    v5 = v3;
    id v6 = accessibilityLocalizedString(@"generic.photo.label");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    uint64_t v8 = AXFormatInteger(v5 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v7, v9));
  }

  LOBYTE(v40) = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"imageProxy"));
  uint64_t v11 = __UIAccessibilitySafeClass(@"TVImageProxy", v10, 1LL, &v40);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if ((_BYTE)v40) {
    goto LABEL_18;
  }
  LOBYTE(v40) = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 safeValueForKey:@"object"]);
  uint64_t v14 = __UIAccessibilitySafeClass(@"TVCKDataItem", v13, 1LL, &v40);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  if ((_BYTE)v40) {
    goto LABEL_18;
  }
  char v46 = 0;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  id v45 = 0LL;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = __47__TVPPhotoCellAccessibility_accessibilityLabel__block_invoke;
  v37[3] = &unk_8258;
  v39 = &v40;
  id v16 = v15;
  id v38 = v16;
  AXPerformSafeBlock(v37);
  v17 = v38;
  id v18 = (id)v41[5];

  _Block_object_dispose(&v40, 8);
  uint64_t v19 = __UIAccessibilitySafeClass(@"NSDate", v18, 1LL, &v46);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

  if (v46) {
LABEL_18:
  }
    abort();
  if (v20 && (uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSDate, v21), (objc_opt_isKindOfClass(v20, v22) & 1) != 0))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v24 = (void *)objc_claimAutoreleasedReturnValue([v23 components:28 fromDate:v20]);

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    v27 = (void *)objc_claimAutoreleasedReturnValue([v25 components:28 fromDate:v26]);

    id v28 = [v24 year];
    if (v28 == [v27 year])
    {
      id v29 = [v24 month];
      v30 = @"MMMMddjjmm";
      if (v29 == [v27 month])
      {
        id v31 = [v24 day];
        if (v31 == [v27 day]) {
          v30 = @"jjmm";
        }
      }
    }

    else
    {
      v30 = @"MMMMddyyyyjjmm";
    }

    uint64_t v33 = AXDateStringForFormat(v20, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v33);
  }

  else
  {
    v32 = 0LL;
  }

  uint64_t v34 = __UIAXStringForVariables(v4);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

  return v35;
}

void __47__TVPPhotoCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) valueForProperty:TVCKDataPropertyDateCreated]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)accessibilityValue
{
  char v18 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIImageView, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"imageView"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v18);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v18) {
    goto LABEL_8;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 image]);

  char v18 = 0;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___UIImage, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVPPhotoCellAccessibility safeValueForKey:](self, "safeValueForKey:", @"_placeholderImage"));
  uint64_t v11 = __UIAccessibilityCastAsClass(v9, v10, 1LL, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  if (v18) {
LABEL_8:
  }
    abort();
  if (!v7
    || v7 != v12
    || (id v13 = accessibilityLocalizedString(@"photo.loading"),
        (uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13)) == 0LL))
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___TVPPhotoCellAccessibility;
    id v15 = -[TVPPhotoCellAccessibility accessibilityValue](&v17, "accessibilityValue");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
  }

  return v14;
}

- (void)_updateImageView
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___TVPPhotoCellAccessibility;
  -[TVPPhotoCellAccessibility _updateImageView](&v2, "_updateImageView");
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0LL);
}

@end