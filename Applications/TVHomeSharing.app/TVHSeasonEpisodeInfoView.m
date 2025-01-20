@interface TVHSeasonEpisodeInfoView
- (BOOL)isHighDefinition;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)episodeDescription;
- (NSDate)releaseDate;
- (NSNumber)duration;
- (NSNumber)episodeNumber;
- (NSString)contentRatingBadgeText;
- (NSString)genreTitle;
- (NSString)title;
- (TVFocusableTextView)episodeDescriptionTextView;
- (TVHContentRatingView)contentRatingView;
- (TVHSeasonEpisodeInfoView)initWithCoder:(id)a3;
- (TVHSeasonEpisodeInfoView)initWithFrame:(CGRect)a3;
- (TVHSeasonEpisodeInfoViewDelegate)delegate;
- (UIImage)contentRatingBadgeImage;
- (UILabel)durationLabel;
- (UILabel)episodeNumberLabel;
- (UILabel)highDefinitionLabel;
- (UILabel)secondaryContentLabel;
- (UILabel)titleLabel;
- (id)preferredFocusEnvironments;
- (void)_didSelectEpisodeDescriptionText;
- (void)_updateContentRatingView;
- (void)_updateSecondaryContentLabel;
- (void)layoutSubviews;
- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDuration:(id)a3;
- (void)setEpisodeDescription:(id)a3;
- (void)setEpisodeNumber:(id)a3;
- (void)setGenreTitle:(id)a3;
- (void)setHighDefinition:(BOOL)a3;
- (void)setReleaseDate:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVHSeasonEpisodeInfoView

- (TVHSeasonEpisodeInfoView)initWithCoder:(id)a3
{
  v4 = NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  +[NSException raise:format:]( &OBJC_CLASS___NSException,  "raise:format:",  NSInvalidArgumentException,  @"The %@ initializer is not available.",  v5);

  return 0LL;
}

- (TVHSeasonEpisodeInfoView)initWithFrame:(CGRect)a3
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___TVHSeasonEpisodeInfoView;
  v3 = -[TVHSeasonEpisodeInfoView initWithFrame:]( &v37,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v4,  v5));

    v7 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v7;

    v9 = v3->_titleLabel;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v9, "setFont:", v10);

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4LL);
    -[UILabel setNumberOfLines:](v3->_titleLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextColor:](v3->_titleLabel, "setTextColor:", v6);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_titleLabel, "tvh_setDebugLayoutColorType:", 8LL);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_titleLabel);
    v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
    episodeNumberLabel = v3->_episodeNumberLabel;
    v3->_episodeNumberLabel = v11;

    v13 = v3->_episodeNumberLabel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    -[UILabel setFont:](v13, "setFont:", v14);

    -[UILabel setLineBreakMode:](v3->_episodeNumberLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_episodeNumberLabel, "setTextAlignment:", 4LL);
    -[UILabel setNumberOfLines:](v3->_episodeNumberLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextColor:](v3->_episodeNumberLabel, "setTextColor:", v6);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_episodeNumberLabel, "tvh_setDebugLayoutColorType:", 6LL);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_episodeNumberLabel);
    v15 = objc_alloc_init(&OBJC_CLASS___UILabel);
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = v15;

    v17 = v3->_durationLabel;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    -[UILabel setFont:](v17, "setFont:", v18);

    -[UILabel setLineBreakMode:](v3->_durationLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_durationLabel, "setTextAlignment:", 4LL);
    -[UILabel setNumberOfLines:](v3->_durationLabel, "setNumberOfLines:", 1LL);
    -[UILabel setTextColor:](v3->_durationLabel, "setTextColor:", v6);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_durationLabel, "tvh_setDebugLayoutColorType:", 7LL);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_durationLabel);
    v19 = objc_alloc_init(&OBJC_CLASS___UILabel);
    highDefinitionLabel = v3->_highDefinitionLabel;
    v3->_highDefinitionLabel = v19;

    -[UILabel tvh_setDebugLayoutColorType:](v3->_highDefinitionLabel, "tvh_setDebugLayoutColorType:", 12LL);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_highDefinitionLabel);
    v21 = objc_alloc_init(&OBJC_CLASS___TVHContentRatingView);
    contentRatingView = v3->_contentRatingView;
    v3->_contentRatingView = v21;

    -[TVHContentRatingView setTintColor:](v3->_contentRatingView, "setTintColor:", v6);
    -[TVHContentRatingView tvh_setDebugLayoutColorType:](v3->_contentRatingView, "tvh_setDebugLayoutColorType:", 9LL);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_contentRatingView);
    v23 = objc_alloc_init(&OBJC_CLASS___TVFocusableTextView);
    episodeDescriptionTextView = v3->_episodeDescriptionTextView;
    v3->_episodeDescriptionTextView = v23;

    -[TVFocusableTextView setMaximumNumberOfLines:](v3->_episodeDescriptionTextView, "setMaximumNumberOfLines:", 4LL);
    -[TVFocusableTextView setDescriptionTextColor:](v3->_episodeDescriptionTextView, "setDescriptionTextColor:", v6);
    -[TVFocusableTextView tvh_setDebugLayoutColorType:]( v3->_episodeDescriptionTextView,  "tvh_setDebugLayoutColorType:",  13LL);
    objc_initWeak(&location, v3);
    v25 = v3->_episodeDescriptionTextView;
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472LL;
    v33 = sub_1000266DC;
    v34 = &unk_1000FD8E8;
    objc_copyWeak(&v35, &location);
    -[TVFocusableTextView setSelectionHandler:](v25, "setSelectionHandler:", &v31);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_episodeDescriptionTextView, v31, v32, v33, v34);
    v26 = objc_alloc_init(&OBJC_CLASS___UILabel);
    secondaryContentLabel = v3->_secondaryContentLabel;
    v3->_secondaryContentLabel = v26;

    v28 = v3->_secondaryContentLabel;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 13LL));
    -[UILabel setFont:](v28, "setFont:", v29);

    -[UILabel setLineBreakMode:](v3->_secondaryContentLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_secondaryContentLabel, "setTextAlignment:", 2LL);
    -[UILabel setNumberOfLines:](v3->_secondaryContentLabel, "setNumberOfLines:", 2LL);
    -[UILabel setTextColor:](v3->_secondaryContentLabel, "setTextColor:", v6);
    -[UILabel tvh_setDebugLayoutColorType:](v3->_secondaryContentLabel, "tvh_setDebugLayoutColorType:", 11LL);
    -[TVHSeasonEpisodeInfoView addSubview:](v3, "addSubview:", v3->_secondaryContentLabel);
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView title](self, "title"));
  unsigned __int8 v5 = [v4 isEqualToString:v7];

  if ((v5 & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView titleLabel](self, "titleLabel"));
    [v6 setText:v7];
  }
}

- (NSString)title
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView titleLabel](self, "titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setEpisodeNumber:(id)a3
{
  id v11 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_episodeNumber, "isEqualToNumber:"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeNumberLabel](self, "episodeNumberLabel"));
    unsigned __int8 v5 = (NSNumber *)[v11 copy];
    episodeNumber = self->_episodeNumber;
    self->_episodeNumber = v5;

    if (self->_episodeNumber)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"EPISODE_NUMBER_TITLE_FORMAT" value:0 table:0]);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber tvhk_localizedDisplayString](self->_episodeNumber, "tvhk_localizedDisplayString"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v9));

      [v4 setText:v10];
      [v4 setHidden:0];
    }

    else
    {
      [v4 setHidden:1];
    }

    -[TVHSeasonEpisodeInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDuration:(id)a3
{
  id v8 = a3;
  if ((-[NSNumber isEqual:](self->_duration, "isEqual:") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView durationLabel](self, "durationLabel"));
    unsigned __int8 v5 = (NSNumber *)[v8 copy];
    duration = self->_duration;
    self->_duration = v5;

    if (v8)
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString tvh_durationStringForSeconds:](&OBJC_CLASS___NSString, "tvh_durationStringForSeconds:"));
      [v4 setText:v7];
      [v4 setHidden:0];
    }

    else
    {
      [v4 setHidden:1];
    }

    -[TVHSeasonEpisodeInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHighDefinition:(BOOL)a3
{
  if (self->_highDefinition != a3)
  {
    BOOL v3 = a3;
    self->_highDefinition = a3;
    if (a3) {
      uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSAttributedString tvh_highDefinitionAttributedStringWithTextStyle:]( &OBJC_CLASS___NSAttributedString,  "tvh_highDefinitionAttributedStringWithTextStyle:",  UIFontTextStyleBody));
    }
    else {
      uint64_t v5 = 0LL;
    }
    id v6 = (id)v5;
    -[UILabel setAttributedText:](self->_highDefinitionLabel, "setAttributedText:", v5);
    -[UILabel setHidden:](self->_highDefinitionLabel, "setHidden:", !v3);
    -[TVHSeasonEpisodeInfoView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setReleaseDate:(id)a3
{
  id v6 = a3;
  if ((-[NSDate isEqual:](self->_releaseDate, "isEqual:") & 1) == 0)
  {
    v4 = (NSDate *)[v6 copy];
    releaseDate = self->_releaseDate;
    self->_releaseDate = v4;

    -[TVHSeasonEpisodeInfoView _updateSecondaryContentLabel](self, "_updateSecondaryContentLabel");
  }
}

- (void)setGenreTitle:(id)a3
{
  id v6 = a3;
  if ((-[NSString isEqual:](self->_genreTitle, "isEqual:") & 1) == 0)
  {
    v4 = (NSString *)[v6 copy];
    genreTitle = self->_genreTitle;
    self->_genreTitle = v4;

    -[TVHSeasonEpisodeInfoView _updateSecondaryContentLabel](self, "_updateSecondaryContentLabel");
  }
}

- (void)setEpisodeDescription:(id)a3
{
  id v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeDescription](self, "episodeDescription"));
  unsigned __int8 v5 = [v4 isEqual:v7];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeDescriptionTextView](self, "episodeDescriptionTextView"));
    [v6 setDescriptionText:v7];

    -[TVHSeasonEpisodeInfoView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (NSAttributedString)episodeDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeDescriptionTextView](self, "episodeDescriptionTextView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 descriptionText]);

  return (NSAttributedString *)v3;
}

- (UIImage)contentRatingBadgeImage
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView contentRatingView](self, "contentRatingView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingBadgeImage]);

  return (UIImage *)v3;
}

- (NSString)contentRatingBadgeText
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView contentRatingView](self, "contentRatingView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentRatingBadgeText]);

  return (NSString *)v3;
}

- (void)setContentRatingBadgeImage:(id)a3 badgeText:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView contentRatingView](self, "contentRatingView"));
  [v8 setContentRatingBadgeImage:v7 badgeText:v6];

  -[TVHSeasonEpisodeInfoView _updateContentRatingView](self, "_updateContentRatingView");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 1382.0;
  double v4 = 259.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v61.receiver = self;
  v61.super_class = (Class)&OBJC_CLASS___TVHSeasonEpisodeInfoView;
  -[TVHSeasonEpisodeInfoView layoutSubviews](&v61, "layoutSubviews");
  -[TVHSeasonEpisodeInfoView bounds](self, "bounds");
  double v4 = v3;
  id v5 = -[TVHSeasonEpisodeInfoView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  double v6 = fmax(fmin(v4 + -530.0, 852.0), 852.0);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFrame:", 530.0, 0.0, v6, 46.0);
  uint64_t v8 = 0LL;
  uint64_t v9 = 0x4080900000000000LL;
  double v10 = v6;
  uint64_t v11 = 0x4047000000000000LL;
  if (v5) {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v9);
  }
  else {
    double MaxX = CGRectGetMinX(*(CGRect *)&v9);
  }
  double v13 = MaxX;
  v62.origin.y = 0.0;
  v62.origin.x = 530.0;
  v62.size.width = v6;
  v62.size.height = 46.0;
  double MaxY = CGRectGetMaxY(v62);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeNumberLabel](self, "episodeNumberLabel"));
  if (([v15 isHidden] & 1) == 0)
  {
    objc_msgSend(v15, "sizeThatFits:", 1.79769313e308, 35.0);
    double v17 = v16;
    double v18 = 0.0;
    if (v5) {
      double v18 = v17;
    }
    double v19 = v13 - v18;
    objc_msgSend(v15, "setFrame:", v19, MaxY, v17, 35.0);
    double v20 = v19;
    double v21 = MaxY;
    double v22 = v17;
    uint64_t v23 = 0x4041800000000000LL;
    if (v5)
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v20);
      double v25 = -19.0;
    }

    else
    {
      double MinX = CGRectGetMaxX(*(CGRect *)&v20);
      double v25 = 19.0;
    }

    double v13 = MinX + v25;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView durationLabel](self, "durationLabel"));
  if (([v26 isHidden] & 1) == 0)
  {
    objc_msgSend(v26, "sizeThatFits:", 1.79769313e308, 35.0);
    double v28 = v27;
    double v29 = 0.0;
    if (v5) {
      double v29 = v28;
    }
    double v30 = v13 - v29;
    objc_msgSend(v26, "setFrame:", v30, MaxY, v28, 35.0);
    double v31 = v30;
    double v32 = MaxY;
    double v33 = v28;
    uint64_t v34 = 0x4041800000000000LL;
    if (v5)
    {
      double v35 = CGRectGetMinX(*(CGRect *)&v31);
      double v36 = -19.0;
    }

    else
    {
      double v35 = CGRectGetMaxX(*(CGRect *)&v31);
      double v36 = 19.0;
    }

    double v13 = v35 + v36;
  }

  objc_super v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView contentRatingView](self, "contentRatingView"));
  if (([v37 isHidden] & 1) == 0)
  {
    objc_msgSend(v37, "sizeThatFits:", 1.79769313e308, 35.0);
    double v39 = v38;
    double v41 = fmin(v40, 35.0);
    double v42 = MaxY + floor((35.0 - v41) * 0.5);
    double v43 = 0.0;
    if (v5) {
      double v43 = v39;
    }
    double v44 = v13 - v43;
    objc_msgSend(v37, "setFrame:", v44, v42, v39, v41);
    double v45 = v44;
    double v46 = v42;
    double v47 = v39;
    double v48 = v41;
    if (v5)
    {
      double v49 = CGRectGetMinX(*(CGRect *)&v45);
      double v50 = -19.0;
    }

    else
    {
      double v49 = CGRectGetMaxX(*(CGRect *)&v45);
      double v50 = 19.0;
    }

    double v13 = v49 + v50;
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView highDefinitionLabel](self, "highDefinitionLabel"));
  if (([v51 isHidden] & 1) == 0)
  {
    objc_msgSend(v51, "sizeThatFits:", 1.79769313e308, 35.0);
    double v53 = v52;
    double v55 = MaxY + floor((35.0 - fmin(v54, 35.0)) * 0.5);
    double v56 = 0.0;
    if (v5) {
      double v56 = v53;
    }
    objc_msgSend(v51, "setFrame:", v13 - v56, v55);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeDescriptionTextView](self, "episodeDescriptionTextView"));
  double v58 = MaxY + 35.0 + 17.0;
  objc_msgSend(v57, "sizeThatFits:", v6, 144.0);
  objc_msgSend(v57, "setFrame:", 530.0, v58, v6, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView secondaryContentLabel](self, "secondaryContentLabel"));
}

- (id)preferredFocusEnvironments
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView episodeDescriptionTextView](self, "episodeDescriptionTextView"));
  if ([v2 isHidden])
  {
    double v3 = &__NSArray0__struct;
  }

  else
  {
    id v5 = v2;
    double v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));
  }

  return v3;
}

- (void)_updateContentRatingView
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView contentRatingView](self, "contentRatingView"));
  objc_msgSend(v3, "setHidden:", objc_msgSend(v3, "hasDisplayableContentRating") ^ 1);
  -[TVHSeasonEpisodeInfoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateSecondaryContentLabel
{
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableString);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView releaseDate](self, "releaseDate"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tvh_friendlyDisplayString"));
  if ([v4 length]) {
    -[NSMutableString appendString:](v7, "appendString:", v4);
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView genreTitle](self, "genreTitle"));
  if ([v5 length])
  {
    if (-[NSMutableString length](v7, "length")) {
      -[NSMutableString appendString:](v7, "appendString:", @"\n");
    }
    -[NSMutableString appendString:](v7, "appendString:", v5);
  }

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView secondaryContentLabel](self, "secondaryContentLabel"));
  [v6 setText:v7];
  objc_msgSend(v6, "setHidden:", -[NSMutableString length](v7, "length") == 0);
  -[TVHSeasonEpisodeInfoView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_didSelectEpisodeDescriptionText
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[TVHSeasonEpisodeInfoView delegate](self, "delegate"));
  [v3 seasonEpisodeInfoViewDidSelectEpisodeDescription:self];
}

- (NSNumber)episodeNumber
{
  return self->_episodeNumber;
}

- (NSNumber)duration
{
  return self->_duration;
}

- (BOOL)isHighDefinition
{
  return self->_highDefinition;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSString)genreTitle
{
  return self->_genreTitle;
}

- (TVHSeasonEpisodeInfoViewDelegate)delegate
{
  return (TVHSeasonEpisodeInfoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)episodeNumberLabel
{
  return self->_episodeNumberLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (UILabel)highDefinitionLabel
{
  return self->_highDefinitionLabel;
}

- (TVHContentRatingView)contentRatingView
{
  return self->_contentRatingView;
}

- (UILabel)secondaryContentLabel
{
  return self->_secondaryContentLabel;
}

- (TVFocusableTextView)episodeDescriptionTextView
{
  return self->_episodeDescriptionTextView;
}

- (void).cxx_destruct
{
}

@end