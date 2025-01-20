@interface MTTVEpisodePlayStatusView
- (BOOL)barsFillBounds;
- (BOOL)isCurrentPlayerItem;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTTVEpisodePlayStatusView)init;
- (TVMTMusicBarsView)barsView;
- (UIColor)barsTintColor;
- (UIImage)image;
- (UIImageView)dotView;
- (unint64_t)barsStyle;
- (void)_registerForNotifications;
- (void)_unregisterForNotifications;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setBarsFillBounds:(BOOL)a3;
- (void)setBarsStyle:(unint64_t)a3;
- (void)setBarsTintColor:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setCurrentPlayerItem:(BOOL)a3;
- (void)setDotView:(id)a3;
- (void)setImage:(id)a3;
- (void)updatePlaybackState;
@end

@implementation MTTVEpisodePlayStatusView

- (MTTVEpisodePlayStatusView)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVEpisodePlayStatusView;
  v2 = -[MTTVEpisodePlayStatusView init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](v2, "dotView"));
    -[MTTVEpisodePlayStatusView addSubview:](v3, "addSubview:", v4);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodePlayStatusView;
  -[MTTVEpisodePlayStatusView dealloc](&v4, "dealloc");
}

- (UIImage)image
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](self, "dotView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 image]);

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](self, "dotView"));
  [v5 setImage:v4];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](self, "dotView"));
  [v6 sizeToFit];
}

- (void)setCurrentPlayerItem:(BOOL)a3
{
  if (self->_currentPlayerItem != a3)
  {
    BOOL v3 = a3;
    self->_currentPlayerItem = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](self, "dotView"));
    id v6 = v5;
    if (v3)
    {
      [v5 setHidden:1];

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
      -[MTTVEpisodePlayStatusView addSubview:](self, "addSubview:", v7);

      -[MTTVEpisodePlayStatusView updatePlaybackState](self, "updatePlaybackState");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView window](self, "window"));

      if (v8) {
        -[MTTVEpisodePlayStatusView _registerForNotifications](self, "_registerForNotifications");
      }
    }

    else
    {
      [v5 setHidden:0];

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
      [v9 stopAnimating];

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
      [v10 removeFromSuperview];

      -[MTTVEpisodePlayStatusView _unregisterForNotifications](self, "_unregisterForNotifications");
    }

    -[MTTVEpisodePlayStatusView setNeedsLayout](self, "setNeedsLayout");
  }

- (void)setBarsTintColor:(id)a3
{
  v7 = (UIColor *)a3;
  if (self->_barsTintColor != v7)
  {
    objc_storeStrong((id *)&self->_barsTintColor, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 subviews]);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000FB1C4;
    v8[3] = &unk_100244B78;
    v9 = v7;
    [v6 enumerateObjectsUsingBlock:v8];
  }
}

- (void)setBarsFillBounds:(BOOL)a3
{
  if (self->_barsFillBounds != a3)
  {
    self->_barsFillBounds = a3;
    -[MTTVEpisodePlayStatusView setNeedsLayout](self, "setNeedsLayout");
  }

- (unint64_t)barsStyle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
  id v3 = [v2 musicBarsStyle];

  return (unint64_t)v3;
}

- (void)setBarsStyle:(unint64_t)a3
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
  [v4 setMusicBarsStyle:a3];
}

- (void)_registerForNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"updatePlaybackState" name:MTApplicationWillResignActiveNotification object:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"updatePlaybackState" name:MTApplicationDidBecomeActiveNotification object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 addObserver:self selector:"updatePlaybackState" name:@"TVMusicPlayerStateDidChangeNotification" object:0];
}

- (void)_unregisterForNotifications
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:MTApplicationWillResignActiveNotification object:0];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:MTApplicationDidBecomeActiveNotification object:0];

  id v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v5 removeObserver:self name:@"TVMusicPlayerStateDidChangeNotification" object:0];
}

- (void)updatePlaybackState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 window]);
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
      BOOL v8 = [v7 applicationState] == 0;
    }

    else
    {
      BOOL v8 = 0;
    }

    if (-[MTTVEpisodePlayStatusView isCurrentPlayerItem](self, "isCurrentPlayerItem")
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance")),
          unsigned int v10 = [v9 isTargetPlaying] & v8,
          v9,
          v10 == 1))
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
      [v11 resumeAnimating];
    }

    else
    {
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
      [v11 stopAnimating];
    }
  }

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___MTTVEpisodePlayStatusView;
  -[MTTVEpisodePlayStatusView layoutSubviews](&v18, "layoutSubviews");
  if (-[MTTVEpisodePlayStatusView barsFillBounds](self, "barsFillBounds"))
  {
    -[MTTVEpisodePlayStatusView bounds](self, "bounds");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
  }

  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](self, "dotView"));
    else {
      uint64_t v13 = objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView dotView](self, "dotView"));
    }
    id v11 = (void *)v13;

    [v11 frame];
    double v8 = v14;
    double v10 = v15;
    -[MTTVEpisodePlayStatusView bounds](self, "bounds");
    double v4 = IMRoundToPixel((v16 - v8) * 0.5);
    -[MTTVEpisodePlayStatusView bounds](self, "bounds");
    double v6 = IMRoundToPixel((v17 - v10) * 0.5);
  }

  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 28.0;
  double v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVEpisodePlayStatusView;
  -[MTTVEpisodePlayStatusView didMoveToWindow](&v6, "didMoveToWindow");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView barsView](self, "barsView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);

  if (v4)
  {
    -[MTTVEpisodePlayStatusView updatePlaybackState](self, "updatePlaybackState");
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodePlayStatusView window](self, "window"));

    if (v5) {
      -[MTTVEpisodePlayStatusView _registerForNotifications](self, "_registerForNotifications");
    }
    else {
      -[MTTVEpisodePlayStatusView _unregisterForNotifications](self, "_unregisterForNotifications");
    }
  }

- (UIImageView)dotView
{
  dotView = self->_dotView;
  if (!dotView)
  {
    double v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    double v5 = self->_dotView;
    self->_dotView = v4;

    dotView = self->_dotView;
  }

  return dotView;
}

- (TVMTMusicBarsView)barsView
{
  barsView = self->_barsView;
  if (!barsView)
  {
    double v4 = -[TVMTMusicBarsView initWithFrame:]( objc_alloc(&OBJC_CLASS___TVMTMusicBarsView),  "initWithFrame:",  CGPointZero.x,  CGPointZero.y,  21.0,  12.0);
    double v5 = self->_barsView;
    self->_barsView = v4;

    barsView = self->_barsView;
  }

  return barsView;
}

- (BOOL)isCurrentPlayerItem
{
  return self->_currentPlayerItem;
}

- (UIColor)barsTintColor
{
  return self->_barsTintColor;
}

- (BOOL)barsFillBounds
{
  return self->_barsFillBounds;
}

- (void)setDotView:(id)a3
{
}

- (void)setBarsView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end