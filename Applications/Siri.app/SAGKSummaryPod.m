@interface SAGKSummaryPod
- (id)_convertedCardSection;
- (id)_convertedCardSections;
@end

@implementation SAGKSummaryPod

- (id)_convertedCardSection
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SFDescriptionCardSection);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSummaryPod text](self, "text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SFText textWithString:](&OBJC_CLASS___SFText, "textWithString:", v4));

  [v5 setMaxLines:14];
  [v3 setDescriptionText:v5];
  id v6 = sub_1000348D4(@"ENCYCLOPEDIA_DESCRIPTION_EXPAND_TEXT");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v3 setExpandText:v7];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSummaryPod imageResource](self, "imageResource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_convertedImageOfSize:", 60.0, 75.0));
  [v3 setImage:v9];

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 UUIDString]);
  [v3 setCardSectionId:v11];

  [v3 setSeparatorStyle:5];
  return v3;
}

- (id)_convertedCardSections
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSummaryPod _convertedCardSection](self, "_convertedCardSection"));
  v5 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  return v3;
}

@end