@interface TVPMemoriesTabFavoritesCellSpec
- (double)memorySubtitleLeading;
- (double)memorySubtitleTracking;
- (double)memoryTitleLeading;
- (double)memoryTitleTracking;
- (id)memorySubtitleFont;
- (id)memoryTitleFont;
@end

@implementation TVPMemoriesTabFavoritesCellSpec

- (id)memoryTitleFont
{
  UIFontDescriptorAttributeName v11 = UIFontDescriptorTraitsAttribute;
  v9[0] = UIFontWidthTrait;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", kCTFontWidthExtraCompressed));
  v10[0] = v2;
  v9[1] = UIFontWeightTrait;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightBold));
  v9[2] = UIFontSystemFontDesignTrait;
  v10[1] = v3;
  v10[2] = UIFontDescriptorSystemDesignDefault;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  v6 = -[UIFontDescriptor initWithFontAttributes:]( objc_alloc(&OBJC_CLASS___UIFontDescriptor),  "initWithFontAttributes:",  v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v6, 48.0));

  return v7;
}

- (double)memoryTitleLeading
{
  return 48.0;
}

- (double)memoryTitleTracking
{
  return 1.81;
}

- (id)memorySubtitleFont
{
  UIFontDescriptorAttributeName v11 = UIFontDescriptorTraitsAttribute;
  v9[0] = UIFontWidthTrait;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", kCTFontWidthSemiExpanded));
  v10[0] = v2;
  v9[1] = UIFontWeightTrait;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", UIFontWeightSemibold));
  v9[2] = UIFontSystemFontDesignTrait;
  v10[1] = v3;
  v10[2] = UIFontDescriptorSystemDesignDefault;
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  3LL));
  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));

  v6 = -[UIFontDescriptor initWithFontAttributes:]( objc_alloc(&OBJC_CLASS___UIFontDescriptor),  "initWithFontAttributes:",  v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](&OBJC_CLASS___UIFont, "fontWithDescriptor:size:", v6, 17.0));

  return v7;
}

- (double)memorySubtitleLeading
{
  return 0.0;
}

- (double)memorySubtitleTracking
{
  return 1.0;
}

@end