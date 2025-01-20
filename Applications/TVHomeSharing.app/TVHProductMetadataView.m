@interface TVHProductMetadataView
- (BOOL)isHighDefinition;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSNumber)duration;
- (NSNumber)releaseYear;
- (NSString)contentRatingBadgeText;
- (NSString)genreTitle;
- (TVHContentRatingView)contentRatingView;
- (TVHProductMetadataView)initWithFrame:(CGRect)a3;
- (UIImage)contentRatingBadgeImage;
- (UILabel)durationLabel;
- (UILabel)genreTitleLabel;
- (UILabel)highDefinitionLabel;
- (UILabel)releaseYearLabel;
- (id)_label;
- (void)_updateContentRatingView;
- (void)layoutSubviews;
- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4;
- (void)setDuration:(id)a3;
- (void)setGenreTitle:(id)a3;
- (void)setHighDefinition:(BOOL)a3;
- (void)setReleaseYear:(id)a3;
@end

@implementation TVHProductMetadataView

- (TVHProductMetadataView)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHProductMetadataView;
  v3 = -[TVHProductMetadataView initWithFrame:]( &v18,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));

    uint64_t v7 = objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView _label](v3, "_label"));
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = (UILabel *)v7;

    -[UILabel setTextColor:](v3->_durationLabel, "setTextColor:", v6);
    -[UILabel setHidden:](v3->_durationLabel, "setHidden:", 1LL);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_durationLabel, "tvh_setDebugLayoutColorType:", 6LL);
    -[TVHProductMetadataView addSubview:](v3, "addSubview:", v3->_durationLabel);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView _label](v3, "_label"));
    genreTitleLabel = v3->_genreTitleLabel;
    v3->_genreTitleLabel = (UILabel *)v9;

    -[UILabel setTextColor:](v3->_genreTitleLabel, "setTextColor:", v6);
    -[UILabel setHidden:](v3->_genreTitleLabel, "setHidden:", 1LL);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_genreTitleLabel, "tvh_setDebugLayoutColorType:", 7LL);
    -[TVHProductMetadataView addSubview:](v3, "addSubview:", v3->_genreTitleLabel);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView _label](v3, "_label"));
    releaseYearLabel = v3->_releaseYearLabel;
    v3->_releaseYearLabel = (UILabel *)v11;

    -[UILabel setTextColor:](v3->_releaseYearLabel, "setTextColor:", v6);
    -[UILabel setHidden:](v3->_releaseYearLabel, "setHidden:", 1LL);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_releaseYearLabel, "tvh_setDebugLayoutColorType:", 12LL);
    -[TVHProductMetadataView addSubview:](v3, "addSubview:", v3->_releaseYearLabel);
    v13 = objc_alloc_init(&OBJC_CLASS___TVHContentRatingView);
    contentRatingView = v3->_contentRatingView;
    v3->_contentRatingView = v13;

    -[TVHContentRatingView setHidden:](v3->_contentRatingView, "setHidden:", 1LL);
    -[TVHContentRatingView setTintColor:](v3->_contentRatingView, "setTintColor:", v6);
    -[TVHContentRatingView tvh_setDebugLayoutColorType:](v3->_contentRatingView, "tvh_setDebugLayoutColorType:", 8LL);
    -[TVHProductMetadataView addSubview:](v3, "addSubview:", v3->_contentRatingView);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView _label](v3, "_label"));
    highDefinitionLabel = v3->_highDefinitionLabel;
    v3->_highDefinitionLabel = (UILabel *)v15;

    -[UILabel setHidden:](v3->_highDefinitionLabel, "setHidden:", 1LL);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_highDefinitionLabel, "tvh_setDebugLayoutColorType:", 14LL);
    -[TVHProductMetadataView addSubview:](v3, "addSubview:", v3->_highDefinitionLabel);
  }

  return v3;
}

- (void)setDuration:(id)a3
{
  id v8 = a3;
  if ((-[NSNumber isEqual:](self->_duration, "isEqual:") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView durationLabel](self, "durationLabel"));
    v5 = (NSNumber *)[v8 copy];
    duration = self->_duration;
    self->_duration = v5;

    if (v8)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString tvh_durationStringForSeconds:](&OBJC_CLASS___NSString, "tvh_durationStringForSeconds:"));
      [v4 setText:v7];
      [v4 setHidden:0];
    }

    else
    {
      [v4 setHidden:1];
    }

    -[TVHProductMetadataView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSString)genreTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView genreTitleLabel](self, "genreTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setGenreTitle:(id)a3
{
  id v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView genreTitle](self, "genreTitle"));
  unsigned __int8 v5 = [v4 isEqual:v8];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView genreTitleLabel](self, "genreTitleLabel"));
    id v7 = [v8 length];
    if (v7) {
      [v6 setText:v8];
    }
    [v6 setHidden:v7 == 0];
    -[TVHProductMetadataView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setReleaseYear:(id)a3
{
  id v8 = a3;
  if ((-[NSNumber isEqual:](self->_releaseYear, "isEqual:") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView releaseYearLabel](self, "releaseYearLabel"));
    unsigned __int8 v5 = (NSNumber *)[v8 copy];
    releaseYear = self->_releaseYear;
    self->_releaseYear = v5;

    if (v8)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 stringValue]);
      [v4 setText:v7];
    }

    [v4 setHidden:v8 == 0];
    -[TVHProductMetadataView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (UIImage)contentRatingBadgeImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView contentRatingView](self, "contentRatingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingBadgeImage]);

  return (UIImage *)v3;
}

- (NSString)contentRatingBadgeText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView contentRatingView](self, "contentRatingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingBadgeText]);

  return (NSString *)v3;
}

- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView contentRatingView](self, "contentRatingView"));
  [v8 setContentRatingBadgeImage:v7 badgeText:v6];

  -[TVHProductMetadataView _updateContentRatingView](self, "_updateContentRatingView");
}

- (void)setHighDefinition:(BOOL)a3
{
  if (self->_highDefinition != a3)
  {
    BOOL v3 = a3;
    self->_highDefinition = a3;
    if (a3) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSAttributedString tvh_highDefinitionAttributedStringWithTextStyle:]( &OBJC_CLASS___NSAttributedString,  "tvh_highDefinitionAttributedStringWithTextStyle:",  UIFontTextStyleCaption1));
    }
    else {
      uint64_t v5 = 0LL;
    }
    id v6 = (id)v5;
    -[UILabel setAttributedText:](self->_highDefinitionLabel, "setAttributedText:", v5);
    -[UILabel setHidden:](self->_highDefinitionLabel, "setHidden:", !v3);
    -[TVHProductMetadataView setNeedsLayout](self, "setNeedsLayout");
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView durationLabel](self, "durationLabel", a3.width, a3.height));
  double v5 = 0.0;
  if (([v4 isHidden] & 1) == 0)
  {
    objc_msgSend(v4, "sizeThatFits:", 1.79769313e308, 36.0);
    double v5 = v6 + 22.0;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView genreTitleLabel](self, "genreTitleLabel"));
  if (([v7 isHidden] & 1) == 0)
  {
    objc_msgSend(v7, "sizeThatFits:", 1.79769313e308, 36.0);
    double v5 = v5 + v8 + 22.0;
  }

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView releaseYearLabel](self, "releaseYearLabel"));
  if (([v9 isHidden] & 1) == 0)
  {
    objc_msgSend(v9, "sizeThatFits:", 1.79769313e308, 36.0);
    double v5 = v5 + v10 + 22.0;
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView contentRatingView](self, "contentRatingView"));
  if (([v11 isHidden] & 1) == 0)
  {
    objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, 36.0);
    double v5 = v5 + v12 + 22.0;
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView highDefinitionLabel](self, "highDefinitionLabel"));
  if (([v13 isHidden] & 1) == 0)
  {
    objc_msgSend(v13, "sizeThatFits:", 1.79769313e308, 36.0);
    double v5 = v5 + v14;
  }

  double v15 = 36.0;
  double v16 = v5;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)layoutSubviews
{
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___TVHProductMetadataView;
  -[TVHProductMetadataView layoutSubviews](&v66, "layoutSubviews");
  -[TVHProductMetadataView bounds](self, "bounds");
  double v4 = v3;
  double v6 = v5;
  id v7 = -[TVHProductMetadataView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  double v8 = floor((v6 + -30.0) * 0.5);
  double v9 = 0.0;
  if (v7) {
    double v10 = v4;
  }
  else {
    double v10 = 0.0;
  }
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView durationLabel](self, "durationLabel"));
  if (([v11 isHidden] & 1) == 0)
  {
    objc_msgSend(v11, "sizeThatFits:", 1.79769313e308, v6);
    double v13 = fmin(v12, 150.0);
    if (v13 >= v4) {
      double v14 = v4;
    }
    else {
      double v14 = v13;
    }
    if (v7) {
      double v9 = v4 - v14;
    }
    objc_msgSend(v11, "setFrame:", v9, v8, v14, 30.0);
    double v15 = 30.0;
    double v16 = v9;
    double v17 = v8;
    double v18 = v14;
    if (v7)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v16);
      double v20 = -22.0;
    }

    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v16);
      double v20 = 22.0;
    }

    double v10 = MinX + v20;
    v67.size.height = 30.0;
    v67.origin.x = v9;
    v67.origin.y = v8;
    v67.size.width = v14;
    double v4 = v4 - (CGRectGetWidth(v67) + -22.0);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView genreTitleLabel](self, "genreTitleLabel"));
  if (([v21 isHidden] & 1) == 0)
  {
    objc_msgSend(v21, "sizeThatFits:", 1.79769313e308, v6);
    double v23 = fmin(v22, 250.0);
    if (v23 >= v4) {
      double v24 = v4;
    }
    else {
      double v24 = v23;
    }
    double v25 = 0.0;
    if (v7) {
      double v25 = v24;
    }
    double v26 = v10 - v25;
    objc_msgSend(v21, "setFrame:", v10 - v25, v8, v24, 30.0);
    double v27 = 30.0;
    double v28 = v26;
    double v29 = v8;
    double v30 = v24;
    if (v7)
    {
      double MaxX = CGRectGetMinX(*(CGRect *)&v28);
      double v32 = -22.0;
    }

    else
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v28);
      double v32 = 22.0;
    }

    double v10 = MaxX + v32;
    v68.size.height = 30.0;
    v68.origin.x = v26;
    v68.origin.y = v8;
    v68.size.width = v24;
    double v4 = v4 - (CGRectGetWidth(v68) + -22.0);
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView releaseYearLabel](self, "releaseYearLabel"));
  if (([v33 isHidden] & 1) == 0)
  {
    objc_msgSend(v33, "sizeThatFits:", 1.79769313e308, v6);
    double v35 = fmin(v34, 100.0);
    if (v35 >= v4) {
      double v36 = v4;
    }
    else {
      double v36 = v35;
    }
    double v37 = 0.0;
    if (v7) {
      double v37 = v36;
    }
    double v38 = v10 - v37;
    objc_msgSend(v33, "setFrame:", v10 - v37, v8, v36, 30.0);
    double v39 = 30.0;
    double v40 = v38;
    double v41 = v8;
    double v42 = v36;
    if (v7)
    {
      double v43 = CGRectGetMinX(*(CGRect *)&v40);
      double v44 = -22.0;
    }

    else
    {
      double v43 = CGRectGetMaxX(*(CGRect *)&v40);
      double v44 = 22.0;
    }

    double v10 = v43 + v44;
    v69.size.height = 30.0;
    v69.origin.x = v38;
    v69.origin.y = v8;
    v69.size.width = v36;
    double v4 = v4 - (CGRectGetWidth(v69) + -22.0);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView contentRatingView](self, "contentRatingView"));
  if (([v45 isHidden] & 1) == 0)
  {
    objc_msgSend(v45, "sizeThatFits:", 1.79769313e308, v6);
    if (v47 >= v6) {
      double v48 = v6;
    }
    else {
      double v48 = v47;
    }
    if (v46 >= v4) {
      double v49 = v4;
    }
    else {
      double v49 = v46;
    }
    double v50 = floor((v6 - v48) * 0.5);
    double v51 = 0.0;
    if (v7) {
      double v51 = v49;
    }
    double v52 = v10 - v51;
    objc_msgSend(v45, "setFrame:", v10 - v51, v50, v49, v48);
    double v53 = v52;
    double v54 = v50;
    double v55 = v49;
    double v56 = v48;
    if (v7)
    {
      double v57 = CGRectGetMinX(*(CGRect *)&v53);
      double v58 = -22.0;
    }

    else
    {
      double v57 = CGRectGetMaxX(*(CGRect *)&v53);
      double v58 = 22.0;
    }

    double v10 = v57 + v58;
    v70.origin.x = v52;
    v70.origin.y = v50;
    v70.size.width = v49;
    v70.size.height = v48;
    double v4 = v4 - (CGRectGetWidth(v70) + -22.0);
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView highDefinitionLabel](self, "highDefinitionLabel"));
  if (([v59 isHidden] & 1) == 0)
  {
    objc_msgSend(v59, "sizeThatFits:", 1.79769313e308, v6);
    if (v61 >= v6) {
      double v62 = v6;
    }
    else {
      double v62 = v61;
    }
    if (v60 >= v4) {
      double v63 = v4;
    }
    else {
      double v63 = v60;
    }
    double v64 = floor((v6 - v62) * 0.5);
    double v65 = 0.0;
    if (v7) {
      double v65 = v63;
    }
    objc_msgSend(v59, "setFrame:", v10 - v65, v64);
  }
}

- (void)_updateContentRatingView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHProductMetadataView contentRatingView](self, "contentRatingView"));
  objc_msgSend(v3, "setHidden:", objc_msgSend(v3, "hasDisplayableContentRating") ^ 1);
  -[TVHProductMetadataView setNeedsLayout](self, "setNeedsLayout");
}

- (id)_label
{
  v2 = objc_alloc_init(&OBJC_CLASS___UILabel);
  -[UILabel setLineBreakMode:](v2, "setLineBreakMode:", 4LL);
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[UIFont preferredFontForTextStyle:]( &OBJC_CLASS___UIFont,  "preferredFontForTextStyle:",  UIFontTextStyleCaption1));
  -[UILabel setFont:](v2, "setFont:", v3);

  -[UILabel setNumberOfLines:](v2, "setNumberOfLines:", 1LL);
  -[UILabel setTextAlignment:](v2, "setTextAlignment:", 4LL);
  return v2;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (NSNumber)releaseYear
{
  return self->_releaseYear;
}

- (BOOL)isHighDefinition
{
  return self->_highDefinition;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (UILabel)genreTitleLabel
{
  return self->_genreTitleLabel;
}

- (UILabel)releaseYearLabel
{
  return self->_releaseYearLabel;
}

- (TVHContentRatingView)contentRatingView
{
  return self->_contentRatingView;
}

- (UILabel)highDefinitionLabel
{
  return self->_highDefinitionLabel;
}

- (void).cxx_destruct
{
}

@end