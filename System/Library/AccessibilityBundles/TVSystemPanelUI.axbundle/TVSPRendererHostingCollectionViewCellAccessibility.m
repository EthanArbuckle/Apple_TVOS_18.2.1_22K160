@interface TVSPRendererHostingCollectionViewCellAccessibility
+ (BOOL)_accessibilityIsFormatAHeader:(int64_t)a3;
+ (Class)safeCategoryBaseClass;
+ (id)_overridenAccessibilitylabelForSpecificImage:(id)a3;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (_NSRange)accessibilityRowRange;
- (id)_accessibilityContainedView;
- (id)_accessibilityContent;
- (id)_accessibilityParentCollectionView;
- (id)_accessibilityRenderer;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)_accessibilityFormat;
- (unint64_t)accessibilityTraits;
@end

@implementation TVSPRendererHostingCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_TVSPRendererHostingCollectionViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"_TVSPRendererHostingCollectionViewCell",  @"rendererHostingView",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"_TVSPRendererHostingView",  @"renderer",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPRenderer",  @"content",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVSPRenderer",  @"format",  "q",  0);
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentTitle" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentText1" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentText2" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentText3" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentImage" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentImage1" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentImage2" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentImage3" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentIsSelected" isInstanceMethod:1 isRequired:0];
  [v3 validateProtocol:@"TVSPContentProviding" hasMethod:@"contentIsDisabled" isInstanceMethod:1 isRequired:0];
  [v3 validateClass:@"UIImage" hasInstanceVariable:@"_imageAsset" withType:"UIImageAsset"];
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"UIImageAsset",  @"assetName",  "@",  0);
}

+ (id)_overridenAccessibilitylabelForSpecificImage:(id)a3
{
  id v3 = a3;
  if (_UIImageIsSystemSymbol())
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue([v3 safeValueForKey:@"_imageAsset"]);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"assetName"]);

    if ([v5 isEqualToString:@"gamecontroller"])
    {
      v6 = @"symbol.gamecontroller";
    }

    else
    {
      if (![v5 isEqualToString:@"accessibility"])
      {
        v7 = 0LL;
        goto LABEL_9;
      }

      v6 = @"symbol.accessibility";
    }

    id v8 = accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v8);
LABEL_9:

    goto LABEL_10;
  }

  v7 = 0LL;
LABEL_10:

  return v7;
}

+ (BOOL)_accessibilityIsFormatAHeader:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xA4u >> a3);
}

- (id)_accessibilityRenderer
{
  return -[TVSPRendererHostingCollectionViewCellAccessibility safeValueForKeyPath:]( self,  "safeValueForKeyPath:",  @"rendererHostingView.renderer");
}

- (id)_accessibilityContent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"content"]);

  return v3;
}

- (int64_t)_accessibilityFormat
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeValueForKey:@"format"]);
  id v4 = [v3 integerValue];

  return (int64_t)v4;
}

- (id)_accessibilityContainedView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"rendererHostingView"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 safeUIViewForKey:@"contentView"]);

  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 subviews]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 firstObject]);

  return v5;
}

- (id)_accessibilityParentCollectionView
{
  char v14 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UIView, a2);
  uint64_t v4 = __UIAccessibilityCastAsClass(v3, self, 1LL, &v14);
  uint64_t v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v14
    || (v7 = (void *)v5,
        char v13 = 0,
        uint64_t v8 = objc_opt_class(&OBJC_CLASS___UICollectionView, v6),
        v9 = (void *)objc_claimAutoreleasedReturnValue([v7 superview]),
        uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v13),
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10),
        v9,
        v13))
  {
    abort();
  }

  return v11;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  uint64_t v4 = AXSafeClassFromString(@"TVSSNowPlayingControlsRenderer");
  char isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  return (isKindOfClass & 1) == 0
      && (char *)-[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityFormat]( self,  "_accessibilityFormat") != (char *)&dword_10 + 3;
}

- (id)accessibilityLabel
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  if (([v3 isAccessibilityElement] & 1) == 0)
  {

    goto LABEL_5;
  }

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 accessibilityLabel]);
  id v6 = [v5 length];

  if (!v6)
  {
LABEL_5:
    v7 = objc_alloc_init(&OBJC_CLASS___NSMutableOrderedSet);
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityContainedView]( self,  "_accessibilityContainedView"));
    if ([v9 isAccessibilityElement])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityLabel]);
      id v11 = [v10 length];

      if (v11)
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityLabel]);
LABEL_64:

        goto LABEL_65;
      }
    }

    int64_t v12 = -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityFormat](self, "_accessibilityFormat");
    char v13 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityContent]( self,  "_accessibilityContent"));
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___PBSScheduledSleep, v14);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 predictedEndDate]);
      uint64_t v17 = AXClockTimeStringForDate();
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      uint64_t v19 = AXDurationStringForDuration([v16 timeIntervalSinceNow]);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      id v21 = accessibilityLocalizedString(@"sleep.time.remaining");
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v22, v18, v20));

LABEL_63:
      goto LABEL_64;
    }

    SEL v23 = NSSelectorFromString(@"contentTitle");
    if ((objc_opt_respondsToSelector(v13, v23) & 1) != 0)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue([v13 safeStringForKey:@"contentTitle"]);
      if ([v24 length]) {
        -[NSMutableOrderedSet addObject:](v7, "addObject:", v24);
      }
    }

    else
    {
      v24 = 0LL;
    }

    if ((unint64_t)(v12 - 12) <= 0xFFFFFFFFFFFFFFFDLL
      && (SEL v25 = NSSelectorFromString(@"contentText1"), (objc_opt_respondsToSelector(v13, v25) & 1) != 0))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v13 safeStringForKey:@"contentText1"]);

      if ([v26 length]) {
        -[NSMutableOrderedSet addObject:](v7, "addObject:", v26);
      }
    }

    else
    {
      v26 = v24;
    }

    SEL v27 = NSSelectorFromString(@"contentText2");
    if ((objc_opt_respondsToSelector(v13, v27) & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v13 safeStringForKey:@"contentText2"]);

      if ([v28 length]) {
        -[NSMutableOrderedSet addObject:](v7, "addObject:", v28);
      }
    }

    else
    {
      v28 = v26;
    }

    SEL v29 = NSSelectorFromString(@"contentText3");
    if ((objc_opt_respondsToSelector(v13, v29) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 safeStringForKey:@"contentText3"]);

      if ([v16 length]) {
        -[NSMutableOrderedSet addObject:](v7, "addObject:", v16);
      }
    }

    else
    {
      v16 = v28;
    }

    if (-[NSMutableOrderedSet count](v7, "count"))
    {
LABEL_62:
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet array](v7, "array"));
      uint64_t v70 = UIAXLabelForElements();
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v70);
      goto LABEL_63;
    }

    char v75 = 0;
    uint64_t v31 = objc_opt_class(&OBJC_CLASS___UIImage, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue([v13 safeValueForKey:@"contentImage"]);
    uint64_t v33 = __UIAccessibilityCastAsClass(v31, v32, 1LL, &v75);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

    if (!v75)
    {
      if (v34)
      {
        id v36 = objc_msgSend((id)objc_opt_class(self, v35), "_overridenAccessibilitylabelForSpecificImage:", v34);
        v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        v38 = v37;
        if (v37) {
          id v39 = v37;
        }
        else {
          id v39 = (id)objc_claimAutoreleasedReturnValue([v34 accessibilityLabel]);
        }
        v40 = v39;

        if ([v40 length]) {
          -[NSMutableOrderedSet addObject:](v7, "addObject:", v40);
        }
      }

      if (v12 == 8)
      {
        v41 = v34;
      }

      else
      {
        char v74 = 0;
        uint64_t v42 = objc_opt_class(&OBJC_CLASS___UIImage, v35);
        v43 = (void *)objc_claimAutoreleasedReturnValue([v13 safeValueForKey:@"contentImage1"]);
        uint64_t v44 = __UIAccessibilityCastAsClass(v42, v43, 1LL, &v74);
        v41 = (void *)objc_claimAutoreleasedReturnValue(v44);

        if (v74) {
          goto LABEL_66;
        }

        if (v41)
        {
          id v45 = objc_msgSend((id)objc_opt_class(self, v35), "_overridenAccessibilitylabelForSpecificImage:", v41);
          v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
          v47 = v46;
          if (v46) {
            id v48 = v46;
          }
          else {
            id v48 = (id)objc_claimAutoreleasedReturnValue([v41 accessibilityLabel]);
          }
          v49 = v48;

          if ([v49 length]) {
            -[NSMutableOrderedSet addObject:](v7, "addObject:", v49);
          }
        }
      }

      char v73 = 0;
      uint64_t v50 = objc_opt_class(&OBJC_CLASS___UIImage, v35);
      v51 = (void *)objc_claimAutoreleasedReturnValue([v13 safeValueForKey:@"contentImage2"]);
      uint64_t v52 = __UIAccessibilityCastAsClass(v50, v51, 1LL, &v73);
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);

      if (!v73)
      {

        if (v53)
        {
          id v55 = objc_msgSend((id)objc_opt_class(self, v54), "_overridenAccessibilitylabelForSpecificImage:", v53);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v57 = v56;
          if (v56) {
            id v58 = v56;
          }
          else {
            id v58 = (id)objc_claimAutoreleasedReturnValue([v53 accessibilityLabel]);
          }
          v59 = v58;

          if ([v59 length]) {
            -[NSMutableOrderedSet addObject:](v7, "addObject:", v59);
          }
        }

        char v72 = 0;
        uint64_t v60 = objc_opt_class(&OBJC_CLASS___UIImage, v54);
        v61 = (void *)objc_claimAutoreleasedReturnValue([v13 safeValueForKey:@"contentImage3"]);
        uint64_t v62 = __UIAccessibilityCastAsClass(v60, v61, 1LL, &v72);
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);

        if (!v72)
        {

          if (v63)
          {
            id v65 = objc_msgSend((id)objc_opt_class(self, v64), "_overridenAccessibilitylabelForSpecificImage:", v63);
            v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
            v67 = v66;
            if (v66) {
              id v68 = v66;
            }
            else {
              id v68 = (id)objc_claimAutoreleasedReturnValue([v63 accessibilityLabel]);
            }
            v69 = v68;

            if ([v69 length]) {
              -[NSMutableOrderedSet addObject:](v7, "addObject:", v69);
            }
          }

          goto LABEL_62;
        }
      }
    }

- (id)accessibilityValue
{
  int64_t v3 = -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityFormat](self, "_accessibilityFormat");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityContent]( self,  "_accessibilityContent"));
  id v6 = v4;
  if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0xA)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 safeStringForKey:@"contentText1"]);
  }

  else if (v3 == 8)
  {
    char v15 = 0;
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___UIImage, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 safeValueForKey:@"contentImage1"]);
    uint64_t v10 = __UIAccessibilityCastAsClass(v8, v9, 1LL, &v15);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    if (v15) {
      abort();
    }
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"_imageAsset"]);
    char v13 = (void *)objc_claimAutoreleasedReturnValue([v12 safeStringForKey:@"assetName"]);

    else {
      v7 = (void *)objc_claimAutoreleasedReturnValue([v11 accessibilityLabel]);
    }
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (unint64_t)accessibilityTraits
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  unsigned int v4 = [v3 isAccessibilityElement];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
    id v6 = [v5 accessibilityTraits];

    return (unint64_t)v6;
  }

  else
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___TVSPRendererHostingCollectionViewCellAccessibility;
    unint64_t v8 = -[TVSPRendererHostingCollectionViewCellAccessibility accessibilityTraits](&v22, "accessibilityTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityContainedView]( self,  "_accessibilityContainedView"));
    if ([v9 isAccessibilityElement])
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 accessibilityLabel]);
      id v11 = [v10 length];

      if (v11) {
        v8 |= (unint64_t)[v9 accessibilityTraits];
      }
    }

    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityContent]( self,  "_accessibilityContent"));
    unsigned int v13 = [v12 safeBoolForKey:@"contentIsSelected"];
    UIAccessibilityTraits v14 = UIAccessibilityTraitSelected;
    if (!v13) {
      UIAccessibilityTraits v14 = 0LL;
    }
    UIAccessibilityTraits v15 = v14 | v8;
    else {
      UIAccessibilityTraits v16 = 0LL;
    }
    int64_t v17 = -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityFormat](self, "_accessibilityFormat");
    unsigned int v19 = objc_msgSend((id)objc_opt_class(self, v18), "_accessibilityIsFormatAHeader:", v17);
    UIAccessibilityTraits v20 = UIAccessibilityTraitHeader;
    if (!v19) {
      UIAccessibilityTraits v20 = 0LL;
    }
    unint64_t v21 = v15 | v16 | v20;

    return v21;
  }

- (id)accessibilityHeaderElements
{
  int64_t v3 = -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityFormat](self, "_accessibilityFormat");
  id v7 = -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityViewAncestorIsKindOf:]( self,  "_accessibilityViewAncestorIsKindOf:",  objc_opt_class(&OBJC_CLASS___UICollectionView, v5));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  char v25 = 0;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___UICollectionViewCell, v9);
  uint64_t v11 = __UIAccessibilityCastAsClass(v10, self, 1LL, &v25);
  uint64_t v12 = objc_claimAutoreleasedReturnValue(v11);
  if (v25) {
    abort();
  }
  unsigned int v13 = (void *)v12;
  UIAccessibilityTraits v14 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForCell:v12]);
  UIAccessibilityTraits v15 = v14;
  if (v14)
  {
    UIAccessibilityTraits v16 = (char *)[v14 section];
    if (v16)
    {
      if ((uint64_t)v16 >= 1)
      {
        UIAccessibilityTraits v17 = UIAccessibilityTraitHeader;
        uint64_t v18 = v16 + 1;
        while (1)
        {
          unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForItem:inSection:",  0LL,  v18 - 2));
          UIAccessibilityTraits v20 = (void *)objc_claimAutoreleasedReturnValue([v8 cellForItemAtIndexPath:v19]);
        }

        v26 = v20;
        SEL v23 = &v26;
        goto LABEL_16;
      }
    }

    else if ([v15 item])
    {
      unint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForItem:inSection:]( NSIndexPath,  "indexPathForItem:inSection:",  (char *)[v15 item] - 1,  0));
      UIAccessibilityTraits v20 = (void *)objc_claimAutoreleasedReturnValue([v8 cellForItemAtIndexPath:v21]);

      unint64_t v22 = (unint64_t)[v20 accessibilityTraits];
      if ((UIAccessibilityTraitHeader & v22) == 0)
      {
        v24 = 0LL;
        goto LABEL_18;
      }

      SEL v27 = v20;
      SEL v23 = &v27;
LABEL_16:
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v23, 1LL));
LABEL_18:

      goto LABEL_19;
    }
  }

- (_NSRange)accessibilityRowRange
{
  int64_t v3 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  uint64_t v4 = AXSafeClassFromString(@"TVSSArtworkInfoRenderer");
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {

LABEL_7:
    id v14 = 0LL;
    uint64_t v12 = 0x7FFFFFFFLL;
    goto LABEL_8;
  }

  char v22 = 0;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___TVSPRenderer, v5);
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityRenderer]( self,  "_accessibilityRenderer"));
  uint64_t v8 = __UIAccessibilityCastAsClass(v6, v7, 1LL, &v22);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (v22) {
    abort();
  }
  unsigned int v10 = [v9 isFocusable];

  if (!v10) {
    goto LABEL_7;
  }
  unint64_t v11 = -[TVSPRendererHostingCollectionViewCellAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((UIAccessibilityTraitHeader & v11) != 0)
  {
    v21.receiver = self;
    v21.super_class = (Class)&OBJC_CLASS___TVSPRendererHostingCollectionViewCellAccessibility;
    uint64_t v12 = (uint64_t)-[TVSPRendererHostingCollectionViewCellAccessibility accessibilityRowRange]( &v21,  "accessibilityRowRange");
    id v14 = v13;
  }

  else
  {
    UIAccessibilityTraits v17 = (void *)objc_claimAutoreleasedReturnValue( -[TVSPRendererHostingCollectionViewCellAccessibility _accessibilityParentCollectionView]( self,  "_accessibilityParentCollectionView"));
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___TVSPRendererHostingCollectionViewCellAccessibility;
    -[TVSPRendererHostingCollectionViewCellAccessibility accessibilityRowRange](&v20, "accessibilityRowRange");
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 subviews]);
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 axFilterObjectsUsingBlock:&__block_literal_global_0]);

    id v14 = [v19 count];
    uint64_t v12 = (uint64_t)[v19 indexOfObject:self];
  }

BOOL __75__TVSPRendererHostingCollectionViewCellAccessibility_accessibilityRowRange__block_invoke( id a1,  id a2,  unint64_t a3)
{
  id v3 = a2;
  SEL v4 = NSSelectorFromString(@"_accessibilityRenderer");
  if ((objc_opt_respondsToSelector(v3, v4) & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 _accessibilityRenderer]);
    if (v6)
    {
      char v14 = 0;
      uint64_t v7 = objc_opt_class(&OBJC_CLASS___TVSPRenderer, v5);
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 _accessibilityRenderer]);
      uint64_t v9 = __UIAccessibilityCastAsClass(v7, v8, 1LL, &v14);
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

      if (v14) {
        abort();
      }
      if ([v10 isFocusable])
      {
        unint64_t v11 = (unint64_t)[v3 accessibilityTraits];
        BOOL v12 = (UIAccessibilityTraitHeader & v11) == 0;
      }

      else
      {
        BOOL v12 = 0;
      }
    }

    else
    {
      BOOL v12 = 0;
    }
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

@end