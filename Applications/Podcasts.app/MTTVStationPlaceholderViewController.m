@interface MTTVStationPlaceholderViewController
- (BOOL)_isDarkBackground;
- (MTPlaylist)station;
- (MTTVStationPlaceholderViewController)initWithStation:(id)a3;
- (UIImageView)imageView;
- (id)_fetchArtwork;
- (void)_update;
- (void)_updateColors;
- (void)loadView;
- (void)setImageView:(id)a3;
- (void)setStation:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTTVStationPlaceholderViewController

- (MTTVStationPlaceholderViewController)initWithStation:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationPlaceholderViewController;
  v5 = -[MTTVStationPlaceholderViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVStationPlaceholderViewController setStation:](v5, "setStation:", v4);
  }

  return v6;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVStationPlaceholderViewController;
  -[MTTVStationPlaceholderViewController loadView](&v5, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController imageView](self, "imageView"));
  [v3 addSubview:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVStationPlaceholderViewController;
  -[MTTVStationPlaceholderViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTTVStationPlaceholderViewController _update](self, "_update");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVStationPlaceholderViewController;
  -[MTTVStationPlaceholderViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTTVStationPlaceholderViewController _updateColors](self, "_updateColors");
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVStationPlaceholderViewController;
  -[MTTVStationPlaceholderViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController view](self, "view"));
  [v3 safeAreaInsets];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController imageView](self, "imageView"));
  objc_msgSend(v6, "setFrame:", 64.0, v5, 640.0, 640.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVStationPlaceholderViewController;
  id v4 = a3;
  -[MTTVStationPlaceholderViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVStationPlaceholderViewController _updateColors](self, "_updateColors");
  }
}

- (void)setStation:(id)a3
{
}

- (void)_update
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController _fetchArtwork](self, "_fetchArtwork"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController imageView](self, "imageView"));
  [v4 setImage:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController view](self, "view"));
  [v5 setNeedsLayout];
}

- (void)_updateColors
{
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[UIColor secondaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "secondaryTextColorForDarkBackground:",  -[MTTVStationPlaceholderViewController _isDarkBackground](self, "_isDarkBackground")));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController imageView](self, "imageView"));
  [v3 setTintColor:v4];
}

- (BOOL)_isDarkBackground
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVStationPlaceholderViewController traitCollection](self, "traitCollection"));
  BOOL v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (id)_fetchArtwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](&OBJC_CLASS___UIImage, "imageNamed:", @"large_station_icon"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 imageWithRenderingMode:2]);

  return v3;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    id v5 = self->_imageView;
    self->_imageView = v4;

    imageView = self->_imageView;
  }

  return imageView;
}

- (MTPlaylist)station
{
  return self->_station;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end