@interface TVHMusicAlbumItemListViewCell
+ (id)_nowPlayingBarsViewTintColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
+ (id)_titleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
+ (id)_trackNumberLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
- (BOOL)_shouldShowPlayIconImageView;
- (BOOL)_shouldShowTrackNumberLabel;
- (BOOL)_showingPlayIconImageView;
- (BOOL)hasExplicitLyrics;
- (CGRect)_trackNumberLabelFrame;
- (NSNumber)durationInSeconds;
- (NSNumber)trackNumber;
- (NSString)title;
- (TVHMusicAlbumItemListViewCell)initWithFrame:(CGRect)a3;
- (TVHNowPlayingBarsView)nowPlayingBarsView;
- (UIImageView)playIconImageView;
- (UILabel)durationLabel;
- (UILabel)titleLabel;
- (UILabel)trackNumberLabel;
- (double)_trackNumberLabelWidth;
- (id)_contentView;
- (unint64_t)nowPlayingBarsState;
- (void)_showPlayIconImageView:(BOOL)a3;
- (void)_showTrackNumberLabel:(BOOL)a3;
- (void)_updateColors;
- (void)_updateNowPlayingBars:(unint64_t)a3;
- (void)_updatePlayIconImageViewAndTrackNumberLabelState;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDurationInSeconds:(id)a3;
- (void)setHasExplicitLyrics:(BOOL)a3;
- (void)setNowPlayingBarsState:(unint64_t)a3;
- (void)setNowPlayingBarsView:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 hasExplicitLyrics:(BOOL)a4;
- (void)setTrackNumber:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVHMusicAlbumItemListViewCell

- (TVHMusicAlbumItemListViewCell)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumItemListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v25,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", @"play.fill"));
    v5 = -[UIImageView initWithImage:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithImage:", v4);
    playIconImageView = v3->_playIconImageView;
    v3->_playIconImageView = v5;

    v7 = v3->_playIconImageView;
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIImageSymbolConfiguration configurationWithTextStyle:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:",  UIFontTextStyleSubtitle3));
    -[UIImageView setPreferredSymbolConfiguration:](v7, "setPreferredSymbolConfiguration:", v8);

    v9 = v3->_playIconImageView;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    -[UIImageView setTintColor:](v9, "setTintColor:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell _contentView](v3, "_contentView"));
    v12 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v12;

    -[UILabel setLineBreakMode:](v3->_titleLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_titleLabel, "setTextAlignment:", 4LL);
    v14 = v3->_titleLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 11LL));
    -[UILabel setFont:](v14, "setFont:", v15);

    [v11 addSubview:v3->_titleLabel];
    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    trackNumberLabel = v3->_trackNumberLabel;
    v3->_trackNumberLabel = v16;

    -[UILabel setLineBreakMode:](v3->_trackNumberLabel, "setLineBreakMode:", 4LL);
    -[UILabel setTextAlignment:](v3->_trackNumberLabel, "setTextAlignment:", 1LL);
    v18 = v3->_trackNumberLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v18, "setFont:", v19);

    [v11 addSubview:v3->_trackNumberLabel];
    v20 = objc_alloc_init(&OBJC_CLASS___UILabel);
    durationLabel = v3->_durationLabel;
    v3->_durationLabel = v20;

    -[UILabel setLineBreakMode:](v3->_durationLabel, "setLineBreakMode:", 4LL);
    v22 = v3->_durationLabel;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 12LL));
    -[UILabel setFont:](v22, "setFont:", v23);

    [v11 addSubview:v3->_durationLabel];
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  -[TVHMusicAlbumItemListViewCell setTitle:hasExplicitLyrics:]( self,  "setTitle:hasExplicitLyrics:",  v4,  -[TVHMusicAlbumItemListViewCell hasExplicitLyrics](self, "hasExplicitLyrics"));
}

- (void)setHasExplicitLyrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell title](self, "title"));
  -[TVHMusicAlbumItemListViewCell setTitle:hasExplicitLyrics:](self, "setTitle:hasExplicitLyrics:", v5, v3);
}

- (void)setTitle:(id)a3 hasExplicitLyrics:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (!-[NSString isEqualToString:](self->_title, "isEqualToString:") || self->_hasExplicitLyrics != v4)
  {
    v6 = (NSString *)[v9 copy];
    title = self->_title;
    self->_title = v6;

    self->_hasExplicitLyrics = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "tvh_setText:isExplicit:", self->_title, self->_hasExplicitLyrics);
  }
}

- (void)setDurationInSeconds:(id)a3
{
  id v7 = a3;
  if ((-[NSNumber isEqual:](self->_durationInSeconds, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_durationInSeconds, a3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString tvh_positionalDurationStringForSeconds:]( &OBJC_CLASS___NSString,  "tvh_positionalDurationStringForSeconds:",  v7));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell durationLabel](self, "durationLabel"));
    [v6 setText:v5];
  }
}

- (void)setTrackNumber:(id)a3
{
  p_trackNumber = &self->_trackNumber;
  id v8 = a3;
  if ((-[NSNumber isEqual:](*p_trackNumber, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_trackNumber, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell trackNumberLabel](self, "trackNumberLabel"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSNumber stringValue](*p_trackNumber, "stringValue"));
    [v6 setText:v7];
  }
}

- (void)setNowPlayingBarsState:(unint64_t)a3
{
  if (self->_nowPlayingBarsState != a3)
  {
    self->_nowPlayingBarsState = a3;
    -[TVHMusicAlbumItemListViewCell _updateNowPlayingBars:](self, "_updateNowPlayingBars:");
  }

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumItemListViewCell;
  -[TVHMusicAlbumItemListViewCell didMoveToSuperview](&v3, "didMoveToSuperview");
  -[TVHMusicAlbumItemListViewCell _updateColors](self, "_updateColors");
}

- (void)layoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumItemListViewCell;
  -[TVHListViewCell layoutSubviews](&v29, "layoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell _contentView](self, "_contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  -[TVHMusicAlbumItemListViewCell _trackNumberLabelFrame](self, "_trackNumberLabelFrame");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell trackNumberLabel](self, "trackNumberLabel"));
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  v18 = v17;
  if (v17)
  {
    UIRectCenteredIntegralRect([v17 frame]);
    objc_msgSend(v18, "setFrame:");
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell durationLabel](self, "durationLabel"));
  objc_msgSend(v19, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  if (v20 >= 92.0) {
    double v21 = v20;
  }
  else {
    double v21 = 92.0;
  }
  double v22 = floor((v7 + -40.0) * 0.5);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell titleLabel](self, "titleLabel"));
  double v28 = v7;
  if (-[TVHMusicAlbumItemListViewCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection"))
  {
    v30.size.height = 40.0;
    double v24 = 20.0;
    v30.origin.x = 20.0;
    v30.origin.y = v22;
    v30.size.width = v21;
    double MaxX = CGRectGetMaxX(v30);
  }

  else
  {
    double v24 = v5 - v21 + -20.0;
    v31.origin.x = v9;
    v31.origin.y = v11;
    v31.size.width = v13;
    v31.size.height = v15;
    double MaxX = CGRectGetMaxX(v31);
    double v15 = 40.0;
    double v9 = v24;
    double v11 = v22;
    double v13 = v21;
  }

  double v26 = MaxX + 16.0;
  v32.origin.x = v9;
  v32.origin.y = v11;
  v32.size.width = v13;
  v32.size.height = v15;
  CGFloat v27 = CGRectGetMinX(v32) + -16.0 - v26;
  objc_msgSend(v19, "setFrame:", v24, v22, v21, 40.0);
  objc_msgSend(v23, "setFrame:", v26, 0.0, v27, v28);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumItemListViewCell;
  -[TVHListViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHMusicAlbumItemListViewCell setNowPlayingBarsState:](self, "setNowPlayingBarsState:", 0LL);
  -[TVHMusicAlbumItemListViewCell setTitle:hasExplicitLyrics:](self, "setTitle:hasExplicitLyrics:", 0LL, 0LL);
  -[TVHMusicAlbumItemListViewCell setDurationInSeconds:](self, "setDurationInSeconds:", 0LL);
  -[TVHMusicAlbumItemListViewCell setTrackNumber:](self, "setTrackNumber:", 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumItemListViewCell;
  id v6 = a4;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000462B4;
  v8[3] = &unk_1000FCEA8;
  v8[4] = self;
  [v6 addCoordinatedAnimations:v8 completion:0];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "tvh_updateMarqueeWithFocus:", -[TVHMusicAlbumItemListViewCell isFocused](self, "isFocused"));

  -[TVHMusicAlbumItemListViewCell _updatePlayIconImageViewAndTrackNumberLabelState]( self,  "_updatePlayIconImageViewAndTrackNumberLabelState");
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHMusicAlbumItemListViewCell;
  id v4 = a3;
  -[TVHMusicAlbumItemListViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 != v7) {
    -[TVHMusicAlbumItemListViewCell _updateColors](self, "_updateColors");
  }
}

- (void)_updateColors
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  id v5 = -[TVHMusicAlbumItemListViewCell isFocused](self, "isFocused");
  id v6 = [(id)objc_opt_class(self) _titleLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  id v17 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell titleLabel](self, "titleLabel"));
  [v7 setTextColor:v17];

  id v8 = [(id)objc_opt_class(self) _trackNumberLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell trackNumberLabel](self, "trackNumberLabel"));
  [v10 setTextColor:v9];

  id v11 = [(id)objc_opt_class(self) _durationLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  double v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  double v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell durationLabel](self, "durationLabel"));
  [v13 setTextColor:v12];

  id v14 = [(id)objc_opt_class(self) _nowPlayingBarsViewTintColorWithUserInterfaceStyle:v4 andFocus:v5];
  double v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  [v16 setTintColor:v15];
}

+ (id)_titleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4
{
  if (a4 || (unint64_t)a3 < 2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", a3));
  }

  else
  {
    if (a3 != 2) {
      return 0LL;
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_50PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_50PercentWhiteColor"));
  }

  return v4;
}

+ (id)_trackNumberLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4
{
  if (a4 || (unint64_t)a3 < 2)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", a3));
  }

  else
  {
    if (a3 != 2) {
      return 0LL;
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_30PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_30PercentWhiteColor"));
  }

  return v4;
}

+ (id)_nowPlayingBarsViewTintColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4
{
  if (a4)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor", a3));
  }

  else if ((unint64_t)a3 >= 2)
  {
    if (a3 != 2) {
      return 0LL;
    }
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_60PercentWhiteColor"));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
  }

  return v4;
}

- (CGRect)_trackNumberLabelFrame
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell _contentView](self, "_contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[TVHMusicAlbumItemListViewCell _trackNumberLabelWidth](self, "_trackNumberLabelWidth");
  double v9 = v8;
  double v10 = floor((v7 + -40.0) * 0.5);
  id v11 = -[TVHMusicAlbumItemListViewCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
  double v12 = v5 + -20.0 - v9;
  if (!v11) {
    double v12 = 20.0;
  }
  double v13 = 40.0;
  double v14 = v10;
  double v15 = v9;
  result.size.height = v13;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (double)_trackNumberLabelWidth
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell trackNumber](self, "trackNumber"));
  else {
    double v3 = 50.0;
  }

  return v3;
}

- (BOOL)_shouldShowTrackNumberLabel
{
  double v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  BOOL v3 = v4 == 0LL;

  return v3;
}

- (void)_showTrackNumberLabel:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell trackNumberLabel](self, "trackNumberLabel"));
  [v4 setHidden:!v3];
}

- (BOOL)_shouldShowPlayIconImageView
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  BOOL v4 = v3 == 0LL;

  return v4;
}

- (void)_showPlayIconImageView:(BOOL)a3
{
  if (-[TVHMusicAlbumItemListViewCell _showingPlayIconImageView](self, "_showingPlayIconImageView") != a3)
  {
    id v18 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell playIconImageView](self, "playIconImageView"));
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v18 superview]);

    if (v4)
    {
      [v18 removeFromSuperview];
    }

    else
    {
      double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell _contentView](self, "_contentView"));
      [v5 addSubview:v18];
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell _contentView](self, "_contentView"));
      [v6 bounds];
      double v8 = v7;
      double v10 = v9;

      objc_msgSend(v18, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
      double v12 = v11;
      double v14 = v13;
      double v15 = floor((v10 - v13) * 0.5);
      id v16 = -[TVHMusicAlbumItemListViewCell effectiveUserInterfaceLayoutDirection]( self,  "effectiveUserInterfaceLayoutDirection");
      double v17 = v8 - v12 + -34.0;
      if (!v16) {
        double v17 = 34.0;
      }
      objc_msgSend(v18, "setFrame:", v17, v15, v12, v14);
    }
  }

- (BOOL)_showingPlayIconImageView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell playIconImageView](self, "playIconImageView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 superview]);
  BOOL v4 = v3 != 0LL;

  return v4;
}

- (void)_updatePlayIconImageViewAndTrackNumberLabelState
{
}

- (void)_updateNowPlayingBars:(unint64_t)a3
{
  double v5 = (TVHNowPlayingBarsView *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  if (!a3)
  {
    double v9 = v5;
    -[TVHNowPlayingBarsView removeFromSuperview](v5, "removeFromSuperview");
    -[TVHMusicAlbumItemListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", 0LL);
LABEL_6:
    -[TVHMusicAlbumItemListViewCell _updatePlayIconImageViewAndTrackNumberLabelState]( self,  "_updatePlayIconImageViewAndTrackNumberLabelState");
    -[TVHMusicAlbumItemListViewCell _updateColors](self, "_updateColors");
    -[TVHMusicAlbumItemListViewCell setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }

  if (!v5)
  {
    double v6 = sub_100065D94();
    double v9 = -[TVHNowPlayingBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHNowPlayingBarsView),  "initWithFrame:",  0.0,  0.0,  v6,  v7);
    -[TVHMusicAlbumItemListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", v9);
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicAlbumItemListViewCell _contentView](self, "_contentView"));
    [v8 addSubview:v9];

    -[TVHNowPlayingBarsView setState:](v9, "setState:", a3);
    goto LABEL_6;
  }

  double v9 = v5;
  -[TVHNowPlayingBarsView setState:](v5, "setState:", a3);
LABEL_7:
}

- (id)_contentView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentView]);

  return v3;
}

- (unint64_t)nowPlayingBarsState
{
  return self->_nowPlayingBarsState;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasExplicitLyrics
{
  return self->_hasExplicitLyrics;
}

- (NSNumber)trackNumber
{
  return self->_trackNumber;
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (UILabel)trackNumberLabel
{
  return self->_trackNumberLabel;
}

- (UIImageView)playIconImageView
{
  return self->_playIconImageView;
}

- (TVHNowPlayingBarsView)nowPlayingBarsView
{
  return self->_nowPlayingBarsView;
}

- (void)setNowPlayingBarsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end