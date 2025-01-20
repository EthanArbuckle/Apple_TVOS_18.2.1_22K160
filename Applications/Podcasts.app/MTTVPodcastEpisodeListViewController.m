@interface MTTVPodcastEpisodeListViewController
- (BOOL)_isIndexPathForDarkPlacard:(id)a3;
- (BOOL)_isIndexPathForSettings:(id)a3;
- (BOOL)_isSectionForDarkPlacard:(int64_t)a3;
- (BOOL)_isSectionForSettings:(int64_t)a3;
- (BOOL)hasDarkPlacard;
- (BOOL)hasEmptySection;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (CGRect)headerViewFrame;
- (CGRect)tableViewFrame;
- (MTAllPropertyChangesQueryObserver)darkObserver;
- (MTPodcast)podcast;
- (MTTVPodcastEpisodeListViewController)initWithPodcast:(id)a3;
- (MTTVPodcastEpisodeListViewController)initWithPodcastUUID:(id)a3;
- (MTTVPodcastHeaderView)podcastHeaderView;
- (UILongPressGestureRecognizer)longPressRecognizer;
- (UITapGestureRecognizer)playButtonRecognizer;
- (UITapGestureRecognizer)playButtonRecognizerForHeader;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)createEmptySectionCell;
- (id)indexPathForPreferredFocusedViewInTableView:(id)a3;
- (id)messageForEmptySection;
- (id)newCellInstanceWithReuseIdentifier:(id)a3;
- (id)reuseIdentifierForRow:(id)a3;
- (id)rightButtonItems;
- (id)selectedIndexPath;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_refreshFeedIfNeeded;
- (void)_resetGoDark;
- (void)_showSettings;
- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5;
- (void)dealloc;
- (void)longPressAction:(id)a3;
- (void)playPauseButtonAction:(id)a3;
- (void)podcastHeaderDidSwitchToTab:(unint64_t)a3;
- (void)reloadData;
- (void)selectedItemAtIndexPath:(id)a3;
- (void)setDarkObserver:(id)a3;
- (void)setLongPressRecognizer:(id)a3;
- (void)setPlayButtonRecognizer:(id)a3;
- (void)setPlayButtonRecognizerForHeader:(id)a3;
- (void)setPodcastHeaderView:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)switchToTab:(unint64_t)a3;
- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)updateDarkPlacard;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation MTTVPodcastEpisodeListViewController

- (MTTVPodcastEpisodeListViewController)initWithPodcastUUID:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 mainQueueContext]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 podcastForUuid:v4]);

  v8 = -[MTTVPodcastEpisodeListViewController initWithPodcast:](self, "initWithPodcast:", v7);
  return v8;
}

- (MTTVPodcastEpisodeListViewController)initWithPodcast:(id)a3
{
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 uuid]);
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  v7 = -[MTPodcastSectionedDetailListController initWithPodcastUUID:](&v11, "initWithPodcastUUID:", v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_podcast, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](v7, "dataSource"));
    [v8 setShowOnlyRssContent:1];

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](v7, "dataSource"));
    [v9 setSelectedTab:1];
  }

  return v7;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  -[MTTVEpisodeListViewController viewDidLoad](&v23, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController view](self, "view"));
  [v4 setBackgroundColor:v3];

  id v5 = objc_alloc(&OBJC_CLASS___MTTVPodcastHeaderView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcast](self, "podcast"));
  v7 = -[MTTVPodcastHeaderView initWithPodcast:delegate:](v5, "initWithPodcast:delegate:", v6, self);
  -[MTTVPodcastEpisodeListViewController setPodcastHeaderView:](self, "setPodcastHeaderView:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v8 setShowsVerticalScrollIndicator:0];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v9 setShowsHorizontalScrollIndicator:0];

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v10 setRemembersLastFocusedIndexPath:1];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v11 registerClass:0 forHeaderFooterViewReuseIdentifier:@"ThinHeaderReuseID"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[UITapGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UITapGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "playPauseButtonAction:",  6LL));
  -[MTTVPodcastEpisodeListViewController setPlayButtonRecognizer:](self, "setPlayButtonRecognizer:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController playButtonRecognizer](self, "playButtonRecognizer"));
  [v13 addGestureRecognizer:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue( +[UITapGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UITapGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "playPauseButtonAction:",  6LL));
  -[MTTVPodcastEpisodeListViewController setPlayButtonRecognizerForHeader:]( self,  "setPlayButtonRecognizerForHeader:",  v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcastHeaderView](self, "podcastHeaderView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastEpisodeListViewController playButtonRecognizerForHeader]( self,  "playButtonRecognizerForHeader"));
  [v16 addGestureRecognizer:v17];

  v18 = (void *)objc_claimAutoreleasedReturnValue( +[UILongPressGestureRecognizer recognizerWithTarget:action:pressType:]( &OBJC_CLASS___UILongPressGestureRecognizer,  "recognizerWithTarget:action:pressType:",  self,  "longPressAction:",  4LL));
  -[MTTVPodcastEpisodeListViewController setLongPressRecognizer:](self, "setLongPressRecognizer:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController longPressRecognizer](self, "longPressRecognizer"));
  [v19 addGestureRecognizer:v20];

  v21 = -[IMActionController initWithDelegate:]( objc_alloc(&OBJC_CLASS___MTTVEpisodeActionController),  "initWithDelegate:",  self);
  -[MTTVEpisodeListViewController setActionController:](self, "setActionController:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController darkObserver](self, "darkObserver"));
  [v22 startObserving];

  -[MTTVPodcastEpisodeListViewController reloadData](self, "reloadData");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  -[MTTVListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[MTTVPodcastEpisodeListViewController _refreshFeedIfNeeded](self, "_refreshFeedIfNeeded");
}

- (void)viewWillLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  -[MTTVEpisodeListViewController viewWillLayoutSubviews](&v39, "viewWillLayoutSubviews");
  -[MTTVPodcastEpisodeListViewController headerViewFrame](self, "headerViewFrame");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcastHeaderView](self, "podcastHeaderView"));
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcastHeaderView](self, "podcastHeaderView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 superview]);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 superview]);

  if (v13 != v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 superview]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcastHeaderView](self, "podcastHeaderView"));
    [v17 addSubview:v18];
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v19 contentInset];
  double v21 = v20;
  double v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v24 contentInset];
  if (v28 != v21 || v25 != 0.0 || v27 != v23)
  {

LABEL_9:
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    objc_msgSend(v30, "setContentInset:", 0.0, v21, 0.0, v23);

    goto LABEL_10;
  }

  double v29 = v26;

  if (v29 != 0.0) {
    goto LABEL_9;
  }
LABEL_10:
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v31 _gradientMaskEdgeInsets];
  if (v35 != v21 || v32 != 0.0 || v34 != v23)
  {

LABEL_16:
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    objc_msgSend(v37, "_setGradientMaskEdgeInsets:", 0.0, v21, 0.0, v23);

    goto LABEL_17;
  }

  double v36 = v33;

  if (v36 != 0.0) {
    goto LABEL_16;
  }
LABEL_17:
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  objc_msgSend(v38, "setLayoutMargins:", 0.0, 0.0, 0.0, 54.0);
}

- (CGRect)headerViewFrame
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v12 = v11;

  CGFloat y = CGRectZero.origin.y;
  v22.origin.x = v6 + 180.0;
  v22.origin.CGFloat y = v8 + 0.0;
  v22.size.width = v10 + -320.0;
  v22.size.height = v12;
  double Width = CGRectGetWidth(v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcastHeaderView](self, "podcastHeaderView"));
  objc_msgSend(v15, "sizeThatFits:", Width, 1.79769313e308);
  double v17 = v16;

  double v18 = 180.0;
  double v19 = y;
  double v20 = Width;
  double v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.CGFloat y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)tableViewFrame
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 superview]);
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  -[MTTVPodcastEpisodeListViewController headerViewFrame](self, "headerViewFrame");
  CGFloat v11 = CGRectGetMaxY(v17) + 50.0;
  +[MTTVEpisodeCell capHeightToTop](&OBJC_CLASS___MTTVEpisodeCell, "capHeightToTop");
  double v13 = v11 - v12;
  double v14 = v10 - (v11 - v12);
  double v15 = v6 + 160.0;
  double v16 = v8 + -226.0;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.CGFloat y = v13;
  result.origin.x = v15;
  return result;
}

- (void)playPauseButtonAction:(id)a3
{
  id v9 = (id)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](&OBJC_CLASS___MTPlayerController, "defaultInstance", a3));
  if (![v9 isTargetPlaying])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    double v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_indexPathForFocusedCell"));

    if (v5)
    {
      double v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController objectAtIndexPath:](self, "objectAtIndexPath:", v5));
      if (v6)
      {
        uint64_t v7 = objc_opt_class(&OBJC_CLASS___MTEpisode);
        if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
        {
          -[MTPodcastSectionedDetailListController playEpisodeAtIndexPath:](self, "playEpisodeAtIndexPath:", v5);
LABEL_10:

          goto LABEL_11;
        }
      }
    }

    else
    {
      double v6 = 0LL;
    }

    double v8 = (void *)objc_claimAutoreleasedReturnValue([v9 currentItem]);

    if (v8) {
      [v9 playWithReason:3];
    }
    goto LABEL_10;
  }

  [v9 pausePlayerTarget];
LABEL_11:
}

- (void)longPressAction:(id)a3
{
  if ([a3 state] == (id)1)
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    id v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_indexPathForFocusedCell"));

    double v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController objectAtIndexPath:](self, "objectAtIndexPath:", v12));
    if (v5)
    {
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___MTEpisode);
      if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
        double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 cellForRowAtIndexPath:v12]);

        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController actionController](self, "actionController"));
        [v9 setActionObject:v5];

        double v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController actionController](self, "actionController"));
        id v11 = [v10 presentAvailableActionsFromView:v8];
      }
    }
  }

- (void)podcastHeaderDidSwitchToTab:(unint64_t)a3
{
  if (-[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab") != a3) {
    -[MTTVPodcastEpisodeListViewController switchToTab:](self, "switchToTab:", a3);
  }
}

- (id)reuseIdentifierForRow:(id)a3
{
  id v4 = a3;
  if (-[MTTVPodcastEpisodeListViewController _isIndexPathForSettings:](self, "_isIndexPathForSettings:", v4))
  {
    double v5 = &OBJC_CLASS___MTTVSettingsTableViewCell;
  }

  else
  {
    if (!-[MTTVPodcastEpisodeListViewController _isIndexPathForDarkPlacard:](self, "_isIndexPathForDarkPlacard:", v4))
    {
      v10.receiver = self;
      v10.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
      id v7 = -[MTPodcastSectionedDetailListController reuseIdentifierForRow:](&v10, "reuseIdentifierForRow:", v4);
      uint64_t v6 = objc_claimAutoreleasedReturnValue(v7);
      goto LABEL_7;
    }

    double v5 = &OBJC_CLASS___MTTVGoneDarkCell;
  }

  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[__objc2_class reuseIdentifier](v5, "reuseIdentifier"));
LABEL_7:
  double v8 = (void *)v6;

  return v8;
}

- (id)newCellInstanceWithReuseIdentifier:(id)a3
{
  id v4 = a3;
  double v5 = (void *)objc_claimAutoreleasedReturnValue( +[MTTVSettingsTableViewCell reuseIdentifier]( &OBJC_CLASS___MTTVSettingsTableViewCell,  "reuseIdentifier"));
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = &OBJC_CLASS___MTTVSettingsTableViewCell;
LABEL_5:
    objc_super v10 = (MTTVEpisodeCell *)objc_opt_new(v7);
    goto LABEL_6;
  }

  double v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVGoneDarkCell reuseIdentifier](&OBJC_CLASS___MTTVGoneDarkCell, "reuseIdentifier"));
  unsigned int v9 = [v4 isEqualToString:v8];

  if (v9)
  {
    id v7 = &OBJC_CLASS___MTTVGoneDarkCell;
    goto LABEL_5;
  }

  if ([v4 isEqualToString:@"EmptySectionCell"])
  {
    v13.receiver = self;
    v13.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
    objc_super v10 = -[MTPodcastSectionedDetailListController newCellInstanceWithReuseIdentifier:]( &v13,  "newCellInstanceWithReuseIdentifier:",  v4);
  }

  else
  {
    objc_super v10 = -[MTTVEpisodeCell initWithStyle:reuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTTVEpisodeCell),  "initWithStyle:reuseIdentifier:",  0LL,  v4);
  }

- (void)configureCell:(id)a3 withObject:(id)a4 atIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 conformsToProtocol:&OBJC_PROTOCOL___MTEpisodeCellProtocol])
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
    -[MTPodcastSectionedDetailListController configureCell:withObject:atIndexPath:]( &v17,  "configureCell:withObject:atIndexPath:",  v8,  v9,  v10);
  }

  else
  {
    uint64_t v11 = objc_opt_class(&OBJC_CLASS___MTTVGoneDarkCell);
    if ((objc_opt_isKindOfClass(v8, v11) & 1) == 0)
    {
      uint64_t v12 = objc_opt_class(&OBJC_CLASS___MTTVSettingsTableViewCell);
      if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
      {
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
        id v14 = (id)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"Podcast Settings" value:&stru_100248948 table:0]);
        double v15 = (void *)objc_claimAutoreleasedReturnValue([v8 textLabel]);
        [v15 setText:v14];
      }

      else
      {
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___MTTVNoContentTableViewCell);
        if ((objc_opt_isKindOfClass(v8, v16) & 1) == 0) {
          goto LABEL_9;
        }
        id v14 = v8;
        objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController messageForEmptySection](self, "messageForEmptySection"));
        [v14 setMessage:v13];
      }
    }
  }

- (id)rightButtonItems
{
  return 0LL;
}

- (void)selectedItemAtIndexPath:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
  [v4 deselectRowAtIndexPath:v5 animated:0];

  if (-[MTTVPodcastEpisodeListViewController _isIndexPathForSettings:](self, "_isIndexPathForSettings:", v5))
  {
    -[MTTVPodcastEpisodeListViewController _showSettings](self, "_showSettings");
  }

  else if (-[MTTVPodcastEpisodeListViewController _isIndexPathForDarkPlacard:](self, "_isIndexPathForDarkPlacard:", v5))
  {
    -[MTTVPodcastEpisodeListViewController _resetGoDark](self, "_resetGoDark");
  }

  else
  {
    -[MTPodcastSectionedDetailListController playEpisodeAtIndexPath:](self, "playEpisodeAtIndexPath:", v5);
  }
}

- (void)switchToTab:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  -[MTPodcastSectionedDetailListController switchToTab:](&v4, "switchToTab:", a3);
  -[MTTVEpisodeListViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", 0LL);
}

- (void)reloadData
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  -[MTPodcastSectionedDetailListController reloadData](&v6, "reloadData");
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcastHeaderView](self, "podcastHeaderView"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcast](self, "podcast"));
  [v3 setPodcast:v4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController view](self, "view"));
  [v5 setNeedsLayout];
}

- (BOOL)hasEmptySection
{
  if ((id)-[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab") == (id)1) {
    unsigned __int8 v3 = -[MTPodcastSectionedDetailListController hasEpisodesInTheFeed](self, "hasEpisodesInTheFeed");
  }
  else {
    unsigned __int8 v3 = -[MTPodcastSectionedDetailListController hasUnplayedEpisodes](self, "hasUnplayedEpisodes");
  }
  return v3 ^ 1;
}

- (id)createEmptySectionCell
{
  unsigned __int8 v3 = -[MTTVNoContentTableViewCell initWithReuseIdentifier:]( objc_alloc(&OBJC_CLASS___MTTVNoContentTableViewCell),  "initWithReuseIdentifier:",  @"EmptySectionCell");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController messageForEmptySection](self, "messageForEmptySection"));
  -[MTTVNoContentTableViewCell setMessage:](v3, "setMessage:", v4);

  return v3;
}

- (id)messageForEmptySection
{
  unint64_t v2 = -[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab");
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  objc_super v4 = v3;
  if (v2 == 1) {
    id v5 = @"NO_FEED_EPISODES_TITLE";
  }
  else {
    id v5 = @"NO_UNPLAYED_EPISODES_TITLE";
  }
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v3 localizedStringForKey:v5 value:&stru_100248948 table:0]);

  return v6;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  objc_super v4 = (__CFString *)objc_claimAutoreleasedReturnValue( -[MTTVPodcastEpisodeListViewController reuseIdentifierForRow:]( self,  "reuseIdentifierForRow:",  a4));
  BOOL v5 = v4 != @"EmptySectionCell";

  return v5;
}

- (id)indexPathForPreferredFocusedViewInTableView:(id)a3
{
  if (-[MTPodcastSectionedDetailListController selectedTab](self, "selectedTab", a3)
    || !-[MTTVPodcastEpisodeListViewController hasEmptySection](self, "hasEmptySection"))
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    objc_super v4 = v7;
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 indexPathForClosestFocusableRowToIndexPath:v8]);

LABEL_9:
      return v9;
    }

    uint64_t v5 = objc_claimAutoreleasedReturnValue([v7 indexPathForFirstFocusableRow]);
LABEL_8:
    id v9 = (void *)v5;
    goto LABEL_9;
  }

  if (-[MTPodcastSectionedDetailListController hasEpisodesToBeDeleted](self, "hasEpisodesToBeDeleted"))
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController sectionForType:](self, "sectionForType:", 4LL));
    uint64_t v5 = objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  -[MTPodcastSectionedDetailListController indexForSection:](self, "indexForSection:", v4)));
    goto LABEL_8;
  }

  if (-[MTTVPodcastEpisodeListViewController hasDarkPlacard](self, "hasDarkPlacard")
    && -[MTPodcastSectionedDetailListController sectionIndexForType:](self, "sectionIndexForType:", 10LL) != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v14 = -[MTPodcastSectionedDetailListController sectionIndexForType:](self, "sectionIndexForType:", 10LL);
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](self, "dataSource"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 sections]);
    id v13 = [v12 count];

    unint64_t v14 = (unint64_t)v13;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSIndexPath indexPathForRow:inSection:]( &OBJC_CLASS___NSIndexPath,  "indexPathForRow:inSection:",  0LL,  v14));
  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController reuseIdentifierForRow:](self, "reuseIdentifierForRow:", a4));
  if ([@"EmptySectionCell" isEqualToString:v5])
  {
    +[MTTVNoContentTableViewCell heightForStyle:]( &OBJC_CLASS___MTTVNoContentTableViewCell,  "heightForStyle:",  -[MTPodcastSectionedDetailListController hasEpisodesToBeDeleted](self, "hasEpisodesToBeDeleted"));
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTTVGoneDarkCell reuseIdentifier](&OBJC_CLASS___MTTVGoneDarkCell, "reuseIdentifier"));
    unsigned int v8 = [v5 isEqualToString:v7];

    if (v8) {
      id v9 = &OBJC_CLASS___MTTVGoneDarkCell;
    }
    else {
      id v9 = &OBJC_CLASS___MTTVEpisodeCell;
    }
    -[__objc2_class height](v9, "height");
  }

  double v10 = v6;

  return v10;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  id v11 = a4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___UITableViewHeaderFooterView);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController traitCollection](self, "traitCollection"));
    if ([v7 userInterfaceStyle] == (id)2) {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](&OBJC_CLASS___UIColor, "whiteColor"));
    }
    else {
      uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](&OBJC_CLASS___UIColor, "blackColor"));
    }
    id v9 = (void *)v8;
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v11 textLabel]);
    [v10 setTextColor:v9];
  }
}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);
  if (v11)
  {

LABEL_3:
    -[MTTVPodcastEpisodeListViewController setSelectedIndexPath:](self, "setSelectedIndexPath:", 0LL);
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
    -[MTTVEpisodeListViewController tableView:didUpdateFocusInContext:withAnimationCoordinator:]( &v20,  "tableView:didUpdateFocusInContext:withAnimationCoordinator:",  v8,  v9,  v10);
    goto LABEL_4;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v9 previouslyFocusedIndexPath]);

  if (!v13) {
    goto LABEL_3;
  }
  unint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedView]);
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___TVMTExpandingTextView);
  char isKindOfClass = objc_opt_isKindOfClass(v14, v15);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_3;
  }
  objc_super v17 = (void *)objc_claimAutoreleasedReturnValue([v9 previouslyFocusedIndexPath]);
  if (!v17) {
    goto LABEL_3;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_1000D5A2C;
  v21[3] = &unk_100240240;
  v21[4] = self;
  id v22 = v17;
  id v18 = v17;
  [v10 addCoordinatedAnimations:v21 completion:0];

LABEL_4:
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v9 nextFocusedIndexPath]);
  if (v12)
  {
    -[MTTVEpisodeListViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v12);
  }

  else
  {
    double v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVEpisodeListViewController lastFocusedIndexPath](self, "lastFocusedIndexPath"));
    -[MTTVEpisodeListViewController setLastFocusedIndexPath:](self, "setLastFocusedIndexPath:", v19);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if ("tableView:viewForHeaderInSection:" == a3 || "tableView:heightForHeaderInSection:" == a3) {
    return 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  return -[MTTVEpisodeListViewController respondsToSelector:](&v5, "respondsToSelector:");
}

- (void)setSelectedIndexPath:(id)a3
{
  id v10 = a3;
  p_selectedIndexPath = &self->_selectedIndexPath;
  if (self->_selectedIndexPath)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 cellForRowAtIndexPath:*p_selectedIndexPath]);

    [v7 setSelected:0];
  }

  objc_storeStrong((id *)&self->_selectedIndexPath, a3);
  if (*p_selectedIndexPath)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cellForRowAtIndexPath:*p_selectedIndexPath]);

    [v9 setSelected:1];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  return -[MTPodcastSectionedDetailListController numberOfSectionsInTableView:](&v4, "numberOfSectionsInTableView:", a3)
       + 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (-[MTTVPodcastEpisodeListViewController _isSectionForSettings:](self, "_isSectionForSettings:", a4))
  {
    int64_t v7 = 1LL;
  }

  else if (-[MTTVPodcastEpisodeListViewController _isSectionForDarkPlacard:](self, "_isSectionForDarkPlacard:", a4))
  {
    int64_t v7 = -[MTTVPodcastEpisodeListViewController hasDarkPlacard](self, "hasDarkPlacard");
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
    int64_t v7 = -[MTPodcastSectionedDetailListController tableView:numberOfRowsInSection:]( &v9,  "tableView:numberOfRowsInSection:",  v6,  a4);
  }

  return v7;
}

- (BOOL)_isIndexPathForDarkPlacard:(id)a3
{
  if (a3) {
    return -[MTTVPodcastEpisodeListViewController _isSectionForDarkPlacard:]( self,  "_isSectionForDarkPlacard:",  [a3 section]);
  }
  else {
    return 0;
  }
}

- (BOOL)_isSectionForDarkPlacard:(int64_t)a3
{
  return (id)-[MTPodcastSectionedDetailListController sectionTypeForIndex:](self, "sectionTypeForIndex:", a3) == (id)10;
}

- (BOOL)_isIndexPathForSettings:(id)a3
{
  return -[MTTVPodcastEpisodeListViewController _isSectionForSettings:]( self,  "_isSectionForSettings:",  [a3 section]);
}

- (BOOL)_isSectionForSettings:(int64_t)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController dataSource](self, "dataSource"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sections]);
  LOBYTE(a3) = (unint64_t)[v5 count] <= a3;

  return a3;
}

- (void)_showSettings
{
  unsigned __int8 v3 = objc_alloc(&OBJC_CLASS___MTTVPodcastSettingsSplitViewController);
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcast](self, "podcast"));
  int64_t v7 = -[MTTVPodcastSettingsSplitViewController initWithPodcast:delegate:](v3, "initWithPodcast:delegate:", v4, self);

  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication_ATV appController](&OBJC_CLASS___MTApplication_ATV, "appController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 rootNavController]);

  [v6 pushViewController:v7 animated:1];
}

- (void)_resetGoDark
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000D5E94;
  v7[3] = &unk_100240240;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcast](self, "podcast"));
  id v9 = (id)objc_claimAutoreleasedReturnValue([v8 managedObjectContext]);
  id v3 = v9;
  id v6 = v8;
  [v3 performBlockAndWait:v7];
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](&OBJC_CLASS___MTFeedUpdateManager, "sharedInstance"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController podcastUUID](self, "podcastUUID"));
  [v4 updatePodcastWithUUID:v5 userInitiated:1 source:20 completion:0];
}

- (void)_refreshFeedIfNeeded
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](&OBJC_CLASS___MTDB, "sharedInstance"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainQueueContext]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController podcastUUID](self, "podcastUUID"));
  id v10 = (id)objc_claimAutoreleasedReturnValue([v4 podcastForUuid:v5]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v10 valueForKey:kPodcastUpdatedDate]);
  [v6 timeIntervalSinceNow];
  if (fabs(v7) >= 1800.0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateManager sharedInstance](&OBJC_CLASS___MTFeedUpdateManager, "sharedInstance"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController podcastUUID](self, "podcastUUID"));
    [v8 updatePodcastWithUUID:v9 userInitiated:0 forced:1 forceBootstrap:0 source:8 completion:0];
  }
}

- (MTAllPropertyChangesQueryObserver)darkObserver
{
  darkObserver = self->_darkObserver;
  if (!darkObserver)
  {
    objc_initWeak(&location, self);
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcastSectionedDetailListController podcastUUID](self, "podcastUUID"));
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUUID:](&OBJC_CLASS___MTPodcast, "predicateForPodcastUUID:", v4));

    id v6 = objc_alloc(&OBJC_CLASS___MTAllPropertyChangesQueryObserver);
    double v7 = -[MTAllPropertyChangesQueryObserver initWithEntityName:predicate:]( v6,  "initWithEntityName:predicate:",  kMTPodcastEntityName,  v5);
    id v8 = self->_darkObserver;
    self->_darkObserver = v7;

    id v9 = self->_darkObserver;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1000D6120;
    v12[3] = &unk_100240440;
    objc_copyWeak(&v13, &location);
    id v10 = -[MTAllPropertyChangesQueryObserver addResultsChangedHandler:](v9, "addResultsChangedHandler:", v12);
    objc_destroyWeak(&v13);

    objc_destroyWeak(&location);
    darkObserver = self->_darkObserver;
  }

  return darkObserver;
}

- (BOOL)hasDarkPlacard
{
  unint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController podcast](self, "podcast"));
  unsigned __int8 v3 = [v2 isAuthenticatedDark];

  return v3;
}

- (void)updateDarkPlacard
{
  unint64_t v3 = -[MTPodcastSectionedDetailListController sectionIndexForType:](self, "sectionIndexForType:", 10LL);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = v3;
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
    BOOL v6 = (uint64_t)[v5 numberOfRowsInSection:v4] < 1;

    if (((v6 ^ -[MTTVPodcastEpisodeListViewController hasDarkPlacard](self, "hasDarkPlacard")) & 1) == 0)
    {
      id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](&OBJC_CLASS___NSIndexSet, "indexSetWithIndex:", v4));
      double v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController tableView](self, "tableView"));
      [v7 reloadSections:v8 withRowAnimation:100];
    }
  }

- (void)dealloc
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTTVPodcastEpisodeListViewController darkObserver](self, "darkObserver"));
  [v3 stop];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MTTVPodcastEpisodeListViewController;
  -[MTTVEpisodeListViewController dealloc](&v4, "dealloc");
}

- (id)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (MTPodcast)podcast
{
  return self->_podcast;
}

- (MTTVPodcastHeaderView)podcastHeaderView
{
  return self->_podcastHeaderView;
}

- (void)setPodcastHeaderView:(id)a3
{
}

- (UITapGestureRecognizer)playButtonRecognizer
{
  return self->_playButtonRecognizer;
}

- (void)setPlayButtonRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)playButtonRecognizerForHeader
{
  return self->_playButtonRecognizerForHeader;
}

- (void)setPlayButtonRecognizerForHeader:(id)a3
{
}

- (UILongPressGestureRecognizer)longPressRecognizer
{
  return self->_longPressRecognizer;
}

- (void)setLongPressRecognizer:(id)a3
{
}

- (void)setDarkObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end