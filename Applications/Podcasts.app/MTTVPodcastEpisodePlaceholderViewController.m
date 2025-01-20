@interface MTTVPodcastEpisodePlaceholderViewController
- (BOOL)_isDarkBackground;
- (MTPodcast)podcast;
- (MTTVPodcastEpisodePlaceholderViewController)initWithPodcast:(id)a3;
- (UIImageView)imageView;
- (id)_fetchArtwork;
- (void)_update;
- (void)_updateColors;
- (void)loadView;
- (void)setImageView:(id)a3;
- (void)setPodcast:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTTVPodcastEpisodePlaceholderViewController

- (MTTVPodcastEpisodePlaceholderViewController)initWithPodcast:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController;
  v5 = -[MTTVPodcastEpisodePlaceholderViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVPodcastEpisodePlaceholderViewController setPodcast:](v5, "setPodcast:", v4);
  }

  return v6;
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController;
  -[MTTVPodcastEpisodePlaceholderViewController loadView](&v5, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController imageView](self, "imageView"));
  [v3 addSubview:v4];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController;
  -[MTTVPodcastEpisodePlaceholderViewController viewDidLoad](&v3, "viewDidLoad");
  -[MTTVPodcastEpisodePlaceholderViewController _update](self, "_update");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController;
  -[MTTVPodcastEpisodePlaceholderViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTTVPodcastEpisodePlaceholderViewController _updateColors](self, "_updateColors");
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController;
  -[MTTVPodcastEpisodePlaceholderViewController viewDidLayoutSubviews](&v7, "viewDidLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController view](self, "view"));
  [v3 safeAreaInsets];
  double v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController imageView](self, "imageView"));
  objc_msgSend(v6, "setFrame:", 64.0, v5, 640.0, 640.0);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController;
  id v4 = a3;
  -[MTTVPodcastEpisodePlaceholderViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVPodcastEpisodePlaceholderViewController _updateColors](self, "_updateColors");
  }
}

- (void)setPodcast:(id)a3
{
}

- (void)_update
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController _fetchArtwork](self, "_fetchArtwork"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController imageView](self, "imageView"));
  [v4 setImage:v3];

  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController view](self, "view"));
  [v5 setNeedsLayout];
}

- (void)_updateColors
{
  id v6 = objc_claimAutoreleasedReturnValue( +[UIColor artworkBorderColorForDarkBackground:]( &OBJC_CLASS___UIColor, "artworkBorderColorForDarkBackground:", -[MTTVPodcastEpisodePlaceholderViewController _isDarkBackground]( self, "_isDarkBackground")));
  id v3 = [v6 CGColor];
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController imageView](self, "imageView"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 layer]);
  [v5 setBorderColor:v3];
}

- (BOOL)_isDarkBackground
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController traitCollection](self, "traitCollection"));
  BOOL v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (id)_fetchArtwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodePlaceholderViewController podcast](self, "podcast"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "artworkWithSize:", 640.0, 640.0));

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

    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v6 scale];
    double v8 = v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v9 setBorderWidth:1.0 / v8];

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v10 setMasksToBounds:1];

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v11 setCornerRadius:14.0];

    imageView = self->_imageView;
  }

  return imageView;
}

- (MTPodcast)podcast
{
  return self->_podcast;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end