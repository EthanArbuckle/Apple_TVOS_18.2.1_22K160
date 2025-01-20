@interface TVHEpisodeListViewCell
+ (double)_playedStateImageViewWidth;
+ (id)_nowPlayingBarsViewTintColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
+ (id)_playedStateImageConfiguration;
+ (id)_subtitleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
+ (id)_titleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
- (BOOL)hasExplicitLyrics;
- (BOOL)isVideoItem;
- (NSDate)releaseDate;
- (NSNumber)durationInSeconds;
- (NSString)title;
- (TVHEpisodeListViewCell)initWithFrame:(CGRect)a3;
- (TVHNowPlayingBarsView)nowPlayingBarsView;
- (UIImageView)playedStateImageView;
- (UIImageView)videoImageView;
- (UILabel)delimiterLabel;
- (UILabel)durationLabel;
- (UILabel)releaseDateLabel;
- (UILabel)titleLabel;
- (double)_contentViewHeight;
- (id)_contentView;
- (unint64_t)nowPlayingBarsState;
- (unint64_t)playedState;
- (void)_layoutSecondRowLabel:(id)a3 withXPos:(double)a4 yPos:(double)a5 height:(double)a6 width:(double)a7 isRTL:(BOOL)a8 contentViewWidth:(double)a9;
- (void)_updateColors;
- (void)_updateNowPlayingBars:(unint64_t)a3;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDurationInSeconds:(id)a3;
- (void)setHasExplicitLyrics:(BOOL)a3;
- (void)setIsVideoItem:(BOOL)a3;
- (void)setNowPlayingBarsState:(unint64_t)a3;
- (void)setNowPlayingBarsView:(id)a3;
- (void)setPlayedState:(unint64_t)a3;
- (void)setReleaseDate:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitle:(id)a3 hasExplicitLyrics:(BOOL)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation TVHEpisodeListViewCell

- (TVHEpisodeListViewCell)initWithFrame:(CGRect)a3
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___TVHEpisodeListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v30,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell _contentView](v3, "_contentView"));
    v6 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    playedStateImageView = v4->_playedStateImageView;
    v4->_playedStateImageView = v6;

    v8 = v4->_playedStateImageView;
    id v9 = [(id)objc_opt_class(v4) _playedStateImageConfiguration];
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[UIImageView setPreferredSymbolConfiguration:](v8, "setPreferredSymbolConfiguration:", v10);

    [v5 addSubview:v4->_playedStateImageView];
    v11 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v11;

    v13 = v4->_titleLabel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 11LL));
    -[UILabel setFont:](v13, "setFont:", v14);

    [v5 addSubview:v4->_titleLabel];
    v15 = objc_alloc_init(&OBJC_CLASS___UIImageView);
    videoImageView = v4->_videoImageView;
    v4->_videoImageView = v15;

    -[UIImageView setHidden:](v4->_videoImageView, "setHidden:", 1LL);
    [v5 addSubview:v4->_videoImageView];
    v17 = objc_alloc_init(&OBJC_CLASS___UILabel);
    releaseDateLabel = v4->_releaseDateLabel;
    v4->_releaseDateLabel = v17;

    v19 = v4->_releaseDateLabel;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 16LL));
    -[UILabel setFont:](v19, "setFont:", v20);

    -[UILabel setHidden:](v4->_releaseDateLabel, "setHidden:", 1LL);
    [v5 addSubview:v4->_releaseDateLabel];
    v21 = objc_alloc_init(&OBJC_CLASS___UILabel);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = v21;

    v23 = v4->_durationLabel;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 16LL));
    -[UILabel setFont:](v23, "setFont:", v24);

    -[UILabel setHidden:](v4->_durationLabel, "setHidden:", 1LL);
    [v5 addSubview:v4->_durationLabel];
    v25 = objc_alloc_init(&OBJC_CLASS___UILabel);
    delimiterLabel = v4->_delimiterLabel;
    v4->_delimiterLabel = v25;

    v27 = v4->_delimiterLabel;
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 16LL));
    -[UILabel setFont:](v27, "setFont:", v28);

    -[UILabel setText:](v4->_delimiterLabel, "setText:", @"•");
    -[UILabel setHidden:](v4->_delimiterLabel, "setHidden:", 1LL);
    [v5 addSubview:v4->_delimiterLabel];
  }

  return v4;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  -[TVHEpisodeListViewCell setTitle:hasExplicitLyrics:]( self,  "setTitle:hasExplicitLyrics:",  v4,  -[TVHEpisodeListViewCell hasExplicitLyrics](self, "hasExplicitLyrics"));
}

- (void)setHasExplicitLyrics:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell title](self, "title"));
  -[TVHEpisodeListViewCell setTitle:hasExplicitLyrics:](self, "setTitle:hasExplicitLyrics:", v5, v3);
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "tvh_setText:isExplicit:", self->_title, self->_hasExplicitLyrics);
  }
}

- (void)setIsVideoItem:(BOOL)a3
{
  if (self->_isVideoItem != a3)
  {
    self->_isVideoItem = a3;
    BOOL v4 = !a3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell videoImageView](self, "videoImageView"));
    [v5 setHidden:v4];

    -[TVHEpisodeListViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setPlayedState:(unint64_t)a3
{
  if (self->_playedState != a3)
  {
    self->_playedState = a3;
    if (a3)
    {
      if (a3 != 1)
      {
        id v7 = 0LL;
        goto LABEL_8;
      }

      BOOL v4 = @"circle";
    }

    else
    {
      BOOL v4 = @"circle.fill";
    }

    id v7 = (id)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](&OBJC_CLASS___UIImage, "systemImageNamed:", v4));
LABEL_8:
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell playedStateImageView](self, "playedStateImageView"));
    [v5 setImage:v7];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](&OBJC_CLASS___UIColor, "systemBlueColor"));
    [v5 setTintColor:v6];

    -[TVHEpisodeListViewCell setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setReleaseDate:(id)a3
{
  id v9 = a3;
  if ((-[NSDate isEqual:](self->_releaseDate, "isEqual:") & 1) == 0)
  {
    BOOL v4 = (NSDate *)[v9 copy];
    releaseDate = self->_releaseDate;
    self->_releaseDate = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell releaseDateLabel](self, "releaseDateLabel"));
    BOOL v7 = self->_releaseDate == 0LL;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tvh_abbreviatedFriendlyDisplayString"));
    [v6 setHidden:v7];
    [v6 setText:v8];
    -[TVHEpisodeListViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setDurationInSeconds:(id)a3
{
  id v9 = a3;
  if ((-[NSNumber isEqual:](self->_durationInSeconds, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_durationInSeconds, a3);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell durationLabel](self, "durationLabel"));
    id v6 = v9;
    if (v9)
    {
      uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSString tvh_durationStringForSeconds:](&OBJC_CLASS___NSString, "tvh_durationStringForSeconds:", v9));
      id v6 = v9;
      v8 = (void *)v7;
    }

    else
    {
      v8 = 0LL;
    }

    [v5 setHidden:v6 == 0];
    [v5 setText:v8];
    -[TVHEpisodeListViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setNowPlayingBarsState:(unint64_t)a3
{
  if (self->_nowPlayingBarsState != a3)
  {
    self->_nowPlayingBarsState = a3;
    -[TVHEpisodeListViewCell _updateNowPlayingBars:](self, "_updateNowPlayingBars:");
  }

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHEpisodeListViewCell;
  -[TVHEpisodeListViewCell didMoveToSuperview](&v3, "didMoveToSuperview");
  -[TVHEpisodeListViewCell _updateColors](self, "_updateColors");
}

- (void)layoutSubviews
{
  v81.receiver = self;
  v81.super_class = (Class)&OBJC_CLASS___TVHEpisodeListViewCell;
  -[TVHListViewCell layoutSubviews](&v81, "layoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell _contentView](self, "_contentView"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  id v8 = -[TVHEpisodeListViewCell effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell playedStateImageView](self, "playedStateImageView"));
  double width = CGSizeZero.width;
  double height = CGSizeZero.height;
  [v9 sizeThatFits:CGSizeZero.width];
  double v12 = v11;
  [(id)objc_opt_class(self) _playedStateImageViewWidth];
  double v14 = v13;
  double v15 = v5 - v13 + -10.0;
  if (v8) {
    double v16 = v15;
  }
  else {
    double v16 = 10.0;
  }
  sub_10002EE50((v7 - v12) * 0.5);
  double v18 = v17;
  objc_msgSend(v9, "setFrame:", v16, v17, v14, v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  if (v19)
  {
    [v9 setHidden:1];
    UIRectCenteredIntegralRect([v19 frame]);
    objc_msgSend(v19, "setFrame:");
  }

  else
  {
    [v9 setHidden:0];
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell titleLabel](self, "titleLabel"));
  double v21 = v16;
  double v22 = v18;
  double v23 = v14;
  double v24 = v12;
  if (v8)
  {
    double v25 = CGRectGetMinX(*(CGRect *)&v21) + -20.0;
    double v26 = 20.0;
  }

  else
  {
    double v26 = CGRectGetMaxX(*(CGRect *)&v21) + 20.0;
    double v25 = v5 - v26;
  }

  double v27 = v25 + -20.0;
  objc_msgSend(v20, "setFrame:", v26, 0.0, v25 + -20.0, 45.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell videoImageView](self, "videoImageView"));
  double v74 = v27;
  if (([v28 isHidden] & 1) == 0)
  {
    [v28 frame];
    double v30 = v29 + 20.0;
    v82.origin.CGFloat y = 0.0;
    v82.origin.double x = v26;
    v82.size.double width = v27;
    v82.size.double height = 45.0;
    double MaxX = CGRectGetMaxX(v82);
    id v32 = objc_msgSend(v20, "sizeThatFits:", CGSizeZero.width, height);
    double v34 = v26 + v33;
    if (v34 >= MaxX) {
      double v35 = MaxX;
    }
    else {
      double v35 = v34;
    }
    if (v30 + v35 > MaxX)
    {
      double v27 = MaxX - v30 - v26;
      id v32 = objc_msgSend(v20, "setFrame:", v26, 0.0, v27, 45.0);
    }

    UIRectCenteredYInRect(v32);
    objc_msgSend(v28, "setFrame:");
    double width = CGSizeZero.width;
  }

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell releaseDateLabel](self, "releaseDateLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell durationLabel](self, "durationLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell delimiterLabel](self, "delimiterLabel"));
  else {
    uint64_t v39 = (uint64_t)[v37 isHidden];
  }
  [v38 setHidden:v39];
  if (![v36 isHidden] || (objc_msgSend(v37, "isHidden") & 1) == 0)
  {
    v83.size.double height = 45.0;
    v83.origin.CGFloat y = 0.0;
    CGFloat v78 = v26;
    v83.origin.double x = v26;
    v83.size.double width = v27;
    double MaxY = CGRectGetMaxY(v83);
    double v41 = 0.0;
    sub_10002EE50(0.0);
    double v43 = v42;
    unsigned __int8 v44 = [v37 isHidden];
    double v45 = 0.0;
    if ((v44 & 1) == 0) {
      objc_msgSend(v37, "sizeThatFits:", width, height);
    }
    double v76 = v45;
    CGFloat v77 = v27;
    if ((objc_msgSend(v38, "isHidden", 0x4046800000000000) & 1) == 0)
    {
      objc_msgSend(v38, "sizeThatFits:", width, height);
      double v41 = v46;
    }

    double v75 = v41;
    double v79 = MaxY + v43;
    double x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    double v50 = CGRectZero.size.width;
    CGFloat v49 = CGRectZero.size.height;
    double v51 = CGRectZero.origin.x;
    CGFloat v52 = y;
    double v73 = v50;
    double v53 = v49;
    if (([v36 isHidden] & 1) == 0)
    {
      unsigned int v54 = [v37 isHidden];
      double v55 = v76 + v75 + 5.0 + 5.0;
      if (v54) {
        double v55 = 0.0;
      }
      double v56 = v74 - v55;
      objc_msgSend(v36, "sizeThatFits:", width, height);
      if (v57 >= v56) {
        double v50 = v56;
      }
      else {
        double v50 = v57;
      }
      if (v8)
      {
        v84.origin.CGFloat y = 0.0;
        v84.size.double width = v77;
        v84.origin.double x = v78;
        double v53 = rect;
        v84.size.double height = rect;
        double v51 = CGRectGetMaxX(v84) - v50;
      }

      else
      {
        double v51 = v78;
        double v53 = rect;
      }

      CGFloat v52 = v79;
      objc_msgSend(v36, "setFrame:", v51, v79, v50, v53);
    }

    if (([v38 isHidden] & 1) == 0)
    {
      double v58 = v51;
      CGFloat v59 = v52;
      double v60 = v50;
      double v61 = v53;
      if (v8)
      {
        double v62 = v75;
        double x = CGRectGetMinX(*(CGRect *)&v58) + -5.0 - v75;
      }

      else
      {
        double x = CGRectGetMaxX(*(CGRect *)&v58) + 5.0;
        double v62 = v75;
      }

      CGFloat v49 = 45.0;
      CGFloat y = v79;
      objc_msgSend(v38, "setFrame:", x, v79, v62, 45.0);
      double v73 = v62;
    }

    double v63 = v78;
    if (([v37 isHidden] & 1) == 0)
    {
      if ([v38 isHidden])
      {
        double v64 = v76;
        if (!v8)
        {
LABEL_49:
          objc_msgSend(v37, "setFrame:", v63, v79, v64, 45.0);
          goto LABEL_50;
        }

        v85.origin.CGFloat y = 0.0;
        v85.origin.double x = v78;
        v85.size.double width = v77;
        v85.size.double height = rect;
        double v65 = CGRectGetMaxX(v85);
      }

      else
      {
        double v64 = v76;
        double v66 = x;
        CGFloat v67 = y;
        if (!v8)
        {
          double v70 = v73;
          CGFloat v71 = v49;
          double v63 = CGRectGetMaxX(*(CGRect *)&v66) + 5.0;
          goto LABEL_49;
        }

        double v68 = v73;
        CGFloat v69 = v49;
        double v65 = CGRectGetMinX(*(CGRect *)&v66) + -5.0;
      }

      double v63 = v65 - v64;
      goto LABEL_49;
    }
  }

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHEpisodeListViewCell;
  -[TVHListViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHEpisodeListViewCell setNowPlayingBarsState:](self, "setNowPlayingBarsState:", 0LL);
  -[TVHEpisodeListViewCell setPlayedState:](self, "setPlayedState:", 2LL);
  -[TVHEpisodeListViewCell setTitle:hasExplicitLyrics:](self, "setTitle:hasExplicitLyrics:", 0LL, 0LL);
  -[TVHEpisodeListViewCell setIsVideoItem:](self, "setIsVideoItem:", 0LL);
  -[TVHEpisodeListViewCell setDurationInSeconds:](self, "setDurationInSeconds:", 0LL);
  -[TVHEpisodeListViewCell setReleaseDate:](self, "setReleaseDate:", 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVHEpisodeListViewCell;
  id v6 = a4;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v9,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000655E8;
  v8[3] = &unk_1000FCEA8;
  v8[4] = self;
  [v6 addCoordinatedAnimations:v8 completion:0];

  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "tvh_updateMarqueeWithFocus:", -[TVHEpisodeListViewCell isFocused](self, "isFocused"));
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TVHEpisodeListViewCell;
  id v4 = a3;
  -[TVHEpisodeListViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell traitCollection](self, "traitCollection", v8.receiver, v8.super_class));
  id v6 = [v5 userInterfaceStyle];

  id v7 = [v4 userInterfaceStyle];
  if (v6 != v7) {
    -[TVHEpisodeListViewCell _updateColors](self, "_updateColors");
  }
}

- (void)_updateColors
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  id v5 = -[TVHEpisodeListViewCell isFocused](self, "isFocused");
  id v6 = [(id)objc_opt_class(self) _titleLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  id v16 = (id)objc_claimAutoreleasedReturnValue(v6);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell titleLabel](self, "titleLabel"));
  [v7 setTextColor:v16];

  id v8 = [(id)objc_opt_class(self) _subtitleLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell releaseDateLabel](self, "releaseDateLabel"));
  [v10 setTextColor:v9];

  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell delimiterLabel](self, "delimiterLabel"));
  [v11 setTextColor:v9];

  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell durationLabel](self, "durationLabel"));
  [v12 setTextColor:v9];

  id v13 = [(id)objc_opt_class(self) _nowPlayingBarsViewTintColorWithUserInterfaceStyle:v4 andFocus:v5];
  double v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  double v15 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  [v15 setTintColor:v14];
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

+ (id)_subtitleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4
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

+ (id)_playedStateImageConfiguration
{
  return +[UIImageSymbolConfiguration configurationWithTextStyle:]( &OBJC_CLASS___UIImageSymbolConfiguration,  "configurationWithTextStyle:",  UIFontTextStyleSubtitle3);
}

+ (double)_playedStateImageViewWidth
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10006594C;
  block[3] = &unk_1000FD0E8;
  block[4] = a1;
  if (qword_1001573B0 != -1) {
    dispatch_once(&qword_1001573B0, block);
  }
  return *(double *)&qword_1001573A8;
}

- (void)_layoutSecondRowLabel:(id)a3 withXPos:(double)a4 yPos:(double)a5 height:(double)a6 width:(double)a7 isRTL:(BOOL)a8 contentViewWidth:(double)a9
{
  BOOL v10 = a8;
  id v16 = a3;
  if (v10)
  {
    v17.origin.double x = a4;
    v17.origin.CGFloat y = a5;
    v17.size.double width = a7;
    v17.size.double height = a6;
    double v15 = a9 - CGRectGetWidth(v17);
    v18.origin.double x = a4;
    v18.origin.CGFloat y = a5;
    v18.size.double width = a7;
    v18.size.double height = a6;
    a4 = v15 - CGRectGetMinX(v18);
  }

  objc_msgSend(v16, "setFrame:", a4, a5, a7, a6);
}

- (double)_contentViewHeight
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell _contentView](self, "_contentView"));
  [v2 bounds];
  double v4 = v3;

  return v4;
}

- (void)_updateNowPlayingBars:(unint64_t)a3
{
  id v5 = (TVHNowPlayingBarsView *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  if (!a3)
  {
    objc_super v9 = v5;
    -[TVHNowPlayingBarsView removeFromSuperview](v5, "removeFromSuperview");
    -[TVHEpisodeListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", 0LL);
LABEL_6:
    -[TVHEpisodeListViewCell _updateColors](self, "_updateColors");
    -[TVHEpisodeListViewCell setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }

  if (!v5)
  {
    double v6 = sub_100065D94();
    objc_super v9 = -[TVHNowPlayingBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHNowPlayingBarsView),  "initWithFrame:",  0.0,  0.0,  v6,  v7);
    -[TVHEpisodeListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", v9);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHEpisodeListViewCell _contentView](self, "_contentView"));
    [v8 addSubview:v9];

    -[TVHNowPlayingBarsView setState:](v9, "setState:", a3);
    goto LABEL_6;
  }

  objc_super v9 = v5;
  -[TVHNowPlayingBarsView setState:](v5, "setState:", a3);
LABEL_7:
}

- (id)_contentView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  double v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentView]);

  return v3;
}

- (unint64_t)nowPlayingBarsState
{
  return self->_nowPlayingBarsState;
}

- (unint64_t)playedState
{
  return self->_playedState;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)hasExplicitLyrics
{
  return self->_hasExplicitLyrics;
}

- (BOOL)isVideoItem
{
  return self->_isVideoItem;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSNumber)durationInSeconds
{
  return self->_durationInSeconds;
}

- (UIImageView)playedStateImageView
{
  return self->_playedStateImageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UIImageView)videoImageView
{
  return self->_videoImageView;
}

- (UILabel)releaseDateLabel
{
  return self->_releaseDateLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
}

- (UILabel)delimiterLabel
{
  return self->_delimiterLabel;
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