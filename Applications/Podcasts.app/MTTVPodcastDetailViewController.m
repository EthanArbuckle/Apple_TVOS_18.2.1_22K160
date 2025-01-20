@interface MTTVPodcastDetailViewController
- (MTArtworkBackgroundView)backgroundView;
- (MTColorTheme)colorTheme;
- (MTPodcast)podcast;
- (MTTVPodcastDetailViewController)initWithPodcast:(id)a3;
- (MTTVPodcastGoneDarkDetailViewController)goneDarkDetailViewController;
- (id)_colorThemeForPodcast:(id)a3;
- (void)_setupBackgroundView;
- (void)_showDetailsForIndexPath:(id)a3 animated:(BOOL)a4;
- (void)highlightEpisodeUuid:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setColorTheme:(id)a3;
- (void)setGoneDarkDetailViewController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MTTVPodcastDetailViewController

- (MTTVPodcastDetailViewController)initWithPodcast:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVPodcastDetailViewController;
  v6 = -[MTTVEpisodeSplitViewController init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_podcast, a3);
    uint64_t v8 = objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController _colorThemeForPodcast:](v7, "_colorThemeForPodcast:", v5));
    colorTheme = v7->_colorTheme;
    v7->_colorTheme = (MTColorTheme *)v8;
  }

  return v7;
}

- (void)highlightEpisodeUuid:(id)a3
{
  id v4 = a3;
  -[MTTVPodcastDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  id v13 = (id)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v13 episodeForUuid:v4]);
  if (v6)
  {
    uint64_t v7 = [v6 isInPodcastDetailsUnplayedTab] ^ 1;
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
    [v8 switchToTab:v7];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 indexPathForObject:v6]);

    if (v10)
    {
      objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
      [v11 setLastFocusedIndexPath:v10];

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList"));
      [v12 setNeedsFocusUpdate];
    }
  }
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MTTVPodcastDetailViewController;
  -[MTTVEpisodeSplitViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = objc_alloc(&OBJC_CLASS___MTTVPodcastEpisodeListViewController);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController podcast](self, "podcast"));
  id v5 = -[MTTVPodcastEpisodeListViewController initWithPodcast:](v3, "initWithPodcast:", v4);
  -[MTTVEpisodeSplitViewController setEpisodeList:](self, "setEpisodeList:", v5);

  v6 = objc_alloc(&OBJC_CLASS___MTTVPodcastEpisodePlaceholderViewController);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController podcast](self, "podcast"));
  uint64_t v8 = -[MTTVPodcastEpisodePlaceholderViewController initWithPodcast:](v6, "initWithPodcast:", v7);
  -[MTTVEpisodeSplitViewController setPlaceholderDetailViewController:](self, "setPlaceholderDetailViewController:", v8);

  -[MTTVPodcastDetailViewController _setupBackgroundView](self, "_setupBackgroundView");
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVPodcastDetailViewController;
  -[MTTVPodcastDetailViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController view](self, "view"));
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController backgroundView](self, "backgroundView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___MTTVPodcastDetailViewController;
  -[MTTVPodcastDetailViewController viewWillDisappear:](&v13, "viewWillDisappear:", a3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 privateQueueContext]);

  double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController podcast](self, "podcast"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 uuid]);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1000857C4;
  v10[3] = &unk_100240240;
  id v11 = v5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v5;
  [v9 performBlock:v10];
}

- (MTColorTheme)colorTheme
{
  colorTheme = self->_colorTheme;
  if (!colorTheme)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController podcast](self, "podcast"));
    double v5 = (MTColorTheme *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController _colorThemeForPodcast:](self, "_colorThemeForPodcast:", v4));
    double v6 = self->_colorTheme;
    self->_colorTheme = v5;

    colorTheme = self->_colorTheme;
  }

  return colorTheme;
}

- (MTTVPodcastGoneDarkDetailViewController)goneDarkDetailViewController
{
  goneDarkDetailViewController = self->_goneDarkDetailViewController;
  if (!goneDarkDetailViewController)
  {
    double v4 = objc_alloc(&OBJC_CLASS___MTTVPodcastGoneDarkDetailViewController);
    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController podcast](self, "podcast"));
    double v6 = -[MTTVPodcastGoneDarkDetailViewController initWithPodcast:](v4, "initWithPodcast:", v5);
    double v7 = self->_goneDarkDetailViewController;
    self->_goneDarkDetailViewController = v6;

    goneDarkDetailViewController = self->_goneDarkDetailViewController;
  }

  return goneDarkDetailViewController;
}

- (void)_showDetailsForIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6
    && (double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeSplitViewController episodeList](self, "episodeList")),
        id v8 = objc_msgSend(v7, "sectionTypeForIndex:", objc_msgSend(v6, "section")),
        v7,
        v8 == (id)10))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController goneDarkDetailViewController](self, "goneDarkDetailViewController"));
    -[MTTVEpisodeSplitViewController _showDetailViewController:animated:]( self,  "_showDetailViewController:animated:",  v9,  v4);
  }

  else
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___MTTVPodcastDetailViewController;
    -[MTTVEpisodeSplitViewController _showDetailsForIndexPath:animated:]( &v10,  "_showDetailsForIndexPath:animated:",  v6,  v4);
  }
}

- (void)_setupBackgroundView
{
  uint64_t v3 = objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController colorTheme](self, "colorTheme"));
  if (v3)
  {
    BOOL v4 = (void *)v3;
    double v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    unsigned int v6 = [v5 BOOLForKey:kMTUseCustomColorsKey];

    if (v6)
    {
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController podcast](self, "podcast"));
      id v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artworkWithSize:", 600.0, 600.0));

      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController colorTheme](self, "colorTheme"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 backgroundColor]);

      objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController colorTheme](self, "colorTheme"));
      id v11 = [v10 isBackgroundLight];

      id v12 = -[MTArtworkBackgroundView initWithArtwork:blendColor:]( objc_alloc(&OBJC_CLASS___MTArtworkBackgroundView),  "initWithArtwork:blendColor:",  v19,  v9);
      -[MTTVPodcastDetailViewController setBackgroundView:](self, "setBackgroundView:", v12);

      objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController backgroundView](self, "backgroundView"));
      [v13 setUseLightStyle:v11];

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController backgroundView](self, "backgroundView"));
      [v14 setFadeHeight:0.0];

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController view](self, "view"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController backgroundView](self, "backgroundView"));
      [v15 insertSubview:v16 atIndex:0];

      if ((_DWORD)v11) {
        uint64_t v17 = 1LL;
      }
      else {
        uint64_t v17 = 2LL;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastDetailViewController traitOverrides](self, "traitOverrides"));
      [v18 setUserInterfaceStyle:v17];
    }
  }

- (id)_colorThemeForPodcast:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a3 uuid]);
  if (v3)
  {
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageAnalyzer sharedInstance](&OBJC_CLASS___MTImageAnalyzer, "sharedInstance"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue([v4 colorThemeForPodcastUuid:v3]);
  }

  else
  {
    double v5 = 0LL;
  }

  return v5;
}

- (MTPodcast)podcast
{
  return self->_podcast;
}

- (void)setGoneDarkDetailViewController:(id)a3
{
}

- (MTArtworkBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (void)setColorTheme:(id)a3
{
}

- (void).cxx_destruct
{
}

@end