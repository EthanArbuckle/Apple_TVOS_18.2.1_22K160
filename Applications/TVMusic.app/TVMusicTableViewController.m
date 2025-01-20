@interface TVMusicTableViewController
- (MPLazySectionedCollectionDataSource)sectionedCollectionDataSource;
- (MPModelLibraryRequest)libraryRequest;
- (MPSectionedCollection)mpResults;
- (TVInteractionGestureRecognizer)playPauseRecognizer;
- (TVMusicTableViewController)init;
- (TVMusicTableViewController)initWithLibraryRequest:(id)a3;
- (UILabel)tableHeaderLabel;
- (UIView)tableHeaderView;
- (double)headingVerticalOffset;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_playbackViewController;
- (id)_previewViewControllerForIndexPath:(id)a3;
- (id)_tableHeaderLabel;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)sectionIndexTitlesForTableView:(id)a3;
- (id)tableHeaderTitle;
- (id)tableHeaderTitleAttributedText;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5;
- (void)_configureTableHeaderView;
- (void)_handlePlayPauseButton;
- (void)_modelResponseDidInvalidate:(id)a3;
- (void)_performRequest;
- (void)_processResponse:(id)a3 error:(id)a4;
- (void)_startMusicPlayback;
- (void)setHeadingVerticalOffset:(double)a3;
- (void)setLibraryRequest:(id)a3;
- (void)setMpResults:(id)a3;
- (void)setPlayPauseRecognizer:(id)a3;
- (void)setSectionedCollectionDataSource:(id)a3;
- (void)setTableHeaderLabel:(id)a3;
- (void)setTableHeaderTitle:(id)a3;
- (void)setTableHeaderTitleAttributedText:(id)a3;
- (void)setTableHeaderView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation TVMusicTableViewController

- (TVMusicTableViewController)initWithLibraryRequest:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TVMusicTableViewController;
  v6 = -[TVPreviewTableViewController initWithStyle:](&v12, "initWithStyle:", 0LL);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryRequest, a3);
    -[TVPreviewTableViewController setTableViewWidth:](v7, "setTableViewWidth:", 825.0);
    -[TVPreviewTableViewController tableViewPadding](v7, "tableViewPadding");
    -[TVPreviewTableViewController setTableViewPadding:](v7, "setTableViewPadding:", 190.0);
    objc_initWeak(&location, v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000BBCD8;
    v9[3] = &unk_10026DC38;
    objc_copyWeak(&v10, &location);
    -[TVPreviewTableViewController setAutoUpdatePreviewViewControllerBlock:]( v7,  "setAutoUpdatePreviewViewControllerBlock:",  v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (TVMusicTableViewController)init
{
  return -[TVMusicTableViewController initWithLibraryRequest:](self, "initWithLibraryRequest:", 0LL);
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVMusicTableViewController;
  -[TVMusicTableViewController viewDidLoad](&v9, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  objc_msgSend( v3,  "registerClass:forCellReuseIdentifier:",  objc_opt_class(TVMusicTableViewCell, v4),  @"TVMusicTableViewCellIdentifier");

  id v5 = -[TVInteractionGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___TVInteractionGestureRecognizer),  "initWithTarget:action:",  self,  "_handlePlayPauseButton");
  playPauseRecognizer = self->_playPauseRecognizer;
  self->_playPauseRecognizer = v5;

  -[TVInteractionGestureRecognizer setAllowedPressTypes:]( self->_playPauseRecognizer,  "setAllowedPressTypes:",  &off_1002822B8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v7 addGestureRecognizer:self->_playPauseRecognizer];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController libraryRequest](self, "libraryRequest"));
  if (v8) {
    -[TVMusicTableViewController _performRequest](self, "_performRequest");
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicTableViewController;
  -[TVMusicTableViewController viewWillDisappear:](&v4, "viewWillDisappear:", a3);
  self->_visibleOnScreen = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVMusicTableViewController;
  -[TVMusicTableViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (self->_shouldUpdateOnViewDidAppear)
  {
    -[TVMusicTableViewController _performRequest](self, "_performRequest");
    self->_shouldUpdateOnViewDidAppear = 0;
  }

  self->_visibleOnScreen = 1;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVMusicTableViewController;
  -[TVPreviewTableViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  if (self->_tableHeaderLabel) {
    -[TVMusicTableViewController _configureTableHeaderView](self, "_configureTableHeaderView");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  if (self->_tableHeaderLabel)
  {
    id v10 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController traitCollection](self, "traitCollection"));
    id v6 = [v5 userInterfaceStyle];
    id v7 = [v10 userInterfaceStyle];

    id v4 = v10;
    if (v6 != v7)
    {
      tableHeaderLabel = self->_tableHeaderLabel;
      objc_super v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
      -[UILabel setTextColor:](tableHeaderLabel, "setTextColor:", v9);

      id v4 = v10;
    }
  }
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVMusicTableViewController;
  id v3 = -[TVMusicTableViewController contentScrollViewForEdge:](&v5, "contentScrollViewForEdge:", a3);
  return (id)objc_claimAutoreleasedReturnValue(v3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController mpResults](self, "mpResults", a3));
  id v4 = [v3 numberOfSections];

  return (int64_t)v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController mpResults](self, "mpResults", a3));
  id v6 = [v5 numberOfItemsInSection:a4];

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return [a3 dequeueReusableCellWithIdentifier:@"TVMusicTableViewCellIdentifier" forIndexPath:a4];
}

- (id)sectionIndexTitlesForTableView:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController sectionedCollectionDataSource](self, "sectionedCollectionDataSource", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 sectionIndexTitles]);

  return v4;
}

- (int64_t)tableView:(id)a3 sectionForSectionIndexTitle:(id)a4 atIndex:(int64_t)a5
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue( -[TVMusicTableViewController sectionedCollectionDataSource]( self,  "sectionedCollectionDataSource",  a3,  a4));

  if (!v7) {
    return 0LL;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController sectionedCollectionDataSource](self, "sectionedCollectionDataSource"));
  uint64_t v9 = (uint64_t)[v8 indexOfSectionForSectionIndexTitleAtIndex:a5];

  int64_t v10 = v9 & ~(v9 >> 63);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController mpResults](self, "mpResults"));
  objc_super v12 = (char *)[v11 numberOfSections] - 1;

  else {
    return v10;
  }
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 90.0;
}

- (void)_handlePlayPauseButton
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVMusicPlayerManager sharedInstance](&OBJC_CLASS___TVMusicPlayerManager, "sharedInstance"));
  id v6 = (id)objc_claimAutoreleasedReturnValue([v3 player]);

  if (v6
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue([v6 state]),
        objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVPPlaybackState playing](&OBJC_CLASS___TVPPlaybackState, "playing")),
        v5,
        v4,
        v4 == v5))
  {
    [v6 togglePlayPause];
  }

  else
  {
    -[TVMusicTableViewController _startMusicPlayback](self, "_startMusicPlayback");
  }
}

- (void)_performRequest
{
  libraryRequest = self->_libraryRequest;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000BC2C8;
  v4[3] = &unk_10026CAA0;
  objc_copyWeak(&v5, &location);
  -[MPModelLibraryRequest performWithResponseHandler:](libraryRequest, "performWithResponseHandler:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_processResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (!a4)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_1000BC3BC;
    v8[3] = &unk_100268B30;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(&_dispatch_main_q, v8);
  }
}

- (void)_startMusicPlayback
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _playbackViewController](self, "_playbackViewController"));
  if (v4)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController navigationController](self, "navigationController"));
    [v3 pushViewController:v4 animated:1];
  }
}

- (void)setTableHeaderTitle:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _tableHeaderLabel](self, "_tableHeaderLabel"));
  [v5 setText:v4];
}

- (id)tableHeaderTitle
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _tableHeaderLabel](self, "_tableHeaderLabel"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 text]);

  return v3;
}

- (void)setTableHeaderTitleAttributedText:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _tableHeaderLabel](self, "_tableHeaderLabel"));
  [v5 setAttributedText:v4];

  -[UILabel sizeToFit](self->_tableHeaderLabel, "sizeToFit");
}

- (id)tableHeaderTitleAttributedText
{
  if (self->_tableHeaderLabel)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _tableHeaderLabel](self, "_tableHeaderLabel"));
    id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 attributedText]);
  }

  else
  {
    id v3 = 0LL;
  }

  return v3;
}

- (id)_tableHeaderLabel
{
  tableHeaderLabel = self->_tableHeaderLabel;
  if (!tableHeaderLabel)
  {
    id v4 = objc_alloc_init(&OBJC_CLASS___UILabel);
    id v5 = self->_tableHeaderLabel;
    self->_tableHeaderLabel = v4;

    id v6 = self->_tableHeaderLabel;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager title2Font](&OBJC_CLASS___TVThemeManager, "title2Font"));
    -[UILabel setFont:](v6, "setFont:", v7);

    v8 = self->_tableHeaderLabel;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[TVThemeManager listTitleTextColor](&OBJC_CLASS___TVThemeManager, "listTitleTextColor"));
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setOpaque:](self->_tableHeaderLabel, "setOpaque:", 0LL);
    -[UILabel setBackgroundColor:](self->_tableHeaderLabel, "setBackgroundColor:", 0LL);
    -[UILabel setTextAlignment:](self->_tableHeaderLabel, "setTextAlignment:", 0LL);
    -[UILabel setMinimumScaleFactor:](self->_tableHeaderLabel, "setMinimumScaleFactor:", 0.7);
    -[UILabel setAdjustsFontSizeToFitWidth:](self->_tableHeaderLabel, "setAdjustsFontSizeToFitWidth:", 1LL);
    -[UILabel setLineBreakMode:](self->_tableHeaderLabel, "setLineBreakMode:", 2LL);
    -[UILabel setTextAlignment:](self->_tableHeaderLabel, "setTextAlignment:", 1LL);
    tableHeaderLabel = self->_tableHeaderLabel;
  }

  return tableHeaderLabel;
}

- (void)_configureTableHeaderView
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVPreviewTableViewController tableView](self, "tableView"));
  [v3 frame];
  double v5 = v4;
  double v7 = v6;

  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    id v9 = objc_alloc_init(&OBJC_CLASS___UIView);
    int64_t v10 = self->_tableHeaderView;
    self->_tableHeaderView = v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController view](self, "view"));
    [v11 addSubview:self->_tableHeaderView];

    objc_super v12 = self->_tableHeaderView;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _tableHeaderLabel](self, "_tableHeaderLabel"));
    -[UIView addSubview:](v12, "addSubview:", v13);

    tableHeaderView = self->_tableHeaderView;
  }

  -[UIView setFrame:](tableHeaderView, "setFrame:", v5, 0.0, v7, 190.0);
  -[UILabel frame](self->_tableHeaderLabel, "frame");
  if (v14 == 0.0) {
    double v15 = 64.0;
  }
  else {
    double v15 = v14;
  }
  id v17 = (id)objc_claimAutoreleasedReturnValue(-[TVMusicTableViewController _tableHeaderLabel](self, "_tableHeaderLabel"));
  -[TVMusicTableViewController headingVerticalOffset](self, "headingVerticalOffset");
  objc_msgSend(v17, "setFrame:", 0.0, v16 + 76.0, v7, v15);
}

- (void)_modelResponseDidInvalidate:(id)a3
{
  id v5 = (id)objc_claimAutoreleasedReturnValue([a3 object]);
  if ([v5 isEqual:self->_lastReceivedResponse])
  {
    double v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 removeObserver:self name:MPModelResponseDidInvalidateNotification object:0];

    if (self->_visibleOnScreen) {
      -[TVMusicTableViewController _performRequest](self, "_performRequest");
    }
    else {
      self->_shouldUpdateOnViewDidAppear = 1;
    }
  }
}

- (id)_previewViewControllerForIndexPath:(id)a3
{
  return 0LL;
}

- (id)_playbackViewController
{
  return 0LL;
}

- (double)headingVerticalOffset
{
  return self->_headingVerticalOffset;
}

- (void)setHeadingVerticalOffset:(double)a3
{
  self->_headingVerticalOffset = a3;
}

- (UILabel)tableHeaderLabel
{
  return self->_tableHeaderLabel;
}

- (void)setTableHeaderLabel:(id)a3
{
}

- (TVInteractionGestureRecognizer)playPauseRecognizer
{
  return self->_playPauseRecognizer;
}

- (void)setPlayPauseRecognizer:(id)a3
{
}

- (UIView)tableHeaderView
{
  return self->_tableHeaderView;
}

- (void)setTableHeaderView:(id)a3
{
}

- (MPModelLibraryRequest)libraryRequest
{
  return self->_libraryRequest;
}

- (void)setLibraryRequest:(id)a3
{
}

- (MPSectionedCollection)mpResults
{
  return self->_mpResults;
}

- (void)setMpResults:(id)a3
{
}

- (MPLazySectionedCollectionDataSource)sectionedCollectionDataSource
{
  return self->_sectionedCollectionDataSource;
}

- (void)setSectionedCollectionDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end