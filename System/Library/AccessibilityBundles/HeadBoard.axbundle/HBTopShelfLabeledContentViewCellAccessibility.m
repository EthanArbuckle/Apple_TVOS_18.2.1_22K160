@interface HBTopShelfLabeledContentViewCellAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityHeaderElements;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)_accessibilityScanningBehaviorTraits;
@end

@implementation HBTopShelfLabeledContentViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HBTopShelfLabeledContentViewCell";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___UIAccessibilitySafeCategory, a2);
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfLabeledContentView",  @"delegate",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfSectionedModelViewController",  @"model",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfSectionedModel",  @"sections",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfObject",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"TVContentItem",  @"title",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfLabeledContentViewCell",  @"expirationDate",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfLabeledContentViewCell",  @"playbackTitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfLabeledContentViewCell",  @"playbackSubtitle",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfLabeledContentViewCell",  @"topRightText",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"HBTopShelfLabeledContentViewCell",  @"playbackPercentage",  "@",  0);
  objc_msgSend( v3,  "validateClass:hasInstanceMethod:withFullSignature:",  @"NSDate",  @"hb_prettyExpirationDate",  "@",  0);
}

- (id)accessibilityLabel
{
  char v17 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDate, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[HBTopShelfLabeledContentViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"expirationDate"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v17) {
    abort();
  }
  if (v6) {
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 safeValueForKey:@"hb_prettyExpirationDate"]);
  }
  else {
    v7 = 0LL;
  }
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___HBTopShelfLabeledContentViewCellAccessibility;
  id v8 = -[HBTopShelfLabeledContentViewCellAccessibility accessibilityLabel](&v16, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[HBTopShelfLabeledContentViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"playbackTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue( -[HBTopShelfLabeledContentViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"playbackSubtitle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue( -[HBTopShelfLabeledContentViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"topRightText"));
  uint64_t v11 = __UIAXStringForVariables(v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  return v12;
}

- (id)accessibilityValue
{
  char v18 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue( -[HBTopShelfLabeledContentViewCellAccessibility safeValueForKey:]( self,  "safeValueForKey:",  @"playbackPercentage"));
  uint64_t v5 = __UIAccessibilityCastAsClass(v3, v4, 1LL, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v18) {
    abort();
  }
  [v6 floatValue];
  float v8 = v7;

  if (v8 <= 0.0 || v8 > 1.0)
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___HBTopShelfLabeledContentViewCellAccessibility;
    id v10 = -[HBTopShelfLabeledContentViewCellAccessibility accessibilityValue](&v17, "accessibilityValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v10);
  }

  else
  {
    id v11 = accessibilityLocalizedString(@"percentage.played");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    uint64_t v13 = AXFormatFloatWithPercentage(0LL, v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v14));
  }

  return v15;
}

- (id)accessibilityHeaderElements
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __76__HBTopShelfLabeledContentViewCellAccessibility_accessibilityHeaderElements__block_invoke;
  v6[3] = &unk_C310;
  v6[4] = self;
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v7 = v2;
  AXPerformSafeBlock(v6);
  uint64_t v3 = v7;
  id v4 = v2;

  return v4;
}

void __76__HBTopShelfLabeledContentViewCellAccessibility_accessibilityHeaderElements__block_invoke( uint64_t a1,  uint64_t a2)
{
  char v49 = 0;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___UICollectionView, a2);
  id v5 = objc_msgSend( *(id *)(a1 + 32),  "_accessibilityAncestorIsKindOf:",  objc_opt_class(UICollectionView, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = __UIAccessibilityCastAsClass(v3, v6, 1LL, &v49);
  float v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v49) {
    goto LABEL_17;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 indexPathForCell:*(void *)(a1 + 32)]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 delegate]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 safeValueForKey:@"delegate"]);
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 safeValueForKey:@"model"]);
  char v49 = 0;
  uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSArray, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v12 safeValueForKey:@"sections"]);
  uint64_t v16 = __UIAccessibilityCastAsClass(v14, v15, 1LL, &v49);
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v49) {
    goto LABEL_17;
  }
  v40 = v12;
  v41 = v11;
  v42 = v10;
  v43 = v9;
  uint64_t v44 = a1;
  v39 = v17;
  char v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndex:", objc_msgSend(v9, "section")));
  char v49 = 0;
  uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString, v19);
  v38 = v18;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v18 safeValueForKey:@"title"]);
  uint64_t v22 = __UIAccessibilityCastAsClass(v20, v21, 1LL, &v49);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v49) {
LABEL_17:
  }
    abort();
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v37 = v8;
  v24 = (void *)objc_claimAutoreleasedReturnValue([v8 subviews]);
  id v25 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v26; i = (char *)i + 1)
      {
        if (*(void *)v46 != v27) {
          objc_enumerationMutation(v24);
        }
        v29 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        Class v30 = NSClassFromString(@"HBTopShelfSectionLabel");
        if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
        {
          char v49 = 0;
          uint64_t v32 = objc_opt_class(&OBJC_CLASS___UILabel, v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue([v29 safeValueForKey:@"textLabel"]);
          uint64_t v34 = __UIAccessibilityCastAsClass(v32, v33, 1LL, &v49);
          v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

          if (v49) {
            goto LABEL_17;
          }
          v36 = (void *)objc_claimAutoreleasedReturnValue([v35 accessibilityLabel]);
        }
      }

      id v26 = [v24 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }

    while (v26);
  }
}

- (unint64_t)_accessibilityScanningBehaviorTraits
{
  return 9LL;
}

@end