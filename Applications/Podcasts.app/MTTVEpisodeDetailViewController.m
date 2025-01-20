@interface MTTVEpisodeDetailViewController
- (BOOL)isDarkBackground;
- (MTEpisode)episode;
- (MTTVEpisodeDetailViewController)initWithEpisode:(id)a3;
- (MTTVEpisodeDetailViewControllerDelegate)delegate;
- (MTTVExpandingTextView)descriptionView;
- (UIImageView)imageView;
- (UITapGestureRecognizer)playButtonRecognizer;
- (id)descriptionFont;
- (id)fetchArtwork;
- (id)fetchDescription;
- (void)artworkDidChange:(id)a3;
- (void)dealloc;
- (void)episodeDescriptionViewController:(id)a3 playEpisode:(id)a4;
- (void)loadView;
- (void)playPauseButtonAction:(id)a3;
- (void)registerForArtworkChangeNotifications;
- (void)setDelegate:(id)a3;
- (void)setDescriptionView:(id)a3;
- (void)setEpisode:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPlayButtonRecognizer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)unregisterForArtworkChangeNotifications;
- (void)updateArtwork;
- (void)updateColors;
- (void)updateDescriptionText;
- (void)updateDescriptionTextColor;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MTTVEpisodeDetailViewController

- (MTTVEpisodeDetailViewController)initWithEpisode:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  v5 = -[MTTVEpisodeDetailViewController init](&v8, "init");
  v6 = v5;
  if (v5) {
    -[MTTVEpisodeDetailViewController setEpisode:](v5, "setEpisode:", v4);
  }

  return v6;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  -[MTTVEpisodeDetailViewController dealloc](&v4, "dealloc");
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  -[MTTVEpisodeDetailViewController loadView](&v7, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController view](self, "view"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController imageView](self, "imageView"));
  [v3 addSubview:v4];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  [v5 addSubview:v6];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  -[MTTVEpisodeDetailViewController viewDidLoad](&v6, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[UITapGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UITapGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "playPauseButtonAction:",  6LL));
  -[MTTVEpisodeDetailViewController setPlayButtonRecognizer:](self, "setPlayButtonRecognizer:", v3);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController playButtonRecognizer](self, "playButtonRecognizer"));
  [v4 addGestureRecognizer:v5];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  -[MTTVEpisodeDetailViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTTVEpisodeDetailViewController updateColors](self, "updateColors");
}

- (void)viewDidLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  -[MTTVEpisodeDetailViewController viewDidLayoutSubviews](&v12, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController view](self, "view"));
  [v3 safeAreaInsets];
  double v5 = v4;

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController imageView](self, "imageView"));
  objc_msgSend(v6, "setFrame:", 90.0, v5, 640.0, 640.0);

  v13.origin.x = 90.0;
  v13.origin.y = v5;
  v13.size.width = 640.0;
  v13.size.height = 640.0;
  CGFloat v7 = CGRectGetMaxY(v13) + 36.0;
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  objc_msgSend(v8, "sizeThatFits:", 640.0, 1.79769313e308);
  double v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  objc_msgSend(v11, "setFrame:", 90.0, v7, 640.0, v10);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___MTTVEpisodeDetailViewController;
  id v4 = a3;
  -[MTTVEpisodeDetailViewController traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  id v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController traitCollection](self, "traitCollection"));
  id v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    -[MTTVEpisodeDetailViewController updateColors](self, "updateColors");
  }
}

- (void)playPauseButtonAction:(id)a3
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  if ([v6 isTargetPlaying])
  {
    [v6 pausePlayerTarget];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController delegate](self, "delegate"));
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController episode](self, "episode"));
    [v4 episodeDetailViewController:self playEpisode:v5];
  }
}

- (void)setEpisode:(id)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController view](self, "view"));
  [v5 setNeedsLayout];

  if (a3) {
    -[MTTVEpisodeDetailViewController registerForArtworkChangeNotifications]( self,  "registerForArtworkChangeNotifications");
  }
  else {
    -[MTTVEpisodeDetailViewController unregisterForArtworkChangeNotifications]( self,  "unregisterForArtworkChangeNotifications");
  }
}

- (void)updateArtwork
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController fetchArtwork](self, "fetchArtwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController imageView](self, "imageView"));
  [v3 setImage:v4];
}

- (void)updateDescriptionText
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController fetchDescription](self, "fetchDescription"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  [v4 setDescriptionText:v3];

  -[MTTVEpisodeDetailViewController updateDescriptionTextColor](self, "updateDescriptionTextColor");
}

- (void)updateColors
{
  id v3 = objc_claimAutoreleasedReturnValue( +[UIColor artworkBorderColorForDarkBackground:]( &OBJC_CLASS___UIColor, "artworkBorderColorForDarkBackground:", -[MTTVEpisodeDetailViewController isDarkBackground](self, "isDarkBackground")));
  id v4 = [v3 CGColor];
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController imageView](self, "imageView"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 layer]);
  [v6 setBorderColor:v4];

  -[MTTVEpisodeDetailViewController updateDescriptionTextColor](self, "updateDescriptionTextColor");
}

- (BOOL)isDarkBackground
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController traitCollection](self, "traitCollection"));
  BOOL v3 = [v2 userInterfaceStyle] == (id)2;

  return v3;
}

- (void)updateDescriptionTextColor
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController traitCollection](self, "traitCollection"));
  BOOL v4 = [v3 userInterfaceStyle] == (id)2;

  id v13 = (id)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  v4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIColor primaryTextColorForDarkBackground:]( &OBJC_CLASS___UIColor,  "primaryTextColorForDarkBackground:",  0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  [v6 setDescriptionTextColor:v13];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  [v7 setDescriptionTextHighlightColor:v5];

  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 descriptionText]);
  id v10 = [v9 mutableCopy];

  objc_msgSend(v10, "addAttribute:value:range:", NSForegroundColorAttributeName, v13, 0, objc_msgSend(v10, "length"));
  id v11 = [v10 copy];
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionView](self, "descriptionView"));
  [v12 setDescriptionText:v11];
}

- (id)fetchArtwork
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController episode](self, "episode"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "artworkWithSize:", 640.0, 640.0));

  return v3;
}

- (id)fetchDescription
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController episode](self, "episode"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bestSummary]);

  if ([v4 length])
  {
    NSAttributedStringKey v9 = NSFontAttributeName;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController descriptionFont](self, "descriptionFont"));
    id v10 = v5;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v10,  &v9,  1LL));

    id v7 = -[NSAttributedString initWithString:attributes:]( objc_alloc(&OBJC_CLASS___NSAttributedString),  "initWithString:attributes:",  v4,  v6);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)registerForArtworkChangeNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"artworkDidChange:" name:kMTImageDownloaderArtworkDidLoadNotification object:0];
}

- (void)unregisterForArtworkChangeNotifications
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:kMTImageDownloaderArtworkDidLoadNotification object:0];
}

- (void)artworkDidChange:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController episode](self, "episode"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v5 podcastUuid]);

  uint64_t CacheKeys = MTImageDownloaderArtworkDidLoadCacheKeys(v4, v6);
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(CacheKeys);
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___UIImageView);
    id v5 = self->_imageView;
    self->_imageView = v4;

    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
    [v6 scale];
    double v8 = v7;

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v9 setBorderWidth:1.0 / v8];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v10 setMasksToBounds:1];

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    [v11 setCornerRadius:14.0];

    imageView = self->_imageView;
  }

  return imageView;
}

- (MTTVExpandingTextView)descriptionView
{
  descriptionView = self->_descriptionView;
  if (!descriptionView)
  {
    id v4 = objc_opt_new(&OBJC_CLASS___MTTVExpandingTextView);
    id v5 = self->_descriptionView;
    self->_descriptionView = v4;

    uint64_t v6 = self->_descriptionView;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    -[TVMTExpandingTextView setHighlightBackgroundColor:](v6, "setHighlightBackgroundColor:", v7);

    -[TVMTExpandingTextView setMaximumNumberOfLines:](self->_descriptionView, "setMaximumNumberOfLines:", 4LL);
    -[MTTVExpandingTextView setAlwaysFocusable:](self->_descriptionView, "setAlwaysFocusable:", 1LL);
    objc_initWeak(&location, self);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100068E18;
    v9[3] = &unk_1002423A0;
    objc_copyWeak(&v10, &location);
    -[TVMTExpandingTextView setSelectionHandler:](self->_descriptionView, "setSelectionHandler:", v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    descriptionView = self->_descriptionView;
  }

  return descriptionView;
}

- (id)descriptionFont
{
  return +[UIFont preferredFontForTextStyle:](&OBJC_CLASS___UIFont, "preferredFontForTextStyle:", UIFontTextStyleBody);
}

- (void)episodeDescriptionViewController:(id)a3 playEpisode:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeDetailViewController delegate](self, "delegate"));
  [v6 episodeDetailViewController:self playEpisode:v5];
}

- (MTEpisode)episode
{
  return self->_episode;
}

- (MTTVEpisodeDetailViewControllerDelegate)delegate
{
  return (MTTVEpisodeDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void)setDescriptionView:(id)a3
{
}

- (UITapGestureRecognizer)playButtonRecognizer
{
  return self->_playButtonRecognizer;
}

- (void)setPlayButtonRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end