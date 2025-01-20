@interface SAGKSourceLinkPod
- (id)_convertedCardSections;
@end

@implementation SAGKSourceLinkPod

- (id)_convertedCardSections
{
  id v3 = objc_alloc_init(&OBJC_CLASS___SFRowCardSection);
  [v3 setImageIsRightAligned:1];
  id v4 = objc_alloc_init(&OBJC_CLASS___SFRichText);
  id v5 = sub_1000348D4(@"SEE_MORE_ON_PUNCHOUT_FORMAT");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSourceLinkPod punchOut](self, "punchOut"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 punchOutName]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:]( &OBJC_CLASS___NSString,  "stringWithValidatedFormat:validFormatSpecifiers:error:",  v6,  @"%@",  0LL,  v8));
  [v4 setText:v9];

  [v3 setLeadingText:v4];
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SAGKSourceLinkPod punchOut](self, "punchOut"));
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 _convertedPunchout]);
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  [v3 setPunchoutOptions:v12];

  [v3 setSeparatorStyle:5];
  id v15 = v3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v15, 1LL));

  return v13;
}

@end