@interface MTEpisodeArtworkView
- (BOOL)canBecomeFocused;
- (BOOL)isCurrentPlayerItem;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTEpisodeArtworkView)initWithFrame:(CGRect)a3;
- (MTNowPlayingIndicatorView)barsView;
- (MTVibrantImageView)vibrantImageView;
- (UIImage)artwork;
- (UIImageView)imageView;
- (UIView)dimmingView;
- (id)_blurredArtworkForArtwork:(id)a3;
- (void)_updateBarMetricsForArtworkSize:(CGSize)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setArtwork:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDimmingView:(id)a3;
- (void)setImageView:(id)a3;
- (void)setVibrantImageView:(id)a3;
- (void)startObservingPlaybackState;
- (void)stopObservingPlaybackState;
- (void)updatePlaybackState;
@end

@implementation MTEpisodeArtworkView

- (MTEpisodeArtworkView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTEpisodeArtworkView;
  v3 = -[MTEpisodeArtworkView initWithFrame:]( &v7,  "initWithFrame:",  a3.origin.x,  a3.origin.y,  a3.size.width,  a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](v3, "imageView"));
    -[MTEpisodeArtworkView addSubview:](v4, "addSubview:", v5);

    -[MTEpisodeArtworkView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0LL);
  }

  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTEpisodeArtworkView;
  -[MTEpisodeArtworkView dealloc](&v4, "dealloc");
}

- (UIImage)artwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setArtwork:(id)a3
{
  id v8 = a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  [v4 setImage:v8];

  unsigned int v5 = -[MTEpisodeArtworkView isCurrentPlayerItem](self, "isCurrentPlayerItem");
  if (v5) {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView _blurredArtworkForArtwork:](self, "_blurredArtworkForArtwork:", v8));
  }
  else {
    v6 = 0LL;
  }
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
  [v7 setImage:v6];

  if (v5) {
}
  }

- (MTVibrantImageView)vibrantImageView
{
  vibrantImageView = self->_vibrantImageView;
  if (!vibrantImageView)
  {
    objc_super v4 = objc_opt_new(&OBJC_CLASS___MTVibrantImageView);
    unsigned int v5 = self->_vibrantImageView;
    self->_vibrantImageView = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView barsView](self, "barsView"));
    -[MTVibrantImageView setMaskView:](self->_vibrantImageView, "setMaskView:", v6);

    vibrantImageView = self->_vibrantImageView;
  }

  return vibrantImageView;
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  if (self->_currentPlayerItem != a3)
  {
    self->_currentPlayerItem = a3;
    if (a3)
    {
      objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView dimmingView](self, "dimmingView"));
      -[MTEpisodeArtworkView addSubview:](self, "addSubview:", v4);

      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue([v5 image]);

      if (!v6)
      {
        objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView artwork](self, "artwork"));
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView _blurredArtworkForArtwork:](self, "_blurredArtworkForArtwork:", v7));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
        [v9 setImage:v8];
      }

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView vibrantImageView](self, "vibrantImageView"));
      -[MTEpisodeArtworkView addSubview:](self, "addSubview:", v10);

      -[MTEpisodeArtworkView startObservingPlaybackState](self, "startObservingPlaybackState");
    }

    else
    {
      -[UIView removeFromSuperview](self->_dimmingView, "removeFromSuperview");
      -[MTVibrantImageView removeFromSuperview](self->_vibrantImageView, "removeFromSuperview");
      -[MTEpisodeArtworkView stopObservingPlaybackState](self, "stopObservingPlaybackState");
    }

    -[MTEpisodeArtworkView updatePlaybackState](self, "updatePlaybackState");
  }

- (void)startObservingPlaybackState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"updatePlaybackState" name:@"TVMusicPlayerStateDidChangeNotification" object:0];
}

- (void)stopObservingPlaybackState
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:@"TVMusicPlayerStateDidChangeNotification" object:0];
}

- (void)updatePlaybackState
{
  if (-[MTEpisodeArtworkView isCurrentPlayerItem](self, "isCurrentPlayerItem"))
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance"));
    unsigned int v4 = [v3 isTargetPlaying];

    if (v4) {
      uint64_t v5 = 1LL;
    }
    else {
      uint64_t v5 = 2LL;
    }
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  -[MTNowPlayingIndicatorView setPlaybackState:](self->_barsView, "setPlaybackState:", v5);
}

- (void)layoutSubviews
{
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIView superview](self->_dimmingView, "superview"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView dimmingView](self, "dimmingView"));
    objc_msgSend(v13, "setFrame:", v4, v6, v8, v10);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTVibrantImageView superview](self->_vibrantImageView, "superview"));

  if (v14)
  {
    -[MTVibrantImageView setFrame:](self->_vibrantImageView, "setFrame:", v4, v6, v8, v10);
    -[MTEpisodeArtworkView _updateBarMetricsForArtworkSize:](self, "_updateBarMetricsForArtworkSize:", v8, v10);
  }

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeArtworkView imageView](self, "imageView"));
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    double v5 = self->_imageView;
    self->_imageView = v4;

    id v6 = objc_claimAutoreleasedReturnValue(+[UIColor artworkBorderColor](&OBJC_CLASS___UIColor, "artworkBorderColor"));
    id v7 = [v6 CGColor];
    double v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v8 setBorderColor:v7];

    double v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v9 scale];
    double v11 = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v12 setBorderWidth:1.0 / v11];

    imageView = self->_imageView;
  }

  return imageView;
}

- (UIView)dimmingView
{
  dimmingView = self->_dimmingView;
  if (!dimmingView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIView);
    double v5 = self->_dimmingView;
    self->_dimmingView = v4;

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.32));
    -[UIView setBackgroundColor:](self->_dimmingView, "setBackgroundColor:", v6);

    dimmingView = self->_dimmingView;
  }

  return dimmingView;
}

- (MTNowPlayingIndicatorView)barsView
{
  barsView = self->_barsView;
  if (!barsView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___MTNowPlayingIndicatorView);
    double v5 = self->_barsView;
    self->_barsView = v4;

    else {
      uint64_t v6 = 4LL;
    }
    -[MTNowPlayingIndicatorView setNumberOfLevels:](self->_barsView, "setNumberOfLevels:", v6);
    -[MTNowPlayingIndicatorView setBounceStyle:](self->_barsView, "setBounceStyle:", 1LL);
    -[MTNowPlayingIndicatorView setLevelWidth:](self->_barsView, "setLevelWidth:", 3.5);
    -[MTNowPlayingIndicatorView setInterLevelSpacing:](self->_barsView, "setInterLevelSpacing:", 2.0);
    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", 1.0);
    barsView = self->_barsView;
  }

  return barsView;
}

- (id)_blurredArtworkForArtwork:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue( +[_UIBackdropViewSettings settingsForPrivateStyle:]( &OBJC_CLASS____UIBackdropViewSettings,  "settingsForPrivateStyle:",  2020LL));
  double v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v5 scale];
  double v7 = v6;

  [v4 setBlurRadius:1.0 / v7 * 8.0];
  double v8 = (void *)objc_claimAutoreleasedReturnValue([v3 _applyBackdropViewSettings:v4 includeTints:1 includeBlur:1]);

  return v8;
}

- (void)_updateBarMetricsForArtworkSize:(CGSize)a3
{
  if (self->_barsView)
  {
    double height = a3.height;
    double width = a3.width;
    int v6 = isTV();
    int v7 = isTV();
    else {
      double v8 = 0.25;
    }
    else {
      double v9 = 0.34375;
    }
    id v10 = -[MTNowPlayingIndicatorView numberOfLevels](self->_barsView, "numberOfLevels");
    double v11 = height * v8;
    double v12 = width * v9;
    double v13 = width * v9 / ((double)(unint64_t)v10 + (double)((unint64_t)v10 - 1) * 0.5);
    double v14 = v13 * 0.5;
    int v15 = isTV();
    double v29 = IMRoundToPixel(v11);
    double v16 = IMRoundToPixel(v13);
    if (v16 < 1.0) {
      double v16 = 1.0;
    }
    double v28 = v16;
    double v17 = IMRoundToPixel(v13);
    if (v17 < 2.0) {
      double v17 = 2.0;
    }
    double v27 = v17;
    double v18 = IMRoundToPixel(v13 * 0.5);
    if (v18 < 1.0) {
      double v18 = 1.0;
    }
    double v26 = v18;
    double v19 = 0.0;
    if ((isTV() & 1) == 0)
    {
      double v20 = v14 * 0.5;
      if (v15) {
        double v20 = 0.0;
      }
      if (v7) {
        double v19 = 0.0;
      }
      else {
        double v19 = 4.0;
      }
      if (v6) {
        double v21 = 0.0;
      }
      else {
        double v21 = 1.0;
      }
      double v22 = IMRoundToPixel(v20);
      if (v22 < v21) {
        double v22 = v21;
      }
      if (v22 < v19) {
        double v19 = v22;
      }
    }

    double v23 = IMRoundToPixel(v12);
    double v24 = IMRoundToPixel(v11);
    double v25 = IMRoundToPixel((width - v12) * 0.5);
    -[MTNowPlayingIndicatorView setFrame:]( self->_barsView,  "setFrame:",  v25,  IMRoundToPixel((height - v11) * 0.5),  v23,  v24);
    -[MTNowPlayingIndicatorView setMaximumLevelHeight:](self->_barsView, "setMaximumLevelHeight:", v29);
    -[MTNowPlayingIndicatorView setMinimumLevelHeight:](self->_barsView, "setMinimumLevelHeight:", v28);
    -[MTNowPlayingIndicatorView setLevelWidth:](self->_barsView, "setLevelWidth:", v27);
    -[MTNowPlayingIndicatorView setInterLevelSpacing:](self->_barsView, "setInterLevelSpacing:", v26);
    -[MTNowPlayingIndicatorView setLevelCornerRadius:](self->_barsView, "setLevelCornerRadius:", v19);
  }

- (BOOL)canBecomeFocused
{
  return 0;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (void)setImageView:(id)a3
{
}

- (void)setDimmingView:(id)a3
{
}

- (void)setVibrantImageView:(id)a3
{
}

- (void)setBarsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end