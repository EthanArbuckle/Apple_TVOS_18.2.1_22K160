@interface TVHMusicSongListViewCell
+ (id)_durationLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
+ (id)_titleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4;
- (BOOL)hasExplicitLyrics;
- (NSNumber)duration;
- (NSString)albumTitle;
- (NSString)artistTitle;
- (NSString)title;
- (TVHMediaImageView)imageView;
- (TVHMusicSongListViewCell)initWithFrame:(CGRect)a3;
- (TVHNowPlayingBarsView)nowPlayingBarsView;
- (TVHPlaceholder)placeholder;
- (TVImageProxy)imageProxy;
- (UILabel)artistTitleLabel;
- (UILabel)durationLabel;
- (UILabel)titleLabel;
- (id)_floatingContentViewContentView;
- (unint64_t)nowPlayingBarsState;
- (void)_updateColors;
- (void)_updateNowPlayingBars:(unint64_t)a3;
- (void)didMoveToSuperview;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistTitle:(id)a3;
- (void)setDuration:(id)a3;
- (void)setImageProxy:(id)a3;
- (void)setNowPlayingBarsState:(unint64_t)a3;
- (void)setNowPlayingBarsView:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setTitle:(id)a3 hasExplicitLyrics:(BOOL)a4;
- (void)updateConstraints;
@end

@implementation TVHMusicSongListViewCell

- (TVHMusicSongListViewCell)initWithFrame:(CGRect)a3
{
  v66.receiver = self;
  v66.super_class = (Class)&OBJC_CLASS___TVHMusicSongListViewCell;
  v3 = -[TVHListViewCell initWithFrame:]( &v66,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell _floatingContentViewContentView](v3, "_floatingContentViewContentView"));
    v6 = objc_alloc_init(&OBJC_CLASS___TVHMediaImageView);
    imageView = v4->_imageView;
    v4->_imageView = v6;

    -[TVHMediaImageView setTranslatesAutoresizingMaskIntoConstraints:]( v4->_imageView,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[TVHMediaImageView setContentMode:](v4->_imageView, "setContentMode:", 2LL);
    -[TVHMediaImageView setCornerRadius:](v4->_imageView, "setCornerRadius:", 12.0);
    [v5 addSubview:v4->_imageView];
    v8 = objc_alloc_init(&OBJC_CLASS___UILabel);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v8;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_titleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setLineBreakMode:](v4->_titleLabel, "setLineBreakMode:", 4LL);
    v10 = v4->_titleLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 12LL));
    -[UILabel setFont:](v10, "setFont:", v11);

    [v5 addSubview:v4->_titleLabel];
    v12 = objc_alloc_init(&OBJC_CLASS___UILabel);
    artistTitleLabel = v4->_artistTitleLabel;
    v4->_artistTitleLabel = v12;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_artistTitleLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setLineBreakMode:](v4->_artistTitleLabel, "setLineBreakMode:", 4LL);
    v14 = v4->_artistTitleLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 6LL));
    -[UILabel setFont:](v14, "setFont:", v15);

    [v5 addSubview:v4->_artistTitleLabel];
    v16 = objc_alloc_init(&OBJC_CLASS___UILabel);
    durationLabel = v4->_durationLabel;
    v4->_durationLabel = v16;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:]( v4->_durationLabel,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
    -[UILabel setLineBreakMode:](v4->_durationLabel, "setLineBreakMode:", 4LL);
    v18 = v4->_durationLabel;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont tvh_fontFromTextStyle:](&OBJC_CLASS___UIFont, "tvh_fontFromTextStyle:", 16LL));
    -[UILabel setFont:](v18, "setFont:", v19);

    [v5 addSubview:v4->_durationLabel];
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView leadingAnchor](v4->_imageView, "leadingAnchor"));
    v64 = (void *)objc_claimAutoreleasedReturnValue([v5 leadingAnchor]);
    v63 = (void *)objc_claimAutoreleasedReturnValue([v65 constraintEqualToAnchor:v64]);
    v67[0] = v63;
    v62 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView widthAnchor](v4->_imageView, "widthAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue([v5 heightAnchor]);
    v60 = (void *)objc_claimAutoreleasedReturnValue([v62 constraintEqualToAnchor:v61]);
    v67[1] = v60;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView topAnchor](v4->_imageView, "topAnchor"));
    v58 = (void *)objc_claimAutoreleasedReturnValue([v5 topAnchor]);
    v57 = (void *)objc_claimAutoreleasedReturnValue([v59 constraintEqualToAnchor:v58]);
    v67[2] = v57;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView bottomAnchor](v4->_imageView, "bottomAnchor"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v5 bottomAnchor]);
    v54 = (void *)objc_claimAutoreleasedReturnValue([v56 constraintEqualToAnchor:v55]);
    v67[3] = v54;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_titleLabel, "leadingAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMediaImageView trailingAnchor](v4->_imageView, "trailingAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v53 constraintEqualToAnchor:v52 constant:24.0]);
    v67[4] = v51;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v4->_titleLabel, "widthAnchor"));
    v49 = (void *)objc_claimAutoreleasedReturnValue([v50 constraintEqualToConstant:577.0]);
    v67[5] = v49;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_titleLabel, "centerYAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue([v5 centerYAnchor]);
    v46 = (void *)objc_claimAutoreleasedReturnValue([v48 constraintEqualToAnchor:v47]);
    v67[6] = v46;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v4->_titleLabel, "heightAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue([v45 constraintEqualToConstant:37.0]);
    v67[7] = v44;
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v4->_artistTitleLabel, "leadingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_titleLabel, "trailingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue([v42 constraintEqualToAnchor:v41 constant:40.0]);
    v67[8] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v4->_artistTitleLabel, "widthAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue([v39 constraintEqualToConstant:360.0]);
    v67[9] = v38;
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_artistTitleLabel, "centerYAnchor"));
    v20 = v5;
    v43 = v5;
    v36 = (void *)objc_claimAutoreleasedReturnValue([v5 centerYAnchor]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v37 constraintEqualToAnchor:v36]);
    v67[10] = v35;
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v4->_artistTitleLabel, "heightAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue([v34 constraintEqualToConstant:37.0]);
    v67[11] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v4->_durationLabel, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 trailingAnchor]);
    v21 = (void *)objc_claimAutoreleasedReturnValue([v32 constraintEqualToAnchor:v31 constant:-24.0]);
    v67[12] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel widthAnchor](v4->_durationLabel, "widthAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToConstant:92.0]);
    v67[13] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v4->_durationLabel, "centerYAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue([v20 centerYAnchor]);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v24 constraintEqualToAnchor:v25]);
    v67[14] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel heightAnchor](v4->_durationLabel, "heightAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 constraintEqualToConstant:37.0]);
    v67[15] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 16LL));

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v29);
  }

  return v4;
}

- (void)setImageProxy:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell imageView](self, "imageView"));
  [v5 setImageProxy:v4];
}

- (TVImageProxy)imageProxy
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageProxy]);

  return (TVImageProxy *)v3;
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell imageView](self, "imageView"));
  [v5 setPlaceholder:v4];
}

- (TVHPlaceholder)placeholder
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 placeholder]);

  return (TVHPlaceholder *)v3;
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
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell titleLabel](self, "titleLabel"));
    objc_msgSend(v8, "tvh_setText:isExplicit:", self->_title, self->_hasExplicitLyrics);
  }
}

- (void)setArtistTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell artistTitleLabel](self, "artistTitleLabel"));
  [v5 setText:v4];
}

- (NSString)artistTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell artistTitleLabel](self, "artistTitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return (NSString *)v3;
}

- (void)setDuration:(id)a3
{
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell durationLabel](self, "durationLabel"));
  objc_msgSend(v6, "tvh_setDurationTextForSeconds:", v5);
}

- (void)setNowPlayingBarsState:(unint64_t)a3
{
  if (self->_nowPlayingBarsState != a3)
  {
    self->_nowPlayingBarsState = a3;
    -[TVHMusicSongListViewCell _updateNowPlayingBars:](self, "_updateNowPlayingBars:");
  }

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMusicSongListViewCell;
  -[TVHMusicSongListViewCell didMoveToSuperview](&v3, "didMoveToSuperview");
  -[TVHMusicSongListViewCell _updateColors](self, "_updateColors");
}

- (void)updateConstraints
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVHMusicSongListViewCell;
  -[TVHMusicSongListViewCell updateConstraints](&v18, "updateConstraints");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  if (v3)
  {
    double v4 = sub_100065D94();
    double v6 = v5;
    v17 = (void *)objc_claimAutoreleasedReturnValue([v3 leadingAnchor]);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell leadingAnchor](self, "leadingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v16 constant:-46.0]);
    v19[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue([v3 centerYAnchor]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell centerYAnchor](self, "centerYAnchor"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
    v19[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue([v3 widthAnchor]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToConstant:v4]);
    v19[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v3 heightAnchor]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 constraintEqualToConstant:v6]);
    v19[3] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v19, 4LL));

    +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v15);
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHMusicSongListViewCell;
  -[TVHListViewCell prepareForReuse](&v3, "prepareForReuse");
  -[TVHMusicSongListViewCell setNowPlayingBarsState:](self, "setNowPlayingBarsState:", 0LL);
  -[TVHMusicSongListViewCell setImageProxy:](self, "setImageProxy:", 0LL);
  -[TVHMusicSongListViewCell setPlaceholder:](self, "setPlaceholder:", 0LL);
  -[TVHMusicSongListViewCell setTitle:hasExplicitLyrics:](self, "setTitle:hasExplicitLyrics:", 0LL, 0LL);
  -[TVHMusicSongListViewCell setArtistTitle:](self, "setArtistTitle:", 0LL);
  -[TVHMusicSongListViewCell setDuration:](self, "setDuration:", 0LL);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___TVHMusicSongListViewCell;
  id v6 = a4;
  -[TVHListViewCell didUpdateFocusInContext:withAnimationCoordinator:]( &v10,  "didUpdateFocusInContext:withAnimationCoordinator:",  a3,  v6);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100018398;
  v8[3] = &unk_1000FD260;
  v8[4] = self;
  unsigned __int8 v9 = -[TVHMusicSongListViewCell isFocused](self, "isFocused");
  [v6 addCoordinatedAnimations:v8 completion:0];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "tvh_updateMarqueeWithFocus:", -[TVHMusicSongListViewCell isFocused](self, "isFocused"));
}

- (void)_updateColors
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  id v5 = -[TVHMusicSongListViewCell isFocused](self, "isFocused");
  id v6 = [(id)objc_opt_class(self) _titleLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  id v12 = (id)objc_claimAutoreleasedReturnValue(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell titleLabel](self, "titleLabel"));
  [v7 setTextColor:v12];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell artistTitleLabel](self, "artistTitleLabel"));
  [v8 setTextColor:v12];

  id v9 = [(id)objc_opt_class(self) _durationLabelTextColorWithUserInterfaceStyle:v4 andFocus:v5];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell durationLabel](self, "durationLabel"));
  [v11 setTextColor:v10];
}

+ (id)_titleLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4
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
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_50PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_50PercentWhiteColor"));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_60PercentBlackColor"));
  }

  return v4;
}

+ (id)_durationLabelTextColorWithUserInterfaceStyle:(int64_t)a3 andFocus:(BOOL)a4
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
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_30PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_30PercentWhiteColor"));
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
  }

  return v4;
}

- (void)_updateNowPlayingBars:(unint64_t)a3
{
  id v5 = (TVHNowPlayingBarsView *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell nowPlayingBarsView](self, "nowPlayingBarsView"));
  if (a3)
  {
    if (!v5)
    {
      double v6 = sub_100065D94();
      id v12 = -[TVHNowPlayingBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVHNowPlayingBarsView),  "initWithFrame:",  0.0,  0.0,  v6,  v7);
      -[TVHNowPlayingBarsView setTranslatesAutoresizingMaskIntoConstraints:]( v12,  "setTranslatesAutoresizingMaskIntoConstraints:",  0LL);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_40PercentBlackColor](&OBJC_CLASS___UIColor, "tvh_40PercentBlackColor"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tvh_60PercentWhiteColor](&OBJC_CLASS___UIColor, "tvh_60PercentWhiteColor"));
      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor tvh_dynamicColorWithLightStyleColor:darkStyleColor:]( &OBJC_CLASS___UIColor,  "tvh_dynamicColorWithLightStyleColor:darkStyleColor:",  v8,  v9));
      -[TVHNowPlayingBarsView setTintColor:](v12, "setTintColor:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVHMusicSongListViewCell contentView](self, "contentView"));
      [v11 addSubview:v12];

      -[TVHMusicSongListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", v12);
      -[TVHMusicSongListViewCell setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
      -[TVHMusicSongListViewCell updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
      id v5 = v12;
    }

    v13 = v5;
    -[TVHNowPlayingBarsView setState:](v5, "setState:", a3);
  }

  else
  {
    v13 = v5;
    -[TVHNowPlayingBarsView removeFromSuperview](v5, "removeFromSuperview");
    -[TVHMusicSongListViewCell setNowPlayingBarsView:](self, "setNowPlayingBarsView:", 0LL);
  }
}

- (id)_floatingContentViewContentView
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVHListViewCell floatingContentView](self, "floatingContentView"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 contentView]);

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

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (void)setAlbumTitle:(id)a3
{
}

- (NSNumber)duration
{
  return self->_duration;
}

- (TVHMediaImageView)imageView
{
  return self->_imageView;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (UILabel)artistTitleLabel
{
  return self->_artistTitleLabel;
}

- (UILabel)durationLabel
{
  return self->_durationLabel;
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