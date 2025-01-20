@interface SRGuideViewCell
+ (BOOL)_allowsTextToWrap;
+ (BOOL)chevronBlendEffectEnabled;
+ (BOOL)placesImageAboveText;
+ (UIEdgeInsets)defaultInsets;
+ (double)heightOfCellWithName:(id)a3 tagPhrase:(id)a4 width:(double)a5;
+ (id)_nameLabelFont;
+ (id)_tagPhraseLabelFont;
- (NSString)aceId;
- (NSString)name;
- (NSString)tagPhrase;
- (SRGuideViewCell)initWithFrame:(CGRect)a3;
- (UIImage)iconImage;
- (void)setAceId:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setName:(id)a3;
- (void)setTagPhrase:(id)a3;
- (void)updateConstraints;
@end

@implementation SRGuideViewCell

- (SRGuideViewCell)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SRGuideViewCell;
  v3 = -[SRGuideViewCell initWithFrame:]( &v33,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SRGuideViewCell setKeylineType:](v3, "setKeylineType:", 0LL);
    -[SRGuideViewCell setHasChevron:](v4, "setHasChevron:", 1LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRGuideViewCell selectedBackgroundView](v4, "selectedBackgroundView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightHighlightColor](&OBJC_CLASS___UIColor, "siriui_lightHighlightColor"));
    [v5 setBackgroundColor:v6];

    v7 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    iconImageView = v4->_iconImageView;
    v4->_iconImageView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_iconImageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UIImageView setAccessibilityIgnoresInvertColors:](v4->_iconImageView, "setAccessibilityIgnoresInvertColors:", 1LL);
    v9 = objc_opt_new(&OBJC_CLASS___SiriSharedUIContentLabel);
    nameLabel = v4->_nameLabel;
    v4->_nameLabel = v9;

    v11 = v4->_nameLabel;
    *(void *)&double v13 = objc_opt_class(v4, v12).n128_u64[0];
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_nameLabelFont", v13));
    -[SiriSharedUIContentLabel setFont:](v11, "setFont:", v15);

    v16 = v4->_nameLabel;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](&OBJC_CLASS___UIColor, "siriui_lightTextColor"));
    -[SiriSharedUIContentLabel setTextColor:](v16, "setTextColor:", v17);

    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_nameLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    uint64_t v18 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](&OBJC_CLASS___SiriSharedUIContentLabel, "label"));
    tagPhraseLabel = v4->_tagPhraseLabel;
    v4->_tagPhraseLabel = (SiriSharedUIContentLabel *)v18;

    v20 = v4->_tagPhraseLabel;
    *(void *)&double v22 = objc_opt_class(v4, v21).n128_u64[0];
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "_tagPhraseLabelFont", v22));
    -[SiriSharedUIContentLabel setFont:](v20, "setFont:", v24);

    -[SiriSharedUIContentLabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_tagPhraseLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    v25 = v4->_tagPhraseLabel;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](&OBJC_CLASS___UIColor, "siriui_blendEffectColor"));
    -[SiriSharedUIContentLabel setTextColor:](v25, "setTextColor:", v26);

    -[SRGuideViewCell addSubview:](v4, "addSubview:", v4->_nameLabel);
    -[SRGuideViewCell addSubview:](v4, "addSubview:", v4->_tagPhraseLabel);
    -[SRGuideViewCell addSubview:](v4, "addSubview:", v4->_iconImageView);
    -[SiriSharedUIContentLabel siriui_setBlendEffectEnabled:](v4->_tagPhraseLabel, "siriui_setBlendEffectEnabled:", 1LL);
    *(void *)&double v28 = objc_opt_class(v4, v27).n128_u64[0];
    if (objc_msgSend(v29, "_allowsTextToWrap", v28))
    {
      -[SiriSharedUIContentLabel setNumberOfLines:](v4->_nameLabel, "setNumberOfLines:", 0LL);
      LODWORD(v30) = 1.0;
      -[SiriSharedUIContentLabel _setHyphenationFactor:](v4->_nameLabel, "_setHyphenationFactor:", v30);
      -[SiriSharedUIContentLabel setNumberOfLines:](v4->_tagPhraseLabel, "setNumberOfLines:", 0LL);
      LODWORD(v31) = 1.0;
      -[SiriSharedUIContentLabel _setHyphenationFactor:](v4->_tagPhraseLabel, "_setHyphenationFactor:", v31);
    }
  }

  return v4;
}

+ (id)_nameLabelFont
{
  return +[UIFont siriui_dynamicMediumWeightBodySizeFont]( &OBJC_CLASS___UIFont,  "siriui_dynamicMediumWeightBodySizeFont");
}

+ (id)_tagPhraseLabelFont
{
  return +[UIFont siriui_dynamicLightWeightBodySizeFont](&OBJC_CLASS___UIFont, "siriui_dynamicLightWeightBodySizeFont");
}

+ (BOOL)_allowsTextToWrap
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredContentSizeCategory]);
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

+ (BOOL)placesImageAboveText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 preferredContentSizeCategory]);
  char IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory();

  return IsAccessibilityContentSizeCategory;
}

- (void)updateConstraints
{
  v33.receiver = self;
  v33.super_class = (Class)&OBJC_CLASS___SRGuideViewCell;
  -[SRGuideViewCell updateConstraints](&v33, "updateConstraints");
  if (!self->_hasCreatedConstraints)
  {
    v34[0] = @"cellHeight";
    v34[1] = @"imageHeight";
    v35[0] = &off_1000BEBA8;
    v35[1] = &off_1000BEBB8;
    v35[2] = &off_1000BEBB8;
    v34[2] = @"imageWidth";
    v34[3] = @"nameLeading";
    UIFloorToViewScale(self, 66.5);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v35[3] = v3;
    v35[4] = &off_1000BEBC8;
    v34[4] = @"nameTop";
    v34[5] = @"imageNameSpacing";
    UIFloorToViewScale(self, 14.5);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v35[5] = v4;
    v34[6] = @"leadingPadding";
    *(void *)&double v6 = objc_opt_class(self, v5).n128_u64[0];
    objc_msgSend(v7, "defaultInsets", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", v8));
    v35[6] = v9;
    v34[7] = @"trailingPadding";
    -[SRGuideViewCell chevronTrailingMargin](self, "chevronTrailingMargin");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    v35[7] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v35,  v34,  8LL));

    uint64_t v12 = _NSDictionaryOfVariableBindings( @"_nameLabel, _tagPhraseLabel, _iconImageView",  self->_nameLabel,  self->_tagPhraseLabel,  self->_iconImageView,  0LL);
    double v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(void *)&double v15 = objc_opt_class(self, v14).n128_u64[0];
    if (objc_msgSend(v16, "placesImageAboveText", v15))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"|-leadingPadding-[_iconImageView(imageWidth)]",  0LL,  v11,  v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v17);

      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"|-leadingPadding-[_nameLabel]-trailingPadding-|",  0LL,  v11,  v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"|-leadingPadding-[_tagPhraseLabel]-trailingPadding-|",  0LL,  v11,  v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_iconImageView,  3LL,  0LL,  self,  3LL,  1.0,  11.0));
      -[SRGuideViewCell addConstraint:](self, "addConstraint:", v20);

      nameLabel = self->_nameLabel;
      iconImageView = self->_iconImageView;
      double v23 = 1.0;
      double v24 = 2.5;
      uint64_t v25 = 4LL;
    }

    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"|-leadingPadding-[_iconImageView(imageWidth)]-imageNameSpacing-[_nameLabel]-trailingPadding-|",  0LL,  v11,  v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v26);

      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintsWithVisualFormat:options:metrics:views:",  @"|-leadingPadding-[_iconImageView(imageWidth)]-imageNameSpacing-[_tagPhraseLabel]-trailingPadding-|",  0LL,  v11,  v13));
      -[SRGuideViewCell addConstraints:](self, "addConstraints:", v27);

      double v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_nameLabel,  5LL,  0LL,  self->_tagPhraseLabel,  5LL,  1.0,  0.0));
      -[SRGuideViewCell addConstraint:](self, "addConstraint:", v28);

      id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_iconImageView,  10LL,  0LL,  self,  10LL,  1.0,  0.0));
      -[SRGuideViewCell addConstraint:](self, "addConstraint:", v29);

      nameLabel = self->_nameLabel;
      double v23 = 1.0;
      double v24 = 19.0;
      iconImageView = self;
      uint64_t v25 = 3LL;
    }

    double v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  nameLabel,  3LL,  0LL,  iconImageView,  v25,  v23,  v24));
    -[SRGuideViewCell addConstraint:](self, "addConstraint:", v30);

    double v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_tagPhraseLabel,  3LL,  0LL,  self->_nameLabel,  4LL,  1.0,  1.5));
    -[SRGuideViewCell addConstraint:](self, "addConstraint:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:]( &OBJC_CLASS___NSLayoutConstraint,  "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:",  self->_iconImageView,  8LL,  0LL,  0LL,  0LL,  1.0,  40.0));
    -[SRGuideViewCell addConstraint:](self, "addConstraint:", v32);

    self->_hasCreatedConstraints = 1;
  }

+ (double)heightOfCellWithName:(id)a3 tagPhrase:(id)a4 width:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 _allowsTextToWrap])
  {
    [a1 defaultInsets];
    double v11 = a5 - v10;
    [a1 chevronTrailingMargin];
    double v13 = v11 - v12;
    NSAttributedStringKey v40 = NSFontAttributeName;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([a1 _nameLabelFont]);
    v41 = v14;
    double v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    objc_msgSend(v8, "boundingRectWithSize:options:attributes:context:", 1, v15, 0, v13, 1.79769313e308);
    double v17 = v16 + 22.0;

    NSAttributedStringKey v38 = NSFontAttributeName;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([a1 _tagPhraseLabelFont]);
    v39 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
    objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v19, 0, v13, 1.79769313e308);
    double v21 = v17 + v20;
  }

  else
  {
    double v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    double v23 = (void *)objc_claimAutoreleasedReturnValue([v22 preferredContentSizeCategory]);
    uint64_t v24 = _UIContentSizeCategoryCompareToContentSizeCategory(v23, UIContentSizeCategoryLarge);

    if (v24 == 1)
    {
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([a1 _nameLabelFont]);
      [v25 lineHeight];
      double v27 = v26;
      double v28 = (void *)objc_claimAutoreleasedReturnValue([a1 _tagPhraseLabelFont]);
      [v28 lineHeight];
      double v30 = v27 + v29;

      double v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_mediumWeightBodySizeFont](&OBJC_CLASS___UIFont, "siriui_mediumWeightBodySizeFont"));
      [v31 lineHeight];
      double v33 = v32;
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont siriui_lightWeightBodySubtextSizeFont]( &OBJC_CLASS___UIFont,  "siriui_lightWeightBodySubtextSizeFont"));
      [v34 lineHeight];
      double v36 = v33 + v35;

      double v21 = UIRoundToViewScale(0LL, v30 - v36) + 80.0;
    }

    else
    {
      double v21 = 80.0;
    }
  }

  return v21;
}

+ (UIEdgeInsets)defaultInsets
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v2 scale];

  double v3 = 0.0;
  double v4 = 24.0;
  double v5 = 0.0;
  double v6 = 24.0;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

+ (BOOL)chevronBlendEffectEnabled
{
  return 1;
}

- (void)setIconImage:(id)a3
{
  double v4 = (UIImage *)[a3 copy];
  iconImage = self->_iconImage;
  self->_iconImage = v4;

  -[UIImageView setImage:](self->_iconImageView, "setImage:", self->_iconImage);
}

- (void)setName:(id)a3
{
}

- (void)setTagPhrase:(id)a3
{
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)tagPhrase
{
  return self->_tagPhrase;
}

- (NSString)aceId
{
  return self->_aceId;
}

- (void)setAceId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end